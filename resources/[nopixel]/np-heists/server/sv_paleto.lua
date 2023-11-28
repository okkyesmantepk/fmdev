local LootPaleto = false
CnaRob = true
Step1 = false

RegisterServerEvent("step1enable", function()
    local source = source
    Step1 = true
end)

RegisterServerEvent("np-paleto:startCoolDown", function()
    local source = source
    CnaRob = false
    Available = false
    CreateThread(function()
        while true do
            Citizen.Wait(7200000)
            CnaRob = true
            Available = true
            TriggerServerEvent('np-doors:change-lock-state', 45, true) 
        end
    end)
end)

RegisterServerEvent('np-paleto:tut_tut')
AddEventHandler('np-paleto:tut_tut', function()
    local src = source
    if not LootPaleto then
        LootPaleto = true
        TriggerClientEvent('np-vault:grab', src)
        Citizen.Wait(40000)
        LootPaleto = false
    end
end)

RegisterServerEvent('np-paleto:hacklaptop')
AddEventHandler('np-paleto:hacklaptop', function()
    if Step1 then
        TriggerClientEvent('np-paleto:startpaleto', source)
    end
end)