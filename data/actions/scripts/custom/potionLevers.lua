local potions = {
	[1515] = {id = 7618, charges = 1, value = 45}, -- health potion
	[1516] = {id = 7620, charges = 1, value = 50}, -- mana potion
	[1517] = {id = 7588, charges = 1, value = 100}, -- strong health potion
	[1518] = {id = 7589, charges = 1, value = 80}, -- strong mana potion
	[1519] = {id = 7591, charges = 1, value = 190}, -- great health potion
	[1520] = {id = 7590, charges = 1, value = 120}, -- great mana potion
	[1521] = {id = 8473, charges = 1, value = 310}, -- ultimate health potion
	[1522] = {id = 8472, charges = 1, value = 190} -- spirit potion
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local potion = potions[item.actionid]
	if not potion then
		return false
	end

	if player:getStorageValue(77124) >= os.time() then
		player:sendCancelMessage("Voc� precisa esperar 2 segundos entre uma compra e outa.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	local potionId = ItemType(potion.id)
	local itemWeight = potionId:getWeight() * potion.charges
	if player:getFreeCapacity() >= itemWeight then
		if not player:removeMoney(potion.value) then
			player:sendCancelMessage("Voc� n�o tem ".. potion.value .." gold coins para comprar ".. potion.charges .." ".. potionId:getName() ..".")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		elseif not player:addItem(potion.id, potion.charges) then
			print("[ERROR] ACTION: potions_lever, FUNCTION: addItem, PLAYER: "..player:getName())
		else
			player:sendCancelMessage("Voc� comprou ".. potion.charges .."x ".. potionId:getName() ..".")
			player:setStorageValue(77124, os.time() + 2)
			player:getPosition():sendMagicEffect(29)
		end
		
	else
		player:sendCancelMessage("Voc� n�o tem a cap necess�ria para comprar.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end