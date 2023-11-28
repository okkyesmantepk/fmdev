RegisterCommand("remove_spray", function(source,args)
    TriggerClientEvent('ghost_spray:removeClosestSpray', args[1] and 1 or 2)
end)

RegisterNetEvent('ghost_spray:remove')
AddEventHandler('ghost_spray:remove', function(pos)
    local Source = source

    local bypass = true
    if bypass then
        print('Remove spray_remover')
        local sprayAtCoords = GetSprayAtCoords(pos)

        MySQL.Async.execute([[
            DELETE FROM sprays WHERE x=@x AND y=@y AND z=@z LIMIT 1
        ]], {
            ['@x'] = pos.x,
            ['@y'] = pos.y,
            ['@z'] = pos.z,
        })

        for idx, s in pairs(SPRAYS) do
            if s.location.x == pos.x and s.location.y == pos.y and s.location.z == pos.z then
                SPRAYS[idx] = nil
            end
        end
        TriggerClientEvent('ghost_spray:setSprays', -1, SPRAYS)

        local sprayAtCoordsAfterRemoval = GetSprayAtCoords(pos)

        -- ensure someone doesnt bug it so its trying to remove other tags

        if sprayAtCoords and not sprayAtCoordsAfterRemoval then
            TriggerEvent('ghost_sprays:removeSpray', Source, sprayAtCoords.text, sprayAtCoords.location)
        end
    end
end)