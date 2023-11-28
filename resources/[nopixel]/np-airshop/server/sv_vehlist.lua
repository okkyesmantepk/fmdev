purchaseable_aircraft = {
    ['luxor'] = { 
        type = 'plane',
        model = 'luxor',
        name = 'Luxor Deluxe',
        image = 'plane',
        retail_price = 75000, 
    }, 
    ['vestra'] = { 
        type = 'plane',
        model = 'vestra',
        name = 'Vestra',
        image = 'plane',
        retail_price = 55000, 
    }, 

    ['milljet'] = { 
        type = 'plane',
        model = 'milljet',
        name = 'Milljet',
        image = 'plane',
        retail_price = 65000, 
    }, 

    -- Helicopters .. --

    ['swift'] = { 
        type = 'helicopter',
        model = 'swift',
        name = 'Swift',
        image = 'helicopter',
        retail_price = 45000, 
    }, 

    ['frogger'] = { 
        type = 'helicopter',
        model = 'frogger',
        name = 'Frogger',
        image = 'helicopter',
        retail_price = 15000, 
    }, 
}

rental_aircrafts = {
    ['luxor'] = { 
        type = 'plane',
        model = 'luxor',
        name = 'Luxor Deluxe',
        image = 'plane',
        retail_price = 55000, 
    },
    ['luxor2'] = { 
        type = 'plane',
        model = 'luxor2',
        name = 'Luxor Deluxe (Gold)',
        image = 'plane',
        retail_price = 105000, 
    },
    ['duster'] = { 
        type = 'plane',
        model = 'duster',
        name = 'Duster',
        image = 'plane',
        retail_price = 15000, 
    }, 

    -- Helicopters .. --

    ['swift'] = { 
        type = 'helicopter',
        model = 'swift',
        name = 'Swift',
        image = 'helicopter',
        retail_price = 19000, 
    }, 
    ['frogger'] = { 
        type = 'helicopter',
        model = 'frogger',
        name = 'Frogger',
        image = 'helicopter',
        retail_price = 11000, 
    }, 
    ['maverick'] = { 
        type = 'helicopter',
        model = 'maverick',
        name = 'Maverick',
        image = 'helicopter',
        retail_price = 10000, 
    }, 
    ['supervolito2'] = { 
        type = 'helicopter',
        model = 'supervolito2',
        name = 'SuperVolito',
        image = 'helicopter',
        retail_price = 25000, 
    }, 
}   

-- Func 

function AddVehicleToGarage(src, plate, vehicle , extraData)
    local source = tonumber(src)
    local user = exports['np-base']:getModule("Player"):GetUser(source)
    local cid = user:getCurrentCharacter().id
    exports.oxmysql:execute('INSERT INTO characters_cars (cid, license_plate, model, data, purchase_price, name, vehicle_state, current_garage) VALUES (@cid, @license_plate, @model, @data, @purchase_price, @name, @vehicle_state, @current_garage)',{
        ['@cid']   = cid,
        ['@license_plate']  = plate,
        ['@model'] = vehicle,
        ['@data'] = json.encode(extraData),
        ['@name'] = vehicle,
        ['@purchase_price'] = 0,
        ['@current_garage'] = "C",
        ['@vehicle_state'] = "Out",
    })
    return plate								 
end

function genRandomPlate()
    for i = 1, 1000 do
        local characterSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local keyLength = 8
        local plate = ""
        for _ = 1, keyLength do
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
