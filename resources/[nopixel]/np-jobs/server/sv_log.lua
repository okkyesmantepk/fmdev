RegisterServerEvent('np-civjobs:errorlog')
AddEventHandler('np-civjobs:errorlog', function(pErrorCode)
    local timeout = os.time()
    if (os.time() - timeout) < 5 then
        print(("[TIMEOUT] %s is spamming the event (%s)"):format(source, "np-civjobs:errorlog"))
        timeout = os.time()
        return
    end
    if pErrorCode == 0x66 then
        exports["np-log"]:AddLog("Civ Jobs", 
            source, 
            "Pressed Alt (KEY-19) while in Inventory trying to open menu", 
            { message = tostring(message) })
    end

    timeout = os.time()
    return
end)

RegisterServerEvent('np-jobs:givePayout')
AddEventHandler('np-jobs:givePayout', function(amount, pType, text)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local charInfo = user:getCurrentCharacter()

    TriggerClientEvent('np-phone:paymentNoti', src, amount, pType)
    if pType == "cash" then
        user:addMoney(amount)
    elseif pType == "bank" then
        user:addBank(amount)
    end

    local connect = {
        {
          ["color"] = color,
          ["title"] = "** FM | Nopixel [Jobs] | Payout Log **",
          ["description"] = "Job Payout Log | Amount: $"..amount.." | Type: "..pType.." | Job Type (Buff / No Buff): "..text.." | Character Name: "..charInfo.first_name.." "..charInfo.last_name.." | State ID: "..charInfo.id,
        }
      }
      PerformHttpRequest("https://discord.com/api/webhooks/ENTER_HERE", function(err, text, headers) end, 'POST', json.encode({username = "np | Job Payout Log", embeds = connect, avatar_url = "https://i.imgur.com/hMqEEQp.png"}), { ['Content-Type'] = 'application/json' })
end)