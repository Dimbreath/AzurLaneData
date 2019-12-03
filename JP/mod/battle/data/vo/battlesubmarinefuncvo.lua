ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleSubmarineFuncVO = class("BattleSubmarineFuncVO")
ys.Battle.BattleSubmarineFuncVO.__name = "BattleSubmarineFuncVO"

ys.Battle.BattleSubmarineFuncVO.Ctor = function (slot0, slot1)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._isOverLoad = false
	slot0._current = slot1
	slot0._defaultMax = slot1
	slot0._active = true

	slot0:ResetMax()
end

ys.Battle.BattleSubmarineFuncVO.Update = function (slot0, slot1)
	if slot0._active and slot0._current < slot0._max then
		if slot0._max <= slot1 - slot0._reloadStartTime then
			slot0:ResetMax()

			slot0._current = slot0._max
			slot0._reloadStartTime = nil

			slot0:DispatchOverLoadChange()
		else
			slot0._current = slot2
		end
	end
end

ys.Battle.BattleSubmarineFuncVO.SetActive = function (slot0, slot1)
	slot0._active = slot1
end

ys.Battle.BattleSubmarineFuncVO.ResetCurrent = function (slot0)
	slot0._current = 0
	slot0._reloadStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	slot0:DispatchOverLoadChange()
end

ys.Battle.BattleSubmarineFuncVO.ResetMax = function (slot0)
	slot0._max = slot0._defaultMax
end

ys.Battle.BattleSubmarineFuncVO.SetMax = function (slot0, slot1)
	slot0._max = slot1
end

ys.Battle.BattleSubmarineFuncVO.GetMax = function (slot0)
	return slot0._max
end

ys.Battle.BattleSubmarineFuncVO.GetCurrent = function (slot0)
	return slot0._current
end

ys.Battle.BattleSubmarineFuncVO.IsOverLoad = function (slot0)
	return slot0._current < slot0._max
end

ys.Battle.BattleSubmarineFuncVO.GetNextTimeStamp = function (slot0)
	slot1 = nil

	if #slot0._chargingList > 0 then
		tiemStampB = slot0._chargingList[1].GetReloadFinishTimeStamp(slot1)

		for slot5, slot6 in ipairs(slot0._chargingList) do
			tiemStampB = slot1:GetReloadFinishTimeStamp()

			if slot6:GetReloadFinishTimeStamp() < tiemStampB then
				slot1 = slot6
				tiemStampB = slot7
			end
		end
	end

	return tiemStampB
end

ys.Battle.BattleSubmarineFuncVO.DispatchOverLoadChange = function (slot0)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleEvent.OVER_LOAD_CHANGE))
end

ys.Battle.BattleSubmarineFuncVO.Dispose = function (slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._focusTimer)

	slot0._focusTimer = nil

	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

return
