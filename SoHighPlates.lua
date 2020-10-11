--<*>-----------------------[*]-------------------<*>--
-- 		Credits: Caellian - CaelNamePlates !Tukz 	 --
--		 	 Modifed for 2.4.3 by Sohigh		 	 --
--<*>-----------------------[*]-------------------<*>--

local mediaFolder = 'Interface\\AddOns\\SoHighPlates\\media\\'
local addonName = 'SoHighPlates'

--	//	*	CONFIG	*	//	--
local SmoothTexture = mediaFolder..'Smoothv2'
local CleanTexture = mediaFolder..'CleanPlates'
local glowTexture = mediaFolder..'Outline'
local backdropTexture = mediaFolder..'2px_tooltip_border'
local classIcons = mediaFolder..'Classes-Black'
local classIconsFlat = mediaFolder..'Classes-Smooth'
local fontDefault = 'Fonts\\FRIZQT__.ttf'
local fontAngelsk = mediaFolder..'Angelsk.ttf'
local fontExpress = mediaFolder..'Express.ttf'
local fontOutline = 'OUTLINE'
local raidIconSize = 28

local backdrop = {
	edgeFile = backdropTexture, edgeSize = 16,
}

function Default_Options()
	RegisterCVar('snpClassColor', 1, true)
	RegisterCVar('snphideName', 0, false)
	RegisterCVar('snplevel', 1, true)
	RegisterCVar('snpSBtext', 1, true)
	RegisterCVar('snpFormatOnly', 0, false)
	RegisterCVar('snpPercentOnly', 0, false)
	RegisterCVar('snpClassIcon', 1, true)
	RegisterCVar('snpClassFlat', 0, false)
	RegisterCVar('snpTotemIcon', 1, true)
	
	if not snpCFG then
		snpCFG = { }
	end
	
	if not snpCFG.hpWidth	then	snpCFG.hpWidth = 135	end
	if not snpCFG.hpHeight	then	snpCFG.hpHeight = 17	end
	if not snpCFG.cbWidth	then	snpCFG.cbWidth = 135	end
	if not snpCFG.cbHeight	then	snpCFG.cbHeight = 13	end
	if not snpCFG.levelXpos	then	snpCFG.levelXpos = -20	end
	if not snpCFG.levelYpos	then	snpCFG.levelYpos = 2	end
	if not snpCFG.nameXpos	then	snpCFG.nameXpos = 0	end
	if not snpCFG.nameYpos	then	snpCFG.nameYpos = 4	end
	if not snpCFG.cbNameY	then	snpCFG.cbNameY = -3	end
	if not snpCFG.timeXpos	then	snpCFG.timeXpos = -2	end
	if not snpCFG.timeYpos	then	snpCFG.timeYpos = 0	end
	if not snpCFG.fontMedia	then	snpCFG.fontMedia = 0	end
	if not snpCFG.fontSize	then	snpCFG.fontSize = 14	end
	if not snpCFG.iconClassSize	then	snpCFG.iconClassSize = 32	end
	if not snpCFG.iconSpellSize	then	snpCFG.iconSpellSize = 36	end
	if not snpCFG.iconTotemSize	then	snpCFG.iconTotemSize = 46	end
	if not snpCFG.mediaSBtexture	then	snpCFG.mediaSBtexture = 0	end
end

function Reset_Options()
	SetCVar('snpClassIcon', 1, true)
	SetCVar('snpTotemIcon', 1, true)
	SetCVar('snplevel', 1, true)
	SetCVar('snpSBtext', 1, true)
	SetCVar('snpFormatOnly', 0, false)
	SetCVar('snpPercentOnly', 0, false)
	SetCVar('snphideName', 0, false)
	SetCVar('snpClassColor', 1, true)
	SetCVar('snpClassFlat', 0, false)
	
	snpCFG.hpWidth = 135
	snpCFG.hpHeight = 17
	snpCFG.cbWidth = 135
	snpCFG.cbHeight = 13
	snpCFG.levelXpos = -20
	snpCFG.levelYpos = 2
	snpCFG.nameXpos = 0
	snpCFG.nameYpos = 4
	snpCFG.cbNameY = -3
	snpCFG.timeXpos = -2
	snpCFG.timeYpos = 0
	snpCFG.fontSize = 14
	snpCFG.fontMedia = 0
	
	snpCFG.iconClassSize = 32
	snpCFG.iconSpellSize = 36
	snpCFG.iconTotemSize = 46
	snpCFG.mediaSBtexture = 0
end

function config_OnLoad()
	Default_Options();
	snp_msgload(fntF..'SoHigh'..fntB..'Plates'..fntW..' v2.2b '..fntA..'Successful '..fntO..'Loaded! '..fntA.. 'Type ' ..fntO.. '/SNP ' ..fntA.. 'for Options'..fntW..' **')
end

