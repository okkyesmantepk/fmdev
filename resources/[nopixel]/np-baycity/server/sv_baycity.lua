local doorCheckbaycity = false -- False : 'Door Close' || True : 'Door Open'

RegisterServerEvent("np-baycity:getGetDoorStateSV")
AddEventHandler("np-baycity:getGetDoorStateSV", function()
    TriggerClientEvent('np-baycity:getDoorCheckCL', -1, doorCheckbaycity)
end)

RegisterServerEvent("np-baycity:changeDoorState:SV")
AddEventHandler("np-baycity:changeDoorState:SV", function(state)
    doorCheckbaycity = state
end)

RegisterServerEvent("np-particleserverbaycity")
AddEventHandler("np-particleserverbaycity", function()
    TriggerClientEvent("np-ptfxparticlebaycity", -1)
end)

RegisterServerEvent("np-particleserverbaycity1")
AddEventHandler("np-particleserverbaycity1", function()
    TriggerClientEvent("np-ptfxparticlebaycity1", -1)
end)
