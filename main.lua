local EverlastingSummer = RegisterMod("EverlastingSummer",1)
local costume = Isaac.GetCostumeIdByPath("gfx/characters/AliceHair.anm2")
local costume = Isaac.GetCostumeIdByPath("gfx/characters/YulyaHair.anm2")
local costume = Isaac.GetCostumeIdByPath("gfx/characters/LenaHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/SemyonHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/UlyanaHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/MikuHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/ElektronikHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/ShurikHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/SlavyaHair.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/MikuULF.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/AlisaHappy.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/LenaEvil.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/AlisaSharingan.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/LenaRinnegan.anm2")
local cosutme = Isaac.GetCostumeIdByPath("gfx/characters/flight.anm2")
	local playerYulya = Isaac.GetPlayerTypeByName("Yulya")
	local playerShurik = Isaac.GetPlayerTypeByName("Shurik")
	local playerSlavya = Isaac.GetPlayerTypeByName("Slavya")
	local playerElektronik = Isaac.GetPlayerTypeByName("Elektronik")
	local playerMiku = Isaac.GetPlayerTypeByName("Miku")
	local playerSemyon = Isaac.GetPlayerTypeByName("Semyon")
	local playerUlyana = Isaac.GetPlayerTypeByName("Ulyana")
	local playerLena = Isaac.GetPlayerTypeByName("Lena")
	local playerAlisa = Isaac.GetPlayerTypeByName("Alisa")
		local COLLECTIBLE_ELECTRIC_GUITAR = Isaac.GetItemIdByName("Electric Guitar")
		local COLLECTIBLE_EVERLASTING_VODKA = Isaac.GetItemIdByName("Everlasting Vodka")
		local COLLECTIBLE_ROBOTHEAD = Isaac.GetItemIdByName("Robot Head")
		local COLLECTIBLE_ROBOTHEAD2 = Isaac.GetItemIdByName("New Robot Head")
		local COLLECTIBLE_ROBOTHEAD3 = Isaac.GetItemIdByName("Ultimate Robot Head")
		local COLLECTIBLE_CHIP = Isaac.GetItemIdByName("Chip")
		local COLLECTIBLE_CHIP2 = Isaac.GetItemIdByName("Upgraded Chip")
		local COLLECTIBLE_BOMB = Isaac.GetItemIdByName("Alisa's Bomb")
		local COLLECTIBLE_KEY = Isaac.GetItemIdByName("Dining Room Key")
		local COLLECTIBLE_SUGAR = Isaac.GetItemIdByName("Sugar")
		local COLLECTIBLE_PSYCHO = Isaac.GetItemIdByName("Psycho Mode")
		local COLLECTIBLE_CLASSIC_GUITAR = Isaac.GetItemIdByName("Classic Guitar")
		local COLLECTIBLE_STOLEN_CANDY = Isaac.GetItemIdByName("Stolen Candy")
		local COLLECTIBLE_ALISA_SHARINGAN = Isaac.GetItemIdByName("Alisa's Mangekyou Sharingan")
		local COLLECTIBLE_LENA_RINNEGAN = Isaac.GetItemIdByName("Lena Rinnegan")
		local COLLECTIBLE_KNIFE = Isaac.GetItemIdByName("Knife")
		local COLLECTIBLE_SINTEZATOR = Isaac.GetItemIdByName("Sintezator")
		local COLLECTIBLE_SHUTTLECOCK = Isaac.GetItemIdByName("Shuttlecock")
		local COLLECTIBLE_FLARE_GUN = Isaac.GetItemIdByName("Flare Gun")
		local COLLECTIBLE_GWTW = Isaac.GetItemIdByName("Gone With The Wind")
		local COLLECTIBLE_SHARD = Isaac.GetItemIdByName("Glass Shard")
		local COLLECTIBLE_FITTINGS = Isaac.GetItemIdByName("Fittings")
		local COLLECTIBLE_BUS = Isaac.GetItemIdByName("410 Bus")
		local COLLECTIBLE_GENDA = Isaac.GetItemIdByName("Genda")
			local FRIENDS = Isaac.GetEntityVariantByName("Rinnegan Portal")
			local DvachVariant = Isaac.GetEntityVariantByName("Dvach")
			local LenaVariant = Isaac.GetEntityVariantByName("Lenka")
			local ICARUS = Isaac.GetEntityVariantByName("Bus")
			local GENDA = Isaac.GetEntityVariantByName("Genda")
			local FITTINGS = Isaac.GetEntityVariantByName("Fittings")
				local ULYANACARD = Isaac.GetCardIdByName("Ulyana Card")
				local YULYACARD = Isaac.GetCardIdByName("Yulya Card")
				local LENACARD = Isaac.GetCardIdByName("Lena Card")
				local ALISACARD = Isaac.GetCardIdByName("Alisa Card")
local PORTAL = 306
local game = Game()
local sfxManager = SFXManager()
local zero = Vector(0,0)
local playanimation = -9
local animation = Sprite()
local CH = 1;
local HC = nil
local ChanceUlyanaCard = 30
local ChanceYulyaCard = 30
local ChanceLenaCard = 30
local ChanceAlisaCard = 30
local UlyanaCardActivated = false
local YulyaCardActivated = false
local LenaCardActivated = false
local AlisaCardActivated = false
	local tears = 4
	local punchdamage = 3
	local stick = {nil,nil,nil,nil}
	local cooldown = {0,0,0,0}
	local render = {0,0,0,0}
	local sprite = {nil,nil,nil,nil}
local time = 0;
local hold = false;
local ready = false;
local laser = {};
local prism = {};

SoundEffect.DING = Isaac.GetSoundIdByName("Ding")
SoundEffect.SHARINGAN = Isaac.GetSoundIdByName("Sharingan")
SoundEffect.RINNEGAN = Isaac.GetSoundIdByName("Rinnegan")
SoundEffect.CAR = Isaac.GetSoundIdByName("Car")
SoundEffect.BEEP = Isaac.GetSoundIdByName("Beep")
SoundEffect.SET = Isaac.GetSoundIdByName("Set")
SoundEffect.PRESS = Isaac.GetSoundIdByName("Press")
SoundEffect.DROP = Isaac.GetSoundIdByName("Drop")
SoundEffect.FALL = Isaac.GetSoundIdByName("Fall")
SoundEffect.UPGRADE = Isaac.GetSoundIdByName("Upgrade")
SoundEffect.EXPLOSION = Isaac.GetSoundIdByName("Explosion")

--------------------------------------------------------------------------------------------------STARTING ITEMS--------------------------------------------------------------------------------------------------------------------

