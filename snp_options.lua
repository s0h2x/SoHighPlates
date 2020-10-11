	
	local mediaFolder = 'Interface\\AddOns\\SoHighPlates\\media\\'
	local font, fontSizeB, fontSizeS, fontOutline = mediaFolder..'Express.ttf', 13, 12, 'OUTLINE'
	--<*>-----------------------[*]----------------------<*>--
	local badTrip = {
		bgFile   = [[Interface\Tooltips\UI-Tooltip-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
		insets   = {left = 11, right = 12, top = 12, bottom = 11}
	}
	local _, class = UnitClass'player'
	local colour = RAID_CLASS_COLORS[class]
	
	local menu = CreateFrame('Frame', 'snp_options', UIParent)
    menu:SetWidth(365) menu:SetHeight(550)
    menu:SetPoint('CENTER', UIParent)
    menu:SetBackdrop(badTrip)
    menu:SetBackdropColor(0, 0, 0, .9)
    menu:SetBackdropBorderColor(.7, .7, .7)
    menu:SetMovable(true) menu:SetUserPlaced(true)
	menu:SetFrameLevel(menu:GetFrameLevel() + 3)
    menu:RegisterForDrag'LeftButton' menu:EnableMouse(true)
    menu:SetScript('OnDragStart', function() menu:StartMoving() end)
    menu:SetScript('OnDragStop', function() menu:StopMovingOrSizing() end)
    menu:Hide()

	menu.x = CreateFrame('Button', 'snp_optionsCloseButton', menu, 'UIPanelCloseButton')
    menu.x:SetPoint('TOPRIGHT', -6, -6)
    menu.x:SetScript('OnClick', function() menu:Hide() end)

	menu.header = menu:CreateTexture(nil, 'ARTWORK')
    menu.header:SetWidth(256) menu.header:SetHeight(64)
    menu.header:SetPoint('TOP', menu, 0, 12)
    menu.header:SetTexture[[Interface\DialogFrame\UI-DialogBox-Header]]
    menu.header:SetVertexColor(.2, .2, .2)

	menu.header.t = menu:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
    menu.header.t:SetPoint('TOP', menu.header, 0, -14)
	menu.header.t:SetFont(font, fontSizeB, fontOutline)
    menu.header.t:SetText'— Options —'

	menu.intro = menu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    --menu.intro:SetTextColor(colour.r, colour.g, colour.b)
    menu.intro:SetPoint('TOP', menu, 0, -35)
    menu.intro:SetWidth(280)
	menu.intro:SetFont(font, 15, fontOutline)
    menu.intro:SetText'|c00ffffff**|r |c00ff00ffSoHigh|r|c0030d5c8Plates|r v2.|c00eddaff2b|r |c00ffffff**|r'
	
	menu.secondintro = menu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.secondintro:SetPoint('TOP', menu, 0, -60)
    menu.secondintro:SetWidth(280)
	menu.secondintro:SetFont(font, 13, fontOutline)
    menu.secondintro:SetText'|c00eddaffThis is beta version, please report issues to:|r'
	
	menu.uilink = CreateFrame('EditBox', 'snp_uilink', menu, 'InputBoxTemplate')
    menu.uilink:SetFont(font, fontSizeB, fontOutline)
    menu.uilink:SetWidth(250)
	menu.uilink:SetHeight(12)
    menu.uilink:SetPoint('TOP', menu.intro, 'BOTTOM', 0, -35)
    menu.uilink:SetAutoFocus(false)
    --menu.uilink:SetScript('OnShow', function()
    menu.uilink:SetText'https://github.com/sativahigh/SoHigh_Nameplates'
    --end)
	
    menu.title = menu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.title:SetPoint('TOP', menu.uilink, 0, -28)
    menu.title:SetText'— Main Settings —'

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CLASS COLORS CHECKBUTTON`	  ~ // --<*>--
	menu.ClassColor = CreateFrame('CheckButton', 'snp_ClassColor ', menu, 'UICheckButtonTemplate')
    menu.ClassColor:SetHeight(20) menu.ClassColor:SetWidth(20)
    menu.ClassColor:SetPoint('TOPLEFT', menu, 20, -125)
	_G[menu.ClassColor:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.ClassColor:GetName()..'Text']:SetWidth(270)
    _G[menu.ClassColor:GetName()..'Text']:SetPoint('LEFT', menu.ClassColor, 'RIGHT', 4, 0)
	_G[menu.ClassColor:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.ClassColor:GetName()..'Text']:SetText'Class Colors'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`HIDE NAMES CHECKBUTTON`	  ~ // --<*>--
	menu.hideName = CreateFrame('CheckButton', 'snp_hideName ', menu, 'UICheckButtonTemplate')
    menu.hideName:SetHeight(20) menu.hideName:SetWidth(20)
    menu.hideName:SetPoint('TOPLEFT', menu.ClassColor, 0, -20)
	_G[menu.hideName:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.hideName:GetName()..'Text']:SetWidth(270)
    _G[menu.hideName:GetName()..'Text']:SetPoint('LEFT', menu.hideName, 'RIGHT', 4, 0)
	_G[menu.hideName:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.hideName:GetName()..'Text']:SetText'Hide Name'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--     // ~	`LEVEL CHECKBUTTON`	~	//     --<*>--
	menu.level = CreateFrame('CheckButton', 'snp_level', menu, 'UICheckButtonTemplate')
    menu.level:SetHeight(20) menu.level:SetWidth(20)
    menu.level:SetPoint('TOPLEFT', menu.hideName, 0, -20)
	_G[menu.level:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.level:GetName()..'Text']:SetWidth(270)
    _G[menu.level:GetName()..'Text']:SetPoint('LEFT', menu.level, 'RIGHT', 4, 0)
	_G[menu.level:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.level:GetName()..'Text']:SetText'Show Level'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`HEALTH VALUE CHECKBUTTON`	  ~ // --<*>--
	menu.SBtext = CreateFrame('CheckButton', 'snp_SBtext', menu, 'UICheckButtonTemplate')
    menu.SBtext:SetHeight(20) menu.SBtext:SetWidth(20)
    menu.SBtext:SetPoint('TOPLEFT', menu, 123, -125)
	_G[menu.SBtext:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.SBtext:GetName()..'Text']:SetWidth(270)
    _G[menu.SBtext:GetName()..'Text']:SetPoint('LEFT', menu.SBtext, 'RIGHT', 4, 0)
	_G[menu.SBtext:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.SBtext:GetName()..'Text']:SetText'Show |c00df663dSB|r Text'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`HEALTH FORMAT CHECKBUTTON`	  ~ // --<*>--
	menu.FormatOnly = CreateFrame('CheckButton', 'snp_FormatOnly', menu, 'UICheckButtonTemplate')
    menu.FormatOnly:SetHeight(20) menu.FormatOnly:SetWidth(20)
    menu.FormatOnly:SetPoint('TOPLEFT', menu.SBtext, 0, -20)
	_G[menu.FormatOnly:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.FormatOnly:GetName()..'Text']:SetWidth(270)
    _G[menu.FormatOnly:GetName()..'Text']:SetPoint('LEFT', menu.FormatOnly, 'RIGHT', 4, 0)
	_G[menu.FormatOnly:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.FormatOnly:GetName()..'Text']:SetText'Show Only |c00bce4d0k|r'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`HP PERCENT CHECKBUTTON`	  ~ // --<*>--
	menu.PercentOnly = CreateFrame('CheckButton', 'snp_PercentOnly ', menu, 'UICheckButtonTemplate')
    menu.PercentOnly:SetHeight(20) menu.PercentOnly:SetWidth(20)
    menu.PercentOnly:SetPoint('TOPLEFT', menu.FormatOnly, 0, -20)
	_G[menu.PercentOnly:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.PercentOnly:GetName()..'Text']:SetWidth(270)
    _G[menu.PercentOnly:GetName()..'Text']:SetPoint('LEFT', menu.PercentOnly, 'RIGHT', 4, 0)
	_G[menu.PercentOnly:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.PercentOnly:GetName()..'Text']:SetText'Show Only |c00b4ff7d%|r'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CLASS ICON CHECKBUTTON`	  ~ // --<*>--
	menu.ClassIcon = CreateFrame('CheckButton', 'snp_ClassIcon', menu, 'UICheckButtonTemplate')
    menu.ClassIcon:SetHeight(20) menu.ClassIcon:SetWidth(20)
    menu.ClassIcon:SetPoint('TOPLEFT', menu, 239, -125)
	_G[menu.ClassIcon:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.ClassIcon:GetName()..'Text']:SetWidth(270)
    _G[menu.ClassIcon:GetName()..'Text']:SetPoint('LEFT', menu.ClassIcon, 'RIGHT', 4, 0)
	_G[menu.ClassIcon:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.ClassIcon:GetName()..'Text']:SetText'Class Icons'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`TOTEM ICON CHECKBUTTON`	  ~ // --<*>--
	menu.TotemIcon = CreateFrame('CheckButton', 'snp_TotemIcon', menu, 'UICheckButtonTemplate')
    menu.TotemIcon:SetHeight(20) menu.TotemIcon:SetWidth(20)
    menu.TotemIcon:SetPoint('TOPLEFT', menu.ClassIcon, 0, -20)
	_G[menu.TotemIcon:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.TotemIcon:GetName()..'Text']:SetWidth(270)
    _G[menu.TotemIcon:GetName()..'Text']:SetPoint('LEFT', menu.TotemIcon, 'RIGHT', 4, 0)
	_G[menu.TotemIcon:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.TotemIcon:GetName()..'Text']:SetText'Totem Icons'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CLASS FLAT CHECKBUTTON`	  ~ // --<*>--
	menu.ClassFlat = CreateFrame('CheckButton', 'snp_ClassFlat ', menu, 'UICheckButtonTemplate')
    menu.ClassFlat:SetHeight(20) menu.ClassFlat:SetWidth(20)
    menu.ClassFlat:SetPoint('TOPLEFT', menu.TotemIcon, 0, -20)
	_G[menu.ClassFlat:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.ClassFlat:GetName()..'Text']:SetWidth(270)
    _G[menu.ClassFlat:GetName()..'Text']:SetPoint('LEFT', menu.ClassFlat, 'RIGHT', 4, 0)
	_G[menu.ClassFlat:GetName()..'Text']:SetFont(font, fontSizeB, fontOutline)
    _G[menu.ClassFlat:GetName()..'Text']:SetText'Flat Class'
	
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`ONCLICK BUTTON FUNCTIONS`	  ~ // --<*>--
	
	menu.ClassColor:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpClassColor', 1, true)
			--reload_request();
		else
			SetCVar('snpClassColor', 0, false)
			--reload_request();
		end
    end)
	
	menu.hideName:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snphideName', 1, true)
			--reload_request();
		else
			SetCVar('snphideName', 0, false)
			--reload_request();
		end
    end)
	
	menu.level:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snplevel', 1, true)
			--reload_request();
		else
			SetCVar('snplevel', 0, false)
			--reload_request();
		end
    end)
	
	menu.SBtext:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpSBtext', 1, true)
			reload_request();
		else
			SetCVar('snpSBtext', 0, false)
			reload_request();
		end
    end)
	
	menu.FormatOnly:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpFormatOnly', 1, true)
			reload_request();
		else
			SetCVar('snpFormatOnly', 0, false)
			reload_request();
		end
    end)
	
	menu.PercentOnly:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpPercentOnly', 1, true)
			reload_request();
		else
			SetCVar('snpPercentOnly', 0, false)
			reload_request();
		end
    end)
	
	menu.ClassIcon:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpClassIcon', 1, true)
			--reload_request();
		else
			SetCVar('snpClassIcon', 0, false)
			--reload_request();
		end
    end)
	
	menu.TotemIcon:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpTotemIcon', 1, true)
			reload_request();
		else
			SetCVar('snpTotemIcon', 0, false)
			reload_request();
		end
    end)
	
	menu.ClassFlat:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
			SetCVar('snpClassFlat', 1, true)
			--reload_request();
		else
			SetCVar('snpClassFlat', 0, false)
			--reload_request();
		end
    end)
	
	--<*>----------------[SLIDER OPTIONS]----------------<*>--
	--<*>--	// ~	`HEALTH BAR WIDTH SLIDER`	  ~ // --<*>--
	menu.hpWidth = CreateFrame('Slider', 'snp_optionshpWidth', menu, 'OptionsSliderTemplate')
    menu.hpWidth:SetWidth(130)
	menu.hpWidth:SetHeight(16)
    menu.hpWidth:SetPoint('TOP', menu, -80, -210)
    menu.hpWidth:SetMinMaxValues(105, 180)
    menu.hpWidth:SetValue(135)
    menu.hpWidth:SetValueStep(1)
    menu.hpWidth:SetScript('OnValueChanged', function()

		snpCFG.hpWidth = menu.hpWidth:GetValue(); 
    end)

    _G[menu.hpWidth:GetName()..'Low']:SetText'1'
    _G[menu.hpWidth:GetName()..'High']:SetText'75'
    _G[menu.hpWidth:GetName()..'Text']:SetText'Health Bar Width'
	_G[menu.hpWidth:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`HEALTH BAR HEIGHT SLIDER`	  ~ // --<*>--
	menu.hpHeight = CreateFrame('Slider', 'snp_optionshpHeight', menu, 'OptionsSliderTemplate')
    menu.hpHeight:SetWidth(130)
	menu.hpHeight:SetHeight(16)
    menu.hpHeight:SetPoint('TOP', menu.hpWidth, 160, 0)
    menu.hpHeight:SetMinMaxValues(10, 40)
    menu.hpHeight:SetValue(17)
    menu.hpHeight:SetValueStep(1)
    menu.hpHeight:SetScript('OnValueChanged', function()

		snpCFG.hpHeight = menu.hpHeight:GetValue(); 
    end)

    _G[menu.hpHeight:GetName()..'Low']:SetText'1'
    _G[menu.hpHeight:GetName()..'High']:SetText'30'
    _G[menu.hpHeight:GetName()..'Text']:SetText'Health Bar Height'
	_G[menu.hpHeight:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CASTED BAR WIDTH SLIDER`	  ~ // --<*>--
	menu.cbWidth = CreateFrame('Slider', 'snp_optionscbWidth', menu, 'OptionsSliderTemplate')
    menu.cbWidth:SetWidth(130) 
	menu.cbWidth:SetHeight(16)
    menu.cbWidth:SetPoint('TOP', menu.hpWidth, 0, -30)
    menu.cbWidth:SetMinMaxValues(105, 180)
    menu.cbWidth:SetValue(135)
    menu.cbWidth:SetValueStep(1)
    menu.cbWidth:SetScript('OnValueChanged', function()

		snpCFG.cbWidth = menu.cbWidth:GetValue(); 
    end)

    _G[menu.cbWidth:GetName()..'Low']:SetText'1'
    _G[menu.cbWidth:GetName()..'High']:SetText'75'
    _G[menu.cbWidth:GetName()..'Text']:SetText'Cast Bar Width'
	_G[menu.cbWidth:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CAST BAR HEIGHT SLIDER`	  ~ // --<*>--
	menu.cbHeight = CreateFrame('Slider', 'snp_optionscbHeight', menu, 'OptionsSliderTemplate')
    menu.cbHeight:SetWidth(130)
	menu.cbHeight:SetHeight(16)
    menu.cbHeight:SetPoint('TOP', menu.hpHeight, 0, -30)
    menu.cbHeight:SetMinMaxValues(10, 40)
    menu.cbHeight:SetValue(13)
    menu.cbHeight:SetValueStep(1)
    menu.cbHeight:SetScript('OnValueChanged', function()

		snpCFG.cbHeight = menu.cbHeight:GetValue(); 
    end)

    _G[menu.cbHeight:GetName()..'Low']:SetText'1'
    _G[menu.cbHeight:GetName()..'High']:SetText'30'
    _G[menu.cbHeight:GetName()..'Text']:SetText'Cast Bar Height'
	_G[menu.cbHeight:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)
	
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`LEVEL X POSITION SLIDER`	  ~ // --<*>--
	menu.levelXpos = CreateFrame('Slider', 'snp_optionslevelXpos', menu, 'OptionsSliderTemplate')
    menu.levelXpos:SetWidth(130)
	menu.levelXpos:SetHeight(16)
    menu.levelXpos:SetPoint('TOP', menu.cbWidth, 0, -30)
    menu.levelXpos:SetMinMaxValues(-200, 10)
    menu.levelXpos:SetValue(-20)
    menu.levelXpos:SetValueStep(1)
    menu.levelXpos:SetScript('OnValueChanged', function()

		snpCFG.levelXpos = menu.levelXpos:GetValue();
    end)

    _G[menu.levelXpos:GetName()..'Low']:SetText'(-)'
    _G[menu.levelXpos:GetName()..'High']:SetText'(+)'
    _G[menu.levelXpos:GetName()..'Text']:SetText'Level position X'
	_G[menu.levelXpos:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`LEVEL Y POSITION SLIDER`	  ~ // --<*>--
	menu.levelYpos = CreateFrame('Slider', 'snp_optionslevelYpos', menu, 'OptionsSliderTemplate')
    menu.levelYpos:SetWidth(130)
	menu.levelYpos:SetHeight(16)
    menu.levelYpos:SetPoint('TOP', menu.cbHeight, 0, -30)
    menu.levelYpos:SetMinMaxValues(-35, 65)
    menu.levelYpos:SetValue(2)
    menu.levelYpos:SetValueStep(1)
    menu.levelYpos:SetScript('OnValueChanged', function()

		snpCFG.levelYpos = menu.levelYpos:GetValue(); 
    end)

    _G[menu.levelYpos:GetName()..'Low']:SetText'(-)'
    _G[menu.levelYpos:GetName()..'High']:SetText'(+)'
    _G[menu.levelYpos:GetName()..'Text']:SetText'Level position Y'
	_G[menu.levelYpos:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CASTNAME Y POSS SLIDER`	  ~ // --<*>--
	menu.cbNameY = CreateFrame('Slider', 'snp_optionscbNameY', menu, 'OptionsSliderTemplate')
    menu.cbNameY:SetWidth(130)
	menu.cbNameY:SetHeight(16)
    menu.cbNameY:SetPoint('TOP', menu.levelXpos, 0, -30)
    menu.cbNameY:SetMinMaxValues(-20, 30)
    menu.cbNameY:SetValue(-3)
    menu.cbNameY:SetValueStep(0.1)
    menu.cbNameY:SetScript('OnValueChanged', function()

		snpCFG.cbNameY = menu.cbNameY:GetValue(); 
    end)

    _G[menu.cbNameY:GetName()..'Low']:SetText'(-)'
    _G[menu.cbNameY:GetName()..'High']:SetText'(+)'
    _G[menu.cbNameY:GetName()..'Text']:SetText'Cast SpellName Y'
	_G[menu.cbNameY:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`NAME X POSITION SLIDER`	  ~ // --<*>--
	--[[menu.nameXpos = CreateFrame('Slider', 'snp_optionsnameXpos', menu, 'OptionsSliderTemplate')
    menu.nameXpos:SetWidth(130)
	menu.nameXpos:SetHeight(16)
    menu.nameXpos:SetPoint('TOP', menu.levelXpos, 0, -30)
    menu.nameXpos:SetMinMaxValues(-15, 15)
    menu.nameXpos:SetValue(0)
    menu.nameXpos:SetValueStep(0.1)
    menu.nameXpos:SetScript('OnValueChanged', function()

		snpCFG.nameXpos = menu.nameXpos:GetValue(); 
    end)

    _G[menu.nameXpos:GetName()..'Low']:SetText'(-)'
    _G[menu.nameXpos:GetName()..'High']:SetText'(+)'
    _G[menu.nameXpos:GetName()..'Text']:SetText'Name position X'
	_G[menu.nameXpos:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)--]]

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`NAME Y POSITION SLIDER`	  ~ // --<*>--
	menu.nameYpos = CreateFrame('Slider', 'snp_optionsnameYpos', menu, 'OptionsSliderTemplate')
    menu.nameYpos:SetWidth(130)
	menu.nameYpos:SetHeight(16)
    menu.nameYpos:SetPoint('TOP', menu.levelYpos, 0, -30)
    menu.nameYpos:SetMinMaxValues(-7, 8)
    menu.nameYpos:SetValue(4)
    menu.nameYpos:SetValueStep(0.1)
    menu.nameYpos:SetScript('OnValueChanged', function()

		snpCFG.nameYpos = menu.nameYpos:GetValue(); 
    end)

    _G[menu.nameYpos:GetName()..'Low']:SetText'(-)'
    _G[menu.nameYpos:GetName()..'High']:SetText'(+)'
    _G[menu.nameYpos:GetName()..'Text']:SetText'Name position Y'
	_G[menu.nameYpos:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CASTTIME X POSS SLIDER`	  ~ // --<*>--
	menu.timeXpos = CreateFrame('Slider', 'snp_optionstimeXpos', menu, 'OptionsSliderTemplate')
    menu.timeXpos:SetWidth(130)
	menu.timeXpos:SetHeight(16)
    menu.timeXpos:SetPoint('TOP', menu.cbNameY, 0, -30)
    menu.timeXpos:SetMinMaxValues(-55, 195)
    menu.timeXpos:SetValue(-2)
    menu.timeXpos:SetValueStep(1)
    menu.timeXpos:SetScript('OnValueChanged', function()

		snpCFG.timeXpos = menu.timeXpos:GetValue(); 
    end)

    _G[menu.timeXpos:GetName()..'Low']:SetText'(-)'
    _G[menu.timeXpos:GetName()..'High']:SetText'(+)'
    _G[menu.timeXpos:GetName()..'Text']:SetText'Cast Time X'
	_G[menu.timeXpos:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`CASTTIME Y POSS SLIDER`	  ~ // --<*>--
	menu.timeYpos = CreateFrame('Slider', 'snp_optionstimeYpos', menu, 'OptionsSliderTemplate')
    menu.timeYpos:SetWidth(130)
	menu.timeYpos:SetHeight(16)
    menu.timeYpos:SetPoint('TOP', menu.nameYpos, 0, -30)
    menu.timeYpos:SetMinMaxValues(-55, 55)
    menu.timeYpos:SetValue(0)
    menu.timeYpos:SetValueStep(1)
    menu.timeYpos:SetScript('OnValueChanged', function()

		snpCFG.timeYpos = menu.timeYpos:GetValue(); 
    end)

    _G[menu.timeYpos:GetName()..'Low']:SetText'(-)'
    _G[menu.timeYpos:GetName()..'High']:SetText'(+)'
    _G[menu.timeYpos:GetName()..'Text']:SetText'Cast Time Y'
	_G[menu.timeYpos:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`FONT SWAP FOR ALL PLATES`	  ~ // --<*>--
	menu.fontMedia = CreateFrame('Slider', 'snp_optionsfontMedia', menu, 'OptionsSliderTemplate')
    menu.fontMedia:SetWidth(130)
	menu.fontMedia:SetHeight(16)
    menu.fontMedia:SetPoint('TOP', menu.timeXpos, 0, -30)
    menu.fontMedia:SetMinMaxValues(0, 2)
    menu.fontMedia:SetValue(0)
    menu.fontMedia:SetValueStep(1)
    menu.fontMedia:SetScript('OnValueChanged', function()

		snpCFG.fontMedia = menu.fontMedia:GetValue();
    end)

    _G[menu.fontMedia:GetName()..'Low']:SetText'1'
    _G[menu.fontMedia:GetName()..'High']:SetText'3'
    _G[menu.fontMedia:GetName()..'Text']:SetText'Font Media'
	_G[menu.fontMedia:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`FONT SIZE FOR ALL PLATES`	  ~ // --<*>--
	menu.fontSize = CreateFrame('Slider', 'snp_optionsfontSize', menu, 'OptionsSliderTemplate')
    menu.fontSize:SetWidth(130)
	menu.fontSize:SetHeight(16)
    menu.fontSize:SetPoint('TOP', menu.timeYpos, 0, -30)
    menu.fontSize:SetMinMaxValues(10, 28)
    menu.fontSize:SetValue(14)
    menu.fontSize:SetValueStep(1)
    menu.fontSize:SetScript('OnValueChanged', function()

		snpCFG.fontSize = menu.fontSize:GetValue();
    end)

    _G[menu.fontSize:GetName()..'Low']:SetText'1'
    _G[menu.fontSize:GetName()..'High']:SetText'18'
    _G[menu.fontSize:GetName()..'Text']:SetText'Font Size'
	_G[menu.fontSize:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)

	--<*>-----------------------[*]----------------------<*>--
    menu.secondtitle = menu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.secondtitle:SetTextColor(colour.r, colour.g, colour.b)
    menu.secondtitle:SetPoint('TOP', menu.fontSize, -80, -28)
    menu.secondtitle:SetText'— Extra Settings —'
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`ICON CLASS SIZE (EXTRA)`	  ~ // --<*>--
	menu.iconClassSize = CreateFrame('Slider', 'snp_optionsiconClassSize', menu, 'OptionsSliderTemplate')
    menu.iconClassSize:SetWidth(130)
	menu.iconClassSize:SetHeight(16)
    menu.iconClassSize:SetPoint('TOP', menu.secondtitle, -80, -25)
    menu.iconClassSize:SetMinMaxValues(20, 52)
    menu.iconClassSize:SetValue(32)
    menu.iconClassSize:SetValueStep(1)
    menu.iconClassSize:SetScript('OnValueChanged', function()

		snpCFG.iconClassSize = menu.iconClassSize:GetValue();
    end)

    _G[menu.iconClassSize:GetName()..'Low']:SetText'1'
    _G[menu.iconClassSize:GetName()..'High']:SetText'32'
    _G[menu.iconClassSize:GetName()..'Text']:SetText'Class Icon Size'
	_G[menu.iconClassSize:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`ICON SPELL SIZE (EXTRA)`	  ~ // --<*>--
	menu.iconSpellSize = CreateFrame('Slider', 'snp_optionsiconSpellSize', menu, 'OptionsSliderTemplate')
    menu.iconSpellSize:SetWidth(130)
	menu.iconSpellSize:SetHeight(16)
    menu.iconSpellSize:SetPoint('TOP', menu.iconClassSize, 160, 0)
    menu.iconSpellSize:SetMinMaxValues(20, 52)
    menu.iconSpellSize:SetValue(36)
    menu.iconSpellSize:SetValueStep(1)
    menu.iconSpellSize:SetScript('OnValueChanged', function()

		snpCFG.iconSpellSize = menu.iconSpellSize:GetValue();
    end)

    _G[menu.iconSpellSize:GetName()..'Low']:SetText'1'
    _G[menu.iconSpellSize:GetName()..'High']:SetText'32'
    _G[menu.iconSpellSize:GetName()..'Text']:SetText'Spell Icon Size'
	_G[menu.iconSpellSize:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`ICON TOTEM SIZE (EXTRA)`	  ~ // --<*>--
	menu.iconTotemSize = CreateFrame('Slider', 'snp_optionsiconTotemSize', menu, 'OptionsSliderTemplate')
    menu.iconTotemSize:SetWidth(130)
	menu.iconTotemSize:SetHeight(16)
    menu.iconTotemSize:SetPoint('TOP', menu.iconClassSize, 0, -30)
    menu.iconTotemSize:SetMinMaxValues(28, 86)
    menu.iconTotemSize:SetValue(46)
    menu.iconTotemSize:SetValueStep(1)
    menu.iconTotemSize:SetScript('OnValueChanged', function()

		snpCFG.iconTotemSize = menu.iconTotemSize:GetValue();
    end)

    _G[menu.iconTotemSize:GetName()..'Low']:SetText'Small'
    _G[menu.iconTotemSize:GetName()..'High']:SetText'Large'
    _G[menu.iconTotemSize:GetName()..'Text']:SetText'Totem Icon Size'
	_G[menu.iconTotemSize:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`TEXTURE BAR SWAP (EXTRA)`	  ~ // --<*>--
	menu.mediaSBtexture = CreateFrame('Slider', 'snp_optionsmediaSBtexture', menu, 'OptionsSliderTemplate')
    menu.mediaSBtexture:SetWidth(130)
	menu.mediaSBtexture:SetHeight(16)
    menu.mediaSBtexture:SetPoint('TOP', menu.iconSpellSize, 0, -30)
    menu.mediaSBtexture:SetMinMaxValues(0, 1)
    menu.mediaSBtexture:SetValue(1)
    menu.mediaSBtexture:SetValueStep(1)
    menu.mediaSBtexture:SetScript('OnValueChanged', function()
	--menu.mediaSBtexture:SetScript('OnValueChanged', mediaSB)

		snpCFG.mediaSBtexture = menu.mediaSBtexture:GetValue();
    end)
	--menu.mediaSBtexture:Hide()

    _G[menu.mediaSBtexture:GetName()..'Low']:SetText'Smooth'
    _G[menu.mediaSBtexture:GetName()..'High']:SetText'Clean'
    _G[menu.mediaSBtexture:GetName()..'Text']:SetText'Media StatusBar'
	_G[menu.mediaSBtexture:GetName()..'Text']:SetFont(font, fontSizeS, fontOutline)
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`RESET TO DEFAULT BUTTON`	  ~ // --<*>--
	menu.resetdefault = CreateFrame('Button', 'snp_resetdefault', menu, 'UIPanelButtonTemplate')
    menu.resetdefault:SetWidth(100)
	menu.resetdefault:SetHeight(20)
    menu.resetdefault:SetText'Reset'
    menu.resetdefault:SetFont(font, fontSizeB, fontOutline)
    menu.resetdefault:SetPoint('TOP', menu.iconTotemSize, 80, -30)

	menu.resetdefault:SetScript('OnClick', function()
        StaticPopup_Show('DEFAULT_RELOAD');
    end)
	
	--<*>-----------------------[*]----------------------<*>--
	--<*>--	// ~	`	RELOAD UI BUTTON	`	  ~ // --<*>--
	menu.reload = CreateFrame('Button', 'snp_optionsreload', menu, 'UIPanelButtonTemplate')
    menu.reload:SetWidth(100)
	menu.reload:SetHeight(20)
    menu.reload:SetText'Reload UI'
    menu.reload:SetFont(font, fontSizeB, fontOutline)
    menu.reload:SetPoint('TOP', menu.resetdefault, 0, -25)
    menu.reload:Hide()

	function reload_request()
		menu.reload:Show();
		menu:SetHeight(570);
	end

	menu.reload.description = menu.reload:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.reload.description:SetPoint('TOP', menu.reload, 0, -25)
    menu.reload.description:SetWidth(200)
	menu.reload.description:SetFont(font, 12, fontOutline)
    menu.reload.description:SetText'Your new settings require a UI Reload to take effect.'--SHIFT+V can to take effect too.

	menu.reload:SetScript('OnClick', ReloadUI)
	
	local snpframe = CreateFrame'Frame'
	snpframe:RegisterEvent'ADDON_LOADED'
    snpframe:SetScript('OnEvent', function()
		
		if (GetCVar('snpClassColor') == '1') then	menu.ClassColor:SetChecked(true) else 
			menu.ClassColor:SetChecked(false) end
		
		if (GetCVar('snphideName') == '1') then	menu.hideName:SetChecked(true) else
			menu.hideName:SetChecked(false) end
		
		if (GetCVar('snplevel') == '1') then	menu.level:SetChecked(true) else
			menu.level:SetChecked(false) end
		
		if (GetCVar('snpSBtext') == '1') then	menu.SBtext:SetChecked(true) else
			menu.SBtext:SetChecked(false) end
		
		if (GetCVar('snpFormatOnly') == '1') then	menu.FormatOnly:SetChecked(true) else
			menu.FormatOnly:SetChecked(false) end
		
		if (GetCVar('snpPercentOnly') == '1') then	menu.PercentOnly:SetChecked(true) else
			menu.PercentOnly:SetChecked(false) end

		if (GetCVar('snpClassIcon') == '1') then	menu.ClassIcon:SetChecked(true) else
			menu.ClassIcon:SetChecked(false) end
		
		if (GetCVar('snpTotemIcon') == '1') then	menu.TotemIcon:SetChecked(true) else
			menu.TotemIcon:SetChecked(false) end
		
		if (GetCVar('snpClassFlat') == '1') then	menu.ClassFlat:SetChecked(true) else
			menu.ClassFlat:SetChecked(false) end
		
		if snpCFG.hpWidth then	menu.hpWidth:SetValue(snpCFG.hpWidth) else
			menu.hpWidth:SetValue(135) end
		
		if snpCFG.hpHeight then	menu.hpHeight:SetValue(snpCFG.hpHeight)	else
			menu.hpHeight:SetValue(17) end
		
		if snpCFG.cbWidth then	menu.cbWidth:SetValue(snpCFG.cbWidth) else
			menu.cbWidth:SetValue(135) end
		
		if snpCFG.cbHeight then	menu.cbHeight:SetValue(snpCFG.cbHeight) else
			menu.cbHeight:SetValue(17) end
		
		if snpCFG.levelXpos then	menu.levelXpos:SetValue(snpCFG.levelXpos) else
			menu.levelXpos:SetValue(-20) end
		
		if snpCFG.levelYpos then	menu.levelYpos:SetValue(snpCFG.levelYpos) else
			menu.levelYpos:SetValue(2) end
		
		--[[if snpCFG.nameXpos then	menu.nameXpos:SetValue(snpCFG.nameXpos) else
			menu.nameXpos:SetValue(0) end--]]
		
		if snpCFG.nameYpos then	menu.nameYpos:SetValue(snpCFG.nameYpos) else
			menu.nameYpos:SetValue(4) end
		
		if snpCFG.cbNameY then	menu.cbNameY:SetValue(snpCFG.cbNameY) else
			menu.cbNameY:SetValue(-3) end
		
		if snpCFG.timeXpos then	menu.timeXpos:SetValue(snpCFG.timeXpos) else
			menu.timeXpos:SetValue(-2) end
		
		if snpCFG.timeYpos then	menu.timeYpos:SetValue(snpCFG.timeYpos) else
			menu.timeYpos:SetValue(0) end
			
		if snpCFG.fontMedia then	menu.fontMedia:SetValue(snpCFG.fontMedia) else
			snp_optionsfontMedia:SetValue(1) end
		
		if snpCFG.fontSize then	menu.fontSize:SetValue(snpCFG.fontSize) else
			menu.fontSize:SetValue(13) end
		
		if snpCFG.iconClassSize then	menu.iconClassSize:SetValue(snpCFG.iconClassSize) else
			menu.iconClassSize:SetValue(32) end
		
		if snpCFG.iconSpellSize then	menu.iconSpellSize:SetValue(snpCFG.iconSpellSize) else
			menu.iconSpellSize:SetValue(32) end
		
		if snpCFG.iconTotemSize then	menu.iconTotemSize:SetValue(snpCFG.iconTotemSize) else
			menu.iconTotemSize:SetValue(46) end
			
		if snpCFG.mediaSBtexture then	menu.mediaSBtexture:SetValue(snpCFG.mediaSBtexture) else
			snp_optionsmediaSBtexture:SetValue(0) end
    end)
	--<*>-----------------------[*]----------------------<*>--
	StaticPopupDialogs['DEFAULT_RELOAD'] = {
	text = 'Are you sure want to RESET DEFAULT settings?',
	button1 = 'Yes, Reload UI',
	button2 = 'Nope',
	OnAccept = function()
		Reset_Options();
		ReloadUI();
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
        if menu:IsShown() then menu:Hide() else menu:Show() end
		table.insert(UISpecialFrames, menu:GetName())-- ESC
    end

	--<*>--	// ~	`SoHigh 2020 (c) Discord #3333`	  ~ // --<*>--
	--<*>--	// ~		`Special thx to Ko0z`	  	  ~ // --<*>--