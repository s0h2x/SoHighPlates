local __sNpCore = CreateFrame('Frame', '__sNpCore')
_G['__sNpCore'] = __sNpCore

__sNpCore.mediaFolder = 'Interface\\AddOns\\SoHighPlates\\media\\'
__sNpCore.art = {
    textures = {
		bar = {
			smooth = {__sNpCore.mediaFolder..'__sNpTexturebarSmooth'},
			clean = {__sNpCore.mediaFolder..'__sNpTexturebarClean'},
			black = {__sNpCore.mediaFolder..'__sNpTexturebarBlack'},
			shadow = {__sNpCore.mediaFolder..'__sNpTexturebarShadow'},
			mele = {__sNpCore.mediaFolder..'__sNpTexturebarMele'},
			neat = {__sNpCore.mediaFolder..'__sNpTexturebarNeat'},
			glass = {__sNpCore.mediaFolder..'__sNpTexturebarGlass'},
			old = {__sNpCore.mediaFolder..'__sNpTexturebarSolid'},
			border = {__sNpCore.mediaFolder..'__sNpHealthBorder'},
			bg = {__sNpCore.mediaFolder..'__sNpBackground'},
		},
		overlay = {
			middle = {__sNpCore.mediaFolder..'__sNpHealthOverlay'},
			spec = {__sNpCore.mediaFolder..'__sNpHealthOverlaySpecial'},
		},
		glow = {
			threat = {__sNpCore.mediaFolder..'__sNpThreat'},
			target = {
				a = {__sNpCore.mediaFolder..'__sNpTargetGlow'},
				b = {__sNpCore.mediaFolder..'__sNpTargetGlowBorder'},
				c = {__sNpCore.mediaFolder..'__sNpTargetGlowElite'},
			}
		},
    },
    backdrop = {
        default = {
            edgeFile = __sNpCore.mediaFolder..'__sNpHealthBorder', edgeSize = 16,
            color = {1, 1, 1, 0},
            borderColor = {10/255, 10/255, 10/255, 1},
            backdropColor = {.5, .5, .5, .5},
        },
        spell = {
            edgeFile = __sNpCore.mediaFolder..'__sNpSpellBorder', edgeSize = 16,
            c = {0, 0, 0, .8},
			t = {1, 0, 0, .8},
        },
        options = {
            bgFile = __sNpCore.mediaFolder..'menu\\Backdrop_Menubox_Solid',
			edgeFile = __sNpCore.mediaFolder..'menu\\Edge_Menubox_BG_Solid', edgeSize = 2,
			insets = {left = 2, right = 2, top = 2, bottom = 2},
			color = {0, 0, 0, .8},
			borderColor = {.6, .3, .8, .8},
        },
        header = {
            t = {'Interface\\DialogFrame\\UI-DialogBox-Header'},
            c = {.6, .3, .8, 1},
        }
    },
    classicon = {
        raid = {__sNpCore.mediaFolder..'class\\Raidicons'},
        square = {
            f = {__sNpCore.mediaFolder..'class\\UI-CLASSESICON-FLAT'},
            c = {__sNpCore.mediaFolder..'class\\UI-CLASSESICON-COLOR'},
        },
        circle = {
            f = {__sNpCore.mediaFolder..'class\\UI-CLASSESICON-CIRCLES'},
            c = {__sNpCore.mediaFolder..'class\\UI-CLASSESICON-SOHIGH'},
        }
    },
    font = {
        default = {'Fonts\\FRIZQT__.ttf', 'OUTLINE'},
        cstm = {
			a = {__sNpCore.mediaFolder..'fonts\\Angelsk.ttf', 'OUTLINE'},
            b = {__sNpCore.mediaFolder..'fonts\\Express.ttf', 'OUTLINE'},
            c = {__sNpCore.mediaFolder..'fonts\\Cabin.ttf', 'OUTLINE'},
            d = {__sNpCore.mediaFolder..'fonts\\AccidentalPresidency.ttf', 'OUTLINE'},
			e = {__sNpCore.mediaFolder..'fonts\\PT_Sans_Narrow.ttf', 'OUTLINE'},
        }
    }
}
__sNpCore.status = {
	name = {.84, .75, .65},
    threat = {
        none = {1, 1, 1, .3}, -- None
        threat = {70/255, 0, 0, .7} -- Has threat
    },
}
__sNpCore.colors = {
	hostiles = {r = .69, g = .31, b = .31}, -- Hostile unit
	friends	= {r = .32, g = .52, b = .32}, -- Friendly unit
	players = {r = .31, g = .45, b = .63}, -- Friendly player
	neutrals = {r = .65, g = .63, b = .35}, -- Neutrals
}
__sNpCore.classes = {}
for class, color in pairs(RAID_CLASS_COLORS) do
    __sNpCore.classes[class] = {color.r, color.g, color.b}
end
function __sNpCore:GetIndex(SpellID)
	local indexSpell = select(3, GetSpellInfo(SpellID))
	return indexSpell
