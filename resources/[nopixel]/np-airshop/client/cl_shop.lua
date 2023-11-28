local function showVehicleMenu()
  local vehicles = RPC.execute("airshop:getVehicles")
  local data = {}
  local planes = {}
  local helis = {}

  for _, vehicle in pairs(vehicles) do
    if vehicle.type == "plane" then
      planes[#planes + 1] = {
          title = vehicle.name,
          description = "$" .. vehicle.retail_price .. ".00",
          icon = vehicle.image,
          key = vehicle.model,
          children = {
              { title = "Confirm Purchase", action = "np-ui:airshopPurchase", key = vehicle.model },
          },
      }
    else
      helis[#helis + 1] = {
          title = vehicle.name,
          description = "$" .. vehicle.retail_price .. ".00",
          icon = vehicle.image,
          key = vehicle.model,
          children = {
              { title = "Confirm Purchase", action = "np-ui:airshopPurchase", key = vehicle.model },
          },
      }
    end
  end
  data[1] = {
    title = "Planes",
    children = planes,
  }
  data[2] = {
    title = "Helicopters",
    children = helis,
  }
  exports["np-interface"]:showContextMenu(data)
end


local function showVehicleRentalMenu()
  local vehicles = RPC.execute("airshop:getVehiclesRental")
  local data = {}
  local planes = {}
  local helis = {}
  for _, vehicle in pairs(vehicles) do
    if vehicle.type == "plane" then
      planes[#planes + 1] = {
          title = vehicle.name,
          description = "$" .. vehicle.retail_price .. ".00",
          icon = vehicle.image,
          key = vehicle.model,
          children = {
              { title = "Confirm Purchase", action = "np-ui:airshopPurchaseRental", key = vehicle.model },
          },
      }
    else
      helis[#helis + 1] = {
          title = vehicle.name,
          description = "$" .. vehicle.retail_price .. ".00",
          icon = vehicle.image,
          key = vehicle.model,
          children = {
              { title = "Confirm Purchase", action = "np-ui:airshopPurchaseRental", key = vehicle.model },
          },
      }
    end
  end
  data[1] = {
    title = "Planes",
    children = planes,
  }
  data[2] = {
    title = "Helicopters",
    children = helis,
  }
  exports["np-interface"]:showContextMenu(data)
end

RegisterInterfaceCallback("np-ui:airshopPurchase", function(data, cb)
  local model = data.key
  data.model = data.key
  data.vehicle_name = GetLabelText(GetDisplayNameFromVehicleModel(data.model))

  local finished = exports["np-taskbar"]:taskBar(1000, "Purchasing...")
  if finished ~= 100 then
    cb({ data = {}, meta = { ok = false, message = "cancelled" } })
    return
  end
  local vehicleProps = exports['np-bennys']:FetchVehProps(model)
  local success, message , plate = RPC.execute("airshop:purchaseVehicle", data, vehicleProps)
  if not success then
      cb({ data = {}, meta = { ok = success, message = message } })
      return
  end
  
  local veh = NetworkGetEntityFromNetworkId(message)
  exports['np-vehicles']:SetVehiclePlate(model, plate)
  DoScreenFadeOut(200)

  Citizen.Wait(200)

  TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)

  SetEntityAsMissionEntity(veh, true, true)
  SetVehicleOnGroundProperly(veh)

  DoScreenFadeIn(2000)

  DoScreenFadeIn(2000)

  cb({ data = {}, meta = { ok = true, message =  "done" } })
end)

RegisterInterfaceCallback("np-ui:airshopPurchaseRental", function(data, cb)
  cb({ data = {}, meta = { ok = true, message =  "done" } })
  local model = data.key
  data.model = data.key
  data.vehicle_name = GetLabelText(GetDisplayNameFromVehicleModel(data.model))

  local finished = exports["np-taskbar"]:taskBar(15000, "Purchasing...")
  if finished ~= 100 then
    cb({ data = {}, meta = { ok = false, message = "cancelled" } })
    return
  end

  local success, message = RPC.execute("airshop:purchaseVehicleRental", data)

  if not success then
      TriggerEvent("DoLongHudText", message, 2)
      return
  end

  local cid = exports["isPed"]:isPed("cid")
  local rentalData = RPC.execute("np:vehicles:rentalSpawn", model, { x = -1652.21, y = -3143.04, z = 14.0 }, 325.01)
  local vehId = NetworkGetEntityFromNetworkId(rentalData)

  SetVehicleDirtLevel(vehId, 0.0)
  RemoveDecalsFromVehicle(vehId)

  local metaData = json.encode({
    model = model,
    netId = rentalData,
    state_id = cid,
  })
  TriggerEvent('player:receiveItem', 'rentalpapers', 1, false, {}, metaData)
end)

RegisterNetEvent("np-npcs:ped:vehiclekeeper")
AddEventHandler("np-npcs:ped:vehiclekeeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  -- if GetHashKey("npc_air_shop") == DecorGetInt(pEntity, "NPC_ID") then
    showVehicleMenu()
  -- end
end)

RegisterNetEvent("np-npcs:ped:vehiclekeeperrent")
AddEventHandler("np-npcs:ped:vehiclekeeperrent", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
    showVehicleRentalMenu()
end)


Citizen.CreateThread(function()
exports["np-polytarget"]:AddBoxZone("air_shop", vector3(-1621.28, -3153.01, 13.99), 1.4, 1.2, {
  name="air_shop",
  heading=0,
  --debugPoly=false,
  minZ=11.79,
  maxZ=15.79
})

exports["np-interact"]:AddPeekEntryByPolyTarget("air_shop", {
  {
    event = "np-npcs:ped:vehiclekeeperrent",
    id = 'npc_air_shop',
    icon = "circle",
    label = "Rent vehicle",
  }
  }, {
  distance = {
      radius = 2.5
  }
})

exports["np-interact"]:AddPeekEntryByPolyTarget("air_shop", {
  {
    event = "np-npcs:ped:vehiclekeeper",
    id = 'npc_air_shop2',
    icon = "circle",
    label = "Purchase vehicle",
  }

  }, {
  distance = {
      radius = 2.5
  }
})
end)

-- Entries[#Entries + 1] = {
--   type = 'flag',
--   group = { 'isNPC' },
--   data = {
--       {
--           id = "vehiclerentalkeeper",
--           label = "Rent vehicle",
--           icon = "circle",
--           event = "np-npcs:ped:vehiclekeeperrent",
--       }
--   },
--   options = {
--       distance = { radius = 3.5 },
--       npcIds = {"npc_air_shop"}
--   }
-- }