function EverlastingSummer:Items() -- Alisa Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Alisa") then
	player:AddCollectible(COLLECTIBLE_ELECTRIC_GUITAR, 4, false)
	player:AddCollectible(COLLECTIBLE_EVERLASTING_VODKA, 4, false)
	player:AddCard(ALISACARD)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items()-- Lena Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Lena") then
	player:AddCollectible(COLLECTIBLE_KNIFE, 4, false)
	player:AddCollectible(COLLECTIBLE_GWTW, 4, false)
	player:AddCard(LENACARD)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items()-- Semyon Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Semyon") then
	player:AddCollectible(COLLECTIBLE_BUS, 4, false)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items()-- Ulyana Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Ulyana") then
	player:AddCollectible(COLLECTIBLE_STOLEN_CANDY, 4, false)
	player:AddCard(ULYANACARD)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items() -- Miku Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Miku") then
	player:AddCollectible(COLLECTIBLE_SINTEZATOR, 4, false)
	player:AddCollectible(COLLECTIBLE_CLASSIC_GUITAR, 4, false)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items() -- Elektronik Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Elektronik") then
	player:AddCollectible(COLLECTIBLE_ROBOTHEAD, 4, false)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items() -- Shurik Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Shurik") then
	player:AddCollectible(COLLECTIBLE_FITTINGS, 4, false)
	player:AddCollectible(COLLECTIBLE_PSYCHO, 4, false)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items() -- Slavya Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Slavya") then
	player:AddCollectible(COLLECTIBLE_KEY, 4, false)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)
function EverlastingSummer:Items() -- Yulya Starting Items
    local player = Isaac.GetPlayer(0);
    if (player:GetName() == "Yulya") then
	player:AddCollectible(COLLECTIBLE_SUGAR, 4, false)
	player:AddCard(YULYACARD)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, EverlastingSummer.Items)

--------------------------------------------------------------------------------------------------------------HAIRS-----------------------------------------------------------------------------------------------------------------

function EverlastingSummer:Costumes() -- Alisa Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Alisa") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/AliceHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Lena Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Lena") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/LenaHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Semyon Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Semyon") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/SemyonHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Ulyana Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Ulyana") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/UlyanaHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Miku Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Miku") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/MikuHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Elektronik Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Elektronik") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/ElektronikHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Shurik Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Shurik") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/ShurikHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Slavya Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Slavya") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/SlavyaHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)
function EverlastingSummer:Costumes() -- Yulya Hair
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Yulya") then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/YulyaHair.anm2"))
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.Costumes)

--------------------------------------------------------------------------------------------------------------STATS-----------------------------------------------------------------------------------------------------------------

function EverlastingSummer:AlisaStats(player, cacheFlag) -- Alisa Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Alisa" then
    player.TearColor = Color(1.2, 0.53, 0, 1, 0, 0, 0);
		end
    end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.AlisaStats)
function EverlastingSummer:LenaStats(player, cacheFlag) -- Lena Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Lena" then
    player.TearColor = Color(0.30, 0.17, 0.58, 1, 0, 0, 0);
    if cacheFlag == CacheFlag.CACHE_FIREDELAY then
      player.MaxFireDelay = player.MaxFireDelay + 1
	  end
	  if cacheFlag == CacheFlag.CACHE_SPEED then
		player.MoveSpeed = player.MoveSpeed - 0.50
		end
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.LenaStats)
function EverlastingSummer:SemyonStats(player, cacheFlag) -- Semyon Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Semyon" then
    player.TearColor = Color(0.45, 0.25, 0.22, 1, 0, 0, 0);
		end
    end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.SemyonStats)
function EverlastingSummer:UlyanaStats(player, cacheFlag) -- Ulyana Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Ulyana" then
    player.TearColor = Color(0.97, 0.14, 0.14, 1, 0, 0, 0);
    if cacheFlag == CacheFlag.CACHE_SPEED then
		player.MoveSpeed = player.MoveSpeed + 0.75
		end
	if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage - 1;
		end
	if cacheFlag == CacheFlag.CACHE_FIREDELAY then
      player.MaxFireDelay = player.MaxFireDelay - 2
	  end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.UlyanaStats)
function EverlastingSummer:MikuStats(player, cacheFlag) -- Miku Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Miku" then
    player.TearColor = Color(0.36, 0.86, 0.81, 1, 0, 0, 0);
	if cacheFlag == CacheFlag.CACHE_FIREDELAY then
      player.MaxFireDelay = player.MaxFireDelay - 1
	  end
	   if cacheFlag == CacheFlag.CACHE_SPEED then
		player.MoveSpeed = player.MoveSpeed + 0.50
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.MikuStats)
function EverlastingSummer:ElektronikStats(player, cacheFlag) -- Elektronik Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Elektronik" then
    player.TearColor = Color(0.97, 0.94, 0.64, 1, 0, 0, 0);
	if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage - 0.50;
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.ElektronikStats)
function EverlastingSummer:ShurikStats(player, cacheFlag) -- Shurik Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Shurik" then
   player.TearColor = Color(0.97, 0.94, 0.64, 1, 0, 0, 0);
   if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage - 1;
	  end
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.ShurikStats)
function EverlastingSummer:SlavyaStats(player, cacheFlag) -- Slavya Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Slavya" then
    player.TearColor = Color(1, 0.64, 0.14, 1, 0, 0, 0);
	if cacheFlag == CacheFlag.CACHE_FIREDELAY then
        player.MaxFireDelay = player.MaxFireDelay + 1;
		end
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage - 0.75;
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.SlavyaStats)
function EverlastingSummer:YulyaStats(player, cacheFlag) -- Yulya Stats
  local player = Isaac.GetPlayer(0)	
  if player:GetName() == "Yulya" then
    player.TearColor = Color(0.45, 0.25, 0.22, 1, 0, 0, 0);
	if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage + 0.50;
		end
	if cacheFlag == CacheFlag.CACHE_LUCK then
        player.Luck = player.Luck + 2;
	  end
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.YulyaStats)

--------------------------------------------------------------------------------------------------------------ITEMS-----------------------------------------------------------------------------------------------------------------

