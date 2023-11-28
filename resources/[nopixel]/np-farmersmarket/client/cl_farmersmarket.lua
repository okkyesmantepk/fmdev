local inPaletoMarket = false
local inDeanworldMarket = false

local duiReplaces = {}
local globalSettings = {}
local serverCode = "wl"

Citizen.CreateThread(function()
  serverCode = 'wl'
  local lc = 0
  while lc < 15 do
    lc = lc + 1
    local strNum = (lc < 10 and "0" or "") .. tostring(lc)
    duiReplaces[#duiReplaces + 1] = {
      id = lc,
      tex = "dw_prop_tent_scr_" .. strNum,
      txd = "dw_props",
      dui = nil
    }
  end
end)

local farmersMarketDynamicDisplayEnabled = true
RegisterCommand("disablebanners", function(source,args)
  farmersMarketDynamicDisplayEnabled = not farmersMarketDynamicDisplayEnabled
end)

function isDayTime(hideHudText)
  local hour = GetClockHours()
  local isEnabled = false
  if inPaletoMarket then
    isEnabled = (hour >= 7 and hour <= 18)
  end
  if inDeanworldMarket then
    isEnabled = (hour >= 19 or hour <= 6)
  end

  local isConfigEnabled = true -- exports['np-config']:GetMiscConfig('farmers.market.enabled')
  if isConfigEnabled == nil then
    isConfigEnabled = true
  end

  if not isConfigEnabled and not hideHudText then
    TriggerEvent("DoLongHudText", "Market is indefinitely closed!", 2)
    return false
  end

  if not isEnabled and not hideHudText then
    TriggerEvent("DoLongHudText", "Market is closed!", 2)
  end
  return isEnabled
end

function isDeanworldOpen()
  local hour = GetClockHours()
  return hour > 19 or hour < 6
end

function getBoothId(pData)
  if pData.zones["np-farmersmarket:pick_up_spot"] then
    return pData.zones["np-farmersmarket:pick_up_spot"].id
  end
  return pData.zones["np-farmersmarket:sign_in_board"].id
end

function getCid()
  return exports["isPed"]:isPed("cid")
end

function getPassword(pBoothId, pAction)
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-ui:farmersmarket:getPassword',
    key = { boothId = pBoothId, action = pAction },
    items = {
      {
        icon = "user-plus",
        label = "Password",
        name = "password",
      },
    },
    show = true,
  })
end

local function processSettings(settings, forPaleto)
  print(json.encode(settings))
  globalSettings = settings
  local isConfigEnabled = true -- exports['np-config']:GetMiscConfig('farmers.market.enabled')
  if not farmersMarketDynamicDisplayEnabled or not isConfigEnabled then return end
  for _, conf in pairs(duiReplaces) do
    local confId = isDeanworldOpen() and conf.id + 15 or conf.id --offset for deanworld
    local url = (isDayTime(true) and settings[confId]) and settings[confId].image or "https://i.imgur.com/ie675vt.png"
    if conf.dui == nil then
      conf.dui = exports["np-lib"]:getDui(url, 1024, 1024)
      AddReplaceTexture(conf.txd, conf.tex, conf.dui.dictionary, conf.dui.texture)
    else
      exports["np-lib"]:changeDuiUrl(conf.dui.id, url)
    end
  end
end

function ensureAtBooth(booth, cid)
  local isAtBooth = RPC.execute("np-farmersmarket:isAtBooth", booth, cid)
  if not isAtBooth then
    TriggerEvent("DoLongHudText", "You aren't recognized here.", 2)
    return false
  end
  return true
end

RegisterInterfaceCallback("np-ui:farmersmarket:getPassword", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['np-interface']:closeApplication('textbox')
  local booth = data.key.boothId
  local cid = getCid()
  RPC.execute(data.key.action, booth, cid, data.values.password)
end)

RegisterInterfaceCallback("np-ui:farmersmarket:changeImage", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['np-interface']:closeApplication('textbox')
  local booth = data.key.boothId
  local cid = getCid()
  RPC.execute("np-farmersmarket:changeBoothImage", booth, cid, data.values.id)
end)

