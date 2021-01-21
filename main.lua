--------------------------------------------------------------------------------------------------
-- Items Reforged by Kalightortaio, Krishna Kokatay, 2020. http://www.kalightortaio.com         --
-- A huge thank you to Lytebringr, Wofsauge, and the #modding-dev community in the TBOI Discord --
--------------------------------------------------------------------------------------------------
IR = RegisterMod("Items Reforged", 1)
local json = require("json")
require("ir_config")
IR.Config = IR.DefaultConfig
IR.Config.Version = "1.9.1"
IR.GameState = {}
IR.EntityList = {
    Tears = {},
    Enemies = {},
    Familiars = {},
    Pickups = {}
}
IR.BonusLuck = 0
IR.BreathCooldown = 0
IR.ActiveItemRoom = 0
IR.ActiveItemTimer = 0
IR.ActiveItemLimit = false
IR.hasPeeper = false
IR.Timer = 0
IR.coinsOnProc = 0
IR.savedLuck = 0
IR.glasscannon = {
    doGCBatterySound = false,
    hasCooldown = false,
    bonehealth = 0,
    redhealth = 0,
    bluehealth = 0,
    blackhealth = 0
}
IR.dataminer = {
    DMroom = 0,
    usedDM = false,
    hasModem = false,
    hadModem = false
}
IR.hallowedground = {
    Item = Isaac.GetItemIdByName(" Hallowed Ground "),
    hasHallow = false
}
IR.monstermanual = {
    Item = Isaac.GetItemIdByName(" Monster Manual "),
    fVariant = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 20, 21, 22, 23, 24, 25, 30, 31, 32, 33, 35, 40, 42, 43, 44, 45, 46, 47, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130},
    fList = {},
    fNum = 0,
    fRoll = nil,
    MMholywater = false,
    famRNG = RNG()
}
IR.planc = {
    usedPlanC = false,
    deathDelay = 50
}
IR.fastbombs = {
    hasEpicFetus = false,
    hasDrFetus = false
}
IR.kingbaby = {
    proccessFamiliars = false,
    orbitOne = 22,
    orbitSpeed = 0.01,
    orbitVelocity = 6,
    orbitLayerOne = 1268,
    orbitLayerTwo = 1269,
    orbitDistanceOne = Vector(87.0, 87.0),
    orbitDistanceTwo = Vector(130.0, 130.0)
}
IR.yumheart = {
    Soul = Isaac.GetItemIdByName(" Yum Heart "),
    Black = Isaac.GetItemIdByName("  Yum Heart  "),
    Eternal = Isaac.GetItemIdByName("   Yum Heart   "),
    OneUp = Isaac.GetItemIdByName("    Yum Heart    "),
}
IR.DeadSeaScrolls = {CollectibleType.COLLECTIBLE_BOOK_REVELATIONS,CollectibleType.COLLECTIBLE_BOOK_OF_SECRETS,CollectibleType.COLLECTIBLE_PRAYER_CARD,CollectibleType.COLLECTIBLE_SHOOP_DA_WHOOP,CollectibleType.COLLECTIBLE_EDENS_SOUL,CollectibleType.COLLECTIBLE_BOOK_OF_SHADOWS,CollectibleType.COLLECTIBLE_BLUE_BOX,CollectibleType.COLLECTIBLE_MY_LITTLE_UNICORN,CollectibleType.COLLECTIBLE_DADS_KEY,CollectibleType.COLLECTIBLE_PONY,CollectibleType.COLLECTIBLE_WAIT_WHAT,CollectibleType.COLLECTIBLE_CRYSTAL_BALL,CollectibleType.COLLECTIBLE_DECK_OF_CARDS,CollectibleType.COLLECTIBLE_FORGET_ME_NOW,CollectibleType.COLLECTIBLE_BOBS_ROTTEN_HEAD,CollectibleType.COLLECTIBLE_TAMMYS_HEAD,CollectibleType.COLLECTIBLE_GUPPYS_HEAD,CollectibleType.COLLECTIBLE_HEAD_OF_KRAMPUS,CollectibleType.COLLECTIBLE_FLUSH,CollectibleType.COLLECTIBLE_BOX_OF_SPIDERS,CollectibleType.COLLECTIBLE_HOW_TO_JUMP,CollectibleType.COLLECTIBLE_BLANK_CARD,CollectibleType.COLLECTIBLE_BUTTER_BEAN,CollectibleType.COLLECTIBLE_KIDNEY_BEAN,CollectibleType.COLLECTIBLE_MEGA_BEAN,CollectibleType.COLLECTIBLE_BEAN,CollectibleType.COLLECTIBLE_MOMS_BOTTLE_PILLS,CollectibleType.COLLECTIBLE_MOMS_BRA,CollectibleType.COLLECTIBLE_MOMS_PAD,CollectibleType.COLLECTIBLE_GUPPYS_PAW,CollectibleType.COLLECTIBLE_ISAACS_TEARS,CollectibleType.COLLECTIBLE_LEMON_MISHAP,IR.monstermanual.Item,CollectibleType.COLLECTIBLE_DATAMINER,CollectibleType.COLLECTIBLE_PORTABLE_SLOT,CollectibleType.COLLECTIBLE_SPIDER_BUTT,CollectibleType.COLLECTIBLE_SATANIC_BIBLE,CollectibleType.COLLECTIBLE_BIBLE,CollectibleType.COLLECTIBLE_BOOMERANG,IR.hallowedground.Item,CollectibleType.COLLECTIBLE_SMELTER,CollectibleType.COLLECTIBLE_PAUSE,CollectibleType.COLLECTIBLE_CROOKED_PENNY,CollectibleType.COLLECTIBLE_DULL_RAZOR,CollectibleType.COLLECTIBLE_METRONOME,CollectibleType.COLLECTIBLE_BROWN_NUGGET,CollectibleType.COLLECTIBLE_SPRINKLER,CollectibleType.COLLECTIBLE_MYSTERY_GIFT,CollectibleType.COLLECTIBLE_TELEKINESIS,CollectibleType.COLLECTIBLE_BLOOD_RIGHTS,CollectibleType.COLLECTIBLE_RAZOR_BLADE,CollectibleType.COLLECTIBLE_IV_BAG,CollectibleType.COLLECTIBLE_DEAD_SEA_SCROLLS,CollectibleType.COLLECTIBLE_KAMIKAZE,CollectibleType.COLLECTIBLE_POOP,CollectibleType.COLLECTIBLE_TELEPORT,CollectibleType.COLLECTIBLE_GAMEKID,CollectibleType.COLLECTIBLE_BOOK_OF_SIN,CollectibleType.COLLECTIBLE_D6,CollectibleType.COLLECTIBLE_D12,CollectibleType.COLLECTIBLE_D8,CollectibleType.COLLECTIBLE_D10,CollectibleType.COLLECTIBLE_D100,CollectibleType.COLLECTIBLE_DOCTORS_REMOTE,CollectibleType.COLLECTIBLE_MR_BOOM,CollectibleType.COLLECTIBLE_NOTCHED_AXE,CollectibleType.COLLECTIBLE_WOODEN_NICKEL,CollectibleType.COLLECTIBLE_BOX_OF_FRIENDS,CollectibleType.COLLECTIBLE_THE_NAIL,CollectibleType.COLLECTIBLE_ANARCHIST_COOKBOOK,CollectibleType.COLLECTIBLE_WE_NEED_GO_DEEPER,CollectibleType.COLLECTIBLE_PINKING_SHEARS,CollectibleType.COLLECTIBLE_MONSTROS_TOOTH,CollectibleType.COLLECTIBLE_RED_CANDLE,CollectibleType.COLLECTIBLE_CANDLE,CollectibleType.COLLECTIBLE_BEST_FRIEND,CollectibleType.COLLECTIBLE_WHITE_PONY,CollectibleType.COLLECTIBLE_YUM_HEART,CollectibleType.COLLECTIBLE_FRIEND_BALL,CollectibleType.COLLECTIBLE_VOID,CollectibleType.COLLECTIBLE_D1,CollectibleType.COLLECTIBLE_MAMA_MEGA,CollectibleType.COLLECTIBLE_MEGA_SATANS_BREATH,CollectibleType.COLLECTIBLE_MINE_CRAFTER,CollectibleType.COLLECTIBLE_MOMS_BOX,CollectibleType.COLLECTIBLE_D7,CollectibleType.COLLECTIBLE_BLACK_HOLE,CollectibleType.COLLECTIBLE_SHARP_STRAW,CollectibleType.COLLECTIBLE_MR_ME,CollectibleType.COLLECTIBLE_TELEPORT_2,CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS,CollectibleType.COLLECTIBLE_HOURGLASS,CollectibleType.COLLECTIBLE_GLASS_CANNON,CollectibleType.COLLECTIBLE_UNICORN_STUMP,CollectibleType.COLLECTIBLE_CONVERTER,CollectibleType.COLLECTIBLE_SCISSORS,CollectibleType.COLLECTIBLE_BOOK_OF_BELIAL,CollectibleType.COLLECTIBLE_NECRONOMICON,CollectibleType.COLLECTIBLE_BOOK_OF_THE_DEAD,CollectibleType.COLLECTIBLE_UNDEFINED,CollectibleType.COLLECTIBLE_DIPLOPIA,CollectibleType.COLLECTIBLE_DELIRIOUS,CollectibleType.COLLECTIBLE_POTATO_PEELER,CollectibleType.COLLECTIBLE_PLAN_C,CollectibleType.COLLECTIBLE_MAGIC_FINGERS,CollectibleType.COLLECTIBLE_D4,CollectibleType.COLLECTIBLE_PLACEBO,CollectibleType.COLLECTIBLE_SACRIFICIAL_ALTAR}
require("ir_config_menu")
Isaac.ConsoleOutput("Items Reforged v" .. IR.Config.Version .. ": Next update... External Item Descriptions!\n")

