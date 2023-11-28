pCanBlow = false
canloot = false

RegisterServerEvent("np-bobcat:effect")
AddEventHandler("np-bobcat:effect", function(method)
    TriggerClientEvent("lumo:effectoutside", -1, method)
end)

RegisterServerEvent("np-bobcat:effect2")
AddEventHandler("np-bobcat:effect2", function(method)
    TriggerClientEvent("lumo:effectinside", -1, method)
end)

RegisterServerEvent('np-heists:spawnpeds',function()
    TriggerClientEvent('ghost:bobcatcreateped',-1)
end)

RegisterServerEvent("np-bobcat:bubbles")
AddEventHandler("np-bobcat:bubbles", function()
    canloot = true
    TriggerClientEvent("np-bobcat:bubbles", -1)
end)

local searched1 = false
local searched2 = false
local searched3 = false

RegisterServerEvent("np-bobcat:search_crate_1")
AddEventHandler("np-bobcat:search_crate_1", function()
    local source = source
    
    if searched1 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("np-bobcat:search_crate_1", source)
        searched1 = true
    end
end)

RegisterServerEvent("np-bobcat:search_crate_2")
AddEventHandler("np-bobcat:search_crate_2", function()
    local source = source
    
    if searched2 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("np-bobcat:search_crate_2", source)
        searched2 = true
    end
end)

RegisterServerEvent("np-bobcat:search_crate_3")
AddEventHandler("np-bobcat:search_crate_3", function()
    local source = source
    
    if searched3 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("np-bobcat:search_crate_3", source)
        searched3 = true
    end
end)

RegisterServerEvent("ghost:particleserver")
AddEventHandler("ghost:particleserver", function(method)
    TriggerClientEvent("ghost:ptfxparticle", -1, method)
end)

RegisterServerEvent('np-bobcat:blow_door')
AddEventHandler('np-bobcat:blow_door', function()
    if not pCanBlow then
        pCanBlow = true
        TriggerClientEvent('np-heists:explosion_ped_walk', source)
    end
end)

RegisterServerEvent('np-heists:bobcatLog')
AddEventHandler('np-heists:bobcatLog', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** FM | Development [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing Bobcat Security",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/ENTER_HERE", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })
end)