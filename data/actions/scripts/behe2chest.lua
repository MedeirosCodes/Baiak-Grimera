function onUse(cid, item, frompos, item2, topos)
if item.uid == 5005 then
queststatus = getPlayerStorageValue(cid,50005)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou Um(a) Eagle Shield!.")
doPlayerAddItem(cid,2538,1 )
setPlayerStorageValue(cid,50005,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 