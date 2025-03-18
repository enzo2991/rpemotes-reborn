if Config.Framework ~= 'ox' then return end

local framework = 'ox_core'
local state = GetResourceState(framework)

if state == 'missing' or state == "unknown" then
    -- Framework can't be used if it's missing or unknown
    return
end