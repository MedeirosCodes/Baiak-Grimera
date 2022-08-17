function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local message = "---------[+]----------- [Boost Creature] -----------[+]---------\n\n   Todos os dias um monstro � escolhido para ter experi�ncia e loot adicionados.\n\n---------[+]-----------------------------------[+]---------\n                                                  Criatura escolhida: ".. firstToUpper(boostCreature[1].name) .."\n                                                        Experi�ncia: +".. boostCreature[1].exp .."%\n                                                              Loot: +".. boostCreature[1].loot .."%              "
	player:popupFYI(message)
	player:teleportTo(fromPosition, true)
	return true
end