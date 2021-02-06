--------------------------------------------------------------------------------------------------
-- Isaac Reforged by Kalightortaio, Krishna Kokatay, 2020. http://www.kalightortaio.com         --
-- A huge thank you to Lytebringr, Wofsauge, and the #modding-dev community in the TBOI Discord --
--------------------------------------------------------------------------------------------------
ISR = RegisterMod("Isaac Reforged", 1)
local json = require("json")
local Game = Game()
require("isr_config")
ISR.Config = ISR.DefaultConfig
ISR.Config.Version = "1.6.2"
ISR.GameState = {}
ISR.EntityList = {
    Bombs = {}
}
ISR.Transformations = {
    hasConjoined = false,
    hasAdult = false,
    hasMushroom = false,
    hasCrap = false,
    hasSpiderBaby = false,
    hasBob = false,
    hasSeraphim = false,
    hasBeelzbub = false,
    hasMagneto = false,
}   
ISR.ActiveItemTimer = 0
ISR.TintedGround = {
    checkForDigging = false,
    hasDug = false,
    currentFloorMG = {},
    currentFloorDG = {},
    currentRoomMG = 0,
    MGX = 0,
    MGY = 0,
    markedGround = {
        Type = EntityType.ENTITY_EFFECT,
        Variant = EffectVariant.PLAYER_CREEP_RED,
        SubType0 = 742854312,
        SubType1 = 742854313,
        Spawner = nil,
    }
}
TrinketType.TRINKET_FF_RIGHT_HAND = Isaac.GetTrinketIdByName("The Right Hand")
TrinketType.TRINKET_RIGHT_HAND = Isaac.GetTrinketIdByName(" The Right Hand ")
PillEffect.PILLEFECT_DUALITY = Isaac.GetPillEffectByName("Duality!")
PillEffect.PILLEFECT_MAGNETO = Isaac.GetPillEffectByName("Magneto!")
require("isr_config_menu")
Isaac.ConsoleOutput("Isaac Reforged v" .. ISR.Config.Version .. ": Next update... New Transformations!\n")


if EID then
    EID:addTrinket(TrinketType.TRINKET_RIGHT_HAND, "Turns all chests into eternal chests")
    EID:addPill(PillEffect.PILLEFFECT_I_FOUND_PILLS, "It's a mystery")
end

function ISR:onStart()
    if ISR:HasData() then
        ISR.GameState = json.decode(ISR:LoadData())
        if ISR.GameState.Transformations ~= nil then
            ISR.Transformations = ISR.GameState.Transformations
        end
        if ISR.GameState.TintedGround ~= nil then
            ISR.TintedGround = ISR.GameState.TintedGround
        end
        if ISR.MCMLoaded then
            local savedISRConfig = ISR.GameState.Config
            if savedISRConfig.Version == ISR.Config.Version then
                for key, value in pairs(ISR.Config) do
                    ISR.Config[key] = savedISRConfig[key]
                end
            elseif savedISRConfig.Version ~= nil and savedISRConfig.Version ~= ISR.Config.Version then
                for key, value in pairs(ISR.Config) do
                    if savedISRConfig[key] ~= nil then
                        ISR.Config[key] = savedISRConfig[key]
                    end
                end
                ISR.Config.Version = "1.6"
            end
        end
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, ISR.onStart)

function ISR:onExit()
    ISR.GameState.Transformations = ISR.Transformations
    ISR.GameState.TintedGround = ISR.TintedGround
    ISR.GameState.Config = ISR.Config
    ISR:SaveData(json.encode(ISR.GameState))
end

ISR:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, ISR.onExit)
ISR:AddCallback(ModCallbacks.MC_POST_GAME_END, ISR.onExit)

