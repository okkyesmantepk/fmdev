-- Stash --

local Uwu_Cafe_Stash = false

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "Uwu_Cafe_Stash" then
        Uwu_Cafe_Stash = true
        UwuStash()
        local isEmployed = exports["np-business"]:IsEmployedAt("uwu_cafe")
        if isEmployed then
            exports['np-interface']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "Uwu_Cafe_Stash" then
        Uwu_Cafe_Stash = false
        exports['np-interface']:hideInteraction()
    end
end)

function UwuStash()
	Citizen.CreateThread(function()
        while Uwu_Cafe_Stash do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["np-business"]:IsEmployedAt("uwu_cafe")
                if isEmployed then
                    TriggerEvent('server-inventory-open', '1', 'uwu-cafe-stash')
                end
			end
		end
	end)
end

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("Uwu_Cafe_Stash", vector3(-585.62, -1055.82, 22.34), 1, 2.4, {
        name="Uwu_Cafe_Stash",
        heading=0,
        minZ=19.54,
        maxZ=23.54
    })
end)

-- Trays --

exports["np-polytarget"]:AddCircleZone("uwu_cafe_tray_1", vector3(-583.97, -1059.3, 22.34), 0.4, {
    useZ=true,
})

exports["np-polytarget"]:AddCircleZone("uwu_cafe_tray_2", vector3(-583.97, -1062.08, 22.34), 0.4, {
    useZ=true,
})

 -- Tray 1
 exports["np-interact"]:AddPeekEntryByPolyTarget("uwu_cafe_tray_1", {{
    event = "np-jobs:UwuCafeTray1",
    id = "uwu_cafe_tray_1",
    icon = "hand-holding",
    label = "Open",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

-- Tray 2
exports["np-interact"]:AddPeekEntryByPolyTarget("uwu_cafe_tray_2", {{
    event = "np-jobs:UwuCafeTray2",
    id = "uwu_cafe_tray_2",
    icon = "hand-holding",
    label = "Open",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('np-jobs:UwuCafeTray1')
AddEventHandler('np-jobs:UwuCafeTray1', function()
    TriggerEvent("server-inventory-open", "1", "traysz-Uwu Cafe Tray")
end)

RegisterNetEvent('np-jobs:UwuCafeTray2')
AddEventHandler('np-jobs:UwuCafeTray2', function()
    TriggerEvent("server-inventory-open", "1", "trays-Uwu Cafe Tray")
end)

-- Food Warmer --

exports["np-polytarget"]:AddBoxZone("uwu_cafe_food_warmer", vector3(-587.08, -1059.68, 22.34), 1, 2.8, {
    heading=270,
    --debugPoly=false,
    minZ=19.94,
    maxZ=23.94
})

exports["np-interact"]:AddPeekEntryByPolyTarget("uwu_cafe_food_warmer", {{
    event = "np-jobs:UwuFoodWarmer",
    id = "uwu_cafe_food_warmer",
    icon = "hand-holding",
    label = "Food Warmer",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

exports["np-interact"]:AddPeekEntryByPolyTarget("uwu_cafe_food_warmer", {{
    event = "np-dispatch:uwuAlarm",
    id = "uwu_cafe_food_warmer1",
    icon = "bell",
    label = "Alert Police",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('np-dispatch:uwuAlarm')
AddEventHandler('np-dispatch:uwuAlarm', function()
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        exports["np-dispatch"]:policedead('10-13A', "UwU Cafe Panic Alarm", "59", true)
    end
end)

RegisterNetEvent('np-jobs:UwuFoodWarmer')
AddEventHandler('np-jobs:UwuFoodWarmer', function()
    TriggerEvent("server-inventory-open", "1", "uwuw-food-warmer")
end)

exports["np-polytarget"]:AddBoxZone("np_uwu_make_food", vector3(-588.25, -1059.68, 22.36), 1, 2.4, {
    heading=270,
    --debugPoly=false,
    minZ=18.76,
    maxZ=22.76
})

 -- Food Shtuff
 exports["np-interact"]:AddPeekEntryByPolyTarget("np_uwu_make_food", {{
    event = "np-jobs:uwuCafeFood",
    id = "np_uwu_make_food",
    icon = "hand-holding",
    label = "Prepare Food",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

-- Drinks --

-- Coffee
-- Booba Milk Tea

-- Bento Boxes

RegisterNetEvent('np-jobs:uwuCafeFood')
AddEventHandler('np-jobs:uwuCafeFood', function()
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        local pFoodMaker = {
            {
                title = "Main Dishes",
                description = "Here you can find a list of the main dishes.",
                children = {
                    {
                        title = "Rice Balls",
                        description = "Required Ingridients: 1x Nori | 1x Rice",
                        action = "np-jobs:uwuMakeRiceBalls"
                    },
                    {
                        title = "Chicken Noodle Soup",
                        description = "Required Ingridients: 1x Noodles | 1x Chicken Breast",
                        action = "np-jobs:uwuMakeNoodleSoup"
                    },
                    {
                        title = "Doki Doki Pancakes",
                        description = "Required Ingridients: 1x Strawberries | 1x Whipped Cream",
                        action = "np-jobs:uwuMakePancakes"
                    },
                }
            },
            {
                title = "Deserts",
                description = "Here you can find a list of the deserts.",
                children = {
                    {
                        title = "Chocolate Cake", 
                        description = "Required Ingridients: 1x Chocolate Chips | 1x Flour",
                        action = "np-jobs:uwuMakeCake"  
                    },
                    {
                        title = "Strawberry Shortcake",
                        description = "Required Ingridients: 1x Strawberries | 1x Flour",
                        action = "np-jobs:uwuMakeShortcake"  
                    },
                }
            },
            {
                title = "Bento Box",
                description = "Grab a bento box to put the customers food in.",
                action = "np-jobs:uwuGrabBentoBox"
            },
        }
        exports["np-interface"]:showContextMenu(pFoodMaker)
    end
end)

RegisterInterfaceCallback('np-jobs:uwuGrabBentoBox', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('player:receiveItem', 'bentobox', 1)
end)

RegisterInterfaceCallback('np-jobs:uwuMakeRiceBalls', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        if exports['np-inventory']:hasEnoughOfItem('rice', 1) and exports['np-inventory']:hasEnoughOfItem('nori', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local finished = exports['np-taskbar']:taskBar(5000, 'Preparing Rice Balls...')
            if finished == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'nori', 1)
                TriggerEvent('inventory:removeItem', 'rice', 1)
                TriggerEvent('player:receiveItem', 'rice_balls', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end)

RegisterInterfaceCallback('np-jobs:uwuMakeNoodleSoup', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        if exports['np-inventory']:hasEnoughOfItem('chicken_breast', 1) and exports['np-inventory']:hasEnoughOfItem('noodles', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local chickenb = exports['np-taskbar']:taskBar(2500, 'Preparing Chicken Breast...')
            if chickenb == 100 then
                Citizen.Wait(100)
                TriggerEvent('animation:PlayAnimation', 'cokecut')
                local noodles = exports['np-taskbar']:taskBar(2500, 'Preparing Noodles')
                if noodles == 100 then
                    Citizen.Wait(100)
                    TriggerEvent('animation:PlayAnimation', 'cokecut')
                    local dish = exports['np-taskbar']:taskBar(5000, 'Preparing Final Dish...')
                    if dish == 100 then
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerEvent('inventory:removeItem', 'chicken_breast', 1)
                        TriggerEvent('inventory:removeItem', 'noodles', 1)
                        TriggerEvent('player:receiveItem', 'chicken_noodle_soup', 1)
                    else
                        FreezeEntityPosition(PlayerPedId(), false)
                    end
                else
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end)

RegisterInterfaceCallback('np-jobs:uwuMakePancakes', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        if exports['np-inventory']:hasEnoughOfItem('whipped_cream', 1) and exports['np-inventory']:hasEnoughOfItem('strawberries', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local dish = exports['np-taskbar']:taskBar(5000, 'Preparing Pancakes...')
            if dish == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'whipped_cream', 1)
                TriggerEvent('inventory:removeItem', 'strawberries', 1)
                TriggerEvent('player:receiveItem', 'doki_doki_pancakes', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end)

--// Deserts //--

RegisterInterfaceCallback('np-jobs:uwuMakeCake', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        if exports['np-inventory']:hasEnoughOfItem('chocolate_chips', 1) and exports['np-inventory']:hasEnoughOfItem('flour', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local dish = exports['np-taskbar']:taskBar(5000, 'Preparing Chocolate Cake...')
            if dish == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'chocolate_chips', 1)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('player:receiveItem', 'chocolate_cake', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end)

RegisterInterfaceCallback('np-jobs:uwuMakeShortcake', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        if exports['np-inventory']:hasEnoughOfItem('strawberries', 1) and exports['np-inventory']:hasEnoughOfItem('flour', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local dish = exports['np-taskbar']:taskBar(5000, 'Preparing Short Cake...')
            if dish == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'strawberries', 1)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('player:receiveItem', 'strawberry_shortcake', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    end
end)

RegisterNetEvent('np-jobs:uwuCafeFridge', function()
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        TriggerEvent("server-inventory-open", "999", "Shop")
    end
end)

exports["np-polytarget"]:AddBoxZone("np_uwu_fridge", vector3(-590.96, -1058.51, 22.34), 1, 1, {
    heading=0,
    --debugPoly=false,
    minZ=19.54,
    maxZ=23.54
})

 -- Food Shtuff
 exports["np-interact"]:AddPeekEntryByPolyTarget("np_uwu_fridge", {{
    event = "np-jobs:uwuCafeFridge",
    id = "np_uwu_fridge",
    icon = "circle",
    label = "Fridge",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

-- Drinks --

exports["np-polytarget"]:AddCircleZone("np_uwu_drinks", vector3(-586.95, -1061.92, 22.39), 0.5, {
    useZ=true,
})

 exports["np-interact"]:AddPeekEntryByPolyTarget("np_uwu_drinks", {{
    event = "np-jobs:uwuCafeDrinks",
    id = "np_uwu_drinks",
    icon = "circle",
    label = "Drinks",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('np-jobs:uwuCafeDrinks')
AddEventHandler('np-jobs:uwuCafeDrinks', function()
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        local pDrinkMachine = {
            {
                title = "Drinks",
                description = "Make a nice refreshing drink for the customer\'s.",
                children = {
                    {
                        title = "Make Bubble Tea",
                        action = "np-jobs:MakeBubbleTea"
                    },
                    {
                        title = "Make Coffee",
                        action = "np-jobs:MakeCoffee"
                    },
                    {
                        title = "Make Water",
                        action = "np-jobs:MakeWater"
                    },
                }
            },
        }
        exports["np-interface"]:showContextMenu(pDrinkMachine)
    end
end)

RegisterInterfaceCallback('np-jobs:MakeBubbleTea', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Bubble Tea')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'bubbletea', 1)
        end
    end
end)

RegisterInterfaceCallback('np-jobs:MakeCoffee', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Coffee')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'coffee', 1)
        end
    end
end)

RegisterInterfaceCallback('np-jobs:MakeWater', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-business']:IsEmployedAt('uwu_cafe') then
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Water')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'water', 1)
        end
    end
end)