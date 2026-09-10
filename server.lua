local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterServerEvent('burial:payout')
AddEventHandler('burial:payout', function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    
    if Character then
        local reward = 5.00
        Character.addCurrency(0, reward) -- 0 = cash, 1 = gold
        
        -- Optional notification
        TriggerClientEvent("vorp:TipRight", _source, "You received $" .. string.format("%.2f", reward) .. " for the burial.", 4000)
    end
end)
