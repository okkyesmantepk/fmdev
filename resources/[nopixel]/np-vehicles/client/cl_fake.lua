DecorRegister("Vehicle-Fakeplate", 2)

AddEventHandler("vehicle:addFakePlate", function()
    local vehicle = nil
    local target = exports["np-interact"]:GetCurrentEntity()
    if DoesEntityExist(target) and GetEntityType(target) == 2 and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(target)) < 5 then
        vehicle = target
    end
    if not vehicle then return end

    local vIdentifier = GetVehicleIdentifier(vehicle)
    if not vIdentifier then return TriggerEvent('DoLongHudText','Cannot put on local car..',2) end
    local plate = GetVehiclePlate(vehicle)
    TriggerEvent('animation:PlayAnimation', 'kneel')
    local finished = exports["np-taskbar"]:taskBar(12000,"Swapping Plates...")
    if finished == 100 then
        ClearPedTasks(PlayerPedId())
        local plate = RPC.execute("np-vehicles:addFakePlate", plate)
        if plate then
            SetVehiclePlate(vehicle, plate)
            Sync.DecorSetBool(vehicle, "Vehicle-Fakeplate", true)
        end
    else
        ClearPedTasks(PlayerPedId())
    end
end)

AddEventHandler("vehicle:removeFakePlate", function()
    local vehicle = nil
    local target = exports["np-interact"]:GetCurrentEntity()
    if DoesEntityExist(target) and GetEntityType(target) == 2 and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(target)) < 5 then
        vehicle = target
    end

    if not vehicle then return end
    local vid = GetVehicleIdentifier(vehicle)
    if not vid then return end

    local plateRmove = GetVehiclePlate(vehicle)
    local plate = RPC.execute("np-vehicles:removeFakePlate", plateRmove)
    if plate then
        TriggerEvent('animation:PlayAnimation', 'kneel')
        local finished = exports["np-taskbar"]:taskBar(12000,"Swapping Plates...")
        if finished == 100 then
            ClearPedTasks(PlayerPedId())
            SetVehiclePlate(vehicle, plate)
            Sync.DecorSetBool(vehicle, "Vehicle-Fakeplate", false)
        else
            ClearPedTasks(PlayerPedId())
        end
    end
end)

-- Ghost.#4736 