ys = ys or {}
slot2 = ys.Battle.BattleAttr
slot3 = ys.Battle.BattleConfig.AntiAirConfig
ys.Battle.BattleAntiAirWeaponVO = class("BattleAntiAirWeaponVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleAntiAirWeaponVO.__name = "BattleAntiAirWeaponVO"

function ys.Battle.BattleAntiAirWeaponVO.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0._restoreDenominator = slot1.const_A

	slot0:ResetCost()

	slot0._restoreInterval = slot1.Restore_Interval
end

function ys.Battle.BattleAntiAirWeaponVO.SetBattleFleetVO(slot0, slot1)
	slot0._battleFleetVO = slot1
end

function ys.Battle.BattleAntiAirWeaponVO.AppendWeapon(slot0, slot1)
	slot0.super.AppendWeapon(slot0, slot1)
	slot1:SetTotalDurabilityInfo(slot0)
end

function ys.Battle.BattleAntiAirWeaponVO.RemoveWeapon(slot0, slot1)
	slot0._total = slot0._total - 1
	slot0._count = slot0._count - 1

	return slot0.deleteElementFromArray(slot1, slot0._weaponList)
end

function ys.Battle.BattleAntiAirWeaponVO.SetMax(slot0, slot1)
	if slot0._max < slot1 then
		slot0._current = slot0._current + slot1 - slot0._max
	end

	slot0.super.SetMax(slot0, slot1)

	if slot0._max < slot0._current then
		slot0._current = slot0._max
	end
end

function ys.Battle.BattleAntiAirWeaponVO.SetAverageReload(slot0, slot1)
	slot0._fleetReload = slot1
end

function ys.Battle.BattleAntiAirWeaponVO.GetMaxRange(slot0)
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

function ys.Battle.BattleAntiAirWeaponVO.SetActive(slot0, slot1)
	for slot5, slot6 in ipairs(slot0._weaponList) do
		slot6:SetActive(slot1)
	end
end

function ys.Battle.BattleAntiAirWeaponVO.Restore(slot0)
	slot0._current = slot0._current + slot0._fleetReload / slot0._restoreDenominator

	slot0:checkRestorState()
end

function ys.Battle.BattleAntiAirWeaponVO.RestoreRate(slot0, slot1)
	slot0._current = slot0._current + slot0._max * slot1

	slot0:checkRestorState()
end

function ys.Battle.BattleAntiAirWeaponVO.checkRestorState(slot0)
	if slot0._max <= slot0._current then
		slot0._current = slot0._max
		slot0._restoreDenominator = slot0.const_A
		slot0._isOverLoad = false

		slot0:RemoveRestoreTimer()
		slot0:DispatchOverLoadChange()
	end
end

function ys.Battle.BattleAntiAirWeaponVO.Consume(slot0)
	slot0:RemoveRestoreTimer()

	slot0._current = slot0._current - slot0._consumeNormal

	if slot0._current <= 0 then
		slot0._current = 0
		slot0._restoreDenominator = slot0.const_B
		slot0._isOverLoad = true

		slot0:DispatchOverLoadChange()
	end
end

function ys.Battle.BattleAntiAirWeaponVO.ResetCost(slot0, slot1)
	slot0._consumeNormal = slot1 or slot0.const_N
end

function ys.Battle.BattleAntiAirWeaponVO.AddRestoreTimer(slot0)
	if slot0._restoreTimer or slot0._max <= slot0._current then
		return
	end

	slot0._restoreTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AARestoreTimer", -1, slot0._restoreInterval, function ()
		slot0:Restore()
	end, true)
end

function ys.Battle.BattleAntiAirWeaponVO.RemoveRestoreTimer(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._restoreTimer)

	slot0._restoreTimer = nil
end

function ys.Battle.BattleAntiAirWeaponVO.Dispose(slot0)
	slot0._battleFleetVO = nil

	slot0.super.Dispose(slot0)
end

return
