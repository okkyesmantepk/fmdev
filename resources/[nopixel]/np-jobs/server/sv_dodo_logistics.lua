RegisterServerEvent('np-jobs:dodoLogisticsPayout')
AddEventHandler('np-jobs:dodoLogisticsPayout', function()
    local src = tonumber(source)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local payment = math.random(250, 325)

    user:addBank(payment)
    TriggerClientEvent('DoLongHudText', src, 'You completed the delivery and got $'..payment , 1)
end)