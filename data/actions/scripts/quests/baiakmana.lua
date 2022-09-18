function onUse(cid, item, frompos, item2, topos)
if item.uid == 7013 then
queststatus = getPlayerStorageValue(cid,20997)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você Ganhou uma Baiak mana Rune!.")
doPlayerAddItem(cid,2275,1 )
setPlayerStorageValue(cid,20997,1)
else
doPlayerSendTextMessage(cid,22,"Você ja fez essa quest!")
end
else
return 0
end
return 1
end 