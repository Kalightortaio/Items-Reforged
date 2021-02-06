local MCMLoaded, MCM = pcall(require, "scripts.modconfig")
ISR.MCMLoaded = MCMLoaded

if MCMLoaded then
    function AnIndexOf(t, val)
		for k, v in ipairs(t) do
			if v == val then
				return k
			end
		end
		return 1
	end

    MCM.AddSpace("Isaac Reforged", "Info")
    MCM.AddText("Isaac Reforged", "Info", function() return "Isaac Reforged" end)
    MCM.AddSpace("Isaac Reforged", "Info")
    MCM.AddText("Isaac Reforged", "Info", function() return "Version "..ISR.Config.Version end)
    MCM.AddSpace("Isaac Reforged", "Info")
    MCM.AddText("Isaac Reforged", "Info", function() return "by Kalightortaio" end)
    
    -- General Options
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doTintedGround"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doTintedGround"] then
					onOff = "True"
				end
				return "Tinted Ground: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doTintedGround"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doTrollTimers"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doTrollTimers"] then
					onOff = "True"
				end
				return "Uniform Troll Timers: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doTrollTimers"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doRightHand"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doRightHand"] then
					onOff = "True"
				end
				return "Right Hand Trinket: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doRightHand"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doCainsOtherEye"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doCainsOtherEye"] then
					onOff = "True"
				end
				return "Cain's Other Eye Synergy: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doCainsOtherEye"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doLostHolyMantle"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doLostHolyMantle"] then
					onOff = "True"
				end
				return "Lost keeps Holy Mantle: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doLostHolyMantle"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doFoundPills"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doFoundPills"] then
					onOff = "True"
				end
				return "I Found Pills: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doFoundPills"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doEternalChests"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doEternalChests"] then
					onOff = "True"
				end
				return "Eternal Chests: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doEternalChests"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )

    -- Transformations
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doConjoined"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doConjoined"] then
					onOff = "True"
				end
				return "Buffed Conjoined: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doConjoined"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doAdult"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doAdult"] then
					onOff = "True"
				end
				return "Buffed Adult: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doAdult"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doMushroom"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doMushroom"] then
					onOff = "True"
				end
				return "Buffed Fun Guy: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doMushroom"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doCrap"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doCrap"] then
					onOff = "True"
				end
				return "Buffed Oh Crap: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doCrap"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doSpiderBaby"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doSpiderBaby"] then
					onOff = "True"
				end
				return "Buffed Spider Baby: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doSpiderBaby"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doBob"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doBob"] then
					onOff = "True"
				end
				return "Buffed Bob: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doBob"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doSeraphim"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doSeraphim"] then
					onOff = "True"
				end
				return "Buffed Seraphim: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doSeraphim"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doBeelzbub"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doBeelzbub"] then
					onOff = "True"
				end
				return "Buffed Beelzebub: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doBeelzbub"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Transf.",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["doMagneto"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["doMagneto"] then
					onOff = "True"
				end
				return "New Magneto: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["doMagneto"] = currentBool
            end,
            Info = {"Toggles additional mechanics"}
        }
    )

    -- Starting Trinkets
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsIsaac"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsIsaac"] then
					onOff = "True"
				end
				return "Isaac: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsIsaac"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsMagdalene"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsMagdalene"] then
					onOff = "True"
				end
				return "Magdalene: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsMagdalene"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsCain"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsCain"] then
					onOff = "True"
				end
				return "Cain: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsCain"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsJudas"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsJudas"] then
					onOff = "True"
				end
				return "Judas: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsJudas"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsXXX"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsXXX"] then
					onOff = "True"
				end
				return "XXX: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsXXX"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsEve"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsEve"] then
					onOff = "True"
				end
				return "Eve: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsEve"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsSamson"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsSamson"] then
					onOff = "True"
				end
				return "Samson: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsSamson"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsAzazel"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsAzazel"] then
					onOff = "True"
				end
				return "Azazel: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsAzazel"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsLazarus"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsLazarus"] then
					onOff = "True"
				end
				return "Lazarus: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsLazarus"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsEden"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsEden"] then
					onOff = "True"
				end
				return "Eden: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsEden"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsLost"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsLost"] then
					onOff = "True"
				end
				return "The Lost: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsLost"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsLilith"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsLilith"] then
					onOff = "True"
				end
				return "Lilith: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsLilith"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsKeeper"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsKeeper"] then
					onOff = "True"
				end
				return "The Keeper: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsKeeper"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsApollyon"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsApollyon"] then
					onOff = "True"
				end
				return "Apollyon: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsApollyon"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
    MCM.AddSetting(
        "Isaac Reforged",
        "Trinkets",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return ISR.Config["StartingTrinketsForgotten"]
            end,
            Display = function()
				local onOff = "False"
				if ISR.Config["StartingTrinketsForgotten"] then
					onOff = "True"
				end
				return "The Forgotten: " .. onOff
            end,
            OnChange = function(currentBool)
				ISR.Config["StartingTrinketsForgotten"] = currentBool
            end,
            Info = {"Toggles if custom trinkets should be added"}
        }
    )
end