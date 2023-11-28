RegisterServerEvent("np-policeBadge:showBadge")
AddEventHandler("np-policeBadge:showBadge", function()
  local src = source
  local user = exports["np-base"]:getModule("Player"):GetUser(src)
  local char = user:getCurrentCharacter()
  local cid =  char.id
  local name = char.first_name .. " " .. char.last_name

  exports.oxmysql:execute('SELECT * FROM characters WHERE id = ?', {cid}, function(result)
    local imgLink = result[1].profilepic
    exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
      local callsign = result[1].callsign
      if result[1].job == "police" or result[1].job == 'state' or result[1].job == 'sheriff' then
        TriggerClientEvent('np-badge:badgeanim', src)
        TriggerClientEvent('np-badge:open', -1, name, imgLink, callsign, src)
      else
        TriggerClientEvent("DoLongHudText", src, 'This is not your badge',1)
      end
    end)
  end)  
end)
