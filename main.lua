--------------------------------------------------------------------------------------------------
-- Items Reforged by Kalightortaio, Krishna Kokatay, 2020. http://www.kalightortaio.com         --
-- A huge thank you to Lytebringr, Wofsauge, and the #modding-dev community in the TBOI Discord --
--------------------------------------------------------------------------------------------------
IR = RegisterMod("Items Reforged", 1)
local json = require("json")
require("ir_config")
IR.Config = IR.DefaultConfig
IR.Config.Version = "1.7"
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
    fVariant = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 20, 21, 22, 23, 24, 25, 30, 31, 32, 33, 35, 40, 42, 43, 44, 45, 46, 47, 48, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130},
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
IR.DeadSeaScrolls = {CollectibleType.COLLECTIBLE_BOOK_REVELATIONS,CollectibleType.COLLECTIBLE_BOOK_OF_SECRETS,CollectibleType.COLLECTIBLE_PRAYER_CARD,CollectibleType.COLLECTIBLE_SHOOP_DA_WHOOP,CollectibleType.COLLECTIBLE_EDENS_SOUL,CollectibleType.COLLECTIBLE_BOOK_OF_SHADOWS,CollectibleType.COLLECTIBLE_BLUE_BOX,CollectibleType.COLLECTIBLE_MY_LITTLE_UNICORN,CollectibleType.COLLECTIBLE_DADS_KEY,CollectibleType.COLLECTIBLE_PONY,CollectibleType.COLLECTIBLE_WAIT_WHAT,CollectibleType.COLLECTIBLE_CRYSTAL_BALL,CollectibleType.COLLECTIBLE_DECK_OF_CARDS,CollectibleType.COLLECTIBLE_FORGET_ME_NOW,CollectibleType.COLLECTIBLE_BOBS_ROTTEN_HEAD,CollectibleType.COLLECTIBLE_TAMMYS_HEAD,CollectibleType.COLLECTIBLE_GUPPYS_HEAD,CollectibleType.COLLECTIBLE_HEAD_OF_KRAMPUS,CollectibleType.COLLECTIBLE_FLUSH,CollectibleType.COLLECTIBLE_BOX_OF_SPIDERS,CollectibleType.COLLECTIBLE_HOW_TO_JUMP,CollectibleType.COLLECTIBLE_BLANK_CARD,CollectibleType.COLLECTIBLE_BUTTER_BEAN,CollectibleType.COLLECTIBLE_KIDNEY_BEAN,CollectibleType.COLLECTIBLE_MEGA_BEAN,CollectibleType.COLLECTIBLE_BEAN,CollectibleType.COLLECTIBLE_MOMS_BOTTLE_PILLS,CollectibleType.COLLECTIBLE_MOMS_BRA,CollectibleType.COLLECTIBLE_MOMS_PAD,CollectibleType.COLLECTIBLE_GUPPYS_PAW,CollectibleType.COLLECTIBLE_ISAACS_TEARS,CollectibleType.COLLECTIBLE_LEMON_MISHAP,IR.monstermanual.Item,CollectibleType.COLLECTIBLE_DATAMINER,CollectibleType.COLLECTIBLE_PORTABLE_SLOT,CollectibleType.COLLECTIBLE_SPIDER_BUTT,CollectibleType.COLLECTIBLE_SATANIC_BIBLE,CollectibleType.COLLECTIBLE_BIBLE,CollectibleType.COLLECTIBLE_BOOMERANG,IR.hallowedground.Item,CollectibleType.COLLECTIBLE_SMELTER,CollectibleType.COLLECTIBLE_PAUSE,CollectibleType.COLLECTIBLE_CROOKED_PENNY,CollectibleType.COLLECTIBLE_DULL_RAZOR,CollectibleType.COLLECTIBLE_METRONOME,CollectibleType.COLLECTIBLE_BROWN_NUGGET,CollectibleType.COLLECTIBLE_SPRINKLER,CollectibleType.COLLECTIBLE_MYSTERY_GIFT,CollectibleType.COLLECTIBLE_TELEKINESIS,CollectibleType.COLLECTIBLE_BLOOD_RIGHTS,CollectibleType.COLLECTIBLE_RAZOR_BLADE,CollectibleType.COLLECTIBLE_IV_BAG,CollectibleType.COLLECTIBLE_DEAD_SEA_SCROLLS,CollectibleType.COLLECTIBLE_KAMIKAZE,CollectibleType.COLLECTIBLE_POOP,CollectibleType.COLLECTIBLE_TELEPORT,CollectibleType.COLLECTIBLE_GAMEKID,CollectibleType.COLLECTIBLE_BOOK_OF_SIN,CollectibleType.COLLECTIBLE_D6,CollectibleType.COLLECTIBLE_D12,CollectibleType.COLLECTIBLE_D8,CollectibleType.COLLECTIBLE_D10,CollectibleType.COLLECTIBLE_D100,CollectibleType.COLLECTIBLE_DOCTORS_REMOTE,CollectibleType.COLLECTIBLE_MR_BOOM,CollectibleType.COLLECTIBLE_NOTCHED_AXE,CollectibleType.COLLECTIBLE_WOODEN_NICKEL,CollectibleType.COLLECTIBLE_BOX_OF_FRIENDS,CollectibleType.COLLECTIBLE_THE_NAIL,CollectibleType.COLLECTIBLE_ANARCHIST_COOKBOOK,CollectibleType.COLLECTIBLE_WE_NEED_GO_DEEPER,CollectibleType.COLLECTIBLE_PINKING_SHEARS,CollectibleType.COLLECTIBLE_MONSTROS_TOOTH,CollectibleType.COLLECTIBLE_RED_CANDLE,CollectibleType.COLLECTIBLE_CANDLE,CollectibleType.COLLECTIBLE_BEST_FRIEND,CollectibleType.COLLECTIBLE_WHITE_PONY,CollectibleType.COLLECTIBLE_YUM_HEART,CollectibleType.COLLECTIBLE_FRIEND_BALL,CollectibleType.COLLECTIBLE_VOID,CollectibleType.COLLECTIBLE_D1,CollectibleType.COLLECTIBLE_MAMA_MEGA,CollectibleType.COLLECTIBLE_MEGA_SATANS_BREATH,CollectibleType.COLLECTIBLE_MINE_CRAFTER,CollectibleType.COLLECTIBLE_MOMS_BOX,CollectibleType.COLLECTIBLE_D7,CollectibleType.COLLECTIBLE_BLACK_HOLE,CollectibleType.COLLECTIBLE_SHARP_STRAW,CollectibleType.COLLECTIBLE_MR_ME,CollectibleType.COLLECTIBLE_TELEPORT_2,CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS,CollectibleType.COLLECTIBLE_HOURGLASS,CollectibleType.COLLECTIBLE_GLASS_CANNON,CollectibleType.COLLECTIBLE_UNICORN_STUMP,CollectibleType.COLLECTIBLE_CONVERTER,CollectibleType.COLLECTIBLE_SCISSORS,CollectibleType.COLLECTIBLE_BOOK_OF_BELIAL,CollectibleType.COLLECTIBLE_NECRONOMICON,CollectibleType.COLLECTIBLE_BOOK_OF_THE_DEAD,CollectibleType.COLLECTIBLE_UNDEFINED,CollectibleType.COLLECTIBLE_DIPLOPIA,CollectibleType.COLLECTIBLE_DELIRIOUS,CollectibleType.COLLECTIBLE_POTATO_PEELER,CollectibleType.COLLECTIBLE_PLAN_C,CollectibleType.COLLECTIBLE_MAGIC_FINGERS,CollectibleType.COLLECTIBLE_D4,CollectibleType.COLLECTIBLE_PLACEBO,CollectibleType.COLLECTIBLE_SACRIFICIAL_ALTAR}
require("ir_config_menu")
Isaac.ConsoleOutput("Items Reforged v" .. IR.Config.Version .. ": Check out Isaac Reforged!\n")

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
        if IR.MCMLoaded then
            local savedIRConfig = IR.GameState.Config
            if savedIRConfig.Version == IR.Config.Version then
                for key, value in pairs(IR.Config) do
                    IR.Config[key] = savedIRConfig[key]
                end
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
    IR.GameState.Config = IR.Config
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
            IR.monstermanual.fList = {}
            IR.HasDadsLostCoin = false
            IR.monstermanual.famRNG:SetSeed(player.InitSeed, math.random(10000))
            player:AddCacheFlags(CacheFlag.CACHE_FAMILIARS) 
            player:EvaluateItems()
        end
    end
    IR.EntityList.Tears = Isaac.FindByType(EntityType.ENTITY_TEAR, -1, -1, false, false)
    IR.EntityList.Enemies = Isaac.FindInRadius(Vector(640, 560), 750, EntityPartition.ENEMY)
    IR.EntityList.Familiars = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, -1, -1, false, false)
    IR.EntityList.Pickups = Isaac.FindByType(EntityType.ENTITY_PICKUP, -1, -1, false, false)
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        if not player:GetActiveItem() == CollectibleType.COLLECTIBLE_BEAN or not player:GetActiveItem() == CollectibleType.COLLECTIBLE_KIDNEY_BEAN or not player:GetActiveItem() == CollectibleType.COLLECTIBLE_MEGA_BEAN then
            IR.ActiveItemTimer = 0
        end
        ---------------------
        -- Dad's Lost Coin --
        ---------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_DADS_LOST_COIN) then
            local numCoins = player:GetNumCoins()
            if not IR.HasDadsLostCoin then
                IR.HasDadsLostCoin = true
                player.Luck = player.Luck + (numCoins * IR.Config["DadsLostCoinLuck"])
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
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_BREATH_OF_LIFE then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER) or IR.monstermanual.MMholywater == true then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_PLAYER then
                    local data = entity:GetData()
                    local tear = entity:ToTear()
                    if data.initPool == nil then
                        tear.TearFlags = player.TearFlags | 1 << 1
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_ABEL) then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.ABEL and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.Scale = 1.1
                    tear.TearFlags = 1 << 60
                    tear.CollisionDamage = math.max((player.Damage/2),(3.5))
                end
            end
        end
        -------------------
        -- Brother Bobby --
        -------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BROTHER_BOBBY) then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_SISTER_MAGGY) then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerVariant == FamiliarVariant.SISTER_MAGGY and entity.FrameCount < 1 then
                    local tear = entity:ToTear()
                    tear.Scale = 1.1
                    tear.CollisionDamage = math.max((player.Damage/2),5)
                end
            end
        end
        ------------------
        -- Glass Cannon --
        ------------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_GLASS_CANNON then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_ISAACS_HEART) then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_PLAYER then
                    local data = entity:GetData()
                    local tear = entity:ToTear()
                    if data.initHeart == nil then
                        if math.random(10) < (IR.Config["IsaacsHeartChance"] + 1) then
                            tear.TearFlags = player.TearFlags | 1 << 15
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
        if IR.dataminer.DMroom == Game():GetLevel():GetCurrentRoomIndex() and IR.dataminer.usedDM == true then
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
            if IR.dataminer.hadModem == false and IR.dataminer.usedDM == true then
                player:RemoveCollectible(CollectibleType.COLLECTIBLE_BROKEN_MODEM)
                IR.dataminer.usedDM = false
            end
        end
        ----------------
        -- Cursed Eye --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_CURSED_EYE) then
            for _, entity in ipairs(IR.EntityList.Tears) do
                if entity.SpawnerType == EntityType.ENTITY_PLAYER then
                    local data = entity:GetData()
                    local tear = entity:ToTear()
                    if data.initCursedEye == nil then
                        if math.random(10) < (IR.Config["CursedEyeChance"] + 1) then
                            tear.TearFlags = player.TearFlags | 1 << 45
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HALLOWED_GROUND) then
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_HALLOWED_GROUND)
            player:AddCollectible(IR.hallowedground.Item, 1, false)
        end
        if player:GetActiveItem() == IR.hallowedground.Item and not IR.hallowedground.hasHallow then
            player:RemoveCollectible(IR.hallowedground.Item)
            player:AddCollectible(IR.hallowedground.Item, 1, false)
            IR.hallowedground.hasHallow = true
        end
        -----------------
        -- God's Flesh --
        -----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_GODS_FLESH) then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MONSTER_MANUAL) then
            player:RemoveCollectible(CollectibleType.COLLECTIBLE_MONSTER_MANUAL)
            player:AddCollectible(IR.monstermanual.Item, 3, false)
        end
        --------------
        -- Best Bud --
        --------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BEST_BUD) then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_TINY_PLANET) then
            for _, entity in ipairs(IR.EntityList.Tears) do
                local data = entity:GetData()
                local tear = entity:ToTear()
                if entity.SpawnerType == EntityType.ENTITY_PLAYER and entity.FrameCount < 1 and data.initPlanet == nil then
                    tear.Position = Vector(player.Position.X + math.cos(0.15 * player.FrameCount) * math.random(60,120), player.Position.Y + math.sin(0.15 * player.FrameCount) * math.random(60,120))
                    tear.FallingSpeed = 0
                    tear.FallingAcceleration = -0.1
                    data.initPlanet = 1
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
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_MEGA_BEAN and player:GetActiveCharge() < 4 and IR.ActiveItemTimer == 0 then
            player:SetActiveCharge(player:GetActiveCharge() + 1)
            SFXManager():Stop(SoundEffect.SOUND_BEEP, 1.0, 0, false, 1.0)
            IR.ActiveItemTimer = 180
        elseif IR.ActiveItemTimer > 0 then
            IR.ActiveItemTimer = IR.ActiveItemTimer - 1
        end
        ---------------
        -- Mom's Pad --
        ---------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_MOMS_PAD and IR.ActiveItemRoom == Game():GetLevel():GetCurrentRoomIndex() and Game():GetLevel():GetCurrentRoomDesc().Clear == false and IR.Config["MomsPadFear"] then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() == true and entity:IsBoss() == false then
                    if entity:HasEntityFlags(1<<11) == false then
                        entity:AddEntityFlags(1<<11)
                    end
                end
            end
        end
        ---------------
        -- Mom's Bra --
        ---------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_MOMS_BRA and IR.ActiveItemRoom == Game():GetLevel():GetCurrentRoomIndex() and Game():GetLevel():GetCurrentRoomDesc().Clear == false and IR.Config["MomsBraSlow"] then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() == true and entity:IsBoss() == false then
                    if entity:HasEntityFlags(1<<5) == false then
                        entity:AddEntityFlags(1<<7)
                    end
                end
            end
        end
        --------------
        -- Scissors --
        --------------
        if player:GetActiveItem() == CollectibleType.COLLECTIBLE_SCISSORS then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR) and player:HasCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE) == false then
            for _, entity in ipairs(IR.EntityList.Tears) do
                local data = entity:GetData()
                local tear = entity:ToTear()
                if entity.SpawnerType == EntityType.ENTITY_PLAYER and entity.FrameCount < 1 and data.initStrange == nil then
                    tear.TearFlags = ((player.TearFlags % ((1 << 23) + (1 << 23)) >= (1 << 23)) and player.TearFlags - (1 << 23) or player.TearFlags)
                    data.initStrange = 1
                elseif entity.SpawnerType == EntityType.ENTITY_PLAYER and entity.FrameCount > IR.Config["StrangeAttractorDist"] and data.initStrange ~= nil then
                    tear.TearFlags = player.TearFlags | 1 << 23
                end
            end
        end
        ------------
        -- Plan C --
        ------------
        if IR.planc.usedPlanC == true and player:IsDead() then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_FAST_BOMBS) and player:HasCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS) and not IR.fastbombs.hasEpicFetus then
            player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
            player:EvaluateItems()
            IR.fastbombs.hasEpicFetus = true
        end
        if player:HasCollectible(CollectibleType.COLLECTIBLE_FAST_BOMBS) and player:HasCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS) and not IR.fastbombs.hasDrFetus then
            player:AddCacheFlags(CacheFlag.CACHE_FIREDELAY)
            player:EvaluateItems()
            IR.fastbombs.hasDrFetus = true
        end
        ---------------
        -- King Baby --
        ---------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY) and IR.kingbaby.proccessFamiliars then
            local index = 1
            for _, entity in ipairs(IR.EntityList.Familiars) do
                familiar = entity:ToFamiliar()
                if (familiar.IsFollower or familiar.Variant == FamiliarVariant.ISAACS_HEART) and familiar.Variant ~= FamiliarVariant.KING_BABY then
                    familiar:GetData().OrbitIndex = index
                    index = index + 1
                end
            end
            IR.kingbaby.proccessFamiliars = false
        elseif player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY) then
            for _, entity in ipairs(EntityType.ENTITY_FAMILIAR, FamiliarVariant.KING_BABY, -1, false, false) do
                entity:ToFamiliar():FollowParent()
            end
        end
        -------------
        -- Magneto --
        -------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGNETO) then
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
    end