function ISR:onUpdate()
    --------------------
    -- Initialization --
    --------------------
    if Game:GetFrameCount() == 1 then
        for playerNum = 1, Game:GetNumPlayers() do
            local player = Game:GetPlayer(playerNum - 1)
            -----------------------
            -- Starting Trinkets --
            -----------------------
            if ISR.Config["StartingTrinketsIsaac"] and player:GetPlayerType() == PlayerType.PLAYER_ISAAC and player:GetTrinket(0) == 0 then
                -- Innate: Golden Horse Shoe
                -- Holding: Bag Lunch
                player:AddTrinket(TrinketType.TRINKET_GOLDEN_HORSE_SHOE)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_BAG_LUNCH)
            elseif ISR.Config["StartingTrinketsMagdalene"] and player:GetPlayerType() == PlayerType.PLAYER_MAGDALENA and player:GetTrinket(0) == 0 then
                -- Innate: Purple Heart
                -- Holding: Maggy's Faith
                player:AddTrinket(TrinketType.TRINKET_PURPLE_HEART)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_MAGGYS_FAITH)
            elseif ISR.Config["StartingTrinketsCain"] and player:GetPlayerType() == PlayerType.PLAYER_CAIN and player:GetTrinket(0) == 0 then
                -- Innate: Lucky Toe
                -- Holding: Paper Clip
                player:AddTrinket(TrinketType.TRINKET_LUCKY_TOE)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
            elseif ISR.Config["StartingTrinketsJudas"] and player:GetPlayerType() == PlayerType.PLAYER_JUDAS and player:GetTrinket(0) == 0 then
                -- Innate: Black Feather
                -- Holding: Judas' Tongue
                player:AddTrinket(TrinketType.TRINKET_BLACK_FEATHER)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_JUDAS_TONGUE)
            elseif ISR.Config["StartingTrinketsXXX"] and player:GetPlayerType() == PlayerType.PLAYER_XXX and player:GetTrinket(0) == 0 then
                -- Innate: Meconium
                -- Holding: Petrified Poop
                player:AddTrinket(TrinketType.TRINKET_MECONIUM)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_PETRIFIED_POOP)
            elseif ISR.Config["StartingTrinketsEve"] and player:GetPlayerType() == PlayerType.PLAYER_EVE and player:GetTrinket(0) == 0 then
                -- Innate: Daemon's Tail
                -- Holding: Wish Bone
                player:AddTrinket(TrinketType.TRINKET_DAEMONS_TAIL)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_WISH_BONE)
            elseif ISR.Config["StartingTrinketsSamson"] and player:GetPlayerType() == PlayerType.PLAYER_SAMSON and player:GetTrinket(0) == 0 then
                -- Innate: Samson's Lock
                -- Holding: Child's Heart
                player:AddTrinket(TrinketType.TRINKET_SAMSONS_LOCK)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
            elseif ISR.Config["StartingTrinketsAzazel"] and player:GetPlayerType() == PlayerType.PLAYER_AZAZEL and player:GetTrinket(0) == 0 then
                -- Innate: A Missing Page
                -- Holding: Curved Horn
                player:AddTrinket(TrinketType.TRINKET_MISSING_PAGE)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_TAPE_WORM)
            elseif ISR.Config["StartingTrinketsLazarus"] and player:GetPlayerType() == PlayerType.PLAYER_LAZARUS and player:GetTrinket(0) == 0 then
                -- Innate: Lost Cork
                -- Holding: Rosary Bead
                player:AddTrinket(TrinketType.TRINKET_LOST_CORK)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_ROSARY_BEAD)
            elseif ISR.Config["StartingTrinketsEden"] and player:GetPlayerType() == PlayerType.PLAYER_EDEN and player:GetTrinket(0) == 0 then
                -- Innate: Error 404
                player:AddTrinket(TrinketType.TRINKET_ERROR)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
            elseif ISR.Config["StartingTrinketsLost"] and player:GetPlayerType() == PlayerType.PLAYER_THELOST and player:GetTrinket(0) == 0 then
                -- Innate: Faded Polaroid
                -- Holding: Fragmented Card
                player:AddTrinket(TrinketType.TRINKET_FADED_POLAROID)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_FRAGMENTED_CARD)
            elseif ISR.Config["StartingTrinketsLilith"] and player:GetPlayerType() == PlayerType.PLAYER_LILITH and player:GetTrinket(0) == 0 then
                -- Innate: Child Leash
                -- Holding: Blind Rage
                player:AddTrinket(TrinketType.TRINKET_CHILD_LEASH)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_BLIND_RAGE)
            elseif ISR.Config["StartingTrinketsKeeper"] and player:GetPlayerType() == PlayerType.PLAYER_KEEPER and player:GetTrinket(0) == 0 then
                -- Innate: Rib of Greed
                -- Holding: Store Key
                player:AddTrinket(TrinketType.TRINKET_RIB_OF_GREED)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
            elseif ISR.Config["StartingTrinketsApollyon"] and player:GetPlayerType() == PlayerType.PLAYER_APOLLYON and player:GetTrinket(0) == 0 then
                -- Innate: Callus
                -- Holding: Locus of Conquest
                player:AddTrinket(TrinketType.TRINKET_CALLUS)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_LOCUST_OF_CONQUEST)
            elseif ISR.Config["StartingTrinketsForgotten"] and player:GetPlayerType() == PlayerType.PLAYER_THEFORGOTTEN and player:GetTrinket(0) == 0 then
                -- Innate: Crow Heart
                -- Holding: Finger Bone
                player:AddTrinket(TrinketType.TRINKET_CROW_HEART)
                player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, false, false, true, true)
                player:AddTrinket(TrinketType.TRINKET_FINGER_BONE)            
            end
        end
    end
    for playerNum = 1, Game:GetNumPlayers() do
        local player = Game:GetPlayer(playerNum - 1)
        ISR.EntityList.Bombs = Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.BOMB_EXPLOSION, -1, false, false)
        local room = Game:GetRoom()
        --------------------
        -- Eternal Chests --
        --------------------
        if ISR.Config["doEternalChests"] then
            for _, entity in pairs(Isaac.FindByType(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_ETERNALCHEST, -1, false, false)) do
                local data = entity:GetData()
                if data.EternalChestTimer == nil then
                    data.EternalChestTimer = 0
                elseif entity.SubType == ChestSubType.CHEST_CLOSED then
                    data.EternalChestTimer = 0
                elseif entity.SubType == ChestSubType.CHEST_OPENED then
                    data.EternalChestTimer = data.EternalChestTimer + 1
                end
                if data.EternalChestTimer > 60 then
                    data.EternalChestTimer = 0
                    entity:ToPickup():Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_ETERNALCHEST, -1, false)
                    if math.random(100) < 8 then
                        player:AnimateTeleport(0)
                        Isaac.ExecuteCommand("goto s.angel")
                    end
                end
            end
        end
        ----------------------------------
        -- The Conjoined Transformation --
        ----------------------------------
        if ISR.Transformations.hasConjoined and not player:HasPlayerForm(PlayerForm.PLAYERFORM_BABY) then
            ISR.Transformations.hasConjoined = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_BABY) and not ISR.Transformations.hasConjoined and ISR.Config["doConjoined"] then
            ISR.Transformations.hasConjoined = true
            player:AddCollectible(CollectibleType.COLLECTIBLE_BELLY_BUTTON, 1, false)
            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_CANCER, player.Position, Vector(0,0), player)
        end
        ------------------------------
        -- The Right and Left Hands --
        ------------------------------
        if (player:GetTrinket(0) == TrinketType.TRINKET_RIGHT_HAND and player:GetTrinket(1) == TrinketType.TRINKET_LEFT_HAND) or (player:GetTrinket(0) == TrinketType.TRINKET_LEFT_HAND and player:GetTrinket(1) == TrinketType.TRINKET_RIGHT_HAND) and ISR.Config["doRightHand"] then
            player:TryRemoveTrinket(TrinketType.TRINKET_RIGHT_HAND)
            player:TryRemoveTrinket(TrinketType.TRINKET_LEFT_HAND)
            SFXManager():Play(SoundEffect.SOUND_POWERUP_SPEWER, 1.0, 0, false, 1.0)
            player:UsePill(PillEffect.PILLEFECT_DUALITY, PillColor.PILL_NULL)
            player:AddCollectible(CollectibleType.COLLECTIBLE_EUCHARIST, 0, false)
            player:AddCollectible(CollectibleType.COLLECTIBLE_DUALITY, 0, false)
        end
        ------------------------------
        -- The Adult Transformation --
        ------------------------------
        if ISR.Transformations.hasAdult and not player:HasPlayerForm(PlayerForm.PLAYERFORM_ADULTHOOD) then
            ISR.Transformations.hasAdult = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_ADULTHOOD) and not ISR.Transformations.hasAdult and ISR.Config["doAdult"] then
            ISR.Transformations.hasAdult = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_DEPRESSION) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_DEPRESSION, 1, false)
            end
        end
        --------------------------------
        -- The Fun Guy Transformation --
        --------------------------------
        if ISR.Transformations.hasMushroom and not player:HasPlayerForm(PlayerForm.PLAYERFORM_MUSHROOM) then
            ISR.Transformations.hasMushroom = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_MUSHROOM) and not ISR.Transformations.hasMushroom and ISR.Config["doMushroom"] then
            ISR.Transformations.hasMushroom = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_ONE_UP) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_ONE_UP, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_MAGIC_MUSHROOM) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_MAGIC_MUSHROOM, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_MINI_MUSH) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_MINI_MUSH, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_RATE) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_RATE, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_DAMAGE) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_ODD_MUSHROOM_DAMAGE, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_BLUE_CAP) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_BLUE_CAP, 1, false)
            end
        end
        --------------------------------
        -- The Oh Crap Transformation --
        --------------------------------
        if not ISR.Transformations.hasCrap and ISR.Config["doCrap"] then
            local hasCrapCounter = 0
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_NUMBER_ONE) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_NUMBER_TWO) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_POOP) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_E_COLI) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_FLUSH) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_FARTING_BABY) then
                hasCrapCounter = hasCrapCounter + 1
            end
            if hasCrapCounter > 2 then
                local currentActiveItem = player:GetActiveItem()
                local currentActiveCharge = player:GetActiveCharge()
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_E_COLI) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_E_COLI, 1, false)
                end
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_POOP) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_POOP, 10, false)
                end
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_FLUSH) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_FLUSH, 10, false)
                end
                player:AddCollectible(currentActiveItem, currentActiveCharge, false)
            else
                hasCrapCounter = 0
            end
        end
        if ISR.Transformations.hasCrap and not player:HasPlayerForm(PlayerForm.PLAYERFORM_POOP) then
            ISR.Transformations.hasCrap = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_POOP) and not ISR.Transformations.hasCrap and ISR.Config["doCrap"] then
            ISR.Transformations.hasCrap = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_BUTT_BOMBS, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_NUMBER_ONE) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_NUMBER_ONE, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_NUMBER_TWO) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_NUMBER_TWO, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_E_COLI) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_E_COLI, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_FARTING_BABY) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_FARTING_BABY, 1, false)
            end
        end
        ------------------------------------
        -- The Spider Baby Transformation --
        ------------------------------------
        if ISR.Transformations.hasSpiderBaby and not player:HasPlayerForm(PlayerForm.PLAYERFORM_SPIDERBABY) then
            ISR.Transformations.hasSpiderBaby = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_SPIDERBABY) and not ISR.Transformations.hasSpiderBaby and ISR.Config["doSpiderBaby"] then
            ISR.Transformations.hasSpiderBaby = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDER_BITE) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_SPIDER_BITE, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDER_MOD) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_SPIDER_MOD, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDERBABY) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_SPIDERBABY, 1, false)
            end
        end
        ----------------------------
        -- The Bob Transformation --
        ----------------------------
        if not ISR.Transformations.hasBob and ISR.Config["doBob"] then
            local hasBobCounter = 0
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_BRAIN) then
                hasBobCounter = hasBobCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) then
                hasBobCounter = hasBobCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                hasBobCounter = hasBobCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_ROTTEN_HEAD) then
                hasBobCounter = hasBobCounter + 1
            end
            if player:HasTrinket(TrinketType.TRINKET_BOBS_BLADDER) then
                hasBobCounter = hasBobCounter + 1
            end
            if hasBobCounter > 2 then
                local currentActiveItem = player:GetActiveItem()
                local currentActiveCharge = player:GetActiveCharge()
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE, 1, false)
                end
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_IPECAC, 1, false)
                end
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_ROTTEN_HEAD) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_BOBS_ROTTEN_HEAD, 10, false)
                end
                player:AddCollectible(currentActiveItem, currentActiveCharge, false)
            else
                hasBobCounter = 0
            end
        end
        if ISR.Transformations.hasBob and not player:HasPlayerForm(PlayerForm.PLAYERFORM_BOB) then
            ISR.Transformations.hasBob = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_BOB) and not ISR.Transformations.hasBob and ISR.Config["doBob"] then
            ISR.Transformations.hasBob = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_BRAIN) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_BOBS_BRAIN, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_BOBS_CURSE, 1, false)
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_IPECAC) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_IPECAC, 1, false)
            end
            if not player:HasTrinket(TrinketType.TRINKET_BOBS_BLADDER) then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BOBS_BLADDER, player.Position, Vector(0,0), player)
            end
        end
        ---------------------------------
        -- The Seraphim Transformation --
        ---------------------------------
        if ISR.Transformations.hasSeraphim and not player:HasPlayerForm(PlayerForm.PLAYERFORM_ANGEL) then
            ISR.Transformations.hasSeraphim = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_ANGEL) and not ISR.Transformations.hasSeraphim and ISR.Config["doSeraphim"] then
            ISR.Transformations.hasSeraphim = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_SOUL) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_SOUL, 1, false)
            end
        end
        ---------------------------------
        -- The Beelzbub Transformation --
        ---------------------------------
        if ISR.Transformations.hasBeelzbub and not player:HasPlayerForm(PlayerForm.PLAYERFORM_LORD_OF_THE_FLIES) then
            ISR.Transformations.hasBeelzbub = false
        end
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_LORD_OF_THE_FLIES) and not ISR.Transformations.hasBeelzbub and ISR.Config["doBeelzbub"] then
            ISR.Transformations.hasBeelzbub = true
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_MULLIGAN) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_MULLIGAN, 1, false)
            end
            player:AddCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES, 1, false)
            player:AddCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES, 1, false)
        end
        --------------------------------
        -- The Magneto Transformation --
        --------------------------------
        if not ISR.Transformations.hasMagneto and ISR.Config["doMagneto"] then
            local hasMagnetoCounter = 0
            if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGNETO) then
                hasMagnetoCounter = hasMagnetoCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR) then
                hasMagnetoCounter = hasMagnetoCounter + 1
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_METAL_PLATE) then
                hasMagnetoCounter = hasMagnetoCounter + 1
            end
            if player:HasTrinket(TrinketType.TRINKET_SUPER_MAGNET) then
                hasMagnetoCounter = hasMagnetoCounter + 1
            end
            if player:HasTrinket(TrinketType.TRINKET_BROKEN_MAGNET) then
                hasMagnetoCounter = hasMagnetoCounter + 1
            end
            if hasMagnetoCounter > 1 then
                player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/magneto.anm2"))
                SFXManager():Play(SoundEffect.SOUND_POWERUP_SPEWER, 1.0, 0, false, 1.0)
                player:UsePill(PillEffect.PILLEFECT_MAGNETO, PillColor.PILL_NULL)
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_MAGNETO) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_MAGNETO, 1, false)
                end
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR, 1, false)
                end
                if not player:HasCollectible(CollectibleType.COLLECTIBLE_METAL_PLATE) then
                    player:AddCollectible(CollectibleType.COLLECTIBLE_METAL_PLATE, 1, false)
                end
                if not player:HasTrinket(TrinketType.TRINKET_SUPER_MAGNET) then
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_SUPER_MAGNET, player.Position, Vector(0,0), player)
                end
                ISR.Transformations.hasMagneto = true
            else
                hasMagnetoCounter = 0
            end
        end
        if not player:HasCollectible(CollectibleType.COLLECTIBLE_MAGNETO) and ISR.Transformations.hasMagneto then
            player:TryRemoveNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/magneto.anm2"))
            ISR.Transformations.hasMagneto = false
        end
        if ISR.Transformations.hasMagneto == true and ISR.Config["doMagneto"] then
            for _, entity in ipairs(Isaac.FindInRadius(player.Position, 40, EntityPartition.BULLET)) do
                if entity.SpawnerType ~= EntityType.ENTITY_PLAYER and entity:GetData().initMagneto == nil then
                    entity:GetData().initMagneto = 1
                    entity = entity:ToProjectile()
                    entity.Velocity = -entity.Velocity * 0.8
                    entity.Parent = player
                    entity.SpawnerEntity = player
                    entity:AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER | ProjectileFlags.ANY_HEIGHT_ENTITY_HIT | ProjectileFlags.HIT_ENEMIES)
                end
            end
        end
        ------------------------------
        -- Cain's Other Eye Synergy --
        ------------------------------
        if player:GetPlayerType() == PlayerType.PLAYER_CAIN and player:HasCollectible(CollectibleType.COLLECTIBLE_CAINS_OTHER_EYE) and ISR.Config["doCainsOtherEye"] then
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_20_20) then
                player:AddCollectible(CollectibleType.COLLECTIBLE_20_20, 0, false)
            end
        end
        --------------------------
        -- The Lost Holy Mantle --
        --------------------------
        if player:GetPlayerType() == PlayerType.PLAYER_THELOST and not player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE) and player:GetActiveCharge() == 0 and ISR.Config["doLostHolyMantle"] then
            player:AddCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE, 0, false)
        end
        if player:GetPlayerType() == PlayerType.PLAYER_THELOST and not player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE) and player:GetActiveItem() == 0 and ISR.Config["doLostHolyMantle"] then
            player:AddCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE, 0, false)
        end
        -------------------
        -- Tinted Ground --
        -------------------
        if ISR.TintedGround.checkForDigging and ISR.Config["doTintedGround"] then
            for _, bomb in ipairs(ISR.EntityList.Bombs) do
                if bomb.Position:Distance(Vector(ISR.TintedGround.MGX,ISR.TintedGround.MGY)) < 90 then
                    for i, key in ipairs(ISR.TintedGround.currentFloorMG) do
                        if key.RoomIndex == ISR.TintedGround.currentRoomMG then
                            for _, entity in ipairs(Isaac.FindByType(ISR.TintedGround.markedGround.Type, ISR.TintedGround.markedGround.Variant, ISR.TintedGround.markedGround.SubType0, false, false)) do
                                entity:Remove()
                            end
                            local dugGround = Isaac.Spawn(ISR.TintedGround.markedGround.Type, ISR.TintedGround.markedGround.Variant, ISR.TintedGround.markedGround.SubType1, Vector(ISR.TintedGround.MGX,ISR.TintedGround.MGY), Vector(0,0), ISR.TintedGround.markedGround.Spawner)
                            dugGround.CollisionDamage = 0
                            dugGround:ToEffect():SetTimeout(999999999)
                            local savedata = {
                                X = 0,
                                Y = 0,
                                RoomIndex = 0,
                            }
                            savedata.X = ISR.TintedGround.MGX
                            savedata.Y = ISR.TintedGround.MGY
                            savedata.RoomIndex = ISR.TintedGround.currentRoomMG
                            table.remove(ISR.TintedGround.currentFloorMG, i)
                            table.insert(ISR.TintedGround.currentFloorDG, savedata)
                            Isaac.GridSpawn(GridEntityType.GRID_STAIRS, 0, Vector(ISR.TintedGround.MGX,ISR.TintedGround.MGY), true)
                            ISR.TintedGround.hasDug = true
                            ISR.TintedGround.checkForDigging = false
                        end
                    end
                end
            end
        end
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_UPDATE, ISR.onUpdate)

