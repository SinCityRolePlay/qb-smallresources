local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local isLoggedIn = true
local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        local inRange = false

        if PlayerJob.name == "hektic" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['hektic']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['hektic']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['hektic']["closet"])
            local VehicleDistance = #(pos - vector3(Config.BusinessSetup['hektic']["vehicle"].x, Config.BusinessSetup['hektic']["vehicle"].y, Config.BusinessSetup['hektic']["vehicle"].z))
            if onDuty then 
                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['hektic']["closet"].x, Config.BusinessSetup['hektic']["closet"].y, Config.BusinessSetup['hektic']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['hektic']["closet"].x, Config.BusinessSetup['hektic']["closet"].y, Config.BusinessSetup['hektic']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['hektic']["stash"].x, Config.BusinessSetup['hektic']["stash"].y, Config.BusinessSetup['hektic']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['hektic']["stash"].x, Config.BusinessSetup['hektic']["stash"].y, Config.BusinessSetup['hektic']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "hekticstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "hekticstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['hektic']["vehicle"].x, Config.BusinessSetup['hektic']["vehicle"].y, Config.BusinessSetup['hektic']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['hektic']["vehicle"].x, Config.BusinessSetup['hektic']["vehicle"].y, Config.BusinessSetup['hektic']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['hektic']["vehicle"].x, Config.BusinessSetup['hektic']["vehicle"].y, Config.BusinessSetup['hektic']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "MissD"..tostring(math.random(100, 999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['hektic']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    --Menu.hidden = true
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 7)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['hektic']['vehicle'], true)
                            end
                        end
                    end
                end

            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['hektic']["duty"].x, Config.BusinessSetup['hektic']["duty"].y, Config.BusinessSetup['hektic']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['hektic']["duty"].x, Config.BusinessSetup['hektic']["duty"].y, Config.BusinessSetup['hektic']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['hektic']["duty"].x, Config.BusinessSetup['hektic']["duty"].y, Config.BusinessSetup['hektic']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end

        elseif PlayerJob.name == "redline" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['redline']["stash"])
            local OutfitCloset = #(pos - Config.BusinessSetup['redline']["closet"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['redline']["duty"])
            local VehicleDistance = #(pos - vector3(Config.BusinessSetup['redline']["vehicle"].x, Config.BusinessSetup['redline']["vehicle"].y, Config.BusinessSetup['redline']["vehicle"].z))

            if onDuty then
                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['redline']["closet"].x, Config.BusinessSetup['redline']["closet"].y, Config.BusinessSetup['redline']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['redline']["closet"].x, Config.BusinessSetup['redline']["closet"].y, Config.BusinessSetup['redline']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['redline']["stash"].x, Config.BusinessSetup['redline']["stash"].y, Config.BusinessSetup['redline']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['redline']["stash"].x, Config.BusinessSetup['redline']["stash"].y, Config.BusinessSetup['redline']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "redlinestash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "redlinestash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['redline']["vehicle"].x, Config.BusinessSetup['redline']["vehicle"].y, Config.BusinessSetup['redline']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['redline']["vehicle"].x, Config.BusinessSetup['redline']["vehicle"].y, Config.BusinessSetup['redline']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['redline']["vehicle"].x, Config.BusinessSetup['redline']["vehicle"].y, Config.BusinessSetup['redline']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "REDL"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['redline']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 22)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['redline']['vehicle'], true)
                            end
                        end
                    end
                end
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['redline']["duty"].x, Config.BusinessSetup['redline']["duty"].y, Config.BusinessSetup['redline']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['redline']["duty"].x, Config.BusinessSetup['redline']["duty"].y, Config.BusinessSetup['redline']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['redline']["duty"].x, Config.BusinessSetup['redline']["duty"].y, Config.BusinessSetup['redline']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end

            
            if not inRange then
                Wait(1500)
            end
        elseif PlayerJob.name == "bennys" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['bennys']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['bennys']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['bennys']["closet"])
            local VehicleDistance = #(pos - vector3(Config.BusinessSetup['bennys']["vehicle"].x, Config.BusinessSetup['bennys']["vehicle"].y, Config.BusinessSetup['bennys']["vehicle"].z))
            if onDuty then 
                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['bennys']["closet"].x, Config.BusinessSetup['bennys']["closet"].y, Config.BusinessSetup['bennys']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['bennys']["closet"].x, Config.BusinessSetup['bennys']["closet"].y, Config.BusinessSetup['bennys']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['bennys']["stash"].x, Config.BusinessSetup['bennys']["stash"].y, Config.BusinessSetup['bennys']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['bennys']["stash"].x, Config.BusinessSetup['bennys']["stash"].y, Config.BusinessSetup['bennys']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "bennysstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "bennysstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['bennys']["vehicle"].x, Config.BusinessSetup['bennys']["vehicle"].y, Config.BusinessSetup['bennys']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['bennys']["vehicle"].x, Config.BusinessSetup['bennys']["vehicle"].y, Config.BusinessSetup['bennys']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['bennys']["vehicle"].x, Config.BusinessSetup['bennys']["vehicle"].y, Config.BusinessSetup['bennys']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "REDL"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['bennys']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 10)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['bennys']['vehicle'], true)
                            end
                        end
                    end
                end
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['bennys']["duty"].x, Config.BusinessSetup['bennys']["duty"].y, Config.BusinessSetup['bennys']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['bennys']["duty"].x, Config.BusinessSetup['bennys']["duty"].y, Config.BusinessSetup['bennys']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['bennys']["duty"].x, Config.BusinessSetup['bennys']["duty"].y, Config.BusinessSetup['bennys']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end

            if not inRange then
                Wait(1500)
            end
        elseif PlayerJob.name == "cyberbar" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['cyberbar']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['cyberbar']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['cyberbar']["closet"])
            local VehicleDistance = #(pos - vector3(Config.BusinessSetup['cyberbar']["vehicle"].x, Config.BusinessSetup['cyberbar']["vehicle"].y, Config.BusinessSetup['cyberbar']["vehicle"].z))

            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['cyberbar']["stash"].x, Config.BusinessSetup['cyberbar']["stash"].y, Config.BusinessSetup['cyberbar']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['cyberbar']["stash"].x, Config.BusinessSetup['cyberbar']["stash"].y, Config.BusinessSetup['cyberbar']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "cyberbarstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "cyberbarstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['cyberbar']["closet"].x, Config.BusinessSetup['cyberbar']["closet"].y, Config.BusinessSetup['cyberbar']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['cyberbar']["closet"].x, Config.BusinessSetup['cyberbar']["closet"].y, Config.BusinessSetup['cyberbar']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['cyberbar']["vehicle"].x, Config.BusinessSetup['cyberbar']["vehicle"].y, Config.BusinessSetup['cyberbar']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['cyberbar']["vehicle"].x, Config.BusinessSetup['cyberbar']["vehicle"].y, Config.BusinessSetup['cyberbar']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['cyberbar']["vehicle"].x, Config.BusinessSetup['cyberbar']["vehicle"].y, Config.BusinessSetup['cyberbar']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['cyberbar']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 3)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['cyberbar']['vehicle'], true)
                            end
                        end
                    end
                end
            end


            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['cyberbar']["duty"].x, Config.BusinessSetup['cyberbar']["duty"].y, Config.BusinessSetup['cyberbar']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['cyberbar']["duty"].x, Config.BusinessSetup['cyberbar']["duty"].y, Config.BusinessSetup['cyberbar']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['cyberbar']["duty"].x, Config.BusinessSetup['cyberbar']["duty"].y, Config.BusinessSetup['cyberbar']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "vu" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['vu']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['vu']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['vu']["closet"])
            local VehicleDistance = #(pos - vector3(Config.BusinessSetup['vu']["vehicle"].x, Config.BusinessSetup['vu']["vehicle"].y, Config.BusinessSetup['vu']["vehicle"].z))

            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['vu']["stash"].x, Config.BusinessSetup['vu']["stash"].y, Config.BusinessSetup['vu']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['vu']["stash"].x, Config.BusinessSetup['vu']["stash"].y, Config.BusinessSetup['vu']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "vanillaunicornstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "vanillaunicornstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['vu']["closet"].x, Config.BusinessSetup['vu']["closet"].y, Config.BusinessSetup['vu']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['vu']["closet"].x, Config.BusinessSetup['vu']["closet"].y, Config.BusinessSetup['vu']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['vu']["vehicle"].x, Config.BusinessSetup['vu']["vehicle"].y, Config.BusinessSetup['vu']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['vu']["vehicle"].x, Config.BusinessSetup['vu']["vehicle"].y, Config.BusinessSetup['vu']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['vu']["vehicle"].x, Config.BusinessSetup['vu']["vehicle"].y, Config.BusinessSetup['vu']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['vu']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 9)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['vu']['vehicle'], true)
                            end
                        end
                    end
                end
            end


            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['vu']["duty"].x, Config.BusinessSetup['vu']["duty"].y, Config.BusinessSetup['vu']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['vu']["duty"].x, Config.BusinessSetup['vu']["duty"].y, Config.BusinessSetup['vu']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['vu']["duty"].x, Config.BusinessSetup['vu']["duty"].y, Config.BusinessSetup['vu']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "merqsquad" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['merqsquad']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['merqsquad']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['merqsquad']["closet"])
            --local VehicleDistance = #(pos - vector3(Config.BusinessSetup['merqsquad']["vehicle"].x, Config.BusinessSetup['merqsquad']["vehicle"].y, Config.BusinessSetup['merqsquad']["vehicle"].z))

            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['merqsquad']["stash"].x, Config.BusinessSetup['merqsquad']["stash"].y, Config.BusinessSetup['merqsquad']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['merqsquad']["stash"].x, Config.BusinessSetup['merqsquad']["stash"].y, Config.BusinessSetup['merqsquad']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "merqsquadstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "merqsquadstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['merqsquad']["closet"].x, Config.BusinessSetup['merqsquad']["closet"].y, Config.BusinessSetup['merqsquad']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['merqsquad']["closet"].x, Config.BusinessSetup['merqsquad']["closet"].y, Config.BusinessSetup['merqsquad']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                --[[if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['merqsquad']["vehicle"].x, Config.BusinessSetup['merqsquad']["vehicle"].y, Config.BusinessSetup['merqsquad']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['merqsquad']["vehicle"].x, Config.BusinessSetup['merqsquad']["vehicle"].y, Config.BusinessSetup['merqsquad']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['merqsquad']["vehicle"].x, Config.BusinessSetup['merqsquad']["vehicle"].y, Config.BusinessSetup['merqsquad']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['merqsquad']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 3)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['merqsquad']['vehicle'], true)
                            end
                        end
                    end
                end]]
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['merqsquad']["duty"].x, Config.BusinessSetup['merqsquad']["duty"].y, Config.BusinessSetup['merqsquad']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['merqsquad']["duty"].x, Config.BusinessSetup['merqsquad']["duty"].y, Config.BusinessSetup['merqsquad']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['merqsquad']["duty"].x, Config.BusinessSetup['merqsquad']["duty"].y, Config.BusinessSetup['merqsquad']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "sanders" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['sanders']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['sanders']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['sanders']["closet"])
            --local VehicleDistance = #(pos - vector3(Config.BusinessSetup['sanders']["vehicle"].x, Config.BusinessSetup['sanders']["vehicle"].y, Config.BusinessSetup['sanders']["vehicle"].z))

            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['sanders']["stash"].x, Config.BusinessSetup['sanders']["stash"].y, Config.BusinessSetup['sanders']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['sanders']["stash"].x, Config.BusinessSetup['sanders']["stash"].y, Config.BusinessSetup['sanders']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "sandersstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "sandersstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['sanders']["closet"].x, Config.BusinessSetup['sanders']["closet"].y, Config.BusinessSetup['sanders']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['sanders']["closet"].x, Config.BusinessSetup['sanders']["closet"].y, Config.BusinessSetup['sanders']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                --[[if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['sanders']["vehicle"].x, Config.BusinessSetup['sanders']["vehicle"].y, Config.BusinessSetup['sanders']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['sanders']["vehicle"].x, Config.BusinessSetup['sanders']["vehicle"].y, Config.BusinessSetup['sanders']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['sanders']["vehicle"].x, Config.BusinessSetup['sanders']["vehicle"].y, Config.BusinessSetup['sanders']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['sanders']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 3)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['sanders']['vehicle'], true)
                            end
                        end
                    end
                end]]
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['sanders']["duty"].x, Config.BusinessSetup['sanders']["duty"].y, Config.BusinessSetup['sanders']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['sanders']["duty"].x, Config.BusinessSetup['sanders']["duty"].y, Config.BusinessSetup['sanders']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['sanders']["duty"].x, Config.BusinessSetup['sanders']["duty"].y, Config.BusinessSetup['sanders']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "cookies" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['cookies']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['cookies']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['cookies']["closet"])

            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['cookies']["stash"].x, Config.BusinessSetup['cookies']["stash"].y, Config.BusinessSetup['cookies']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['cookies']["stash"].x, Config.BusinessSetup['cookies']["stash"].y, Config.BusinessSetup['cookies']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "cookiesstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "cookiesstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['cookies']["closet"].x, Config.BusinessSetup['cookies']["closet"].y, Config.BusinessSetup['cookies']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['cookies']["closet"].x, Config.BusinessSetup['cookies']["closet"].y, Config.BusinessSetup['cookies']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['cookies']["duty"].x, Config.BusinessSetup['cookies']["duty"].y, Config.BusinessSetup['cookies']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['cookies']["duty"].x, Config.BusinessSetup['cookies']["duty"].y, Config.BusinessSetup['cookies']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['cookies']["duty"].x, Config.BusinessSetup['cookies']["duty"].y, Config.BusinessSetup['cookies']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "tow" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['tow']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['tow']["duty"])
            local OnDutyDistanceNorth = #(pos - Config.BusinessSetup['tow']["dutyNorth"])
            local OutfitCloset = #(pos - Config.BusinessSetup['tow']["closet"])
            local OutfitClosetNorth = #(pos - Config.BusinessSetup['tow']["closetNorth"])
            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['tow']["stash"].x, Config.BusinessSetup['tow']["stash"].y, Config.BusinessSetup['tow']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['tow']["stash"].x, Config.BusinessSetup['tow']["stash"].y, Config.BusinessSetup['tow']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "towstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "towstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['tow']["closet"].x, Config.BusinessSetup['tow']["closet"].y, Config.BusinessSetup['tow']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['tow']["closet"].x, Config.BusinessSetup['tow']["closet"].y, Config.BusinessSetup['tow']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if OutfitClosetNorth < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['tow']["closetNorth"].x, Config.BusinessSetup['tow']["closetNorth"].y, Config.BusinessSetup['tow']["closetNorth"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitClosetNorth < 1 then
                        DrawText3Ds(Config.BusinessSetup['tow']["closetNorth"].x, Config.BusinessSetup['tow']["closetNorth"].y, Config.BusinessSetup['tow']["closetNorth"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['tow']["duty"].x, Config.BusinessSetup['tow']["duty"].y, Config.BusinessSetup['tow']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['tow']["duty"].x, Config.BusinessSetup['tow']["duty"].y, Config.BusinessSetup['tow']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['tow']["duty"].x, Config.BusinessSetup['tow']["duty"].y, Config.BusinessSetup['tow']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            elseif OnDutyDistanceNorth < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['tow']["dutyNorth"].x, Config.BusinessSetup['tow']["dutyNorth"].y, Config.BusinessSetup['tow']["dutyNorth"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistanceNorth < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['tow']["dutyNorth"].x, Config.BusinessSetup['tow']["dutyNorth"].y, Config.BusinessSetup['tow']["dutyNorth"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['tow']["dutyNorth"].x, Config.BusinessSetup['tow']["dutyNorth"].y, Config.BusinessSetup['tow']["dutyNorth"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "dev" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['dev']["stash"])
            if PlayerJob.name == "dev" then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['dev']["stash"].x, Config.BusinessSetup['dev']["stash"].y, Config.BusinessSetup['dev']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['dev']["stash"].x, Config.BusinessSetup['dev']["stash"].y, Config.BusinessSetup['dev']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "devstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "devstash", {
                                maxweight = 100000000,
                                slots = 500,
                            })
                        end
                    end
                end
            end
        elseif PlayerJob.name == "sic" then
            local pos = GetEntityCoords(PlayerPedId())
            local StashDistance = #(pos - Config.BusinessSetup['sic']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['sic']["duty"])
            local OutfitCloset = #(pos - Config.BusinessSetup['sic']["closet"])

            if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['sic']["stash"].x, Config.BusinessSetup['sic']["stash"].y, Config.BusinessSetup['sic']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['sic']["stash"].x, Config.BusinessSetup['sic']["stash"].y, Config.BusinessSetup['sic']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "sicstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "sicstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['sic']["closet"].x, Config.BusinessSetup['sic']["closet"].y, Config.BusinessSetup['sic']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['sic']["closet"].x, Config.BusinessSetup['sic']["closet"].y, Config.BusinessSetup['sic']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end
            end

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['sic']["duty"].x, Config.BusinessSetup['sic']["duty"].y, Config.BusinessSetup['sic']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['sic']["duty"].x, Config.BusinessSetup['sic']["duty"].y, Config.BusinessSetup['sic']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['sic']["duty"].x, Config.BusinessSetup['sic']["duty"].y, Config.BusinessSetup['sic']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        elseif PlayerJob.name == "basspro" then
            local pos = GetEntityCoords(PlayerPedId())
            --local StashDistance = #(pos - Config.BusinessSetup['basspro']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['basspro']["duty"])
            --local OutfitCloset = #(pos - Config.BusinessSetup['basspro']["closet"])
            --local VehicleDistance = #(pos - vector3(Config.BusinessSetup['basspro']["vehicle"].x, Config.BusinessSetup['basspro']["vehicle"].y, Config.BusinessSetup['basspro']["vehicle"].z))

            --[[if onDuty then
                if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['basspro']["stash"].x, Config.BusinessSetup['basspro']["stash"].y, Config.BusinessSetup['basspro']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['basspro']["stash"].x, Config.BusinessSetup['basspro']["stash"].y, Config.BusinessSetup['basspro']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "bassprostash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "bassprostash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['basspro']["closet"].x, Config.BusinessSetup['basspro']["closet"].y, Config.BusinessSetup['basspro']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['basspro']["closet"].x, Config.BusinessSetup['basspro']["closet"].y, Config.BusinessSetup['basspro']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end]]--

                --[[if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['basspro']["vehicle"].x, Config.BusinessSetup['basspro']["vehicle"].y, Config.BusinessSetup['basspro']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['basspro']["vehicle"].x, Config.BusinessSetup['basspro']["vehicle"].y, Config.BusinessSetup['basspro']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['basspro']["vehicle"].x, Config.BusinessSetup['basspro']["vehicle"].y, Config.BusinessSetup['basspro']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['basspro']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 3)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['basspro']['vehicle'], true)
                            end
                        end
                    end
                end
            end]]--

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['basspro']["duty"].x, Config.BusinessSetup['basspro']["duty"].y, Config.BusinessSetup['basspro']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['basspro']["duty"].x, Config.BusinessSetup['basspro']["duty"].y, Config.BusinessSetup['basspro']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['basspro']["duty"].x, Config.BusinessSetup['basspro']["duty"].y, Config.BusinessSetup['basspro']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end            
        elseif PlayerJob.name == "luxauto" then
            local pos = GetEntityCoords(PlayerPedId())
            --local StashDistance = #(pos - Config.BusinessSetup['luxauto']["stash"])
            local OnDutyDistance = #(pos - Config.BusinessSetup['luxauto']["duty"])
            --local OutfitCloset = #(pos - Config.BusinessSetup['luxauto']["closet"])
            --local VehicleDistance = #(pos - vector3(Config.BusinessSetup['luxauto']["vehicle"].x, Config.BusinessSetup['luxauto']["vehicle"].y, Config.BusinessSetup['luxauto']["vehicle"].z))

            --[[if onDuty then
                --[[if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['luxauto']["stash"].x, Config.BusinessSetup['luxauto']["stash"].y, Config.BusinessSetup['luxauto']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['luxauto']["stash"].x, Config.BusinessSetup['luxauto']["stash"].y, Config.BusinessSetup['luxauto']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "luxauto")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "luxautostash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['luxauto']["closet"].x, Config.BusinessSetup['luxauto']["closet"].y, Config.BusinessSetup['luxauto']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['luxauto']["closet"].x, Config.BusinessSetup['luxauto']["closet"].y, Config.BusinessSetup['luxauto']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['luxauto']["vehicle"].x, Config.BusinessSetup['luxauto']["vehicle"].y, Config.BusinessSetup['luxauto']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['luxauto']["vehicle"].x, Config.BusinessSetup['luxauto']["vehicle"].y, Config.BusinessSetup['luxauto']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['luxauto']["vehicle"].x, Config.BusinessSetup['luxauto']["vehicle"].y, Config.BusinessSetup['luxauto']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['luxauto']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 8)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['luxauto']['vehicle'], true)
                            end
                        end
                    end
                end
            end]]--

            if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['luxauto']["duty"].x, Config.BusinessSetup['luxauto']["duty"].y, Config.BusinessSetup['luxauto']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['luxauto']["duty"].x, Config.BusinessSetup['luxauto']["duty"].y, Config.BusinessSetup['luxauto']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['luxauto']["duty"].x, Config.BusinessSetup['luxauto']["duty"].y, Config.BusinessSetup['luxauto']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end
        
        elseif PlayerJob.name == "noodleexchange" then
            local pos = GetEntityCoords(PlayerPedId())
            --local StashDistance = #(pos - Config.BusinessSetup['noodleexchange']["stash"])
            --local OnDutyDistance = #(pos - Config.BusinessSetup['noodleexchange']["duty"])
            --local OutfitCloset = #(pos - Config.BusinessSetup['noodleexchange']["closet"])
            local VehicleDistance = #(pos - vector3(Config.BusinessSetup['noodleexchange']["vehicle"].x, Config.BusinessSetup['noodleexchange']["vehicle"].y, Config.BusinessSetup['noodleexchange']["vehicle"].z))

            if onDuty then
                --[[if StashDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['noodleexchange']["stash"].x, Config.BusinessSetup['noodleexchange']["stash"].y, Config.BusinessSetup['noodleexchange']["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if StashDistance < 1 then
                        DrawText3Ds(Config.BusinessSetup['noodleexchange']["stash"].x, Config.BusinessSetup['noodleexchange']["stash"].y, Config.BusinessSetup['noodleexchange']["stash"].z, "[E] Open Stash")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("inventory:client:SetCurrentStash", "noodleexchangestash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "noodleexchangestash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if OutfitCloset < 5 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['noodleexchange']["closet"].x, Config.BusinessSetup['noodleexchange']["closet"].y, Config.BusinessSetup['noodleexchange']["closet"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OutfitCloset < 1 then
                        DrawText3Ds(Config.BusinessSetup['noodleexchange']["closet"].x, Config.BusinessSetup['noodleexchange']["closet"].y, Config.BusinessSetup['noodleexchange']["closet"].z, "[E] Open Closet")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-clothing:client:openOutfitMenu")
                        end
                    end
                end]]

                if VehicleDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.BusinessSetup['noodleexchange']["vehicle"].x, Config.BusinessSetup['noodleexchange']["vehicle"].y, Config.BusinessSetup['noodleexchange']["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                    if VehicleDistance < 1 then
                        local InVehicle = IsPedInAnyVehicle(PlayerPedId())

                        if InVehicle then
                            DrawText3Ds(Config.BusinessSetup['noodleexchange']["vehicle"].x, Config.BusinessSetup['noodleexchange']["vehicle"].y, Config.BusinessSetup['noodleexchange']["vehicle"].z, '[E] Hide Vehicle')
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            end
                        else
                            DrawText3Ds(Config.BusinessSetup['noodleexchange']["vehicle"].x, Config.BusinessSetup['noodleexchange']["vehicle"].y, Config.BusinessSetup['noodleexchange']["vehicle"].z, '[E] Get Vehicle')
                            if IsControlJustPressed(0, 38) then
                                QBCore.Functions.SpawnVehicle('benson2', function(veh)
                                    SetVehicleNumberPlateText(veh, "CYBR"..tostring(math.random(1000, 9999)))
                                    SetEntityHeading(veh, Config.BusinessSetup['noodleexchange']['vehicle'].w)
                                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                    SetVehicleLivery(veh, 8)
                                    SetVehicleDirtLevel(veh, 0.0)
                                    SetVehicleEngineOn(veh, true, true)
                                end, Config.BusinessSetup['noodleexchange']['vehicle'], true)
                            end
                        end
                    end
                end
            end

            --[[if OnDutyDistance < 20 then
                inRange = true
                DrawMarker(2, Config.BusinessSetup['noodleexchange']["duty"].x, Config.BusinessSetup['noodleexchange']["duty"].y, Config.BusinessSetup['noodleexchange']["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                if OnDutyDistance < 1 then
                    if onDuty then
                        DrawText3Ds(Config.BusinessSetup['noodleexchange']["duty"].x, Config.BusinessSetup['noodleexchange']["duty"].y, Config.BusinessSetup['noodleexchange']["duty"].z, "[E] Off Duty")
                    else
                        DrawText3Ds(Config.BusinessSetup['noodleexchange']["duty"].x, Config.BusinessSetup['noodleexchange']["duty"].y, Config.BusinessSetup['noodleexchange']["duty"].z, "[E] On Duty")
                    end
                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("QBCore:ToggleDuty")
                    end
                end
            end]]
        
        else
            Wait(1500)
        end

        Wait(3)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "hektic" or 
            PlayerData.job.name == "redline" or 
            PlayerData.job.name == "bennys" or 
            PlayerData.job.name == "cookies"or 
            PlayerData.job.name == "vu"or 
            PlayerData.job.name == "cyberbar" or 
            PlayerData.job.name == "merqsquad" or 
            PlayerData.job.name == "tow" or 
            PlayerData.job.name == "sanders" or 
            PlayerData.job.name == "sic" or
            PlayerData.job.name == "basspro" or 
            PlayerData.job.name == "noodleexchange" 
            then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)