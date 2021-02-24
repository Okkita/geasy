Geasy = Geasy or {}
Geasy.timerInitGMCP = Geasy.timerInitGMCP or nil
Geasy.triggerInitGMCP = Geasy.triggerInitGMCP or nil

function Geasy.statusGMCP(data)
    local dataTypes = {
        ["CVD"] = "character vitals",
        ["LID"] = "location info",
        ["MCD"] = "message channel"
    }
    cecho("<purple>:: GMCP " .. dataTypes[data] .. "... OK!\n")
end

function Geasy.beginGMCP()
    if gmcp.CVD == nil then
        sendGMCP("CVB")
        registerAnonymousEventHandler("gmcp.CVD", Geasy.statusGMCP("CVD"), true)
    elseif gmcp.LID == nil then
        sendGMCP("LIB")
        registerAnonymousEventHandler("gmcp.LID", Geasy.statusGMCP("LID"), true)
    -- MCB is not sending data, disabling for now
    -- elseif gmcp.MCD == nil then
    --     sendGMCP("MCB")
    --     registerAnonymousEventHandler("gmcp.MCD", Geasy.statusGMCP("MCD"), true)
    else
        killTimer(Geasy.timerInitGMCP)
    end
end

function Geasy.initGMCP()
    Geasy.timerInitGMCP = tempTimer(0.1, [[Geasy.beginGMCP()]], true)
end

function Geasy.clearGMCP() gmcp = nil end
registerAnonymousEventHandler("sysDisconnectionEvent", "Geasy.clearGMCP")

function Geasy.gotAPS()
    Geasy.triggerInitGMCP = tempPromptTrigger([[Geasy.initGMCP()]], 1)
end
registerAnonymousEventHandler("gmcp.APS", "Geasy.gotAPS")