end
__sNpCore.totemTable = {
--						* [Air Totems] *
	['Grace of Air Totem'] 			= {__sNpCore:GetIndex(8835), 1},
	['Grace of Air Totem II'] 		= {__sNpCore:GetIndex(10627), 1},
	['Grace of Air Totem III'] 		= {__sNpCore:GetIndex(25359), 1},
	['Nature Resistance Totem'] 	= {__sNpCore:GetIndex(10595), 1},
	['Nature Resistance Totem II'] 	= {__sNpCore:GetIndex(10600), 1},
	['Nature Resistance Totem III'] = {__sNpCore:GetIndex(10601), 1},
	['Nature Resistance Totem IV'] 	= {__sNpCore:GetIndex(25574), 1},
	['Windfury Totem'] 				= {__sNpCore:GetIndex(8512), 1},
	['Windfury Totem II'] 			= {__sNpCore:GetIndex(10613), 1},
	['Windfury Totem III'] 			= {__sNpCore:GetIndex(10614), 1},
	['Windfury Totem IV'] 			= {__sNpCore:GetIndex(25585), 1},
	['Windfury Totem V'] 			= {__sNpCore:GetIndex(25587), 1},
	['Windwall Totem'] 				= {__sNpCore:GetIndex(15107), 1},
	['Windwall Totem II'] 			= {__sNpCore:GetIndex(15111), 1},
	['Windwall Totem III'] 			= {__sNpCore:GetIndex(15112), 1},
	['Windwall Totem IV'] 			= {__sNpCore:GetIndex(25577), 1},
	['Wrath of Air Totem'] 			= {__sNpCore:GetIndex(3738), 1},
	['Grounding Totem'] 			= {__sNpCore:GetIndex(8177), 1},
	['Sentry Totem'] 				= {__sNpCore:GetIndex(6495), 1},
--						* [Earth Totems] *
	['Earth Elemental Totem'] 		= {__sNpCore:GetIndex(2062), 2},
	['Earthbind Totem'] 			= {__sNpCore:GetIndex(2484), 2},
	['Stoneclaw Totem'] 			= {__sNpCore:GetIndex(5730), 2},
	['Stoneclaw Totem II'] 			= {__sNpCore:GetIndex(6390), 2},
	['Stoneclaw Totem III'] 		= {__sNpCore:GetIndex(6391), 2},
	['Stoneclaw Totem IV'] 			= {__sNpCore:GetIndex(6392), 2},
	['Stoneclaw Totem V'] 			= {__sNpCore:GetIndex(10427), 2},
	['Stoneclaw Totem VI'] 			= {__sNpCore:GetIndex(10428), 2},
	['Stoneclaw Totem VII'] 		= {__sNpCore:GetIndex(25525), 2},
	['Stoneskin Totem'] 			= {__sNpCore:GetIndex(8071), 2},
	['Stoneskin Totem II'] 			= {__sNpCore:GetIndex(8154), 2},
	['Stoneskin Totem III'] 		= {__sNpCore:GetIndex(8155), 2},
	['Stoneskin Totem IV'] 			= {__sNpCore:GetIndex(10406), 2},
	['Stoneskin Totem V'] 			= {__sNpCore:GetIndex(10407), 2},
	['Stoneskin Totem VI'] 			= {__sNpCore:GetIndex(10408), 2},
	['Stoneskin Totem VII'] 		= {__sNpCore:GetIndex(25508), 2},
	['Stoneskin Totem VIII'] 		= {__sNpCore:GetIndex(25509), 2},
	['Strength of Earth Totem'] 	= {__sNpCore:GetIndex(8075), 2},
	['Strength of Earth Totem II'] 	= {__sNpCore:GetIndex(8160), 2},
	['Strength of Earth Totem III'] = {__sNpCore:GetIndex(8161), 2},
	['Strength of Earth Totem IV'] 	= {__sNpCore:GetIndex(10442), 2},
	['Strength of Earth Totem V'] 	= {__sNpCore:GetIndex(25361), 2},
	['Strength of Earth Totem VI'] 	= {__sNpCore:GetIndex(25528), 2},
	['Tremor Totem'] 				= {__sNpCore:GetIndex(8143), 2},
--						* [Fire Totems] *
	['Fire Elemental Totem'] 		= {__sNpCore:GetIndex(2894), 3},
	['Fire Nova Totem'] 			= {__sNpCore:GetIndex(1535), 3},
	['Fire Nova Totem II'] 			= {__sNpCore:GetIndex(8498), 3},
	['Fire Nova Totem III'] 		= {__sNpCore:GetIndex(8499), 3},
	['Fire Nova Totem IV'] 			= {__sNpCore:GetIndex(11314), 3},
	['Fire Nova Totem V'] 			= {__sNpCore:GetIndex(11315), 3},
	['Fire Nova Totem VI'] 			= {__sNpCore:GetIndex(25546), 3},
	['Fire Nova Totem VII'] 		= {__sNpCore:GetIndex(25547), 3},
	['Flametongue Totem'] 			= {__sNpCore:GetIndex(8227), 3},
	['Flametongue Totem II'] 		= {__sNpCore:GetIndex(8249), 3},
	['Flametongue Totem III'] 		= {__sNpCore:GetIndex(10526), 3},
	['Flametongue Totem IV'] 		= {__sNpCore:GetIndex(16387), 3},
	['Flametongue Totem V'] 		= {__sNpCore:GetIndex(25557), 3},
	['Frost Resistance Totem'] 		= {__sNpCore:GetIndex(8181), 3},
	['Frost Resistance Totem II'] 	= {__sNpCore:GetIndex(10478), 3},
	['Frost Resistance Totem III'] 	= {__sNpCore:GetIndex(10479), 3},
	['Frost Resistance Totem IV'] 	= {__sNpCore:GetIndex(25560), 3},
	['Magma Totem'] 				= {__sNpCore:GetIndex(8190), 3},
	['Magma Totem II'] 				= {__sNpCore:GetIndex(10585), 3},
	['Magma Totem III'] 			= {__sNpCore:GetIndex(10586), 3},
	['Magma Totem IV'] 				= {__sNpCore:GetIndex(10587), 3},
	['Magma Totem V'] 				= {__sNpCore:GetIndex(25552), 3},
	['Searing Totem'] 				= {__sNpCore:GetIndex(3599), 3},
	['Searing Totem II'] 			= {__sNpCore:GetIndex(6363), 3},
	['Searing Totem III'] 			= {__sNpCore:GetIndex(6364), 3},
	['Searing Totem IV'] 			= {__sNpCore:GetIndex(6365), 3},
	['Searing Totem V'] 			= {__sNpCore:GetIndex(10437), 3},
	['Searing Totem VI'] 			= {__sNpCore:GetIndex(10438), 3},
	['Searing Totem VII'] 			= {__sNpCore:GetIndex(25533), 3},
	['Totem of Wrath'] 				= {__sNpCore:GetIndex(30706), 3},
--						* [Water Totems] *
	['Disease Cleansing Totem'] 	= {__sNpCore:GetIndex(8170), 4},
	['Fire Resistance Totem'] 		= {__sNpCore:GetIndex(8184), 4},
	['Fire Resistance Totem II'] 	= {__sNpCore:GetIndex(10537), 4},
	['Fire Resistance Totem III'] 	= {__sNpCore:GetIndex(10538), 4},
	['Fire Resistance Totem IV'] 	= {__sNpCore:GetIndex(25563), 4},
	['Healing Stream Totem'] 		= {__sNpCore:GetIndex(5394), 4},
	['Healing Stream Totem II'] 	= {__sNpCore:GetIndex(6375), 4},
	['Healing Stream Totem III'] 	= {__sNpCore:GetIndex(6377), 4},
	['Healing Stream Totem IV'] 	= {__sNpCore:GetIndex(10462), 4},
	['Healing Stream Totem V '] 	= {__sNpCore:GetIndex(10463), 4},
	['Healing Stream Totem VI'] 	= {__sNpCore:GetIndex(25567), 4},
	['Mana Spring Totem'] 			= {__sNpCore:GetIndex(5675), 4},
	['Mana Spring Totem II'] 		= {__sNpCore:GetIndex(10495), 4},
	['Mana Spring Totem III'] 		= {__sNpCore:GetIndex(10496), 4},
	['Mana Spring Totem IV'] 		= {__sNpCore:GetIndex(10497), 4},
	['Mana Spring Totem V'] 		= {__sNpCore:GetIndex(25570), 4},
	['Mana Tide Totem'] 			= {__sNpCore:GetIndex(16190), 4},
	['Poison Cleansing Totem'] 		= {__sNpCore:GetIndex(8168), 4},
}