end

IR:AddCallback(ModCallbacks.MC_POST_UPDATE, IR.onUpdate)

-----------------------------
-- Replacing Vanilla Items --
-----------------------------
function IR:onMorph(_, variant, subtype)
    if variant == PickupVariant.PICKUP_COLLECTIBLE and subtype == CollectibleType.COLLECTIBLE_HALLOWED_GROUND then
        return {PickupVariant.PICKUP_COLLECTIBLE, IR.hallowedground.Item}
    elseif variant == PickupVariant.PICKUP_COLLECTIBLE and subtype == CollectibleType.COLLECTIBLE_MONSTER_MANUAL then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY) and entity.Variant ~= FamiliarVariant.KING_BABY then
            local target = (Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.KING_BABY, -1, false, false))[1]
            local data = entity:GetData()
            if (entity.IsFollower or entity.Variant == FamiliarVariant.ISAACS_HEART) and entity.Variant ~= FamiliarVariant.KEY_FULL and target ~= nil then
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
    local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_DEAD_SEA_SCROLLS)
    SFXManager():Play(SoundEffect.SOUND_BOSS_LITE_HISS, 1.0, 0, false, 1.0)
    player:UseActiveItem(IR.DeadSeaScrolls[math.random(#IR.DeadSeaScrolls)], false, false, false, false)
    return true
end

IR:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, IR.onDSS, CollectibleType.COLLECTIBLE_DEAD_SEA_SCROLLS)

--------------
-- Scissors --
--------------
function IR:onScissors()
    local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_SCISSORS)
    local Pool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector(0,0), player):ToEffect()
    Pool.CollisionDamage = player.Damage / 4
    Pool:SetColor(Color(1.0,0.1,0.1,0.6,0,0,0),0,0,false,false)
    Pool:SetTimeout(10000)
    Pool.Scale = 4 
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onScissors, CollectibleType.COLLECTIBLE_SCISSORS)

