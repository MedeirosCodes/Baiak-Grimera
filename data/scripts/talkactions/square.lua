local square = TalkAction("!alvo")

squareGuild = {}

function repetirSquare(id, color)
    if not squareGuild[id] then
        return false
    end

    squareId = Player(squareGuild[id].alvo)

    if not squareId then
        return false
    end

    espectator = Game.getSpectators(squareId:getPosition(), true, true, 0, 7, 0, 7)
    for _, viewers in ipairs(espectator) do
        if viewers:getGuild() and viewers:getGuild():getId() == id then
            viewers:sendCreatureSquare(squareId, squareGuild[id].color)
        end
    end

    addEvent(repetirSquare, 500, id, color)
end

function square.onSay(player, words, param)

    if player:getStorageValue(984145) > os.time() then
        player:sendCancelMessage("Voc� precisa esperar o cooldown.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if not param then
        player:sendCancelMessage("Voc� precisa informar o jogador.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local target = Player(param)
    if not target then
        player:sendCancelMessage("Esse player n�o existe ou n�o est� online.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local guild = player:getGuild()
    
    if not guild then
        player:sendCancelMessage("Voc� precisa fazer parte de alguma guild para usar esse comando.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if player:getGuildLevel() < 2 then
        player:sendCancelMessage("Voc� precisa ser um l�der ou vice-l�der para usar esse comando.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if target:getGuild() and target:getGuild():getId() == guild:getId() then
        player:sendCancelMessage("Voc� n�o pode colocar um alvo da mesma guild da sua.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    squareGuild[guild:getId()] = {alvo = param, color = 204}
    repetirSquare(guild:getId(), 204)
    player:setStorageValue(984145, os.time() + 10 * 60)
    player:sendCancelMessage("O jogador ".. target:getName() .. " foi colocado em destaque at� ele deslogar.")
    target:sendCancelMessage("Voc� foi colocado em destaque pela player ".. player:getName() .." da guild ".. guild:getName() ..".")
    target:getPosition():sendMagicEffect(7)

    return false
end

square:separator(" ")
square:register()