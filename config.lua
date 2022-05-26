Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level
Config.SafeZoneDebug = false

ConsumeablesEat = {
    ["sandwich"] = math.random(10, 20),
    ["tosti"] = math.random(10, 20),
    ["twerks_candy"] = math.random(5, 10),
    ["snikkel_candy"] = math.random(5, 10),

    -- Burgershot
    ["bs_fries"]                = math.random(1, 35),
    ["bs_moneyshot"]            = math.random(1, 35),
    ["bs_thebleeder"]           = math.random(1, 35),
    ["bs_fowlburger"]           = math.random(1, 35),
    ["bs_burgerbag"]            = math.random(1, 35),
    ["bs_heartstopper"]         = math.random(1, 35),
    ["bs_torpedo"]              = math.random(1, 35),
    ["bs_vegan"]                = math.random(1, 35),
    -- Cyber Bar
    ["cb_pocky"]                = math.random(25, 40),
    ["cb_mochi_donut"]          = math.random(25, 40),
    ["cb_rice_crackers"]        = math.random(15, 30),
    ['pink_jellybean']          = math.random(5, 10),
    ['purple_jellybean']        = math.random(5, 10),
    ['blue_jellybean']          = math.random(5, 10),
    ['green_jellybean']         = math.random(5, 10),
    ['rainbow_jellybean']       = math.random(5, 10),
   -- Noodle Exchange 
    ['ne_caliroll']             = math.random(25, 40),
    ['ne_musubi']               = math.random(25, 40),
    ['ne_salmonhandroll']       = math.random(25, 45),
    ['ne_salmonnigri']          = math.random(25, 45),
    ['ne_tempuraroll']          = math.random(25, 45),
    ['ne_volcanoroll']          = math.random(25, 45),

    ['hotdog_a']                = math.random(1, 35),
    ['hotdog_b']                = math.random(1, 26),
    ['hotdog_c']                = math.random(1, 17),
}

ConsumeablesDrink = {
    ["water_bottle"]            = math.random(10, 15),
    ["kurkakola"]               = math.random(5, 10),
    ["coffee"]                  = math.random(40, 50),
    ["bs_softdrink"]            = math.random(1, 35),
    ["bs_coffee"]               = math.random(20, 35),
    ["cb_strawberry_ramune"]    = math.random(20, 35),
    ["cb_melon_ramune"]         = math.random(20, 35),
    ["cb_blueberry_ramune"]     = math.random(20, 35),
    ["cb_boba_milktea"]         = math.random(20, 35),
    ['ne_greentea']             = math.random(25, 30),
}

