RegisterServerEvent("utk_oh:openvault")
AddEventHandler("utk_oh:openvault", function(method)
    TriggerClientEvent("utk_oh:openvault_c", -1, method)
end)

local pLootLowerVault = false

RegisterServerEvent('np-heists:loot_tray')
AddEventHandler('np-heists:loot_tray', function()
    local src = source
    if not pLootLowerVault then
        pLootLowerVault = true
        TriggerClientEvent('np-vault:grab', src)
        Citizen.Wait(40000)
        pLootLowerVault = false
    end
end)

RegisterServerEvent('np-heists:cash_tray')
AddEventHandler('np-heists:cash_tray', function()
    local src = source
    if not Loot then
        Loot = true
        TriggerClientEvent('np-heists:grab_from_tray', src)
        Citizen.Wait(40000)
        Loot = false
    end
end)

RegisterServerEvent('np-heists:vaultRobberyLog')
AddEventHandler('np-heists:vaultRobberyLog', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()
    local pName = GetPlayerName(source)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** FM | Nopixel [Heists] **",
          ["description"] = "Steam Name: "..pName.." | Started Robbing The Vault",
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/ENTER_HERE", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })
end)