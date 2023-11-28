local boothSettings = {}
local registerBanners = {}
local CraftItem = {}

RPC.register("np-farmersmarket:claimBooth", function(pSource, pBoothId, pCharacterId, pPassword)
    if boothSettings[pBoothId] then
        TriggerClientEvent("DoLongHudText", pSource, "Booth already claimed", 2)
        return
    end

    boothSettings[pBoothId] = {
        characterId = pCharacterId,
        owner = pSource,
        password = pPassword,
        tenants = { pCharacterId }
    }

    TriggerClientEvent("DoLongHudText", pSource, "Booth claimed!")
    TriggerClientEvent("np-farmersmarket:updateBoothSettings", pSource, boothSettings)
end)

RPC.register("np-farmersmarket:leaveBooth", function(pSource, pBoothId, pCharacterId)
    if not boothSettings[pBoothId] then
        TriggerClientEvent("DoLongHudText", pSource, "Booth not claimed", 2)
        return
    end

    if boothSettings[pBoothId].owner == pSource then
        boothSettings[pBoothId] = nil
        TriggerClientEvent("np-farmersmarket:updateBoothSettings", pSource, boothSettings)
        TriggerClientEvent("DoLongHudText", pSource, "Booth has been unclaimed", 2)
        return
    end

    for k, v in pairs(boothSettings[pBoothId].tenants) do
        if v == pCharacterId then
            table.remove(boothSettings[pBoothId].tenants, k)
            TriggerClientEvent("np-farmersmarket:updateBoothSettings", pSource, boothSettings)
            TriggerClientEvent("DoLongHudText", pSource, "Booth left!")
            return
        end

        TriggerClientEvent("DoLongHudText", pSource, "You are not a tenant of this booth.", 2)
        return
    end
end)

RPC.register("np-farmersmarket:joinBooth", function(pSource, pBoothId, pCharacterId, pPassword)
    if not boothSettings[pBoothId] then
        TriggerClientEvent("DoLongHudText", pSource, "Booth not claimed", 2)
        return
    end

    if boothSettings[pBoothId].password ~= pPassword then
        TriggerClientEvent("DoLongHudText", pSource, "Invalid password", 2)
        return
    end

    boothSettings[pBoothId].tenants[#boothSettings[pBoothId].tenants + 1] = pCharacterId

    TriggerClientEvent("DoLongHudText", pSource, "Booth joined!")
    TriggerClientEvent("np-farmersmarket:updateBoothSettings", pSource, boothSettings)
end)

RPC.register("np-farmersmarket:isAtBooth", function(pSource, pBoothId, pCharacterId)
    if not boothSettings[pBoothId] then
        TriggerClientEvent("DoLongHudText", pSource, "Booth not claimed", 2)
        return
    end

    local isAtBooth = false
    for k, v in pairs(boothSettings[pBoothId]) do
        if v == pCharacterId then
            isAtBooth = true
        end
    end

    return isAtBooth
end)

RPC.register("np-farmersmarket:getBoothCids", function(pSource, pBoothId)
    local user = exports['np-base']:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local owner = false 
    local data = {}
    for k, v in pairs(boothSettings[pBoothId].tenants) do
        local menu_data = {
            {
                id = 0,
                header = "Booth Member:",
                txt = 'CID: ' .. v,
            },     
        }
        TriggerClientEvent('np-context:sendMenu', pSource, menu_data)  
      end
    return owner
end)

RPC.register("np-farmersmarket:getBoothSettings", function(pSource, pArea)
    local boothQ = {}

    if (pArea == "paleto") then
        for i = 1, 15 do
            boothQ[i] = boothSettings[i]
        end
    elseif (pArea == "deanworld") then
        for i = 16, 30 do
            boothQ[i] = boothSettings[i]
        end
    end

    return boothQ
end)

RPC.register("np-farmersmarket:changeBoothImage", function(pSource, pBoothId, pCharacterId, pBanner)
    local bannerId = tonumber(pBanner)

    if (boothSettings[pBoothId] == nil) then
        TriggerClientEvent("DoLongHudText", pSource, "Booth not claimed", 2)
        return
    end

    if (boothSettings[pBoothId].characterId ~= pCharacterId) then
        TriggerClientEvent("DoLongHudText", pSource, "You do not own this booth", 2)
        return
    end

    if (registerBanners[bannerId] == nil) then
        TriggerClientEvent("DoLongHudText", pSource, "Banner is not registered", 2)
        return
    end

    -- see if banner register cid is the same as the cid
    if (registerBanners[bannerId].cid ~= pCharacterId) then
        TriggerClientEvent("DoLongHudText", pSource, "You do not own this banner", 2)
        return
    end

    -- change the banner
    boothSettings[pBoothId].image = tostring(registerBanners[bannerId].image)
    Wait(1000)
    TriggerClientEvent("np-farmersmarket:updateBoothSettings", pSource, boothSettings)
    TriggerClientEvent("DoLongHudText", pSource, "Banner has been changed!")
end)

RPC.register("np-farmersmarket:registerBanner", function(pSource, pData, pCid)
    local src = source

    for k, v in pairs(registerBanners) do
        if v.image == pData.image then
            TriggerClientEvent("DoLongHudText", pSource, "This banner is already registered", 2)
            return
        end
    end

    for _, v in pairs(boothSettings) do
        if v.characterId == pCid then
            registerBanners[#registerBanners + 1] = {
                image = pData.image,
                cid = pCid
            }

            TriggerClientEvent("DoLongHudText", pSource, "Your banner has been registered with id: " .. bannerId)
            return
        end

        TriggerClientEvent("DoLongHudText", pSource, "You do not own a booth", 2)
        return
    end
    return false
end)

RPC.register("np-farmersmarket:getFarmersItems", function(pSource, pSearch)
    print("Not Needed Currently 1", pSearch)
end)

RPC.register("np-farmersmarket:farmersItemAction", function(pSource, pData)
    print("Not Needed Currently 2", json.encode(pData))
end)

RPC.register("np-farmersmarket:getCraftItem", function(pSource, pId)
    print("Not Needed Currently 3", pId)
    return CraftItem[pId]
end)

RPC.register("np-farmersmarket:registerItem", function(pSource, pData, pCid)
    print("Not Needed Currently 4", pData, pCid)
    CraftItem[pCid] = pData
end)