function onUse(cid, item, frompos, item2, topos)
if item.uid == 6006 then
queststatus = getPlayerStorageValue(cid,20092)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou um Baiak Helmet!.")
doPlayerAddItem(cid,2502,1 )
setPlayerStorageValue(cid,20092,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 