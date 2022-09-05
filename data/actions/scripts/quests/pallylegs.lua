function onUse(cid, item, frompos, item2, topos)
if item.uid == 6003 then
queststatus = getPlayerStorageValue(cid,20090)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou um Ring of Honour!.")
doPlayerAddItem(cid,9777,1 )
setPlayerStorageValue(cid,20090,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 