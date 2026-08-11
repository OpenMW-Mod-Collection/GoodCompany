---@diagnostic disable: missing-fields
---@omw-context menu
local I = require('openmw.interfaces')
local util = require("openmw.util")
local ui = require("openmw.ui")
local core = require("openmw.core")

local l10n = core.l10n("BestFriendsForever")

local presetColors = {
    "d4edfc", -- thirst
    "bfd4bc", -- hunger
    "cfbddb", -- sleep
    "81cded", -- fav color of blue
    "caa560", -- fontColor_color_normal
    "d4b77f", -- goldenMix
    "dfc99f", -- FontColor_color_normal_over
    "eee2c9", -- lightText
    "253170", -- fontColor_color_journal_link
    "3a4daf", -- fontColor_color_journal_link_over
    "707ecf", -- fontColor_color_journal_link_pressed
}

I.Settings.registerPage {
    key = 'BestFriendsForever',
    l10n = 'BestFriendsForever',
    name = 'page_name',
    description = 'page_description',
}

I.Settings.registerGroup {
    key = 'SettingsBestFriendsForever_call',
    page = 'BestFriendsForever',
    l10n = 'BestFriendsForever',
    name = 'call_groupName',
    description = "call_groupDesc",
    permanentStorage = true,
    order = 10,
    settings = {
        {
            key = 'callKeybind',
            name = 'callKeybind_name',
            description = "callKeybind_desc",
            renderer = 'inputBinding',
            argument = {
                key = "BestFriendsForever_call",
                type = "action",
            },
            default = "BestFriendsForever_call",
        },
        {
            key = 'callDistance',
            name = 'callDistance_name',
            description = "callDistance_desc",
            renderer = 'SuperSlider6',
            default = 200,
            argument = {
                min = -1000,
                max = 1000,
                step = 50,
                default = 200,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
                minLabel = "In front of",
                maxLabel = "Behind",
            }
        },
    }
}





I.Settings.registerPage {
    key = 'BestFriendsForever_HUD',
    l10n = 'BestFriendsForever',
    name = 'page_HUD_name',
    description = 'page_HUD_description',
}

I.Settings.registerGroup {
    key = 'SettingsBestFriendsForever_HUDWrapper',
    page = 'BestFriendsForever_HUD',
    l10n = 'BestFriendsForever',
    name = 'HUDWrapper_groupName',
    permanentStorage = true,
    order = 20,
    settings = {
        {
            key = 'enable',
            name = 'enable_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'pollingRate',
            name = 'pollingRate_name',
            description = 'pollingRate_desc',
            renderer = "number",
            default = .1,
        },
        {
            key = 'maxWidgets',
            name = 'maxWidgets_name',
            renderer = "number",
            default = 5,
        },
        {
            key = 'lockPosition',
            name = 'lockPosition_name',
            description = "lockPosition_desc",
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'posX',
            name = 'posX_name',
            renderer = "SuperSlider6",
            default = 10,
            argument = {
                max = ui.screenSize().x,
                step = 1,
                default = 10,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
            }
        },
        {
            key = 'posY',
            name = 'posY_name',
            renderer = "SuperSlider6",
            default = 10,
            argument = {
                max = ui.screenSize().y,
                step = 1,
                default = 10,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
            }
        },
        {
            key = 'expansionDirectionV',
            name = 'expansionDirectionV_name',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Up",
                    "Center",
                    "Down",
                },
            },
            default = "Down",
        },
        {
            key = 'expansionDirectionH',
            name = 'expansionDirectionH_name',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Left",
                    "Center",
                    "Right",
                },
            },
            default = "Right",
        },
        {
            key = 'horizontalLayout',
            name = 'horizontalLayout_name',
            renderer = 'checkbox',
            default = false,
        },
        {
            key = 'enableBordersAndBg',
            name = 'enableBordersAndBg_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'hudDisplay',
            name = 'hudDisplay_name',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Always",
                    "Interface Only",
                    "Hide on Interface",
                    "Hide on Dialogue Only",
                },
            },
            default = "Hide on Dialogue Only",
        },
    }
}

