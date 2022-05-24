local QBCore = exports['qb-core']:GetCoreObject()

local Objects = {
    { ["x"] = 3065.59, ["y"] = -1596.06, ["z"] = 113.82, ["h"] = 250.0, ["model"] = "gr_prop_gr_bench_02a" },
    --{ ["x"] = 155.92, ["y"] = -238.61, ["z"] = 53.45, ["h"] = 161.00, ["model"] = "prop_ld_nt_safe_01" }, --ifruit safe
    { ["x"] = 883.2, ["y"] = -2268.17, ["z"] = 32.62, ["h"] = 177.13, ["model"] = "hei_prop_hei_securitypanel" }, -- bobcat control panel
    { ["x"] = 187.38, ["y"] = -928.81, ["z"] = 29.520, ["h"] = 74.86, ["model"] = "prop_plant_flower_04" }, --vector4(187.38, -928.81, 30.69, 74.86)
    --{ ["x"] = 100.0, ["y"] = 100.0, ["z"] = 100.0, ["h"] = 69.0, ["model"] = "prop_chair_08" },
    --{ ["x"] = 100.0, ["y"] = 100.0, ["z"] = 100.0, ["h"] = 69.0, ["model"] = "prop_chair_08" },
    --{ ["x"] = 100.0, ["y"] = 100.0, ["z"] = 100.0, ["h"] = 69.0, ["model"] = "prop_chair_08" },
    --{ ["x"] = 100.0, ["y"] = 100.0, ["z"] = 100.0, ["h"] = 69.0, ["model"] = "prop_chair_08" }
}

CreateThread(function()
    for i = 1, #Objects, 1 do
        while not HasModelLoaded(GetHashKey(Objects[i]["model"])) do
            RequestModel(GetHashKey(Objects[i]["model"]))

            Citizen.Wait(5)
        end

        Objects[i]["objectId"] = CreateObject(GetHashKey(Objects[i]["model"]), Objects[i]["x"], Objects[i]["y"], Objects[i]["z"], false)

        --PlaceObjectOnGroundProperly(Objects[i]["objectId"])
        SetEntityHeading(Objects[i]["objectId"], Objects[i]["h"])
        FreezeEntityPosition(Objects[i]["objectId"], true)
        SetEntityAsMissionEntity(Objects[i]["objectId"], true, true)
    end
end)