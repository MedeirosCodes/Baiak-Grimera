function onUse(cid, item, frompos, item2, topos)
if item.uid == 9530 then
queststatus = getPlayerStorageValue(cid,30090)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou uma Native Armor!.")
doPlayerAddItem(cid,2508,1 )
setPlayerStorageValue(cid,30090,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 