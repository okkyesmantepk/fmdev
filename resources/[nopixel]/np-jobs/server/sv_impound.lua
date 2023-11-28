RegisterServerEvent('np-impound:select_plate')
AddEventHandler('np-impound:select_plate', function(pPlate)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `name`, `license_plate`, `cid`, `vehicle_state`, `current_garage` FROM `characters_cars` WHERE license_plate = @license_plate",
    {['@license_plate'] = pPlate}, function(pValues)
        if pValues[1].current_garage == "Full Impound" or pValues[1].current_garage == "Normal Impound" then
            if char.id == pValues[1].cid then
                TriggerClientEvent('np-impound:show_car', src, pValues[1].name, pValues[1].license_plate, false)
            else
                TriggerClientEvent('DoLongHudText', src, 'This isn\'t your vehicle.', 2)
            end
        else
            TriggerClientEvent('DoLongHudText', src, 'You\'re vehicle isnt in the impound.', 2)
        end
    end)
end)

RegisterServerEvent('np-impound:release_car')
AddEventHandler('np-impound:release_car', function(pPlate)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `name`, `license_plate`, `cid`, `current_garage` FROM `characters_cars` WHERE license_plate = @license_plate", {['@license_plate'] = pPlate}, function(pValues)
        if pValues[1].current_garage == "Full Impound" then
            if user:getCash() >= 5000 then
                user:removeMoney(5000)
                TriggerClientEvent('DoLongHudText', src, 'Go to the garage at the left side of the lot your vehicle should be in their !')
                exports.oxmysql:execute('UPDATE `characters_cars` SET `current_garage` = @current_garage WHERE `license_plate` = @plate', { ['@current_garage'] = 'Impound Lot', ['@plate'] = pPlate}, function()
                    exports.oxmysql:execute('UPDATE `characters_cars` SET `current_garage` = @current_garage WHERE `license_plate` = @plate',
                        {
                            ['@current_garage'] = 'Impound Lot',
                            ['@plate'] = pPlate
                        }, function()
                    end)
                end)
            else
                TriggerClientEvent('DoLongHudText', src, 'It will cost $5000 to release your vehicle.')
            end
        elseif pValues[1].current_garage == "Normal Impound" then
            if user:getCash() >= 1000 then
                user:removeMoney(1000)
                TriggerClientEvent('DoLongHudText', src, 'Go to the garage at the left side of the lot your vehicle should be in their !')
                exports.oxmysql:execute('UPDATE `characters_cars` SET `current_garage` = @current_garage WHERE `license_plate` = @plate',
                    {
                        ['@current_garage'] = 'Impound Lot',
                        ['@plate'] = pPlate
                    }, function()
                end)
            else
                TriggerClientEvent('DoLongHudText', src, 'It will cost $100 to release your vehicle.')
            end
        end
    end)
end)


-- // Impounding System \\ --

-- // Full Impound \\ --

RegisterNetEvent('np-imp:FullImpound')
AddEventHandler('np-imp:FullImpound', function(plate)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `vin`, `license_plate`, `model` FROM `characters_cars` WHERE license_plate = @license_plate",
    {['@license_plate'] = plate}, function(pValues)
        if pValues[1].vin == "1" then

            local connect = {
                {
                  ["color"] = color,
                  ["title"] = "** FM | Nopixel [Impound] | Vin Scratch **",
                  ["description"] = "** Vin Scratch Impounded [DELETED] ** \n Vehicle Model: "..pValues[1].model.." \nVehicle Plate: "..pValues[1].license_plate.." \nImpounded By: "..char.first_name.." "..char.last_name,
                }
              }
              PerformHttpRequest("https://discord.com/api/webhooks/ENTER_HERE", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })

            exports.oxmysql:execute("DELETE FROM characters_cars WHERE license_plate = @license_plate", {['@license_plate'] = plate}, function() end)
        else
            exports.oxmysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage, coords = @coords WHERE license_plate = @plate", {['garage'] = 'Full Impound', ['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
        end
    end)
end)

-- // Impound Vehicle \\ --

RegisterNetEvent('np-imp:NormalImpound')
AddEventHandler('np-imp:NormalImpound', function(plate)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.oxmysql:execute("SELECT `vin`, `license_plate`, `model` FROM `characters_cars` WHERE license_plate = @license_plate",
    {['@license_plate'] = plate}, function(pValues)
        if pValues[1].vin == "1" then
            
            local connect = {
                {
                  ["color"] = color,
                  ["title"] = "** FM | Nopixel [Impound] | Vin Scratch **",
                  ["description"] = "** Vin Scratch Impounded [DELETED] ** \n Vehicle Model: "..pValues[1].model.." \nVehicle Plate: "..pValues[1].license_plate.." \nImpounded By: "..char.first_name.." "..char.last_name,
                }
              }
              PerformHttpRequest("https://discord.com/api/webhooks/ENTER_HERE", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })

            exports.oxmysql:execute("DELETE FROM characters_cars WHERE license_plate = @license_plate", {['@license_plate'] = plate}, function() end)
        else
            exports.oxmysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage, coords = @coords WHERE license_plate = @plate", {['garage'] = 'Normal Impound', ['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
        end
    end)
end)

-- // Scuff Impound \\ --

RegisterNetEvent('np-imp:ScuffImpound')
AddEventHandler('np-imp:ScuffImpound', function(plate)
    exports.oxmysql:execute("UPDATE characters_cars SET vehicle_state = @state, coords = @coords WHERE license_plate = @plate", {['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)