function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(STORAGEVALUE_CITIZEN_FULL) >=1 then
		player:sendCancelMessage("Voc� j� pegou esse pr�mio.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	else
		player:sendCancelMessage("Voc� ganhou o addon Citizen completo!")
		player:getPosition():sendMagicEffect(31)
		player:addOutfitAddon(136, 3)
		player:addOutfitAddon(128, 3)
		player:setStorageValue(STORAGEVALUE_CITIZEN_FULL, 1)
	end

	return true
end