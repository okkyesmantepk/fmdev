Citizen.CreateThread(function()
	local interiorid = GetInteriorAtCoords(1113.974, -1806.528, 20.0346)
	
	ActivateInteriorEntitySet(interiorid, "car_meet_set_01")
    --ActivateInteriorEntitySet(interiorid, "car_meet_set_02")
    --ActivateInteriorEntitySet(interiorid, "car_meet_set_03")
    --ActivateInteriorEntitySet(interiorid, "car_meet_set_04")
    ActivateInteriorEntitySet(interiorid, "car_meet_set_05")
    ActivateInteriorEntitySet(interiorid, "car_meet_set_06")
    ActivateInteriorEntitySet(interiorid, "car_meet_set_07")
    ActivateInteriorEntitySet(interiorid, "car_meet_set_08")

	RefreshInterior(interiorid)
	
end)