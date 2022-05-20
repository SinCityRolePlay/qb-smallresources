CreateThread(function()
	while true do
	local count = 0

local text = {
"SinCityRP",
}
		for _, __ in pairs(text) do 
			count = count + 1
		end
			
		local presence  = math.random(1, count)
		local player = GetPlayerPed(-1)

		SetDiscordAppId('873455487369216040')
		SetDiscordRichPresenceAsset('sincity') -- Name of the image.
	    SetDiscordRichPresenceAssetText('SinCityRP') -- Text that pops up when you hover over the image.
        SetDiscordRichPresenceAssetSmall('discord') -- Name of the small image.
		SetDiscordRichPresenceAssetSmallText('https://discord.gg/ek5Cmh44K6') -- Name of the small tsext.
        SetDiscordRichPresenceAction(0, "SinCityRP - Discord", "https://discord.gg/ek5Cmh44K6") -- Button 1 and link
	    SetDiscordRichPresenceAction(1, "SinCityRP - Server", "fivem://connect/147.135.6.206") --  Button 2 and link

		while true do
        Citizen.Wait(1500)
        players = {}
        for i = 0, 128 do
            if NetworkIsPlayerActive( i ) then
                table.insert( players, i )
            end
        end
        SetRichPresence("AS | "..GetPlayerName(PlayerId()) .. " - ID: " ..GetPlayerServerId(PlayerId()).. " - " .. #players + 0 .. "/64 Players")

	end

		SetRichPresence((GetPlayerName(PlayerId())) .. " -") -- [Steam username] [text]
	--	SetRichPresence("".. text[presence] .."")  -- [text]
		SetDiscordRichPresenceAssetText('https://discord.gg/ek5Cmh44K6')
		print('^5Join Our Discord!')
		Citizen.Wait(300000) -- 5 minutes 
	end
end)