I.Settings.registerGroup {
    key = 'SettingsBestFriendsForever_HUDFollower',
    page = 'BestFriendsForever_HUD',
    l10n = 'BestFriendsForever',
    name = 'HUDFollower_groupName',
    permanentStorage = true,
    order = 21,
    settings = {
        {
            key = 'enabledElements',
            name = 'enabledElements_name',
            description = 'enabledElements_desc',
            renderer = 'multiselect',
            default = {
                name    = true,
                health  = true,
                magicka = true,
                fatigue = true,
                labels  = true,
                icons   = true,
                effects   = true,
                diseases   = true,
                damagedStats   = true,
            },
            argument = {
                keys = {
                    "name",
                    "health",
                    "magicka",
                    "fatigue",
                    "labels",
                    "icons",
                    "effects",
                    "diseases",
                    "damagedStats",
                },
                aliases = {
                    name    = l10n("enabledElements_name"),
                    health  = l10n("enabledElements_health"),
                    magicka = l10n("enabledElements_magicka"),
                    fatigue = l10n("enabledElements_fatigue"),
                    labels  = l10n("enabledElements_labels"),
                    icons   = l10n("enabledElements_icons"),
                    effects = l10n("enabledElements_effects"),
                    diseases  = l10n("enabledElements_diseases"),
                    damagedStats   = l10n("enabledElements_damagedStats"),
                },
            },
        },
        {
            key = 'nameTextSize',
            name = 'nameTextSize_name',
            renderer = 'SuperSlider6',
            default = 18,
            argument = {
                min = 1,
                default = 18,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
            }
        },
        {
            key = 'uiAlign',
            name = 'uiAlign_name',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Left",
                    "Center",
                    "Right",
                },
            },
            default = "Center",
        },
        -- {
        --     key = 'healthBarEnabled',
        --     name = 'healthBarEnabled_name',
        --     renderer = 'checkbox',
        --     default = true,
        -- },
        -- {
        --     key = 'magickaBarEnabled',
        --     name = 'magickaBarEnabled_name',
        --     renderer = 'checkbox',
        --     default = true,
        -- },
        -- {
        --     key = 'fatigueBarEnabled',
        --     name = 'fatigueBarEnabled_name',
        --     renderer = 'checkbox',
        --     default = true,
        -- },
        {
            key = 'barLength',
            name = 'barLength_name',
            renderer = 'SuperSlider6',
            default = 100,
            argument = {
                max = 500,
                default = 100,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
            }
        },
        {
            key = 'barWidth',
            name = 'barWidth_name',
            renderer = 'SuperSlider6',
            default = 16,
            argument = {
                max = 50,
                default = 16,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
            }
        },
        -- {
        --     key = 'barLabels',
        --     name = 'barLabels_name',
        --     renderer = 'checkbox',
        --     default = true,
        -- },
        -- {
        --     key = 'combatIcon',
        --     name = 'combatIcon_name',
        --     description = 'combatIcon_desc',
        --     renderer = 'checkbox',
        --     default = true,
        -- },
        {
            key = 'labelDisplayMode',
            name = 'labelDisplayMode_name',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Current",
                    "Current/Max",
                },
            },
            default = "Current/Max",
        },
        {
            key = 'horizontalIcons',
            name = 'horizontalIcons_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'rightIcons',
            name = 'rightIcons_name',
            renderer = 'checkbox',
            default = true,
        },
        -- {
        --     key = 'immortalityIntegration',
        --     name = 'immortalityIntegration_name',
        --     description = "immortalityIntegration",
        --     renderer = 'checkbox',
        --     default = true,
        -- },
        {
            key = 'showConstEffects',
            name = 'showConstEffects_name',
            renderer = 'checkbox',
            default = false,
        },
        {
            key = 'effectIconSize',
            name = 'effectIconSize_name',
            renderer = 'SuperSlider6',
            default = 24,
            argument = {
                default = 24,
                showDefaultMark = true,
                showResetButton = true,
                bottomRow = true,
            }
        },
        {
            key = 'maxEffects',
            name = 'maxEffects_name',
            renderer = "number",
            default = 10,
        },
        {
            key = 'diseaseVerbosity',
            name = 'diseaseVerbosity_name',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Full name",
                    "Unnamed 'Common/Blight Disease'",
                    "Undiagnosed 'Disease'",
                },
            },
            default = "Full name",
        },
        {
            key = 'statDamageVerbosity',
            name = 'statDamageVerbosity_name',
            description = 'statDamageVerbosity_desc',
            renderer = 'select',
            argument = {
                l10n = "BestFriendsForever",
                items = {
                    "Exact number",
                    "Only stat name",
                    "Only stat type",
                    "Only the fact of it",
                },
            },
            default = "Only stat name",
        },
        {
            key = 'nameColor',
            name = 'nameColor_name',
            renderer = "SuperColorPicker2",
            default = util.color.hex("eee2c9"),
            argument = {
                presetColors = presetColors,
            },
        },

        {
            key = 'healthBarColor',
            name = 'healthBarColor_name',
            renderer = "SuperColorPicker2",
            default = util.color.hex("c83c1e"),
            argument = {
                presetColors = presetColors,
            },
        },

        {
            key = 'magickaBarColor',
            name = 'magickaBarColor_name',
            renderer = "SuperColorPicker2",
            default = util.color.hex("35459f"),
            argument = {
                presetColors = presetColors,
            },
        },

        {
            key = 'fatigueBarColor',
            name = 'fatigueBarColor_name',
            renderer = "SuperColorPicker2",
            default = util.color.hex("00963c"),
            argument = {
                presetColors = presetColors,
            },
        },
        {
            key = 'diseaseNameColor',
            name = 'diseaseNameColor_name',
            renderer = "SuperColorPicker2",
            default = util.color.hex("c83c1e"),
            argument = {
                presetColors = presetColors,
            },
        },
        {
            key = 'statDamageColor',
            name = 'statDamageColor_name',
            renderer = "SuperColorPicker2",
            default = util.color.hex("c83c1e"),
            argument = {
                presetColors = presetColors,
            },
        },
    }
}
