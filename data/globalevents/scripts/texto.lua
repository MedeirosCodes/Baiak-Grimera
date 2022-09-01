local config = {
    positions = {
        ["Trainers"] = { x = 140, y = 54, z = 7 },
        ["Barco -> Hunts - Quest - City"] = { x = 138, y = 54, z = 7 },
	["Hunts Low Level"] = { x = 136, y = 54, z = 7 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 500))
    end
    
    return TRUE
end  