-----------------
-- Troll Bombs --
-----------------
function ISR:onBombInit(bomb)
    if ISR.Config["doTrollTimer"] then
        if bomb.Variant == BombVariant.BOMB_TROLL or bomb.Variant == BombVariant.BOMB_SUPERTROLL then
            bomb:SetExplosionCountdown(60)
        end
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_BOMB_INIT, ISR.onBombInit)

--------------------------
-- The Lost Holy Mantle --
--------------------------
function ISR:lostHolyMantle()
    local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_D4)
    if player == nil then
        player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_D100)
    end
    if player == nil then
        player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_DINF)
    end
    if player:GetPlayerType() == PlayerType.PLAYER_THELOST and player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE) and ISR.Config["doLostHolyMantle"] then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE)
    end
end

ISR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, ISR.lostHolyMantle, CollectibleType.COLLECTIBLE_D4)
ISR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, ISR.lostHolyMantle, CollectibleType.COLLECTIBLE_D100)
ISR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, ISR.lostHolyMantle, CollectibleType.COLLECTIBLE_DINF)

function ISR:chestInit(chest)
    for playerNum = 1, Game:GetNumPlayers() do
        local player = Game:GetPlayer(playerNum - 1)
        --------------------
        -- The Right Hand --
        --------------------
        if player:HasTrinket(TrinketType.TRINKET_RIGHT_HAND) and ISR.Config["doRightHand"] then
            chest:Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_ETERNALCHEST, -1, true)
        end
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, ISR.chestInit, PickupVariant.PICKUP_CHEST)
ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, ISR.chestInit, PickupVariant.PICKUP_BOMBCHEST)
ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, ISR.chestInit, PickupVariant.PICKUP_SPIKEDCHEST)
ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, ISR.chestInit, PickupVariant.PICKUP_MIMICCHEST)
ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, ISR.chestInit, PickupVariant.PICKUP_LOCKEDCHEST)
ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, ISR.chestInit, PickupVariant.PICKUP_REDCHEST)

