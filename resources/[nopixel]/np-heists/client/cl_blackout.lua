-- local blackoutalan = CircleZone:Create(vector3(706.6598, 141.5933, 80.754), 100.0, {
--     name="blackout",
--     debugPoly=false,
-- })
-- local alanda = false
-- local createdobj = {}
-- Citizen.CreateThread(function()
--     while true do
--         local sleep = 1000
--         local plyPed = PlayerPedId()
--         local coords = GetEntityCoords(plyPed)
--         local objhash = GetHashKey("prop_till_01")
--         c4alan = blackoutalan:isPointInside(coords)
--         if c4alan then
--             sleep = 0
--             alanda = true
--             local obj = CreateObject(objhash, 713.6328, 165.5302, 81.754, true, true, false)
--             createdobj = obj
--             break
--         end
--         Citizen.Wait(sleep)
--     end
-- end)
 
-- local isiklargitti = false
 
-- Citizen.CreateThread(function()
--     while alanda do
--         local sleep = 1000
--         if GetEntityHealth(createdobj) < 800 then
--             sleep = 0
--             AddExplosion(712.41033935547,166.65734863281,84.187362670898, 8, 6000000000000000000000000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(698.15759277344,165.28308105469,83.854064941406, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(692.13262939453,142.34266662598,83.854064941406, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(679.18316650391,155.78392028809,83.854064941406, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(684.87731933594,170.64033508301,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(664.81799316406,115.14520263672,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(669.18011474609,131.47648620605,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(682.02368164062,115.48210906982,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(683.96557617188,125.65010070801,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(703.30096435547,117.33052825928,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(698.07220458984,103.19091796875,83.932327270508, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(800)
--             AddExplosion(710.86083984375,124.59242248535,83.754486083984, 8, 600000000000000000000000.0, true, false, 2.5)
--             Citizen.Wait(2000)
--             TriggerEvent("merty:blackout")
--             return
--         end
--         Citizen.Wait(sleep)
--     end
-- end)
 
-- RegisterNetEvent("merty:blackout")
-- AddEventHandler("merty:blackout", function()
--     Citizen.CreateThread(function()
--         while true do
--             Citizen.Wait(0)
--             TriggerEvent("np-weathersync:client:SyncWeather", EXTRASUNNY, true)
--             SetArtificialLightsState(true)
--             isiklargitti = true
--             Citizen.Wait(1000)
--             TriggerEvent("chat:addMessage", {
--                 color = {255, 255, 255},
--                 -- multiline = true,
--                 template = '<div style="padding: 15px; margin: 15px; background-color: rgba(180, 117, 22, 0.9); border-radius: 15px;"><i class="far fa-building"style="font-size:15px"></i> | {0} </font></i></b></div>',
--                 args = {"City Power is currently out, we're working on restoring it!"}
--             })
--             Citizen.Wait(4000000)
--             TriggerEvent("shewannameetcarti")
--             break
--         end
--     end)
-- end)
 
-- function zortladim()
--     return isiklargitti
-- end  
 
-- AddEventHandler("onResourceStop", function()
--     isiklargitti = false
--     SetArtificialLightsState(false)
-- end)
 
-- RegisterNetEvent("shewannameetcarti")
-- AddEventHandler("shewannameetcarti", function()
--     isiklargitti = false
--     TriggerEvent("np-weathersync:client:SyncWeather", EXTRASUNNY, false)
--     SetArtificialLightsState(false)
--     TriggerEvent("chat:addMessage", {
--         color = {255, 255, 255},
--         -- multiline = true,
--         template = '<div style="padding: 15px; margin: 15px; background-color: rgba(180, 117, 22, 0.9); border-radius: 15px;"><i class="far fa-building"style="font-size:15px"></i> | {0} </font></i></b></div>',
--         args = {"City Power issues has been fixed. Thank you all LS Citizens for your patience"}
--     })
-- end)
 
 
 
 
-- -- RegisterNetEvent("blackout")
-- -- AddEventHandler("blackout", function()
-- --     local x = exports["pr-blackout"]:zortladim()
-- --     if x then
-- --         print("ısık var")
-- --     else
-- --         print("isik yok")
-- --     end
-- -- end)