------ Made By Unconid ------
------ Version 2.00 ------

-- List of dummy console items
local consoleItems = {
	"Video_Game_Consoles.Cartridge_Dummy1",
	"Video_Game_Consoles.Cartridge_Dummy2",
	"Video_Game_Consoles.Cartridge_Dummy3",
	"Video_Game_Consoles.Cartridge_Dummy4",
	"Video_Game_Consoles.Cartridge_Dummy5",
	"Video_Game_Consoles.Cartridge_Dummy6",
	"Video_Game_Consoles.Cartridge_Dummy7",
	"Video_Game_Consoles.Cartridge_Dummy8",
  }
  
  -- list of items to replace the dummy with
local itemList ={
	"Video_Game_Consoles.SNES_Cartridge_Mario",
	"Video_Game_Consoles.SNES_Cartridge_Mana",
	"Video_Game_Consoles.SNES_Cartridge_Fox",
	"Video_Game_Consoles.SNES_Cartridge_MK2",
	"Video_Game_Consoles.SNES_Cartridge_NBA",
	"Video_Game_Consoles.GB_Cartridge_Zelda",
	"Video_Game_Consoles.GB_Cartridge_Kirby",
	"Video_Game_Consoles.GB_Cartridge_Fantasy",
	"Video_Game_Consoles.GB_Cartridge_Mario",
	"Video_Game_Consoles.GB_Cartridge_Tetris",
	"Video_Game_Consoles.Genesis_Cartridge_Aladdin",
	"Video_Game_Consoles.Genesis_Cartridge_gaxe",
	"Video_Game_Consoles.Genesis_Cartridge_ghouls",
	"Video_Game_Consoles.Genesis_Cartridge_sonic",
	"Video_Game_Consoles.Genesis_Cartridge_street",
	"Video_Game_Consoles.Atari_Cartridge_Combat",
	"Video_Game_Consoles.Atari_Cartridge_Asteroids",
	"Video_Game_Consoles.Atari_Cartridge_MSPacman",
	"Video_Game_Consoles.Atari_Cartridge_Pitfall",
	"Video_Game_Consoles.Atari_Cartridge_Spaceinvaders",
	"Video_Game_Consoles.NES_Cartridge_Contra",
	"Video_Game_Consoles.NES_Cartridge_Mario3",
	"Video_Game_Consoles.NES_Cartridge_Megaman",
	"Video_Game_Consoles.NES_Cartridge_Metroid",
	"Video_Game_Consoles.NES_Cartridge_Zelda",
	"Video_Game_Consoles.GG_Cartridge_sor2",
	"Video_Game_Consoles.GG_Cartridge_AxBattler",
	"Video_Game_Consoles.GG_Cartridge_Shinobi",
	"Video_Game_Consoles.GG_Cartridge_Sonic",
	"Video_Game_Consoles.GG_Cartridge_Vampire",
	"Video_Game_Consoles.Sega_CD_Sonic",
	"Video_Game_Consoles.Sega_CD_beholder",
	"Video_Game_Consoles.Sega_CD_dune",
	"Video_Game_Consoles.Sega_CD_jurasic",
	"Video_Game_Consoles.Sega_CD_nighttrap",
	"Video_Game_Consoles.CDi_Link",
	"Video_Game_Consoles.CDi_7guest",
	"Video_Game_Consoles.CDi_lemmings",
	"Video_Game_Consoles.CDi_pacattack",
	"Video_Game_Consoles.CDi_zelda",
}

