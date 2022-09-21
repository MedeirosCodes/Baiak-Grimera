function onThink(interval)
	Game.broadcastMessage('NÃO ESQUEÇAM SUAS BLESS.', MESSAGE_STATUS_WARNING)
	addEvent(Game.broadcastMessage, 60000, 'AMIGOS EVENTO DE NÃO PERDER XP JÁ ACABOU, NÃO ESQUEÇAM SUAS BLESS PARA NÃO PERDER TANTO XP!!! OBRIGADO...', MESSAGE_STATUS_WARNING)
	return true
end