-----------Electric Guitar-----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    local player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_ELECTRIC_GUITAR) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player.Damage = player.Damage + 0.50
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-----------Alisa Bomb-----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_BOMB) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player:AddBombs(10)
		sfxManager:Play(SoundEffect.PRESS, 3, 1, false, 1)
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-----------Vodka--------
function EverlastingSummer:UseVodka()
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
		for i=1, #entities do
		if (entities[i]:IsVulnerableEnemy()) then
		entities[i]:AddConfusion(EntityRef(player), 100, 10)
		end
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseVodka, COLLECTIBLE_EVERLASTING_VODKA)
function EverlastingSummer:UseVodka()
	local	player = Isaac.GetPlayer(0)
		if player:HasCollectible(COLLECTIBLE_EVERLASTING_VODKA) then
		sfxManager:Play(SoundEffect.DING, 3, 0, false, 1)
		end
	end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseVodka, COLLECTIBLE_EVERLASTING_VODKA)

---------Robot(LVL 1)--------
function EverlastingSummer:UseRobot()
	local player = Isaac.GetPlayer(0)
	local pos = Vector(player.Position.X, player.Position.Y-75);
	local t = 30;
	local v = 2;
	local r = 0.25;
	laser[0]=EntityLaser.ShootAngle(v,pos,0,t,Vector.FromAngle(45)*r,player);
	laser[1]=EntityLaser.ShootAngle(v,pos,90,t,Vector.FromAngle(225)*r,player);
	laser[2]=EntityLaser.ShootAngle(v,pos,180,t,Vector.FromAngle(45)*r,player);
	laser[3]=EntityLaser.ShootAngle(v,pos,270,t,Vector.FromAngle(225)*r,player);
	ready = true;
	for i = 0,3 do
		laser[i].CollisionDamage = player.Damage*1.25
	end
	if not hold then
		player:AnimateCollectible(COLLECTIBLE_ROBOTHEAD, "LiftItem", "Idle");
		hold = true;
		time = 50;
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseRobot, COLLECTIBLE_ROBOTHEAD)
function update(_, player)
	local player = Isaac.GetPlayer( 0 );
	if hold then
		time = time - 1;
		if time<1 and hold then
			player:AnimateCollectible(COLLECTIBLE_ROBOTHEAD, "HideItem", "Idle");
			hold = false;
		end
	elseif not hold and ready then
		for i = 0,3 do
   			laser[i]:Remove()
   		end
   	end		
end

---------Robot(LVL 2)--------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if player:HasCollectible(COLLECTIBLE_ROBOTHEAD) and player:HasCollectible(COLLECTIBLE_CHIP) then
	player:RemoveCollectible(COLLECTIBLE_ROBOTHEAD)
	player:AddCollectible(COLLECTIBLE_ROBOTHEAD2, 0, false)
	sfxManager:Play(SoundEffect.UPGRADE, 3, 0, false, 1)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:UseRobot2()
	local player = Isaac.GetPlayer(0)
	local pos = Vector(player.Position.X, player.Position.Y-75);
	local t = 30;
	local v = 2;
	local r = 0.30;
	laser[0]=EntityLaser.ShootAngle(v,pos,0,t,Vector.FromAngle(45)*r,player);
	laser[1]=EntityLaser.ShootAngle(v,pos,45,t,Vector.FromAngle(135)*r,player);
	laser[2]=EntityLaser.ShootAngle(v,pos,90,t,Vector.FromAngle(225)*r,player);
	laser[3]=EntityLaser.ShootAngle(v,pos,135,t,Vector.FromAngle(315)*r,player);
	laser[4]=EntityLaser.ShootAngle(v,pos,180,t,Vector.FromAngle(45)*r,player);
	laser[5]=EntityLaser.ShootAngle(v,pos,225,t,Vector.FromAngle(135)*r,player);
	laser[6]=EntityLaser.ShootAngle(v,pos,270,t,Vector.FromAngle(225)*r,player);
	laser[7]=EntityLaser.ShootAngle(v,pos,315,t,Vector.FromAngle(315)*r,player);
	ready = true;
	for i = 0,7 do
		laser[i].CollisionDamage = player.Damage*1.25
	end
	if not hold then
		player:AnimateCollectible(COLLECTIBLE_ROBOTHEAD2, "LiftItem", "Idle");
		hold = true;
		time = 75;
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseRobot2, COLLECTIBLE_ROBOTHEAD2)
function update(_, player)
	local player = Isaac.GetPlayer( 0 );
	if hold then
		time = time - 1;
		if time<1 and hold then
			player:AnimateCollectible(COLLECTIBLE_ROBOTHEAD2, "HideItem", "Idle");
			hold = false;
		end
	elseif not hold and ready then
		for i = 0,7 do
   			laser[i]:Remove()
   		end
   	end		
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_UPDATE, update)

---------Robot(LVL 3)--------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if player:HasCollectible(COLLECTIBLE_ROBOTHEAD) and player:HasCollectible(COLLECTIBLE_CHIP2) then
	player:RemoveCollectible(COLLECTIBLE_ROBOTHEAD)
	player:AddCollectible(COLLECTIBLE_ROBOTHEAD3, 0, false)
	sfxManager:Play(SoundEffect.UPGRADE, 3, 0, false, 1)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if player:HasCollectible(COLLECTIBLE_ROBOTHEAD2) and player:HasCollectible(COLLECTIBLE_CHIP2) then
	player:RemoveCollectible(COLLECTIBLE_ROBOTHEAD2)
	player:AddCollectible(COLLECTIBLE_ROBOTHEAD3, 0, false)
	sfxManager:Play(SoundEffect.UPGRADE, 3, 0, false, 1)
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:UseRobot3()
	local player = Isaac.GetPlayer(0)
	local pos = Vector(player.Position.X, player.Position.Y-75);
	local t = 30;
	local v = 2;
	local r = 0.45;
	laser[0]=EntityLaser.ShootAngle(v,pos,0,t,Vector.FromAngle(45)*r,player);
	laser[1]=EntityLaser.ShootAngle(v,pos,22.5,t,Vector.FromAngle(90)*r,player);
	laser[2]=EntityLaser.ShootAngle(v,pos,45,t,Vector.FromAngle(135)*r,player);
	laser[3]=EntityLaser.ShootAngle(v,pos,67.5,t,Vector.FromAngle(180)*r,player);
	laser[4]=EntityLaser.ShootAngle(v,pos,90,t,Vector.FromAngle(225)*r,player);
	laser[5]=EntityLaser.ShootAngle(v,pos,112.5,t,Vector.FromAngle(270)*r,player);
	laser[6]=EntityLaser.ShootAngle(v,pos,135,t,Vector.FromAngle(315)*r,player);
	laser[7]=EntityLaser.ShootAngle(v,pos,157.5,t,Vector.FromAngle(360)*r,player);
	laser[8]=EntityLaser.ShootAngle(v,pos,180,t,Vector.FromAngle(45)*r,player);
	laser[9]=EntityLaser.ShootAngle(v,pos,202.5,t,Vector.FromAngle(90)*r,player);
	laser[10]=EntityLaser.ShootAngle(v,pos,225,t,Vector.FromAngle(135)*r,player);
	laser[11]=EntityLaser.ShootAngle(v,pos,247.5,t,Vector.FromAngle(180)*r,player);
	laser[12]=EntityLaser.ShootAngle(v,pos,270,t,Vector.FromAngle(225)*r,player);
	laser[13]=EntityLaser.ShootAngle(v,pos,292.5,t,Vector.FromAngle(270)*r,player);
	laser[14]=EntityLaser.ShootAngle(v,pos,315,t,Vector.FromAngle(315)*r,player);
	laser[15]=EntityLaser.ShootAngle(v,pos,337.5,t,Vector.FromAngle(360)*r,player);
	ready = true;
	for i = 0,15 do
		laser[i].CollisionDamage = player.Damage*1.25
	end
	if not hold then
		player:AnimateCollectible(COLLECTIBLE_ROBOTHEAD3, "LiftItem", "Idle");
		hold = true;
		time = 100;
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseRobot3, COLLECTIBLE_ROBOTHEAD3)
function update(_, player)
	local player = Isaac.GetPlayer(0)
	if hold then
		time = time - 1;
		if time <1 and hold then
			player:AnimateCollectible(COLLECTIBLE_ROBOTHEAD3,"HideItem", "Idle");
			hold = false;
		end
	elseif not hold and ready then
		for i = 0,15 do
   			laser[i]:Remove()
   		end
   	end		
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_UPDATE, update)

