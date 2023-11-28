RegisterServerEvent('rolexdelivery:server')
AddEventHandler('rolexdelivery:server', function(money)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(source)

	if user:getCash() >= 500 then
        user:removeMoney(500)

		TriggerClientEvent("rolexdelivery:startDealing", src)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough for this', 2)
	end
end)

RegisterServerEvent('np-activities:pawnPayout')
AddEventHandler('np-activities:pawnPayout', function(amount, text)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()

    user:addMoney(amount)

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** FM | Nopixel [Activities] | Payout Log **",
          ["description"] = "Pawn Run Payout Log | Amount: $"..amount.." | (Buff / No Buff): "..text.." | Character Name: "..charInfo.first_name.." "..charInfo.last_name.." | State ID: "..charInfo.id,
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/ENTER_HERE", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })
end)