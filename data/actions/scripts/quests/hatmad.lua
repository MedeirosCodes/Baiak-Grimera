function onUse(cid, item, frompos, item2, topos)
if item.uid == 7008 then
queststatus = getPlayerStorageValue(cid,20995)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou um Hat of the Mad!.")
doPlayerAddItem(cid,2323,1 )
setPlayerStorageValue(cid,20995,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 