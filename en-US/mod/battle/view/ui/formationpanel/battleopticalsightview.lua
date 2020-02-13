ys = ys or {}
ys.Battle.BattleOpticalSightView = class("BattleOpticalSightView")
ys.Battle.BattleOpticalSightView.__name = "BattleOpticalSightView"
ys.Battle.BattleOpticalSightView.SIGHT_A = ys.Battle.BattleConfig.ChargeWeaponConfig.SIGHT_A
ys.Battle.BattleOpticalSightView.SIGHT_B = ys.Battle.BattleConfig.ChargeWeaponConfig.SIGHT_B
ys.Battle.BattleOpticalSightView.SIGHT_C = ys.Battle.BattleConfig.ChargeWeaponConfig.SIGHT_C

function ys.Battle.BattleOpticalSightView.Ctor(slot0, slot1)
	slot0._sightTF = slot1:Find("Sight")
	slot0._rulerTF = slot1:Find("Ruler")
	slot0._cornerTF = slot1:Find("Corners")
	slot0._active = false
end

function ys.Battle.BattleOpticalSightView.SetAreaBound(slot0, slot1, slot2)
	slot0._totalLeftBound = slot1
	slot0._totalRightBound = slot2
end

function ys.Battle.BattleOpticalSightView.SetActive(slot0, slot1)
	slot0._active = slot1

	SetActive(slot0._sightTF, slot1)
	SetActive(slot0._rulerTF, slot1)
	SetActive(slot0._cornerTF, slot1)
end

function ys.Battle.BattleOpticalSightView.Update(slot0)
	if not slot0._active then
		return
	end

	slot0._sightTF.position = slot1.Battle.BattleVariable.CameraPosToUICamera(Vector3.New(slot1, 0, 5 + slot0._fleetVO:GetMotion():GetPos().z))
	slot0._rulerTF.position = Vector3.New(0, slot1.Battle.BattleVariable.CameraPosToUICamera(Vector3.New(slot1, 0, 5 + slot0._fleetVO.GetMotion().GetPos().z)).y)
end

function ys.Battle.BattleOpticalSightView.SetFleetVO(slot0, slot1)
	slot0._fleetVO = slot1
end

function ys.Battle.BattleOpticalSightView.Dispose(slot0)
	slot0._sightTF = nil
	slot0._rulerTF = nil
	slot0._cornerTF = nil
	slot0._fleetVO = nil
end

return
