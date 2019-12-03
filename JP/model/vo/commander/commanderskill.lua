slot0 = class("CommanderSkill", import("..BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.exp = slot1.exp
end

slot0.getExp = function (slot0)
	return slot0.exp
end

slot0.bindConfigTable = function (slot0)
	return pg.commander_skill_template
end

slot0.getLevel = function (slot0)
	return slot0:getConfig("lv")
end

slot0.isMaxLevel = function (slot0)
	return slot0:getConfig("next_id") == 0
end

slot0.getNextLevelExp = function (slot0)
	return slot0:getConfig("exp")
end

slot0.addExp = function (slot0, slot1)
	slot0.exp = slot0.exp + slot1

	while slot0:canLevelUp() do
		slot0.exp = slot0.exp - slot0:getNextLevelExp()
		slot0.id = slot0:getConfig("next_id")
		slot0.configId = slot0.id
	end
end

slot0.canLevelUp = function (slot0)
	return slot0:getNextLevelExp() <= slot0.exp and not slot0:isMaxLevel()
end

slot0.getTacticSkill = function (slot0)
	return slot0:getConfig("effect_tactic")
end

slot0.getDesc = function (slot0)
	slot1 = ""
	slot2 = slot0:getLevel()

	for slot7, slot8 in ipairs(slot3) do
		slot1 = slot1 .. ((slot2 < slot8[1] and "<color=#a3a2a2>Lv.") or "Lv.") .. slot8[1] .. "：" .. slot8[2] .. ((slot2 < slot8[1] and "</color>") or "") .. "\n"
	end

	return slot1
end

return slot0
