function onUse(cid, item, frompos, item2, topos)

	if item.uid == 2487 then
 	queststatus = getPlayerStorageValue(cid,501099)
 	if queststatus == -1 then
 	doPlayerSendTextMessage(cid,22,"You have found a nightmare shield.")
 	doPlayerAddItem(cid,6391,1)
 	setPlayerStorageValue(cid,501099,1)
 	else
 	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	else
	return 0
	end
	
	return 1
end 