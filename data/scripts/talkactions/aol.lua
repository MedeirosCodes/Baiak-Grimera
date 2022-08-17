local amulet = TalkAction("!aol")
local price_aol = 10000

function amulet.onSay(player, words, param)

    if player:removeMoney(price_aol) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
        player:say("[AOL]", TALKTYPE_MONSTER_SAY, true)
        player:addItem(2173, 1)
		player:sendCancelMessage("Voc� comprou um Amulet of Loss.")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("Voc� n�o tem dinheiro suficiente.")
    end
    return false
end

amulet:register()