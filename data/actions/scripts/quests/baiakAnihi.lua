function onUse(cid, item)

local itens = {
[17101] = {id = 5785, qnt = 1},  -- id = (ID do item do do bau 1), qnt = (Quantidade do item do bau 1)
[17102] = {id = 2660, qnt = 1}, -- id = (ID do item do do bau 2), qnt = (Quantidade do item do bau 2)
[17103] = {id = 2160, qnt = 1},  -- id = (ID do item do do bau 3), qnt = (Quantidade do item do bau 3)
}

if getPlayerStorageValue(cid, 13470) ~= 1 then
	if item.actionid == itens[item.actionid] then
	  doPlayerAddItem(cid, itens[item.actionid].id, itens[item.actionid].qnt)
	  doPlayerSendTextMessage(cid,22,"You have found a "..itens[item.actionid].qnt.." "..itens[item.actionid].id..".")
	  setPlayerStorageValue(cid, 13470, 1)
	  else
	  return doPlayerSendTextMessage(cid,22,"It is empty.")
	end
end

return TRUE
end