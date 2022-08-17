function Player.warnSave(self, x)
    if x <= 0 then
		return
	end
	
    self:say("Save em ".. x .. " segundos", TALKTYPE_MONSTER_SAY, false, self)

    local playerName = self:getName()
    addEvent(function()
        local player = Player(playerName)
        if player then
            player:warnSave(x - 5)
        end
    end, 5000)
end


function onThink(interval)
	Game.broadcastMessage('O servidor se salvar� em 5 minutos.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 60000, 'O servidor se salvar� em 4 minutos.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 120000, 'O servidor se salvar� em 3 minutos.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 180000, 'O servidor se salvar� em 2 minutos.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 240000, 'O servidor se salvar� em 1 minuto.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 270000, 'O servidor se salvar� em 30 segundos.', MESSAGE_STATUS_WARNING)
	addEvent(function()
		for pid, player in ipairs(Game.getPlayers()) do
			player:warnSave(30)
		end
	end, 270000)
	addEvent(saveServer, 5 * 60 * 1000)
	addEvent(Game.broadcastMessage, 5 * 60 * 1000, 'O servidor foi salvo, um bom jogo.', MESSAGE_STATUS_WARNING)
	return true
end