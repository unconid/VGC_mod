------ Made By Unconid ------
------ Version 2.00 ------

-- Function to play video game and adjust player's unhappiness and boredom levels
function VGC_PlayGame(craftRecipeData, character)
    local player = getPlayer()
    local bodyDamage = player:getBodyDamage()
    
    -- Decrease unhappiness and boredom levels by random amounts
    bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - ZombRand(6, 21))
    bodyDamage:setBoredomLevel(bodyDamage:getBoredomLevel() - ZombRand(11, 31))

    -- Set base chance for unhappiness level increase to 10%
    if ZombRand(1, 101) <= 10 then
        -- Increase the unhappiness level by a random amount 
        bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() + ZombRand(20, 31))
        -- Make the character say something
        local sayings = {
            "WHAT WERE THEY THINKING?!?",
            "WHY ARE THERE NO CONTINUES WHYYYYYYYY",
            "AAAASSSSSS",
            "THIS GAME SUCKS"
        }
        local randomIndex = ZombRand(#sayings) + 1
        player:Say(sayings[randomIndex])
    end

    -- Decrease the use delta of the item being used
    local items = craftRecipeData:getAllKeepInputItems()
    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item:hasTag("VGC_Console") then
            local newDelta = item:getCurrentUsesFloat() - 0.1 -- Decrease by 10%
            item:setUsedDelta(math.max(newDelta, 0))
            item:syncItemFields()
        end
    end
end

--------------------------------------------------

-- Function to remove battery from a console and transfer its used delta to the result item
function VGC_BatteryOut(craftRecipeData, character)
    local items = craftRecipeData:getAllKeepInputItems()
    local result = craftRecipeData:getAllCreatedItems():get(0)
    local player = character or getPlayer()

    if not player then
        print("Error: player is nil in VGC_BatteryOut")
        return
    end

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item:hasTag("VGC_Console") then
            result:setUsedDelta(item:getCurrentUsesFloat())
            item:setUsedDelta(0)
            item:syncItemFields()
        end
    end
end

--------------------------------------------------

-- Function to check for a powered square, specific items, and specific sprites nearby
local function VGChasRequiredConditions(player, tag, spriteNames)
    player = player or getPlayer()
    if not player then
        return false
    end

    local square = player:getSquare()
    if not square then
        return false
    end

    -- Check if the square has power
    local hasPower = (SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or 
                     (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier and not square:isOutside())

    -- Check for the item with the specified tag and specific sprites on nearby squares
    local hasItemNearby = false
    local hasSpriteNearby = false

    for dx = -2, 2 do
        for dy = -2, 2 do
            local adjacentSquare = square:getCell():getGridSquare(square:getX() + dx, square:getY() + dy, square:getZ())
            if adjacentSquare then
                -- Check for items with the specified tag
                if not hasItemNearby then
                    local worldObjects = adjacentSquare:getWorldObjects()
                    for i = 0, worldObjects:size() - 1 do
                        local obj = worldObjects:get(i)
                        if obj and obj:getItem() and obj:getItem():hasTag(tag) then
                            hasItemNearby = true
                            break
                        end
                    end
                end

                -- Check for specific sprites
                if not hasSpriteNearby then
                    local objects = adjacentSquare:getObjects()
                    for i = 0, objects:size() - 1 do
                        local obj = objects:get(i)
                        if obj and obj:getSprite() then
                            local spriteName = obj:getSprite():getName()
                            for _, requiredSprite in ipairs(spriteNames) do
                                if spriteName == requiredSprite then
                                    hasSpriteNearby = true
                                    break
                                end
                            end
                        end
                    end
                end
            end

            -- Exit early if both conditions are met
            if hasItemNearby and hasSpriteNearby then
                break
            end
        end
        if hasItemNearby and hasSpriteNearby then
            break
        end
    end

    -- Return true only if all conditions are met
    return hasPower and hasItemNearby and hasSpriteNearby
end

-- General function to require the specified conditions to perform a recipe
local function VGC_OnTest_CanPerform(recipe, player, item, tag, consoleName)
    player = player or getPlayer()

    -- Generate sprite names dynamically
    local spriteNames = {}
    for i = 0, 99 do
        table.insert(spriteNames, "appliances_television_01_" .. i)
    end

    -- If conditions are not met, display a message to the player
    if not VGChasRequiredConditions(player, tag, spriteNames) then
        player:Say("You need electricity, " .. consoleName .. ", and a TV nearby to play.")
        return false
    end
    return true
end

-- Specific functions for each console type
function VGC_OnTest_Atari(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_Atari26", "Atari 2600")
end

function VGC_OnTest_SNES(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_SNES", "SNES")
end

function VGC_OnTest_NES(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_NES", "NES")
end

function VGC_OnTest_Genesis(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_Genesis", "Genesis")
end

function VGC_OnTest_SegaCD(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_SegaCD", "SegaCD")
end

function VGC_OnTest_CD_I(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_CD_I", "CDi")
end

function VGC_OnTest_CD_I(recipe, player, item)
    return VGC_OnTest_CanPerform(recipe, player, item, "VGC_CD_I", "Lynx")
end