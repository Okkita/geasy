Geasy = Geasy or {}
Geasy.config = Geasy.config or {}
Geasy.config.wantVIPrompt = Geasy.config.wantVIPrompt or true

Geasy.character.lastHealth = Geasy.character.lastHealth or 0
Geasy.character.lastMana = Geasy.character.lastMana or 0
Geasy.character.lastStamina = Geasy.character.lastStamina or 0
Geasy.character.lastFatigue = Geasy.character.lastFatigue or 0
Geasy.triggerStatusTicker = Geasy.triggerStatusTicker or nil

function Geasy.renderStatusTicker()
    -- shows a diff prompt for vitals
    local myHealth, myMana, myStamina, myFatigue = tonumber(gmcp.CVD.health),
                                                   tonumber(gmcp.CVD.mana),
                                                   tonumber(gmcp.CVD.stamina),
                                                   tonumber(gmcp.CVD.fatigue)
    local healthdiff = myHealth - Geasy.character.lastHealth
    local manadiff = myMana - Geasy.character.lastMana
    local staminadiff = myStamina - Geasy.character.lastStamina
    local fatiguediff = myFatigue - Geasy.character.lastFatigue

    if Geasy.config.wantVIPrompt then
        if healthdiff ~= 0 then
            display(healthdiff)
            echo("\n" .. string.format("Health %+d", healthdiff))
        end
        if manadiff ~= 0 then
            echo("\n" .. string.format("Mana %+d", manadiff))
        end
        if staminadiff ~= 0 then
            echo("\n" .. string.format("Stamina %+d", staminadiff))
        end
        if fatiguediff ~= 0 then
            echo("\n" .. string.format("Fatigue %+d", fatiguediff))
        end
    end

    local emptyBlock = "    "
    local output = ""
    output = output ..
                 (healthdiff ~= 0 and string.format("%+2dh", healthdiff) or
                     emptyBlock)
    output = output ..
                 (manadiff ~= 0 and string.format("%+2dm", manadiff) or
                     emptyBlock)
    output = output ..
                 (staminadiff ~= 0 and string.format("%+2ds", staminadiff) or
                     emptyBlock)
    output = output ..
                 (fatiguediff ~= 0 and string.format("%+2df", fatiguediff) or
                     emptyBlock)

    local changed = #string.trim(output) > 0

    if changed then
        if not Geasy.config.wantVIPrompt then
            echo("[ " .. output .. " ]\n")
        end
        echo("GUI.Ticker", getTime(true, "HH:mm:ss") .. " - [ " .. output .. " ]\n")
    end

    Geasy.character.lastHealth = myHealth
    Geasy.character.lastMana = myMana
    Geasy.character.lastStamina = myStamina
    Geasy.character.lastFatigue = myFatigue
end

if Geasy.triggerStatusTicker then killTrigger(Geasy.triggerStatusTicker) end
Geasy.triggerStatusTicker = tempPromptTrigger([[Geasy.renderStatusTicker()]])
