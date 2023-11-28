--#############--
--## Void RP ##--
--#############-- 

-- Made By Evan --

local CasesHit = 0

local CanRobCases = false

local RobbedCase1 = false

local RobbedCase2 = false

local RobbedCase3 = false

local RobbedCase4 = false

local RobbedCase5 = false

local RobbedCase6 = false

local RobbedCase7 = false

RegisterNetEvent('np-jewelry:open_doors')
AddEventHandler('np-jewelry:open_doors', function()
    if exports['np-inventory']:hasEnoughOfItem('thermitecharge', 1) then
        TriggerEvent('np-hud:show_hackerman')
        ThermiteAnim()
        TriggerServerEvent('np-heists:vangelicoRobberyLog')
        exports['np-thermite']:OpenThermiteGame(function(success)
            if success then
                TriggerEvent('DoLongHudText', "Success!", 1)
                TriggerEvent('np-hud:hide_hackerman')
                CanRobCases = true
                TriggerServerEvent("np-doors:change-lock-state", 111, false)
                TriggerServerEvent("np-doors:change-lock-state", 110, false)
                TriggerEvent('np-dispatch:jewelrobbery')
                TriggerEvent('inventory:removeItem', 'thermitecharge', 1)
            else
                TriggerEvent('np-hud:hide_hackerman')
                TriggerEvent('inventory:removeItem', 'thermitecharge', 1)
                TriggerEvent('np-dispatch:jewelrobbery')
            end
        end ,5, 5 ,5)
    else
        TriggerEvent('DoLongHudText', 'You\'re missing items.', 2)
    end
end)

