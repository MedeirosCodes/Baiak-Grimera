function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 6000 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Ring of Honour.")
doPlayerAddItem(cid,5785,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6001 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Blessed Armor")
doPlayerAddItem(cid,2660,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6002 then
queststatus = getPlayerStorageValue(cid, 6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Thunder Paladin Legs.")
doPlayerAddItem(cid,9777,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6003 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu o Presente.")
doPlayerAddItem(cid,2160,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")

end
else
return 0
end

return 1
end