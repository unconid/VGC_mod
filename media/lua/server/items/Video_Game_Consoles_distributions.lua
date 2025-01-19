local consoleItems = {
	"Video_Game_Consoles.SNES",
	"Video_Game_Consoles.GameBoy",
	"Video_Game_Consoles.Genesis",
	"Video_Game_Consoles.SegaCD_empty",
	"Video_Game_Consoles.Atari",
	"Video_Game_Consoles.NES",
	"Video_Game_Consoles.Game_Gear",
	"Video_Game_Consoles.Cartridge_Dummy1",
	"Video_Game_Consoles.Cartridge_Dummy2",
	"Video_Game_Consoles.Cartridge_Dummy3",
	"Video_Game_Consoles.Cartridge_Dummy4",
	"Video_Game_Consoles.Cartridge_Dummy5",
  }
  
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
  
  -- ProceduralDistributions
  addConsoleLoot("BreakRoomShelves", 1)
  addConsoleLoot("ClassroomShelves", 1)
  addConsoleLoot("MusicStoreCDs", 1)
  addConsoleLoot("CrateElectronics", 2)
  addConsoleLoot("ElectronicStoreMisc", 2)
  addConsoleLoot("ElectronicStoreMusic", 1)
  addConsoleLoot("MusicStoreCDs", 1)
  addConsoleLoot("GigamartHouseElectronics", 2)
  addConsoleLoot("LivingRoomShelf", 1)
  addConsoleLoot("LivingRoomShelfNoTapes", 1)
  addConsoleLoot("SchoolLockers", 1)
  addConsoleLoot("OfficeDeskHome", 1)
  addConsoleLoot("WardrobeChild", 2)
  addConsoleLoot("WardrobeMan", 1)
  addConsoleLoot("MechanicShelfElectric", 1)
  addConsoleLoot("CrateCompactDiscs", 1)
  addConsoleLoot("DeskGeneric", 1)
  addConsoleLoot("ShelfGeneric", 1)
  addConsoleLoot("MusicStoreCases", 1)
  
-- list of items to replace the dummy with
local itemList =
	{
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
	}

local function replaceDummies(container)
    local dummyTypes = {
        'Video_Game_Consoles.Cartridge_Dummy1',
        'Video_Game_Consoles.Cartridge_Dummy2',
        'Video_Game_Consoles.Cartridge_Dummy3',
        'Video_Game_Consoles.Cartridge_Dummy4',
        'Video_Game_Consoles.Cartridge_Dummy5'
    }

    for _, dummyType in ipairs(dummyTypes) do
        local dummies = container:getAllType(dummyType)
        for i = 0, dummies:size() - 1 do
            container:Remove(dummies:get(i))
            local itemChoice = ZombRand(#itemList) + 1
            local item = container:AddItem(itemList[itemChoice])
            container:addItemOnServer(item)
        end
    end
end

-- for items in containers
local function onFillContainer(_roomName, _containerType, container)
    replaceDummies(container)
end

Events.OnFillContainer.Add(onFillContainer)