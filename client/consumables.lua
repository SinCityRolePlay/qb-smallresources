-- Variables

local alcoholCount = 0
local onWeed = false
local ParachuteEquiped = false
local currentVest = nil
local currentVestTexture = nil

-- Functions

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function EquipParachuteAnim()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function JellybeanEffect()
    SetFlash(0, 0, 500, 7000, 500)
    while true do 
        Wait(1000)
        AlienEffect()
        if math.random(1, 100) < 99 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('VIBRATE_SHAKE', 1.00)
        end
    end
end

function PeyoteEffect()
    StartScreenEffect("PeyoteOut", 3.0, 0)
    Wait(math.random(8000, 15000))
    StartScreenEffect("PeyoteEndOut", 3.0, 0)
    Wait(math.random(8000, 15000))
    StopScreenEffect("PeyoteOut")
    StopScreenEffect("PeyoteEndOut")
end

function HealOxy()
    if not healing then
        healing = true
    else
        return
    end

    local count = 9
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 6)
    end
    healing = false
end

function MethBagEffect()
    local startStamina = 8
    TrevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            TrevorEffect()
        end
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function TrevorEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Wait(3000)
	StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
	StopScreenEffect("DrugsTrevorClownsFight")
	StopScreenEffect("DrugsTrevorClownsFightIn")
	StopScreenEffect("DrugsTrevorClownsFightOut")
end

function EcstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
end

function JointEffect()
    -- if not onWeed then
    --     local RelieveOdd = math.random(35, 45)
    --     onWeed = true
    --     local weedTime = Config.JointEffectTime
    --     CreateThread(function()
    --         while onWeed do
    --             SetPlayerHealthRechargeMultiplier(PlayerId(), 1.8)
    --             Wait(1000)
    --             weedTime = weedTime - 1
    --             if weedTime == RelieveOdd then
    --                 TriggerServerEvent('hud:Server:RelieveStress', math.random(14, 18))
    --             end
    --             if weedTime <= 0 then
    --                 onWeed = false
    --             end
    --         end
    --     end)
    -- end
end

function CrackBaggyEffect()
    local startStamina = 8
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 60 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function CokeBaggyEffect()
    local startStamina = 20
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 10 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

function AddArmor()
    local a = 15
    while a > 0 do
        Wait(math.random(750, 1150))
        a = a - 1
        AddArmourToPed(PlayerPedId(), 1)
    end
end

function AddHealth()
    if not healing then
        healing = true
    else
        return
    end

    local count = 30
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1)
    end
    healing = false
end

-- Events

