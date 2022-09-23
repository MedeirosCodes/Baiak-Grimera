local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 7000)
setConditionFormula(condition, -0.8, 0, -0.8, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
setPlayerStorageValue(cid, 12019, 1)
addEvent(setPlayerStorageValue, 500, cid, 12019, -1)
if(not doCombat(cid, combat, var)) then
return false
end

doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_GREEN)
return true
end

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 4) + (magicLevel * 5.5) + 25
	local max = (level / 4) + (magicLevel * 11) + 50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
