local QBCore = exports['qb-core']:GetCoreObject()

local blips = {
    -- Title is the displayed name on the map
    -- color MUST have the 'u' in it
    -- ALL coords MUST include 2 decimal places
    -- 'id' is the sprite ID found here -> https://wiki.gtanet.work/index.php?title=Blips , https://docs.fivem.net/docs/game-references/blips/
  
   {title = "Dispensary", colour=25, id=469, x = 377.72, y = -836.19, z = 29.29},
   --{title = "Game Warden Department", colour=52, id=137, x = 394.28, y = 791.22, z = 187.36},
   --{title="Paleto PD", colour=38, id=137, x = -429.76, y = 6027.76, z = 31.09},
   {title = "Davis PD", colour=38, id=137, x = 380.19, y = -1594.11, z = 30.06},
   {title = "San Anderas State Police", colour=38, id=137, x = 851.69, y = -1294.61, z = 43.48},
   --{title = "Art Gallery", colour=60, id=468, x = -425.51, y = 17.49, z = 46.29},
   --{title = "Meat Processing Plant", colour=49, id=141, x = 994.40, y = -2162.40, z = 30.41},
   --{title = "Hide Merchant", colour=49, id=141, x = 173.60, y = 2778.93, z = 46.08},
   {title = "Burger Shot", colour=17, id=106, x = -1170.99, y = -888.23, z = 13.99},
   {title = "Yellow Jack", colour=27, id=140, x = 1994.08, y = 3059.18, z =47.05},
   {title = "Apple Store", colour=37, id=521, x = 151.53, y = -228.16, z =54.42},
   {title = "CyberBar", colour=83, id=484, x = 327.94, y = -907.16, z =29.25},
   {title = "Arcade", colour=46, id=484, x = -1651.51, y = -1082.35, z =13.16},
   {title = "Scrap Yard", colour=47, id=380, x = 2404.07, y = 3127.73, z =48.15},
   {title = "Tequilala", colour=4, id=84, x = -564.58, y = 275.75, z =83.10},
   {title = "Cookies", colour=67, id=496, x = -939.66, y = -1179.19, z =4.97},

   {title = "Lawyer Office", colour=67, id=475, x = -1581.18, y = -558.47, z = 34.95}, -- lawyer offies
   --vector4(-1581.18, -558.47, 34.95, 35.33)

   -- Mechanics 
   {title = "Hektic Customs", colour=27, id=446, x = -334.89, y = -148.44, z = 39.01},
   {title = "Redline", colour=1, id=446, x = -560.40, y = -930.25, z = 23.88},
   {title = "Benny's Autoworks", colour=57, id=446, x = -44.2, y = -1043.57, z = 28.8},
   {title="Noodle Exchange", colour=1, id=197, x = -1233.21, y = -277.42, z =37.77},
   {title="Easter Bunny", colour=48, id=587, x = 186.98, y = -928.86, z =30.69},
   --{title="Event", colour=67, id=303, x = -281.99, y = -2031.22, z = 30.15},
  }
  
  CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
  end)
  
  -- Test Function to draw a red circle around a target
  --[[Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      if info.title == "Test Blip" then 
        zoneblip = AddBlipForRadius(info.x,info.y,info.z, 550.0)
        SetBlipSprite(zoneblip,1)
        SetBlipColour(zoneblip,49)
        SetBlipAlpha(zoneblip,75)
      end
    end
  end)--]]