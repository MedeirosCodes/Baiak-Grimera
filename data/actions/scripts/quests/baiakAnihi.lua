function onUse(cid, item)

local premios = {
--[ACTIONID] = {ID DO ITEM, QUANTIDADE},
[6001] = {5785, 1},
[6002] = {2660, 1},
[6003] = {2160, 1},
}
local sto = 53599 --storage de completar a quest
function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, sto) >= 1 then
  return doPlayerSendTextMessage(cid, 27, "You already completed this quest!")
end
local premio = premios[item.actionid]

doPlayerAddItem(cid, premio[1], premio[2])
setPlayerStorageValue(cid, sto, 1)
doPlayerSendTextMessage(cid, 27, "Congratulations, you have completed this quest!")
return true
end