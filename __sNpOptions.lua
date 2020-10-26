local font, fMenu, fSlider, fLine = __sNpCore.art.font.cstm.b[1], 13, 13, 'OUTLINE'
local _, class = UnitClass'player'
local colour = RAID_CLASS_COLORS[class]
--///******** Menu ********///
local __sNpMenu = CreateFrame('Frame', 'sNpOptions', UIParent)
__sNpMenu:SetWidth(345) __sNpMenu:SetHeight(690)
__sNpMenu:SetPoint('CENTER', UIParent)
__sNpMenu:SetBackdrop(__sNpCore.art.backdrop.options)
__sNpMenu:SetBackdropColor(unpack(__sNpCore.art.backdrop.options.color))
__sNpMenu:SetBackdropBorderColor(unpack(__sNpCore.art.backdrop.options.borderColor))
__sNpMenu:SetMovable(true) __sNpMenu:SetUserPlaced(true)
__sNpMenu:SetFrameLevel(__sNpMenu:GetFrameLevel() + 3)
__sNpMenu:RegisterForDrag'LeftButton' __sNpMenu:EnableMouse(true)
__sNpMenu:SetScript('OnDragStart', function() __sNpMenu:StartMoving() end)
__sNpMenu:SetScript('OnDragStop', function() __sNpMenu:StopMovingOrSizing() end)
__sNpMenu:Hide()

__sNpMenu.x = CreateFrame('Button', 'sNpOptions.CloseButton', __sNpMenu, 'UIPanelCloseButton')
__sNpMenu.x:SetPoint('TOPRIGHT', -6, -6)
__sNpMenu.x:SetScript('OnClick', function() __sNpMenu:Hide() end)

__sNpMenu.header = __sNpMenu:CreateTexture(nil, 'ARTWORK')
__sNpMenu.header:SetWidth(256) __sNpMenu.header:SetHeight(64)
__sNpMenu.header:SetPoint('TOP', __sNpMenu, 0, 12)
__sNpMenu.header:SetTexture(unpack(__sNpCore.art.backdrop.header.t))
__sNpMenu.header:SetVertexColor(unpack(__sNpCore.art.backdrop.header.c))

__sNpMenu.header.t = __sNpMenu:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
__sNpMenu.header.t:SetPoint('TOP', __sNpMenu.header, 0, -14)
__sNpMenu.header.t:SetFont(font, fMenu, fLine)
__sNpMenu.header.t:SetText'— Options —'

__sNpMenu.intro = __sNpMenu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
__sNpMenu.intro:SetPoint('TOP', __sNpMenu, 0, -33)
__sNpMenu.intro:SetWidth(280)
__sNpMenu.intro:SetFont(font, 15, fLine)
__sNpMenu.intro:SetText'|c00ffffff**|r |c00ff00ffSoHigh|r|c0030d5c8Plates|r v2.|cffFF7D0A3|r |c00ffffff**|r'

__sNpMenu.titleMain = __sNpMenu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
__sNpMenu.titleMain:SetTextColor(colour.r, colour.g, colour.b)
__sNpMenu.titleMain:SetPoint('TOP', __sNpMenu.intro, 0, -28)
__sNpMenu.titleMain:SetText'— Main Settings —'
__sNpMenu.titleMain:SetFont(font, fSlider, fLine)

