ys = ys or {}
ys.Battle.BattleBuffCastSkill = class("BattleBuffCastSkill", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffCastSkill.__name = "BattleBuffCastSkill"
ys.Battle.BattleBuffCastSkill.FX_TYPE = ys.Battle.BattleBuffEffect.FX_TYPE_CASTER

function ys.Battle.BattleBuffCastSkill.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffCastSkill.GetEffectType(slot0)
	return slot0.FX_TYPE
end

function ys.Battle.BattleBuffCastSkill.GetGroupData(slot0)
	return slot0._group
end

function ys.Battle.BattleBuffCastSkill.SetArgs(slot0, slot1, slot2)
	slot0._level = slot2:GetLv()
	slot0._skill_id = slot0._tempData.arg_list.skill_id
	slot0._target = slot0._tempData.arg_list.target or "TargetSelf"
	slot0._check_target = slot3.check_target
	slot0._check_weapon = slot3.check_weapon
	slot0._targetMaxHPRatio = slot3.targetMaxHPRatio
	slot0._time = slot3.time or 0
	slot0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._time
	slot0._minTargetNumber = slot3.minTargetNumber or 0
	slot0._maxTargetNumber = slot3.maxTargetNumber or 10000
	slot0._minWeaponNumber = slot3.minWeaponNumber or 0
	slot0._maxWeaponNumber = slot3.maxWeaponNumber or 10000
	slot0._rant = slot3.rant or 10000
	slot0._streak = slot3.streakRange
	slot0._group = slot3.group
end

function ys.Battle.BattleBuffCastSkill.onBulletCreate(slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot3._bullet:SetBuffFun(slot0._tempData.arg_list.bulletTrigger, function (slot0, slot1)
		if slot0 and slot0:IsAlive() then
			slot0:castSkill(slot0, slot1)
		end
	end)
end

function ys.Battle.BattleBuffCastSkill.onTrigger(slot0, slot1, slot2, slot3)
	return slot0:castSkill(slot1, slot3)
end

function ys.Battle.BattleBuffCastSkill.castSkill(slot0, slot1, slot2)
	if slot0:IsInCD(pg.TimeMgr.GetInstance():GetCombatTime()) then
		return "overheat"
	end

	if not slot0.Battle.BattleFormulas.IsHappen(slot0._rant) then
		return "chance"
	end

	if slot0._check_target then
		if not slot0:getTargetList(slot1, slot0._check_target, slot0._tempData.arg_list) then
			return "check"
		end

		if #slot4 < slot0._minTargetNumber then
			return "check"
		end

		if slot0._maxTargetNumber < slot5 then
			return "check"
		end
	end

	if slot0._check_weapon then
		if #slot1:GetEquipmentList(slot0._tempData.arg_list) < slot0._minWeaponNumber then
			return "check"
		end

		if slot0._maxWeaponNumber < slot5 then
			return "check"
		end
	end

	if slot0._hpUpperBound or slot0._hpLowerBound then
		slot4 = nil

		if not slot0:hpIntervalRequire(((slot2 and slot2.unit) or slot1:GetHPRate()) and slot2.unit:GetHPRate()) then
			return "check"
		end
	end

	if slot0._attrInterval and not slot0:attrIntervalRequire(slot0.Battle.BattleAttr.GetBase(slot1, slot0._attrInterval)) then
		return "check"
	end

	if slot0._streak and not slot1.GetWinningStreak(slot0._streak) then
		return "check"
	end

	slot1.super.onTrigger(slot0, slot1)

	for slot8, slot9 in ipairs(slot4) do
		slot10 = true

		if slot0._group then
			for slot15, slot16 in pairs(slot11) do
				for slot20, slot21 in ipairs(slot16._effectList) do
					if slot21:GetEffectType() == slot1.FX_TYPE and slot21:GetGroupData() and slot21:GetGroupData().id == slot0._group.id and slot0._group.level < slot22.level then
						slot10 = false

						break
					end
				end
			end
		end

		if slot10 then
			slot0:spell(slot9)
		end
	end

	slot0:enterCoolDown(slot3)
end

function ys.Battle.BattleBuffCastSkill.IsInCD(slot0, slot1)
	return slot1 < slot0._nextEffectTime
end

function ys.Battle.BattleBuffCastSkill.spell(slot0, slot1)
	slot0._skill = slot0._skill or slot0.Battle.BattleSkillUnit.GenerateSpell(slot0._skill_id, slot0._level, slot1, attData)

	if attach and attach.target then
		slot0._skill:SetTarget({
			attach.target
		})
	end

	slot0._skill:Cast(slot1, slot0._commander)
end

function ys.Battle.BattleBuffCastSkill.enterCoolDown(slot0, slot1)
	if slot0._time and slot0._time > 0 then
		slot0._nextEffectTime = slot1 + slot0._time
	end
end

function ys.Battle.BattleBuffCastSkill.Clear(slot0)
	slot0.super.Clear(slot0)

	if slot0._skill then
		slot0._skill:Clear()
	end
end

function ys.Battle.BattleBuffCastSkill.GetWinningStreak(slot0)
	return slot0[1] <= slot0.Battle.BattleDataProxy.GetInstance():GetWinningStreak() and slot1 < slot0[2]
end

function ys.Battle.BattleBuffCastSkill.GetEquipmentList(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		slot3[slot7] = slot8
	end

	slot4 = #slot3

	while slot4 > 0 do
		slot6 = true

		if not slot3[slot4].equipment then
			slot6 = false
		else
			slot7 = slot0.Battle.BattleDataFunction.GetEquipDataTemplate(slot5.id)

			if slot1.weapon_group and not table.contains(slot1.weapon_group, slot7.group) then
				slot6 = false
			end

			if slot1.index and not table.contains(slot1.index, slot4) then
				slot6 = false
			end

			if slot1.type and not table.contains(slot1.type, slot7.type) then
				slot6 = false
			end

			if slot1.label then
				slot8 = slot0.Battle.BattleDataFunction.GetWeaponDataFromID(slot5.id).label

				for slot12, slot13 in ipairs(slot1.label) do
					if not table.contains(slot8, slot13) then
						slot6 = false

						break
					end
				end
			end
		end

		if not slot6 then
			table.remove(slot3, slot4)
		end

		slot4 = slot4 - 1
	end

	return slot3
end

return
