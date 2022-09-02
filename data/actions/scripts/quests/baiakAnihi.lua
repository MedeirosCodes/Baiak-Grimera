
if item.uid == 5001 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a ring of honour.")
doPlayerAddItem(cid,5785,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5002 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a blessed armor.")
doPlayerAddItem(cid,2660,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5003 then
queststatus = getPlayerStorageValue(cid,100)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"You have found a thunder paladin legs.")
doPlayerAddItem(cid,9777,1)
setPlayerStorageValue(cid,100,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end