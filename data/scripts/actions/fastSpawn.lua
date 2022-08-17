local fastSpawn = Action()

function fastSpawn.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rate = Game.getSpawnRate()
	local text = "                     [Respawn R�pido]\n-----------------------------\nO respawn do servidor varia de acordo com o n�mero de jogadores online para compensar a sua hunt.\n-----------------------------\nO respawn atual do servidor est� "

	if rate == 1 then
		text = text .. "Normal!"
	else
		text = text .. rate .."x mais r�pido!"
	end
	
	player:showTextDialog(item:getId(), text)
	return true
end

fastSpawn:uid(6214)
fastSpawn:register()