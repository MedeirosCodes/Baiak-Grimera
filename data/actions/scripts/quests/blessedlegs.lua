function onUse(cid, item, frompos, item2, topos)
if item.uid == 7009 then
queststatus = getPlayerStorageValue(cid,20996)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou uma Blessed Legs!.")
doPlayerAddItem(cid,8923,1 )
setPlayerStorageValue(cid,20996,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 