AddEventHandler("np-farmersmarket:claimBooth", function(p1, p2, pData)
  if not isDayTime() then return end
  local booth = getBoothId(pData)
  getPassword(booth, 'np-farmersmarket:claimBooth')
end)
AddEventHandler("np-farmersmarket:leaveBooth", function(p1, p2, pData)
  if not isDayTime() then return end
  local booth = getBoothId(pData)
  local cid = getCid()
  if not ensureAtBooth(booth, cid) then
    return
  end
  RPC.execute('np-farmersmarket:leaveBooth', booth, cid)
end)
AddEventHandler("np-farmersmarket:joinBooth", function(p1, p2, pData)
  if not isDayTime() then return end
  local booth = getBoothId(pData)
  getPassword(booth, 'np-farmersmarket:joinBooth')
end)
AddEventHandler("np-farmersmarket:inventory", function(p1, p2, pData)
  if not isDayTime() then return end
  local booth = getBoothId(pData)
  local cid = getCid()
  if not ensureAtBooth(booth, cid) then
    return
  end
  TriggerEvent("server-inventory-open", "1", "farmersmarket_inventory_" .. tostring(booth) .. "-" .. serverCode, 1000)
end)
AddEventHandler("np-farmersmarket:pickup", function(p1, p2, pData)
  if not isDayTime() then return end
  local booth = getBoothId(pData)
  TriggerEvent("server-inventory-open", "1", "farmersmarket_pickup_" .. tostring(booth) .. "-" .. serverCode, 1000)
end)
AddEventHandler("np-farmersmarket:changeBoothImage", function(p1, p2, pData)
  if not isDayTime() then return end
  local booth = getBoothId(pData)
  local cid = getCid()
  if not ensureAtBooth(booth, cid) then
    return
  end
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-ui:farmersmarket:changeImage',
    key = { boothId = booth },
    items = {
      {
        icon = "fingerprint",
        label = "Banner ID",
        name = "id",
      },
    },
    show = true,
  })
end)
AddEventHandler("np-farmersmarket:getBoothCids", function(p1, p2, pData)
  local booth = getBoothId(pData)
  RPC.execute('np-farmersmarket:getBoothCids', booth)
end)

RegisterInterfaceCallback("np-ui:farmersmarket:generateVendorLicense", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['np-interface']:closeApplication('textbox')
  TriggerEvent("player:receiveItem", "vendorlicense", 1, false, {
    state_id = data.values.state_id,
    expires = data.values.expiry,
  })
end)

AddEventHandler("np-farmersmarket:generateVendorLicense", function()
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-ui:farmersmarket:generateVendorLicense',
    key = 1,
    items = {
      {
        icon = "id-card-alt",
        label = "State ID",
        name = "state_id",
      },
      {
        icon = "calendar",
        label = "Expiry Date",
        name = "expiry",
      },
    },
    show = true,
  })
end)

local ingredientsMap = {
  ["food"] = {
    ingredient = "foodingredient",
    craft = "customfooditem",
  },
  ["water"] = {
    ingredient = "water",
    craft = "customwateritem",
  },
  ["coffee"] = {
    ingredient = "coffeebeans",
    craft = "customcoffeeitem",
  },
  ["joint"] = {
    ingredient = "joint2",
    craft = "customjointitem",
  },
  ["ciggy"] = {
    ingredient = "tobacco",
    craft = "customciggyitem",
  },
  ["bandage"] = {
    ingredient = "gause",
    craft = "custombandageitem",
  },
  ["other"] = {
    ingredient = "merchingredient",
    craft = "custommerchitem",
  },
}

RegisterInterfaceCallback("np-ui:farmersmarket:craftItems", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['np-interface']:closeApplication('textbox')
  local result = RPC.execute("np-farmersmarket:getCraftItem", data.values.id)
  if not result then
    TriggerEvent("DoLongHudText", "ID not recognized / approved", 2)
    return
  end
  local ingredient = ingredientsMap[result.item_type].ingredient
  local qty = tonumber(data.values.quantity)
  if not exports["np-inventory"]:hasEnoughOfItem(ingredient, qty) then
    TriggerEvent("DoLongHudText","Not enough ingredients" .. " (" .. ingredient .. ")", 2, 12000, { i18n = { "Not enough ingredients" }})
    return
  end

  if ingredient == 'joint2' then
    local joints = exports['np-inventory']:getItemsOfType('joint2', qty, true)
    local itemInfo = json.decode(joints[1].information)
    if itemInfo.strain then
      result.description = result.description .. '<br>Strain: ' .. itemInfo.strain
    end
  end

  TriggerEvent("inventory:removeItem", ingredient, qty)
  TriggerEvent("player:receiveItem", ingredientsMap[result.item_type].craft, qty, false, {
    _hideKeys = { "_image_url", "_name", "_description", "_remove_id" },
    _image_url = result.image,
    _name = result.name,
    _description = result.description,
    _remove_id = math.random(10000000, 999999999),
  })
end)

AddEventHandler("np-farmersmarket:craftItem", function()
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-ui:farmersmarket:craftItems',
    key = 1,
    items = {
      {
        icon = "fingerprint",
        label = "ID",
        name = "id",
      },
      {
        icon = "sort-numeric-up-alt",
        label = "Quantity",
        name = "quantity",
      },
    },
    show = true,
  })
