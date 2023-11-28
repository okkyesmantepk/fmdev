local currentClassRoomBoardUrl = "https://cdn.discordapp.com/attachments/ENTER_HERE/ENTER_HERE/unknown.png"
local currentMeetingRoomBoardUrl = "https://cdn.discordapp.com/attachments/ENTER_HERE/ENTER_HERE/unknown.png"

RegisterNetEvent("police:changewhiteboard", function(pUrl, pRoom)
    local src = source

    if pRoom == "classroom" then
        currentClassRoomBoardUrl = pUrl
    elseif pRoom == "meetingroom" and inMeetingRoom and dui then
        currentMeetingRoomBoardUrl = pUrl
    end

    TriggerClientEvent("police:changewhiteboardcli", -1, pUrl, pRoom)
end)

RegisterNetEvent("SpawnEventsServer", function()
    local src = source
    TriggerClientEvent("police:changewhiteboardcli", src, currentClassRoomBoardUrl, "classroom")
    TriggerClientEvent("police:changewhiteboardcli", src, currentMeetingRoomBoardUrl, "meetingroom")
end)