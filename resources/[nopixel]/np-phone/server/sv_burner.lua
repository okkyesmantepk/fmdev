recentCalls = {}

RegisterNetEvent("np-phone:sendRecentCalls", function(pRecentCalls, pCid)
    recentCalls[pCid] = pRecentCalls
end)

RPC.register("np-phone:getRecentCallsByCid", function(pSource, pCid)
    return recentCalls[pCid]
end)

RPC.register("np-phone:getRecentCallsByNumber", function(pSource, pNum)
    for k,v in pairs(recentCalls) do
        -- todo
    end
end)

RPC.register('np-phone:getTextsFromNumber', function(pSource, pCid)
    local src = source
    local myNumber = getNumber(pCid)
    return getSMS(myNumber), myNumber
end)

RegisterServerEvent('phone:getSMSOther')
AddEventHandler('phone:getSMSOther' ,function(pTarget)
    local src = source
    local user2 = exports["np-base"]:getModule("Player"):GetUser(tonumber(pTarget))
    local char2 = user2:getCurrentCharacter()
    if pTarget == nil then return end
    TriggerClientEvent('np-phone:useBurner',src,char2.id)
end)