-----------Knife----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_KNIFE) then
        if (cacheFlag == CacheFlag.CACHE_DAMAGE) then
		player.Damage = player.Damage + 1.50;
        end
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-----------Infinity Key----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_KEY) then
		if cacheFlag == CacheFlag.CACHE_SPEED then
        player:AddKeys(99)
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-----------Glass Shard----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_SHARD) then
        if (cacheFlag == CacheFlag.CACHE_DAMAGE) then
		player.Damage = player.Damage + 0.75;
        end
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

----------Candy---------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_STOLEN_CANDY) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player:AddSoulHearts(2)
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

----------Sugar---------
function EverlastingSummer:UseSugar()
	local	player = Isaac.GetPlayer(0)
		if player:HasCollectible(COLLECTIBLE_SUGAR) then
		player:AddGoldenHearts(1)
		end
	end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseSugar, COLLECTIBLE_SUGAR)

-----------Chip----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_CHIP) then
        if (cacheFlag == CacheFlag.CACHE_RANGE) then
		player.TearFallingSpeed = player.TearFallingSpeed + 0.10;
        end
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-----------Upgraded Chip----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_CHIP2) then
        if (cacheFlag == CacheFlag.CACHE_LUCK) then
		player.Luck = player.Luck + 1.00;
        end
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

---------Gone With he Wind---------
function EverlastingSummer:UseGWTW()
	local player = Isaac.GetPlayer(0)
	local chance = math.random(0, 5)
	local Position = game:GetRoom():FindFreePickupSpawnPosition(player.Position, 1, true);
		if player:HasCollectible(COLLECTIBLE_GWTW) then
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, 1, Position, zero, player);
		end
		if chance == 5 then
		Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, 1, Position, zero, player);
	end
	end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseGWTW, COLLECTIBLE_GWTW)
function EverlastingSummer:UseGWTW()
	local player = Isaac.GetPlayer(0)
	local chance = math.random(0, 5)
	local Position = game:GetRoom():FindFreePickupSpawnPosition(player.Position, 1, true);
	if chance == 2 then
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_KEY, 1, Position, zero, player);
	end
	end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseGWTW, COLLECTIBLE_GWTW)

----------Classic Guitar--------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_CLASSIC_GUITAR) then
		if (cacheFlag == CacheFlag.CACHE_SHOTSPEED) then
		player.ShotSpeed = player.ShotSpeed + 0.25;
        end
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-------------Sintezator------------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_SINTEZATOR) then
		if (cacheFlag == CacheFlag.CACHE_LUCK) then
		player.Luck = player.Luck + 5;
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-------------Shuttlecock------------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_SHUTTLECOCK) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
        player:AddSoulHearts(4)
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

-------------Flare Gun------------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_FLARE_GUN) then
		if cacheFlag == CacheFlag.CACHE_SPEED then
		player.MoveSpeed = player.MoveSpeed + 0.15
		end
	  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)
function EverlastingSummer:CacheUpdate(player, cacheFlag)
    player = Isaac.GetPlayer(0);
    if player:HasCollectible(COLLECTIBLE_FLARE_GUN) then
		player.TearFlags = player.TearFlags |TearFlags.TEAR_LIGHT_FROM_HEAVEN
		end
	  end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate)

---------Psycho-Shurik---------
local function UsePsycho()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(COLLECTIBLE_PSYCHO) and (player:GetName() == "Shurik") then
	sfxManager:Play(SoundEffect.SHARINGAN, 3, 1, false, 1)
	player:TryRemoveNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/ShurikHair.anm2"))
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/ShurikEvil.anm2"))
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, UsePsycho, COLLECTIBLE_PSYCHO)
function EverlastingSummer:UsePsycho()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(COLLECTIBLE_PSYCHO) then
	player.TearFlags = player.TearFlags |TearFlags.TEAR_EXPLOSIVE
	player:AddSoulHearts(2)
	player:RemoveCollectible(COLLECTIBLE_PSYCHO)
	end
	end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UsePsycho, COLLECTIBLE_PSYCHO)

---------Alisa Sharingan---------
local function UseSharingan()
	local player = Isaac.GetPlayer(0)
	sfxManager:Play(SoundEffect.SHARINGAN, 3, 1, false, 1)
	playanimation = 0
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/AlisaSharingan.anm2"))
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, UseSharingan, COLLECTIBLE_ALISA_SHARINGAN)
animation:Load("gfx/characters/sharingan.anm2", true)
function RenderSharingan()
	local player = Isaac.GetPlayer(0)
		if player:HasCollectible(COLLECTIBLE_ALISA_SHARINGAN)then
		if playanimation == 0 then
			playanimation = 1
			animation:Play("Shake", true)
			animation:SetFrame("Shake", 0)
			animation:Render(Vector(240,135), zero, zero)
		elseif playanimation == 1 then
			if animation:GetFrame() < 33 and Game():GetFrameCount() % 2 == 0 then
				animation:SetFrame("Shake", animation:GetFrame()+1)
				end
			end
			animation:Render(Vector(240,135), zero, zero)
			if animation:GetFrame() >= 33 then
				animation:SetFrame("Shake", 35)
				playanimation = -9
			end
		end
	end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_RENDER, RenderSharingan)