----------------------
-- Guppy's Hairball --
----------------------
function IR:onRoom()
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        if player:HasCollectible(CollectibleType.COLLECTIBLE_GUPPYS_HAIRBALL) and Game():GetLevel():GetCurrentRoomDesc().VisitedCount == 1 then
            local num = Game():GetLevel():GetCurrentRoom():GetAliveEnemiesCount()
            if num > 0 then
                player:AddBlueFlies(math.random(math.ceil(num/2),num), player.Position, player)
            end
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER) or IR.monstermanual.MMholywater == true then
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
        if player:HasCollectible(CollectibleType.COLLECTIBLE_MISSING_PAGE_2) and entity.Type == EntityType.ENTITY_PLAYER then
            for _, entity in ipairs(IR.EntityList.Enemies) do
                if entity:IsVulnerableEnemy() then
                    entity:TakeDamage(5.0, 0, EntityRef(player), 0)
                end
            end
        end
        ----------------
        -- Dead Tooth --
        ----------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_DEAD_TOOTH) and entity:IsVulnerableEnemy() and entity:HasEntityFlags(EntityFlag.FLAG_POISON) then
            for entity, target in pairs(Isaac.FindInRadius(player.Position, 50, EntityPartition.ENEMY)) do
                target:AddEntityFlags(1<<23)
            end
        end
    end
