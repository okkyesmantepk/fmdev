local radarEsteso = false
local mostrablip = false
local isENABLED = false

RegisterNetEvent('np-admin:ToggleNames',function()
    TriggerServerEvent('np-admin:ToggleNames')
end)

RegisterNetEvent('np-admin:ToggleBlips',function()
    TriggerServerEvent('np-admin:ToggleBlips')
end)

RegisterNetEvent('showBlips')
AddEventHandler('showBlips', function()
    mostrablip = not mostrablip
    if mostrablip then
        mostrablip = true
        TriggerEvent('DoLongHudText', 'Blips Enabled.',1)
    else
        mostrablip = false
        TriggerEvent('DoLongHudText', 'Blips Disabled.',2)
    end
end)

RegisterNetEvent('showNames')
AddEventHandler('showNames', function()
    isENABLED = not isENABLED
    if isENABLED then
        isENABLED = true
        -- notifica blips abilitati
        TriggerEvent('DoLongHudText', 'Names Enabled.',1)
    else
        isENABLED = false
        -- notifica blips disabilitati
        TriggerEvent('DoLongHudText', 'Names Disabled.',2)
    end
end)

Citizen.CreateThread(function()
    while true do
    Wait(1)
    -- control of the player, if it exists and has an id.
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) and GetPlayerPed(i) ~= GetPlayerPed(-1) then
            ped = GetPlayerPed(i)
            blip = GetBlipFromEntity(ped)
            -- Create the name on the player's head
            idTesta = Citizen.InvokeNative(0xBFEFE3321A3F5015, ped, GetPlayerName(i), false, false, "", false)

            if isENABLED then
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, true) -- Adds the player's name on the head
                -- Shows if the player is speaking.
                if NetworkIsPlayerTalking(i) then
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, true)
                else
                    Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                end
            else -- Rimuove tutti i blip se isENABLED = false
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 9, false)
                Citizen.InvokeNative(0x63BB75ABEDC1F6A0, idTesta, 0, false)
            end

            if mostrablip then
                if not DoesBlipExist(blip) then -- With this I add the blips on the players head.
                    blip = AddBlipForEntity(ped)
                    SetBlipSprite(blip, 1) -- I set the blip to the "blip" position with the id 1
                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Agactually comes the blip
                else -- se il blip esiste, allora lo aggiorno
                    veh = GetVehiclePedIsIn(ped, false) -- I use this to update every time the vehicle the ped got on
                    blipSprite = GetBlipSprite(blip)
                    if not GetEntityHealth(ped) then -- check if the player is dead or not
                        if blipSprite ~= 274 then
                            SetBlipSprite(blip, 274)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                        end
                    elseif veh then -- check if the player is on a vehicle.
                        calsseVeicolo = GetVehicleClass(veh)
                        modelloVeicolo = GetEntityModel(veh)
                        if calsseVeicolo == 15 then -- Class 15 indicates a flying vehicle
                            if blipSprite ~= 422 then -- check if the blip is not the 422, or the plane
                                SetBlipSprite(blip, 422) -- if true impost.
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif calsseVeicolo == 16 then -- controllo se il ped sta su un aereo
                            if modelloVeicolo == GetHashKey("besra") or modelloVeicolo == GetHashKey("hydra") or modelloVeicolo == GetHashKey("lazer") then -- check if the model is a military jet
                                if blipSprite ~= 424 then
                                    SetBlipSprite(blip, 424)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif blipSprite ~= 423 then
                                SetBlipSprite(blip, 423)
                                Citizen.InvokeNative (0x5FBCA48327B914DF, blip, false)
                            end
                        elseif calsseVeicolo == 14 then -- boat
                            if blipSprite ~= 427 then
                                SetBlipSprite(blip, 427)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                            end
                        elseif modelloVeicolo == GetHashKey("insurgent") or modelloVeicolo == GetHashKey("insurgent2") or modelloVeicolo == GetHashKey("limo2") then
                                if blipSprite ~= 426 then
                                    SetBlipSprite(blip, 426)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif modelloVeicolo == GetHashKey("rhino") then -- tank
                                if blipSprite ~= 421 then
                                    SetBlipSprite(blip, 421)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif blipSprite ~= 1 then -- default blip
                                SetBlipSprite(blip, 1)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            end
                            -- Show number in case of passangers
                            passengers = GetVehicleNumberOfPassengers(veh)
                            if passengers then
                                if not IsVehicleSeatFree(veh, -1) then
                                    passengers = passengers + 1
                                end
                                ShowNumberOnBlip(blip, passengers)
                            else
                                HideNumberOnBlip(blip)
                            end
                        else
                            -- If none of the elses for cars match, then I set the normal blip.
                            HideNumberOnBlip(blip)
                            if blipSprite ~= 1 then -- the default blip is 1
                                SetBlipSprite(blip, 1)
                                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                            end
                        end
                        SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- with this I update the rotation depending on the vehicle
                        SetBlipNameToPlayerName(blip, i) -- they updated the player's blip
                        SetBlipScale(blip, 0.85) -- dimension
                        -- if the large map menu is open, then I set the blip to a maximum alpha
                        -- with this I then check the distance to the player for the name on the head
                        if IsPauseMenuActive() then
                            SetBlipAlpha(blip, 255)
                        else -- if the first is not confirmed
                            x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) -- I didn't put the z because I don't need it
                            x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(i), true)) -- same below
                            distanza = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
                            -- I did it like this because yes....
                            if distanza < 0 then
                                distanza = 0
                            elseif distanza > 255 then
                                distanza = 255
                            end
                            SetBlipAlpha(blip, distanza)
                        end
                    end
                else
                    RemoveBlip(blip)
                end
            end
        end
    end
end)