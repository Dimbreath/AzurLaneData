ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleSubmarineFuncVO = class("BattleSubmarineFuncVO")
ys.Battle.BattleSubmarineFuncVO.__name = "BattleSubmarineFuncVO"

function ys.Battle.BattleSubmarineFuncVO.Ctor(slot0, slot1)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._isOverLoad = false
	slot0._current = slot1
	slot0._defaultMax = slot1
	slot0._active = true

	slot0:ResetMax()
end

function ys.Battle.BattleSubmarineFuncVO.Update(slot0, slot1)
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

function ys.Battle.BattleSubmarineFuncVO.SetActive(slot0, slot1)
	slot0._active = slot1
end

function ys.Battle.BattleSubmarineFuncVO.ResetCurrent(slot0)
	slot0._current = 0
	slot0._reloadStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	slot0:DispatchOverLoadChange()
end

function ys.Battle.BattleSubmarineFuncVO.ResetMax(slot0)
	slot0._max = slot0._defaultMax
end

function ys.Battle.BattleSubmarineFuncVO.SetMax(slot0, slot1)
	slot0._max = slot1
end

function ys.Battle.BattleSubmarineFuncVO.GetMax(slot0)
	return slot0._max
end

function ys.Battle.BattleSubmarineFuncVO.GetCurrent(slot0)
	return slot0._current
end

function ys.Battle.BattleSubmarineFuncVO.IsOverLoad(slot0)
	return slot0._current < slot0._max
end

function ys.Battle.BattleSubmarineFuncVO.GetNextTimeStamp(slot0)
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

function ys.Battle.BattleSubmarineFuncVO.DispatchOverLoadChange(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleEvent.OVER_LOAD_CHANGE))
end

function ys.Battle.BattleSubmarineFuncVO.Dispose(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._focusTimer)

	slot0._focusTimer = nil

	slot0.EventDispatcher.DetachEventDispatcher(slot0)
end

return
