function onUse(cid, item, frompos, item2, topos)
if item.uid == 7010 then
queststatus = getPlayerStorageValue(cid,20994)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou uma bunnyslippers!.")
doPlayerAddItem(cid,2644,1 )
setPlayerStorageValue(cid,20994,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 