RegisterNetEvent('consumables:client:Eat', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkAlcohol', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("snort_coke", "Drinking liquor..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end

    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkBeer', function(itemName)  
    TriggerEvent('animations:client:EmoteCommandStart', {"beer"})
    QBCore.Functions.Progressbar("drink_something", "Drinking beer", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:RemoveItem", "beer", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:DrinkCocktail', function(itemName)  
    TriggerEvent('animations:client:EmoteCommandStart', {"whiskey"})
    QBCore.Functions.Progressbar("drink_something", "Drinking ".. QBCore.Shared.Items[itemName].label .."...", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --TriggerServerEvent("QBCore:Server:RemoveItem", "drink7", 1)
        TriggerServerEvent("QBCore:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        --print("This is item name " .. QBCore.Shared.Items[itemName].label  )
        if itemName == 'drink6' then
            if math.random(1,10) > 8 then
                MethBagEffect() 
            end
        elseif itemName == 'drink7' then                
            if math.random(1, 3) > 1 then            
                CrackBaggyEffect()                    
            end    
        elseif itemName == 'drink8' then
            if math.random(1,10) > 4 then
                getDrunk()
            end
        elseif itemName == 'drink10' then
            if math.random(1,10) > 8     then --8
                getDrunk()
            end
        end        
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)
RegisterNetEvent('consumables:client:Cokebaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("snort_coke", "Quick sniff..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "cokebaggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cokebaggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:Crackbaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("snort_coke", "Smoking crack..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "crack_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crack_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy', function()
    QBCore.Functions.Progressbar("use_ecstasy", "Pops Pills", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "xtcbaggy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["xtcbaggy"], "remove")
        EcstasyEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Failed", "error")
    end)
end)

RegisterNetEvent('consumables:client:oxy', function()
    QBCore.Functions.Progressbar("use_oxy", "Healing", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "oxy", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oxy"], "remove")
        ClearPedBloodDamage(PlayerPedId())
		HealOxy()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:meth', function()
    QBCore.Functions.Progressbar("snort_meth", "Smoking Ass Meth", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("QBCore:Server:RemoveItem", "meth", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meth"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
		TriggerEvent("evidence:client:SetStatus", "agitated", 300)
        MethBagEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
	end)
end)

--[[RegisterNetEvent('consumables:client:UseJoint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"smokepot"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 20 )
    end)
end)]] -- swap with other UseJoint if no animation for females

RegisterNetEvent('consumables:client:UseJoint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseParachute', function()
    EquipParachuteAnim()
    QBCore.Functions.Progressbar("use_parachute", "parachute using..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = PlayerPedId()
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "remove")
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false)
        local ParachuteData = {
            outfitData = {
                ["bag"]   = { item = 7, texture = 0},  -- Adding Parachute Clothing
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', ParachuteData)
        ParachuteEquiped = true
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end)
end)

RegisterNetEvent('consumables:client:ResetParachute', function()
    if ParachuteEquiped then
        EquipParachuteAnim()
        QBCore.Functions.Progressbar("reset_parachute", "Packing parachute..", 40000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = PlayerPedId()
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "add")
            local ParachuteRemoveData = {
                outfitData = {
                    ["bag"] = { item = 0, texture = 0} -- Removing Parachute Clothing
                }
            }
            TriggerEvent('qb-clothing:client:loadOutfit', ParachuteRemoveData)
            TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            TriggerServerEvent("qb-smallpenis:server:AddParachute")
            ParachuteEquiped = false
        end)
    else
        QBCore.Functions.Notify("You dont have a parachute!", "error")
    end
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    if GetPedArmour(PlayerPedId()) >= 75 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    QBCore.Functions.Progressbar("use_armor", "Putting on the body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["armor"], "remove")
        TriggerServerEvent('hospital:server:SetArmor', 75)
        TriggerServerEvent("QBCore:Server:RemoveItem", "armor", 1)
        SetPedArmour(PlayerPedId(), 75)
    end)
end)

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Progressbar("use_heavyarmor", "Putting on body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if PlayerData.charinfo.gender == 0 then
            currentVest = GetPedDrawableVariation(ped, 9)
            currentVestTexture = GetPedTextureVariation(ped, 9)
            if GetPedDrawableVariation(ped, 9) == 7 then
                SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
            else
                SetPedComponentVariation(ped, 9, 5, 2, 2) -- Blue
            end
        else
            currentVest = GetPedDrawableVariation(ped, 30)
            currentVestTexture = GetPedTextureVariation(ped, 30)
            SetPedComponentVariation(ped, 9, 30, 0, 2)
        end
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "remove")
        TriggerServerEvent("QBCore:Server:RemoveItem", "heavyarmor", 1)
        SetPedArmour(ped, 100)
    end)
end)

RegisterNetEvent('consumables:client:ResetArmor', function()
    local ped = PlayerPedId()
    if currentVest ~= nil and currentVestTexture ~= nil then
        QBCore.Functions.Progressbar("remove_armor", "Removing the body armour..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 9, currentVest, currentVestTexture, 2)
            SetPedArmour(ped, 0)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "add")
            TriggerServerEvent("QBCore:Server:AddItem", "heavyarmor", 1)
        end)
    else
        QBCore.Functions.Notify("You\'re not wearing a vest..", "error")
    end
end)

-- RegisterNetEvent('consumables:client:UseRedSmoke', function()
--     if ParachuteEquiped then
--         local ped = PlayerPedId()
--         SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
--         SetPlayerCanLeaveParachuteSmokeTrail(ped, true)
--         TriggerEvent("inventory:client:Itembox", QBCore.Shared.Items["smoketrailred"], "remove")
--     else
--         QBCore.Functions.Notify("You need to have a paracute to activate smoke!", "error")
--     end
-- end)

--Threads

CreateThread(function()
    while true do
        Wait(10)
        if alcoholCount > 0 then
            Wait(1000 * 60 * 15)
            alcoholCount = alcoholCount - 1
        else
            Wait(2000)
        end
    end
end)

