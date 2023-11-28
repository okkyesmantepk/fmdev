-- By - Ghost.#4736

local wheelInUse = false

RPC.register("np-wheelfitment_sv:setIsWheelFitmentInUse", function(pSource, pBool)
    wheelInUse = pBool
end)

RPC.register("np-wheelfitment_sv:getIsWheelFitmentInUse", function(pSource)
    return wheelInUse
end)

RPC.register("np-wheelfitment_sv:checkIfWhitelisted", function(pSource)
    return true
end)

RegisterNetEvent('np-wheelfitment_sv:saveWheelfitment')
AddEventHandler('np-wheelfitment_sv:saveWheelfitment', function(pPlate, data)
    local pSrc = source
    if pPlate == nil or pPlate == 0 or pPlate == "" then return end
    exports.oxmysql:execute("UPDATE characters_cars SET wheelfitment = @wheelfitment WHERE license_plate = @license_plate", {
        ['@wheelfitment'] = data,
        ['@license_plate'] = pPlate
    })
end)

RegisterNetEvent("np-wheelfitment:GetVehicleStatus", function(plate, pVehicle)
    local src = source
    exports.oxmysql:execute("SELECT `wheelfitment` FROM characters_cars WHERE license_plate = @license_plate", {['license_plate'] = plate}, function(result)
        if result[1] ~= nil then
			if result[1].wheelfitment == '{"fr":0.71801799535751, "fl":-0.72000002861023, "width":1.0, "rl":-0.71801799535751, "rr":0.71801799535751}' then
                return
			else
                TriggerClientEvent('np-wheelfitment_cl:applySavedWheelFitment',src, pVehicle, result[1].wheelfitment)                return
			end
		end
    end)
end)