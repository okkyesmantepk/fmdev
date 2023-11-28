local currentClassRoomBoardUrl = "https://cdn.discordapp.com/attachments/ENTER_HERE/ENTER_HERE/unknown.png"
local currentMeetingRoomBoardUrl = "https://cdn.discordapp.com/attachments/ENTER_HERE/ENTER_HERE/unknown.png"
local uwuScreenOneBoardUrl = "https://cdn.discordapp.com/attachments/ENTER_HERE/ENTER_HERE/unknown.png"
local inClassRoom, inMeetingRoom, inUwuCafe = false, false, false
local dui = nil
pURL = nil
--[[

    Events

]]
 
Citizen.CreateThread(function()

    exports["np-polyzone"]:AddPolyZone("mrpd_classroom",
        {vector2(448.41372680664, -990.47613525391), vector2(439.50704956055, -990.55731201172),
         vector2(439.43478393555, -981.08758544922), vector2(448.419921875, -981.26306152344),
         vector2(450.23190307617, -983.00885009766), vector2(450.25042724609, -988.77667236328)}, {
            gridDivisions = 25,
            minZ = 34.04,
            maxZ = 37.69
        })

    --UWU--

   --[[  exports["np-polyzone"]:AddPolyZone("ktown",
    {
        vector2(-581.58740234375, -1072.8555908203),
        vector2(-562.11468505859, -1072.9683837891),
        vector2(-562.28344726562, -1044.8640136719),
        vector2(-614.44683837891, -1041.0454101562),
        vector2(-610.89025878906, -1074.6127929688)
    }, 
    {
        gridDivisions = 25,
        minZ = 21.78,
        maxZ = 22.32
    })  ]]

    -------


    exports["np-polyzone"]:AddBoxZone("mrpd_meetingroom", vector3(474.07, -995.08, 30.69), 10.2, 5.2, {
        heading = 0,
        minZ = 29.64,
        maxZ = 32.84
    })

    exports["np-polytarget"]:AddBoxZone("mrdp_change_picture", vector3(439.44, -985.89, 34.97), 1.0, 0.4, {
        heading = 0,
        minZ = 35.37,
        maxZ = 36.17
    })

    exports["np-polytarget"]:AddBoxZone("mrpd_meetingroom_screen", vector3(474.02, -1001.79, 30.69), 3.6, 2.8, {
        heading = 1,
        minZ = 30.54,
        maxZ = 32.54
    })

    --UWU--

   --[[  exports["np-polytarget"]:AddBoxZone("screen01", vector3(-587.1, -1060.58, 24.20), 0.6, 0.25, {
        heading = 1,
        minZ = 23.54,
        maxZ = 24.47
    })

    exports["np-interact"]:AddPeekEntryByPolyTarget("screen01", {{
        event = "np-polce:changewhiteboardurl",
        id = 'uwus1changewhiteboardurlc',
        icon = "circle",
        label = "Change URL",
        parameters = {
            room = "uwuscreenone"
        }
    }}, {
        distance = {
            radius = 2.5
        }
    }) ]]

    -------

    exports["np-interact"]:AddPeekEntryByPolyTarget("mrdp_change_picture", {{
        event = "np-polce:changewhiteboardurl",
        id = 'polcechangewhiteboardurlc',
        icon = "circle",
        label = "Change URL",
        parameters = {
            room = "classroom"
        }
    }}, {
        distance = {
            radius = 2.5
        }
    })

    exports["np-interact"]:AddPeekEntryByPolyTarget("mrpd_meetingroom_screen", {{
        event = "np-polce:changewhiteboardurl",
        id = 'polcechangewhiteboardurlm',
        icon = "circle",
        label = "Change URL",
        parameters = {
            room = "meetingroom"
        }
    }}, {
        distance = {
            radius = 2.5
        }
    })

end)


