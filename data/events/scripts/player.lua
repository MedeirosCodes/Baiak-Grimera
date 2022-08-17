function Player:onLook(thing, position, distance)
	local minDist = 5
	if (thing:isCreature() and thing:isNpc() and distance <= minDist) then
       self:say("hi", TALKTYPE_PRIVATE_PN, false, thing)
       self:say("trade", TALKTYPE_PRIVATE_PN, false, thing)
       return false
   end
	local description = "Voc� v� " .. thing:getDescription(distance)

	if LOOK_MARRIAGE_DESCR and thing:isCreature() then
        if thing:isPlayer() and not thing:getGroup():getAccess() then
            description =  description .. self:getMarriageDescription(thing)
        end
	end
	
	if thing:isPlayer() then
		description = description .. "\nN�vel de Mining: " .. configMining.level[thing:getStorageValue(configMining.level.storageNivel)].name .."."
	end

    if thing:isItem() and thing:getCustomAttribute("premiumPoints") then
    	description = description .. "\nEsse item vale " .. thing:getCustomAttribute("premiumPoints") .." pontos."
    end

	if self:getGroup():getAccess() then
		if thing:isItem() then
			description = string.format("%s\nItem ID: %d", description, thing:getId())

			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, Action ID: %d", description, actionId)
			end

			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, Unique ID: %d", description, uniqueId)
			end

			local itemType = thing:getType()

			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransforma para: %d (onEquip)", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransforma para: %d (onDeEquip)", description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecai para: %d", description, decayId)
			end
		elseif thing:isCreature() then
			local str = "%s\nVida: %d / %d"
			if thing:isPlayer() and thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: %d / %d", str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
		end

		local position = thing:getPosition()
		description = string.format(
			"%s\nPosi��o: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if thing:isCreature() then
			if thing:isPlayer() then
				local client = thing:getClient()
				description = string.format("%s\nIP: %s PING: %i FPS: %i.", description, Game.convertIpToString(thing:getIp()), client.ping, client.fps)
			end
		end
	end
	if thing:isCreature() then
		if thing:isPlayer() and not thing:getGroup():getAccess() then
			description = string.format("%s\nTask Rank: "..getRankTask(thing), description)
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)

	if thing:isPlayer() and not self:getGroup():getAccess() then
        thing:sendTextMessage(MESSAGE_STATUS_DEFAULT, self:getName() .. ' est� olhando para voc�.')
    end

end