------------------------------

function __sNpCore:Round(num, idp)
	return tonumber(format('%.' .. (idp or 0) .. 'f', num))
end

function __sNpCore:FormatNumber(num)
	if num >= 1e6 then
		return __sNpCore:Round(num/1e6, 1)..'|cffEEEE00m|r'
	elseif num >= 1e3 then
		return __sNpCore:Round(num/1e3, 1)..'|cffEEEE00k|r'
	else
		return num
	end
end

function __sNpCore:TextHexColor(frame)
	if __sNpCore.classes[name] then
	local color = RAID_CLASS_COLORS[__sNpCore.classes[name]]
		frame.level:SetTextColor(color.r, color.g, color.b)
		frame.name:SetTextColor(color.r, color.g, color.b)
		frame.castbar.name:SetTextColor(color.r, color.g, color.b)
		frame.castbar.time:SetTextColor(color.r, color.g, color.b)
		frame.castbar:SetStatusBarColor(color.r, color.g, color.b)
		frame.castbar.spellglow:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		frame.name:SetTextColor(unpack(__sNpCore.status.name))
	end
end

function __sNpCore:GetClassColor(frame)
	r, g, b = frame.health:GetStatusBarColor()
	r, g, b = floor(r*100+.5)/100, floor(g*100+.5)/100, floor(b*100+.5)/100
	for class, color in pairs(RAID_CLASS_COLORS) do
		if RAID_CLASS_COLORS[class].r == r and RAID_CLASS_COLORS[class].g == g and RAID_CLASS_COLORS[class].b == b then
			return class
		end
	end
	return nil
end

