-- Initialize settings table globally
VGC_SETTINGS = VGC_SETTINGS or {}
VGC_SETTINGS.spawnMultiplier = 1.0

if not VGC_MOD_OPTIONS then
    local vanillaOptions = PZAPI.ModOptions:create("Video_Game_Consoles", getText("UI_VGC_ModName"))

    -- Multiplier values matching their index positions (index starts at 1)
    local multiplierValues = {0.25, 0.5, 1.0, 2.0, 4.0, 6.0, 8.0, 10.0, 100.0}
    
    -- Add spawn rate multiplier dropdown
    local spawnRateDropdown = vanillaOptions:addComboBox("SPAWN_RATE_MULTIPLIER", getText("UI_VGC_SpawnMultiplier"), getText("UI_VGC_SpawnMultiplier_Tooltip"))
    for i, value in ipairs(multiplierValues) do
        -- Add each value, with 1.0x as default (index 3)
        spawnRateDropdown:addItem(tostring(value), value == 1.0)
    end

    -- Apply function for when settings change
    function vanillaOptions:apply()
        local selectedIndex = tonumber(self:getOption("SPAWN_RATE_MULTIPLIER"):getValue())
        VGC_SETTINGS.spawnMultiplier = multiplierValues[selectedIndex] or 1.0
        print("VGC MOD: Spawn Multiplier set to: " .. VGC_SETTINGS.spawnMultiplier .. "x")
    end

    VGC_MOD_OPTIONS = vanillaOptions
    
    -- Add event handler for game start
    Events.OnGameStart.Add(function()
        if VGC_MOD_OPTIONS then
            VGC_MOD_OPTIONS:apply()
        end
    end)
end

function VGC_GetSpawnMultiplier()
    return VGC_SETTINGS.spawnMultiplier or 1.0
end