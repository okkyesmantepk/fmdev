RPC.register('airshop:getVehicles',function()
    return purchaseable_aircraft
end)

RPC.register('airshop:getVehiclesRental',function()
    return rental_aircrafts
end)

RPC.register('airshop:purchaseVehicleRental',function(source,pData)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local model = pData['model']
    if user:getCash() >= rental_aircrafts[model].retail_price then
        user:removeMoney(tonumber(rental_aircrafts[model].retail_price))
        Wait(50)
        return true ,'Success'
    else 
        return false ,'Not enough cash..'
    end
end)

RPC.register('np:vehicles:rentalSpawn',function(source,model,coords)
    local getHash = GetHashKey(model)
    local netId = CreateVehicle(getHash,coords.x,coords.y,coords.z,150,true,true)
    return netId
end)


---------------  Add to garage.. -----

RPC.register('airshop:purchaseVehicle',function(source,data,plate,vehprops)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local model = data['model']
    if user:getCash() >= purchaseable_aircraft[model].retail_price then
        local getHash = GetHashKey(model)
        local netId = CreateVehicle(getHash, -1652.21 ,-3143.04 ,14.0,150,true,true)
        local generated_plate = genRandomPlate()
        local returnVal = AddVehicleToGarage(src,generated_plate,model,vehprops)
        return true , netId , returnVal
    else 
        return false , 'Not enough cash..'
    end
end)