local uids = {2000,2001,2002,2003}
local items = {2494,2400,2431,2421}


function onUse(cid, item, position, fromPosition, item2, toPosition)

queststatus = getPlayerStorageValue(cid, 7548)
if queststatus == -1 then
for i=1, #uids do
if item.uid == uids[i] and doPlayerAddItem(cid,items[i],1) then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a ".. getItemNameById(items[i]) ..".")
setPlayerStorageValue(cid,7548,1)
end
end
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end
