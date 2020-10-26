local sohighPlates = CreateFrame('Frame', 'sohighPlatesFrame', UIParent)
_G['sohighPlates'] = sohighPlates

sohighPlates.updateFrequency = 2
sohighPlates.nextUpdate = sohighPlates.updateFrequency
sohighPlates.updateNow = false
sohighPlates.nameplates = {}

sohighPlates:SetScript('OnEvent', function(self, e) if(sohighPlates[e]) then sohighPlates[e]() end end)
sohighPlates:SetScript('OnUpdate', function(self, elapsed)
	local updateNow = false
	local i, frame
	
	for i = 1, select('#', WorldFrame:GetChildren()) do
		frame = select(i, WorldFrame:GetChildren())

		if(self:IsValidFrame(frame) and not frame.initialized) then
			self:InitializeFrame(frame)
		end
	end
	
	sohighPlates.updateNow = (self.nextUpdate <= 0)
	sohighPlates.nextUpdate = sohighPlates.updateNow and sohighPlates.updateFrequency or self.nextUpdate-arg1
end)

function sohighPlates:IsValidFrame(frame)
	if frame:GetName() then
		return false
	end

	local overlayRegion = select(2, frame:GetRegions())
	return (overlayRegion and overlayRegion:GetObjectType() == 'Texture' and overlayRegion:GetTexture() == 'Interface\\Tooltips\\Nameplate-Border')
end