--------------------------------
-- External Item Descriptions --
--------------------------------
if EID then
    EID:addCollectible(IR.monstermanual.Item, "Random familiar for current floor")
    EID:addCollectible(IR.hallowedground.Item, "Spawns one white poop#(White poop has a ↑ Tears up aura and can block damage)")
    EID:addCollectible(CollectibleType.COLLECTIBLE_MONSTER_MANUAL, "Random familiar for current floor")
    EID:addCollectible(CollectibleType.COLLECTIBLE_HALLOWED_GROUND, "Spawns one white poop#(White poop has a ↑ Tears up aura and can block damage)")
    EID:addCollectible(CollectibleType.COLLECTIBLE_DADS_LOST_COIN, "↑ +"..IR.Config["DadsLostCoinLuck"].." Luck up for every coin you have")
    EID:addCollectible(CollectibleType.COLLECTIBLE_BREATH_OF_LIFE, "Shoot angelic lasers at all 4 angles")
    EID:addCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER, "↑ +10% Damage Multiplier#Piercing Tears#Tears leave creep#Leaves pool of creep when you get hit")
end

-------------------
-- Load Mod Data --
-------------------
function IR:onStart()
    if IR:HasData() then
        IR.GameState = json.decode(IR:LoadData())
        if IR.GameState.fList == nil then
            IR.GameState.fList = {}
        else
            IR.monstermanual.fList = IR.GameState.fList
        end
        if IR.GameState.hasEpicFetus == nil then
            IR.GameState.hasEpicFetus = false
        else
            IR.fastbombs.hasEpicFetus = IR.GameState.hasEpicFetus
        end
        if IR.GameState.hasDrFetus == nil then
            IR.GameState.hasDrFetus = false
        else
            IR.fastbombs.hasDrFetus = IR.GameState.hasDrFetus
        end
        if IR.GameState.hasHallow == nil then
            IR.GameState.hasHallow = false
        else
            IR.hallowedground.hasHallow = IR.GameState.hasHallow
        end
        if IR.GameState.Timer == nil then
            IR.GameState.Timer = false
        else
            IR.Timer = IR.GameState.Timer
        end
        if IR.GameState.coinsOnProc == nil then
            IR.GameState.coinsOnProc = false
        else
            IR.coinsOnProc = IR.GameState.coinsOnProc
        end
        if IR.MCMLoaded then
            local savedIRConfig = IR.GameState.Config
            if savedIRConfig.Version == IR.Config.Version then
                for key, value in pairs(IR.Config) do
                    IR.Config[key] = savedIRConfig[key]
                end
            elseif savedIRConfig.Version ~= nil and savedIRConfig.Version ~= IR.Config.Version then
                for key, value in pairs(IR.Config) do
                    if savedIRConfig[key] ~= nil then
                        IR.Config[key] = savedIRConfig[key]
                    end
                end
                IR.Config.Version = "1.9.1"
            end
        end
    end
end

IR:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, IR.onStart)

--------------------
-- Save Mod Data  --
--------------------
function IR:onExit()
    IR.GameState.fList = IR.monstermanual.fList
    IR.GameState.hasEpicFetus = IR.fastbombs.hasEpicFetus
    IR.GameState.hasDrFetus = IR.fastbombs.hasDrFetus
    IR.GameState.hasHallow = IR.hallowedground.hasHallow
    IR.GameState.coinsOnProc = IR.coinsOnProc
    IR.GameState.Timer = IR.Timer
    IR.GameState.Config = IR.Config
    IR.Timer = 0
    IR:SaveData(json.encode(IR.GameState))
end

IR:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, IR.onExit)
IR:AddCallback(ModCallbacks.MC_POST_GAME_END, IR.onExit)

