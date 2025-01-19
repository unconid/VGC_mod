-- Timed Actions for VGC Mod (Video Game Consoles)

require "TimedActions/ISBaseTimedAction"

-- Constants for Timed Actions
local PLAY_TIME = 300  -- Time for playing games
local INSERT_TIME = 100  -- Time for inserting batteries

-- Timed action for playing games on a GameBoy
VGCTimedAction_PlayGameBoy = ISBaseTimedAction:derive("VGCTimedAction_PlayGameBoy")

function VGCTimedAction_PlayGameBoy:isValid()
    return self.character and self.item
end

function VGCTimedAction_PlayGameBoy:start()
    self:setActionAnim("WashFace")
end

function VGCTimedAction_PlayGameBoy:perform()
    -- Call game logic for playing the game
    VGC_PlayGB(nil, nil, self.character)
    ISBaseTimedAction.perform(self)
end

function VGCTimedAction_PlayGameBoy:new(character, item)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.item = item
    o.maxTime = PLAY_TIME
    return o
end

-- Timed action for inserting a battery into a GameBoy
VGCTimedAction_InsertBatteryGameBoy = ISBaseTimedAction:derive("VGCTimedAction_InsertBatteryGameBoy")

function VGCTimedAction_InsertBatteryGameBoy:isValid()
    return self.character and self.battery and self.item
end

function VGCTimedAction_InsertBatteryGameBoy:start()
    self:setActionAnim("InsertBattery")
end

function VGCTimedAction_InsertBatteryGameBoy:perform()
    -- Call game logic for inserting the battery
    VGC_BatteryIn({self.battery, self.item}, nil, self.character)
    ISBaseTimedAction.perform(self)
end

function VGCTimedAction_InsertBatteryGameBoy:new(character, battery, item)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.battery = battery
    o.item = item
    o.maxTime = INSERT_TIME
    return o
end

-- Timed action for playing games on a Game Gear
VGCTimedAction_PlayGameGear = ISBaseTimedAction:derive("VGCTimedAction_PlayGameGear")

function VGCTimedAction_PlayGameGear:isValid()
    return self.character and self.item
end

function VGCTimedAction_PlayGameGear:start()
    self:setActionAnim("WashFace")
end

function VGCTimedAction_PlayGameGear:perform()
    -- Call game logic for playing the game
    VGC_PlayGB(nil, nil, self.character)
    ISBaseTimedAction.perform(self)
end

function VGCTimedAction_PlayGameGear:new(character, item)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.item = item
    o.maxTime = PLAY_TIME
    return o
end

-- Timed action for inserting a battery into a Game Gear
VGCTimedAction_InsertBatteryGameGear = ISBaseTimedAction:derive("VGCTimedAction_InsertBatteryGameGear")

function VGCTimedAction_InsertBatteryGameGear:isValid()
    return self.character and self.battery and self.item
end

function VGCTimedAction_InsertBatteryGameGear:start()
    self:setActionAnim("InsertBattery")
end

function VGCTimedAction_InsertBatteryGameGear:perform()
    -- Call game logic for inserting the battery
    VGC_BatteryIn({self.battery, self.item}, nil, self.character)
    ISBaseTimedAction.perform(self)
end

function VGCTimedAction_InsertBatteryGameGear:new(character, battery, item)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.battery = battery
    o.item = item
    o.maxTime = INSERT_TIME
    return o
end

-- Notes:
-- These actions inherit from ISBaseTimedAction and follow the template provided by the game's API.
-- `start`, `isValid`, and `perform` handle the timed action logic.
