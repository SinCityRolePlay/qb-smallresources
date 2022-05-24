--------------------------------------------------------------------------------------------------------------
------------First off, many thanks to @anders for help with the majority of this script. ---------------------
------------Also shout out to @setro for helping understand pNotify better.              ---------------------
--------------------------------------------------------------------------------------------------------------
------------To configure: Add/replace your own coords in the sectiong directly below.    ---------------------
------------        Goto LINE 90 and change "50" to your desired SafeZone Radius.        ---------------------vector3(372.13, -1600.64, 43.98)
------------        Goto LINE 130 to edit the Marker( Holographic circle.)               ---------------------
--------------------------------------------------------------------------------------------------------------
-- Place your own coords here!
local zones = {
	{ ['x'] = 315.07,	['y'] = -592.42, 	['z'] = 43.28 }, -- pillbox
	{ ['x'] = 454.83,	['y'] = -996.17, 	['z'] = 28.76 }, -- mrpd
	{ ['x'] = -186.62,	['y'] = -1186.38, 	['z'] = 23.03 }, -- tow yard
    { ['x'] = -470.99,	['y'] = 6006.54,	['z'] = 31.31 }, -- Paleto PD
    { ['x'] = -266.48,	['y'] = 6323.25,	['z'] = 31.31 }, -- Paleto Hospital
    { ['x'] = 1837.26,	['y'] = 3681.98,	['z'] = 34.13 }, -- Sandy Hospital/PD
    { ['x'] = 847.81,	['y'] = -1295.75,	['z'] = 26.85 }, -- tow yard
    { ['x'] = 372.13,	['y'] = -1600.64,	['z'] = 29.31 }, -- tow yard
	{ ['x'] = -550.54,	['y'] = -194.70,	['z'] = 38.22 }, -- CityHall
}

local notifIn = false
local notifOut = false
local closestZone = 1
local blipColor = 2

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-------                              Creating Blips at the locations. 							--------------
-------You can comment out this section if you dont want any blips showing the zones on the map.--------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Wait(0)
	end
	
	for i = 1, #zones, 1 do
		local szBlip = AddBlipForCoord(zones[i].x, zones[i].y, zones[i].z)
		SetBlipAsShortRange(szBlip, true)
        SetBlipSprite(szBlip, 487)
		SetBlipColour(szBlip, blipColor) 
		 
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("SAFE ZONE")
		EndTextCommandSetBlipName(szBlip)
	end
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------   Getting your distance from any one of the locations  --------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Wait(15000)
	end
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
---------   Setting of friendly fire on and off, disabling your weapons, and sending pNoty   -----------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Wait(0)
	end
	
	while true do
		Wait(0)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
	
		if dist <= 50.0 then  -- Here you can change the RADIUS of the Safe Zone. Remember, whatever you put here will DOUBLE because it is a sphere. So 50 will actually result in a diameter of 100.
			if not notifIn then
				NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
                TriggerEvent('QBCore:Notify', "You are in a SafeZone!", 'success')
				notifIn = true
				notifOut = false
			end
		else
			if not notifOut then
				NetworkSetFriendlyFireOption(true)
                TriggerEvent('QBCore:Notify', "You are in NO LONGER a SafeZone!", 'error')
				notifOut = true
				notifIn = false
			end
		end
		if notifIn then
		DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
		DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
      	DisableControlAction(0, 106, true) -- Disable in-game mouse controls
			if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
                TriggerEvent('QBCore:Notify', "You can not use weapons in a Safe Zone!", 'error')
			end
			if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
                TriggerEvent('QBCore:Notify', "You can not do that in a Safe Zone!", 'error')
			end
		end

        if Config.SafeZoneDebug then
            if DoesEntityExist(player) then
                DrawMarker(1, zones[closestZone].x, zones[closestZone].y, zones[closestZone].z-1.0001, 0, 0, 0, 0, 0, 0, 100.0, 100.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0) -- 
            end
        end
	end
end)