RegisterNetEvent('consumables:client:EatSandwich', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('consumables:client:EatCandy', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"candy"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkSoda', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"soda"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkSoftdrink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
    QBCore.Functions.Progressbar("drink_something", "Drinking Softdrink..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:DrinkCoffee', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking Softdrink..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

RegisterNetEvent('consumables:client:EatCandy', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"candy"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)
------------------------------- CyberBar -------------------------------
    -- Pocky --
    RegisterNetEvent("consumables:client:EatPocky")
    AddEventHandler("consumables:client:EatPocky", function(itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"fries"})
        QBCore.Functions.Progressbar("eat_something", "Eating Pocky", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            --TriggerEvent("evidence:client:SetStatus", "food", 1000)
            --TriggerEvent("evidence:client:SetStatus", "water", 1000)
            --TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
            TriggerEvent("evidence:client:SetStatus", "food", 200)  
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        end)
    end)
    --- Mochi Donut
    RegisterNetEvent("consumables:client:EatMochiDonut")
    AddEventHandler("consumables:client:EatMochiDonut", function(itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
        QBCore.Functions.Progressbar("eat_something", "Eating Mochi Donut", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent("evidence:client:SetStatus", "food", 200)  
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] +  ConsumeablesEat[itemName])
        end)
    end)

    --- Rice Crackers
    RegisterNetEvent("consumables:client:EatRiceCrackers")
    AddEventHandler("consumables:client:EatRiceCrackers", function(itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"burger"})
        QBCore.Functions.Progressbar("eat_something", "Eating Rice Crackers", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent("evidence:client:SetStatus", "food", 200)  
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        end)
    end)

    --- Ramune Soda
    RegisterNetEvent("consumables:client:DrinkRamuneSoda")
    AddEventHandler("consumables:client:DrinkRamuneSoda", function(itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
        QBCore.Functions.Progressbar("drink_something", "Drinking Ramune Soda", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent("evidence:client:SetStatus", "water", 200)  
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
            --TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        end)
    end)

    --- Boba Milk Tea0
    RegisterNetEvent("consumables:client:DrinkBobaMilktea")
    AddEventHandler("consumables:client:DrinkBobaMilktea", function(itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
        QBCore.Functions.Progressbar("drink_something", "Drinking Boba Milk Tea", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent("evidence:client:SetStatus", "water", 200)  
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
            --TriggerServerEvent('hud:server:GainStress', 20)
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 5))
            --TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        end)
    end)

------------------------------- END Cyber Bar -------------------------------

------------------------------- Noodle Exchange -------------------------------

--- Eating Noodle Exchange Food
RegisterNetEvent("consumables:client:EatNoodleExchange")
AddEventHandler("consumables:client:EatNoodleExchange", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"burger"})
    QBCore.Functions.Progressbar("eat_something", "Eating ".. QBCore.Shared.Items[itemName].label .."...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        --print(tablePrintOut(itemName) .. "And this is the shared.item shit > ".. QBCore.Shared.Items[itemName])
        --print(QBCore.Shared.Items[itemName])
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 200)  
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
    end)
end)

-- Drinking Noodle Exchange Drinks
RegisterNetEvent("consumables:client:DrinkNoodleExchange")
AddEventHandler("consumables:client:DrinkNoodleExchange", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
    QBCore.Functions.Progressbar("drink_something", "Drinking ".. QBCore.Shared.Items[itemName].label .."...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "water", 200)  
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        --TriggerServerEvent('hud:server:GainStress', 20)
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 7))
        --TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
    end)
end)

------------------------------- END Noodle Exchange -------------------------------



RegisterNetEvent("consumables:client:EatHotdog")
AddEventHandler("consumables:client:EatHotdog", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar("eat_something", "Eating Hotdog", 6500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 200)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
    end)
end)

------------------------------- Burgershot -------------------------------
-- Heartstopper --
    RegisterNetEvent("consumables:client:EatHeartstopper")
    AddEventHandler("consumables:client:EatHeartstopper", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"burger"})
    QBCore.Functions.Progressbar("eat_something", "Eating Heartstopper", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 1000)
		TriggerEvent("evidence:client:SetStatus", "water", 1000)
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 100)
    end)