function IR:onUpdate()
    --------------------
    -- Initialization --
    --------------------
    if Game():GetFrameCount() == 1 then
        for playerNum = 1, Game():GetNumPlayers() do
            local player = Game():GetPlayer(playerNum - 1)
            IR.Timer = 0
            IR.savedLuck = 0
            IR.coinsOnProc = 0
            IR.HasDadsLostCoin = false
            IR.fastbombs.hasEpicFetus = false
            IR.fastbombs.hasDrFetus = false
            IR.hallowedground.hasHallow = false
            IR.monstermanual.fList = {}
            IR.monstermanual.famRNG:SetSeed(math.random(10000), math.random(10000))
            player:AddCacheFlags(CacheFlag.CACHE_FAMILIARS) 
            player:EvaluateItems()
        end
    end
    IR.EntityList.Tears = Isaac.FindByType(EntityType.ENTITY_TEAR, -1, -1, false, false)
    IR.EntityList.Enemies = Isaac.FindInRadius(Vector(640, 560), 1050, EntityPartition.ENEMY)
    IR.EntityList.Familiars = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, -1, -1, false, false)
    IR.EntityList.Pickups = Isaac.FindByType(EntityType.ENTITY_PICKUP, -1, -1, false, false)
    IR.Timer = IR.Timer + 1
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        if not player:GetActiveItem() == CollectibleType.COLLECTIBLE_BEAN or not player:GetActiveItem() == CollectibleType.COLLECTIBLE_KIDNEY_BEAN or not player:GetActiveItem() == CollectibleType.COLLECTIBLE_MEGA_BEAN then
            IR.ActiveItemTimer = 0
        end
        ---------------------
        -- Dad's Lost Coin --
        ---------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_DADS_LOST_COIN) and IR.Config["doDadsLostCoin"] then
            local numCoins = player:GetNumCoins()
            if not IR.HasDadsLostCoin then
                IR.HasDadsLostCoin = true
                player.Luck = player.Luck + (numCoins * IR.Config["DadsLostCoinLuck"]) + 0.1
                IR.BonusLuck = player.Luck
                balCoins = numCoins
            end
            if IR.HasDadsLostCoin and math.floor(player.Luck + 0.5) < math.floor(IR.BonusLuck + 0.5) then
                IR.BonusLuck = IR.BonusLuck + (player.Luck - (IR.BonusLuck - (numCoins * IR.Config["DadsLostCoinLuck"])))
                player.Luck = IR.BonusLuck
            end
            if IR.HasDadsLostCoin and numCoins > balCoins then
                player.Luck = player.Luck + ((numCoins - balCoins) * IR.Config["DadsLostCoinLuck"])
                IR.BonusLuck = player.Luck
                balCoins = numCoins
            end
            if IR.HasDadsLostCoin and balCoins > numCoins then
                player.Luck = player.Luck - ((balCoins - numCoins) * IR.Config["DadsLostCoinLuck"])
                IR.BonusLuck = player.Luck
                balCoins = numCoins
            end
            for i, entity in ipairs(IR.EntityList.Pickups) do
                if entity.Variant == PickupVariant.PICKUP_COIN and entity.SubType == CoinSubType.COIN_LUCKYPENNY then
                    local coinPos = entity.Position
                    local coinVel = entity.Velocity
                    entity:Remove()
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_DOUBLEPACK, coinPos, coinVel, nil)
                end
            end
        end
        --------------------
        -- Breath of Life --
        --------------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_BREATH_OF_LIFE and IR.Config["doBreathOfLife"] then
            if IR.BreathCooldown > 0 then
                IR.BreathCooldown = IR.BreathCooldown - 1
            end
            local BreathDelay = BreathDelay or 1000
            BreathDelay = math.min(BreathDelay,player.FireDelay)
            if player:GetActiveCharge() < 6 then
                player.FireDelay = player.MaxFireDelay
            else
                player.FireDelay = BreathDelay
            end
            if player:GetActiveCharge() == 0 and IR.BreathCooldown == 0 then
                for Angle = 45, 315, 90 do
                    local HolyLaser = EntityLaser.ShootAngle(5, player.Position, Angle, 15, Vector(0,0), player)
                    HolyLaser.TearFlags = player.TearFlags
                    HolyLaser.CollisionDamage = math.max((player.Damage * 2),38.46159)
                end
                IR.BreathCooldown = 30
            end
        end
        ----------------
        -- Holy Water --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER) or IR.monstermanual.MMholywater == true and IR.Config["doHolyWater"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_PLAYER then
                    local data = entity:GetData()
                    local tear = entity:ToTear()
                    if data.initPool == nil then
                        tear.CollisionDamage = (player.Damage * 1.1)
                        data.initPool = 1
                    end
                    if (tear.Height >= -5 or tear:CollidesWithGrid()) and data.initPool == 1 then
                        data.Pool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_HOLYWATER_TRAIL, 0, tear.Position, Vector(0,0), player):ToEffect()
                        data.Pool.CollisionDamage = player.Damage / 4
                        data.Pool:SetColor(Color(0.5,0.5,0,0,0,0,0),0,0,false,false)
                        data.Pool.Scale = 2
                    end
                end
            end
        end
        ----------
        -- Abel --
        ----------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_ABEL) and IR.Config["doAbel"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.ABEL and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.Scale = 1.1
                    tear.TearFlags = TearFlags.TEAR_LUDOVICO
                    tear.CollisionDamage = 0.8
                end
            end
        end
        -------------------
        -- Brother Bobby --
        -------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BROTHER_BOBBY) and IR.Config["doBrotherBobby"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.BROTHER_BOBBY and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.Scale = 1.1
                    tear.CollisionDamage = math.max((player.Damage/3),3.5)
                end
            end
        end
        ------------------
        -- Sister Maggy --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_SISTER_MAGGY) and IR.Config["doSisterMaggy"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.SISTER_MAGGY and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.Scale = 1.1
                    tear.CollisionDamage = math.max((player.Damage/2),5)
                end
            end
        end
        ------------------
        -- Rainbow Baby --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_RAINBOW_BABY) and IR.Config["doRainbowBaby"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.RAINBOW_BABY and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.CollisionDamage = (math.random(math.ceil(player.Damage))^1.4)
                end
            end
        end
        ------------------
        -- Glass Cannon --
        ------------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_GLASS_CANNON and IR.Config["doGlassCannon"] then
            local CannonDelay = CannonDelay or 1000
            CannonDelay = math.min(CannonDelay,player.FireDelay)
            if player:GetActiveCharge() < 80 then
                player.FireDelay = player.MaxFireDelay
                IR.glasscannon.doGCBatterySound = true
                if player:GetActiveCharge() == 0 and IR.glasscannon.hasCooldown == false then
                    IR.glasscannon.redhealth = IR.glasscannon.redhealth or 0
                    IR.glasscannon.bluehealth = IR.glasscannon.bluehealth or 0
                    IR.glasscannon.blackhealth = IR.glasscannon.blackhealth or 0
                    IR.glasscannon.bonehealth = IR.glasscannon.bonehealth or 0
                    player:AddMaxHearts(-IR.glasscannon.redhealth)
                    player:AddSoulHearts(-IR.glasscannon.bluehealth)
                    player:AddBlackHearts(-IR.glasscannon.blackhealth)
                    player:AddBoneHearts(-IR.glasscannon.bonehealth)
                    player:AddBoneHearts(math.floor(IR.glasscannon.redhealth/2 + 0.5) + math.floor(IR.glasscannon.bluehealth/2 + 0.5) + math.floor(IR.glasscannon.blackhealth/2 + 0.5) + IR.glasscannon.bonehealth)
                    IR.glasscannon.hasCooldown = true
                end
            elseif player:GetActiveCharge() == 80 then
                player.FireDelay = CannonDelay
                if IR.glasscannon.doGCBatterySound == true then
                    SFXManager():Play(SoundEffect.SOUND_BATTERYCHARGE, 1.0, 0, false, 1.0)
                    IR.glasscannon.doGCBatterySound = false
                end
                IR.glasscannon.bonehealth = (player:GetBoneHearts())
                IR.glasscannon.redhealth = player:GetMaxHearts()
                IR.glasscannon.bluehealth = player:GetSoulHearts()
                IR.glasscannon.blackhealth = player:GetBlackHearts()
                IR.glasscannon.hasCooldown = false
            end
        end
        -------------------
        -- Isaac's Heart --
        -------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_ISAACS_HEART) and IR.Config["doIsaacsHeart"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_PLAYER then
                    local data = entity:GetData()
                    local tear = entity:ToTear()
                    if data.initHeart == nil then
                        if math.random(10) < (IR.Config["IsaacsHeartChance"] + 1) then
                            tear.TearFlags = player.TearFlags | TearFlags.TEAR_HP_DROP
                        end
                        entity:SetColor(Color(1.0,0.0,0.0,1.0,0,0,0),0,0,false,false)
                        data.initHeart = 1
                    end
                end
            end
        end
        ----------------------------
        -- Dataminer (20% chance) --
        ----------------------------
        if IR.dataminer.DMroom == Game():GetLevel():GetCurrentRoomIndex() and IR.dataminer.usedDM == true and IR.Config["doDataminer"] then
            if player:HasCollectible(CollectibleType.COLLECTIBLE_BROKEN_MODEM) and IR.dataminer.hasModem == false then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_ERROR, player.Position, Vector(0,0), nil)
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_BROKEN_MODEM)
                IR.dataminer.hasModem = true
                IR.dataminer.hadModem = true
            end
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_BROKEN_MODEM) and IR.dataminer.hasModem == false then
                player:AddCollectible(CollectibleType.COLLECTIBLE_BROKEN_MODEM, 0, false)
                IR.dataminer.hasModem = true
            end
        else
            if IR.dataminer.hadModem == false and IR.dataminer.usedDM == true and IR.Config["doDataminer"] then
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_BROKEN_MODEM)
                IR.dataminer.usedDM = false
            end
        end
        ----------------
        -- Cursed Eye --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_CURSED_EYE) and IR.Config["doCursedEye"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_PLAYER then
                    local data = entity:GetData()
                    local tear = entity:ToTear()
                    if data.initCursedEye == nil then
                        if math.random(10) < (IR.Config["CursedEyeChance"] + 1) then
                            tear.TearFlags = player.TearFlags | TearFlags.TEAR_PERMANENT_CONFUSION
                            entity:SetColor(Color(0.0,0.0,0.0,1.0,0,0,0),0,0,false,false)
                        end
                        data.initCursedEye = 1
                    end
                end
            end
        end
        -----------------------------------------
        -- Hallowed Ground (on initial pickup) --
        -----------------------------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HALLOWED_GROUND) and IR.Config["doHallowedGround"] then
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_HALLOWED_GROUND)
            if player:GetActiveItem() == 0 then
                player:AddCollectible(IR.hallowedground.Item, 1, false)
            else
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, IR.hallowedground.Item, Isaac.GetFreeNearPosition(player.Position, 20), Vector(0,0), nil)
            end
        end
        if player:GetActiveItem() == IR.hallowedground.Item and not IR.hallowedground.hasHallow and IR.Config["doHallowedGround"] then
            player:RemoveCollectible(IR.hallowedground.Item)
            player:AddCollectible(IR.hallowedground.Item, 1, false)
            IR.hallowedground.hasHallow = true
        end
        -----------------
        -- God's Flesh --
        -----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_GODS_FLESH) and IR.Config["doGodsFlesh"] then
            for _, entity in pairs(Isaac.FindInRadius(player.Position, 30, EntityPartition.ENEMY)) do
                if entity:IsVulnerableEnemy() and entity:HasEntityFlags(EntityFlag.FLAG_SHRINK) then
                    SFXManager():Play(SoundEffect.SOUND_DEATH_BURST_SMALL, 1.0, 0, false, 1.0)
                    entity:Remove()
                end
            end
        end
        --------------------
        -- Monster Manual --
        --------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MONSTER_MANUAL) and IR.Config["doMonsterManual"] then
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_MONSTER_MANUAL)
            player:AddCollectible(IR.monstermanual.Item, 3, false)
        end
        --------------
        -- Best Bud --
        --------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BEST_BUD) and IR.Config["doBestBud"] then
            for _, entity in pairs(Isaac.FindInRadius(player.Position, 200, EntityPartition.FAMILIAR)) do
                if entity.Variant == FamiliarVariant.BEST_BUD then
                    local bestbud = entity
                    for _, entity in pairs(Isaac.FindInRadius(bestbud.Position, 15, EntityPartition.BULLET)) do
                        SFXManager():Play(SoundEffect.SOUND_TEARIMPACTS, 1.0, 0, false, 1.0)
                        entity:Kill()
                    end
                end
            end
        end
        -----------------
        -- Tiny Planet --
        -----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_TINY_PLANET) and IR.Config["doTinyPlanet"] then
            for i, entity in ipairs(IR.EntityList.Tears) do
                local data = entity:GetData()
                local tear = entity:ToTear()
                if entity.SpawnerType == EntityType.ENTITY_PLAYER and entity.FrameCount < 2 and data.initPlanet == nil then
                    tear.Position = Vector(player.Position.X + math.cos(0.15 * player.FrameCount) * math.random(60,120), player.Position.Y + math.sin(0.15 * player.FrameCount) * math.random(60,120))
                    tear.FallingSpeed = 0
                    tear.FallingAcceleration = -0.1
                    data.initPlanet = 1
                end
                if data.initPlanet ~= nil and entity.FrameCount > 150 then
                    tear.FallingAcceleration = 0.1
                end
            end
        end
        -----------------
        -- Kidney Bean --
        -----------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_KIDNEY_BEAN and player:GetActiveCharge() < 4 and IR.ActiveItemTimer == 0 then
            player:SetActiveCharge(player:GetActiveCharge() + 1)
            SFXManager():Stop(SoundEffect.SOUND_BEEP, 1.0, 0, false, 1.0)
            IR.ActiveItemTimer = 90
        elseif IR.ActiveItemTimer > 0 then
            IR.ActiveItemTimer = IR.ActiveItemTimer - 1
        end
        --------------
        -- The Bean --
        --------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_BEAN and player:GetActiveCharge() < 4 and IR.ActiveItemTimer == 0 then
            player:SetActiveCharge(player:GetActiveCharge() + 1)
            SFXManager():Stop(SoundEffect.SOUND_BEEP, 1.0, 0, false, 1.0)
            IR.ActiveItemTimer = 90
        elseif IR.ActiveItemTimer > 0 then
            IR.ActiveItemTimer = IR.ActiveItemTimer - 1
        end
        ---------------
        -- Mega Bean --
        ---------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_MEGA_BEAN and player:GetActiveCharge() < 8 and IR.ActiveItemTimer == 0 then
            player:SetActiveCharge(player:GetActiveCharge() + 1)
            SFXManager():Stop(SoundEffect.SOUND_BEEP, 1.0, 0, false, 1.0)
            IR.ActiveItemTimer = 180
        elseif IR.ActiveItemTimer > 0 then
            IR.ActiveItemTimer = IR.ActiveItemTimer - 1
        end
        ---------------
        -- Hourglass --
        ---------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_HOURGLASS and IR.ActiveItemRoom == Game():GetLevel():GetCurrentRoomIndex() and Game():GetLevel():GetCurrentRoomDesc().Clear == false and IR.Config["doHourglass"] then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() == true and entity:IsBoss() == false then
                    if entity:HasEntityFlags(EntityFlag.FLAG_SLOW) == false and IR.ActiveItemTimer > 0 then
                        entity:AddEntityFlags(EntityFlag.FLAG_SLOW)
                        IR.ActiveItemTimer = IR.ActiveItemTimer - 1
                    elseif IR.ActiveItemTimer == 0 then
                        IR.ActiveItemLimit = true
                        entity:ClearEntityFlags(EntityFlag.FLAG_SLOW)
                    end
                end
            end
        end
        ---------------
        -- Mom's Pad --
        ---------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_MOMS_PAD and IR.ActiveItemRoom == Game():GetLevel():GetCurrentRoomIndex() and Game():GetLevel():GetCurrentRoomDesc().Clear == false and IR.Config["doMomsPad"] and not IR.ActiveItemLimit then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() == true and entity:IsBoss() == false then
                    if entity:HasEntityFlags(EntityFlag.FLAG_FEAR) == false and IR.ActiveItemTimer > 0 then
                        entity:AddEntityFlags(EntityFlag.FLAG_FEAR)
                        IR.ActiveItemTimer = IR.ActiveItemTimer - 1
                    elseif IR.ActiveItemTimer == 0 then
                        IR.ActiveItemLimit = true
                        entity:ClearEntityFlags(EntityFlag.FLAG_FEAR)
                    end
                end
            end
        end
        ---------------
        -- Mom's Bra --
        ---------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_MOMS_BRA and IR.ActiveItemRoom == Game():GetLevel():GetCurrentRoomIndex() and Game():GetLevel():GetCurrentRoomDesc().Clear == false and IR.Config["doMomsBra"] and not IR.ActiveItemLimit then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() == true and entity:IsBoss() == false then
                    if entity:HasEntityFlags(EntityFlag.FLAG_FREEZE) == false and IR.ActiveItemTimer > 0 then
                        entity:AddEntityFlags(EntityFlag.FLAG_SLOW)
                        IR.ActiveItemTimer = IR.ActiveItemTimer - 1
                    elseif IR.ActiveItemTimer == 0 then
                        IR.ActiveItemLimit = true
                        entity:ClearEntityFlags(EntityFlag.FLAG_SLOW)
                    end
                end
            end
        end
        --------------
        -- Scissors --
        --------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_SCISSORS and IR.Config["doScissors"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.SCISSORS and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.Scale = 1.1
                    tear.CollisionDamage = player.Damage
                    tear.TearFlags = player.TearFlags
                end
            end
        end
        -----------------------
        -- Strange Attractor --
        -----------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR) and player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) == false and player:HasCollectible(CollectibleType.COLLECTIBLE_ANTI_GRAVITY) == false and IR.Config["doStrangeAttactor"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                local data = entity:GetData()
                local tear = entity:ToTear()
                if entity.SpawnerType == EntityType.ENTITY_PLAYER and entity.FrameCount < 1 and data.initStrange == nil then
                    tear.TearFlags = ((player.TearFlags % ((TearFlags.TEAR_ATTRACTOR) + (TearFlags.TEAR_ATTRACTOR)) >= (TearFlags.TEAR_ATTRACTOR)) and player.TearFlags - (TearFlags.TEAR_ATTRACTOR) or player.TearFlags)
                    data.initStrange = 1
                elseif entity.SpawnerType == EntityType.ENTITY_PLAYER and entity.FrameCount > IR.Config["StrangeAttractorDist"] and data.initStrange ~= nil then
                    tear.TearFlags = player.TearFlags | TearFlags.TEAR_ATTRACTOR
                end
            end
        end
        ------------
        -- Plan C --
        ------------
        if IR.planc.usedPlanC == true and player:IsDead() and IR.Config["doPlanC"] then
            IR.planc.deathDelay = IR.planc.deathDelay - 1
            if IR.planc.deathDelay == -2 then
                local attempt = 0
                local playername = player:GetName()
                local continue = true
                while continue do
                    player:AddCollectible(1, 0, false) 
                    player:UseActiveItem(CollectibleType.COLLECTIBLE_CLICKER, false, false, true, false)
                    attempt = attempt + 1
                    if player:GetPlayerType() == 4 then
                        continue = false
                    end
                    if attempt >= 150 and player:GetName() == playername then
                        continue = false
                    end
                end
                if attempt >= 150 then 
                    player:Kill()
                else
                    player:Revive()
                    player:AddMaxHearts(-player:GetMaxHearts())
                    player:AddSoulHearts(-player:GetSoulHearts())
                    player:AddBlackHearts(-player:GetBlackHearts())
                    player:AddBoneHearts(-player:GetBoneHearts())
                    player:AddSoulHearts(6)
                    Game():GetLevel().EnterDoor = -1
                    Game():GetLevel().LeaveDoor = -1
                    Game():ChangeRoom(84)
                end
                IR.planc.deathDelay = 50
                IR.planc.usedPlanC = false
            end
        end
        ----------------
        -- Fast Bombs --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_FAST_BOMBS) and player:HasCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS) and not IR.fastbombs.hasEpicFetus and IR.Config["doFastBombs"] then
            player:AddCollectible(CollectibleType.COLLECTIBLE_MARKED, 0, false)
            IR.fastbombs.hasEpicFetus = true
        end
        if player:HasCollectible(CollectibleType.COLLECTIBLE_FAST_BOMBS) and player:HasCollectible(CollectibleType.COLLECTIBLE_DR_FETUS) and not IR.fastbombs.hasDrFetus and IR.Config["doFastBombs"] then
            player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
            player:EvaluateItems()
            IR.fastbombs.hasDrFetus = true
        end
        ---------------
        -- King Baby --
        ---------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY) and IR.kingbaby.proccessFamiliars and IR.Config["doKingBaby"] then
            local index = 1
            for _, entity in ipairs(IR.EntityList.Familiars) do
                familiar = entity:ToFamiliar()
                if familiar.IsFollower and familiar.Variant ~= FamiliarVariant.KING_BABY then
                    familiar:GetData().OrbitIndex = index
                    index = index + 1
                end
            end
            IR.kingbaby.proccessFamiliars = false
        elseif player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY) and IR.Config["doKingBaby"] then
            for _, entity in ipairs(Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.KING_BABY, -1, false, false)) do
                entity:ToFamiliar():FollowParent()
            end
        end
        -------------
        -- Magneto --
        -------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGNETO) and IR.Config["doMagneto"] then
            for _, entity in ipairs(Isaac.FindInRadius(player.Position, 30, EntityPartition.BULLET)) do
                if entity.SpawnerType ~= EntityType.ENTITY_PLAYER and entity:GetData().initMagneto == nil then
                    entity:GetData().initMagneto = 1
                    if math.random(4) < 2 then
                        entity = entity:ToProjectile()
                        entity.Velocity = -entity.Velocity * 0.8
                        entity.Parent = player
                        entity.SpawnerEntity = player
                        entity:AddProjectileFlags(ProjectileFlags.CANT_HIT_PLAYER | ProjectileFlags.ANY_HEIGHT_ENTITY_HIT | ProjectileFlags.HIT_ENEMIES)
                    end
                end
            end
        end
        --------------------
        -- Blood Shot Eye --
        --------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BLOODSHOT_EYE) and IR.Config["doBloodshotEye"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.BLOODSHOT_EYE and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    local laser = player:FireTechLaser(tear.Position, LaserOffset.LASER_TECH1_OFFSET, tear.Velocity, false, false)
                    laser.DisableFollowParent = true
                    laser.CollisionDamage = 20
                    entity:Remove()
                end
            end
        end
        -----------------
        -- Common Cold --
        -----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_COMMON_COLD) and IR.Config["doCommonCold"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_FAMILIAR and math.random(10) > 5 and entity.FrameCount < 1 then
                    entity:ToTear().TearFlags = entity:ToTear().TearFlags | TearFlags.TEAR_POISON
                    entity:SetColor(Color(0.3,0.9,0.1,0.9,0,0,0),0,0,false,false)
                end
            end
        end
        ----------------------
        -- Cain's Other Eye --
        ----------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_CAINS_OTHER_EYE) and IR.Config["doCainsOtherEye"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.CAINS_OTHER_EYE then
                    entity:Remove()
                end
                if entity.SpawnerType == EntityType.ENTITY_PLAYER and entity:GetData().initOtherEye == nil and entity.FrameCount == 0 then
                    for _, target in ipairs(Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.CAINS_OTHER_EYE, -1, false, false)) do
                        local Tear = player:FireTear(target.Position, entity.Velocity, false, true, false)
                        Tear:GetData().initOtherEye = true
                    end
                end
            end
        end
        --------------
        -- Placenta --
        --------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_PLACENTA) and IR.Config["doPlacenta"] then
            if IR.Timer % 900 == 0 and player:CanPickRedHearts() then
                SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
                Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HEART, 0, player.Position, player.Velocity, nil)
                player:AddHearts(1)
            end
        end
        ----------------
        -- Ghost Baby --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_BABY) and IR.Config["doGhostBaby"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_FAMILIAR and entity.FrameCount < 1 then
                    entity:ToTear().TearFlags = entity:ToTear().TearFlags | TearFlags.TEAR_SPECTRAL
                end
                if entity.SpawnerVariant == FamiliarVariant.GHOST_BABY and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.CollisionDamage = math.max((player.Damage/3),3.5)
                end
            end
        end
        ---------------
        -- Yum Heart --
        ---------------
        if IR.Config["doYumHeart"] then
            if player:HasCollectible(IR.yumheart.Eternal) and player:GetHearts() == 24 then
                local ActiveItemCharge = player:GetActiveCharge()
                player:AddCollectible(IR.yumheart.OneUp, ActiveItemCharge, false)
            end
            if player:HasCollectible(IR.yumheart.Black) and not player:CanPickBlackHearts() then
                local ActiveItemCharge = player:GetActiveCharge()
                player:AddCollectible(IR.yumheart.Eternal, ActiveItemCharge, false)
            end
            if player:HasCollectible(IR.yumheart.Soul) and not player:CanPickSoulHearts() then
                local ActiveItemCharge = player:GetActiveCharge()
                player:AddCollectible(IR.yumheart.Black, ActiveItemCharge, false)
            end
            if player:HasCollectible(CollectibleType.COLLECTIBLE_YUM_HEART) and not player:CanPickRedHearts() then
                local ActiveItemCharge = player:GetActiveCharge()
                player:AddCollectible(IR.yumheart.Soul, ActiveItemCharge, false)
            end
            if player:HasCollectible(IR.yumheart.OneUp) and player:GetHearts() < 24 then
                player:AddCollectible(IR.yumheart.Eternal, 0, false)
            end
            if player:HasCollectible(IR.yumheart.Eternal) and player:CanPickBlackHearts() then
                player:AddCollectible(IR.yumheart.Black, 0, false)
            end
            if player:HasCollectible(IR.yumheart.Black) and player:CanPickSoulHearts() then
                player:AddCollectible(IR.yumheart.Soul, 0, false)
            end
            if player:HasCollectible(IR.yumheart.OneUp) and player:CanPickRedHearts() then
                player:AddCollectible(CollectibleType.COLLECTIBLE_YUM_HEART, 0, false)
            end
            if player:HasCollectible(IR.yumheart.Eternal) and player:CanPickRedHearts() then
                player:AddCollectible(CollectibleType.COLLECTIBLE_YUM_HEART, 0, false)
            end
            if player:HasCollectible(IR.yumheart.Black) and player:CanPickRedHearts() then
                player:AddCollectible(CollectibleType.COLLECTIBLE_YUM_HEART, 0, false)
            end
            if player:HasCollectible(IR.yumheart.Soul) and player:CanPickRedHearts() then
                player:AddCollectible(CollectibleType.COLLECTIBLE_YUM_HEART, 0, false)
            end
        end
        ----------------
        -- Lucky Foot --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_LUCKY_FOOT) and IR.Config["doLuckyFoot"] then
            if player:GetNumCoins() ~= IR.coinsOnProc then
                if player:GetNumCoins() % 14 == 0 and player:GetNumCoins() > 0 and not player:HasCollectible(CollectibleType.COLLECTIBLE_STEAM_SALE) then
                    IR.coinsOnProc = player:GetNumCoins()
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, player.Position, Vector(0,0), nil)
                end
                if player:GetNumCoins() % 7 == 0 and player:GetNumCoins() > 0 and player:HasCollectible(CollectibleType.COLLECTIBLE_STEAM_SALE) then
                    IR.coinsOnProc = player:GetNumCoins()
                    Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, player.Position, Vector(0,0), nil)
                end
            end
            if player.Luck ~= IR.savedLuck then
                IR.savedLuck = player.Luck
                player:AddCacheFlags(CacheFlag.CACHE_SPEED)
                player:EvaluateItems()
            end
        end
        -------------------
        -- Little Steven --
        -------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_LITTLE_STEVEN) and IR.Config["doLittleSteven"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.LITTLE_STEVEN and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.CollisionDamage = math.max((player.Damage/2),5)
                    if player:HasTrinket(TrinketType.TRINKET_BABY_BENDER) then
                        tear.CollisionDamage = entity.CollisionDamage * 3
                        tear.Scale = tear.Scale * 1.3
                    end
                end
            end
        end
        --------------------
        -- Harlequin Baby --
        --------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HARLEQUIN_BABY) and IR.Config["doHarlequinBaby"] then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.HARLEQUIN_BABY and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.CollisionDamage = math.max((player.Damage/2),4)
                end
            end
        end
        -------------
        -- Poke-Go --
        -------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_POKE_GO) and IR.Config["doPokeGo"] then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY) and entity:GetData().initPokeGo == nil then
                    if math.random(5) == 1 then
                        entity:ToNPC():MakeChampion(math.random(10000))
                    end
                    entity:GetData().initPokeGo = true
                end
            end
        end
    end
