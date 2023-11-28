local islandState = true

RegisterNetEvent("np-island:checkIslandSwapping")
AddEventHandler("np-island:checkIslandSwapping", function()
  local src = source
  if islandState then 
    TriggerClientEvent('np-island:enableSwapping',src,true)
  else 
    return
  end
end)

RegisterNetEvent("np-island:changeIslandState")
AddEventHandler("np-island:changeIslandState", function(pState)
  local src = source
  TriggerClientEvent('np-island:enableSwapping',src,pState)
end)