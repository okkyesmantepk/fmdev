
--// Start With Axe

RegisterNetEvent('np-start-mining')
AddEventHandler('np-start-mining', function()
    if npMiningZone then
        TriggerEvent('np-civjobs-mining')
    else
        TriggerEvent('DoLongHudText', 'You are not in the Mining Zone', 2)
    end
end)

local currentlyMining = false
local pFarmed = 0

RegisterNetEvent("np-civjobs-mining")
AddEventHandler("np-civjobs-mining", function()
    local rnd = math.random(20)

	if exports["np-inventory"]:hasEnoughOfItem("miningpickaxe",1,false) and not currentlyMining then 
        print(pFarmed)
        if pFarmed ~= 100 then
            currentlyMining = true
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            FreezeEntityPosition(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'))
            Citizen.Wait(200)
            local pickaxe = GetHashKey("prop_tool_pickaxe")
            
            -- Loads Pickaxe
            RequestModel(pickaxe)
            while not HasModelLoaded(pickaxe) do
            Wait(1)
            end
            
            local anim = "melee@hatchet@streamed_core_fps"
            local action = "plyr_front_takedown"
            
            -- Loads Anims
            RequestAnimDict(anim)
            while not HasAnimDictLoaded(anim) do
                Wait(1)
            end
            
            local object = CreateObject(pickaxe, coords.x, coords.y, coords.z, true, false, false)
            AttachEntityToEntity(object, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.0, 0.0, -90.0, 25.0, 35.0, true, true, false, true, 1, true)
            TaskPlayAnim(PlayerPedId(), anim, action, 3.0, -3.0, -1, 31, 0, false, false, false)
                local finished = exports["np-ui"]:taskBarSkill(5000,math.random( 200,400 ))
                if (finished == 100) then
                    local finished = exports["np-ui"]:taskBarSkill(5000,math.random( 200,400 ))
                    if (finished == 100) then
                        local finished = exports["np-ui"]:taskBarSkill(5000,math.random( 200,400 ))
                        if (finished == 100) then
                            if rnd == 1 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 2 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 3 then
                                TriggerEvent('np-mining:get_gem')
                                pFarmed = pFarmed + 1
                            elseif rnd == 4 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 5 then
                                TriggerEvent('np-mining:get_gem')
                                pFarmed = pFarmed + 1
                            elseif rnd == 6 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 7 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 8 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 9 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 10 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 11 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 12 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 13 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 14 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 15 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 16 then
                                TriggerEvent('np-mining:get_gem')
                                pFarmed = pFarmed + 1
                            elseif rnd == 17 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 18 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 19 then
                                TriggerEvent('np-civjobs:mines-items')
                            elseif rnd == 20 then
                                TriggerEvent('np-mining:get_gem')
                                pFarmed = pFarmed + 1
                            end
                        else
                            TriggerEvent("DoLongHudText", "Failed", 2)
                            currentlyMining = false
                            ClearPedTasks(PlayerPedId())
                            FreezeEntityPosition(playerPed, false)
                            DeleteObject(object)
                        
                        end
                    else
                        TriggerEvent("DoLongHudText", "Failed", 2)
                        currentlyMining = false
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(playerPed, false)
                        DeleteObject(object)
                    
                    end        
                else
                    TriggerEvent("DoLongHudText", "Failed", 2)
                    currentlyMining = false
                    ClearPedTasks(PlayerPedId())
                    FreezeEntityPosition(playerPed, false)
                    DeleteObject(object)
                
                end
                currentlyMining = false
                ClearPedTasks(PlayerPedId())
                FreezeEntityPosition(playerPed, false)
                DeleteObject(object)
        else
            TriggerEvent('DoLongHudText', 'You feel tired, take a break', 2)
        end
    else
		TriggerEvent('DoLongHudText', 'You need a pickaxe to mine', 2)
    end
end)

--// Events to get items

RegisterNetEvent('np-civjobs:mines-items', function()
    local roll = math.random(6)
    if roll == 1 then
        TriggerEvent('player:receiveItem', 'copper', math.random(5, 10))
        TriggerEvent('DoLongHudText', 'You Found Copper !', 1)
    elseif roll == 2 then
        TriggerEvent('player:receiveItem', 'aluminium', math.random(5, 10))
        TriggerEvent('DoLongHudText', 'You Found A', 1)
    elseif roll == 3 then
        TriggerEvent('player:receiveItem', 'scrapmetal', math.random(5, 10))
        TriggerEvent('DoLongHudText', 'You Found Scrapmetal', 1)
    elseif roll == 4 then
        TriggerEvent('player:receiveItem', 'steel', 1)
        TriggerEvent('DoLongHudText', 'You Found A Steel', 1)
    elseif roll >= 5 then
        TriggerEvent('player:receiveItem', 'mineddiamond', 1)
        TriggerEvent('DoLongHudText', 'You Found A Diamond!!', 1)
    end
end)

RegisterNetEvent('np-mining:get_gem')
AddEventHandler('np-mining:get_gem', function()
    local EvanMiningGemShit = math.random(1, 30)
    if EvanMiningGemShit < 20 then
        TriggerEvent('player:receiveItem', 'minedopal', 1)
    elseif EvanMiningGemShit == 26 then
        TriggerEvent('player:receiveItem', 'minedaquamarine', 1)
    elseif EvanMiningGemShit == 27 then
        TriggerEvent('player:receiveItem', 'minedjade', 1)
    elseif EvanMiningGemShit == 28 then
        TriggerEvent('player:receiveItem', 'mineddiamond', 1)
    elseif EvanMiningGemShit == 29 then
        TriggerEvent('player:receiveItem', 'minedgarnet', 1)
    elseif EvanMiningGemShit == 30 then
        TriggerEvent('player:receiveItem', 'minedcitrine', 1)
    end
end)

--// Polyzone

npMiningZone = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("mining_zone", vector3(-592.1, 2075.5, 131.38), 25, 4, {
        name="mining_zone",
        heading=15,
        minZ=129.18,
        maxZ=133.18
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "mining_zone" then
        npMiningZone = true     
        exports['np-interface']:showInteraction("Mining")
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "mining_zone" then
        npMiningZone = false  
        exports['np-interface']:hideInteraction()
    end
end)

--------------------


RegisterNetEvent('np-gemsell1')
AddEventHandler('np-gemsell1', function()
    if exports['np-inventory']:hasEnoughOfItem('minedjade', 1) then
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Selling Jade Gem.')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('inventory:removeItem', 'minedjade', 1)
            if exports['cool-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('zyloz:payout', math.random(250, 325))
                else
                TriggerServerEvent('zyloz:payout', math.random(100,300))
        end
   end
    else
        TriggerEvent('DoLongHudText', 'You dont got a jade gem.', 2)
    end
end)

RegisterNetEvent('np-gemsell2')
AddEventHandler('np-gemsell2', function()
    if exports['np-inventory']:hasEnoughOfItem('minedaquamarine', 1) then
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Selling Aquamarine Gem.')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('inventory:removeItem', 'minedaquamarine', 1)
            if exports['cool-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('zyloz:payout', math.random(250, 325))
                else
                TriggerServerEvent('zyloz:payout', math.random(100,300))
        end
   end
    else
        TriggerEvent('DoLongHudText', 'You dont got a Aquamarine gem.', 2)
    end
end)

RegisterNetEvent('np-gemsell3')
AddEventHandler('np-gemsell3', function()
    if exports['np-inventory']:hasEnoughOfItem('mineddiamond', 1) then
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Selling Diamond Gem.')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('inventory:removeItem', 'mineddiamond', 1)
            if exports['cool-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('zyloz:payout', math.random(250, 325))
                else
                TriggerServerEvent('zyloz:payout', math.random(100,300))
        end
   end
    else
        TriggerEvent('DoLongHudText', 'You dont got a Diamond gem.', 2)
    end
end)

RegisterNetEvent('np-gemsell4')
AddEventHandler('np-gemsell4', function()
    if exports['np-inventory']:hasEnoughOfItem('minedcitrine', 1) then
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Selling Citrine Gem.')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('inventory:removeItem', 'minedcitrine', 1)
            if exports['cool-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('zyloz:payout', math.random(250, 325))
                else
                TriggerServerEvent('zyloz:payout', math.random(100,300))
        end
   end
    else
        TriggerEvent('DoLongHudText', 'You dont got a Citrine gem.', 2)
    end
end)

RegisterNetEvent('np-gemsell5')
AddEventHandler('np-gemsell5', function()
    if exports['np-inventory']:hasEnoughOfItem('minedgarnet', 1) then
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Selling Garnet Gem.')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('inventory:removeItem', 'minedgarnet', 1)
            if exports['cool-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('zyloz:payout', math.random(250, 325))
                else
                TriggerServerEvent('zyloz:payout', math.random(100,300))
        end
   end
    else
        TriggerEvent('DoLongHudText', 'You dont got a Garnet gem.', 2)
    end
end)

RegisterNetEvent('np-gemsell6')
AddEventHandler('np-gemsell6', function()
    if exports['np-inventory']:hasEnoughOfItem('minedopal', 1) then
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Selling Opal Gem.')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('inventory:removeItem', 'minedopal', 1)
            if exports['cool-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('zyloz:payout', math.random(250, 325))
                else
                TriggerServerEvent('zyloz:payout', math.random(100,300))
        end
   end
    else
        TriggerEvent('DoLongHudText', 'You dont got a Opal gem.', 2)
    end
end)

RegisterNetEvent('np-sellingmining')
AddEventHandler('np-sellingmining', function()

	local miningsell = {
		{
            title = "Sell Jade Gem",
            description = "",
            action = 'np-gemsell_1',
            icon = 'gem',
        },
        {
            title = "Sell Aquamarine Gem",
            description = "",
            action = 'np-gemsell_2',
            icon = 'gem',
        },
        {
            title = "Sell Diamond Gem",
            description = "",
            action = 'np-gemsell_3',
            icon = 'gem',
        },
        {
            title = "Sell Citrine Gem",
            description = "",
            action = 'np-gemsell_4',
            icon = 'gem',
        },
        {
            title = "Sell Garnet Gem",
            description = "",
            action = 'np-gemsell_5',
            icon = 'gem',
        },
        {
            title = "Sell Opal Gem",
            description = "",
            action = 'np-gemsell_6',
            icon = 'gem',
        },
    }
    exports["np-interface"]:showContextMenu(miningsell)
end)

RegisterInterfaceCallback('np-gemsell_1', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-gemsell1')
end)

RegisterInterfaceCallback('np-gemsell_2', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-gemsell2')
end)

RegisterInterfaceCallback('np-gemsell_3', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-gemsell3')
end)

RegisterInterfaceCallback('np-gemsell_4', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-gemsell4')
end)

RegisterInterfaceCallback('np-gemsell_5', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-gemsell5')
end)

RegisterInterfaceCallback('np-gemsell_6', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-gemsell6')
end)