function sohighPlates:InitializeFrame(frame)
	local healthBar, castBar = frame:GetChildren()
	local overlayRegion, castbarOverlay, spellIconRegion, highlightRegion, nameTextRegion, levelTextRegion, bossIconRegion, raidIconRegion = frame:GetRegions()
	
	frame.container = CreateFrame('Frame', nil, frame)
	frame.container:SetPoint('TOPLEFT', 5, -5)
	frame.container:SetPoint('BOTTOMRIGHT', -5, 5)
	
	frame.healthOriginal = healthBar
	frame.healthOriginal:Hide()
	
	frame.health = CreateFrame('StatusBar', nil, frame.container)
	frame.health:SetAllPoints(frame.container)
	
	frame.health.percent = frame.health:CreateFontString(nil, 'OVERLAY')
	frame.health.percent:SetFont(__sNpCore.art.font.cstm.a[1], (__sNpConfig.fontSize+4))
	frame.health.percent:SetPoint('RIGHT', -5, 0)
	frame.health.percent:SetTextColor(1, 1, 1)
	frame.health.percent:SetJustifyH('RIGHT')
	frame.health.percent:SetShadowOffset(1.5, -1.5)

	frame.border = frame.health:CreateTexture(nil, 'BORDER')
	frame.border:SetAllPoints(frame.health)

	frame.background = frame.health:CreateTexture(nil, 'BACKGROUND')
	frame.background:SetAllPoints(frame.health)
	
	frame.threat = frame.health:CreateTexture(nil, 'BACKGROUND')
	frame.threat:SetPoint('TOPLEFT', frame.background, 'TOPLEFT', -12, 12)
	frame.threat:SetPoint('BOTTOMRIGHT', frame.background, 'BOTTOMRIGHT', 12, -12)
	
	frame.tglow = frame.health:CreateTexture(nil, 'BORDER')
	
	local nilTexture = ''
	overlayRegion:SetTexture(nilTexture)
	highlightRegion:SetTexture(nilTexture)
	bossIconRegion:SetTexture(nilTexture)
	castbarOverlay:SetTexture(nilTexture)
	
	frame.level = levelTextRegion
	frame.level:SetParent(frame.health)
	frame.level:ClearAllPoints()
	frame.level:SetJustifyH('LEFT')
	frame.level:SetFont(__sNpCore.art.font.cstm.a[1], (__sNpConfig.fontSize+4))
	frame.level:SetShadowOffset(2, -2)
	
	nameTextRegion:Hide()
	--nameTextRegion:SetFont(__sNpCore.art.font.cstm.a[1], (__sNpConfig.fontSize+4))
	frame.oldname = nameTextRegion
	
	frame.name = newNameRegion
	frame.name = frame:CreateFontString()
	frame.name:SetParent(frame.health)
	frame.name:SetPoint('BOTTOM', frame.health, 'TOP', __sNpConfig.nameXpos, __sNpConfig.nameYpos)
	frame.name:SetFont(__sNpCore.art.font.cstm.a[1], (__sNpConfig.fontSize+4))
	frame.name:SetTextColor(unpack(__sNpCore.status.name))
	frame.name:SetShadowOffset(2, -2)
	
	frame.icons = CreateFrame('Frame', nil, frame)
	frame.icons:SetAllPoints(frame)
	frame.icons:SetFrameStrata('MEDIUM')
	
	frame.bossIcon = bossIconRegion
	
	frame.raidIcon = raidIconRegion
	frame.raidIcon:SetParent(frame.icons)
	frame.raidIcon:ClearAllPoints()
	frame.raidIcon:SetPoint('CENTER', frame.health, 'TOP', 0, 0)
	frame.raidIcon:SetTexture(__sNpCore.art.classicon.raid[1])
	frame.raidIcon:SetWidth(16)
	frame.raidIcon:SetHeight(16)
	
	frame.castbarContainer = CreateFrame('Frame', nil, frame)
	frame.castbarContainer:SetPoint('TOPLEFT', frame.container, 'BOTTOMLEFT', 0, 5)
	frame.castbarContainer:SetPoint('TOPRIGHT', frame.container, 'BOTTOMRIGHT', 0, 0)
	
	frame.castbar = castBar
	frame.castbar:SetAllPoints(frame.castbarContainer)
	
	frame.castbar.cborder = frame.castbar:CreateTexture(nil, 'BORDER')
	frame.castbar.cborder:SetPoint('TOPLEFT', frame.castbar, 'TOPLEFT', -2.6, 2.6)
	frame.castbar.cborder:SetPoint('BOTTOMRIGHT', frame.castbar, 'BOTTOMRIGHT', 2.6, -2.6)
	frame.castbar.cborder:SetTexture(unpack(__sNpCore.art.textures.bar.border))
	frame.castbar.cborder:SetVertexColor(0, 0, 0)

	frame.castbar.cbackground = frame.castbar:CreateTexture(nil, 'BORDER')
	frame.castbar.cbackground:SetAllPoints(frame.castbar)
	frame.castbar.cbackground:SetTexture(unpack(__sNpCore.art.textures.bar.bg))
	
	frame.castbar.icon = spellIconRegion
	frame.castbar.icon:ClearAllPoints()
	frame.castbar.icon:SetParent(frame.castbarContainer)
	frame.castbar.icon:SetTexCoord(.08, .92, .08, .92)

	frame.castbar.spellglow = CreateFrame('frame', nil, castBar)
	frame.castbar.spellglow:SetPoint('TOPLEFT', frame.castbar.icon, 'TOPLEFT', -3, 3)
	frame.castbar.spellglow:SetPoint('BOTTOMRIGHT', frame.castbar.icon, 'BOTTOMRIGHT', 3, -3)
	frame.castbar.spellglow:SetBackdrop(__sNpCore.art.backdrop.spell)
	
	frame.castbar.time = frame.castbar:CreateFontString(nil, 'ARTWORK')
	frame.castbar.time:SetFont(__sNpCore.art.font.default[1], (__sNpConfig.fontSize+4))
	frame.castbar.time:SetTextColor(1, 1, 1)
	frame.castbar.time:SetShadowOffset(2, -2)
	
	frame.castbar.name = frame.castbar:CreateFontString(nil, 'ARTWORK')
	frame.castbar.name:SetFont(__sNpCore.art.font.default[1], (__sNpConfig.fontSize+4))
	frame.castbar.name:SetTextColor(1, 1, 1)
	frame.castbar.name:SetShadowOffset(2, -2)
	
	frame.classIcon = frame:CreateTexture(nil, 'OVERLAY')

	frame.castbar:HookScript('OnSizeChanged', __sNpCore.OnFrameSize)
	frame.castbar:SetScript('OnValueChanged', __sNpCore.OnFrameValue)
	
	if frame:GetScript('OnShow') then
		frame:HookScript('OnShow', sohighPlates.OnFrameShow)
	else
		frame:SetScript('OnShow', sohighPlates.OnFrameShow)
	end
	
	frame.initialized = true
	table.insert(sohighPlates.nameplates, frame)
	
	frame.update = 0
	frame.elapsed = 0
	frame.elapsedLong = 0
	frame:SetScript('OnUpdate', function(_, elapsed)
		frame.update = frame.update + elapsed
		if frame.update >= .2 then
			__sNpCore:ConfigSetValue(frame)
			sohighPlates:UpdateFrame(frame)
		end
	end)