function __sNpCore:UnitColors(frame)
	local r, g, b = frame.healthOriginal:GetStatusBarColor()
		if g + b == 0 then
		r, g, b = __sNpCore.colors.hostiles.r, __sNpCore.colors.hostiles.g, __sNpCore.colors.hostiles.b
	elseif r + b == 0 then
		r, g, b = __sNpCore.colors.friends.r, __sNpCore.colors.friends.g, __sNpCore.colors.friends.b
	elseif r + g == 0 then
		r, g, b = __sNpCore.colors.players.r, __sNpCore.colors.players.g, __sNpCore.colors.players.b
	elseif 2 - (r + g) < .05 and b == 0 then
		r, g, b = __sNpCore.colors.neutrals.r, __sNpCore.colors.neutrals.g, __sNpCore.colors.neutrals.b
	else
		return r, g, b
	end
	frame.health:SetStatusBarColor(r, g, b)
end

function __sNpCore:ClassColors(frame)
	name = frame.name:GetText()
	if __sNpCore.classes[name] then
	local color = RAID_CLASS_COLORS[__sNpCore.classes[name]]
		frame.health:SetStatusBarColor(color.r, color.g, color.b)
	else
		__sNpCore:UnitColors(frame)
	end
end

function __sNpCore:ClassIcons(frame)
	local hasclass = nil
	class = __sNpCore:GetClassColor(frame)
	if (class) then
		local texcoord = CLASS_BUTTONS[class]
			if (texcoord) then
				hasclass = true
				frame.classIcon:SetTexCoord(texcoord[1],texcoord[2],texcoord[3],texcoord[4])
			else
				hasclass = nil
			end
		else
			frame.classIcon:Hide()
			hasclass = nil
		end
		if hasclass == true then
			frame.classIcon:Show()
		else
			frame.classIcon:Hide()
			frame.classIcon:SetTexture(0,0,0,0)
			frame.classIcon:SetTexCoord(0,0,0,0)
		end
	return .5, .75, .5, .75
end

function __sNpCore:Totems(frame)
local oldname = frame:GetRegions()
local name = frame.oldname:GetText()
--frame.oldname:SetTextColor(0.84, 0.75, 0.65)
	if __sNpCore.totemTable[name] then
		frame.oldname:Show()
		frame.level:Hide()
		frame.health:Hide()
		frame.health.percent:Hide()
		if (not frame.totemIcon) then
			frame.totemIcon = frame:CreateTexture(nil, 'OVERLAY')
			frame.totemIcon:SetPoint('BOTTOM', frame.oldname, 'TOP', 0, 6)
			frame.totemIcon:SetHeight(__sNpConfig.totemSize)
			frame.totemIcon:SetWidth(__sNpConfig.totemSize)
			--	* Creat Fuckin Backdrop *
			frame.totemBorder = CreateFrame('frame', nil, frame)
			frame.totemBorder:SetPoint('TOPLEFT', frame.totemIcon, 'TOPLEFT', 0, -0)
			frame.totemBorder:SetPoint('BOTTOMRIGHT', frame.totemIcon, 'BOTTOMRIGHT', -0, 0)
		end
		
		local getIcon = __sNpCore.totemTable[name]
		frame.totemIcon:SetTexture(getIcon[1])
		frame.totemIcon:Show()
		
		frame.totemBorder:SetBackdrop(__sNpCore.art.backdrop.spell)
		frame.totemBorder:SetBackdropBorderColor((__sNpCore.colors), 2,2,2)
	else
		if (frame.totemIcon) then
			frame.oldname:Hide()
			frame.level:Show()
			frame.health:Show()
			frame.totemIcon:Hide()
			frame.health.percent:Show()
			frame.totemBorder:SetBackdrop(nil)
		end
	end
end

function __sNpCore:CheckTarget(frame)
	if UnitName('target') == frame.name:GetText() and frame:GetAlpha() >= .99 then 
		return true
	else 
		return false 
	end
end

function __sNpCore:CastTime(frame, cur)
	local _, max = frame:GetMinMaxValues()
	local chek = false
		if max > 300 or max == nil then
			chek = true 
		end
	--fixes really long names
	local oldname = frame.channeling or frame.casting
	local name = oldname and (len(oldname) > 20) and gsub(oldname, '%s?(.[\128-\191]*)%S+%s', '%1. ') or oldname
	--cast time
	if frame.channeling then
		if chek then frame.time:SetFormattedText('%.1f', cur)
		else frame.time:SetFormattedText('%.1f (%.1f)', cur, max) end
	else
		if chek then frame.time:SetFormattedText('%.1f', (max - cur))
		else frame.time:SetFormattedText('%.1f (%.1f)', (max - cur), max) end
	end
	if UnitChannelInfo('target') then frame.name:SetText(select(1, (UnitChannelInfo('target')))) end
	if UnitCastingInfo('target') then frame.name:SetText(select(1, (UnitCastingInfo('target')))) end
	
	local countMinMax = (max - cur) <= 0
	if countMinMax then
		frame.name:Hide()
		frame.time:Hide()
		frame.cbackground:Hide()
		frame.cborder:Hide()
		frame.spellglow:Hide()
	else
		frame.name:Show()
		frame.time:Show()
		frame.cbackground:Show()
		frame.cborder:Show()
		frame.spellglow:Show()
	end