end

IR:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, IR.onDamage)

---------------
-- Mom's Pad --
---------------
function IR:onMomsPad()
    IR.ActiveItemRoom = Game():GetLevel():GetCurrentRoomIndex()
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onMomsPad, CollectibleType.COLLECTIBLE_MOMS_PAD)

---------------
-- Mom's Bra --
---------------
function IR:onMomsBra()
    IR.ActiveItemRoom = Game():GetLevel():GetCurrentRoomIndex()
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onMomsBra, CollectibleType.COLLECTIBLE_MOMS_BRA)

---------------------
-- Hallowed Ground --
---------------------
function IR:onHallowed()
    SFXManager():Play(SoundEffect.SOUND_FART, 1.0, 0, false, 1.0)
    local player = GetPlayerUsingActive(IR.hallowedground.Item)
    local room = Game():GetRoom()
    local pos = findFreeTile(player.Position)
    if pos ~= false then
        room:SpawnGridEntity(pos, GridEntityType.GRID_POOP, 6, 0, 0)
    end
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onHallowed, IR.hallowedground.Item)

--------------
-- The Poop --
--------------
function IR:onPoop()
    local player = GetPlayerUsingActive(CollectibleType.COLLECTIBLE_POOP)
    local Pool = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_LEMON_MISHAP, 0, player.Position, Vector(0,0), player):ToEffect()
    Pool.CollisionDamage = player.Damage / 3
    Pool:SetColor(Color(0.0,0.0,0.0,1.0,160,82,45),0,0,false,false)
    Pool.Scale = 2
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onPoop, CollectibleType.COLLECTIBLE_POOP)

