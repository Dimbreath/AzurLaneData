ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
ys.Battle.BattleSkillEffect = class("BattleSkillEffect")
ys.Battle.BattleSkillEffect.__name = "BattleSkillEffect"

function ys.Battle.BattleSkillEffect.Ctor(slot0, slot1, slot2)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._tempData = slot1
	slot0._type = slot0._tempData.type
	slot0._targetChoise = slot0._tempData.target_choise or "TargetNull"
	slot0._casterAniEffect = slot0._tempData.casterAniEffect
	slot0._targetAniEffect = slot0._tempData.targetAniEffect
	slot0._delay = slot0._tempData.arg_list.delay or 0
	slot0._lastEffectTarget = {}
	slot0._timerList = {}
	slot0._timerIndex = 0
	slot0._level = slot2
end

function ys.Battle.BattleSkillEffect.SetCommander(slot0, slot1)
	slot0._commander = slot1
end

function ys.Battle.BattleSkillEffect.Effect(slot0, slot1, slot2, slot3)
	if slot2 and #slot2 > 0 then
		for slot7, slot8 in ipairs(slot2) do
			slot0:AniEffect(slot1, slot8)
			slot0:DataEffect(slot1, slot8, slot3)
		end
	else
		slot0:DataEffectWithoutTarget(slot1, slot3)
	end
end

function ys.Battle.BattleSkillEffect.AniEffect(slot0, slot1, slot2)
	slot3 = slot2:GetPosition()
	slot4 = slot1:GetPosition()

	if slot0._casterAniEffect and slot0._casterAniEffect ~= "" then
		slot6 = nil

		if slot0._casterAniEffect.posFun then
			function slot6(slot0)
				return slot0.posFun(slot0.posFun, , slot0)
			end
		end

		slot1:DispatchEvent(slot0.Event.New(slot1.ADD_EFFECT, {
			effect = slot5.effect,
			offset = slot5.offset,
			posFun = slot6
		}))
	end

	if slot0._targetAniEffect and slot0._targetAniEffect ~= "" then
		slot6 = nil

		if slot0._targetAniEffect.posFun then
			function slot6(slot0)
				return slot0.posFun(slot0.posFun, , slot0)
			end
		end

		slot2:DispatchEvent(slot0.Event.New(slot1.ADD_EFFECT, {
			effect = slot5.effect,
			offset = slot5.offset,
			posFun = slot6
		}))
	end
end

function ys.Battle.BattleSkillEffect.DataEffect(slot0, slot1, slot2, slot3)
	if slot0._delay > 0 then
		slot4 = nil
		slot0._timerIndex = slot0._timerIndex + 1
		slot0._timerList[slot0._timerIndex + 1] = pg.TimeMgr.GetInstance():AddBattleTimer("BattleSkill", -1, slot0._delay, function ()
			if slot0 and slot0:IsAlive() then
				slot1:DoDataEffect(slot1.DoDataEffect, , )
			end

			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot4)

			slot1._timerList[slot5] = nil
		end, true)

		return
	end

	slot0:DoDataEffect(slot1, slot2, slot3)
end

function ys.Battle.BattleSkillEffect.DoDataEffect(slot0, slot1, slot2, slot3)
	return
end

function ys.Battle.BattleSkillEffect.DataEffectWithoutTarget(slot0, slot1, slot2)
	if slot0._delay > 0 then
		slot3 = nil
		slot0._timerIndex = slot0._timerIndex + 1
		slot0._timerList[slot0._timerIndex + 1] = pg.TimeMgr.GetInstance():AddBattleTimer("BattleSkill", -1, slot0._delay, function ()
			if slot0 and slot0:IsAlive() then
				slot1:DoDataEffectWithoutTarget(slot1.DoDataEffectWithoutTarget, )
			end

			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot3)

			slot1._timerList[slot4] = nil
		end, true)

		return
	end

	slot0:DoDataEffectWithoutTarget(slot1, slot2)
end

function ys.Battle.BattleSkillEffect.DoDataEffectWithoutTarget(slot0, slot1, slot2)
	return
end

function ys.Battle.BattleSkillEffect.IsFilterTarget(slot0, slot1, slot2)
	slot3 = slot0._tempData.arg_list.effectFilter or {}
	slot4 = true

	for slot8, slot9 in ipairs(slot3) do
		if slot9[1] == "TargetID" then
			slot10 = slot2:GetTemplateID()

			if slot9[2] == "=" then
				if slot9[3] == slot10 then
					return true
				else
					slot4 = false
				end
			elseif slot9[2] == "~=" then
				if slot9[3] == slot10 then
					return false
				else
					slot4 = true
				end
			end
		end
	end

	return slot4
end

function ys.Battle.BattleSkillEffect.GetTarget(slot0, slot1, slot2)
	if type(slot0._targetChoise) == "string" then
		if slot0._targetChoise == "TargetSameToLastEffect" then
			return slot2._lastEffectTarget
		else
			return slot0.Battle.BattleTargetChoise[slot0._targetChoise](slot1, slot0._tempData.arg_list)
		end
	elseif type(slot0._targetChoise) == "table" then
		slot3 = nil

		for slot7, slot8 in ipairs(slot0._targetChoise) do
			slot3 = slot0.Battle.BattleTargetChoise[slot8](slot1, slot0._tempData.arg_list, slot3)
		end

		return slot3
	end
end

function ys.Battle.BattleSkillEffect.Clear(slot0)
	for slot4, slot5 in pairs(slot0._timerList) do
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot5)

		slot0._timerList[slot4] = nil
	end

	slot0._commander = nil
end

function ys.Battle.BattleSkillEffect.Dispose(slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

return