end

function __sNpCore.FixCast(frame)
	frame:SetPoint('TOP', frame.health, 'BOTTOM', 0, -5)
end

function __sNpCore.OnFrameSize(frame)
	frame.needFix = true
end

function __sNpCore.OnFrameValue(frame, cur)
	__sNpCore:CastTime(frame, cur)
	if frame.needFix then
		__sNpCore.FixCast(frame)
		frame.needFix = nil
	end
	if frame.controller and select(2, frame:GetStatusBarColor()) > .15 then 
		frame:SetStatusBarColor(.13, .44, .14) 
	end
end

function __sNpCore:DefaultOptions()
	RegisterCVar('_sNpCColor', 1, true)
	RegisterCVar('_sNpName', 0, false)
	RegisterCVar('_sNpLevel', 1, true)
	RegisterCVar('_sNpGlow', 1, true)
	RegisterCVar('_sNpSBtxt', 1, true)
	RegisterCVar('_sNpFNk', 0, false)
	RegisterCVar('_sNpFNp', 0, false)
	RegisterCVar('_sNpBorder', 1, true)
	RegisterCVar('_sNpCIcon', 0, false)
	RegisterCVar('_sNpTotem', 0, false)
	RegisterCVar('_sNpCFlat', 0, false)
	RegisterCVar('_sNpTColor', 0, false)
	RegisterCVar('_sNpBgHide', 0, false)
	
	if not __sNpConfig then __sNpConfig = {} end
	
	if not __sNpConfig.hpWidth	then	__sNpConfig.hpWidth = 155	end
	if not __sNpConfig.hpHeight	then	__sNpConfig.hpHeight = 20	end
	if not __sNpConfig.cbWidth	then	__sNpConfig.cbWidth = 155	end
	if not __sNpConfig.cbHeight	then	__sNpConfig.cbHeight = 14	end
	if not __sNpConfig.levelXpos	then	__sNpConfig.levelXpos = -20	end
	if not __sNpConfig.levelYpos	then	__sNpConfig.levelYpos = 1	end
	if not __sNpConfig.nameXpos	then	__sNpConfig.nameXpos = 0	end
	if not __sNpConfig.nameYpos	then	__sNpConfig.nameYpos = 4	end
	if not __sNpConfig.timeXpos	then	__sNpConfig.timeXpos = -2	end
	if not __sNpConfig.timeYpos	then	__sNpConfig.timeYpos = 0	end
	if not __sNpConfig.sbNumXpos	then	__sNpConfig.sbNumXpos = 0	end
	if not __sNpConfig.spellNameYpos	then	__sNpConfig.spellNameYpos = -3	end
	if not __sNpConfig.spellIconXpos	then	__sNpConfig.spellIconXpos = 12	end
	if not __sNpConfig.spellIconYpos	then	__sNpConfig.spellIconYpos = .25	end
	if not __sNpConfig.classIconXpos	then	__sNpConfig.classIconXpos = -8	end
	if not __sNpConfig.classIconYpos	then	__sNpConfig.classIconYpos = 10	end
	if not __sNpConfig.hpBarYpos	then	__sNpConfig.hpBarYpos = 2	end
	if not __sNpConfig.cbBarYpos	then	__sNpConfig.cbBarYpos = -6	end
	if not __sNpConfig.totemSize	then	__sNpConfig.totemSize = 38	end
	if not __sNpConfig.spellSize	then	__sNpConfig.spellSize = 34	end
	if not __sNpConfig.classSize	then	__sNpConfig.classSize = 32	end
	if not __sNpConfig.fontSize	then	__sNpConfig.fontSize = 14	end
	if not __sNpConfig.classMedia	then	__sNpConfig.classMedia = 1	end
	if not __sNpConfig.fontMedia	then	__sNpConfig.fontMedia = 2	end
	if not __sNpConfig.sbMedia	then	__sNpConfig.sbMedia = 2	end
	if not __sNpConfig.tgMedia	then	__sNpConfig.tgMedia = 1	end
end

function __sNpCore:ResetOptions()
	SetCVar('_sNpCColor', 1, true)
	SetCVar('_sNpName', 0, false)
	SetCVar('_sNpLevel', 1, true)
	SetCVar('_sNpGlow', 1, true)
	SetCVar('_sNpSBtxt', 1, true)
	SetCVar('_sNpFNk', 0, false)
	SetCVar('_sNpFNp', 0, false)
	SetCVar('_sNpBorder', 1, true)
	SetCVar('_sNpCIcon', 0, false)
	SetCVar('_sNpTotem', 1, true)
	SetCVar('_sNpCFlat', 0, false)
	SetCVar('_sNpTColor', 0, false)
	SetCVar('_sNpBgHide', 0, false)
	
	__sNpConfig.hpWidth = 155
	__sNpConfig.hpHeight = 20
	__sNpConfig.cbWidth = 155
	__sNpConfig.cbHeight = 14
	__sNpConfig.levelXpos = -20
	__sNpConfig.levelYpos = 1
	__sNpConfig.nameXpos = 0
	__sNpConfig.nameYpos = 4
	__sNpConfig.timeXpos = -2
	__sNpConfig.timeYpos = 0
	__sNpConfig.sbNumXpos = 0
	__sNpConfig.spellNameYpos = -3
	__sNpConfig.spellIconXpos = 12
	__sNpConfig.spellIconYpos = .25
	__sNpConfig.classIconXpos = -8
	__sNpConfig.classIconYpos = 10
	__sNpConfig.hpBarYpos = 2
	__sNpConfig.cbBarYpos = -6
	
	__sNpConfig.totemSize = 38
	__sNpConfig.spellSize = 34
	__sNpConfig.classSize = 32
	__sNpConfig.fontSize = 14
	__sNpConfig.classMedia = 1
	__sNpConfig.fontMedia = 2
	__sNpConfig.sbMedia = 2
	__sNpConfig.tgMedia = 1