end

IR:AddCallback(ModCallbacks.MC_POST_UPDATE, IR.onUpdate)

-----------------------------
-- Replacing Vanilla Items --
-----------------------------
function IR:onMorph(_, variant, subtype)
    if variant == PickupVariant.PICKUP_COLLECTIBLE and subtype == CollectibleType.COLLECTIBLE_HALLOWED_GROUND and IR.Config["doHallowedGround"] then
        return {PickupVariant.PICKUP_COLLECTIBLE, IR.hallowedground.Item}
    elseif variant == PickupVariant.PICKUP_COLLECTIBLE and subtype == CollectibleType.COLLECTIBLE_MONSTER_MANUAL and IR.Config["doMonsterManual"] then
        return {PickupVariant.PICKUP_COLLECTIBLE, IR.monstermanual.Item}
    end
end

IR:AddCallback(ModCallbacks.MC_POST_PICKUP_SELECTION, IR.onMorph)

-----------------------------------------------------------------
-- Credit to Strawrat @ https://steamcommunity.com/id/Strawrat --
-----------------------------------------------------------------
function IR:onFamiliar(entity)
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        ------------------
        -- Farting Baby --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_FARTING_BABY) and IR.Config["doFartingBaby"] then
            if entity:GetSprite():IsPlaying("Hit") then
                for _, enemy in ipairs(IR.EntityList.Enemies) do
                    enemy:AddPoison(EntityRef(entity), 450, (player.Damage * 2))
                end
            end
        end
        ---------------
        -- King Baby --
        ---------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY) and entity.Variant ~= FamiliarVariant.KING_BABY and IR.Config["doKingBaby"] then
            local target = (Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.KING_BABY, -1, false, false))[1]
            local data = entity:GetData()
            if entity.IsFollower and entity.Variant ~= FamiliarVariant.KEY_FULL and entity.Variant ~= FamiliarVariant.KEY_PIECE_1 and entity.Variant ~= FamiliarVariant.KEY_PIECE_2 and entity.Variant ~= FamiliarVariant.ISAACS_HEART and entity.Variant ~= FamiliarVariant.ONE_UP and target ~= nil then
                if data.OrbitIndex == nil then
                    data.OrbitIndex = 0
                end
                if entity.OrbitLayer ~= IR.kingbaby.orbitLayerOne and data.OrbitIndex <= IR.kingbaby.orbitOne then
                    data.WasOrbital = true
                    data.OriginalLayer = entity.OrbitLayer
                    entity:AddToOrbit(IR.kingbaby.orbitLayerOne)
                elseif entity.OrbitLayer ~= IR.kingbaby.orbitLayerTwo and data.OrbitIndex > IR.kingbaby.orbitOne then
                    data.WasOrbital = true
                    data.OriginalLayer = entity.OrbitLayer
                    entity:AddToOrbit(IR.kingbaby.orbitLayerTwo)
                end
                local nextOrbit = IR.kingbaby.orbitDistanceOne
                if data.OrbitIndex > IR.kingbaby.orbitOne then
                    nextOrbit = IR.kingbaby.orbitDistanceTwo
                end
                entity.OrbitDistance = nextOrbit
                entity.OrbitSpeed = IR.kingbaby.orbitSpeed 
                local orbitPos = entity:GetOrbitPosition(target.Position + target.Velocity) 
                local chargers = entity.Variant == FamiliarVariant.LITTLE_CHUBBY or entity.Variant == FamiliarVariant.BOBS_BRAIN or entity.Variant == FamiliarVariant.BIG_CHUBBY
                if not chargers or (chargers and entity.FireCooldown >= 0) then
                    entity.Velocity = (orbitPos - entity.Position) / IR.kingbaby.orbitVelocity
                end
            elseif data.WasOrbital then
                data.WasOrbital = nil
                if data.OriginalLayer == -1 then
                    entity:RemoveFromOrbit()
                else
                    entity:AddToOrbit(data.OriginalLayer)
                end
                data.OriginalLayer = nil
            end
        end
    end
