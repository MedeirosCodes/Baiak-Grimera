local config = {
    positions = {
        ["Trainers"] = { x = 156, y = 48, z = 7 },
        ["Barco"] = { x = 154, y = 48, z = 7 },
	["Hunts Low Level"] = { x = 152, y = 48, z = 7 }
	["Bosses"] = { x = 152, y = 48, z = 7 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 500))
    end
    
    return TRUE
end  