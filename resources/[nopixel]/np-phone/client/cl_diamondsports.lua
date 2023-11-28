RegisterNUICallback('getDiamondSportsEvents', function(data,cb)
    local returnEvents = RPC.execute("np-phone:getDiamondSportsEvents")
    SendNUIMessage({
        openSection = "diamondSportsAppend",
        diamondSports = returnEvents,
        canMakeDiamondEvents = exports['np-business']:IsEmployedAt('the_diamond')
    })
end)

RegisterNUICallback('submitNewEventDiamondSports', function(data, cb)
    RPC.execute("np-phone:submitNewEventDiamondSports", data.pEventName, data.pEventLocation, data.pTimeZone, data.pEventTimeHr, data.pEventTimeMin, data.pEventDate)
end)

RegisterNUICallback('deleteDiamondEvent', function(data, cb)
    RPC.execute("np-phone:deleteDiamondEvent", data.diamondEventID)
end)