function IR:onNewLevel()
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        --------------------
        -- Monster Manual --
        --------------------
        IR.monstermanual.fList = {}
        IR.monstermanual.MMholywater = false
        player:AddCacheFlags(CacheFlag.CACHE_FAMILIARS)
        player:EvaluateItems()
    end
end

IR:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, IR.onNewLevel)

------------
-- Plan C --
------------
function IR:onPlanC()
    IR.planc.usedPlanC = true
end

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onPlanC, CollectibleType.COLLECTIBLE_PLAN_C)

--------------------
-- Monster Manual --
--------------------
function IR:onMonsterMan()
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

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onMonsterMan, IR.monstermanual.Item)

function IR:onPill()
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum - 1)
        ------------------
        -- Little Baggy --
        ------------------
        if player:HasCollectible(CollectibleType.COLLECTIBLE_LITTLE_BAGGY) then
            player:AddSoulHearts(1)
        end
    end
end

IR:AddCallback(ModCallbacks.MC_USE_PILL, IR.onPill)

---------------
-- Dataminer --
---------------
function IR:onDataminer()
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

IR:AddCallback(ModCallbacks.MC_USE_ITEM, IR.onDataminer, CollectibleType.COLLECTIBLE_DATAMINER)

function IR:onCache(player, flag)
    ---------------
    -- Trisagion --
    ---------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_TRISAGION) then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 1.33
        end
    end
    ----------------
    -- Cursed Eye --
    ----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_CURSED_EYE) then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + 1
        end
    end
    -----------------
    -- Tiny Planet --
    -----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_TINY_PLANET) then
        if flag == CacheFlag.CACHE_FIREDELAY then
            player.MaxFireDelay = player.MaxFireDelay - 1
        elseif flag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - 32.25
        elseif flag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed - 0.15
        elseif flag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | 1 | 1 << 1 
        end
    end
    if flag == CacheFlag.CACHE_FAMILIARS then
        --------------------
        -- Monster Manual --
        --------------------
        for _, data in ipairs(IR.monstermanual.fList) do
            IR.monstermanual.fNum = Isaac.CountEntities(player, EntityType.ENTITY_FAMILIAR, data, -1) + 1
            player:CheckFamiliar(data, IR.monstermanual.fNum, IR.monstermanual.famRNG)
            if data == 25 and IR.monstermanual.fNum > 0 then
                IR.monstermanual.MMholywater = true
            end
        end
        ---------------
        -- King Baby --
        ---------------
        IR.kingbaby.proccessFamiliars = true
    end
    -----------------------
    -- Strange Attractor --
    -----------------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_STRANGE_ATTRACTOR) then
        if flag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 1.2
        end
    end
    ----------------
    -- Fast Bombs --
    ----------------
    if player:HasCollectible(CollectibleType.COLLECTIBLE_FAST_BOMBS) then
        if player:HasCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS) or player:HasCollectible(CollectibleType.COLLECTIBLE_DR_FETUS) then
            if flag == CacheFlag.CACHE_FIREDELAY then
                player.MaxFireDelay = player.MaxFireDelay - 21
            end
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
    return Isaac.GetPlayer(0)
end