function EverlastingSummer:UseSharingan()
	local	player = Isaac.GetPlayer(0)
local entities = Isaac.GetRoomEntities()
				for i = 1, #entities do
				if (entities[i]:IsVulnerableEnemy()) then
		entities[i]:AddBurn(EntityRef(player) , 3000, 100000)
				end
				end
				end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.UseSharingan, COLLECTIBLE_ALISA_SHARINGAN);
local function NewRoom()
	local player = Isaac.GetPlayer(0)
	player:TryRemoveNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/AlisaSharingan.anm2"))
	player:EvaluateItems()
	return true
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, NewRoom)

--------RINNEGAN(Portal of Friends)-----------
function EverlastingSummer:NPCUpdate(friends)
	if friends.Variant == FRIENDS then
	friends:AddEntityFlags(EntityFlag.FLAG_FRIENDLY | EntityFlag.FLAG_CHARM)
	end
end	
EverlastingSummer:AddCallback(ModCallbacks.MC_NPC_UPDATE, EverlastingSummer.NPCUpdate, PORTAL)
function EverlastingSummer:useRinnegan()
	local player = Isaac.GetPlayer(0)
	local Position = Isaac.GetFreeNearPosition(player.Position, 40)
	if player:HasCollectible(COLLECTIBLE_LENA_RINNEGAN) then
	local portal = Isaac.Spawn(PORTAL, 1, 0, Position, zero, player)
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, EverlastingSummer.useRinnegan, COLLECTIBLE_LENA_RINNEGAN);
local function UseRinnegan()
	local player = Isaac.GetPlayer(0)
	sfxManager:Play(SoundEffect.RINNEGAN, 3, 1, false, 1)
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/LenaRinnegan.anm2"))
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, UseRinnegan, COLLECTIBLE_LENA_RINNEGAN)
local function NewRoom()
	local player = Isaac.GetPlayer(0)
	player:TryRemoveNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/LenaRinnegan.anm2"))
	player:EvaluateItems()
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, NewRoom)

