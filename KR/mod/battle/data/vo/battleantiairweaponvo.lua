ys = ys or {}
slot2 = ys.Battle.BattleAttr
slot3 = ys.Battle.BattleConfig.AntiAirConfig
ys.Battle.BattleAntiAirWeaponVO = class("BattleAntiAirWeaponVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleAntiAirWeaponVO.__name = "BattleAntiAirWeaponVO"

ys.Battle.BattleAntiAirWeaponVO.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._restoreDenominator = slot1.const_A

	slot0:ResetCost()

	slot0._restoreInterval = slot1.Restore_Interval
end

ys.Battle.BattleAntiAirWeaponVO.SetBattleFleetVO = function (slot0, slot1)
	slot0._battleFleetVO = slot1
end

ys.Battle.BattleAntiAirWeaponVO.AppendWeapon = function (slot0, slot1)
	slot0.super.AppendWeapon(slot0, slot1)
	slot1:SetTotalDurabilityInfo(slot0)
end

ys.Battle.BattleAntiAirWeaponVO.RemoveWeapon = function (slot0, slot1)
	slot0._total = slot0._total - 1
	slot0._count = slot0._count - 1

	return slot0.deleteElementFromArray(slot1, slot0._weaponList)
end

ys.Battle.BattleAntiAirWeaponVO.SetMax = function (slot0, slot1)
	if slot0._max < slot1 then
		slot0._current = slot0._current + slot1 - slot0._max
	end

	slot0.super.SetMax(slot0, slot1)

	if slot0._max < slot0._current then
		slot0._current = slot0._max
	end
end

ys.Battle.BattleAntiAirWeaponVO.SetAverageReload = function (slot0, slot1)
	slot0._fleetReload = slot1
end

ys.Battle.BattleAntiAirWeaponVO.GetMaxRange = function (slot0)
	slot2 = 0

	if #slot0._battleFleetVO:GetScoutList() > 0 then
		slot4 = nil

		for slot8 = 1, slot3, 1 do
			if #slot1[slot8]:GetAntiAirWeapon() > 0 then
				slot4 = slot1[slot8]

				break
			end
		end

		if slot4 then
			for slot9, slot10 in ipairs(slot5) do
				slot2 = math.max(slot2, slot10:GetTemplateData().range)
			end
		end
	end

	return slot2
end

ys.Battle.BattleAntiAirWeaponVO.SetActive = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._weaponList) do
		slot6:SetActive(slot1)
	end
end

ys.Battle.BattleAntiAirWeaponVO.Restore = function (slot0)
	slot0._current = slot0._current + slot0._fleetReload / slot0._restoreDenominator

	slot0:checkRestorState()
end

ys.Battle.BattleAntiAirWeaponVO.RestoreRate = function (slot0, slot1)
	slot0._current = slot0._current + slot0._max * slot1

	slot0:checkRestorState()
end

ys.Battle.BattleAntiAirWeaponVO.checkRestorState = function (slot0)
	if slot0._max <= slot0._current then
		slot0._current = slot0._max
		slot0._restoreDenominator = slot0.const_A
		slot0._isOverLoad = false

		slot0:RemoveRestoreTimer()
		slot0:DispatchOverLoadChange()
	end
end

ys.Battle.BattleAntiAirWeaponVO.Consume = function (slot0)
	slot0:RemoveRestoreTimer()

	slot0._current = slot0._current - slot0._consumeNormal

	if slot0._current <= 0 then
		slot0._current = 0
		slot0._restoreDenominator = slot0.const_B
		slot0._isOverLoad = true

		slot0:DispatchOverLoadChange()
	end
end

ys.Battle.BattleAntiAirWeaponVO.ResetCost = function (slot0, slot1)
	slot0._consumeNormal = slot1 or slot0.const_N
end

ys.Battle.BattleAntiAirWeaponVO.AddRestoreTimer = function (slot0)
	if slot0._restoreTimer or slot0._max <= slot0._current then
		return
	end

	slot0._restoreTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AARestoreTimer", -1, slot0._restoreInterval, function ()
		slot0:Restore()
	end, true)
end

ys.Battle.BattleAntiAirWeaponVO.RemoveRestoreTimer = function (slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._restoreTimer)

	slot0._restoreTimer = nil
end

ys.Battle.BattleAntiAirWeaponVO.Dispose = function (slot0)
	slot0._battleFleetVO = nil

	slot0.super.Dispose(slot0)
end

return