end

function __sNpCore:ConfigSetValue(frame)
	if (GetCVar('_sNpCColor') == '1') then
		__sNpCore:ClassColors(frame)
	else
		__sNpCore:UnitColors(frame)
	end
	if (GetCVar('_sNpName') == '1') then
		frame.name:Hide()
	else
		frame.name:Show()
	end
	if (GetCVar('_sNpLevel') == '1') then
		frame.level:Show()
	else
		frame.level:Hide()
	end
	if (GetCVar('_sNpGlow') == '1' and __sNpCore:CheckTarget(frame)) then
		frame.tglow:Show()
	else
		frame.tglow:Hide()
		frame.tglow:SetTexture(nil)
	end
	if (GetCVar('_sNpSBtxt') == '1') then
		frame.health.percent:Show()
	else
		frame.health.percent:Hide()
	end
	if (GetCVar('_sNpCIcon') == '1') then
		__sNpCore:ClassIcons(frame)
	else
		frame.classIcon:Hide()
		frame.classIcon:SetTexture(0,0,0,0)
		frame.classIcon:SetTexCoord(0,0,0,0)
	end
	if (GetCVar('_sNpTotem') == '1') then
		__sNpCore:Totems(frame)
	else
		if (frame.totemIcon) then
			frame.totemIcon:Hide()
			frame.health:Show()
			frame.health.percent:Show()
			frame.totemBorder:SetBackdrop(nil)
		end
	end
	if (GetCVar('_sNpTColor') == '1') then
		__sNpCore:TextHexColor(frame)
	else
		if __sNpCore.classes[name] then
			frame.level:SetTextColor(1, .96, .41)
		end
		frame.name:SetTextColor(unpack(__sNpCore.status.name))
		frame.castbar.name:SetTextColor(1, 1, 1)
		frame.castbar.time:SetTextColor(1, 1, 1)
		frame.castbar:GetStatusBarColor()
		frame.castbar.spellglow:SetBackdropBorderColor(unpack(__sNpCore.art.backdrop.spell.c))
	end
	if (GetCVar('_sNpBgHide') == '1') then
		frame.background:Hide()
		frame.castbar.cbackground:SetTexture(nil)
	else
		frame.background:Show()
		frame.castbar.cbackground:SetTexture(__sNpCore.art.textures.bar.bg[1])
	end

	if __sNpConfig.hpWidth or __sNpConfig.hpHeight then
		frame.container:ClearAllPoints()
		frame.container:SetPoint('CENTER', frame.container:GetParent(), 'CENTER', 0, __sNpConfig.hpBarYpos)
		frame.container:SetWidth(__sNpConfig.hpWidth)
		frame.container:SetHeight(__sNpConfig.hpHeight)
	end
	if __sNpConfig.cbWidth or __sNpConfig.cbHeight then
		frame.castbar:ClearAllPoints()
		frame.castbar:SetPoint('TOP', frame.container, 'BOTTOM', 0, -6)
		frame.castbar:SetWidth(__sNpConfig.cbWidth)
		frame.castbar:SetHeight(__sNpConfig.cbHeight)
	end
	if __sNpConfig.levelXpos or __sNpConfig.levelYpos then
		frame.level:SetPoint('LEFT', frame.health, 'RIGHT', __sNpConfig.levelXpos, __sNpConfig.levelYpos)
	end
	if __sNpConfig.nameXpos or __sNpConfig.nameYpos then
		frame.name:SetPoint('BOTTOM', frame.health, 'TOP', __sNpConfig.nameXpos, __sNpConfig.nameYpos)
	end
	if __sNpConfig.timeXpos or __sNpConfig.timeYpos then
		frame.castbar.time:SetPoint('RIGHT', frame.castbar, 'LEFT', __sNpConfig.timeXpos, __sNpConfig.timeYpos)
	end
	if __sNpConfig.sbNumXpos then
		frame.health.percent:ClearAllPoints()
		frame.health.percent:SetPoint('CENTER', frame.health, 'CENTER', __sNpConfig.sbNumXpos, 1)
	end
	if __sNpConfig.spellNameYpos then
		frame.castbar.name:SetPoint('TOPLEFT', frame.castbar, 'BOTTOMLEFT', 0, __sNpConfig.spellNameYpos)
		frame.castbar.name:SetPoint('TOPRIGHT', frame.castbar, 'BOTTOMRIGHT', 0, __sNpConfig.spellNameYpos)
	end
	if __sNpConfig.spellIconXpos or __sNpConfig.spellIconYpos then
		frame.castbar.icon:SetPoint('BOTTOMLEFT', frame.castbar, 'BOTTOMRIGHT', __sNpConfig.spellIconXpos, __sNpConfig.spellIconYpos)
	end
	if __sNpConfig.classIconXpos or __sNpConfig.classIconYpos then
		frame.classIcon:SetPoint('TOPRIGHT', frame.health, 'TOPLEFT', __sNpConfig.classIconXpos, __sNpConfig.classIconYpos)
	end
	if __sNpConfig.hpBarYpos or __sNpConfig.cbBarYpos then
		frame.container:SetPoint('CENTER', frame.container:GetParent(), 'CENTER', 0, __sNpConfig.hpBarYpos)
		frame.castbar:SetPoint('TOP', frame.container, 'BOTTOM', 0, __sNpConfig.cbBarYpos)
	end
	--Extra
	if (__sNpConfig.totemSize and GetCVar('_sNpTotem') == '1') then
		if __sNpCore.totemTable[name] then
			frame.totemIcon:SetHeight(__sNpConfig.totemSize)
			frame.totemIcon:SetWidth(__sNpConfig.totemSize)
		end
	end
	if __sNpConfig.spellSize then
		frame.castbar.icon:SetHeight(__sNpConfig.spellSize)
		frame.castbar.icon:SetWidth(__sNpConfig.spellSize)
	end
	if __sNpConfig.classSize then
		frame.classIcon:SetHeight(__sNpConfig.classSize)
		frame.classIcon:SetWidth(__sNpConfig.classSize)
	end
	if __sNpConfig.fontSize and (__sNpConfig.fontMedia == 1) then
		frame.name:SetFont(__sNpCore.art.font.cstm.a[1], (__sNpConfig.fontSize+4))
		frame.level:SetFont(__sNpCore.art.font.cstm.a[1], __sNpConfig.fontSize)
		frame.castbar.time:SetFont(__sNpCore.art.font.cstm.a[1], __sNpConfig.fontSize)
		frame.castbar.name:SetFont(__sNpCore.art.font.cstm.a[1], __sNpConfig.fontSize)
		frame.health.percent:SetFont(__sNpCore.art.font.cstm.a[1], __sNpConfig.fontSize)
	elseif (__sNpConfig.fontMedia == 2) then
		frame.name:SetFont(__sNpCore.art.font.cstm.b[1], (__sNpConfig.fontSize+4))
		frame.level:SetFont(__sNpCore.art.font.cstm.b[1], __sNpConfig.fontSize)
		frame.castbar.time:SetFont(__sNpCore.art.font.cstm.b[1], __sNpConfig.fontSize)
		frame.castbar.name:SetFont(__sNpCore.art.font.cstm.b[1], __sNpConfig.fontSize)
		frame.health.percent:SetFont(__sNpCore.art.font.cstm.b[1], __sNpConfig.fontSize)
	elseif (__sNpConfig.fontMedia == 3) then
		frame.name:SetFont(__sNpCore.art.font.cstm.c[1], (__sNpConfig.fontSize+4))
		frame.level:SetFont(__sNpCore.art.font.cstm.c[1], __sNpConfig.fontSize)
		frame.castbar.time:SetFont(__sNpCore.art.font.cstm.c[1], __sNpConfig.fontSize)
		frame.castbar.name:SetFont(__sNpCore.art.font.cstm.c[1], __sNpConfig.fontSize)
		frame.health.percent:SetFont(__sNpCore.art.font.cstm.c[1], __sNpConfig.fontSize)
	elseif (__sNpConfig.fontMedia == 4) then
		frame.name:SetFont(__sNpCore.art.font.cstm.d[1], (__sNpConfig.fontSize+4))
		frame.level:SetFont(__sNpCore.art.font.cstm.d[1], __sNpConfig.fontSize)
		frame.castbar.time:SetFont(__sNpCore.art.font.cstm.d[1], __sNpConfig.fontSize)
		frame.castbar.name:SetFont(__sNpCore.art.font.cstm.d[1], __sNpConfig.fontSize)
		frame.health.percent:SetFont(__sNpCore.art.font.cstm.d[1], __sNpConfig.fontSize)
	elseif (__sNpConfig.fontMedia == 5) then
		frame.name:SetFont(__sNpCore.art.font.cstm.e[1], (__sNpConfig.fontSize+4))
		frame.level:SetFont(__sNpCore.art.font.cstm.e[1], __sNpConfig.fontSize)
		frame.castbar.time:SetFont(__sNpCore.art.font.cstm.e[1], __sNpConfig.fontSize)
		frame.castbar.name:SetFont(__sNpCore.art.font.cstm.e[1], __sNpConfig.fontSize)
		frame.health.percent:SetFont(__sNpCore.art.font.cstm.e[1], __sNpConfig.fontSize)
	else
		frame.name:SetFont(__sNpCore.art.font.default[1], (__sNpConfig.fontSize+4))
		frame.level:SetFont(__sNpCore.art.font.default[1], __sNpConfig.fontSize)
		frame.castbar.time:SetFont(__sNpCore.art.font.default[1], __sNpConfig.fontSize)
		frame.castbar.name:SetFont(__sNpCore.art.font.default[1], __sNpConfig.fontSize)
		frame.health.percent:SetFont(__sNpCore.art.font.default[1], __sNpConfig.fontSize)
	end
	if (__sNpConfig.classMedia == 1 and GetCVar('_sNpCIcon') == '1') then
		frame.classIcon:SetTexture(__sNpCore.art.classicon.square.f[1])
	elseif (__sNpConfig.classMedia == 2) then
		frame.classIcon:SetTexture(__sNpCore.art.classicon.circle.f[1])
	elseif (__sNpConfig.classMedia == 3) then
		frame.classIcon:SetTexture(__sNpCore.art.classicon.circle.c[1])
	else
		frame.classIcon:SetTexture(__sNpCore.art.classicon.square.c[1])
	end
	if (__sNpConfig.sbMedia == 1) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.clean[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.clean[1])
	elseif (__sNpConfig.sbMedia == 2) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.black[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.black[1])
	elseif (__sNpConfig.sbMedia == 3) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.shadow[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.shadow[1])
	elseif (__sNpConfig.sbMedia == 4) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.mele[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.mele[1])
	elseif (__sNpConfig.sbMedia == 5) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.neat[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.neat[1])
	elseif (__sNpConfig.sbMedia == 6) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.glass[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.glass[1])
	elseif (__sNpConfig.sbMedia == 7) then
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.old[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.old[1])
	else
		frame.health:SetStatusBarTexture(__sNpCore.art.textures.bar.smooth[1])
		frame.castbar:SetStatusBarTexture(__sNpCore.art.textures.bar.smooth[1])
	end
	if (__sNpConfig.tgMedia == 1 and __sNpCore:CheckTarget(frame)) then
		frame.tglow:SetTexture(__sNpCore.art.textures.glow.target.b[1])
		frame.tglow:SetPoint('TOPLEFT', frame.border, 'TOPLEFT', -4, 4)
		frame.tglow:SetPoint('BOTTOMRIGHT', frame.border, 'BOTTOMRIGHT', 4, -4)
		frame.tglow:SetVertexColor(1, 1, 1, 1)
	elseif (__sNpConfig.tgMedia == 2) then
		frame.tglow:SetTexture(__sNpCore.art.textures.glow.target.c[1])
		frame.tglow:SetPoint('TOPLEFT', frame.border, 'TOPLEFT', -2, 3)
		frame.tglow:SetPoint('BOTTOMRIGHT', frame.border, 'BOTTOMRIGHT', 2, -3)
		frame.tglow:SetVertexColor(1, 1, 1, 1)
	else
		frame.tglow:SetTexture(__sNpCore.art.textures.glow.target.a[1])
		frame.tglow:SetPoint('TOPLEFT', frame.border, 'TOPLEFT', -2, 8)
		frame.tglow:SetPoint('BOTTOMRIGHT', frame.border, 'BOTTOMRIGHT', 2, -8)
		frame.tglow:SetVertexColor(.3, .5, 1, .7)
	end