local itemList2 = {
	"Video_Game_Consoles.GameBoy",
	"Video_Game_Consoles.Genesis",
	"Video_Game_Consoles.SegaCD_empty",
	"Video_Game_Consoles.Atari",
	"Video_Game_Consoles.NES",
	"Video_Game_Consoles.SNES",
	"Video_Game_Consoles.Philips_CD_I",
	"Video_Game_Consoles.Game_Gear",
}
  -- Function to add console loot to procedural distributions
  local function addConsoleLoot(proc_name, chance)
	local data = ProceduralDistributions.list
	if not data then
	  return print('VGC Addon ERROR: procedure distributions not found!')
	end
	
	local c = data[proc_name];
	if not c then
	  return print('VGC Addon ERROR: cant add items to procedure '..proc_name)
	end
	
	for _, console in ipairs(consoleItems) do
	  table.insert(c.items, console);
	  table.insert(c.items, chance);
	end
  end
  
-- Adding console loot to various procedural distributions
  addConsoleLoot("BedroomDresserChild", 2)
  addConsoleLoot("BedroomSidetableChild", 2)
  addConsoleLoot("BookStoreCounter", 10)
  addConsoleLoot("BreakRoomShelves", 1)
  addConsoleLoot("ClassroomDesk", 1)
  addConsoleLoot("ClassroomSecondaryDesk", 4)
  addConsoleLoot("ClassroomShelves", 1)
  addConsoleLoot("ComicStoreCounter", 10)
  addConsoleLoot("CrateCompactDiscs", 1)
  addConsoleLoot("CrateElectronics", 2)
  addConsoleLoot("CrateRandomJunk", 0.2)
  addConsoleLoot("CyberCafeDesk", 10)
  addConsoleLoot("DeskGeneric", 1)
  addConsoleLoot("ElectronicStoreMisc", 2)
  addConsoleLoot("ElectronicStoreMusic", 1)
  addConsoleLoot("Gifts", 4)
  addConsoleLoot("GigamartHouseElectronics", 10)
  addConsoleLoot("Hobbies", 4)
  addConsoleLoot("HolidayStuff", 4)
  addConsoleLoot("LivingRoomShelf", 1)
  addConsoleLoot("LivingRoomShelfNoTapes", 1)
  addConsoleLoot("LivingRoomWardrobe", 2)
  addConsoleLoot("MechanicShelfElectric", 1)
  addConsoleLoot("MusicStoreCDs", 1)
  addConsoleLoot("MusicStoreCDs", 2)
  addConsoleLoot("MusicStoreCases", 1)
  addConsoleLoot("OfficeDeskHome", 1)
  addConsoleLoot("SchoolLockers", 4)
  addConsoleLoot("SchoolLockersBad", 10)
  addConsoleLoot("ShelfGeneric", 1)
  addConsoleLoot("UniversityWardrobe", 4)
  addConsoleLoot("WardrobeChild", 2)
  addConsoleLoot("WardrobeMan", 1)

-- Function to replace dummy items in a container with real items
local function replaceDummies(container)
    local dummyGroups = {
        { types = {
            'Video_Game_Consoles.Cartridge_Dummy3',
            'Video_Game_Consoles.Cartridge_Dummy4',
            'Video_Game_Consoles.Cartridge_Dummy5',
            'Video_Game_Consoles.Cartridge_Dummy6',
            'Video_Game_Consoles.Cartridge_Dummy7',
            'Video_Game_Consoles.Cartridge_Dummy8',
        }, itemList = itemList },
        { types = {
            'Video_Game_Consoles.Cartridge_Dummy1',
            'Video_Game_Consoles.Cartridge_Dummy2',
        }, itemList = itemList2 }
    }

    for _, group in ipairs(dummyGroups) do
        for _, dummyType in ipairs(group.types) do
            local dummies = container:getAllType(dummyType)
            for i = 0, dummies:size() - 1 do
                container:Remove(dummies:get(i))
                local itemChoice = ZombRand(#group.itemList) + 1
                local item = container:AddItem(group.itemList[itemChoice])
                container:addItemOnServer(item)
            end
        end
    end
end

-- Function to handle filling containers with items
local function onFillContainer(_roomName, _containerType, container)
    replaceDummies(container)
end

Events.OnFillContainer.Add(onFillContainer)