end

function sohighPlates:OnFrameShow(...)
	sohighPlates:UpdateFrame(self)
end
function sohighPlates:OnFrameUpdate(...)
	__sNpCore.FixCast(self)
end

function sohighPlates:UpdateFrame(frame)
	if(frame.bossIcon:IsVisible()) then
		frame.level:Show()
		frame.level:SetText('B+')
	end
	
	local nameString = frame.oldname:GetText()
	if string.len(nameString) < 22 then
		frame.name:SetText(nameString)
	else
		frame.name:SetFormattedText(nameString:sub(0, 24)..' ..')
	end
	
	--if frame.name:IsShown() then
	local r, g, b = frame.oldname:GetTextColor()
	if g + b == 0 then
		frame.castbar.spellglow:SetBackdropBorderColor(unpack(__sNpCore.art.backdrop.spell.t))
		frame.threat:SetTexture(unpack(__sNpCore.art.textures.glow.threat))
		frame.threat:SetVertexColor(1, 0, 0)
	else
		frame.threat:SetTexture(nil)
		frame.castbar.spellglow:SetBackdropBorderColor(unpack(__sNpCore.art.backdrop.spell.c))
	end
	--end
	
	local min, max = frame.healthOriginal:GetMinMaxValues()
	local valueHealth = frame.healthOriginal:GetValue()
	local percent = math.ceil((valueHealth/max)*100)
	
	frame.health:SetMinMaxValues(min, max)
	frame.health:SetValue(valueHealth)
	frame.health.percent:SetText(string.format('%s — %d%%', __sNpCore:FormatNumber(valueHealth), percent))
	if (GetCVar('_sNpFNk') == '1') then
		frame.health.percent:SetText(string.format('%s', __sNpCore:FormatNumber(valueHealth)))
	end
	if (GetCVar('_sNpFNp') == '1') then
		frame.health.percent:SetText(string.format('%d%%', percent))
	end
	if (GetCVar('_sNpBorder') == '1') then
		if percent <= 70 then
			frame.background:SetTexture(unpack(__sNpCore.art.textures.overlay.middle))
		else
			frame.background:SetTexture(unpack(__sNpCore.art.textures.bar.bg))
		end
		if percent <= 21 then
			frame.border:SetPoint('TOPLEFT', frame.health, 'TOPLEFT', -4, 4)
			frame.border:SetPoint('BOTTOMRIGHT', frame.health, 'BOTTOMRIGHT', 4, -4)
			frame.border:SetTexture(unpack(__sNpCore.art.textures.overlay.spec))
			frame.border:SetVertexColor(.6, .3, .8, .8)
			frame.background:Hide()
		else
			frame.border:SetPoint('TOPLEFT', frame.health, 'TOPLEFT', -2.6, 2.6)
			frame.border:SetPoint('BOTTOMRIGHT', frame.health, 'BOTTOMRIGHT', 2.6, -2.6)
			frame.border:SetTexture(unpack(__sNpCore.art.textures.bar.border))
			frame.border:SetVertexColor(0, 0, 0, 1)
			frame.background:Show()
		end
	else
		frame.border:SetPoint('TOPLEFT', frame.health, 'TOPLEFT', -2.6, 2.6)
		frame.border:SetPoint('BOTTOMRIGHT', frame.health, 'BOTTOMRIGHT', 2.6, -2.6)
		frame.border:SetTexture(unpack(__sNpCore.art.textures.bar.border))
		frame.background:SetTexture(unpack(__sNpCore.art.textures.bar.bg))
		frame.border:SetVertexColor(0, 0, 0, 1)
	end
end