function onUse(cid, item, frompos, item2, topos)
if item.uid == 6008 then
queststatus = getPlayerStorageValue(cid,20093)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou uma Baiak Legs!.")
doPlayerAddItem(cid,2504,1 )
setPlayerStorageValue(cid,20093,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 