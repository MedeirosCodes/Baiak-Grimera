local boost = TalkAction("!boostcreature")

function boost.onSay(player, words, param)
    local message = "---------[+]----------- [Boost Creature] -----------[+]---------\n\n   Todos os dias um monstro � escolhido para ter experi�ncia e loot adicionados.\n\n---------[+]-----------------------------------[+]---------\n                                                  Criatura escolhida: ".. firstToUpper(boostCreature[1].name) .."\n                                                        Experi�ncia: +".. boostCreature[1].exp .."%\n                                                              Loot: +".. boostCreature[1].loot .."%              "
    player:popupFYI(message)
    return false
end

boost:register()
