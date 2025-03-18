if Config.Framework ~= 'ox' then return end

local framework = 'ox_core'
local state = GetResourceState(framework)

if state == 'missing' or state == "unknown" then
    return
end

local Ox = require "@ox_core.lib.init"

RegisterCommand('e',function(source, args, rawCommand)
    local player = Ox.GetPlayer(source)
    player.emit('animations:client:PlayEmote', args)
end,false)

RegisterCommand('emote',function(source, args, rawCommand)
    local player = Ox.GetPlayer(source)
    player.emit('animations:client:PlayEmote', args)
end,false)

if Config.Keybinding then
    RegisterCommand('emotebind',function(source, args, rawCommand)
        local player = Ox.GetPlayer(source)
        player.emit('animations:client:BindEmote', args)
    end,false)

    RegisterCommand('emotebinds',function(source, args, rawCommand)
        local player = Ox.GetPlayer(source)
        player.emit('animations:client:EmoteBinds')
    end,false)

    RegisterCommand('emotedelete',function(source, args, rawCommand)
        local player = Ox.GetPlayer(source)
        player.emit('animations:client:EmoteDelete', args)
    end,false)
end