end

------------------------------
local __sNpCWatcher = CreateFrame('Frame', nil, UIParent)
__sNpCWatcher:RegisterEvent('UPDATE_MOUSEOVER_UNIT')
__sNpCWatcher:RegisterEvent('PLAYER_TARGET_CHANGED')
__sNpCWatcher:RegisterEvent('UPDATE_BATTLEFIELD_SCORE')

__sNpCWatcher:SetScript('OnEvent', function(self, e, ...)
if self[e] and self[e](...) then return true end
	return false
end)

function AddName(name, class)
if not class then
	local unit = name
		if UnitIsPlayer(unit) then
			AddName(UnitName(unit), select(2, UnitClass(unit)))
		end
	else
		if name ~= 'UNKNOWN' and RAID_CLASS_COLORS[class] then
			__sNpCore.classes[name] = class
		end
	end
end
function __sNpCWatcher:UPDATE_MOUSEOVER_UNIT() AddName('mouseover') end
function __sNpCWatcher:PLAYER_TARGET_CHANGED() AddName('target') end
function __sNpCWatcher:UPDATE_BATTLEFIELD_SCORE()
	for i = 1, GetNumBattlefieldScores() do
	local name, _, _, _, _, _, _, _, _, class = GetBattlefieldScore(i)
		name = ('-'):split(name, 2)
		AddName(name, class)
	end
end

__sNpCore:RegisterEvent('ADDON_LOADED')
__sNpCore:SetScript('OnEvent', function(self, e)
	if (e == 'ADDON_LOADED') then
		if (arg1 == 'SoHighPlates') then
			__sNpCore:DefaultOptions()
			DEFAULT_CHAT_FRAME:AddMessage(fntW..' **'..fntF..'SoHigh'..fntB..'Plates'..fntW..' v2.3 '..fntA..'Successful '..fntO..'Loaded'..fntA.. '. Type ' ..fntO.. '/SNP ' ..fntA.. 'for Options'..fntW..' **')
		end
	end
end)