local IsHugging = false
local brother, veh = nil

RegisterNetEvent('memorial:house:brother:hug')
AddEventHandler('memorial:house:brother:hug', function()
    IsHugging = true
    PlayHugAnimation(brother)
    IsHugging = false
    TaskStartScenarioInPlace(brother, "WORLD_HUMAN_SMOKING_POT", 0, true)
end)

RegisterNetEvent('memorial:house:hug:granted')
AddEventHandler('memorial:house:hug:granted', function()
    PlayHugAnimation(PlayerPed)
    TriggerServerEvent('memorial:house:hug:completed')
    TriggerEvent("client:newStress", false, 2000)
end)

local memorialCoords =  vector3(1059.67, -386.55, 66.85)
local trunkCoords = vector3(1055.14, -385.08, 67.86)

local spawned = false

Citizen.CreateThread(function ()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())

        if not spawned and #(memorialCoords - playerCoords) <= 200.0 then
            veh = penis()
            brother = balls(bluedata)
            spawned = true
        elseif spawned and #(memorialCoords - playerCoords) > 200.0 then
            DeleteEntity(veh)
            DeleteEntity(brother)
            spawned = false
        end

        if spawned then
            if not IsHugging and not IsPedActiveInScenario(brother) then
                TaskStartScenarioInPlace(brother, "WORLD_HUMAN_SMOKING_POT", 0, true)
            end

            if #(trunkCoords - PlayerCoords) >= 2.0 and GetVehicleDoorAngleRatio(veh, 5) > 0.2 then
                SetVehicleDoorShut(veh, 5, false)
            end
        end

        Citizen.Wait(3000)
    end
end)

local hugData = { coords = vector3(1058.77, -387.18, 66.86), heading = 302.62}

Citizen.CreateThread(function()
    local intShown = false
    while true do
        local idle = 3000

        if spawned then
            idle = 100

            if #(memorialCoords - PlayerCoords) <= 1.4 and not intShown then
              intShown = true
              exports["np-interface"]:showInteraction("[E] Hug")
            elseif #(memorialCoords - PlayerCoords) > 1.4 and intShown then
              intShown = false
              exports["np-interface"]:hideInteraction()
            end

            if not IsHugging and #(memorialCoords - PlayerCoords) <= 1.4 then
                local coords = GetWorldPositionOfEntityBone(brother, 1)
                
                if IsControlJustReleased(0, 38) then
                    PrepareHug(hugData)
                    TriggerServerEvent('memorial:house:hug:request')
                end

                idle = 0 
            end

        end

        Citizen.Wait(idle)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        DeleteEntity(veh)
        DeleteEntity(brother)
        spawned = false
    end
end)
