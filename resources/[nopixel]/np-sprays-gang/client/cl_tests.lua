

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    exports["np-polyzone"]:AddBoxZone("gang_spray_npc", vector3(-276.27, -2419.81, 6.0), 2, 2, {
        name="gang_sprays",
        heading=325,
        --debugPoly=false,
        minZ=5.0,
        maxZ=9.0
    })

    exports["np-interact"]:AddPeekEntryByPolyTarget("gang_spray_npc", {
    {
        id = "ped_purchase_sprays",
        label = 'Purchase Gang Spray ($10k)',
        icon = "spray-can",
        event = "np-gang-sprays:openPurchaseMenu",
        parameters = {}
    },
    {
        id = "ped_purchase_sprays1",
        label = 'Purchase Scrubbing Cloth ($50k)',
        icon = "brush",
        event = "np-gang-sprays:buyScrubbingCloth",
        parameters = {}
    },
    },{
        distance = { radius = 2.5 },
    });
end)

-- AddEventHandler('np-gang-sprays:openPurchaseMenu',function()
--     TriggerEvent('np-gang-sprays:openPurchaseMenu')
-- end)