function snp_msgload(msg)
	if(DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(fntW..'** '..msg)
	end
end

local sohighPlates = CreateFrame('frame', nil, UIParent)

local match, modf, len, gsub, select, sub, tonumber = string.match, math.modf, string.len, string.gsub, select, string.sub, tonumber
local SetFormattedText = SetFormattedText
local GetSpellInfo = GetSpellInfo
local CLASS_BUTTONS, RAID_CLASS_COLORS = CLASS_BUTTONS, RAID_CLASS_COLORS

local isSohighPlates = function(self)
	if self:GetName() then
		return
	end
	overlayRegion = select(2, self:GetRegions())
	return overlayRegion and overlayRegion:GetObjectType() == "Texture" and overlayRegion:GetTexture() == "Interface\\Tooltips\\Nameplate-Border"
end

--	//	*	COLORING	*	//	--
local reactions = {}
for class, color in next, FACTION_BAR_COLORS do
	reactions[class] = {color.r, color.g, color.b}
end

local name, class, classL
local classes = {}
local RGBhex = {}
for class, color in pairs(RAID_CLASS_COLORS) do
	RGBhex[class] = {color.r, color.g, color.b}
end

--	//	*	TOTEMIC STUFF	 *	//	--
local function totemSpellID(SpellID)
	local totemic = select(3, GetSpellInfo(SpellID))
	return totemic
end

local totemTable = {
	['totems'] = {
--							 [Air Totems]
		['Grace of Air Totem'] 			= {totemSpellID(8835), 1},
		['Grace of Air Totem II'] 		= {totemSpellID(10627), 1},
		['Grace of Air Totem III'] 		= {totemSpellID(25359), 1},
		['Nature Resistance Totem'] 	= {totemSpellID(10595), 1},
		['Nature Resistance Totem II'] 	= {totemSpellID(10600), 1},
		['Nature Resistance Totem III'] = {totemSpellID(10601), 1},
		['Nature Resistance Totem IV'] 	= {totemSpellID(25574), 1},
		['Windfury Totem'] 				= {totemSpellID(8512), 1},
		['Windfury Totem II'] 			= {totemSpellID(10613), 1},
		['Windfury Totem III'] 			= {totemSpellID(10614), 1},
		['Windfury Totem IV'] 			= {totemSpellID(25585), 1},
		['Windfury Totem V'] 			= {totemSpellID(25587), 1},
		['Windwall Totem'] 				= {totemSpellID(15107), 1},
		['Windwall Totem II'] 			= {totemSpellID(15111), 1},
		['Windwall Totem III'] 			= {totemSpellID(15112), 1},
		['Windwall Totem IV'] 			= {totemSpellID(25577), 1},
		['Wrath of Air Totem'] 			= {totemSpellID(3738), 1},
		['Grounding Totem'] 			= {totemSpellID(8177), 1},
		['Sentry Totem'] 				= {totemSpellID(6495), 1},
--							[Earth Totems]
		['Earth Elemental Totem'] 		= {totemSpellID(2062), 2},
		['Earthbind Totem'] 			= {totemSpellID(2484), 2},
		['Stoneclaw Totem'] 			= {totemSpellID(5730), 2},
		['Stoneclaw Totem II'] 			= {totemSpellID(6390), 2},
		['Stoneclaw Totem III'] 		= {totemSpellID(6391), 2},
		['Stoneclaw Totem IV'] 			= {totemSpellID(6392), 2},
		['Stoneclaw Totem V'] 			= {totemSpellID(10427), 2},
		['Stoneclaw Totem VI'] 			= {totemSpellID(10428), 2},
		['Stoneclaw Totem VII'] 		= {totemSpellID(25525), 2},
		['Stoneskin Totem'] 			= {totemSpellID(8071), 2},
		['Stoneskin Totem II'] 			= {totemSpellID(8154), 2},
		['Stoneskin Totem III'] 		= {totemSpellID(8155), 2},
		['Stoneskin Totem IV'] 			= {totemSpellID(10406), 2},
		['Stoneskin Totem V'] 			= {totemSpellID(10407), 2},
		['Stoneskin Totem VI'] 			= {totemSpellID(10408), 2},
		['Stoneskin Totem VII'] 		= {totemSpellID(25508), 2},
		['Stoneskin Totem VIII'] 		= {totemSpellID(25509), 2},
		['Strength of Earth Totem'] 	= {totemSpellID(8075), 2},
		['Strength of Earth Totem II'] 	= {totemSpellID(8160), 2},
		['Strength of Earth Totem III'] = {totemSpellID(8161), 2},
		['Strength of Earth Totem IV'] 	= {totemSpellID(10442), 2},
		['Strength of Earth Totem V'] 	= {totemSpellID(25361), 2},
		['Strength of Earth Totem VI'] 	= {totemSpellID(25528), 2},
		['Tremor Totem'] 				= {totemSpellID(8143), 2},
--							[Fire Totems]
		['Fire Elemental Totem'] 		= {totemSpellID(2894), 3},
		['Fire Nova Totem'] 			= {totemSpellID(1535), 3},
		['Fire Nova Totem II'] 			= {totemSpellID(8498), 3},
		['Fire Nova Totem III'] 		= {totemSpellID(8499), 3},
		['Fire Nova Totem IV'] 			= {totemSpellID(11314), 3},
		['Fire Nova Totem V'] 			= {totemSpellID(11315), 3},
		['Fire Nova Totem VI'] 			= {totemSpellID(25546), 3},
		['Fire Nova Totem VII'] 		= {totemSpellID(25547), 3},
		['Flametongue Totem'] 			= {totemSpellID(8227), 3},
		['Flametongue Totem II'] 		= {totemSpellID(8249), 3},
		['Flametongue Totem III'] 		= {totemSpellID(10526), 3},
		['Flametongue Totem IV'] 		= {totemSpellID(16387), 3},
		['Flametongue Totem V'] 		= {totemSpellID(25557), 3},
		['Frost Resistance Totem'] 		= {totemSpellID(8181), 3},
		['Frost Resistance Totem II'] 	= {totemSpellID(10478), 3},
		['Frost Resistance Totem III'] 	= {totemSpellID(10479), 3},
		['Frost Resistance Totem IV'] 	= {totemSpellID(25560), 3},
		['Magma Totem'] 				= {totemSpellID(8190), 3},
		['Magma Totem II'] 				= {totemSpellID(10585), 3},
		['Magma Totem III'] 			= {totemSpellID(10586), 3},
		['Magma Totem IV'] 				= {totemSpellID(10587), 3},
		['Magma Totem V'] 				= {totemSpellID(25552), 3},
		['Searing Totem'] 				= {totemSpellID(3599), 3},
		['Searing Totem II'] 			= {totemSpellID(6363), 3},
		['Searing Totem III'] 			= {totemSpellID(6364), 3},
		['Searing Totem IV'] 			= {totemSpellID(6365), 3},
		['Searing Totem V'] 			= {totemSpellID(10437), 3},
		['Searing Totem VI'] 			= {totemSpellID(10438), 3},
		['Searing Totem VII'] 			= {totemSpellID(25533), 3},
		['Totem of Wrath'] 				= {totemSpellID(30706), 3},
--							[Water Totems]
	    ['Disease Cleansing Totem'] 	= {totemSpellID(8170), 4},
		['Fire Resistance Totem'] 		= {totemSpellID(8184), 4},
		['Fire Resistance Totem II'] 	= {totemSpellID(10537), 4},
		['Fire Resistance Totem III'] 	= {totemSpellID(10538), 4},
		['Fire Resistance Totem IV'] 	= {totemSpellID(25563), 4},
		['Healing Stream Totem'] 		= {totemSpellID(5394), 4},
		['Healing Stream Totem II'] 	= {totemSpellID(6375), 4},
		['Healing Stream Totem III'] 	= {totemSpellID(6377), 4},
		['Healing Stream Totem IV'] 	= {totemSpellID(10462), 4},
		['Healing Stream Totem V '] 	= {totemSpellID(10463), 4},
		['Healing Stream Totem VI'] 	= {totemSpellID(25567), 4},
		['Mana Spring Totem'] 			= {totemSpellID(5675), 4},
		['Mana Spring Totem II'] 		= {totemSpellID(10495), 4},
		['Mana Spring Totem III'] 		= {totemSpellID(10496), 4},
		['Mana Spring Totem IV'] 		= {totemSpellID(10497), 4},
		['Mana Spring Totem V'] 		= {totemSpellID(25570), 4},
		['Mana Tide Totem'] 			= {totemSpellID(16190), 4},
		['Poison Cleansing Totem'] 		= {totemSpellID(8168), 4},
	},
}

--	//	*	HEALTH FORMAT NUMBERS	*	//	--
local function round(number, idp)
	return tonumber(format('%.' .. (idp or 0) .. 'f', number))
end

local function formatNumber(number)
	if number >= 1e6 then
		return round(number/1e6, 1)..'|cffEEEE00m|r'
	elseif number >= 1e3 then
		return round(number/1e3, 1)..'|cffEEEE00k|r'
	else
		return number
	end
end

--	//	*	TEKKUB's color gradient function of awesomeness	  *	 //	 --
local function colorGradient(perc, r1, g1, b1, r2, g2, b2, r3, g3, b3)
	if perc >= 1 then 
		return r3, g3, b3 
	elseif perc <= 0 then 
		return r1, g1, b1 
	end
	local segment, relperc = modf(perc*2)
		if segment == 1 then 
			r1, g1, b1, r2, g2, b2 = r2, g2, b2, r3, g3, b3 
		end
	return r1+(r2-r1)*relperc, g1+(g2-g1)*relperc, b1+(b2-b1)*relperc
end

local function updateHealth(healthBar, maxHp)
	if healthBar and (GetCVar('snpSBtext') == '1') then
		local self = healthBar:GetParent()
		local _, maxhealth = self.healthBar:GetMinMaxValues()
			if maxHp == 'maxHealth' then 
				maxHp = maxhealth
			end
		local currentValue = self.healthBar:GetValue()
		local percent = (currentValue/maxhealth)*100
		local r, g, b = colorGradient(currentValue/maxhealth, 1,0,0, 1,1,0, 0,1,0)				
		self.hp:SetTextColor(r, g, b)
	
		if (GetCVar('snpFormatOnly') == '0') then
			if percent < 100 then
				self.hp:SetFormattedText('|cffFFFFFF%s|r|cffffffff — |r%.1f%%', formatNumber(currentValue), percent)
			elseif percent >= 100 then
				self.hp:SetFormattedText('|cffFFFFFF%s|r|cffffffff — |r%.0f%%', formatNumber(currentValue), percent)	
			else
				self.hp:SetText('')
			end
		else
			if percent < 100 then
				self.hp:SetFormattedText('|cffFFFFFF%s|r', formatNumber(currentValue))
			elseif percent >= 100 then
				self.hp:SetFormattedText('|cffFFFFFF%s|r', formatNumber(currentValue))
			else
				self.hp:SetText('')
			end
		end
		if (GetCVar('snpPercentOnly') == '1') then
			if percent < 100 then
				self.hp:SetFormattedText('%.1f%%', percent)
			elseif percent >= 100 then
				self.hp:SetFormattedText('%.0f%%', percent)
			else
				self.hp:SetText('')
			end
		end
	end
end

local function updateTime(self, curValue)
	local _, maxValue = self:GetMinMaxValues()
	local chek = false
	
	if maxValue > 300 or maxValue == nil then chek = true end
	
	local oldname = self.channeling or self.casting
	local name = oldname and (len(oldname) > 20) and gsub(oldname, '%s?(.[\128-\191]*)%S+%s', '%1. ') or oldname -->fixes really long names
	
	if self.channeling then
		if chek then 
			self.time:SetFormattedText('%.1f ', curValue)
		else 
			self.time:SetFormattedText('%.1f (%.1f) ', curValue, maxValue) 
		end
	else 
		if chek then 
			self.time:SetFormattedText('%.1f ', maxValue - curValue)
		else 
			self.time:SetFormattedText('%.1f (%.1f) ', maxValue - curValue, maxValue) 
		end		
	end
	
	if UnitChannelInfo('target') then-->fuck that `;[
		self.name:SetText(select(1, (UnitChannelInfo('target'))))
	end
	if UnitCastingInfo('target') then
		self.name:SetText(select(1, (UnitCastingInfo('target'))))
	end
	
	local countMinMax = maxValue - curValue <= 0
	
	if countMinMax then
		self.name:Hide()
		self.time:Hide()
		self.cbBackground:Hide()
		self.cbBorder:Hide()
		self.icGlow:Hide()
	else
		self.name:Show()
		self.time:Show()
		self.cbBackground:Show()
		self.cbBorder:Show()
		self.icGlow:Show()
	end
end

local function updateColors(self)
	local r, g, b = self.healthBar:GetStatusBarColor()
--		[Hostile unit]		--
	if g + b == 0 then
		r, g, b = unpack(reactions[1])
--		[Friendly unit]		--
	elseif r + b == 0 then
		r, g, b = unpack(reactions[5])
--		[Friendly player]		--
	elseif r + g == 0 then
		r, g, b = 0, .3, .5
--		[Neutral unit]		--
	elseif 2 - (r + g) < 0.05 and b == 0 then
		r, g, b = unpack(reactions[4])
--		[Enemy RED player]		--
--	else
--		return r, g, b
	end

	self.healthBar:SetStatusBarColor(r, g, b)
	self.r, self.g, self.b = r, g, b

	self.healthBar.hpBackground:SetVertexColor(self.r*0.20, self.g*0.20, self.b*0.20)
end

--	//	*	CLASS ICONS	 *	//	--
local function updateClass(self)
	local r, g, b = self.healthBar:GetStatusBarColor()
	local r, g, b = floor(r*100+.5)/100, floor(g*100+.5)/100, floor(b*100+.5)/100
	local classname = ''
	local hasclass = 0
	for class, color in pairs(RAID_CLASS_COLORS) do
		if RAID_CLASS_COLORS[class].r == r and RAID_CLASS_COLORS[class].g == g and RAID_CLASS_COLORS[class].b == b then
			classname = class
		end
	end
	if (classname) then
		texcoord = CLASS_BUTTONS[classname]
		if texcoord then
			hasclass = 1
		else
			texcoord = {0.5, 0.75, 0.5, 0.75}
			hasclass = 0
		end
	else
		texcoord = {0.5, 0.75, 0.5, 0.75}
		self.classIcon:Hide()
		hasclass = 0
	end
	if hasclass == 1 then
		self.classIcon:Show()
		if (GetCVar('snpClassFlat') == '1') then
			self.classIcon:SetTexture(classIcons)
		else
			self.classIcon:SetTexture(classIconsFlat)
		end
		self.classIcon:SetTexCoord(texcoord[1],texcoord[2],texcoord[3],texcoord[4])
	else
		self.classIcon:Hide()
		self.classIcon:SetTexture(0,0,0,0)
		self.classIcon:SetTexCoord(0,0,0,0)
	end
end

--	//	*	TOTEM ICONS	 *	//	--
local function updateTotem(self)
local oldname = self:GetRegions()
local name = self.oldname:GetText()
	if totemTable['totems'][name] then
		self.level:SetText('')
		self.healthBar:Hide()
		self.hp:Hide()
		self.highlight:SetVertexColor(0)
		if (not self.totemIcon) then
			self.totemIcon = CreateFrame('frame', nil, self)
			self.totemIcon:SetHeight(snpCFG.iconTotemSize)
			self.totemIcon:SetWidth(snpCFG.iconTotemSize)
			self.totemIcon:SetPoint('BOTTOM', self.name, 'TOP', 0, 1)
		end

		local getIcon = totemTable['totems'][name]
			self.totemIcon:SetBackdrop({
			bgFile = getIcon[1],
			edgeFile = backdropTexture, edgeSize = 12,
			insets = { top = -0, left = -0, bottom = -0, right = -0 },
		})
		local r, g, b = unpack(reactions[4])
		self.totemIcon:SetBackdropBorderColor(r, g, b, 1)
		self.totemIcon:Show()
	else
		if (self.totemIcon) then
			self.totemIcon:SetBackdrop(nil)
			self.totemIcon:Hide()
			self.totemIcon = nil
			self.healthBar:Show()
			self.hp:Show()
			self.oldname:Hide()
			--self.level:SetText('')
			self.highlight:SetVertexColor(0.25, 0.25, 0.25)
		end
	end
end

local updatePlate = function(self)
	self.healthBar:ClearAllPoints()
	self.healthBar:SetPoint('CENTER', self.healthBar:GetParent(), 'CENTER', 0, 17)
	self.healthBar:SetHeight(snpCFG.hpHeight)
	self.healthBar:SetWidth(snpCFG.hpWidth)

	self.castBar:ClearAllPoints()
	self.castBar:SetPoint('TOP', self.healthBar, 'BOTTOM', 0, -8)
	self.castBar:SetHeight(snpCFG.cbHeight)
	self.castBar:SetWidth(snpCFG.cbWidth)

	self.highlight:ClearAllPoints()
	self.highlight:SetAllPoints(self.healthBar)

	local nameString = self.oldname:GetText()
	if string.len(nameString) < 22 then
		self.name:SetText(nameString)
	else
		self.name:SetFormattedText(nameString:sub(0, 24)..' ...')
	end
	
	local level, mylevel = tonumber(self.level:GetText()), UnitLevel('player')
	self.level:ClearAllPoints()
	self.level:SetPoint('LEFT', self.healthBar, 'RIGHT', snpCFG.levelXpos, snpCFG.levelYpos)
	if self.boss:IsShown() then
		self.level:SetText('B')
		self.level:SetTextColor(0.8, 0.05, 0)
		self.level:Show()
	elseif level == mylevel then
		self.level:Show()
	end
end

local colorCastBar = function(self, shielded)
	if shielded then
		self:SetStatusBarColor(0.8, 0.05, 0)
		self.cbGlow:SetBackdropBorderColor(0.75, 0.75, 0.75)
		self.icGlow:SetBackdropBorderColor(0.75, 0.75, 0.75)
	else
		self.cbGlow:SetBackdropBorderColor(0, 0, 0)
		self.icGlow:SetBackdropBorderColor(0, 0, 0)
	end
end

local fixCastbar = function(self)
	self:ClearAllPoints()
	self.castbarOverlay:Hide()
	self:SetHeight(5)
	self:SetPoint('TOP', self.healthBar, 'BOTTOM', 0, -4)
end

local onSizeChanged = function(self)
	self.needFix = true
end

local function OnValueChanged(self, curValue)
	updateTime(self, curValue)
	if self.needFix then
		fixCastbar(self)
		self.needFix = nil
	end
	if self.controller and select(2, self:GetStatusBarColor()) > 0.15 then 
		self:SetStatusBarColor(0.13, 0.44, 0.14) 
	end
end

local onShow = function(self)
	self.channeling = UnitChannelInfo('target')
	fixCastbar(self)
	colorCastBar(self, self.shieldedRegion:IsShown())
end

local onHide = function(self)
	self.highlight:Hide()
	self.healthBar.hpGlow:SetBackdropBorderColor(0, 0, 0)
end

local onEvent = function(self, event, unit)
	if (unit == 'target') then
		local chc, cc

		self.controller = nil

		self.channeling = select(1, UnitChannelInfo('target'))
		self.casting = select(1, UnitCastingInfo('target'))

		chc = select(8, UnitChannelInfo('target'))
		cc = select(9, UnitCastingInfo('target'))

		if self.channeling and not self.casting then 
			self.controller = chc
		else 
			self.controller = cc 
		end

		if self:IsShown() then
			colorCastBar(self, event == 'UNIT_SPELLCAST_NOT_INTERRUPTIBLE')
		end
	end
end

function cfgSetValue(self)
	if (GetCVar('snpClassColor') == '1') then
		name = self.name:GetText()
			if name and classes[name] then
				self.healthBar:SetStatusBarColor(unpack(RGBhex[classes[name]]))
			end
		implementClassColor()
	end
	if (GetCVar('snphideName') == '1') then
		self.name:Hide()
	else
		self.name:Show()
	end
	if (GetCVar('snplevel') == '1') then
		self.level:Show()
	else
		self.level:Hide()
		--self.level:SetText('')
	end
	if (GetCVar('snpTotemIcon') == '1') then
		updateTotem(self)
	else
		if (self.totemIcon) then
			self.totemIcon:SetBackdrop(nil)
			self.totemIcon:Hide()
			self.totemIcon = nil
			self.healthBar:Show()
			self.hp:Show()
			self.oldname:Hide()
			--self.level:SetText('')
			self.highlight:SetVertexColor(0.25, 0.25, 0.25)
		end
	end
	if (GetCVar('snpClassIcon') == '1') then
		updateClass(self)
	else
		self.classIcon:Hide()
		self.classIcon:SetTexture(0,0,0,0)
		self.classIcon:SetTexCoord(0,0,0,0)
	end

	if snpCFG.hpWidth or snpCFG.hpHeight then
		self.healthBar:SetWidth(snpCFG.hpWidth)
		self.healthBar:SetHeight(snpCFG.hpHeight)
	end
	if snpCFG.cbWidth or snpCFG.cbHeight then
		self.castBar:SetWidth(snpCFG.cbWidth)
		self.castBar:SetHeight(snpCFG.cbHeight)
	end
	if snpCFG.levelXpos or snpCFG.levelYpos then
		self.level:SetPoint('LEFT', self.healthBar, 'RIGHT', snpCFG.levelXpos, snpCFG.levelYpos)
	end
	if snpCFG.nameYpos then
		self.name:SetPoint('BOTTOM', self.healthBar, 'TOP', snpCFG.nameXpos, snpCFG.nameYpos)
	end
	if snpCFG.cbNameY then
		self.cbname:SetPoint('TOPLEFT', self.castBar, 'BOTTOMLEFT', 0, snpCFG.cbNameY)
		self.cbname:SetPoint('TOPRIGHT', self.castBar, 'BOTTOMRIGHT', 0, snpCFG.cbNameY)
	end
	if snpCFG.timeXpos or snpCFG.timeYpos then
		self.time:SetPoint('RIGHT', self.castBar, 'LEFT', snpCFG.timeXpos, snpCFG.timeYpos)
	end
	if snpCFG.fontSize and (snpCFG.fontMedia == 1) then
		self.name:SetFont(fontAngelsk, snpCFG.fontSize, fontOutline)
		self.level:SetFont(fontAngelsk, snpCFG.fontSize, fontOutline)
		self.hp:SetFont(fontAngelsk, snpCFG.fontSize, fontOutline)
		self.time:SetFont(fontAngelsk, snpCFG.fontSize, fontOutline)
		self.cbname:SetFont(fontAngelsk, snpCFG.fontSize, fontOutline)
	elseif (snpCFG.fontMedia == 2) then
		self.name:SetFont(fontExpress, snpCFG.fontSize, fontOutline)
		self.level:SetFont(fontExpress, snpCFG.fontSize, fontOutline)
		self.hp:SetFont(fontExpress, snpCFG.fontSize, fontOutline)
		self.time:SetFont(fontExpress, snpCFG.fontSize, fontOutline)
		self.cbname:SetFont(fontExpress, snpCFG.fontSize, fontOutline)
	else
		self.name:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
		self.level:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
		self.hp:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
		self.time:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
		self.cbname:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
	end
	--Extra
	if snpCFG.iconClassSize then
		self.classIcon:SetHeight(snpCFG.iconClassSize)
		self.classIcon:SetWidth(snpCFG.iconClassSize)
	end
	if snpCFG.iconSpellSize then
		self.spellIcon:SetHeight(snpCFG.iconSpellSize)
		self.spellIcon:SetWidth(snpCFG.iconSpellSize)
	end
	if snpCFG.iconTotemSize and (GetCVar('snpTotemIcon') == '1') then
		if totemTable['totems'][name] then
			self.totemIcon:SetHeight(snpCFG.iconTotemSize)
			self.totemIcon:SetWidth(snpCFG.iconTotemSize)
		end
	end
	if (snpCFG.mediaSBtexture == 1) then
		self.healthBar:SetStatusBarTexture(CleanTexture)
		self.highlight:SetTexture(CleanTexture)
		self.castBar.cbBackground:SetTexture(CleanTexture)
		self.castBar:SetStatusBarTexture(CleanTexture)
		self.healthBar.hpBackground:SetTexture(CleanTexture)
	else
		self.healthBar:SetStatusBarTexture(SmoothTexture)
		self.highlight:SetTexture(SmoothTexture)
		self.castBar.cbBackground:SetTexture(SmoothTexture)
		self.castBar:SetStatusBarTexture(SmoothTexture)
		self.healthBar.hpBackground:SetTexture(SmoothTexture)
	end
end

local createPlate = function(self)
	if self.done then
		return
	end

	self.nameplate = true	

	self.healthBar, self.castBar = self:GetChildren()
	local healthBar, castBar = self.healthBar, self.castBar

	local overlayRegion, castbarOverlay, spellIconRegion, highlightRegion, nameTextRegion, levelTextRegion, bossIconRegion, raidIconRegion = self:GetRegions()	
	self.oldname = nameTextRegion
	nameTextRegion:Hide()

	local newNameRegion = self:CreateFontString()
	newNameRegion:SetPoint('BOTTOM', healthBar, 'TOP', snpCFG.nameXpos, snpCFG.nameYpos)
	newNameRegion:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
	newNameRegion:SetTextColor(0.84, 0.75, 0.65)
	newNameRegion:SetShadowOffset(2, -2)
	self.name = newNameRegion
	
	self.level = levelTextRegion	
	levelTextRegion:SetFont(snpCFG.fontMedia, snpCFG.fontSize, fontOutline)
	levelTextRegion:SetShadowOffset(2, -2)

	healthBar:SetStatusBarTexture(snpCFG.mediaSBtexture)

	healthBar.hpBackground = healthBar:CreateTexture(nil, 'BORDER')
	healthBar.hpBackground:SetAllPoints(healthBar)
	healthBar.hpBackground:SetTexture(snpCFG.mediaSBtexture)
	healthBar.hpBackground:SetAlpha(0.7)
	healthBar.hpBackground:SetVertexColor(0.15, 0.15, 0.15)

	healthBar.hpGlow = CreateFrame('frame', nil, healthBar)
	healthBar.hpGlow:SetFrameLevel(healthBar:GetFrameLevel() -1 > 0 and healthBar:GetFrameLevel() -1 or 0)
	healthBar.hpGlow:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', -3, 3)
	healthBar.hpGlow:SetPoint('BOTTOMRIGHT', healthBar, 'BOTTOMRIGHT', 3, -3)
	
	healthBar.hpGlowBorder = healthBar:CreateTexture(nil, 'BORDER')
	healthBar.hpGlowBorder:SetPoint('TOPLEFT', healthBar, 'TOPLEFT', -2, 2)
	healthBar.hpGlowBorder:SetPoint('BOTTOMRIGHT', healthBar, 'BOTTOMRIGHT', 2, -2)
	healthBar.hpGlowBorder:SetTexture(glowTexture)
	healthBar.hpGlowBorder:SetVertexColor(0, 0, 0)
	healthBar.hpGlowBorder:SetAlpha(1)

	self.hp = self:CreateFontString(nil, 'ARTWORK')
	self.hp:SetPoint('CENTER', healthBar, 'CENTER', 0, 1)
	self.hp:SetFont(fontDefault, snpCFG.fontSize, fontOutline)
	self.hp:SetShadowOffset(1, -1)
		healthBar:SetScript('OnValueChanged', updateHealth)
	updateHealth(healthBar, 'maxHealth')
	
	castBar.castbarOverlay = castbarOverlay
	castBar.healthBar = healthBar
	castBar.shieldedRegion = shieldedRegion
	castBar:SetStatusBarTexture(snpCFG.mediaSBtexture)
	castBar:HookScript('OnShow', onShow)
	castBar:HookScript('OnSizeChanged', onSizeChanged)
	castBar:SetScript('OnValueChanged', OnValueChanged)
	castBar:SetScript('OnEvent', onEvent)
	
	castBar:RegisterEvent('UNIT_SPELLCAST_INTERRUPTIBLE')
	castBar:RegisterEvent('UNIT_SPELLCAST_NOT_INTERRUPTIBLE')
	castBar:RegisterEvent('UPDATE_MOUSEOVER_UNIT')

	castBar.time = castBar:CreateFontString(nil, 'ARTWORK')
	castBar.time:SetPoint('RIGHT', castBar, 'LEFT', snpCFG.timeXpos, snpCFG.timeYpos)
	castBar.time:SetFont(snpCFG.fontMedia, snpCFG.fontSize, fontOutline)
	--castBar.time:SetTextColor(1, 1, 1) -->i have one idea about this
	castBar.time:SetShadowOffset(2, -2)
	self.time = castBar.time
	
	castBar.name = castBar:CreateFontString(nil, 'ARTWORK')
	castBar.name:SetPoint('TOPLEFT', castBar, 'BOTTOMLEFT', 0, snpCFG.cbNameY)
	castBar.name:SetPoint('TOPRIGHT', castBar, 'BOTTOMRIGHT', 0, snpCFG.cbNameY)
	castBar.name:SetFont(snpCFG.fontMedia, snpCFG.fontSize, fontOutline)
	castBar.name:SetTextColor(1, 1, 1)
	self.cbname = castBar.name
	
	castBar.cbBackground = castBar:CreateTexture(nil, 'BORDER')
	castBar.cbBackground:SetAllPoints(castBar)
	castBar.cbBackground:SetTexture(snpCFG.mediaSBtexture)
	castBar.cbBackground:SetAlpha(0.8)
	castBar.cbBackground:SetVertexColor(0, 0, 0)
	
	castBar.cbBorder = castBar:CreateTexture(nil, 'BORDER')
	castBar.cbBorder:SetPoint('TOPLEFT', castBar, 'TOPLEFT', -2, 2)
	castBar.cbBorder:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 2, -2)
	castBar.cbBorder:SetTexture(glowTexture)
	castBar.cbBorder:SetVertexColor(0, 0, 0)
	castBar.cbBorder:SetAlpha(1)

	castBar.cbGlow = CreateFrame('frame', nil, castBar)
	castBar.cbGlow:SetFrameLevel(castBar:GetFrameLevel() -1 > 0 and castBar:GetFrameLevel() -1 or 0)
	castBar.cbGlow:SetPoint('TOPLEFT', castBar, 'TOPLEFT', -3, 3)
	castBar.cbGlow:SetPoint('BOTTOMRIGHT', castBar, 'BOTTOMRIGHT', 3, -3)

	spellIconRegion:ClearAllPoints()
	spellIconRegion:SetTexCoord(.08, .92, .08, .92)
	spellIconRegion:SetPoint('BOTTOMLEFT', castBar, 'BOTTOMRIGHT', 9, 0.25)
	spellIconRegion:SetHeight(snpCFG.iconSpellSize)
	spellIconRegion:SetWidth(snpCFG.iconSpellSize)

	spellIconRegion.IconBackdrop = CreateFrame('frame', nil, castBar)
	spellIconRegion.IconBackdrop:SetPoint('TOPLEFT', spellIconRegion, 'TOPLEFT', -3, 3)
	spellIconRegion.IconBackdrop:SetPoint('BOTTOMRIGHT', spellIconRegion, 'BOTTOMRIGHT', 3, -3)
	spellIconRegion.IconBackdrop:SetBackdrop(backdrop)
	spellIconRegion.IconBackdrop:SetBackdropColor(0, 0, 0)
	spellIconRegion.IconBackdrop:SetBackdropBorderColor(0, 0, 0)
	self.spellIcon = spellIconRegion

	highlightRegion:SetTexture(snpCFG.mediaSBtexture)
	highlightRegion:SetVertexColor(0.25, 0.25, 0.25)
	self.highlight = highlightRegion

	raidIconRegion:ClearAllPoints()
	raidIconRegion:SetPoint('CENTER', healthBar, 'CENTER', 0, -4)
	raidIconRegion:SetTexture(mediaFolder..'Raidicons')
	raidIconRegion:SetWidth(raidIconSize)
	raidIconRegion:SetHeight(raidIconSize)
	
	local classIcon = healthBar:CreateTexture(nil, 'OVERLAY')
	classIcon:SetPoint('TOPRIGHT', healthBar, 'TOPLEFT', -8, 8)
	classIcon:SetHeight(snpCFG.iconClassSize)
	classIcon:SetWidth(snpCFG.iconClassSize)
	self.classIcon = classIcon
	
	castBar.icGlow = spellIconRegion.IconBackdrop
	
	self.boss = bossIconRegion
	self.done = true

	overlayRegion:SetTexture(nil)
	castbarOverlay:SetTexture(nil)
	bossIconRegion:SetTexture(nil)

	updatePlate(self)
	self:SetScript('OnShow', updatePlate)
	self:SetScript('OnHide', onHide)

	self.update = 0
	self:SetScript('OnUpdate', function(self, elapsed)
		self.update = self.update + elapsed
		if self.update > 0.1 then
				cfgSetValue(self)
				updateColors(self)
			end
		end)
	end

local lastUpdate = 0
local checkPlates = function(self, elapsed)
	lastUpdate = lastUpdate + elapsed

	if lastUpdate > 0.1 then
		lastUpdate = 0
			local numFrames = select('#', WorldFrame:GetChildren())
    
		for i = 1, numFrames do
		local frame = select(i, WorldFrame:GetChildren())
			if not frame.nameplate and isSohighPlates(frame) then
				createPlate(frame)
			end
		end
	end
end

sohighPlates:SetScript('OnEvent', function(self, event)
	if self[event] then self[event]() end
		if (event == 'PLAYER_LOGIN') then
			self:SetScript('OnUpdate', checkPlates)
		end
		if (event == 'ADDON_LOADED') then
			if (arg1 == addonName) then
				config_OnLoad();
			end
		end
	end)

sohighPlates:RegisterEvent('PLAYER_LOGIN')
sohighPlates:RegisterEvent('ADDON_LOADED')

function implementClassColor()
	sohighPlates:RegisterEvent('UPDATE_MOUSEOVER_UNIT')
	sohighPlates:RegisterEvent('PLAYER_TARGET_CHANGED')
	sohighPlates:RegisterEvent('UPDATE_BATTLEFIELD_SCORE')

	local function AddName(name, class)
		if not class or not name then return end
		if class == 'UNKNOWN' or not RAID_CLASS_COLORS[class] then return end
		classes[name] = class
	end

	function sohighPlates:UPDATE_MOUSEOVER_UNIT()
		if UnitIsPlayer('mouseover') then
			classL, class = UnitClass('mouseover')
			name = UnitName('mouseover')
			AddName(name, class)
		end
	end

	function sohighPlates:PLAYER_TARGET_CHANGED()
		if UnitIsPlayer('target') then
			classL, class = UnitClass('target')
			name = UnitName('target')
			AddName(name, class)
		end
	end

	function sohighPlates:UPDATE_BATTLEFIELD_SCORE()
		for i = 1, GetNumBattlefieldScores() do
			local name, _, _, _, _, _, _, _, _, class = GetBattlefieldScore(i)
			name = ('-'):split(name, 2)
			AddName(name, class)
		end
	end
end