end

IR:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, IR.onFamiliar)

----------------------
-- Dead Sea Scrolls --
----------------------
function IR:onDSS()
    if IR.Config["doDeadSeaScrolls"] then
        local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_DEAD_SEA_SCROLLS)
        SFXManager():Play(SoundEffect.SOUND_BOSS_LITE_HISS, 1.0, 0, false, 1.0)
        player:UseActiveItem(IR.DeadSeaScrolls[math.random(#IR.DeadSeaScrolls)], false, false, false, false)
        return true
    end
end

IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onDSS, CollectibleType.COLLECTIBLE_DEAD_SEA_SCROLLS)

--------------
-- Scissors --
--------------
function IR:onScissors()
    if IR.Config["doScissors"] then
        local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_SCISSORS)
        local Pool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector(0,0), player):ToEffect()
        Pool.CollisionDamage = player.Damage / 4
        Pool:SetColor(Color(0.0,0.0,0.0,0.0,0,0,0),0,0,false,false)
        Pool:SetTimeout(99999)
        Pool.Scale = 2
        local FakePool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector(0,0), player):ToEffect()
        FakePool.CollisionDamage = 0
        FakePool:SetTimeout(99999)
        FakePool.Scale = 4
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onScissors, CollectibleType.COLLECTIBLE_SCISSORS)

