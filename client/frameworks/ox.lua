if Config.Framework ~= 'ox' then return end
PlayerData = nil
local framework = 'ox_core'
local state = GetResourceState(framework)

if state == 'missing' or state == "unknown" then
    -- Framework can't be used if it's missing or unknown
    return
end

-- Suggestion in chat
CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/e', Translate('play_emote'),
        { { name = "emotename",      help = Translate('help_command') },
            { name = "texturevariation", help = Translate('help_variation') } })

    TriggerEvent('chat:addSuggestion', '/emote', Translate('play_emote'),
        { { name = "emotename",      help = Translate('help_command') },
            { name = "texturevariation", help = Translate('help_variation') } })

    if Config.SqlKeybinding then
        TriggerEvent('chat:addSuggestion', '/emotebind', Translate('link_emote_keybind'),
            { { name = "key",     help = "num4, num5, num6, num7. num8, num9. Numpad 4-9!" },
                { name = "emotename", help = Translate('help_command') } })

        TriggerEvent('chat:addSuggestion', '/emotebinds', Translate('show_emote_keybind'))

        TriggerEvent('chat:addSuggestion', '/emotedelete', Translate('remove_emote_keybind'),
            { { name = "key", help = "num4, num5, num6, num7. num8, num9. Numpad 4-9!" } })

    end
    TriggerEvent('chat:addSuggestion', '/emotemenu', Translate('open_menu_emote'))

    TriggerEvent('chat:addSuggestion', '/emotes', Translate('show_list_emote'))

    TriggerEvent('chat:addSuggestion', '/emotecancel', Translate('cancel_emote'))
end)

RegisterNetEvent('animations:client:PlayEmote', function(args)
    if not LocalPlayer.state.isDead then
        EmoteCommandStart(source, args)
    end
end)

if Config.Keybinding then
    RegisterNetEvent('animations:client:BindEmote', function(args)
        if not LocalPlayer.state.isDead then
            EmoteBindStart(nil, args)
        end
    end)

    RegisterNetEvent('animations:client:EmoteBinds', function(_)
        if not LocalPlayer.state.isDead then
            EmoteBindsStart()
        end
    end)

    RegisterNetEvent('animations:client:EmoteDelete', function(args)
        if not LocalPlayer.state.isDead then
            DeleteEmote(args)
        end
    end)
end

RegisterNetEvent('animations:client:EmoteMenu', function()
    if not LocalPlayer.state.isDead then
        OpenEmoteMenu()
    end
end)

RegisterNetEvent('animations:client:ListEmotes', function()
    if not LocalPlayer.state.isDead then
        EmotesOnCommand()
    end
end)

RegisterNetEvent('animations:client:Walk', function(args)
    if not LocalPlayer.state.isDead then
        WalkCommandStart(args)
    end
end)

RegisterNetEvent('animations:client:ListWalks', function()
    if not LocalPlayer.state.isDead then
        WalksOnCommand()
    end
end)

CanDoEmote = true
RegisterNetEvent('animations:ToggleCanDoAnims', function(bool)
    CanDoEmote = bool
end)

RegisterNetEvent('animations:client:EmoteCommandStart', function(args)
    if CanDoEmote then
        EmoteCommandStart(source, args)
    end
end)