function ISR:onPill(pill)
    for playerNum = 1, Game:GetNumPlayers() do
        local player = Game:GetPlayer(playerNum - 1)
        local itemPool = Game:GetItemPool()
        if pill == PillEffect.PILLEFFECT_I_FOUND_PILLS and pill == itemPool:GetPillEffect(player:GetPill(0)) and ISR.Config["doFoundPills"] then
            local randomPill
            repeat
                randomPill = math.random(0, 46)
            until randomPill ~= 8
            player:UsePill(randomPill, PillColor.PILL_NULL)
        end
    end
end

ISR:AddCallback(ModCallbacks.MC_USE_PILL, ISR.onPill)

----------------------------
-- Replacing Modded Items --
----------------------------
function ISR:onMorph(_, variant, subtype)
    if variant == PickupVariant.PICKUP_TRINKET and subtype == TrinketType.TRINKET_FF_RIGHT_HAND and ISR.Config["doRightHand"] then
        return {PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_RIGHT_HAND}
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_PICKUP_SELECTION, ISR.onMorph)

-------------------
-- Tinted Ground --
-------------------
function ISR:onBombCrater(Effect)
    if ISR.TintedGround.checkForDigging and ISR.Config["doTintedGround"] then
        Effect:Remove()
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_EFFECT_INIT, ISR.onBombCrater, EffectVariant.BOMB_CRATER)