---------------
-- Yum Heart --
---------------
function IR:onYumHeart()
    if IR.Config["doYumHeart"] then
        local void = false
        local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_YUM_HEART)
        if player == nil then
            player = GetPlayerUsingActive(IR.yumheart.Soul)
        end
        if player == nil then
            player = GetPlayerUsingActive(IR.yumheart.Black)
        end
        if player == nil then
            player = GetPlayerUsingActive(IR.yumheart.Eternal)
        end
        if player == nil then
            player = GetPlayerUsingActive(IR.yumheart.OneUp)
        end
        if player:GetPlayerType() == PlayerType.PLAYER_KEEPER then
            local coinPos = findFreeTile(player.Position)
            if coinPos == false then
                coinPos = player.Position
            else
                coinPos = Game():GetRoom():GetGridPosition(coinPos)
            end
            SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
            Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, CoinSubType.COIN_PENNY, coinPos, Vector(0,0), nil)
            return
        end
        if player:GetPlayerType() == PlayerType.PLAYER_THELOST then
            SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE)
            player:AddCollectible(CollectibleType.COLLECTIBLE_HOLY_MANTLE, 0, false)
            return
        end
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_VOID then
            void = true
        end
        if player:CanPickRedHearts() then
            if void == true then
                SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
                player:AddHearts(2)
            end
            return
        elseif player:CanPickSoulHearts() then
            SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
            player:AddCollectible(IR.yumheart.Soul, 0, false)
            if void == true then
                player:RemoveCollectible(IR.yumheart.OneUp)
                player:RemoveCollectible(IR.yumheart.Eternal)
                player:RemoveCollectible(IR.yumheart.Black)
                player:RemoveCollectible(IR.yumheart.Soul)
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_YUM_HEART)
                player:AddCollectible(CollectibleType.COLLECTIBLE_VOID, 0, false)
            end
            player:AddSoulHearts(1)
            return
        elseif player:CanPickBlackHearts() then
            SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
            player:AddCollectible(IR.yumheart.Soul, 0, false)
            if void == true then
                player:RemoveCollectible(IR.yumheart.OneUp)
                player:RemoveCollectible(IR.yumheart.Eternal)
                player:RemoveCollectible(IR.yumheart.Black)
                player:RemoveCollectible(IR.yumheart.Soul)
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_YUM_HEART)
                player:AddCollectible(CollectibleType.COLLECTIBLE_VOID, 0, false)
            end
            player:AddBlackHearts(1)
            return
        elseif player:GetHearts() < 24 then
            SFXManager():Play(SoundEffect.SOUND_VAMP_GULP, 1.0, 0, false, 1.0)
            player:AddCollectible(IR.yumheart.Soul, 0, false)
            if void == true then
                player:RemoveCollectible(IR.yumheart.OneUp)
                player:RemoveCollectible(IR.yumheart.Eternal)
                player:RemoveCollectible(IR.yumheart.Black)
                player:RemoveCollectible(IR.yumheart.Soul)
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_YUM_HEART)
                player:AddCollectible(CollectibleType.COLLECTIBLE_VOID, 0, false)
            end
            player:AddEternalHearts(1)
            return
        else
            SFXManager():Play(SoundEffect.SOUND_CHOIR_UNLOCK, 1.0, 0, false, 1.0)
            player:AddCollectible(IR.yumheart.Soul, 0, false)
            player:AddMaxHearts(-18)
            player:AddCollectible(CollectibleType.COLLECTIBLE_ONE_UP, 0, false)
            player:RemoveCollectible(IR.yumheart.OneUp)
            player:RemoveCollectible(IR.yumheart.Eternal)
            player:RemoveCollectible(IR.yumheart.Black)
            player:RemoveCollectible(IR.yumheart.Soul)
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_YUM_HEART)
            if void == true then
                player:RemoveCollectible(IR.yumheart.OneUp)
                player:RemoveCollectible(IR.yumheart.Eternal)
                player:RemoveCollectible(IR.yumheart.Black)
                player:RemoveCollectible(IR.yumheart.Soul)
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_YUM_HEART)
                player:AddCollectible(CollectibleType.COLLECTIBLE_VOID, 0, false)
            end
            return
        end
    end
