function onThink(interval)
	Game.broadcastMessage('N�O ESQUE�AM SUAS BLESS.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 60000, 'AMIGOS EVENTO DE N�O PERDER XP J� ACABOU, N�O ESQUE�AM SUAS BLESS PARA N�O PERDER TANTO XP!!! OBRIGADO...', MESSAGE_STATUS_WARNING)
	return true
end