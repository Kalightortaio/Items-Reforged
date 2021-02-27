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
    local coinLuck = {0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1}
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.SCROLL,
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
    -- Broken Modem
    local modemLuck = {0, 0.08, 0.15, 0.23, 0.30, 0.38, 0.45, 0.53, 0.70, 0.66, 0.75}
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.SCROLL,
            CurrentSetting = function()
                return AnIndexOf(modemLuck, IR.Config["BrokenModemChance"]) - 1
            end,
            Display = function()
                return "Broken Modem Chance: $scroll" ..
                    AnIndexOf(modemLuck, IR.Config["BrokenModemChance"]) - 1 .. " " .. IR.Config["BrokenModemChance"] .. " %"
            end,
            OnChange = function(currentNum)
                IR.Config["BrokenModemChance"] = modemLuck[currentNum + 1]
            end,
            Info = {"The chance to negate incoming damage"}
        }
    )
    -- Monster Manual
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
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
    -- Cursed Eye
    MCM.AddSetting(
        "Items Reforged",
        "General",
        {
            Type = ModConfigMenu.OptionType.NUMBER,
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
            Type = ModConfigMenu.OptionType.NUMBER,
            Minimum = -1,
            Maximum = 1,
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
            Type = ModConfigMenu.OptionType.NUMBER,
            Minimum = 0,
            Maximum = 10,
            CurrentSetting = function()
                return IR.Config["IsaacsHeartChance"]
            end,
            Display = function()
				return "Isaac's Heart Drop Chance: " ..(33 / 10 * IR.Config["IsaacsHeartChance"]).. "%"
            end,
            OnChange = function(currentNum)
				IR.Config["IsaacsHeartChance"] = currentNum
            end,
            Info = {"The chance to find red hearts with Isaac's Heart"}
        }
    )

    -- Toggle Individual Items
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBreathOfLife"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBreathOfLife"] then
                    onOff = "True"
                end
                return "Breath of Life: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBreathOfLife"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doGlassCannon"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doGlassCannon"] then
                    onOff = "True"
                end
                return "Glass Cannon: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doGlassCannon"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doMomsPad"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doMomsPad"] then
                    onOff = "True"
                end
                return "Mom's Pad: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doMomsPad"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doMomsBra"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doMomsBra"] then
                    onOff = "True"
                end
                return "Mom's Bra: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doMomsBra"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doDeadSeaScrolls"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doDeadSeaScrolls"] then
                    onOff = "True"
                end
                return "Dead Sea Scrolls: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doDeadSeaScrolls"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doScissors"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doScissors"] then
                    onOff = "True"
                end
                return "Scissors: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doScissors"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doPoop"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doPoop"] then
                    onOff = "True"
                end
                return "The Poop: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doPoop"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doHallowedGround"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doHallowedGround"] then
                    onOff = "True"
                end
                return "Hallowed Ground: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doHallowedGround"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doMonsterManual"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doMonsterManual"] then
                    onOff = "True"
                end
                return "Monster Manual: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doMonsterManual"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doDataminer"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doDataminer"] then
                    onOff = "True"
                end
                return "Dataminer: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doDataminer"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doYumHeart"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doYumHeart"] then
                    onOff = "True"
                end
                return "Yum Heart: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doYumHeart"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doHourglass"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doHourglass"] then
                    onOff = "True"
                end
                return "Hourglass: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doHourglass"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doSpiderButt"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doSpiderButt"] then
                    onOff = "True"
                end
                return "Spider Butt: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doSpiderButt"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doPlanC"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doPlanC"] then
                    onOff = "True"
                end
                return "Plan C: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doPlanC"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doKamikaze"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doKamikaze"] then
                    onOff = "True"
                end
                return "Kamikaze: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doKamikaze"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Actives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doWoodenNickel"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doWoodenNickel"] then
                    onOff = "True"
                end
                return "Wooden Nickel: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doWoodenNickel"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doTinyPlanet"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doTinyPlanet"] then
                    onOff = "True"
                end
                return "Tiny Planet: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doTinyPlanet"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doMagneto"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doMagneto"] then
                    onOff = "True"
                end
                return "Magneto: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doMagneto"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doDadsLostCoin"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doDadsLostCoin"] then
                    onOff = "True"
                end
                return "Dad's Lost Coin: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doDadsLostCoin"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doTrisagion"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doTrisagion"] then
                    onOff = "True"
                end
                return "Trisagion: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doTrisagion"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doStrangeAttractor"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doStrangeAttractor"] then
                    onOff = "True"
                end
                return "Strange Attractor: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doStrangeAttractor"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doCursedEye"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doCursedEye"] then
                    onOff = "True"
                end
                return "Cursed Eye: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doCursedEye"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doDeadTooth"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doDeadTooth"] then
                    onOff = "True"
                end
                return "Dead Tooth: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doDeadTooth"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doHolyWater"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doHolyWater"] then
                    onOff = "True"
                end
                return "Holy Water: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doHolyWater"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doMissingPage"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doMissingPage"] then
                    onOff = "True"
                end
                return "Missing Page 2: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doMissingPage"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doLittleBaggy"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doLittleBaggy"] then
                    onOff = "True"
                end
                return "Little Baggy: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doLittleBaggy"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doGodsFlesh"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doGodsFlesh"] then
                    onOff = "True"
                end
                return "God's Flesh: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doGodsFlesh"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doIsaacsHeart"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doIsaacsHeart"] then
                    onOff = "True"
                end
                return "Isaac's Heart: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doIsaacsHeart"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doFastBombs"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doFastBombs"] then
                    onOff = "True"
                end
                return "Fast Bombs: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doFastBombs"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doThreeDollar"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doThreeDollar"] then
                    onOff = "True"
                end
                return "3 Dollar Bill (range): " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doThreeDollar"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doThreeDollars"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doThreeDollars"] then
                    onOff = "True"
                end
                return "3 Dollar Bill (worth): " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doThreeDollars"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doTechTwo"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doTechTwo"] then
                    onOff = "True"
                end
                return "Technology 2: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doTechTwo"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doCommonCold"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doCommonCold"] then
                    onOff = "True"
                end
                return "Common Cold: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doCommonCold"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doPlacenta"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doPlacenta"] then
                    onOff = "True"
                end
                return "Placenta: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doPlacenta"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doLuckyFoot"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doLuckyFoot"] then
                    onOff = "True"
                end
                return "Lucky Foot: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doLuckyFoot"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBlackBean"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBlackBean"] then
                    onOff = "True"
                end
                return "Black Bean: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBlackBean"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doMagicEightBall"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doMagicEightBall"] then
                    onOff = "True"
                end
                return "Magic 8 Ball: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doMagicEightBall"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBetrayal"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBetrayal"] then
                    onOff = "True"
                end
                return "Betrayal: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBetrayal"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doShard"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doShard"] then
                    onOff = "True"
                end
                return "Shard of Glass: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doShard"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doPokeGo"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doPokeGo"] then
                    onOff = "True"
                end
                return "Poke-Go: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doPokeGo"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doDeepPockets"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doDeepPockets"] then
                    onOff = "True"
                end
                return "Deep Pockets: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doDeepPockets"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doGlyph"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doGlyph"] then
                    onOff = "True"
                end
                return "Glyph of Balance: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doGlyph"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doAries"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doAries"] then
                    onOff = "True"
                end
                return "Aries: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doAries"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBrokenModem"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBrokenModem"] then
                    onOff = "True"
                end
                return "Broken Modem: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBrokenModem"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doSoyMilk"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doSoyMilk"] then
                    onOff = "True"
                end
                return "Soy Milk: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doSoyMilk"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Passives",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doSpear"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doSpear"] then
                    onOff = "True"
                end
                return "Spear of Destiny: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doSpear"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doFriendlyExplosions"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doFriendlyExplosions"] then
                    onOff = "True"
                end
                return "Friendly Explosions: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doFriendlyExplosions"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doAbel"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doAbel"] then
                    onOff = "True"
                end
                return "Abel: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doAbel"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBrotherBobby"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBrotherBobby"] then
                    onOff = "True"
                end
                return "Brother Bobby: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBrotherBobby"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doSisterMaggy"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doSisterMaggy"] then
                    onOff = "True"
                end
                return "Sister Maggy: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doSisterMaggy"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doLittleChad"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doLittleChad"] then
                    onOff = "True"
                end
                return "Little C.H.A.D.: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doLittleChad"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doLittleGish"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doLittleGish"] then
                    onOff = "True"
                end
                return "Little Gish: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doLittleGish"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doGuppyHairball"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doGuppyHairball"] then
                    onOff = "True"
                end
                return "Guppy's Hairball: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doGuppyHairball"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBestBud"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBestBud"] then
                    onOff = "True"
                end
                return "Best Bud: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBestBud"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doKingBaby"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doKingBaby"] then
                    onOff = "True"
                end
                return "King Baby: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doKingBaby"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBloodshotEye"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBloodshotEye"] then
                    onOff = "True"
                end
                return "Bloodshot Eye: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBloodshotEye"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doRainbowBaby"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doRainbowBaby"] then
                    onOff = "True"
                end
                return "Rainbow Baby: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doRainbowBaby"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doCainsOtherEye"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doCainsOtherEye"] then
                    onOff = "True"
                end
                return "Cain's Other Eye: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doCainsOtherEye"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doPeeper"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doPeeper"] then
                    onOff = "True"
                end
                return "The Peeper: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doPeeper"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doGhostBaby"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doGhostBaby"] then
                    onOff = "True"
                end
                return "Ghost Baby: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doGhostBaby"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doLittleSteven"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doLittleSteven"] then
                    onOff = "True"
                end
                return "Little Steven: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doLittleSteven"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doHarlequinBaby"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doHarlequinBaby"] then
                    onOff = "True"
                end
                return "Harlequin Baby: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doHarlequinBaby"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doFartingBaby"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doFartingBaby"] then
                    onOff = "True"
                end
                return "Farting Baby: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doFartingBaby"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doPunchingBag"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doPunchingBag"] then
                    onOff = "True"
                end
                return "Punching Bag: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doPunchingBag"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doKeyBum"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doKeyBum"] then
                    onOff = "True"
                end
                return "Key Bum: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doKeyBum"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
    MCM.AddSetting(
        "Items Reforged",
        "Familiars",
        {
            Type = ModConfigMenu.OptionType.BOOLEAN,
            CurrentSetting = function()
                return IR.Config["doBumFriend"]
            end,
            Display = function()
                local onOff = "False"
                if IR.Config["doBumFriend"] then
                    onOff = "True"
                end
                return "Bum Friend: " .. onOff
            end,
            OnChange = function(currentBool)
                IR.Config["doBumFriend"] = currentBool
            end,
            Info = {"Enable or disable individual items"}
        }
    )
end