end)

RegisterNetEvent("np-farmersmarket:updateBoothSettings")
AddEventHandler("np-farmersmarket:updateBoothSettings", function(pBoothSettings)
  if inPaletoMarket or inDeanworldMarket then
    processSettings(pBoothSettings)
  end
end)

RegisterInterfaceCallback("np-ui:farmersmarket:registerItem", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['np-interace']:closeApplication('textbox')
  RPC.execute("np-farmersmarket:registerItem", data.values, getCid())
end)

AddEventHandler("np-farmersmarket:registerItem", function()
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-ui:farmersmarket:registerItem',
    key = 1,
    items = {
      {
        _type = "select",
        options = {
          {
            id = "food",
            name = "Food",
          },
          {
            id = "water",
            name = "Drink",
          },
          {
            id = "coffee",
            name = "Coffee",
          },
          {
            id = "joint",
            name = "Joint",
          },
          {
            id = "ciggy",
            name = "Ciggies",
          },
          {
            id = "bandage",
            name = "First Aid Kits",
          },
          {
            id = "other",
            name = "Other (Apparel, etc)",
          },
        },
        label = "Type",
        name = "item_type",
      },
      {
        icon = "id-card-alt",
        label = "Name",
        name = "name",
      },
      {
        icon = "pencil-alt",
        label = "Description",
        name = "description",
      },
      {
        icon = "image",
        label = "Image" .. " (i.imgur.com/example.png; 100x100px)",
        name = "image",
      },
    },
    show = true,
  })
end)

RegisterInterfaceCallback("np-ui:farmersmarket:registerBanner", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  exports['np-interface']:closeApplication('textbox')
  RPC.execute("np-farmersmarket:registerBanner", data.values, getCid())
end)

AddEventHandler("np-farmersmarket:registerBanner", function()
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-ui:farmersmarket:registerBanner',
    key = 1,
    items = {
      {
        icon = "image",
        label = "Image" .. " (i.imgur.com/example.png; 1024x1024px)",
        name = "image",
      },
    },
    show = true,
  })
end)

RegisterInterfaceCallback("np-ui:getFarmersItems", function(data, cb)
  local result = RPC.execute("np-farmersmarket:getFarmersItems", data.search)
  cb({ data = result, meta = { ok = true, message = '' } })
end)
RegisterInterfaceCallback("np-ui:farmersItemAction", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  RPC.execute("np-farmersmarket:farmersItemAction", data)
end)

--

AddEventHandler("np-polyzone:enter", function(zone, data)
  if zone ~= "farmers_market" then return end
  if data.id == "paleto" then
    inPaletoMarket = true
    local settings = RPC.execute("np-farmersmarket:getBoothSettings", "paleto")
    processSettings(settings, true)
    return
  end
  if data.id == "deanworld" then
    inDeanworldMarket = true
    local settings = RPC.execute("np-farmersmarket:getBoothSettings", "deanworld")
    processSettings(settings, false)
    return
  end
end)

AddEventHandler("np-polyzone:exit", function(zone, data)
  if zone ~= "farmers_market" then return end
  local isConfigEnabled = true -- exports['np-config']:GetMiscConfig('farmers.market.enabled')
  if inPaletoMarket then
    inPaletoMarket = false
    if not farmersMarketDynamicDisplayEnabled or not isConfigEnabled then return end
    for _, conf in pairs(duiReplaces) do
      RemoveReplaceTexture(conf.txd, conf.tex)
      exports["np-lib"]:releaseDui(conf.dui.id)
      conf.dui = nil
    end
    return
  end
  if inDeanworldMarket then
    inDeanworldMarket = false
    if not farmersMarketDynamicDisplayEnabled or not isConfigEnabled then return end
    for _, conf in pairs(duiReplaces) do
      RemoveReplaceTexture(conf.txd, conf.tex)
      exports["np-lib"]:releaseDui(conf.dui.id)
      conf.dui = nil
    end
    return
  end
end)

RegisterNetEvent("np-farmersmarket:receiveWorkReceipt")
AddEventHandler("np-farmersmarket:receiveWorkReceipt", function()
  if inDeanworldMarket or inPaletoMarket then
    TriggerEvent("player:receiveItem", "farmersmarketreceipt", 1)
    local shouldIncreaseJobPayout = exports["np-buffs"]:shouldIncreaseJobPayout()
    if shouldIncreaseJobPayout then
      Wait(500)
      TriggerEvent("player:receiveItem", "farmersmarketreceipt", 1)
    end
  end
end)