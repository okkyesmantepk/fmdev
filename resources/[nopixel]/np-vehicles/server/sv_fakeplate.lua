-- By | Ghost.#4736

local old_plates = {}

RPC.register("np-vehicles:addFakePlate", function(src, oldPlate)
    local newPlate = randomPlate()
    local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    exports.oxmysql:execute([[
        UPDATE characters_cars
        SET license_plate = ?
        WHERE license_plate = ?
    ]],
    { newPlate, oldPlate })
    old_plates[src] = {plate = oldPlate}
    TriggerClientEvent("inventory:removeItem", src, "fakeplate", 1)
    return newPlate
end)

RPC.register("np-vehicles:removeFakePlate", function(src, pPlate)
    local oldPlate = old_plates[src]['plate']
    exports.oxmysql:execute([[
        UPDATE characters_cars
        SET license_plate = ?
        WHERE license_plate = ?
    ]],
    { oldPlate , pPlate })
    TriggerClientEvent("player:receiveItem", src, "fakeplate", 1)
    old_plates[src] = {plate = oldPlate}
    return oldPlate
end)

function randomPlate()
    for i = 1, 1000 do
        local characterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local keyLength = 8
        local plate = ""
        for i2 = 1, keyLength do
            local rand = math.random(#characterSet)
            plate = plate .. string.sub(characterSet, rand, rand)
        end
        local exist = exports.oxmysql:execute([[ 
            SELECT id
            FROM characters_cars
            WHERE license_plate = ?
        ]],
        { plate })
        if not exist then -- Make sure a players plate is not the same as this D:
            return plate
        end
    end
end