---------------410 Bus---------------
local BusStats = {
	DAMAGE = 150.0, 
	RADIUS = 100.0, 
	LAND = 5.0,
    Active = false
}
function EverlastingSummer:GetEnemyInRoom()
	local BossTable = {}
	local EnemyTable = {}
	for _, Entity in pairs(Isaac.GetRoomEntities()) do
		if Entity:IsBoss() then
			table.insert(BossTable, Entity)
		elseif Entity:IsVulnerableEnemy() then 
			table.insert(EnemyTable, Entity) 
		end 
	end
	if #BossTable > 0 then
		return BossTable[math.random(#BossTable)]
	elseif #BossTable == 0 and #EnemyTable > 0 then 
		return EnemyTable[math.random(#EnemyTable)]
	end
	return nil
end
local function POST_BUS_UPDATE()
		for i = 1, Game():GetNumPlayers() do
		local player = Isaac.GetPlayer(i - 1)
		sfxManager:Play(SoundEffect.BEEP, 3, 1, false, 1)
		if player:HasCollectible(COLLECTIBLE_BUS) then	
			local enemy = EverlastingSummer:GetEnemyInRoom()
			if enemy == nil then  
				enemy = player 
			end
     local bus = Isaac.Spawn(EntityType.ENTITY_EFFECT, ICARUS, 0, enemy.Position, zero, nil)
	bus.Target = enemy

	return true 
end
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, POST_BUS_UPDATE, COLLECTIBLE_BUS)
local function POST_BUS_UPDATE(bus, bus)
local animation = bus:GetSprite()
if animation:IsPlaying("JumpDown") and not animation:WasEventTriggered("Land") and
bus.Target ~= nil and bus.Target.Type ~= EntityType.ENTITY_PLAYER then
end
if animation:IsEventTriggered("Land") then
sfxManager:Play(SoundEffect.DROP, 3, 1, false, 1)
game:BombDamage(bus.Position, BusStats.DAMAGE, BusStats.RADIUS, true, nil, 0, DamageFlag.DAMAGE_EXPLOSION, true)
end
if animation:IsFinished("JumpDown") then
sfxManager:Play(SoundEffect.CAR, 3, 1, false, 1)
animation:Play("JumpUp", false)
elseif animation:IsFinished("JumpUp") then
bus:Remove()
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, POST_BUS_UPDATE, ICARUS)

---------------Genda---------------
local GendaStats = {
	DAMAGE = 180.0, 
	RADIUS = 70.0, 
	LAND = 6.0,
    Active = false
}
function EverlastingSummer:GetEnemyInRoom()
	local BossTable = {}
	local EnemyTable = {}
	for _, Entity in pairs(Isaac.GetRoomEntities()) do
		if Entity:IsBoss() then
			table.insert(BossTable, Entity)
		elseif Entity:IsVulnerableEnemy() then 
			table.insert(EnemyTable, Entity) 
		end 
	end
	if #BossTable > 0 then
		return BossTable[math.random(#BossTable)]
	elseif #BossTable == 0 and #EnemyTable > 0 then 
		return EnemyTable[math.random(#EnemyTable)]
	end
	return nil
end
local function POST_GENDA_UPDATE()
		for i = 1, Game():GetNumPlayers() do
		local player = Isaac.GetPlayer(i - 1)
		sfxManager:Play(SoundEffect.FALL, 3, 1, false, 1)
		if player:HasCollectible(COLLECTIBLE_GENDA) then	
			local enemy = EverlastingSummer:GetEnemyInRoom()
			if enemy == nil then  
				enemy = player 
			end
     local genda = Isaac.Spawn(EntityType.ENTITY_EFFECT, GENDA, 0, enemy.Position, zero, nil)
	genda.Target = enemy

	return true 
end
end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_ITEM, POST_GENDA_UPDATE, COLLECTIBLE_GENDA)
local function POST_GENDA_UPDATE(genda, genda)
local animation = genda:GetSprite()
if animation:IsPlaying("JumpDown") and not animation:WasEventTriggered("Land") and
genda.Target ~= nil and genda.Target.Type ~= EntityType.ENTITY_PLAYER then
end
if animation:IsEventTriggered("Land") then
sfxManager:Play(SoundEffect.DROP, 3, 1, false, 1)
game:BombDamage(genda.Position, GendaStats.DAMAGE, GendaStats.RADIUS, true, nil, 0, DamageFlag.DAMAGE_EXPLOSION, true)
end
if animation:IsFinished("JumpDown") then
animation:Play("JumpUp", false)
elseif animation:IsFinished("JumpUp") then
animation:Play("Taunt", false)
sfxManager:Play(SoundEffect.EXPLOSION, 3, 0, false, 1)
elseif animation:IsFinished("Taunt") then
genda:Remove()
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, POST_GENDA_UPDATE, GENDA)


------------Fittings------------
function EverlastingSummer:update()
	for i = 1, Game():GetNumPlayers() do
		local player = Isaac.GetPlayer(i - 1)
		if player:HasCollectible(COLLECTIBLE_FITTINGS) then
			cooldown[i] = player.MaxFireDelay*tears
			if cooldown[i] < 16 then
				cooldown[i] = 16
			end
			if player:GetFireDirection() > -1 and render[i] == 0 and (stick[i] == nil or stick[i]:Exists() == false or stick[i]:IsDead()) then
				render[i] = cooldown[i]
				stick[i] = Isaac.Spawn(1000, 84, 10, player.Position, player.Velocity, player)
				stick[i]:ToEffect():FollowParent(player)
				stick[i]:SetColor(Color(1,1,1,0,0,0,0),0,0,false,false)
			end
			if stick[i] ~= nil and render[i] < cooldown[i]*0.76 and render[i] > 0 then
				stick[i]:ToEffect().IsFollowing = false
				stick[i].Position = Vector(-99999,-99999)
				stick[i] = nil
			end
			if sprite[i] == nil then
				sprite[i] = Isaac.Spawn(1000, 9679, 0, player.Position, player.Velocity, nil)
			end
			if sprite[i] ~= nil then
				sprite[i].Position = Vector(player.Position.X, player.Position.Y - 8)
			end
			if render[i] < cooldown[i]*0.76 then
				if player:GetHeadDirection() == 0 then
					sprite[i]:GetSprite():Play("Up", true)
				end
				if player:GetHeadDirection() == 1 then
					sprite[i]:GetSprite():Play("Right", true)
				end
				if player:GetHeadDirection() == 2 then
					sprite[i]:GetSprite():Play("Down", true)
				end
				if player:GetHeadDirection() == 3 then
					sprite[i]:GetSprite():Play("Left", true)
				end
				if player:GetFireDirection() == 0 then
					sprite[i]:GetSprite():Play("Up", true)
				end
				if player:GetFireDirection() == 1 then
					sprite[i]:GetSprite():Play("Right", true)
				end
				if player:GetFireDirection() == 2 then
					sprite[i]:GetSprite():Play("Down", true)
				end
				if player:GetFireDirection() == 3 then
					sprite[i]:GetSprite():Play("Left", true)
				end
			elseif sprite[i] ~= nil and render[i] == cooldown[i]-1 then
				if stick[i] ~= nil and (stick[i]:GetSprite():IsPlaying("ShootDown") or stick[i]:GetSprite():IsPlaying("ShootSide") or stick[i]:GetSprite():IsPlaying("ShootUp")) then
					if player:GetFireDirection() == 0 then
						sprite[i]:GetSprite():Play("PunchUp", true)
					end
					if player:GetFireDirection() == 1 then
						sprite[i]:GetSprite():Play("PunchRight", true)
					end
					if player:GetFireDirection() == 2 then
						sprite[i]:GetSprite():Play("PunchDown", true)
					end
					if player:GetFireDirection() == 3 then
						sprite[i]:GetSprite():Play("PunchLeft", true)
					end
				end
			end
			if render[i] > 0 then
				render[i] = render[i] - 1
			end
		end
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_UPDATE , EverlastingSummer.update)
function EverlastingSummer:onNewRoom()
	sprite = {nil,nil,nil,nil}
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EverlastingSummer.onNewRoom)

--------------------------------------------------------------------------------------------------TRANSFORMATIONS------------------------------------------------------------------------------------------------------------------

------------Miku Transformation-----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Miku") and
	player:HasCollectible(COLLECTIBLE_SINTEZATOR) and player:HasCollectible(COLLECTIBLE_CLASSIC_GUITAR) 
	and player:HasCollectible(COLLECTIBLE_ELECTRIC_GUITAR) and (cacheFlag == CacheFlag.CACHE_TEARFLAG) then
		player.TearFlags = player.TearFlags |TearFlags.TEAR_LIGHT_FROM_HEAVEN
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Miku")and
	player:HasCollectible(COLLECTIBLE_SINTEZATOR) and player:HasCollectible(COLLECTIBLE_CLASSIC_GUITAR) 
	and player:HasCollectible(COLLECTIBLE_ELECTRIC_GUITAR) then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/MikuULF.anm2"))
	player:AddGoldenHearts(3)
	sfxManager:Play(SoundEffect.SET, 3, 1, false, 1)
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);

------------Dvach Transformation-----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Alisa")and
	player:HasCollectible(COLLECTIBLE_ELECTRIC_GUITAR) and player:HasCollectible(COLLECTIBLE_CLASSIC_GUITAR) 
	and player:HasCollectible(COLLECTIBLE_EVERLASTING_VODKA) and player:HasCollectible(COLLECTIBLE_SINTEZATOR) and (cacheFlag == CacheFlag.CACHE_TEARFLAG) then
		player.TearFlags = player.TearFlags |TearFlags.TEAR_PULSE
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Alisa") and
	player:HasCollectible(COLLECTIBLE_ELECTRIC_GUITAR) and player:HasCollectible(COLLECTIBLE_CLASSIC_GUITAR) 
	and player:HasCollectible(COLLECTIBLE_EVERLASTING_VODKA) and player:HasCollectible(COLLECTIBLE_SINTEZATOR) then
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/AlisaHappy.anm2"))
	player:AddBombs(25)
	sfxManager:Play(SoundEffect.SET, 3, 1, false, 1)
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);

------------Lena Transformation-----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Lena") and
	player:HasCollectible(COLLECTIBLE_KNIFE) and player:HasCollectible(COLLECTIBLE_SHARD) 
	and player:HasCollectible(COLLECTIBLE_GWTW) and player:HasCollectible(COLLECTIBLE_SHUTTLECOCK) and (cacheFlag == CacheFlag.CACHE_TEARFLAG) then
		player.TearFlags = player.TearFlags |TearFlags.TEAR_WIGGLE
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Lena") and
	player:HasCollectible(COLLECTIBLE_KNIFE) and player:HasCollectible(COLLECTIBLE_SHARD) 
	and player:HasCollectible(COLLECTIBLE_GWTW) and player:HasCollectible(COLLECTIBLE_SHUTTLECOCK) then
	player:TryRemoveNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/LenaHair.anm2"))
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/LenaEvil.anm2"))
	sfxManager:Play(SoundEffect.SET, 3, 1, false, 1)
	player:AddKeys(5)
	player:AddBlueFlies(10,player.Position,nil)
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);