function ISR:onRoom()
    local roomindex = Game:GetLevel():GetCurrentRoomIndex()
    local room = Game:GetRoom()
    -------------------
    -- Tinted Ground --
    -------------------
    if ISR.Config["doTintedGround"] then
        if room:GetType() == RoomType.ROOM_DUNGEON and ISR.TintedGround.hasDug == true then
            if math.random(10) < 3 then
                for i=1, room:GetGridSize() do
                    local GridEntity = room:GetGridEntity(i)
                    if GridEntity and (i == 57) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)                  
                    elseif GridEntity and (i == 58) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    elseif GridEntity and (i == 59) then
                        GridEntity:SetType(GridEntityType.GRID_WALL)
                    elseif GridEntity and (i == 72) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    elseif GridEntity and (i == 73) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    elseif GridEntity and (i == 74) then
                        GridEntity:SetType(GridEntityType.GRID_WALL)
                    elseif GridEntity and (i == 102) then
                        GridEntity:SetType(GridEntityType.GRID_WALL)
                    elseif GridEntity and (i == 117) then
                        GridEntity:SetType(GridEntityType.GRID_WALL)
                    elseif GridEntity and (i == 88) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    elseif GridEntity and (i == 103) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    elseif GridEntity and (i == 118) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    elseif GridEntity and (i == 119) then
                        GridEntity:SetType(GridEntityType.GRID_GRAVITY)
                    end
                end
                if room:IsFirstVisit() then
                    Game:GetLevel():ChangeRoom(roomindex)
                end
            end
        end
        if room:IsFirstVisit() == false and roomindex == ISR.TintedGround.currentRoomMG then
            ISR.TintedGround.checkForDigging = false
            for _, key in ipairs(ISR.TintedGround.currentFloorMG) do
                if key.RoomIndex == roomindex then
                    ISR.TintedGround.checkForDigging = true
                    ISR.TintedGround.MGX = key.X
                    ISR.TintedGround.MGY = key.Y
                    local markedGround = Isaac.Spawn(ISR.TintedGround.markedGround.Type, ISR.TintedGround.markedGround.Variant, ISR.TintedGround.markedGround.SubType0, Vector(key.X,key.Y), Vector(0,0), ISR.TintedGround.markedGround.Spawner)
                    markedGround.CollisionDamage = 0
                    markedGround:ToEffect():SetTimeout(999999999)
                end
            end
            for _, key in ipairs(ISR.TintedGround.currentFloorDG) do
                if key.RoomIndex == roomindex then
                    ISR.TintedGround.MGX = key.X
                    ISR.TintedGround.MGY = key.Y
                    local markedGround = Isaac.Spawn(ISR.TintedGround.markedGround.Type, ISR.TintedGround.markedGround.Variant, ISR.TintedGround.markedGround.SubType1, Vector(key.X,key.Y), Vector(0,0), ISR.TintedGround.markedGround.Spawner)
                    markedGround.CollisionDamage = 0
                    markedGround:ToEffect():SetTimeout(999999999)
                end
            end
        end
        if room:IsFirstVisit() == true and roomindex == ISR.TintedGround.currentRoomMG then
            local posGrid
            repeat
                posGrid = room:GetClampedGridIndex(room:FindFreeTilePosition(Isaac.GetRandomPosition(), 750))
            until room:GetGridEntity(posGrid) == nil
            local clampedPos = room:GetClampedPosition(room:GetGridPosition(posGrid), 0)
            local markedGround = Isaac.Spawn(ISR.TintedGround.markedGround.Type, ISR.TintedGround.markedGround.Variant, ISR.TintedGround.markedGround.SubType0, clampedPos, Vector(0,0), ISR.TintedGround.markedGround.Spawner)
            markedGround.CollisionDamage = 0
            markedGround:ToEffect():SetTimeout(999999999)
            Isaac.GridSpawn(GridEntityType.GRID_DECORATION, 0, markedGround.Position, false)
            local savedata = {
                X = 0,
                Y = 0,
                RoomIndex = 0
            }
            ISR.TintedGround.MGX, savedata.X = clampedPos.X, clampedPos.X
            ISR.TintedGround.MGY, savedata.Y = clampedPos.Y, clampedPos.Y
            savedata.RoomIndex = roomindex
            table.insert(ISR.TintedGround.currentFloorMG, savedata)
            ISR.TintedGround.checkForDigging = true
        end
        if FindIn({RoomType.ROOM_BLACK_MARKET,RoomType.ROOM_DUNGEON},room:GetType()) or roomindex == Game:GetLevel():GetStartingRoomIndex() then
            ISR.TintedGround.checkForDigging = false
        end
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, ISR.onRoom)

