local pRan = false

function Login.playerLoaded() end

function Login.characterLoaded()
  -- Main events leave alone 
  TriggerEvent("np-base:playerSpawned")
  TriggerEvent("playerSpawned")
  TriggerServerEvent('character:loadspawns')
  TriggerEvent("np-base:initialSpawnModelLoaded")
  -- Main events leave alone 

  -- Everything that should trigger on character load 
  TriggerServerEvent('checkTypes')
  TriggerServerEvent('isVip')
  TriggerEvent("fx:clear")
  TriggerServerEvent("raid_clothes:retrieve_tats")
  TriggerEvent('np-bankrobbery:client:CreateTrollysEvent')
  TriggerServerEvent("currentconvictions")
  TriggerServerEvent("Evidence:checkDna")
  TriggerEvent("banking:viewBalance")
  TriggerServerEvent('np-doors:requestlatest')
  TriggerServerEvent("item:UpdateItemWeight")
  TriggerServerEvent("ReturnHouseKeys")
  TriggerServerEvent("requestOffices")
  Wait(500)
  TriggerServerEvent("police:getAnimData")
  TriggerServerEvent("server:currentpasses")
  TriggerEvent("np-hud:SetValues", exports['isPed']:isPed('cid'))
  TriggerServerEvent("police:getEmoteData")
  TriggerServerEvent("police:SetMeta")
  TriggerServerEvent('np-scoreboard:AddPlayer')
  TriggerServerEvent("np-base:PolyZoneUpdate")
  TriggerEvent("np-housing:loadHousingClient")
  TriggerServerEvent("np-housing:getGarages")
  TriggerServerEvent("np-phone:getAbdulTaxies")
  TriggerServerEvent("retreive:jail",exports["isPed"]:isPed("cid"))
  TriggerServerEvent("np-phone:checkForNonDocumentedLicenses", exports['isPed']:isPed("cid"))
  -- TriggerServerEvent("weapon:general:check")
  -- Anything that might need to wait for the client to get information, do it here.
  TriggerServerEvent("login:get:keys")

  --Sync Whiteboards
  TriggerServerEvent("SpawnEventsServer")

  -- // New Clothing Menu // --
  --TriggerServerEvent("np_clothing:retrieve_tats")
  --TriggerServerEvent('np_clothing:get_character_current')
  --TriggerServerEvent('np_clothing:get_character_face')
  TriggerEvent("np-spawn:phonerefresh")
  TriggerServerEvent("np-weapons:getAmmo")
  Wait(4000)
  TriggerServerEvent("bank:getLogs")
end

RegisterNetEvent('np-spawn:spawnCharacter')
AddEventHandler('np-spawn:spawnCharacter', function()
  if not pRan then
    pRan = true
    isNear = false
    TriggerServerEvent('np-base:sv:player_control')
    TriggerServerEvent('np-base:sv:player_settings')
    TriggerEvent("spawning", false)
    TriggerServerEvent("request-dropped-items")
    TriggerEvent('np-hud:EnableHud', true)
    if Spawn.isNew then
      Wait(1000)
      TriggerEvent('np-hud:ChangeThirst', 100)
        TriggerEvent('np-hud:ChangeHunger', 100)
        -- TriggerServerEvent('np-spawn:licenses')
        -- commands to make sure player is alive and full food/water/health/no injuries
        local src = GetPlayerServerId(PlayerId())
        TriggerServerEvent("reviveGranted", src)
        TriggerEvent("Hospital:HealInjuries", src, true)
        TriggerServerEvent("ems:healplayer", src)
        TriggerEvent("heal", src)
        TriggerEvent("status:needs:restore", src) 
      end
  end
  SetPedMaxHealth(PlayerPedId(), 200)
  runGameplay()
  Spawn.isNew = false
  -- TriggerServerEvent("server-request-update", exports["isPed"]:isPed("cid"))
end)