ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleSkillProjectShelter", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillProjectShelter = slot3
slot3.__name = "BattleSkillProjectShelter"

function slot3.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)

	slot0._duration = slot0._tempData.arg_list.duration
	slot0._offset = slot0._tempData.arg_list.offset
	slot0._fxID = slot0._tempData.arg_list.effect
	slot0._box = slot0._tempData.arg_list.box
	slot0._count = slot0._tempData.arg_list.count
end

function slot3.DoDataEffect(slot0, slot1)
	slot3 = slot0.Battle.BattleDataProxy.GetInstance().SpawnShelter(slot2, slot0._box, slot0._duration)

	if slot1:GetIFF() == slot1.FOE_CODE then
		slot0._offset[1] = slot0._offset[1] * -1
	end

	slot3:SetIFF(slot4)
	slot3:SetArgs(slot0._count, slot0._duration, slot0._box, slot5, slot0._fxID)
	slot3:SetStartTimeStamp(pg.TimeMgr.GetInstance():GetCombatTime())
	slot2:DispatchEvent(slot0.Event.New(slot2.ADD_SHELTER, {
		shelter = slot3
	}))
end

function slot3.DataEffectWithoutTarget(slot0, slot1)
	slot0:DoDataEffect(slot1)
end

return
