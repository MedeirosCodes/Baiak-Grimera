local bonus = TalkAction("!onlinebonus")

function bonus.onSay(player, words, param)
	local skill = player:getOnlineTime(player)
	local message = "--------[+]------- [Online Bonus System] -------[+]--------\n\nGanhe um online token a cada hora que voc� passa online sem deslogar.\n\n---------------------------------------------------\n                                                            Total:\n             Desde o server save voc� j� ganhou " .. skill .. " online tokens."
	doPlayerPopupFYI(player, message)
end

bonus:register()