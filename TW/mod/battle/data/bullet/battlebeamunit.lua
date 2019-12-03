ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleBeamUnit = class("BattleBeamUnit")
ys.Battle.BattleBeamUnit.__name = "BattleBeamUnit"
ys.Battle.BattleBeamUnit.BEAM_STATE_READY = "ready"
ys.Battle.BattleBeamUnit.BEAM_STATE_ATTACK = "attack"
ys.Battle.BattleBeamUnit.BEAM_STATE_FINISH = "finish"

ys.Battle.BattleBeamUnit.Ctor = function (slot0, slot1, slot2)
	slot0._bulletID = slot1
	slot0._beamInfoID = slot2
	slot0._cldList = {}
	slot0._beamState = slot0.BEAM_STATE_READY
end

ys.Battle.BattleBeamUnit.IsBeamActive = function (slot0)
	return slot0._aoe:GetActiveFlag()
end

ys.Battle.BattleBeamUnit.ClearBeam = function (slot0)
	slot0._beamState = slot0.BEAM_STATE_FINISH
	slot0._aoe = nil
	slot0._cldList = {}
	slot0._nextDamageTime = nil
end

ys.Battle.BattleBeamUnit.SetAoeData = function (slot0, slot1)
	slot0._aoe = slot1
	slot0._beamTemp = slot0.GetBarrageTmpDataFromID(slot0._beamInfoID)
	slot0._bulletTemp = slot0.GetBulletTmpDataFromID(slot0._bulletID)
	slot0._angle = slot0._beamTemp.angle

	slot0._aoe:SetAngle(slot0._angle)
end

ys.Battle.BattleBeamUnit.getAngleRatio = function (slot0)
	return slot0.GetSpeedRatio(slot0._aoe:GetTimeRationExemptKey(), slot0._aoe:GetIFF())
end

ys.Battle.BattleBeamUnit.GetAoeData = function (slot0)
	return slot0._aoe
end

ys.Battle.BattleBeamUnit.UpdateBeamPos = function (slot0, slot1)
	slot0._aoe:SetPosition(Vector3(slot1.x + slot0._beamTemp.offset_x, 0, slot1.z + slot0._beamTemp.offset_z))
end

ys.Battle.BattleBeamUnit.UpdateBeamAngle = function (slot0)
	slot0._angle = slot0._angle + slot0._beamTemp.delta_angle * slot0:getAngleRatio()

	slot0._aoe:SetAngle(slot0._angle)
end

ys.Battle.BattleBeamUnit.AddCldUnit = function (slot0, slot1)
	slot0._cldList[slot1:GetUniqueID()] = slot1
end

ys.Battle.BattleBeamUnit.RemoveCldUnit = function (slot0, slot1)
	slot0._cldList[slot1:GetUniqueID()] = nil
end

ys.Battle.BattleBeamUnit.ChangeBeamState = function (slot0, slot1)
	slot0._beamState = slot1
end

ys.Battle.BattleBeamUnit.GetBeamState = function (slot0)
	return slot0._beamState
end

ys.Battle.BattleBeamUnit.GetCldUnitList = function (slot0)
	return slot0._cldList
end

ys.Battle.BattleBeamUnit.BeginFocus = function (slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._beamTemp.senior_delay
end

ys.Battle.BattleBeamUnit.DealDamage = function (slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._beamTemp.delta_delay
end

ys.Battle.BattleBeamUnit.CanDealDamage = function (slot0)
	return slot0._nextDamageTime < pg.TimeMgr.GetInstance():GetCombatTime()
end

ys.Battle.BattleBeamUnit.GetFXID = function (slot0)
	return slot0._bulletTemp.hit_fx
end

ys.Battle.BattleBeamUnit.GetSFXID = function (slot0)
	return slot0._bulletTemp.hit_sfx
end

ys.Battle.BattleBeamUnit.GetBulletID = function (slot0)
	return slot0._bulletID
end

ys.Battle.BattleBeamUnit.GetBeamInfoID = function (slot0)
	return slot0._beamInfoID
end

return
