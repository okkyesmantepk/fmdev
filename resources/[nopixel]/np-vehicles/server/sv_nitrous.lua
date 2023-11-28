RegisterServerEvent('np-vehicles:ApplyNitrous')
AddEventHandler('np-vehicles:ApplyNitrous', function()
     TriggerClientEvent("np-nitro:client:placeNitro", source)
end) 

RegisterServerEvent('np-nitro:server:particlefx')
AddEventHandler('np-nitro:server:particlefx', function(veh)
     TriggerClientEvent('np-nitro:client:particlefx', -1, veh)
end)

RegisterServerEvent('np-nitro:server:particlefisfis')
AddEventHandler('np-nitro:server:particlefisfis', function(type, veh)
     if type == 'fisfisacc' then
          TriggerClientEvent('np-nitro:client:particlefisfis', -1, 'fisfisac', veh)
     elseif type == 'fisfiskapatt' then
          TriggerClientEvent('np-nitro:client:particlefisfis', -1, 'fisfiskapat', veh)
     end
end)