function Player:onLookInBattleList(creature, distance)
	local minDist = 5
	if (thing:isCreature() and thing:isNpc() and distance <= minDist) then
       self:say("hi", TALKTYPE_PRIVATE_PN, false, thing)
       self:say("trade", TALKTYPE_PRIVATE_PN, false, thing)
       return false
   end
	local description = "Voc� v� " .. creature:getDescription(distance)
	if self:getGroup():getAccess() then
		local str = "%s\nVida: %d / %d"
		if creature:isPlayer() and creature:getMaxMana() > 0 then
			str = string.format("%s, Mana: %d / %d", str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. "."

		local position = creature:getPosition()
		description = string.format(
			"%s\nPosi��o: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if creature:isPlayer() then
			local client = thing:getClient()
    		description = string.format("%s\nIP: %s PING: %i FPS: %i.", description, Game.convertIpToString(thing:getIp()), client.ping, client.fps)
		end
	end
	if thing:isCreature() then
		if thing:isPlayer() and not thing:getGroup():getAccess() then
			description = string.format("%s\nTask Rank: "..getRankTask(thing), description)
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)

	if creature:isPlayer() and not self:getGroup():getAccess() then
        creature:sendTextMessage(MESSAGE_STATUS_DEFAULT, self:getName() .. ' est� olhando para voc�.')
    end

end

function Player:onLookInTrade(partner, item, distance)
	local description = "Voc� v� "
	description = description .. item:getDescription(distance)
	if item:getCustomAttribute("premiumPoints") then
    	description = description .. "\nEsse item vale " .. item:getCustomAttribute("premiumPoints") .." pontos."
    end
    self:sendTextMessage(MESSAGE_INFO_DESCR, description)
	return true
end

function Player:onLookInShop(itemType, count)
	return true
end

function Player:onMoveItem(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	local positionPlayer = self:getPosition()
	local blockPosition = {Position(951, 1208, 6), Position(951, 1209, 6), Position(951, 1210, 6), Position(952, 1209, 6)}
	local depotIds = {2589, 2590, 2591}
	local positionUnderDepot = {
		Position(positionPlayer.x, positionPlayer.y + 1, positionPlayer.z),
		Position(positionPlayer.x + 1, positionPlayer.y, positionPlayer.z),
		Position(positionPlayer.x - 1, positionPlayer.y, positionPlayer.z),
		Position(positionPlayer.x, positionPlayer.y - 1, positionPlayer.z),
	}

	local depotLocked = false
	local antiTrash = true
    local antiTheft = true
    if antiTrash then
    local tile = Tile(toPosition)
        if tile and tile:hasFlag(TILESTATE_HOUSE) then
        local house = tile:getHouse()
            if house then
                local accessList = House.getAccessList
                local playerName = self:getName():lower()
                if house ~= self:getHouse() and (playerName ~= accessList(house, GUEST_LIST):lower() or playerName ~= accessList(house, SUBOWNER_LIST):lower()) then
                    self:sendTextMessage(MESSAGE_STATUS_SMALL, "Voc� n�o pode jogar itens nas casas dos jogadores, para os quais n�o est� convidado.")
                    return false
                end
            end
        end
    end

    if antiTheft then
    	local tile = Tile(fromPosition)
        if tile and tile:hasFlag(TILESTATE_HOUSE) then
            local house = tile:getHouse()
            if house then
                if house ~= self:getHouse() and self:getName():lower() ~= house:getAccessList(SUBOWNER_LIST):lower() then
                    self:sendTextMessage(MESSAGE_STATUS_SMALL, "Voc� n�o pode mover itens da casa, dos quais voc� � apenas convidado.")
                    return false
                end
            end
        end
	end

	--local depotBlock = Tile(toPosition):getTopDownItem():getId()
	if depotLocked and isInArray(depotIds, depotBlock) and isInArray(positionUnderDepot, fromPosition) then
		self:sendCancelMessage("Voc� n�o pode jogar itens em um depot.")
		self:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	if isInArray(blockPosition, toPosition) then
		self:sendCancelMessage("Voc� n�o pode jogar um item nessa posi��o.")
		self:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return true
end

function Player:onItemMoved(item, count, fromPosition, toPosition, fromCylinder, toCylinder)

end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	return true
end

local function hasPendingReport(name, targetName, reportType)
	local f = io.open(string.format("data/reports/players/%s-%s-%d.txt", name, targetName, reportType), "r")
	if f then
		io.close(f)
		return true
	else
		return false
	end
end

function Player:onReportRuleViolation(targetName, reportType, reportReason, comment, translation)
	local name = self:getName()
	if hasPendingReport(name, targetName, reportType) then
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Seu report est� sendo processado.")
		return
	end

	local file = io.open(string.format("data/reports/players/%s-%s-%d.txt", name, targetName, reportType), "a")
	if not file then
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ocorreu um erro ao processar seu report, entre em contato com um gamemaster.")
		return
	end

	io.output(file)
	io.write("------------------------------\n")
	io.write("Reportado por: " .. name .. "\n")
	io.write("Alvo: " .. targetName .. "\n")
	io.write("Tipo: " .. reportType .. "\n")
	io.write("Raz�o: " .. reportReason .. "\n")
	io.write("Coment�rio: " .. comment .. "\n")
	if reportType ~= REPORT_TYPE_BOT then
		io.write("Translation: " .. translation .. "\n")
	end
	io.write("------------------------------\n")
	io.close(file)
	self:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Obrigado pelo seu report, %s. Seu report ser� processado pela equipe o mais r�pido poss�vel.", targetName, configManager.getString(configKeys.SERVER_NAME)))
	return
end

function Player:onReportBug(message, position, category)

	if self:getStorageValue(98191) >= os.time() then
		self:sendCancelMessage("Voc� s� pode reportar bugs a cada 1 hora.")
		self:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local name = self:getName()
	local file = io.open("data/reports/bugs/" .. name .. " report.txt", "a")

	if not file then
		self:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Ocorreu um erro ao processar seu report, entre em contato com um gamemaster.")
		return true
	end


	io.output(file)
	io.write("------------------------------\n")
	io.write("Nome: " .. name)
	local playerPosition = self:getPosition()
	io.write(" [Posi��o do Player: " .. playerPosition.x .. ", " .. playerPosition.y .. ", " .. playerPosition.z .. "]\n")
	io.write("Coment�rio: " .. message .. "\n")
	io.close(file)

	self:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Seu report foi enviado para " .. configManager.getString(configKeys.SERVER_NAME) .. ".")
	self:setStorageValue(98191, os.time() + 3600)
	return true
end

function Player:onTurn(direction)
    if self:getGroup():getAccess() and self:getAccountType() == ACCOUNT_TYPE_GOD and self:getDirection() == direction then
        local nextPosition = self:getPosition()
        nextPosition:getNextPosition(direction)
        self:teleportTo(nextPosition, true)
    end
    return true
end

function Player:onTradeRequest(target, item)
	local blockList = {7879, 7878, 7882, 8858, 7872, 12644, 8908, 2523} -- ID

	if isInArray(blockList, item:getId()) then
		self:sendCancelMessage("Voc� n�o pode trocar esse item.")
		self:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	return true
end

function Player:onTradeAccept(target, item, targetItem)
	return true
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	
	if not nextUseStaminaTime[playerId] then
		nextUseStaminaTime[playerId] = 0
	end

	local currentTime = os.time()
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

function Player:onGainExperience(source, exp, rawExp)
	if not source or source:isPlayer() then
		return exp
	end

	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Apply experience stage multiplier
	exp = exp * Game.getExperienceStage(self:getLevel())

	-- Stamina modifier
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)

		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5
		end
	end

	-- Premium
	local xpPremium = 0
	if self:isPremium() then
		xpPremium = exp * 0.2 -- +20% XP
	end

	-- Castle 24H
	local xpCastle = 0
	if self:getGuild() and self:getGuild():getId() == CASTLE24H:getGuildIdFromCastle() then
		xpCastle = exp * 0.2 -- +20% XP
	end

	-- XP potion
	local xpPotion = 0
	if self:getStorageValue(STORAGEVALUE_POTIONXP_TEMPO) > os.time() then
		local potion = expPotion[self:getStorageValue(STORAGEVALUE_POTIONXP_ID)]
		if potion then
			xpPotion = exp * potion.exp / 100
		end
	end

	-- Boost Creature
	local extraXp = 0
	if (source:getName():lower() == boostCreature[1].name) then
		local extraPercent = boostCreature[1].exp
		extraXp = exp * extraPercent / 100
		self:sendTextMessage(MESSAGE_STATUS_DEFAULT, "[Boosted Creature] Voc� ganhou ".. extraXp .." de experi�ncia.")
	end

	local xpCastle48 = 0
	if self:getGuild() and self:getGuild():getId() == Game.getStorageValue(STORAGEVALUE_CASTLE48_WINNER) then
		xpCastle48 = exp * Castle48H.plusXP / 100
	end

	return exp + extraXp + xpPotion + xpPremium + xpCastle +xpCastle48
end

function Player:onLoseExperience(exp)
	return exp
end

function Player:onGainSkillTries(skill, tries)
	if APPLY_SKILL_MULTIPLIER == false then
		return tries
	end

	if skill == SKILL_MAGLEVEL then
		return tries * configManager.getNumber(configKeys.RATE_MAGIC)
	end
	return tries * configManager.getNumber(configKeys.RATE_SKILL)
end

function Player:onSay(message)
	local msgBlock = {}
	for _, m in ipairs(msgBlock) do
		local a = string.find(message, m)
		if a then
			self:getPosition():sendMagicEffect(CONST_ME_POFF)
			self:sendTextMessage(MESSAGE_STATUS_DEFAULT, "Voc� n�o pode mandar essa mensagem aqui.")
			local file = io.open("data/logs/messages/block.txt", "a")
			if not file then
				print(">> Erro ao tentar encontrar o arquivo de block messages no log.")
				return
			end
			io.output(file)
			io.write("------------------------------\n")
			io.write(self:getName() ..": ".. message .."\n")
			io.close(file)
			return false
		end
	end

	return true
end
