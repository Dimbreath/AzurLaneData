ys = ys or {}
ys.Battle.BattleBuffCastSkillRandom = class("BattleBuffCastSkillRandom", ys.Battle.BattleBuffCastSkill)
ys.Battle.BattleBuffCastSkillRandom.__name = "BattleBuffCastSkillRandom"

function ys.Battle.BattleBuffCastSkillRandom.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._skillIDList = {}
	slot0._skillList = {}
end

function ys.Battle.BattleBuffCastSkillRandom.SetArgs(slot0, slot1, slot2)
	slot0.super.SetArgs(slot0, slot1, slot2)

	slot4 = slot0._tempData.arg_list.skill_id_list
	slot5 = slot0._tempData.arg_list.range

	for slot9, slot10 in ipairs(slot0._tempData.arg_list.skill_id_list) do
		slot0._skillIDList[slot10] = slot5[slot9]
	end
end

function ys.Battle.BattleBuffCastSkillRandom.spell(slot0, slot1)
	slot2 = math.random()

	for slot6, slot7 in pairs(slot0._skillIDList) do
		slot9 = slot7[2]

		if slot7[1] <= slot2 and slot2 < slot9 then
			slot0._skillList[slot6] = slot0._skillList[slot6] or slot0.Battle.BattleSkillUnit.GenerateSpell(slot6, slot0._level, slot1, attData)
			slot10 = slot0._skillList[slot6]

			if attach and attach.target then
				slot10:SetTarget({
					attach.target
				})
			end

			slot10:Cast(slot1, slot0._commander)
		end
	end
end

function ys.Battle.BattleBuffCastSkillRandom.Clear(slot0)
	slot0.super.Clear(slot0)

	for slot4, slot5 in pairs(slot0._skillList) do
		slot5:Clear()
	end
end

return