--///******** Class Colors ********///
__sNpMenu.ClassColor = CreateFrame('CheckButton', 'sNp.ClassColor', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.ClassColor:SetHeight(20) __sNpMenu.ClassColor:SetWidth(20)
__sNpMenu.ClassColor:SetPoint('TOPLEFT', __sNpMenu.intro, -15, -45)
	_G[__sNpMenu.ClassColor:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.ClassColor:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.ClassColor:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.ClassColor, 'RIGHT', 4, 0)
	_G[__sNpMenu.ClassColor:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.ClassColor:GetName()..'Text']:SetText'|c00ffffffClass Colors|r'
--///******** Name Hider ********///
__sNpMenu.NameHide = CreateFrame('CheckButton', 'sNp.NameHide', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.NameHide:SetHeight(20) __sNpMenu.NameHide:SetWidth(20)
__sNpMenu.NameHide:SetPoint('TOPLEFT', __sNpMenu.ClassColor, 0, -20)
	_G[__sNpMenu.NameHide:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.NameHide:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.NameHide:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.NameHide, 'RIGHT', 4, 0)
	_G[__sNpMenu.NameHide:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.NameHide:GetName()..'Text']:SetText'|c00ffffffHide Name|r'
--///******** Level Hider ********///
__sNpMenu.LevelShow = CreateFrame('CheckButton', 'sNp.level', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.LevelShow:SetHeight(20) __sNpMenu.LevelShow:SetWidth(20)
__sNpMenu.LevelShow:SetPoint('TOPLEFT', __sNpMenu.NameHide, 0, -20)
	_G[__sNpMenu.LevelShow:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.LevelShow:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.LevelShow:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.LevelShow, 'RIGHT', 4, 0)
	_G[__sNpMenu.LevelShow:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.LevelShow:GetName()..'Text']:SetText'|c00ffffffShow Level|r'
--///******** Glow Texture ********///
__sNpMenu.TargetGlow = CreateFrame('CheckButton', 'sNp.TargetGlow', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.TargetGlow:SetHeight(20) __sNpMenu.TargetGlow:SetWidth(20)
__sNpMenu.TargetGlow:SetPoint('TOPLEFT', __sNpMenu.LevelShow, 0, -20)
	_G[__sNpMenu.TargetGlow:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.TargetGlow:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.TargetGlow:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.TargetGlow, 'RIGHT', 4, 0)
	_G[__sNpMenu.TargetGlow:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.TargetGlow:GetName()..'Text']:SetText'|c00ffffffTarget Glow|r'
--///******** Status Bar Text ********///
__sNpMenu.SBtext = CreateFrame('CheckButton', 'sNp.SBtext', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.SBtext:SetHeight(20) __sNpMenu.SBtext:SetWidth(20)
__sNpMenu.SBtext:SetPoint('TOPLEFT', __sNpMenu.intro, 90, -45)
	_G[__sNpMenu.SBtext:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.SBtext:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.SBtext:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.SBtext, 'RIGHT', 4, 0)
	_G[__sNpMenu.SBtext:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.SBtext:GetName()..'Text']:SetText'|c00ffffffShow|r |cffFF7D0AStatus|r'
--///******** Status Format ********///
__sNpMenu.FormatOnly = CreateFrame('CheckButton', 'sNp.FormatOnly', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.FormatOnly:SetHeight(20) __sNpMenu.FormatOnly:SetWidth(20)
__sNpMenu.FormatOnly:SetPoint('TOPLEFT', __sNpMenu.SBtext, 0, -20)
	_G[__sNpMenu.FormatOnly:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.FormatOnly:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.FormatOnly:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.FormatOnly, 'RIGHT', 4, 0)
	_G[__sNpMenu.FormatOnly:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.FormatOnly:GetName()..'Text']:SetText'|c00ffffffShow Only|r |c00bce4d0k|r'
--///******** Status Percentage ********///
__sNpMenu.PercentOnly = CreateFrame('CheckButton', 'sNp.PercentOnly', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.PercentOnly:SetHeight(20) __sNpMenu.PercentOnly:SetWidth(20)
__sNpMenu.PercentOnly:SetPoint('TOPLEFT', __sNpMenu.FormatOnly, 0, -20)
	_G[__sNpMenu.PercentOnly:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.PercentOnly:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.PercentOnly:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.PercentOnly, 'RIGHT', 4, 0)
	_G[__sNpMenu.PercentOnly:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.PercentOnly:GetName()..'Text']:SetText'|c00ffffffShow Only|r |c00b4ff7d%|r'
--///******** Status Glow ********///
__sNpMenu.StatusGlow = CreateFrame('CheckButton', 'sNp.StatusGlow', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.StatusGlow:SetHeight(20) __sNpMenu.StatusGlow:SetWidth(20)
__sNpMenu.StatusGlow:SetPoint('TOPLEFT', __sNpMenu.PercentOnly, 0, -20)
	_G[__sNpMenu.StatusGlow:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.StatusGlow:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.StatusGlow:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.StatusGlow, 'RIGHT', 4, 0)
	_G[__sNpMenu.StatusGlow:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.StatusGlow:GetName()..'Text']:SetText'|c00ffffffStatus Glow|r'
--///******** Class Icons ********///
__sNpMenu.ClassIcon = CreateFrame('CheckButton', 'sNp.ClassIcon', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.ClassIcon:SetHeight(20) __sNpMenu.ClassIcon:SetWidth(20)
__sNpMenu.ClassIcon:SetPoint('TOPLEFT', __sNpMenu.SBtext, 107, 0)
	_G[__sNpMenu.ClassIcon:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.ClassIcon:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.ClassIcon:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.ClassIcon, 'RIGHT', 4, 0)
	_G[__sNpMenu.ClassIcon:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.ClassIcon:GetName()..'Text']:SetText'|c00ffffffClass Icons|r'
--///******** Totem Icons ********///
__sNpMenu.TotemIcon = CreateFrame('CheckButton', 'sNp.TotemIcon', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.TotemIcon:SetHeight(20) __sNpMenu.TotemIcon:SetWidth(20)
__sNpMenu.TotemIcon:SetPoint('TOPLEFT', __sNpMenu.ClassIcon, 0, -20)
	_G[__sNpMenu.TotemIcon:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.TotemIcon:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.TotemIcon:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.TotemIcon, 'RIGHT', 4, 0)
	_G[__sNpMenu.TotemIcon:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.TotemIcon:GetName()..'Text']:SetText'|c00ffffffTotem Icons|r'
--///******** Background Hider ********///
__sNpMenu.BgHide = CreateFrame('CheckButton', 'sNp.BgHide ', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.BgHide:SetHeight(20) __sNpMenu.BgHide:SetWidth(20)
__sNpMenu.BgHide:SetPoint('TOPLEFT', __sNpMenu.TotemIcon, 0, -20)
	_G[__sNpMenu.BgHide:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.BgHide:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.BgHide:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.BgHide, 'RIGHT', 4, 0)
	_G[__sNpMenu.BgHide:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.BgHide:GetName()..'Text']:SetText'|c00ffffffEmpty Back|r'
--///******** Text & Texture Colors ********///
__sNpMenu.TextColor = CreateFrame('CheckButton', 'sNp.TextColor ', __sNpMenu, 'UICheckButtonTemplate')
__sNpMenu.TextColor:SetHeight(20) __sNpMenu.TextColor:SetWidth(20)
__sNpMenu.TextColor:SetPoint('TOPLEFT', __sNpMenu.BgHide, 0, -20)
	_G[__sNpMenu.TextColor:GetName()..'Text']:SetJustifyH'LEFT'
	_G[__sNpMenu.TextColor:GetName()..'Text']:SetWidth(270)
	_G[__sNpMenu.TextColor:GetName()..'Text']:SetPoint('LEFT', __sNpMenu.TextColor, 'RIGHT', 4, 0)
	_G[__sNpMenu.TextColor:GetName()..'Text']:SetFont(font, fMenu, fLine)
	_G[__sNpMenu.TextColor:GetName()..'Text']:SetText'|c00ffffffPlate Coloring|r'
--//*******************************************************************//
__sNpMenu.ClassColor:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpCColor', 1, true)
	else
		SetCVar('_sNpCColor', 0, false)
	end
end)
__sNpMenu.NameHide:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpName', 1, true)
	else
		SetCVar('_sNpName', 0, false)
	end
end)
__sNpMenu.LevelShow:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpLevel', 1, true)
	else
		SetCVar('_sNpLevel', 0, false)
	end
end)
__sNpMenu.TargetGlow:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpGlow', 1, true)
	else
		SetCVar('_sNpGlow', 0, false)
	end
end)
__sNpMenu.SBtext:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpSBtxt', 1, true)
	else
		SetCVar('_sNpSBtxt', 0, false)
	end
end)
__sNpMenu.FormatOnly:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpFNk', 1, true)
	else
		SetCVar('_sNpFNk', 0, false)
	end
end)
__sNpMenu.PercentOnly:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpFNp', 1, true)
	else
		SetCVar('_sNpFNp', 0, false)
	end
end)
__sNpMenu.StatusGlow:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpBorder', 1, true)
	else
		SetCVar('_sNpBorder', 0, false)
	end
end)
__sNpMenu.ClassIcon:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpCIcon', 1, true)
	else
		SetCVar('_sNpCIcon', 0, false)
	end
end)
__sNpMenu.TotemIcon:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpTotem', 1, true)
	else
		SetCVar('_sNpTotem', 0, false)
	end
end)
__sNpMenu.BgHide:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpBgHide', 1, true)
	else
		SetCVar('_sNpBgHide', 0, false)
	end
end)
__sNpMenu.TextColor:SetScript('OnClick', function()
	if this:GetChecked() == 1 then
		SetCVar('_sNpTColor', 1, true)
	else
		SetCVar('_sNpTColor', 0, false)
	end
end)
--//*******************************************************************//
__sNpMenu.titleWidget = __sNpMenu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
__sNpMenu.titleWidget:SetTextColor(colour.r, colour.g, colour.b)
__sNpMenu.titleWidget:SetPoint('TOP', __sNpMenu.StatusGlow, 42, -28)
__sNpMenu.titleWidget:SetText'— Widget  &  Position —'
__sNpMenu.titleWidget:SetFont(font, fSlider, fLine)
--///******** Slider Settings ********///
__sNpMenu.hpWidth = CreateFrame('Slider', 'sNpOptions.hpWidth', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.hpWidth:SetWidth(130) __sNpMenu.hpWidth:SetHeight(16)
__sNpMenu.hpWidth:SetPoint('TOP', __sNpMenu.titleWidget, -80, -30)
__sNpMenu.hpWidth:SetMinMaxValues(105, 195)
__sNpMenu.hpWidth:SetValue(155)
__sNpMenu.hpWidth:SetValueStep(1)
__sNpMenu.hpWidth:SetScript('OnValueChanged', function()
	__sNpConfig.hpWidth = __sNpMenu.hpWidth:GetValue()
end)

	_G[__sNpMenu.hpWidth:GetName()..'Low']:SetText'0%'
	_G[__sNpMenu.hpWidth:GetName()..'High']:SetText'|cffFF7D0A100%|r'
	_G[__sNpMenu.hpWidth:GetName()..'Text']:SetText'Health Width'
	_G[__sNpMenu.hpWidth:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.hpHeight = CreateFrame('Slider', 'sNpOptions.hpHeight', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.hpHeight:SetWidth(130) __sNpMenu.hpHeight:SetHeight(16)
__sNpMenu.hpHeight:SetPoint('TOP', __sNpMenu.hpWidth, 160, 0)
__sNpMenu.hpHeight:SetMinMaxValues(8, 35)
__sNpMenu.hpHeight:SetValue(17)
__sNpMenu.hpHeight:SetValueStep(1)
__sNpMenu.hpHeight:SetScript('OnValueChanged', function()
	__sNpConfig.hpHeight = __sNpMenu.hpHeight:GetValue()
end)

	_G[__sNpMenu.hpHeight:GetName()..'Low']:SetText'0%'
	_G[__sNpMenu.hpHeight:GetName()..'High']:SetText'|cffFF7D0A100%|r'
	_G[__sNpMenu.hpHeight:GetName()..'Text']:SetText'Health Height'
	_G[__sNpMenu.hpHeight:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.cbWidth = CreateFrame('Slider', 'sNpOptions.cbWidth', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.cbWidth:SetWidth(130) __sNpMenu.cbWidth:SetHeight(16)
__sNpMenu.cbWidth:SetPoint('TOP', __sNpMenu.hpWidth, 0, -33)
__sNpMenu.cbWidth:SetMinMaxValues(105, 195)
__sNpMenu.cbWidth:SetValue(155)
__sNpMenu.cbWidth:SetValueStep(1)
__sNpMenu.cbWidth:SetScript('OnValueChanged', function()
	__sNpConfig.cbWidth = __sNpMenu.cbWidth:GetValue()
end)

	_G[__sNpMenu.cbWidth:GetName()..'Low']:SetText'0%'
	_G[__sNpMenu.cbWidth:GetName()..'High']:SetText'|cffFF7D0A100%|r'
	_G[__sNpMenu.cbWidth:GetName()..'Text']:SetText'Cast Width'
	_G[__sNpMenu.cbWidth:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.cbHeight = CreateFrame('Slider', 'sNpOptions.cbHeight', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.cbHeight:SetWidth(130) __sNpMenu.cbHeight:SetHeight(16)
__sNpMenu.cbHeight:SetPoint('TOP', __sNpMenu.hpHeight, 0, -33)
__sNpMenu.cbHeight:SetMinMaxValues(8, 25)
__sNpMenu.cbHeight:SetValue(20)
__sNpMenu.cbHeight:SetValueStep(1)
__sNpMenu.cbHeight:SetScript('OnValueChanged', function()
	__sNpConfig.cbHeight = __sNpMenu.cbHeight:GetValue()
end)

	_G[__sNpMenu.cbHeight:GetName()..'Low']:SetText'0%'
	_G[__sNpMenu.cbHeight:GetName()..'High']:SetText'|cffFF7D0A100%|r'
	_G[__sNpMenu.cbHeight:GetName()..'Text']:SetText'Cast Height'
	_G[__sNpMenu.cbHeight:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.levelXpos = CreateFrame('Slider', 'sNpOptions.levelXpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.levelXpos:SetWidth(130) __sNpMenu.levelXpos:SetHeight(16)
__sNpMenu.levelXpos:SetPoint('TOP', __sNpMenu.cbWidth, 0, -33)
__sNpMenu.levelXpos:SetMinMaxValues(-170, 10)
__sNpMenu.levelXpos:SetValue(-2)
__sNpMenu.levelXpos:SetValueStep(1)
__sNpMenu.levelXpos:SetScript('OnValueChanged', function()
	__sNpConfig.levelXpos = __sNpMenu.levelXpos:GetValue()
end)

	_G[__sNpMenu.levelXpos:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.levelXpos:GetName()..'High']:SetText'(|c00b4ff7d>|r)'
	_G[__sNpMenu.levelXpos:GetName()..'Text']:SetText'Level X'
	_G[__sNpMenu.levelXpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.levelYpos = CreateFrame('Slider', 'sNpOptions.levelYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.levelYpos:SetWidth(130) __sNpMenu.levelYpos:SetHeight(16)
__sNpMenu.levelYpos:SetPoint('TOP', __sNpMenu.cbHeight, 0, -33)
__sNpMenu.levelYpos:SetMinMaxValues(-25, 44)
__sNpMenu.levelYpos:SetValue(1)
__sNpMenu.levelYpos:SetValueStep(1)
__sNpMenu.levelYpos:SetScript('OnValueChanged', function()
	__sNpConfig.levelYpos = __sNpMenu.levelYpos:GetValue()
end)

	_G[__sNpMenu.levelYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.levelYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.levelYpos:GetName()..'Text']:SetText'Level Y'
	_G[__sNpMenu.levelYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.nameXpos = CreateFrame('Slider', 'sNpOptions.nameXpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.nameXpos:SetWidth(130) __sNpMenu.nameXpos:SetHeight(16)
__sNpMenu.nameXpos:SetPoint('TOP', __sNpMenu.levelXpos, 0, -33)
__sNpMenu.nameXpos:SetMinMaxValues(-70, 70)
__sNpMenu.nameXpos:SetValue(0)
__sNpMenu.nameXpos:SetValueStep(1)
__sNpMenu.nameXpos:SetScript('OnValueChanged', function()
	__sNpConfig.nameXpos = __sNpMenu.nameXpos:GetValue()
end)

	_G[__sNpMenu.nameXpos:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.nameXpos:GetName()..'High']:SetText'(|c00b4ff7d>|r)'
	_G[__sNpMenu.nameXpos:GetName()..'Text']:SetText'Name X'
	_G[__sNpMenu.nameXpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.nameYpos = CreateFrame('Slider', 'sNpOptions.nameYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.nameYpos:SetWidth(130) __sNpMenu.nameYpos:SetHeight(16)
__sNpMenu.nameYpos:SetPoint('TOP', __sNpMenu.levelYpos, 0, -33)
__sNpMenu.nameYpos:SetMinMaxValues(-45, 35)
__sNpMenu.nameYpos:SetValue(4)
__sNpMenu.nameYpos:SetValueStep(1)
__sNpMenu.nameYpos:SetScript('OnValueChanged', function()
	__sNpConfig.nameYpos = __sNpMenu.nameYpos:GetValue() 
end)

	_G[__sNpMenu.nameYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.nameYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.nameYpos:GetName()..'Text']:SetText'Name Y'
	_G[__sNpMenu.nameYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.timeXpos = CreateFrame('Slider', 'sNpOptions.timeXpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.timeXpos:SetWidth(130) __sNpMenu.timeXpos:SetHeight(16)
__sNpMenu.timeXpos:SetPoint('TOP', __sNpMenu.nameXpos, 0, -33)
__sNpMenu.timeXpos:SetMinMaxValues(-55, 195)
__sNpMenu.timeXpos:SetValue(-2)
__sNpMenu.timeXpos:SetValueStep(1)
__sNpMenu.timeXpos:SetScript('OnValueChanged', function()
	__sNpConfig.timeXpos = __sNpMenu.timeXpos:GetValue() 
end)

	_G[__sNpMenu.timeXpos:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.timeXpos:GetName()..'High']:SetText'(|c00b4ff7d>|r)'
	_G[__sNpMenu.timeXpos:GetName()..'Text']:SetText'Cast Time X'
	_G[__sNpMenu.timeXpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.timeYpos = CreateFrame('Slider', 'sNpOptions.timeYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.timeYpos:SetWidth(130) __sNpMenu.timeYpos:SetHeight(16)
__sNpMenu.timeYpos:SetPoint('TOP', __sNpMenu.nameYpos, 0, -33)
__sNpMenu.timeYpos:SetMinMaxValues(-55, 55)
__sNpMenu.timeYpos:SetValue(0)
__sNpMenu.timeYpos:SetValueStep(1)
__sNpMenu.timeYpos:SetScript('OnValueChanged', function()
	__sNpConfig.timeYpos = __sNpMenu.timeYpos:GetValue()
end)

	_G[__sNpMenu.timeYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.timeYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.timeYpos:GetName()..'Text']:SetText'Cast Time Y'
	_G[__sNpMenu.timeYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.sbNumXpos = CreateFrame('Slider', 'sNpOptions.sbNumXpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.sbNumXpos:SetWidth(130) __sNpMenu.sbNumXpos:SetHeight(16)
__sNpMenu.sbNumXpos:SetPoint('TOP', __sNpMenu.timeXpos, 0, -33)
__sNpMenu.sbNumXpos:SetMinMaxValues(-125, 125)
__sNpMenu.sbNumXpos:SetValue(0)
__sNpMenu.sbNumXpos:SetValueStep(1)
__sNpMenu.sbNumXpos:SetScript('OnValueChanged', function()
	__sNpConfig.sbNumXpos = __sNpMenu.sbNumXpos:GetValue()
end)

	_G[__sNpMenu.sbNumXpos:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.sbNumXpos:GetName()..'High']:SetText'(|c00b4ff7d>|r)'
	_G[__sNpMenu.sbNumXpos:GetName()..'Text']:SetText'Status Text X'
	_G[__sNpMenu.sbNumXpos:GetName()..'Text']:SetFont(font, fSlider, fLine)
	_G[__sNpMenu.sbNumXpos:GetName()..'Text']:SetTextColor(colour.r, colour.g, colour.b)

__sNpMenu.spellNameYpos = CreateFrame('Slider', 'sNpOptions.spellNameYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.spellNameYpos:SetWidth(130) __sNpMenu.spellNameYpos:SetHeight(16)
__sNpMenu.spellNameYpos:SetPoint('TOP', __sNpMenu.timeYpos, 0, -33)
__sNpMenu.spellNameYpos:SetMinMaxValues(-20, 30)
__sNpMenu.spellNameYpos:SetValue(-3)
__sNpMenu.spellNameYpos:SetValueStep(1)
__sNpMenu.spellNameYpos:SetScript('OnValueChanged', function()
	__sNpConfig.spellNameYpos = __sNpMenu.spellNameYpos:GetValue()
end)

	_G[__sNpMenu.spellNameYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.spellNameYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.spellNameYpos:GetName()..'Text']:SetText'Spell Name Y'
	_G[__sNpMenu.spellNameYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)
	_G[__sNpMenu.spellNameYpos:GetName()..'Text']:SetTextColor(colour.r, colour.g, colour.b)

__sNpMenu.spellIconXpos = CreateFrame('Slider', 'sNpOptions.spellIconXpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.spellIconXpos:SetWidth(130) __sNpMenu.spellIconXpos:SetHeight(16)
__sNpMenu.spellIconXpos:SetPoint('TOP', __sNpMenu.sbNumXpos, 0, -33)
__sNpMenu.spellIconXpos:SetMinMaxValues(-190, 25)
__sNpMenu.spellIconXpos:SetValue(12)
__sNpMenu.spellIconXpos:SetValueStep(1)
__sNpMenu.spellIconXpos:SetScript('OnValueChanged', function()
	__sNpConfig.spellIconXpos = __sNpMenu.spellIconXpos:GetValue()
end)

	_G[__sNpMenu.spellIconXpos:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.spellIconXpos:GetName()..'High']:SetText'(|c00b4ff7d>|r)'
	_G[__sNpMenu.spellIconXpos:GetName()..'Text']:SetText'Spell Icon X'
	_G[__sNpMenu.spellIconXpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.spellIconYpos = CreateFrame('Slider', 'sNpOptions.spellIconYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.spellIconYpos:SetWidth(130) __sNpMenu.spellIconYpos:SetHeight(16)
__sNpMenu.spellIconYpos:SetPoint('TOP', __sNpMenu.spellNameYpos, 0, -33)
__sNpMenu.spellIconYpos:SetMinMaxValues(-30, 45)
__sNpMenu.spellIconYpos:SetValue(0.25)
__sNpMenu.spellIconYpos:SetValueStep(1)
__sNpMenu.spellIconYpos:SetScript('OnValueChanged', function()
	__sNpConfig.spellIconYpos = __sNpMenu.spellIconYpos:GetValue()
end)

	_G[__sNpMenu.spellIconYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.spellIconYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.spellIconYpos:GetName()..'Text']:SetText'Spell Icon Y'
	_G[__sNpMenu.spellIconYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.classIconXpos = CreateFrame('Slider', 'sNpOptions.classIconXpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.classIconXpos:SetWidth(130) __sNpMenu.classIconXpos:SetHeight(16)
__sNpMenu.classIconXpos:SetPoint('TOP', __sNpMenu.spellIconXpos, 0, -33)
__sNpMenu.classIconXpos:SetMinMaxValues(-10, 200)
__sNpMenu.classIconXpos:SetValue(-8)
__sNpMenu.classIconXpos:SetValueStep(1)
__sNpMenu.classIconXpos:SetScript('OnValueChanged', function()
	__sNpConfig.classIconXpos = __sNpMenu.classIconXpos:GetValue()
end)

	_G[__sNpMenu.classIconXpos:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.classIconXpos:GetName()..'High']:SetText'(|c00b4ff7d>|r)'
	_G[__sNpMenu.classIconXpos:GetName()..'Text']:SetText'Class Icon X'
	_G[__sNpMenu.classIconXpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.classIconYpos = CreateFrame('Slider', 'sNpOptions.classIconYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.classIconYpos:SetWidth(130) __sNpMenu.classIconYpos:SetHeight(16)
__sNpMenu.classIconYpos:SetPoint('TOP', __sNpMenu.spellIconYpos, 0, -33)
__sNpMenu.classIconYpos:SetMinMaxValues(-20, 55)
__sNpMenu.classIconYpos:SetValue(10)
__sNpMenu.classIconYpos:SetValueStep(1)
__sNpMenu.classIconYpos:SetScript('OnValueChanged', function()
	__sNpConfig.classIconYpos = __sNpMenu.classIconYpos:GetValue()
end)

	_G[__sNpMenu.classIconYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.classIconYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.classIconYpos:GetName()..'Text']:SetText'Class Icon Y'
	_G[__sNpMenu.classIconYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.hpBarYpos = CreateFrame('Slider', 'sNpOptions.hpBarYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.hpBarYpos:SetWidth(130) __sNpMenu.hpBarYpos:SetHeight(16)
__sNpMenu.hpBarYpos:SetPoint('TOP', __sNpMenu.classIconXpos, 0, -33)
__sNpMenu.hpBarYpos:SetMinMaxValues(-5, 38)
__sNpMenu.hpBarYpos:SetValue(2)
__sNpMenu.hpBarYpos:SetValueStep(1)
__sNpMenu.hpBarYpos:SetScript('OnValueChanged', function()
	__sNpConfig.hpBarYpos = __sNpMenu.hpBarYpos:GetValue()
end)

	_G[__sNpMenu.hpBarYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.hpBarYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.hpBarYpos:GetName()..'Text']:SetText'|c00ffffffHealth High|r'
	_G[__sNpMenu.hpBarYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.cbBarYpos = CreateFrame('Slider', 'sNpOptions.cbBarYpos', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.cbBarYpos:SetWidth(130) __sNpMenu.cbBarYpos:SetHeight(16)
__sNpMenu.cbBarYpos:SetPoint('TOP', __sNpMenu.classIconYpos, 0, -33)
__sNpMenu.cbBarYpos:SetMinMaxValues(-12, 65)
__sNpMenu.cbBarYpos:SetValue(-8)
__sNpMenu.cbBarYpos:SetValueStep(1)
__sNpMenu.cbBarYpos:SetScript('OnValueChanged', function()
	__sNpConfig.cbBarYpos = __sNpMenu.cbBarYpos:GetValue()
end)

	_G[__sNpMenu.cbBarYpos:GetName()..'Low']:SetText'(-)'
	_G[__sNpMenu.cbBarYpos:GetName()..'High']:SetText'(|c00b4ff7d+|r)'
	_G[__sNpMenu.cbBarYpos:GetName()..'Text']:SetText'|c00ffffffCast High|r'
	_G[__sNpMenu.cbBarYpos:GetName()..'Text']:SetFont(font, fSlider, fLine)

--//*******************************************************************//
__sNpMenu.titleMedia = __sNpMenu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
__sNpMenu.titleMedia:SetTextColor(colour.r, colour.g, colour.b)
__sNpMenu.titleMedia:SetPoint('TOP', __sNpMenu.cbBarYpos, -80, -33)
__sNpMenu.titleMedia:SetText'— Size  &  Media —'
__sNpMenu.titleMedia:SetFont(font, fSlider, fLine)
--//*******************************************************************//
__sNpMenu.totemSize = CreateFrame('Slider', 'sNpOptions.totemSize', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.totemSize:SetWidth(130) __sNpMenu.totemSize:SetHeight(16)
__sNpMenu.totemSize:SetPoint('TOP', __sNpMenu.titleMedia, -80, -30)
__sNpMenu.totemSize:SetMinMaxValues(28, 86)
__sNpMenu.totemSize:SetValue(40)
__sNpMenu.totemSize:SetValueStep(1)
__sNpMenu.totemSize:SetScript('OnValueChanged', function()
	__sNpConfig.totemSize = __sNpMenu.totemSize:GetValue()
end)

	_G[__sNpMenu.totemSize:GetName()..'Low']:SetText'S'
	_G[__sNpMenu.totemSize:GetName()..'High']:SetText'|cffFF7D0AXXL|r'
	_G[__sNpMenu.totemSize:GetName()..'Text']:SetText'Totem Icon Size'
	_G[__sNpMenu.totemSize:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.spellSize = CreateFrame('Slider', 'sNpOptions.spellSize', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.spellSize:SetWidth(130) __sNpMenu.spellSize:SetHeight(16)
__sNpMenu.spellSize:SetPoint('TOP', __sNpMenu.totemSize, 160, 0)
__sNpMenu.spellSize:SetMinMaxValues(20, 52)
__sNpMenu.spellSize:SetValue(32)
__sNpMenu.spellSize:SetValueStep(1)
__sNpMenu.spellSize:SetScript('OnValueChanged', function()
	__sNpConfig.spellSize = __sNpMenu.spellSize:GetValue()
end)

	_G[__sNpMenu.spellSize:GetName()..'Low']:SetText'S'
	_G[__sNpMenu.spellSize:GetName()..'High']:SetText'|cffFF7D0AXXL|r'
	_G[__sNpMenu.spellSize:GetName()..'Text']:SetText'Spell Icon Size'
	_G[__sNpMenu.spellSize:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.classSize = CreateFrame('Slider', 'sNpOptions.classSize', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.classSize:SetWidth(130) __sNpMenu.classSize:SetHeight(16)
__sNpMenu.classSize:SetPoint('TOP', __sNpMenu.totemSize, 0, -30)
__sNpMenu.classSize:SetMinMaxValues(20, 52)
__sNpMenu.classSize:SetValue(32)
__sNpMenu.classSize:SetValueStep(1)
__sNpMenu.classSize:SetScript('OnValueChanged', function()
	__sNpConfig.classSize = __sNpMenu.classSize:GetValue()
end)

	_G[__sNpMenu.classSize:GetName()..'Low']:SetText'S'
	_G[__sNpMenu.classSize:GetName()..'High']:SetText'|cffFF7D0AXXL|r'
	_G[__sNpMenu.classSize:GetName()..'Text']:SetText'Class Icon Size'
	_G[__sNpMenu.classSize:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.fontSize = CreateFrame('Slider', 'sNpOptions.fontSize', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.fontSize:SetWidth(130) __sNpMenu.fontSize:SetHeight(16)
__sNpMenu.fontSize:SetPoint('TOP', __sNpMenu.spellSize, 0, -30)
__sNpMenu.fontSize:SetMinMaxValues(10, 28)
__sNpMenu.fontSize:SetValue(14)
__sNpMenu.fontSize:SetValueStep(1)
__sNpMenu.fontSize:SetScript('OnValueChanged', function()
	__sNpConfig.fontSize = __sNpMenu.fontSize:GetValue()
end)

	_G[__sNpMenu.fontSize:GetName()..'Low']:SetText'1'
	_G[__sNpMenu.fontSize:GetName()..'High']:SetText'18'
	_G[__sNpMenu.fontSize:GetName()..'Text']:SetText'Font Size'
	_G[__sNpMenu.fontSize:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.classMedia = CreateFrame('Slider', 'sNpOptions.classMedia', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.classMedia:SetWidth(130) __sNpMenu.classMedia:SetHeight(16)
__sNpMenu.classMedia:SetPoint('TOP', __sNpMenu.classSize, 0, -30)
__sNpMenu.classMedia:SetMinMaxValues(0, 3)
__sNpMenu.classMedia:SetValue(1)
__sNpMenu.classMedia:SetValueStep(1)
__sNpMenu.classMedia:SetScript('OnValueChanged', function()
	__sNpConfig.classMedia = __sNpMenu.classMedia:GetValue()
end)

	_G[__sNpMenu.classMedia:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.classMedia:GetName()..'High']:SetText'(>)'
	_G[__sNpMenu.classMedia:GetName()..'Text']:SetText'|c00ffffffClass Media|r'
	_G[__sNpMenu.classMedia:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.fontMedia = CreateFrame('Slider', 'sNpOptions.fontMedia', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.fontMedia:SetWidth(130) __sNpMenu.fontMedia:SetHeight(16)
__sNpMenu.fontMedia:SetPoint('TOP', __sNpMenu.fontSize, 0, -30)
__sNpMenu.fontMedia:SetMinMaxValues(0, 5)
__sNpMenu.fontMedia:SetValue(0)
__sNpMenu.fontMedia:SetValueStep(1)
__sNpMenu.fontMedia:SetScript('OnValueChanged', function()
	__sNpConfig.fontMedia = __sNpMenu.fontMedia:GetValue()
end)

	_G[__sNpMenu.fontMedia:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.fontMedia:GetName()..'High']:SetText'(>)'
	_G[__sNpMenu.fontMedia:GetName()..'Text']:SetText'|c00ffffffFont Media|r'
	_G[__sNpMenu.fontMedia:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.sbMedia = CreateFrame('Slider', 'sNpOptions.sbMedia', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.sbMedia:SetWidth(130) __sNpMenu.sbMedia:SetHeight(16)
__sNpMenu.sbMedia:SetPoint('TOP', __sNpMenu.classMedia, 0, -30)
__sNpMenu.sbMedia:SetMinMaxValues(0, 7)
__sNpMenu.sbMedia:SetValue(1)
__sNpMenu.sbMedia:SetValueStep(1)
__sNpMenu.sbMedia:SetScript('OnValueChanged', function()
	__sNpConfig.sbMedia = __sNpMenu.sbMedia:GetValue()
end)

	_G[__sNpMenu.sbMedia:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.sbMedia:GetName()..'High']:SetText'(>)'
	_G[__sNpMenu.sbMedia:GetName()..'Text']:SetText'|c00ffffffBar Media|r'
	_G[__sNpMenu.sbMedia:GetName()..'Text']:SetFont(font, fSlider, fLine)

__sNpMenu.tgMedia = CreateFrame('Slider', 'sNpOptions.tgMedia', __sNpMenu, 'OptionsSliderTemplate')
__sNpMenu.tgMedia:SetWidth(130) __sNpMenu.tgMedia:SetHeight(16)
__sNpMenu.tgMedia:SetPoint('TOP', __sNpMenu.fontMedia, 0, -30)
__sNpMenu.tgMedia:SetMinMaxValues(0, 2)
__sNpMenu.tgMedia:SetValue(1)
__sNpMenu.tgMedia:SetValueStep(1)
__sNpMenu.tgMedia:SetScript('OnValueChanged', function()
	__sNpConfig.tgMedia = __sNpMenu.tgMedia:GetValue()
end)

	_G[__sNpMenu.tgMedia:GetName()..'Low']:SetText'(<)'
	_G[__sNpMenu.tgMedia:GetName()..'High']:SetText'(>)'
	_G[__sNpMenu.tgMedia:GetName()..'Text']:SetText'|c00ffffffGlow Media|r'
	_G[__sNpMenu.tgMedia:GetName()..'Text']:SetFont(font, fSlider, fLine)

--//*******************************************************************//
__sNpMenu.resetdefault = CreateFrame('Button', 'sNp.resetdefault', __sNpMenu, 'UIPanelButtonTemplate')
__sNpMenu.resetdefault:SetWidth(100) __sNpMenu.resetdefault:SetHeight(20)
__sNpMenu.resetdefault:SetText'Reset'
__sNpMenu.resetdefault:SetFont(font, fMenu, fLine)
__sNpMenu.resetdefault:SetPoint('TOP', __sNpMenu.tgMedia, -80, -35)
__sNpMenu.resetdefault:SetScript('OnClick', function()
	StaticPopup_Show('DEFAULT_RELOAD')
end)
--//*******************************************************************//
local __sNpFrame = CreateFrame('Frame')
__sNpFrame:RegisterEvent('ADDON_LOADED')
__sNpFrame:SetScript('OnEvent', function()
	if (GetCVar('_sNpCColor') == '1') then __sNpMenu.ClassColor:SetChecked(true) else
		__sNpMenu.ClassColor:SetChecked(false)
	end
	if (GetCVar('_sNpName') == '1') then __sNpMenu.NameHide:SetChecked(true) else
		__sNpMenu.NameHide:SetChecked(false)
	end
	if (GetCVar('_sNpLevel') == '1') then __sNpMenu.LevelShow:SetChecked(true) else
		__sNpMenu.LevelShow:SetChecked(false)
	end
	if (GetCVar('_sNpGlow') == '1') then __sNpMenu.TargetGlow:SetChecked(true) else
		__sNpMenu.TargetGlow:SetChecked(false)
	end
	if (GetCVar('_sNpSBtxt') == '1') then __sNpMenu.SBtext:SetChecked(true) else
		__sNpMenu.SBtext:SetChecked(false)
	end
	if (GetCVar('_sNpFNk') == '1') then __sNpMenu.FormatOnly:SetChecked(true) else
		__sNpMenu.FormatOnly:SetChecked(false)
	end
	if (GetCVar('_sNpFNp') == '1') then __sNpMenu.PercentOnly:SetChecked(true) else
		__sNpMenu.PercentOnly:SetChecked(false)
	end
	if (GetCVar('_sNpBorder') == '1') then __sNpMenu.StatusGlow:SetChecked(true) else
		__sNpMenu.StatusGlow:SetChecked(false)
	end
	if (GetCVar('_sNpCIcon') == '1') then __sNpMenu.ClassIcon:SetChecked(true) else
		__sNpMenu.ClassIcon:SetChecked(false)
	end
	if (GetCVar('_sNpTotem') == '1') then __sNpMenu.TotemIcon:SetChecked(true) else
		__sNpMenu.TotemIcon:SetChecked(false)
	end
	if (GetCVar('_sNpBgHide') == '1') then __sNpMenu.BgHide:SetChecked(true) else
		__sNpMenu.BgHide:SetChecked(false)
	end
	if (GetCVar('_sNpTColor') == '1') then __sNpMenu.TextColor:SetChecked(true) else
		__sNpMenu.TextColor:SetChecked(false)
	end
	if __sNpConfig.hpWidth then __sNpMenu.hpWidth:SetValue(__sNpConfig.hpWidth) else
		__sNpMenu.hpWidth:SetValue(155)
	end
	if __sNpConfig.hpHeight then __sNpMenu.hpHeight:SetValue(__sNpConfig.hpHeight)else
		__sNpMenu.hpHeight:SetValue(20)
	end
	if __sNpConfig.cbWidth then __sNpMenu.cbWidth:SetValue(__sNpConfig.cbWidth) else
		__sNpMenu.cbWidth:SetValue(155)
	end
	if __sNpConfig.cbHeight then __sNpMenu.cbHeight:SetValue(__sNpConfig.cbHeight) else
		__sNpMenu.cbHeight:SetValue(13)
	end
	if __sNpConfig.levelXpos then __sNpMenu.levelXpos:SetValue(__sNpConfig.levelXpos) else
		__sNpMenu.levelXpos:SetValue(-20)
	end
	if __sNpConfig.levelYpos then __sNpMenu.levelYpos:SetValue(__sNpConfig.levelYpos) else
		__sNpMenu.levelYpos:SetValue(1)
	end
	if __sNpConfig.nameXpos then __sNpMenu.nameXpos:SetValue(__sNpConfig.nameXpos) else
		__sNpMenu.nameXpos:SetValue(0)
	end
	if __sNpConfig.nameYpos then __sNpMenu.nameYpos:SetValue(__sNpConfig.nameYpos) else
		__sNpMenu.nameYpos:SetValue(4)
	end
	if __sNpConfig.timeXpos then __sNpMenu.timeXpos:SetValue(__sNpConfig.timeXpos) else
		__sNpMenu.timeXpos:SetValue(-2)
	end
	if __sNpConfig.timeYpos then __sNpMenu.timeYpos:SetValue(__sNpConfig.timeYpos) else
		__sNpMenu.timeYpos:SetValue(0)
	end
	if __sNpConfig.sbNumXpos then __sNpMenu.sbNumXpos:SetValue(__sNpConfig.sbNumXpos) else
		__sNpMenu.sbNumXpos:SetValue(0)
	end
	if __sNpConfig.spellNameYpos then __sNpMenu.spellNameYpos:SetValue(__sNpConfig.spellNameYpos) else
		__sNpMenu.spellNameYpos:SetValue(-3)
	end
	if __sNpConfig.spellIconXpos then __sNpMenu.spellIconXpos:SetValue(__sNpConfig.spellIconXpos) else
		__sNpMenu.spellIconXpos:SetValue(12)
	end
	if __sNpConfig.spellIconYpos then __sNpMenu.spellIconYpos:SetValue(__sNpConfig.spellIconYpos) else
		__sNpMenu.spellIconYpos:SetValue(0.25)
	end
	if __sNpConfig.classIconXpos then __sNpMenu.classIconXpos:SetValue(__sNpConfig.classIconXpos) else
		__sNpMenu.classIconXpos:SetValue(-8)
	end
	if __sNpConfig.classIconYpos then __sNpMenu.classIconYpos:SetValue(__sNpConfig.classIconYpos) else
		__sNpMenu.classIconYpos:SetValue(10)
	end
	if __sNpConfig.hpBarYpos then __sNpMenu.hpBarYpos:SetValue(__sNpConfig.hpBarYpos) else
		__sNpMenu.hpBarYpos:SetValue(2)
	end
	if __sNpConfig.cbBarYpos then __sNpMenu.cbBarYpos:SetValue(__sNpConfig.cbBarYpos) else
		__sNpMenu.cbBarYpos:SetValue(-8)
	end
	if __sNpConfig.totemSize then __sNpMenu.totemSize:SetValue(__sNpConfig.totemSize) else
		__sNpMenu.totemSize:SetValue(40)
	end
	if __sNpConfig.spellSize then __sNpMenu.spellSize:SetValue(__sNpConfig.spellSize) else
		__sNpMenu.spellSize:SetValue(32)
	end
	if __sNpConfig.classSize then __sNpMenu.classSize:SetValue(__sNpConfig.classSize) else
		__sNpMenu.classSize:SetValue(32)
	end
	if __sNpConfig.fontSize then __sNpMenu.fontSize:SetValue(__sNpConfig.fontSize) else
		__sNpMenu.fontSize:SetValue(14)
	end
	if __sNpConfig.classMedia then __sNpMenu.classMedia:SetValue(__sNpConfig.classMedia) else
		sNpOptions.classMedia:SetValue(1)
	end
	if __sNpConfig.fontMedia then __sNpMenu.fontMedia:SetValue(__sNpConfig.fontMedia) else
		sNpOptions.fontMedia:SetValue(2)
	end
	if __sNpConfig.sbMedia then __sNpMenu.sbMedia:SetValue(__sNpConfig.sbMedia) else
		sNpOptions.sbMedia:SetValue(2)
	end
	if __sNpConfig.tgMedia then __sNpMenu.tgMedia:SetValue(__sNpConfig.tgMedia) else
		sNpOptions.tgMedia:SetValue(1)
	end
end)
--//*******************************************************************//
StaticPopupDialogs['DEFAULT_RELOAD'] = {
	text = 'Are you sure want reset to default settings?',
	button1 = 'Yes & Reload',
	button2 = 'Nope',
	OnAccept = function()
	__sNpCore:ResetOptions()
		ReloadUI()
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true
}

fntF = '|c00ff00ff'
fntB = '|c0030d5c8'
fntW = '|c00ccccff'
fntO = '|c00df663d'
fntA = '|c00f0f8ff'

SLASH_SNP_OPTIONS1 = '/snp'
SlashCmdList['SNP_OPTIONS'] = function(arg)
if __sNpMenu:IsShown() then __sNpMenu:Hide() else __sNpMenu:Show() end
	table.insert(UISpecialFrames, __sNpMenu:GetName())
end
	---