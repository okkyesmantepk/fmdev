local lanesInUse = {}

RPC.register('np-bowling:purchaseItem',function(psource,pLane ,boolean)
    local user = exports["np-base"]:getModule("Player"):GetUser(psource)
    if pLane == 'bowlingball' and user:getCash() >= 50 then
        TriggerClientEvent("player:receiveItem", psource ,"bowlingball", 1)
        user:removeMoney(50)
        return true
    end
    if not lanesInUse[pLane] == boolean and user:getCash() >= 25 then 
        local information = {
            ["Lane"] = pLane,
          }
          TriggerClientEvent("player:receiveItem", psource ,"bowlingreceipt", 1, true, information)
          user:removeMoney(25)
        return true
    else
        return false
    end
end)