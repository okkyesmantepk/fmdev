-- For my bro <3 

RegisterServerEvent('memorial:house:hug:request',function()
    TriggerClientEvent('memorial:house:brother:hug',-1)
    Citizen.Wait(300)
    TriggerClientEvent('memorial:house:hug:granted',-1)
end)