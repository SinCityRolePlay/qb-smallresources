local carryingBackInProgress = false
local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("carry",function(source, args)
	QBCore.Functions.GetPlayerData(function(PlayerData)
		--print(PlayerData.metadata["inlaststand"])
        if PlayerData.metadata["inlaststand"] or PlayerData.metadata["isdead"] or PlayerData.metadata["ishandcuffed"] then 
			QBCore.Functions.Notify("Cannot carry in this state!", "error")
		else
			if not carryingBackInProgress then
					carryingBackInProgress = true	
					lib = 'missfinale_c2mcs_1'
					anim1 = 'fin_c2_mcs_1_camman'
					lib2 = 'nm'
					anim2 = 'firemans_carry'
					distans = 0.15
					distans2 = 0.27
					height = 0.63
					spin = 0.0		
					length = 100000
					controlFlagMe = 50
					controlFlagTarget = 33
					animFlagTarget = 1
					local closestPlayer = GetClosestPlayer(3)
					target = GetPlayerServerId(closestPlayer)
					if closestPlayer ~= nil then
						TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
					else
						--print("[CMG Anim] No player nearby")
					end
				else
					carryingBackInProgress = false
					ClearPedSecondaryTask(GetPlayerPed(-1))
					DetachEntity(GetPlayerPed(-1), true, false)
					local closestPlayer = GetClosestPlayer(3)
					target = GetPlayerServerId(closestPlayer)
					TriggerServerEvent("cmg2_animations:stop",target)
				end
		end
	end)
end,false)
RegisterNetEvent('cmg2_animations:syncTarget')
AddEventHandler('cmg2_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMe')
AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = GetPlayerPed(-1)
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stop')
AddEventHandler('cmg2_animations:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(GetPlayerPed(-1))
	DetachEntity(GetPlayerPed(-1), true, false)
end)

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end