function ThermiteAnim()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 300.95236)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(-596.1644, -283.7503, 50.555582, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), -596.1644, -283.7503, 50.555582,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("lumo:particleserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasksImmediately(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end

RegisterNetEvent('np-heists:client_side_vangelico')
AddEventHandler('np-heists:client_side_vangelico', function()
    local pdAmt = exports["isPed"]:isPed("countpolice")
    if pdAmt >= 0 then
        exports["np-dispatch"]:dispatchadd('10-90', "Jewelry Store Robbery", "59")
        if exports['np-inventory']:hasEnoughOfItem('thermitecharge', 1) then
            TriggerServerEvent('np-heists:start_hitting_upper_vangelico')
        else
            TriggerEvent('DoLongHudText', 'You\'re missing items.', 2)
        end
    end
end)

-- Poly 3RD Eye To Trigger The Fucking Shit -- 

exports["np-polytarget"]:AddCircleZone("void_jewelry_hit_thermite",  vector3(-595.79, -283.58, 50.67), 0.6, {
    useZ = true
})

exports["np-interact"]:AddPeekEntryByPolyTarget("void_jewelry_hit_thermite", {
    {
        event = "np-heists:client_side_vangelico",
        id = "void_jewelry_hit_thermite",
        icon = "user-secret",
        label = "Begin Hacking.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

-- Polyzones For Robbing The Cases (INCLUDE ANIMATIONS ECT) --

-- Case 1 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_1",  vector3(-627.07, -233.93, 38.06), 2, 0.7, {
    heading=305,
    --debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_1", {
    {
        event = "np-heists:hit_jewelry_case_1",
        id = "nopixel_hit_case_1",
        icon = "gem",
        label = "Loot Case 1.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase1
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_1')
AddEventHandler('np-heists:hit_jewelry_case_1', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase1 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase1 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 1 --

-- Case 2 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_2",  vector3(-626.64, -234.62, 38.06), 2, 0.7, {
    heading=305,
    --debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_2", {
    {
        event = "np-heists:hit_jewelry_case_2",
        id = "nopixel_hit_case_2",
        icon = "gem",
        label = "Loot Case 2.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase2
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_2')
AddEventHandler('np-heists:hit_jewelry_case_2', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase2 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase2 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 2 --

-- Case 3 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_3",  vector3(-625.87, -238.54, 38.06), 2, 0.7, {
    heading=305,
    --debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_3", {
    {
        event = "np-heists:hit_jewelry_case_3",
        id = "nopixel_hit_case_3",
        icon = "gem",
        label = "Loot Case 3.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase3
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_3')
AddEventHandler('np-heists:hit_jewelry_case_3', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase3 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase3 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 3 --

-- Case 4 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_4",  vector3(-619.35, -234.4, 38.06), 2, 0.9, {
    heading=305,
    --debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_4", {
    {
        event = "np-heists:hit_jewelry_case_4",
        id = "nopixel_hit_case_4",
        icon = "gem",
        label = "Loot Case 4.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase4
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_4')
AddEventHandler('np-heists:hit_jewelry_case_4', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase4 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase4 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 4 --

-- Case 5 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_5",  vector3(-617.49, -229.66, 38.06), 2, 0.7, {
    heading=35,
    -- debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_5", {
    {
        event = "np-heists:hit_jewelry_case_5",
        id = "nopixel_hit_case_5",
        icon = "gem",
        label = "Loot Case 5.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase5
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_5')
AddEventHandler('np-heists:hit_jewelry_case_5', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase5 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase5 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 5 --

-- Case 6 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_6",  vector3(-619.67, -226.71, 38.06), 2, 0.7, {
    heading=35,
    -- debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_6", {
    {
        event = "np-heists:hit_jewelry_case_6",
        id = "nopixel_hit_case_6",
        icon = "gem",
        label = "Loot Case 6.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase6
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_6')
AddEventHandler('np-heists:hit_jewelry_case_6', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase6 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase6 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 6 --

-- Case 7 --

exports["np-polytarget"]:AddBoxZone("nopixel_hit_case_7",  vector3(-624.82, -227.06, 38.06), 2, 0.7, {
    heading=305,
    --debugPoly=false,
    minZ=34.46,
    maxZ=38.46
})

exports["np-interact"]:AddPeekEntryByPolyTarget("nopixel_hit_case_7", {
    {
        event = "np-heists:hit_jewelry_case_7",
        id = "nopixel_hit_case_7",
        icon = "gem",
        label = "Loot Case 7.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return CanRobCases and not RobbedCase7
    end,
});

RegisterNetEvent('np-heists:hit_jewelry_case_7')
AddEventHandler('np-heists:hit_jewelry_case_7', function()
    local playerCoords = GetEntityCoords(lPed)

    if CanRobCases then
        if not RobbedCase7 then
            if exports['np-inventory']:hasEnoughOfItem('-1074790547', 1) or exports['np-inventory']:hasEnoughOfItem('497969164', 1) or exports['np-inventory']:hasEnoughOfItem('-275439685', 1) or exports['np-inventory']:hasEnoughOfItem('171789620', 1) or exports['np-inventory']:hasEnoughOfItem('1649403952', 1) or exports['np-inventory']:hasEnoughOfItem('2227010557', 1) then
                RobbedCase7 = true
                if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
                RequestNamedPtfxAsset("scr_jewelheist")
                end
                while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
                Citizen.Wait(0)
                end
                SetPtfxAssetNextCall("scr_jewelheist")
                StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
                PlayJewelAnim("missheist_jewel") 
                TaskPlayAnim(PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerServerEvent('np-heists:vangelico_loot')
                TriggerEvent('np-heists:jewelry_player_cooldown')
            else
                TriggerEvent('DoLongHudText', 'You do not have a strong enough weapon.', 2)
            end
        end
    end
end)

-- Case 7 --

RegisterNetEvent('np-heists:jewelry_player_cooldown')
AddEventHandler('np-heists:jewelry_player_cooldown', function()
    if CasesHit == 6 then
        RobbedCase7 = false
        RobbedCase6 = false
        RobbedCase5 = false
        RobbedCase4 = false
        RobbedCase3 = false
        RobbedCase2 = false
        RobbedCase1 = false
        CanRobCases = false
        CasesHit = 0
    else
        CasesHit = CasesHit + 1
    end
end)

RegisterNetEvent('np-heists:lock_vangelico_doors_cooldown')
AddEventHandler('np-heists:lock_vangelico_doors_cooldown', function()
    TriggerServerEvent("np-doors:change-lock-state", 4, true)
    TriggerServerEvent("np-doors:change-lock-state", 5, true)
end)

-- RegisterCommand('check', function()
--     if CanRobCases then
--         print('CAN ROB CASES')
--     else
--         print('CANT ROB CASES')
--     end
-- end)

-- Functions --

function PlayJewelAnim(dict)  
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

-- Availability Shit --

RegisterNetEvent('np-heists:vangelico_available')
AddEventHandler('np-heists:vangelico_available', function()

	local JewAvail = {
		{
            title = "Jewelry Store",
            description = "Available",
            key = "VANGELICO.AVAIL",
        },
    }
    exports["np-interface"]:showContextMenu(JewAvail)
end)

RegisterNetEvent('np-heists:vangelico_unavailable')
AddEventHandler('np-heists:vangelico_unavailable', function()

	local JewUnavail = {
		{
            title = "Jewelry Store",
            description = "Unavailable",
            key = "VANGELICO.UNAVAIL",
            disabled = true,
        },
    }
    exports["np-interface"]:showContextMenu(JewUnavail)
end)