ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleBeamUnit = class("BattleBeamUnit")
ys.Battle.BattleBeamUnit.__name = "BattleBeamUnit"
ys.Battle.BattleBeamUnit.BEAM_STATE_READY = "ready"
ys.Battle.BattleBeamUnit.BEAM_STATE_ATTACK = "attack"
ys.Battle.BattleBeamUnit.BEAM_STATE_FINISH = "finish"

function ys.Battle.BattleBeamUnit.Ctor(slot0, slot1, slot2)
	slot0._bulletID = slot1
	slot0._beamInfoID = slot2
	slot0._cldList = {}
	slot0._beamState = slot0.BEAM_STATE_READY
end

function ys.Battle.BattleBeamUnit.IsBeamActive(slot0)
	return slot0._aoe:GetActiveFlag()
end

function ys.Battle.BattleBeamUnit.ClearBeam(slot0)
	slot0._beamState = slot0.BEAM_STATE_FINISH
	slot0._aoe = nil
	slot0._cldList = {}
	slot0._nextDamageTime = nil
end

function ys.Battle.BattleBeamUnit.SetAoeData(slot0, slot1)
	slot0._aoe = slot1
	slot0._beamTemp = slot0.GetBarrageTmpDataFromID(slot0._beamInfoID)
	slot0._bulletTemp = slot0.GetBulletTmpDataFromID(slot0._bulletID)
	slot0._angle = slot0._beamTemp.angle

	slot0._aoe:SetAngle(slot0._angle)
end

function ys.Battle.BattleBeamUnit.getAngleRatio(slot0)
	return slot0.GetSpeedRatio(slot0._aoe:GetTimeRationExemptKey(), slot0._aoe:GetIFF())
end

function ys.Battle.BattleBeamUnit.GetAoeData(slot0)
	return slot0._aoe
end

function ys.Battle.BattleBeamUnit.UpdateBeamPos(slot0, slot1)
	slot0._aoe:SetPosition(Vector3(slot1.x + slot0._beamTemp.offset_x, 0, slot1.z + slot0._beamTemp.offset_z))
end

function ys.Battle.BattleBeamUnit.UpdateBeamAngle(slot0)
	slot0._angle = slot0._angle + slot0._beamTemp.delta_angle * slot0:getAngleRatio()

	slot0._aoe:SetAngle(slot0._angle)
end

function ys.Battle.BattleBeamUnit.AddCldUnit(slot0, slot1)
	slot0._cldList[slot1:GetUniqueID()] = slot1
end

function ys.Battle.BattleBeamUnit.RemoveCldUnit(slot0, slot1)
	slot0._cldList[slot1:GetUniqueID()] = nil
end

function ys.Battle.BattleBeamUnit.ChangeBeamState(slot0, slot1)
	slot0._beamState = slot1
end

function ys.Battle.BattleBeamUnit.GetBeamState(slot0)
	return slot0._beamState
end

function ys.Battle.BattleBeamUnit.GetCldUnitList(slot0)
	return slot0._cldList
end

function ys.Battle.BattleBeamUnit.BeginFocus(slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._beamTemp.senior_delay
end

function ys.Battle.BattleBeamUnit.DealDamage(slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._beamTemp.delta_delay
end

function ys.Battle.BattleBeamUnit.CanDealDamage(slot0)
	return slot0._nextDamageTime < pg.TimeMgr.GetInstance():GetCombatTime()
end

function ys.Battle.BattleBeamUnit.GetFXID(slot0)
	return slot0._bulletTemp.hit_fx
end

function ys.Battle.BattleBeamUnit.GetSFXID(slot0)
	return slot0._bulletTemp.hit_sfx
end

function ys.Battle.BattleBeamUnit.GetBulletID(slot0)
	return slot0._bulletID
end

function ys.Battle.BattleBeamUnit.GetBeamInfoID(slot0)
	return slot0._beamInfoID
end

return
