local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PARAM_TARGETCASTERORTOPMOST)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREWORK_BLUE)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 4) + (magicLevel * 5.5) + 25
	local max = (level / 4) + (magicLevel * 11) + 50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
