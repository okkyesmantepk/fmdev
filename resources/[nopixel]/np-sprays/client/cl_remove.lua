RegisterNetEvent('ghost_spray:removeClosestSpray')
AddEventHandler('ghost_spray:removeClosestSpray', function()

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local closestSprayLoc = nil
    local closestSprayDist = nil

    local dist = 'timetable@maid@cleaning_window@idle_a'
    local name = 'idle_a'

    for _, spray in pairs(SPRAYS) do
        local sprayPos = spray.location
        local dist = #(sprayPos - coords)

        if dist < 3.0 and (not closestSprayDist or closestSprayDist > dist) then
            closestSprayLoc = sprayPos
            closestSprayDist = dist
        end
    end

    if closestSprayLoc then
        local ragProp = CreateSprayRemoveProp(ped)
        TriggerEvent('animation:PlayAnimation', 'kneel')
        local finished = exports["np-taskbar"]:taskBar(15000, "Removing", false, true, false, false, nil, 5.0, PlayerPedId())
        if finished == 100 then
            TriggerEvent("inventory:removeItem", 'paint_stripper', 1)
            RemoveSprayRemoveProp(ragProp)
            TriggerServerEvent('ghost_spray:remove', closestSprayLoc)
        else
            RemoveSprayRemoveProp(ragProp)
        end

    else
        TriggerEvent('DoLongHudText',Config.Text.NO_SPRAY_NEARBY,2)
    end
end)

function CreateSprayRemoveProp(ped)
    local ragProp = CreateObject(
        "p_loose_rag_01_s", --`prop_ecola_can`,
        0.0, 0.0, 0.0,
        true, false, false
    )

    AttachEntityToEntity(ragProp, ped, GetPedBoneIndex(ped, 28422), x, y, z, ax, ay, az, true, true, false, true, 1, true)

    return ragProp
end

function RemoveSprayRemoveProp(ent)
    if NetworkGetEntityOwner(ent) ~= PlayerId() then
        debugMessage("ERROR: Rag prop has migrated! Need to delete serverside")
    end

    DeleteEntity(ent)
end