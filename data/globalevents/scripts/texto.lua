local config = {
    positions = {
        ["Trainers"] = { x = 156, y = 48, z = 7 },
        ["Barco"] = { x = 154, y = 48, z = 7 },
	["Hunts Low Level"] = { x = 152, y = 48, z = 7 },
	["Bosses"] = { x = 150, y = 48, z = 7 },
	["Quests"] = { x = 145, y = 48, z = 7 },
	["Fodonas"] = { x = 145, y = 47, z = 7 },
	["ESCOLHA O CERTO"] = { x = 203, y = 300, z = 10 }

    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 500))
    end
    
    return TRUE
end  