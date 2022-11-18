-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 7500 then
   		queststatus = getPlayerStorageValue(cid,7500)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Yol's bow.")
   			doPlayerAddItem(cid,8856,1)
   			setPlayerStorageValue(cid,7500,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7501 then
   		queststatus = getPlayerStorageValue(cid,7501)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Pointed rabbitslayer.")
   			doPlayerAddItem(cid,10292,1)
   			setPlayerStorageValue(cid,7501,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7502 then
   		queststatus = getPlayerStorageValue(cid,7502)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found Thunder mage armor.")
   			doPlayerAddItem(cid,2656,1)
   			setPlayerStorageValue(cid,7502,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 7503 then
   		queststatus = getPlayerStorageValue(cid,7503)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found necrotic staff(SORCERER AND DRUID.")
   			doPlayerAddItem(cid,2185,1)
   			setPlayerStorageValue(cid,7503,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