end

IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onYumHeart, CollectibleType.COLLECTIBLE_YUM_HEART)
IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onYumHeart, IR.yumheart.Soul)
IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onYumHeart, IR.yumheart.Black)
IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onYumHeart, IR.yumheart.Eternal)
IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onYumHeart, IR.yumheart.OneUp)


-----------------
-- Spider Butt --
-----------------
function IR:onSpiderButt()
    if IR.Config["doSpiderButt"] then
        local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_SPIDER_BUTT)
        for _, entity in ipairs(IR.EntityList.Enemies) do
            if entity:IsVulnerableEnemy() then
                entity:TakeDamage(player.Damage/2, 0, EntityRef(player), 0)
            end
        end
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onSpiderButt, CollectibleType.COLLECTIBLE_SPIDER_BUTT)

function IR:onRoom()
    IR.ActiveItemLimit = false
    local room = Game():GetRoom()
    local level = Game():GetLevel()
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        ----------------------
        -- Guppy's Hairball --
        ----------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_GUPPYS_HAIRBALL) and Game():GetLevel():GetCurrentRoomDesc().VisitedCount == 1 and IR.Config["doGuppyHairball"] then
            local num = Game():GetLevel():GetCurrentRoom():GetAliveEnemiesCount()
            if num > 0 then
                player:AddBlueFlies(math.random(math.ceil(num/2),num), player.Position, player)
            end
        end
        ----------------
        -- The Peeper --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_PEEPER) and IR.Config["doPeeper"] then
            while IR.hasPeeper == true do
                IR.hasPeeper = false
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_PEEPER)
            end
        end
        ------------------
        -- Magic 8 Ball --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGIC_8_BALL) and IR.Config["doMagicEightBall"] and room:IsFirstVisit() and level:GetCurrentRoomIndex() == level:GetStartingRoomIndex() then
            Isaac.Spawn(EntityType.ENTITY_SLOT, 3, 0, Vector(180,165), Vector(0,0), nil)
        end
    end
end

IR:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, IR.onRoom)

function IR:onDamage(entity, amt, flag, source, countdown)
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        ----------------
        -- Holy Water --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER) or IR.monstermanual.MMholywater == true and IR.Config["doHolyWater"] then
            if source.Type == EntityType.ENTITY_TEAR and source.Entity.SpawnerType == EntityType.ENTITY_PLAYER then
                local Pool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_HOLYWATER_TRAIL, 0, source.Position, Vector(0,0), player):ToEffect()
                Pool.CollisionDamage = player.Damage / 4
                Pool:SetColor(Color(1.0,1.0,1.0,0,0,0,0),0,0,false,false)
                Pool.Scale = 2
            end
        end
        --------------------
        -- Missing Page 2 --
        --------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MISSING_PAGE_2) and entity.Type == EntityType.ENTITY_PLAYER and IR.Config["doMissingPage"] then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() then
                    entity:TakeDamage(5.0, 0, EntityRef(player), 0)
                end
            end
        end
        ----------------
        -- Dead Tooth --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_DEAD_TOOTH) and entity:IsVulnerableEnemy() and entity:HasEntityFlags(EntityFlag.FLAG_POISON) and IR.Config["doDeadTooth"] then
            for _, target in pairs(Isaac.FindInRadius(player.Position, 50, EntityPartition.ENEMY)) do
                target:AddEntityFlags(EntityFlag.FLAG_SPAWN_BLACK_HP)
            end
        end
        ----------------
        -- The Peeper --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_PEEPER) and entity.Type == EntityType.ENTITY_PLAYER and IR.Config["doPeeper"] then
            if IR.hasPeeper == false then
                IR.hasPeeper = true
                player:AddCollectible(CollectibleType.COLLECTIBLE_PEEPER, 0, false)
            end
        end
        ------------------
        -- Magic 8 Ball --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGIC_8_BALL) and entity.Type == EntityType.ENTITY_PLAYER and IR.Config["doMagicEightBall"] then
            if math.random(10) == 1 then
                player:UseActiveItem(CollectibleType.COLLECTIBLE_CRYSTAL_BALL, false, false, true, false)
            end
        end
        ----------------
        -- Black Bean --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BLACK_BEAN) and source.Type == EntityType.ENTITY_TEAR and source.Entity.SpawnerType == EntityType.ENTITY_PLAYER and IR.Config["doBlackBean"] then
            if math.random(4) == 1 then
                local fart = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.FART, 0, entity.Position, Vector(0,0), player)
                for _, target in ipairs(Isaac.FindInRadius(fart.Position, 150, EntityPartition.ENEMY)) do
                    target:TakeDamage(player.Damage/5, 0, EntityRef(player), 0)
                end
            end
        end
        --------------
        -- Betrayal --
        --------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BETRAYAL) and IR.Config["doBetrayal"] then
            if entity:GetData().initBetrayal == nil and entity:HasEntityFlags(EntityFlag.FLAG_CHARM) and not entity:HasEntityFlags(EntityFlag.FLAG_PERSISTENT) then
                entity:GetData().initBetrayal = true
                entity:TakeDamage((4 * amt), 0, EntityRef(nil), 0)
                return false
            elseif entity:GetData().initBetrayal == true and entity:HasEntityFlags(EntityFlag.FLAG_CHARM) and not entity:HasEntityFlags(EntityFlag.FLAG_PERSISTENT) then
                entity:GetData().initBetrayal = nil
                return true
            end
        end
        --------------------
        -- Shard of Glass --
        --------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_SHARD_OF_GLASS) and entity.Type == EntityType.ENTITY_PLAYER and IR.Config["doShard"] then
            for _, target in ipairs(IR.EntityList.Enemies) do
                if source.Entity ~= nil then
                    if target.Index == source.Entity.Index then
                        target:TakeDamage(5.0, 0, EntityRef(player), 0)
                        target:AddEntityFlags(EntityFlag.FLAG_BLEED_OUT)
                    end
                end
            end
        end
    end
end

IR:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, IR.onDamage)

---------------
-- Hourglass --
---------------
function IR:onHourglass()
    if IR.Config["doHourglass"] then
        IR.ActiveItemRoom = Game():GetLevel():GetCurrentRoomIndex()
        IR.ActiveItemTimer = 1600
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onHourglass, CollectibleType.COLLECTIBLE_HOURGLASS)

--------------
-- Kamikaze --
--------------
function IR:onKamikaze()
    local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_KAMIKAZE)
    if IR.Config["doKamikaze"] and player:HasCollectible(CollectibleType.COLLECTIBLE_KAMIKAZE) then
        local kamikaze = player:FireBomb(player.Position, player.Velocity)
        kamikaze:ToBomb():SetExplosionCountdown(0)
    end
    return true
end

IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onKamikaze, CollectibleType.COLLECTIBLE_KAMIKAZE)

---------------
-- Mom's Pad --
---------------
function IR:onMomsPad()
    if IR.Config["doMomsPad"] then
        IR.ActiveItemRoom = Game():GetLevel():GetCurrentRoomIndex()
        IR.ActiveItemTimer = 1600
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onMomsPad, CollectibleType.COLLECTIBLE_MOMS_PAD)

---------------
-- Mom's Bra --
---------------
function IR:onMomsBra()
    if IR.Config["doMomsBra"] then
        IR.ActiveItemRoom = Game():GetLevel():GetCurrentRoomIndex()
        IR.ActiveItemTimer = 1600
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onMomsBra, CollectibleType.COLLECTIBLE_MOMS_BRA)