------------Semyon Transformation-----------
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Semyon") and
	player:HasCollectible(COLLECTIBLE_BUS) and player:HasCollectible(COLLECTIBLE_KNIFE) and player:HasCollectible(COLLECTIBLE_FLARE_GUN) and (cacheFlag == CacheFlag.CACHE_TEARFLAG) then
		player.TearFlags = player.TearFlags |TearFlags.TEAR_SPLIT
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);
function EverlastingSummer:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0);
	if (player:GetName() == "Semyon") and
	player:HasCollectible(COLLECTIBLE_BUS) and player:HasCollectible(COLLECTIBLE_KNIFE) and player:HasCollectible(COLLECTIBLE_FLARE_GUN) then
	player:TryRemoveNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/SemyonHair.anm2"))
	player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/SemyonEvil.anm2"))
	player:AddSoulHearts(4)
	player:AddCoins(20)
	sfxManager:Play(SoundEffect.SET, 3, 1, false, 1)
    costumeEquipped = true
    end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, EverlastingSummer.CacheUpdate);

--------------------------------------------------------------------------------------------------------------CARDS----------------------------------------------------------------------------------------------------------------

------------Yulya Card-----------
function EverlastingSummer:UseCard(card)
  local player = Isaac.GetPlayer(0)
  player:AddBlueFlies(10,player.Position,nil)
  YulyaCardActivated = true
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, YULYACARD)
function EverlastingSummer:getCard(rng,current,playing,runes,onlyrunes)
  local randomcardid = rng:RandomInt(ChanceYulyaCard);
  if randomcardid == 1 and not onlyrunes and current ~= Card.CARD_CHAOS then 
    return YULYACARD
  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_GET_CARD, EverlastingSummer.getCard);
function EverlastingSummer:cardupdate(pickup)
	if pickup.SubType == YULYACARD then
		local sprite = pickup:GetSprite()
		if sprite:GetFilename() ~= "gfx/wolfcard.anm2" then
			sprite:Load ("gfx/wolfcard.anm2", true)
			if Game():GetLevel():GetCurrentRoom():GetFrameCount() > 5 then
				sprite:Play("Appear", true);
			else
				sprite:Play("Idle", true);
			end
		end
		sprite:ReplaceSpritesheet(0, "gfx/wolfcard.png")
		sprite:LoadGraphics()
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, EverlastingSummer.cardupdate, 300)

------------Ulyana Card-----------
function EverlastingSummer:UseCard(card)
  local player = Isaac.GetPlayer(0)
  local Position = game:GetRoom():FindFreePickupSpawnPosition(player.Position, 1, true);
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART , 1, Position, zero, player);
  UlyanaCardActivated = true
  end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, ULYANACARD)
function EverlastingSummer:UseCard(card)
  local player = Isaac.GetPlayer(0)
  local Position = game:GetRoom():FindFreePickupSpawnPosition(player.Position, 1, true);
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART , 1, Position, zero, player);
  UlyanaCardActivated = true
  end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, ULYANACARD)
function EverlastingSummer:UseCard(card)
  local player = Isaac.GetPlayer(0)
  local Position = game:GetRoom():FindFreePickupSpawnPosition(player.Position, 1, true);
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART , 1, Position, zero, player);
  UlyanaCardActivated = true
  end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, ULYANACARD)
function EverlastingSummer:UseCard(card)
  local player = Isaac.GetPlayer(0)
  local Position = game:GetRoom():FindFreePickupSpawnPosition(player.Position, 1, true);
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_HEART , 1, Position, zero, player);
  UlyanaCardActivated = true
  end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, ULYANACARD)
function EverlastingSummer:getCard(rng,current,playing,runes,onlyrunes)
  local randomcardid = rng:RandomInt(ChanceUlyanaCard);
  if randomcardid == 1 and not onlyrunes and current ~= Card.CARD_CHAOS then 
    return ULYANACARD
  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_GET_CARD, EverlastingSummer.getCard);
function EverlastingSummer:cardupdate(pickup)
	if pickup.SubType == ULYANACARD then
		local sprite = pickup:GetSprite()
		if sprite:GetFilename() ~= "gfx/victorycard.anm2" then
			sprite:Load ("gfx/victorycard.anm2", true)
			if Game():GetLevel():GetCurrentRoom():GetFrameCount() > 5 then
				sprite:Play("Appear", true);
			else
				sprite:Play("Idle", true);
			end
		end
		sprite:ReplaceSpritesheet(0, "gfx/victorycard.png")
		sprite:LoadGraphics()
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, EverlastingSummer.cardupdate, 300)

------------Lena Card-----------
function EverlastingSummer:UseCard(card)
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
	local chance = math.random(0, 5)
		for i=1, #entities do
		if chance == 5 then
		elseif (entities[i]:IsVulnerableEnemy()) then
		entities[i]:AddMidasFreeze(EntityRef(player), 100)
  LenaCardActivated = true
  	end
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, LENACARD)
function EverlastingSummer:getCard(rng,current,playing,runes,onlyrunes)
  local randomcardid = rng:RandomInt(ChanceLenaCard);
  if randomcardid == 1 and not onlyrunes and current ~= Card.CARD_CHAOS then 
    return LENACARD
  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_GET_CARD, EverlastingSummer.getCard);
function EverlastingSummer:cardupdate(pickup)
	if pickup.SubType == LENACARD then
		local sprite = pickup:GetSprite()
		if sprite:GetFilename() ~= "gfx/ynilcard.anm2" then
			sprite:Load ("gfx/ynilcard.anm2", true)
			if Game():GetLevel():GetCurrentRoom():GetFrameCount() > 5 then
				sprite:Play("Appear", true);
			else
				sprite:Play("Idle", true);
			end
		end
		sprite:ReplaceSpritesheet(0, "gfx/ynilcard.png")
		sprite:LoadGraphics()
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, EverlastingSummer.cardupdate, 300)

