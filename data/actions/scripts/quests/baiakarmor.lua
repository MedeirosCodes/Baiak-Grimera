function onUse(cid, item, frompos, item2, topos)
if item.uid == 6007 then
queststatus = getPlayerStorageValue(cid,20094)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou uma Baiak Armor!.")
doPlayerAddItem(cid,2503,1 )
setPlayerStorageValue(cid,20094,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 