-------------------
-- Tinted Ground --
-------------------
function ISR:onNewLevel()
    ISR.TintedGround.currentFloorMG = {}
    ISR.TintedGround.currentFloorDG = {}
    ISR.TintedGround.currentRoomMG = 0
    ISR.TintedGround.hasDug = false
    if ISR.Config["doTintedGround"] then
        repeat
        ISR.TintedGround.currentRoomMG = Game:GetLevel():GetRandomRoomIndex(false, math.random(10000))
        if Game:GetLevel():GetStage() == LevelStage.STAGE7_GREED and Game:GetLevel():GetStageType() == StageType.STAGETYPE_GREEDMODE then
            ISR.TintedGround.currentRoomMG = nil
            return
        end
        until ISR.TintedGround.currentRoomMG ~= Game:GetLevel():GetStartingRoomIndex() and not FindIn({RoomType.ROOM_BLACK_MARKET,RoomType.ROOM_DUNGEON,RoomType.ROOM_ANGEL,RoomType.ROOM_DEVIL,RoomType.ROOM_BOSS,RoomType.ROOM_ERROR,RoomType.ROOM_DICE},(Game:GetLevel():GetRoomByIdx(ISR.TintedGround.currentRoomMG)).Data.Type)
    end
end

ISR:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, ISR.onNewLevel)

function FindIn(tInput, Value)
    for i in ipairs(tInput) do
        if Value == tInput[i] then 
            return true
        end
    end
    return false
end

-------------------------------------
-- Credit to Piber20 & Agent Cucco --
-------------------------------------
function GetPlayerUsingActive(itemID)
    for p = 0, Game:GetNumPlayers() - 1 do
        local player = Isaac.GetPlayer(p)
        local ActiveCheck = (itemID and (player:GetActiveItem() == itemID or player:GetActiveItem() == CollectibleType.COLLECTIBLE_VOID) or true)
        if ActiveCheck and (Input.IsActionTriggered(ButtonAction.ACTION_ITEM, player.ControllerIndex) or Input.IsActionTriggered(ButtonAction.ACTION_PILLCARD, player.ControllerIndex)) then
            return player
        end
    end
    return nil
end