ConsumeablesAlcohol = {
    ["whiskey"]                 = math.random(15, 25),
    ["beer"]                    = math.random(10, 20),
    ["drink6"]                  = math.random(30, 35),      -- The Ruby Big Butt
    ["drink7"]                  = math.random(30, 35),      -- The Dexter
    ["drink8"]                  = math.random(30, 35),      -- Rum & Coke    
    ["drink10"]                 = math.random(20, 25),      -- Whiteclaw    
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = false,
    [`ANNIHILATOR`] = false,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = false,
    [`MAVERICK`] = false,
    [`BLIMP`] = false,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Callisto
    [2] = {
        [1] = {
            coords = vector4(380.27, -15.2, 83.0, 214.23),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(414.91, -15.26, 99.65, 241.46),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    }, 
    --Coke Processing Enter/Exit
    [3] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
    --Real Estate Office
    [4] = {
        [1] = {
            coords = vector4(-117.77, -608.74, 36.28, 69.39),
            ["AllowVehicle"] = false, 
            drawText = '[E] Enter Real Estate Office'
        },
        [2] = {
            coords = vector4(-140.87, -620.8, 168.82, 97.95),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
    --Callisto 2
    [5] = {
        [1] = {
            coords = vector4(380.27, -15.2, 83.0, 214.23),
            ["AllowVehicle"] = false, 
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(417.39, -10.92, 99.65, 246.43),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
    },
    --integrity
    [5] = {
        [1] = {
            coords = vector4(280.78, -651.84, 42.02, 335.14),--front right
            ["AllowVehicle"] = false, 
            drawText = '[E] Up to Apartments'
        },
        [2] = {
            coords = vector4(273.18, -642.57, 4.65, 249.81),-- top left
            ["AllowVehicle"] = false,
            drawText = '[E] Down to Lobby'
        },
    },
    [6] = {
        [1] = {
            coords = vector4(284.29, -653.35, 42.02, 338.97),--middle right
            ["AllowVehicle"] = false, 
            drawText = '[E] Up to Apartments'
        },
        [2] = {
            coords = vector4(271.76, -646.24, 4.65, 249.97),-- middle top
            ["AllowVehicle"] = false,
            drawText = '[E] Down to Lobby'
        },
    },
    [7] = {
        [1] = {
            coords = vector4(288.27, -654.88, 42.02, 338.83),--back right
            ["AllowVehicle"] = false, 
            drawText = '[E] Up to Apartments'
        },
        [2] = {
            coords = vector4(-273.44, -967.2, 77.23, 253.8),
            ["AllowVehicle"] = false,
            drawText = '[E] Down to Lobby'
        },
    },
    [8] = {
        [1] = {
            coords = vector4(284.56, -641.29, 42.02, 159.45),--left front
            ["AllowVehicle"] = false, 
            drawText = '[E] Up to Apartments'
        },
        [2] = {
            coords = vector4(273.18, -642.57, 4.65, 249.81),-- top left
            ["AllowVehicle"] = false,
            drawText = '[E] Down to Lobby'
        },
    },
    [9] = {
        [1] = {
            coords = vector4(288.11, -642.53, 42.02, 160.82),--left middle
            ["AllowVehicle"] = false, 
            drawText = '[E] Up to Apartments'
        },
        [2] = {
            coords = vector4(271.76, -646.24, 4.65, 249.97),-- middle top
            ["AllowVehicle"] = false,
            drawText = '[E] Down to Lobby'
        },
    },
    [10] = {
        [1] = {
            coords = vector4(291.87, -644.01, 42.02, 151.61),--left back
            ["AllowVehicle"] = false, 
            drawText = '[E] Up to Apartments'
        },
        [2] = {
            coords = vector4(270.16, -649.78, 4.65, 247.24),-- top right
            ["AllowVehicle"] = false,
            drawText = '[E] Down to Lobby'
        },
    },
    [11] = { -- Weapon Crafting Mine
        [1] = {
            coords = vector4(-613.23, -1624.84, 33.01, 173.99),--left back
            ["AllowVehicle"] = false, 
            drawText = '[E] Down'
        },
        [2] = {
            coords = vector4(895.49, -3246.01, -98.25, 90.08),-- top right
            ["AllowVehicle"] = false,
            drawText = '[E] Topside'
        },
    },
    [12] = { -- Weapon Crafting Mine vehicle
        [1] = {
            coords = vector4(849.38, 3006.83, 45.21, 0.74),--left back
            ["AllowVehicle"] = true, 
            drawText = '[E] Down'
        },
        [2] = {
            coords = vector4(877.11, -3245.66, -98.04, 89.92),-- top right
            ["AllowVehicle"] = true,
            drawText = '[E] Topside'
        },
    },
    [13] = { -- SinisterMind House
        [1] = {
            coords = vector4(-771.83, 364.01, 56.0, 88.34),--left back
            ["AllowVehicle"] = false, 
            drawText = '[E] Apartment'
        },
        [2] = {
            coords = vector4(-768.76, 336.81, 243.38, 268.12),-- top right
            ["AllowVehicle"] = false,
            drawText = '[E] Garage'
        },
    },
    [14] = {
        [1] = {
            coords = vector4(-791.99, 333.19, 85.26, 180.00),
            ["AllowVehicle"] = true, 
            drawText = '[E] Garage'
        },
        [2] = {
            coords = vector4(-780.16, 366.75, 55.57, 358.71),
            ["AllowVehicle"] = true,
            drawText = '[E] Street'
        },
    },
    [15] = {
        [1] = {
            coords = vector4(-1581.18, -558.47, 34.95, 35.33),
            ["AllowVehicle"] = false, 
            drawText = '[E] Lawyer Office'
        },
        [2] = {
            coords = vector4(-1577.93, -563.63, 108.52, 138.34),
            ["AllowVehicle"] = false,
            drawText = '[E] Street'
        },
    },
    
        --[[[13] = { -- Arena Wars Entry
            [1] = {
                coords = vector4(-282.08, -2031.31, 30.15, 111.42),--left back
                ["AllowVehicle"] = false, 
                drawText = '[E] To Arena Staging Area'
            },
            [2] = {
                coords = vector4(2797.95, -3942.8, 185.24, 358.77),-- top right
                ["AllowVehicle"] = false,
                drawText = '[E] Back to City'
            },
        },
        [14] = { -- Arena Wars start
            [1] = {
                coords = vector4(2816.71, -3934.93, 185.84, 9.32),--left back
                ["AllowVehicle"] = false, 
                drawText = '[E] To Arena Floor'
            },
            [2] = {
                coords = vector4(2799.39, -3899.1, 140.0, 5.41),-- top right
                ["AllowVehicle"] = false,
                drawText = '[E] To Arena Staging Area'
            },
        }]]
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

Config.BusinessSetup = {
    ['hektic'] = {
        ["stash"] = vector3(-328.33, -157.19, 39.02),
        ["duty"] = vector3(-323.5, -150.09, 39.02),
        ["vehicle"] = vector4(-357.38, -159.75, 38.7, 31.09),
        ["closet"] = vector3(-341.47, -162.15, 44.59),
    },
    ['redline'] = {
        ["stash"] = vector3(-572.79, -938.84, 23.89),
        ["duty"] = vector3(-588.96, -930.74, 23.89),
        ["vehicle"] = vector4(-553.28, -934.78, 23.83, 303.01),
        ["closet"] = vector3(-601.19, -915.26, 23.89),
    },
    ['bennys'] = {    
        ["stash"] = vector3(-27.51, -1065.62, 28.4),
        ["duty"] = vector3(-28.58, -1049.53, 28.4),
        ["vehicle"] = vector4(-17.35, -1018.79, 28.92, 73.73),
        ["closet"] = vector3(-41.82, -1064.19, 28.4),
    },
    ['cyberbar'] = {    
        ["stash"] = vector3(349.0, -903.97, 29.25),
        ["duty"] = vector3(324.09, -927.23, 29.25),
        ["vehicle"] = vector4(299.97, -903.34, 29.29, 68.9),
        ["closet"] = vector3(326.31, -927.0, 29.25),
    },
    ['vu'] = {    
        ["stash"] = vector3(93.95, -1290.97, 29.26),
        ["duty"] = vector3(128.66, -1279.83, 29.27),
        ["vehicle"] = vector4(134.43, -1308.41, 28.95, 122.32),
        ["closet"] = vector3(105.31, -1303.17, 28.79),
    },
    ['merqsquad'] = {    
        ["stash"] = vector3(562.79, -3121.15, 18.77),
        ["duty"] = vector3(570.88, -3123.54, 18.77),
        ["closet"] = vector3(575.47, -3121.55, 18.77),
    },
    ['sanders'] = {    
        ["stash"] = vector3(276.86, -1168.93, 29.27),
        ["duty"] = vector3(298.89, -1169.05, 29.67),
        ["closet"] = vector3(274.3, -1165.71, 33.26),
    },
    ['tow'] = {    
        ['stash'] = vector3(-194.47, -1164.76, 23.67),
        ['duty'] = vector3(-193.37, -1162.38, 23.67),
        ['dutyNorth'] = vector3(114.05, 6630.48, 31.97),
        ['closet'] = vector3(-191.72, -1166.05, 23.67),
        ['closetNorth'] = vector3(111.92, 6635.39, 31.97),
    },
    ['dev'] = {    
        ["stash"] = vector3(882.69, -3202.34, -98.2),
    },
    ['sic'] = {    
        ["stash"] = vector3(-70.56, 68.09, 75.83),
        ["duty"] = vector3(-55.81, 70.23, 71.91),
        --["vehicle"] = vector4(542.6, -209.42, 53.66, 173.77),
        ["closet"] = vector3(-72.97, 78.97, 75.83),
    },
    ['noodleexchange'] = {    
        --["stash"] = vector3(538.48, -166.62, 54.49),
        --["duty"] = vector3(-1222.0, -284.19, 37.81),
        ["vehicle"] = vector4(-1220.48, -275.8, 37.93, 207.29),
        --["closet"] = vector3(549.92, -182.55, 54.49),
    },
    --[[['yellowjack'] = {    
        ["stash"] = vector3(538.48, -166.62, 54.49),
        ["duty"] = vector3(547.21, -181.98, 54.49),
        ["vehicle"] = vector4(542.6, -209.42, 53.66, 173.77),
        ["closet"] = vector3(549.92, -182.55, 54.49),
    },]]
    --[[['beanmachine'] = {    
        ["stash"] = vector3(538.48, -166.62, 54.49),
        ["duty"] = vector3(547.21, -181.98, 54.49),
        ["vehicle"] = vector4(542.6, -209.42, 53.66, 173.77),
        ["closet"] = vector3(549.92, -182.55, 54.49),
    },]]
    ['cookies'] = {    
        ["stash"] = vector3(-928.38, -1177.72, -0.88),
        ["duty"] = vector3(-938.85, -1186.72, 4.93),
        ["closet"] = vector3(-931.53, -1169.28, 5.11),
    },
    ['luxauto'] = {    
        --["stash"] = vector3(538.48, -166.62, 54.49),
        ["duty"] = vector3(-801.52, -199.49, 37.15),
        --["vehicle"] = vector4(542.6, -209.42, 53.66, 173.77),
        --["closet"] = vector3(549.92, -182.55, 54.49),
    },
    ['basspro'] = {    
        --["stash"] = vector3(538.48, -166.62, 54.49),
        ["duty"] = vector3(-806.12, -1368.52, 5.18),
        --["vehicle"] = vector4(542.6, -209.42, 53.66, 173.77),
        --["closet"] = vector3(549.92, -182.55, 54.49),
    },
    


}


-- Pedspawn.lua
Config.Peds = {
	Blips = true, -- Enable Blips?
	BlipNamer = true, -- Enable to Name Blips different things, disable if you already have too many blips as this will group them together
	PropSpawn = true, -- Enable Ore Props
	Pedspawn = true, -- Do you want to spawn peds for main locations?
	Invincible = true, --Do you want the peds to be invincible?
	Frozen = true, --Do you want the peds to be unable to move? It's probably a yes, so leave true in there.
	Stoic = true, --Do you want the peds to react to what is happening in their surroundings?
	Fade = true, -- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
	Distance = 40.0, --The distance you want peds to spawn at
}

Config.PedLocations =  {
	['SeaFood'] = { name = "SeaFood", location = vector3(-2193.39, 4289.79, 49.17-0.97), heading = 54.69, blipTrue = true }, 
    
    ['HospitalGuard'] = { name = "HospitalGuard", location = vector3(297.74, -587.08, 43.26-0.97), heading = 54.69, blipTrue = false },

    ['EasterBunny'] = { name = "EasterBunny", location = vector3(186.96, -928.38, 29.72), heading = 54.69, blipTrue = false },
}

Config.PedList = {
	{ model = "s_m_m_migrant_01", coords = Config.PedLocations['SeaFood'].location, heading = Config.PedLocations['SeaFood'].heading, gender = "male", scenario = "WORLD_HUMAN_CLIPBOARD", },

    { model = "mp_m_securoguard_01", coords = Config.PedLocations['HospitalGuard'].location, heading = Config.PedLocations['HospitalGuard'].heading, gender = "male", scenario = "WORLD_HUMAN_GUARD_STAND_ARMY", },

    { model = "a_c_rabbit_01", coords = Config.PedLocations['EasterBunny'].location, heading = Config.PedLocations['EasterBunny'].heading, gender = "male", scenario = "", },
    
}




Config.Vehicles = {
    ["benson2"] = "Delivery Truck",
 }