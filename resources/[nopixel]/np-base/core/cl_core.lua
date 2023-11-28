DPX.Core.hasLoaded = false


function DPX.Core.Initialize(self)
    Citizen.CreateThread(function()
        while true do
            if NetworkIsSessionStarted() then
                TriggerEvent("np-base:playerSessionStarted")
                TriggerServerEvent("np-base:playerSessionStarted")
                break
            end
        end
    end)
end
DPX.Core:Initialize()

AddEventHandler("np-base:playerSessionStarted", function()
    while not DPX.Core.hasLoaded do
        --print("waiting in loop")
        Wait(100)
    end
    ShutdownLoadingScreen()
    DPX.SpawnManager:Initialize()
end)

RegisterNetEvent("np-base:waitForExports")
AddEventHandler("np-base:waitForExports", function()
    if not DPX.Core.ExportsReady then return end

    while true do
        Citizen.Wait(0)
        if exports and exports["np-base"] then
            TriggerEvent("np-base:exportsReady")
            return
        end
    end
end)

RegisterNetEvent("customNotification")
AddEventHandler("customNotification", function(msg, length, type)

	TriggerEvent("chatMessage","SYSTEM",4,msg)
end)

RegisterNetEvent("base:disableLoading")
AddEventHandler("base:disableLoading", function()
    print("player has spawned ")
    if not DPX.Core.hasLoaded then
         DPX.Core.hasLoaded = true
    end
end)

Citizen.CreateThread( function()
    TriggerEvent("base:disableLoading")
end)

-- -- Discord Rich Presence --

-- SetDiscordAppId()

-- Citizen.CreateThread(function()
-- 	while true do
-- 		SetDiscordRichPresenceAsset() 
-- 		SetDiscordRichPresenceAssetText("Nopixel") 
-- 		SetRichPresence("Nopixel") 
-- 		Wait(5000)
-- 	end
-- end)