end)
-- Fries
RegisterNetEvent("consumables:client:EatFries")
AddEventHandler("consumables:client:EatFries", function(itemName)
    --print(tablePrintOut(itemName))
    TriggerEvent('animations:client:EmoteCommandStart', {"burger"})
    QBCore.Functions.Progressbar("eat_something", "Eating Fries", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "food", 200)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
    end)
end)
------------------------------- END Burgershot -------------------------------

RegisterNetEvent("consumables:client:DrinkWine")
AddEventHandler("consumables:client:DrinkWine", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"wine"})
    QBCore.Functions.Progressbar("drink_something", "Drinking Wine..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("evidence:client:SetStatus", "alcohol", 100)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 100)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 15)
    end)
end)



 --cookies
RegisterNetEvent('consumables:client:gelatti_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["gelatti_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:gary_payton_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["gary_payton_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:cereal_milk_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cereal_milk_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:cheetah_piss_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheetah_piss_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:snow_man_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["snow_man_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:georgia_pie_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["georgia_pie_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:jefe_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["jefe_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:cake_mix_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cake_mix_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:white_runtz_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["white_runtz_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:blueberry_cruffin_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["blueberry_cruffin_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:grabba_leaf_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["grabba_leaf_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

RegisterNetEvent('consumables:client:whitecherry_gelato_joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["whitecherry_gelato_joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})

        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent("evidence:client:SetStatus", "redeyes", 300)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        SetPedArmour(GetPlayerPed(-1), GetPedArmour(GetPlayerPed(-1)) + 50 )
    end)
end)

--Masters Bean
RegisterNetEvent('consumables:client:frappuccino', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking frappuccino..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["frappuccino"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
    end)
end)

RegisterNetEvent('consumables:client:mocha_latte', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking mocha latte..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mocha_latte"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
    end)
end)

RegisterNetEvent('consumables:client:cappuccino', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking cappuccino..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cappuccino"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
    end)
end)

RegisterNetEvent('consumables:client:americano', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking americano..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["americano"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
    end)
end)

RegisterNetEvent('consumables:client:macciato', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking macciato..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["macciato"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        MethBagEffect()
    end, function()
    end)
end)

RegisterNetEvent('consumables:client:irish_creme', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking irish creme..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["irish_creme"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
    end)
end)

RegisterNetEvent('consumables:client:cold_brew', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking cold_brew..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cold_brew"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        MethBagEffect()
    end, function()
    end)
end)

RegisterNetEvent('consumables:client:espresso', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    QBCore.Functions.Progressbar("drink_something", "Drinking espresso..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["espresso"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
        TriggerServerEvent('hud:server:RelieveStress', 20)
        MethBagEffect()
    end, function()
    end)
end)

RegisterNetEvent('consumables:client:Drink7', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"whiskey"})
    QBCore.Functions.Progressbar("snort_coke", "Drinking liquor..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drink7"], "remove")
        TriggerServerEvent("QBCore:Server:RemoveItem", "drink7", 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol["drink7"])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EatJellybean', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"Jellybean"})
    --print(tablePrintOut(itemName))
    QBCore.Functions.Progressbar("eat_something", "Tasting the rainbow...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() --Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        if itemName == 'rainbow_jellybean' then
            local playerPed = GetPlayerPed(-1)
            local playerPed = PlayerPedId()
  
            RequestAnimSet("MOVE_M@QUICK") 
            while not HasAnimSetLoaded("MOVE_M@QUICK") do
            Wait(0)
            end    
            Wait(1000)
            ClearPedTasksImmediately(playerPed)
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
            SetPedIsDrunk(playerPed, true)
            SetPedMoveRateOverride(PlayerId(),10.0)
            SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
            AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
            ShakeGameplayCam("DRUNK_SHAKE", 3.0)
            Wait(15000)
        -- after wait stop all 
            SetPedMoveRateOverride(PlayerId(),1.0)
            SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
            SetPedIsDrunk(GetPlayerPed(-1), false)		
            SetPedMotionBlur(playerPed, false)
            ResetPedMovementClipset(GetPlayerPed(-1))
            AnimpostfxStopAll()
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
            SetTimecycleModifierStrength(0.0)
        else 
            QBCore.Functions.Notify("What an amazing taste!")
        end
    end)
    
end)