AddEventHandler("np-polyzone:enter", function(pZoneName, pZoneData)
    if pZoneName == "np-police:zone" then
        if exports["np-base"]:getChar("job") == pZoneData.job then
            currentPrompt = pZoneData.zone
            exports["np-interaction"]:showInteraction(zoneData[pZoneData.zone].promptText)
            listenForKeypress(pZoneData.zone, pZoneData.action)
        end
    elseif pZoneName == "mrpd_classroom" then
        if not dui then
            dui = exports["np-lib"]:getDui(currentClassRoomBoardUrl)
            AddReplaceTexture("prop_planning_b1", "prop_base_white_01b", dui.dictionary, dui.texture)
        else
            exports["np-lib"]:changeDuiUrl(dui.id, currentClassRoomBoardUrl)
        end
        inClassRoom = true
    elseif zone == "mrpd_meetingroom" then
        if not dui then
          dui = exports["np-lib"]:getDui(currentMeetingRoomBoardUrl)
          AddReplaceTexture("prop_planning_b1", "prop_base_white_01b", dui.dictionary, dui.texture)
        else
          exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
        end
        inMeetingRoom = true
    end
end)

AddEventHandler("np-polyzone:exit", function(pZoneName, pZoneData)
    if pZoneName == "np-police:zone" then
        exports["np-interaction"]:hideInteraction()
        listening = false
        currentPrompt = nil
    elseif pZoneName == "mrpd_classroom" then
        RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        if dui ~= nil then
            exports["np-lib"]:releaseDui(dui.id)
            dui = nil
        end
        inClassRoom = false
    elseif zone == "mrpd_meetingroom" then
        RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        if dui ~= nil then
            exports["np-lib"]:releaseDui(dui.id)
            dui = nil
        end
        inMeetingRoom = false
    end
end)

--UWU--
--[[ AddEventHandler("np-polyzone:enter", function(pZoneName, pZoneData)
    if pZoneName == "ktown" then
        if not dui then
            dui = exports["np-lib"]:getDui(currentClassRoomBoardUrl)
            AddReplaceTexture("denis3d_catcafe_txd", dui.dictionary, dui.texture)
        else
            exports["np-lib"]:changeDuiUrl(dui.id, currentClassRoomBoardUrl)
        end
        inUwuCafe = true
    end
end)

AddEventHandler("np-polyzone:exit", function(pZoneName, pZoneData)
    if pZoneName == "ktown" then
        RemoveReplaceTexture("denis3d_catcafe_txd", "t_m_catcafe_imageatlas01")
        if dui ~= nil then
            exports["np-lib"]:releaseDui(dui.id)
            dui = nil
        end
        inUwuCafe = false
    end
end) ]]
-------


AddEventHandler("np-polce:changewhiteboardurl", function(pParams)
     exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-ui:WhiteboardURL',
        key = 1,
        items = {
          {
            icon = "link",
            label = "URL",
            name = "url",
          },
        },
        show = true,
      })
      pURL = pParams.room
end)

RegisterInterfaceCallback('np-ui:WhiteboardURL', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent("police:changewhiteboard", data.values.url, pURL)
end)

RegisterNetEvent("police:changewhiteboardcli")
AddEventHandler("police:changewhiteboardcli", function(pUrl, pRoom)
    if pRoom == "classroom" then
        currentClassRoomBoardUrl = pUrl

        if inClassRoom and dui then
            exports["np-lib"]:changeDuiUrl(dui.id, currentClassRoomBoardUrl)
        end
    elseif pRoom == "meetingroom" and inMeetingRoom and dui then
        currentMeetingRoomBoardUrl = pUrl

        if inMeetingRoom and dui then
            exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
        end
    --[[ elseif pRoom == "uwuscreenone" and inUwuCafe and dui then
        uwuScreenOneBoardUrl = pUrl

        if inUwuCafe and dui then
            exports["np-lib"]:changeDuiUrl(dui.id, uwuScreenOneBoardUrl)
        end ]]

    end
end)