---------------------
-- Hallowed Ground --
---------------------
function IR:onHallowed()
    if IR.Config["doHallowedGround"] then
        SFXManager():Play(SoundEffect.SOUND_FART, 1.0, 0, false, 1.0)
        local player = GetPlayerUsingActive(IR.hallowedground.Item)
        local room = Game():GetRoom()
        local pos = findFreeTile(player.Position)
        if pos ~= false then
            room:SpawnGridEntity(pos, GridEntityType.GRID_POOP, 6, 0, 0)
        end
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onHallowed, IR.hallowedground.Item)

--------------
-- The Poop --
--------------
function IR:onPoop()
    if IR.Config["doPoop"] then
        local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_POOP)
        local Pool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_MISHAP, 0, player.Position, Vector(0,0), player):ToEffect()
        Pool.CollisionDamage = player.Damage / 3
        Pool:SetColor(Color(0.0,0.0,0.0,1.0,160,82,45),0,0,false,false)
        Pool.Scale = 2
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onPoop, CollectibleType.COLLECTIBLE_POOP)

function IR:onNewLevel()
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        --------------------
        -- Monster Manual --
        --------------------
        if IR.Config["doMonsterManual"] then
            IR.monstermanual.fList = {}
            IR.monstermanual.MMholywater = false
            player:AddCacheFlags(CacheFlag.CACHE_FAMILIARS)
            player:EvaluateItems()
        end
    end
end

IR:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, IR.onNewLevel)

------------
-- Plan C --
------------
function IR:onPlanC()
    if IR.Config["doPlanC"] then
        IR.planc.usedPlanC = true
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onPlanC, CollectibleType.COLLECTIBLE_PLAN_C)

--------------------
-- Monster Manual --
--------------------
function IR:onMonsterMan()
    if IR.Config["doMonsterManual"] then
        local player = GetPlayerUsingActive(IR.monstermanual.Item)
        SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 1.0, 0, false, 1.0)
        IR.monstermanual.fRoll = math.random(#IR.monstermanual.fVariant)
        if #IR.monstermanual.fList > IR.Config["MonsterManualLimit"] then
            table.insert(IR.monstermanual.fList, 1, IR.monstermanual.fVariant[IR.monstermanual.fRoll])
            table.remove(IR.monstermanual.fList, #IR.monstermanual.fList)
        else
            table.insert(IR.monstermanual.fList, IR.monstermanual.fVariant[IR.monstermanual.fRoll])
        end
        player:AddCacheFlags(CacheFlag.CACHE_FAMILIARS)
        player:EvaluateItems()
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onMonsterMan, IR.monstermanual.Item)

function IR:onPill()
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        ------------------
        -- Little Baggy --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_LITTLE_BAGGY) and IR.Config["doLittleBaggy"] then
            player:AddSoulHearts(1)
        end
    end
end

IR:AddCallback(ModCallbacks.MC_USE_PILL, IR.onPill)

---------------
-- Dataminer --
---------------
function IR:onDataminer()
    if IR.Config["doDataminer"] then
        local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_DATAMINER)
        local roll = math.random(100)
        if roll > 0 and roll < 51 then
            player:AddCollectible(CollectibleType.COLLECTIBLE_GB_BUG, 0, false)
        elseif roll > 50 and roll < 76 then
            IR.dataminer.DMroom = Game():GetLevel():GetCurrentRoomIndex()
            IR.dataminer.hasModem = false
            IR.dataminer.hadModem = false
            IR.dataminer.usedDM = true
        elseif roll > 75 and roll < 96 then
            for i = 1, 10 do
                Isaac.Spawn(EntityType.ENTITY_SHOPKEEPER, 2, 0, Vector(math.random(90,1060),math.random(170,820)), Vector(0,0), nil)
            end
            Isaac.ExecuteCommand("spawn 5.100.258")
        elseif roll > 95 and roll < 101 then
            Isaac.ExecuteCommand("goto s.error.#")
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_DATAMINER)
        end
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onDataminer, CollectibleType.COLLECTIBLE_DATAMINER)

function IR:onCache(player, flag)
    ------------------
    -- Technology 2 --
    ------------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_TECHNOLOGY_2) and IR.Config["doTechTwo"] then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 1.54
        end
    end
    ---------------
    -- Trisagion --
    ---------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_TRISAGION) and IR.Config["doTrisagion"] then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 1.33
        end
    end
    ----------------
    -- Cursed Eye --
    ----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_CURSED_EYE) and IR.Config["doCursedEye"] then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + 1
        end
    end
    ----------------
    -- Lucky Foot --
    ----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_LUCKY_FOOT) and IR.Config["doLuckyFoot"] then
        if flag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + ((0.1 * player.Luck)/2)
        end
    end
    -----------------
    -- Tiny Planet --
    -----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_TINY_PLANET) and IR.Config["doTinyPlanet"] then
        if flag == CacheFlag.CACHE_FIREDELAY then
            player.MaxFireDelay = player.MaxFireDelay - 1
        elseif flag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - 32.25
        elseif flag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed - 0.15
        elseif flag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | 1 
        end
    end
    if flag == CacheFlag.CACHE_FAMILIARS then
        --------------------
        -- Monster Manual --
        --------------------
        if IR.Config["doMonsterManual"] then
            for _, data in ipairs(IR.monstermanual.fList) do
                IR.monstermanual.fNum = Isaac.CountEntities(player, EntityType.ENTITY_FAMILIAR, data, -1) + 1
                player:CheckFamiliar(data, IR.monstermanual.fNum, IR.monstermanual.famRNG)
                if data == 25 and IR.monstermanual.fNum > 0 then
                    IR.monstermanual.MMholywater = true
                end
            end
        end
        ---------------
        -- King Baby --
        ---------------
        if IR.Config["doKingBaby"] then
            IR.kingbaby.proccessFamiliars = true
        end
    end
    -----------------------
    -- Strange Attractor --
    -----------------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR) and IR.Config["doStrangeAttractor"] then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 1.2
        end
    end
    ----------------
    -- Fast Bombs --
    ----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_FAST_BOMBS) and IR.Config["doFastBombs"] then
        if player:HasCollectible(CollectibleType.COLLECTIBLE_DR_FETUS) then
            if flag == CacheFlag.CACHE_FIREDELAY then
                player.MaxFireDelay = player.MaxFireDelay - 21
            end
        end
    end
    -------------------
    -- 3 Dollar Bill --
    -------------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_3_DOLLAR_BILL) and IR.Config["doThreeDollar"] then
        if flag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - 16.25
        end
    end
end

IR:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, IR.onCache)

----------------------------------------------------------------------------
-- Credit to Burp @ https://steamcommunity.com/profiles/76561198042927314 --
----------------------------------------------------------------------------
function findFreeTile(pos)
    local room = Game():GetRoom()
    local idx = type(pos) == 'number' and pos or room:GetGridIndex(pos)
    local w = room:GetGridWidth()
    if room:GetGridEntity(idx) == nil or room:GetGridEntity(idx).State == 4 then
        return idx
    elseif room:GetGridEntity(idx - 1) == nil or room:GetGridEntity(idx - 1).State == 4 then
        return idx - 1
    elseif room:GetGridEntity(idx + 1) == nil or room:GetGridEntity(idx + 1).State == 4 then
        return idx + 1
    elseif room:GetGridEntity(idx - w) == nil or room:GetGridEntity(idx - w).State == 4 then
        return idx - w
    elseif room:GetGridEntity(idx + w) == nil or room:GetGridEntity(idx + w).State == 4 then
        return idx + w
    elseif room:GetGridEntity(idx - w - 1) == nil or room:GetGridEntity(idx - w - 1).State == 4 then
        return idx - w - 1
    elseif room:GetGridEntity(idx + w - 1) == nil or room:GetGridEntity(idx + w - 1).State == 4 then
        return idx + w - 1
    elseif room:GetGridEntity(idx - w + 1) == nil or room:GetGridEntity(idx - w + 1).State == 4 then
        return idx - w + 1
    elseif room:GetGridEntity(idx + w + 1) == nil or room:GetGridEntity(idx + w + 1).State == 4 then
        return idx + w + 1
    else
        return false
    end
end

-------------------------------------
-- Credit to Piber20 & Agent Cucco --
-------------------------------------
function GetPlayerUsingActive(itemID)
    for p = 0, Game():GetNumPlayers() - 1 do
        local player = Isaac.GetPlayer(p)
        local ActiveCheck = (itemID and (player:GetActiveItem() == itemID or player:GetActiveItem() == CollectibleType.COLLECTIBLE_VOID) or true)
        if ActiveCheck and (Input.IsActionTriggered(ButtonAction.ACTION_ITEM, player.ControllerIndex) or Input.IsActionTriggered(ButtonAction.ACTION_PILLCARD, player.ControllerIndex)) then
            return player
        end
    end
    return nil
end