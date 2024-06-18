-- Most of these tables were in the original OccupationSpawnItem mod
Events.OnNewGame.Add(function(player, square)

Seeds = {
    "farming.BroccoliBagSeed",
    "farming.CabbageBagSeed",
    "farming.CarrotBagSeed",
    "farming.PotatoBagSeed",
    "farming.RedRadishBagSeed",
    "farming.StrewberrieBagSeed",
    "farming.TomatoBagSeed"
}
PoliceGun = {
	"Base.Revolver",
	"Base.Revolver_Short",
	"Base.Pistol",
	"Base.Revolver_Long"
}
FarmerTools = {
    "Base.Shovel",
    "Base.Shovel2",
    "Base.GardenHoe",
    "Base.GardenFork"
}
Tackle = {
	"Base.FishingTackle",
	"Base.FishingTackle2",
	"Base.Worm",
	"Base.BaitFish"
}
Herbs = {
	"Base.BlackSage",
	"Base.Comfrey",
	"Base.CommonMallow",
	"Base.Ginseng",
	"Base.LemonGrass",
	"Base.Plantain",
	"Base.WildGarlic"
}
Maps = {
	"Base.MarchRidgeMap",
	"Base.MuldraughMap",
	"Base.RiversideMap",
	"Base.RosewoodMap",
	"Base.WestpointMap"
}
Glasses = {
	"Base.Glasses",
	"Base.Glasses2"
}
Chem = {
	"Base.Glue",
	"Base.Woodglue",
	"Base.GunPowder",
	"Base.Bleach",
	"Base.CleaningLiquid",
	"Base.Soap",
	"BiochemistryLife.GluePaste",
	"BiochemistryLife.PowderedCorn",
	"BiochemistryLife.EthanolBL",
	"BiochemistryLife.CornOil",
	"BiochemistryLife.AfluI",
	"BiochemistryLife.Gliceryn",
	"BiochemistryLife.MetanoBL",
	"BiochemistryLife.GrindedSleep",
	"BiochemistryLife.Ephedrine",
}
ChemInstr = {
	"BiochemistryLife.Distiller",
	"BiochemistryLife.BunsenBurner",
	"BiochemistryLife.LabCondenser",
	"BiochemistryLife.IndustrialPress",
	"BiochemistryLife.Mixer",
}
Male = {
	"Base.Wallet",
	"Base.Wallet3",
	"Base.Wallet4",
	"Base.DigitalWatch2",
	"Base.Earbuds",
	"Base.Cologne",
	"Base.Comb",
	"Base.CreditCard",
	"Base.CardDeck",
	"Base.Locket",
	"Base.Ring"
}
Female = {
	"Base.Wallet2",
	"Base.DigitalWatch2",
	"Base.Purse",
	"Base.Earrings",
	"Base.Earbuds",
	"Base.MakeupEyeshadow",
	"Base.MakeupFoundation",
	"Base.Comb",
	"Base.CreditCard",
	"Base.Lipstick",
	"Base.Locket",
	"Base.Necklacepearl",
	"Base.Perfume",
	"Base.Ring"
}
Lighter = {
	"Base.Lighter",
	"Base.Matches"
}
Pills = {
	"Base.Pills",
	"Base.PillsAntiDep",
	"Base.PillsBeta",
	"Base.PillsSleepingTablets",
	"Base.PillsVitamins",
	"Base.Antibiotics"
}

--Find location For Map
local 	MapX = player:getX();
local 	MapY = player:getY();
local	CellX = MapX / 300;
local	CellY = MapY / 300;
local	Location = 0;
-------------------------------------------------Muldraugh
		if CellX > 34 and CellX < 37 and CellY > 29 and CellY < 36 then
			Location = 1
		end
-------------------------------------------------Westpoint
		if CellX > 35 and CellX < 41 and CellY > 21 and CellY < 24 then
			Location = 2
		end
-------------------------------------------------Riverside
		if CellX > 19 and CellX < 22 and CellY > 16 and CellY < 20 then
			Location = 3
		end
-------------------------------------------------Rosewood
		if CellX > 26 and CellX < 28 and CellY > 37 and CellY < 40 then
			Location = 4
		end
-------------------------------------------------March Ridge
		if CellX > 32 and CellX < 35 and CellY > 42 and CellY < 44 then
			Location = 5
		end
---------------------------------------------------------	

function getRandomStringFromTable(table)
    local count = 0;
    for _ in pairs(table) do count = count + 1 end
    local randomstring = ZombRand(count)
    if randomstring == 0 then randomstring = 1 end
    return table[randomstring];
end
--
   local prof = player:getDescriptor():getProfession()
-- Really want to redo the unemployed. Plenty of 'recreational' long blunt weapons they could have on hand
--    if prof == "unemployed" then
--        player:getInventory():AddItem("Radio.CDplayer")
--        player:getInventory():AddItem("Base.VideoGame")
--    end
    if getActivatedMods():contains("BiochemistrySkillsEtc") then  
        if prof == "chemist" then
        player:getInventory():AddItem(getRandomStringFromTable(Chem))
        player:getInventory():AddItem(getRandomStringFromTable(Chem))
        player:getInventory():AddItem(getRandomStringFromTable(Chem))
        player:getInventory():AddItem(getRandomStringFromTable(Pills))
        player:getInventory():AddItem(getRandomStringFromTable(ChemInstr))
        player:getInventory():AddItem("Base.MortarPestle");
        end
    end
--    if prof == "nurse" then
--        player:getInventory():AddItem("Base.Pills")
--        player:getInventory():AddItem("Base.PillsAntiDep")
--        player:getInventory():AddItem("Base.PillsBeta")
--        player:getInventory():AddItem("Base.PillsSleepingTablets")
--        player:getInventory():AddItem("Base.PillsVitamins")
--        player:getInventory():AddItem("Base.Antibiotics")
--		  player:getInventory():AddItem("Base.Disinfectant")
--	      player:getInventory():AddItem("Base.Hat_SurgicalMask_Green")
--    end


    --Trait Items

 --   if player:HasTrait("Athletic") then
 --   	player:getInventory():AddItem("Base.WaterBottleFull");
 --   end
--	if player:HasTrait("Tailor") then
--    	local sewkit = player:getInventory():AddItem("Base.SewingKit");
--		sewkit:getInventory():AddItem("Base.Needle");
--		sewkit:getInventory():AddItems("Base.Thread", 5);
--    end
    -- if player:HasTrait("Fit") then
    	-- player:getInventory():AddItem("Base.WaterBottleFull");
    -- end
    -- if player:HasTrait("NeedsLessSleep") then
    	-- player:getInventory():AddItem("Base.PillsSleepingTablets");
    -- end
    -- if -- player:HasTrait("Mechanics") then
    	-- if -- player:getInventory():getNumberOfItem("Base.Wrench") == 0 then
    		-- player:getInventory():AddItem("Base.Wrench");
    	-- end
    -- end
    -- if player:HasTrait("Fishing") then
    	-- if player:getInventory():getNumberOfItem("Base.FishingRod") == 0 then
    		-- player:getInventory():AddItem("Base.FishingRod");
    	-- end
    	-- player:getInventory():AddItem(getRandomStringFromTable(Tackle))
    	-- player:getInventory():AddItem(getRandomStringFromTable(Tackle))
    -- end
    -- if player:HasTrait("BaseballPlayer") then
    	-- player:getInventory():AddItem("Base.BaseballBat");
    	-- player:getInventory():AddItem("Base.Baseball")
    -- end
    -- if player:HasTrait("FirstAid") then
    	-- local kit = player:getInventory():AddItem("Base.FirstAidKit");
    	-- kit :getInventory():AddItem("Base.AlcoholWipes")
    	-- kit :getInventory():AddItem("Base.Antibiotics")
    	-- kit :getInventory():AddItem("Base.Bandage")
    	-- kit :getInventory():AddItem("Base.Bandaid")
    	-- kit :getInventory():AddItem("Base.Disinfectant")
    	-- kit :getInventory():AddItem("Base.Pills")
    	-- kit :getInventory():AddItem("Base.SutureNeedle")
    	-- kit :getInventory():AddItem("Base.Tweezers")
    -- end
    -- if player:HasTrait("Gardener") then
    	-- if player:getInventory():getNumberOfItem("farming.HandShovel") == 0 then
    		-- player:getInventory():AddItem("farming.HandShovel");
    	-- end
    	-- player:getInventory():AddItem(getRandomStringFromTable(Seeds))
    -- end
    -- if player:HasTrait("Handy") then
    	-- if player:getInventory():getNumberOfItem("Base.Hammer") == 0 then
    		-- player:getInventory():AddItem("Base.Hammer");
    	-- end
    	-- player:getInventory():AddItems("Base.Nails", 4)
    -- end
    -- if player:HasTrait("Herbalist") then
    	-- player:getInventory():AddItem("Base.MortarPestle");
    	-- player:getInventory():AddItem(getRandomStringFromTable(Herbs))
    	-- player:getInventory():AddItem(getRandomStringFromTable(Herbs))
    	-- player:getInventory():AddItem(getRandomStringFromTable(Herbs))
    -- end
    -- if player:HasTrait("Hiker") then
    	-- if player:getInventory():getNumberOfItem("Base.Bag_DuffelBag") == 1 then
    		-- player:getInventory():RemoveOneOf("Base.Bag_DuffelBag")
    	-- end
    	-- player:getInventory():AddItem("Base.Bag_NormalHikingBag");
    	-- if Location == 0 then
    		-- player:getInventory():AddItem(getRandomStringFromTable(Maps))
    	-- end
    	-- if Location == 1 then
    		-- player:getInventory():AddItem("Base.MuldraughMap");
    	-- end
    	-- if Location == 2 then
    		-- player:getInventory():AddItem("Base.WestpointMap");
    	-- end
    	-- if Location == 3 then
    		-- player:getInventory():AddItem("Base.RiversideMap");
    	-- end
    	-- if Location == 4 then
    		-- player:getInventory():AddItem("Base.RosewoodMap");
    	-- end
    	-- if Location == 5 then
    		-- player:getInventory():AddItem("Base.MarchRidgeMap");
    	-- end
    -- end
    -- if player:HasTrait("Hunter") then
    	-- if player:getInventory():getNumberOfItem("Base.HuntingKnife") == 0 then
    		-- player:getInventory():AddItem("Base.HuntingKnife");
    	-- end
    -- end
    -- if player:HasTrait("Cowardly") then
    	-- player:getInventory():AddItem("Base.PillsBeta");
    -- end
    -- if player:HasTrait("HighThirst") then
    	-- player:getInventory():AddItem("Base.WaterBottleEmpty");
    -- end
    -- if player:HasTrait("NeedsMoreSleep") then
    	-- player:getInventory():AddItem("Base.PillsVitamins");
    -- end
    -- if player:HasTrait("Insomniac") then
    	-- player:getInventory():AddItem("Base.PillsSleepingTablets");
    -- end
    -- if player:HasTrait("Smoker") then
    	-- player:getInventory():AddItem("Base.Cigarettes");
    	-- player:getInventory():AddItem(getRandomStringFromTable(Lighter));
    -- end
    -- if player:HasTrait("Thinskinned") then
    	-- player:getInventory():AddItems("Base.Bandaid", 4);
    -- end
    --Gender Items
     if player:isFemale() then
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Female));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Female));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Female));
    	end
    else
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Male));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Male));
    	end
    	local a = ZombRand(3)
    	if a == 0 then
    		player:getInventory():AddItem(getRandomStringFromTable(Male));
    	end
    end
end)