------------Alisa Card-----------
function EverlastingSummer:UseCard(card)
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
	local chance = math.random(0, 5)
		for i=1, #entities do
		if chance == 5 then
		elseif (entities[i]:IsVulnerableEnemy()) then
		entities[i]:AddFreeze(EntityRef(player), 100)
  AlisaCardActivated = true
  	end
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_USE_CARD, EverlastingSummer.UseCard, ALISACARD)
function EverlastingSummer:getCard(rng,current,playing,runes,onlyrunes)
  local randomcardid = rng:RandomInt(ChanceAlisaCard);
  if randomcardid == 1 and not onlyrunes and current ~= Card.CARD_CHAOS then 
    return ALISACARD
  end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_GET_CARD, EverlastingSummer.getCard);
function EverlastingSummer:cardupdate(pickup)
	if pickup.SubType == ALISACARD then
		local sprite = pickup:GetSprite()
		if sprite:GetFilename() ~= "gfx/dvachcard.anm2" then
			sprite:Load ("gfx/dvachcard.anm2", true)
			if Game():GetLevel():GetCurrentRoom():GetFrameCount() > 5 then
				sprite:Play("Appear", true);
			else
				sprite:Play("Idle", true);
			end
		end
		sprite:ReplaceSpritesheet(0, "gfx/dvachcard.png")
		sprite:LoadGraphics()
	end
end
EverlastingSummer:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, EverlastingSummer.cardupdate, 300)

local TearFl = 
{TearFlags.TEAR_SPECTRAL,
				    TearFlags.TEAR_SLOW,
				    TearFlags.TEAR_POISON,
				    TearFlags.TEAR_FREEZE,
				    TearFlags.TEAR_SPLIT,
				    TearFlags.TEAR_GROW,
				    TearFlags.TEAR_BOMBERANG,
				    TearFlags.TEAR_WIGGLE,
					TearFlags.TEAR_NORMAL,
					TearFlags.TEAR_BURN,
				    TearFlags.TEAR_EXPLOSIVE,
			    	TearFlags.TEAR_CHARM,
			     	TearFlags.TEAR_CONFUSION,
			    	TearFlags.TEAR_HP_DROP,
			    	TearFlags.TEAR_ORBIT,
			    	TearFlags.TEAR_WAIT,
			     	TearFlags.TEAR_QUADSPLIT,
			     	TearFlags.TEAR_BOUNCE,
			    	TearFlags.TEAR_FEAR,
		     		TearFlags.TEAR_BURN,
		     		TearFlags.TEAR_PULSE,
			    	TearFlags.TEAR_SPIRAL,
			    	TearFlags.TEAR_FLAT,
			    	TearFlags.TEAR_SQUARE,
			    	TearFlags.TEAR_GLOW,
			    	TearFlags.TEAR_GISH,
			    	TearFlags.TEAR_STICKY,
			    	TearFlags.TEAR_CONTINUUM,
			    	TearFlags.TEAR_LIGHT_FROM_HEAVEN,
			    	TearFlags.TEAR_COIN_DROP,
			      	TearFlags.TEAR_GODS_FLESH,
			    	TearFlags.TEAR_BIG_SPIRAL,
			     	TearFlags.TEAR_ACID,
}

----------------------------------------------------------------------------------------------------External Item Descriptions Compatibility---------------------------------------------------------------------------------------

if not __eidItemDescriptions then         
  __eidItemDescriptions = {};
end

__eidItemDescriptions[Isaac.GetItemIdByName("Electric Guitar")] = "+ 1.5 Damage";
__eidItemDescriptions[Isaac.GetItemIdByName("Alisa Bomb")] = "Gives 10 Bombs";
__eidItemDescriptions[Isaac.GetItemIdByName("Everlasting Vodka")] = "Adds Confusion to enemies for 5 seconds";
__eidItemDescriptions[Isaac.GetItemIdByName("Robot Head")] = "LVL1 - Shoots 4 lasers #LVL2(Chip) - Shoots 8 lasers #LVL3(Upgraded Chip) - Shoots 16 lasers";
__eidItemDescriptions[Isaac.GetItemIdByName("Chip")] = "+ 0.10 to TearFallingSpeed #Upgrade Robot Head to LVL2";
__eidItemDescriptions[Isaac.GetItemIdByName("Upgraded Chip")] = "+ 1 to Luck #Upgrade Robot Head to LVL3";
__eidItemDescriptions[Isaac.GetItemIdByName("Knife")] = "+ 2.5 Damage";
__eidItemDescriptions[Isaac.GetItemIdByName("Dining Room Key")] = "Add 99 keys";
__eidItemDescriptions[Isaac.GetItemIdByName("Glass Shard")] = "+ 0.75 Damage";
__eidItemDescriptions[Isaac.GetItemIdByName("Stolen Candy")] = "Gives 1 Soul Heart";
__eidItemDescriptions[Isaac.GetItemIdByName("Sugar")] = "Gives 1 Golden Heart every use";
__eidItemDescriptions[Isaac.GetItemIdByName("Gone With he Wind")] = "Gives 1 coin every use #20% chance to get 1 key";
__eidItemDescriptions[Isaac.GetItemIdByName("Classic Guitar")] = "+ 0.25 to Shotspeed";
__eidItemDescriptions[Isaac.GetItemIdByName("Sintezator")] = "+ 5 to Luck";
__eidItemDescriptions[Isaac.GetItemIdByName("Shuttlecock")] = "Gives 2 Soul Hearts";
__eidItemDescriptions[Isaac.GetItemIdByName("Flare Gun")] = "+ 0.25 to Movespeed #Lighting Tears";
__eidItemDescriptions[Isaac.GetItemIdByName("Psycho Mode")] = "Adds Explosive Tearflags #Removed after use";
__eidItemDescriptions[Isaac.GetItemIdByName("Alisa's Mangekyou Sharingan")] = "Adds Amaterasu Flame to enemies for 5 seconds";
__eidItemDescriptions[Isaac.GetItemIdByName("Lena Rinnegan")] = "Spawn Portal of Friends";
__eidItemDescriptions[Isaac.GetItemIdByName("410 Bus")] = "Drops Bus to random enemy";
__eidItemDescriptions[Isaac.GetItemIdByName("Genda")] = "Drops Genda to random enemy";
__eidItemDescriptions[Isaac.GetItemIdByName("Little Alisa")] = "Spawn Little Alisa #Damage random enemy";
__eidItemDescriptions[Isaac.GetItemIdByName("Little Lena")] = "Spawn Little Lena #Damage random enemy";
__eidItemDescriptions[Isaac.GetItemIdByName("Fittings")] = "Character will give additional damage in melee every 4 tears";