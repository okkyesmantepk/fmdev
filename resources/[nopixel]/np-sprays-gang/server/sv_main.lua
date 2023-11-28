RegisterServerEvent('np-gang-sprays:purchaseGangSpray', function(sprayModel)
    local source = source
    local user = exports['np-base']:getModule("Player"):GetUser(source)
    if user:getCash() >= 10000 then
        user:removeMoney(10000)
        local information = {
            ["model"] = sprayModel,
        }

        TriggerClientEvent('player:receiveItem', source, 'spraycan', 1, true, information)
    else
        TriggerClientEvent('DoLongHudText', source, 'Not enough cash.', 2)
    end
end)

RPC.register('np-gang-sprays:purchaseScrubbingCloth', function()
    local source = source
    local user = exports['np-base']:getModule("Player"):GetUser(source)

    if user:getCash() >= 50000 then
        user:removeMoney(50000)
        TriggerClientEvent('player:receiveItem', source, 'scrubbingcloth', 1)
    else
        TriggerClientEvent('DoLongHudText', source, 'Not enough cash.', 2)
    end
end)