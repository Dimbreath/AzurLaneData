slot0 = class("CommanderSkill", import("..BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.exp = slot1.exp
end

function slot0.getExp(slot0)
	return slot0.exp
end

function slot0.bindConfigTable(slot0)
	return pg.commander_skill_template
end

function slot0.getLevel(slot0)
	return slot0:getConfig("lv")
end

function slot0.isMaxLevel(slot0)
	return slot0:getConfig("next_id") == 0
end

function slot0.getNextLevelExp(slot0)
	return slot0:getConfig("exp")
end

function slot0.addExp(slot0, slot1)
	slot0.exp = slot0.exp + slot1

	while slot0:canLevelUp() do
		slot0.exp = slot0.exp - slot0:getNextLevelExp()
		slot0.id = slot0:getConfig("next_id")
		slot0.configId = slot0.id
	end
end

function slot0.canLevelUp(slot0)
	return slot0:getNextLevelExp() <= slot0.exp and not slot0:isMaxLevel()
end

function slot0.getTacticSkill(slot0)
	return slot0:getConfig("effect_tactic")
end

function slot0.getDesc(slot0)
	slot1 = ""
	slot2 = slot0:getLevel()

	for slot7, slot8 in ipairs(slot3) do
		slot1 = slot1 .. ((slot2 < slot8[1] and "<color=#a3a2a2>Lv.") or "Lv.") .. slot8[1] .. "：" .. slot8[2] .. ((slot2 < slot8[1] and "</color>") or "") .. "\n"
	end

	return slot1
end

return slot0
