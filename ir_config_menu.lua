local MCMLoaded, MCM = pcall(require, "scripts.modconfig")
IR.MCMLoaded = MCMLoaded

if MCMLoaded then
    function AnIndexOf(t, val)
		for k, v in ipairs(t) do
			if v == val then
				return k
			end
		end
		return 1
	end

    MCM.AddSpace("Items Reforged", "Info")
    MCM.AddText("Items Reforged", "Info", function() return "Items Reforged" end)
    MCM.AddSpace("Items Reforged", "Info")
    MCM.AddText("Items Reforged", "Info", function() return "Version "..IR.Config.Version end)
    MCM.AddSpace("Items Reforged", "Info")
    MCM.AddText("Items Reforged", "Info", function() return "by Kalightortaio" end)
    
    -- Dad's Lost Coin
    local coinLuck = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1}
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.SCROLL,
            CurrentSetting = function()
                return AnIndexOf(coinLuck, IR.Config["DadsLostCoinLuck"]) - 1
            end,
            Display = function()
				return "Dad's Lost Coin: $scroll" ..
					AnIndexOf(coinLuck, IR.Config["DadsLostCoinLuck"]) - 1 .. " " .. IR.Config["DadsLostCoinLuck"] .. " Luck"
            end,
            OnChange = function(currentNum)
				IR.Config["DadsLostCoinLuck"] = coinLuck[currentNum + 1]
            end,
            Info = {"The amount of luck each coin gives"}
        }
    )
    -- Monster Manual
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.NUMBER,
            CurrentSetting = function()
                return IR.Config["MonsterManualLimit"]
            end,
            Minimum = 1,
            Maximum = 50,
            Display = function()
				return "Monster Manual Limit: " ..IR.Config["MonsterManualLimit"]
            end,
            OnChange = function(currentNum)
				IR.Config["MonsterManualLimit"] = currentNum
            end,
            Info = {"The maximum amount of familiars granted per floor"}
        }
    )
    -- Mom's Pad
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["MomsPadFear"]
            end,
            Display = function()
				local onOff = "False"
				if IR.Config["MomsPadFear"] then
					onOff = "True"
				end
				return "Mom's Pad Fear: " .. onOff
            end,
            OnChange = function(currentBool)
				IR.Config["MomsPadFear"] = currentBool
            end,
            Info = {"Toggles if Mom's Pad should fear enemies"}
        }
    )
    -- Mom's Bra
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["MomsBraSlow"]
            end,
            Display = function()
				local onOff = "False"
				if IR.Config["MomsBraSlow"] then
					onOff = "True"
				end
				return "Mom's Bra Slow: " .. onOff
            end,
            OnChange = function(currentBool)
				IR.Config["MomsBraSlow"] = currentBool
            end,
            Info = {"Toggles if Mom's Bra should slow enemies"}
        }
    )
    -- Cursed Eye
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.NUMBER,
            Minimum = 0,
            Maximum = 10,
            CurrentSetting = function()
                return IR.Config["CursedEyeChance"]
            end,
            Display = function()
				return "Cursed Eye Confusion: " ..(10 * IR.Config["CursedEyeChance"]).. "%"
            end,
            OnChange = function(currentNum)
				IR.Config["CursedEyeChance"] = currentNum
            end,
            Info = {"The chance to confuse enemies with cursed eye"}
        }
    )
    -- Strange Attractor
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.NUMBER,
            Minimum = -1,
            Maximum = 5,
            CurrentSetting = function()
                return IR.Config["StrangeAttractorDist"]
            end,
            Display = function()
				return "Strage Attractor Range: " ..IR.Config["StrangeAttractorDist"]
            end,
            OnChange = function(currentNum)
				IR.Config["StrangeAttractorDist"] = currentNum
            end,
            Info = {"The range at which strange attractor pulls in objects"}
        }
    )
    -- Isaac's Heart
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenuOptionType.NUMBER,
            Minimum = 0,
            Maximum = 10,
            CurrentSetting = function()
                return IR.Config["IsaacsHeartChance"]
            end,
            Display = function()
				return "Isaac's Heart Drop Chance: " ..(10 * IR.Config["IsaacsHeartChance"]).. "%"
            end,
            OnChange = function(currentNum)
				IR.Config["IsaacsHeartChance"] = currentNum
            end,
            Info = {"The chance to find red hearts with Isaac's Heart"}
        }
    )
end