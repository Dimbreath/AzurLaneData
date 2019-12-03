ys = ys or {}
ys.Battle.BattleJoyStickAutoBot = class("BattleJoyStickAutoBot")
ys.Battle.BattleJoyStickAutoBot.__name = "BattleJoyStickAutoBot"
ys.Battle.BattleJoyStickAutoBot.COUNTER_MAIN = "CounterMainRandomStrategy"
ys.Battle.BattleJoyStickAutoBot.RANDOM = "RandomStrategy"
ys.Battle.BattleJoyStickAutoBot.AUTO_PILOT = "RandomStrategy"

ys.Battle.BattleJoyStickAutoBot.Ctor = function (slot0, slot1, slot2)
	slot0._dataProxy = slot1
	slot0._fleetVO = slot2

	slot0:init()
end

ys.Battle.BattleJoyStickAutoBot.UpdateFleetArea = function (slot0)
	if slot0._strategy then
		slot0._strategy:SetBoardBound(slot0._fleetVO:GetFleetBound())
	end
end

ys.Battle.BattleJoyStickAutoBot.FleetFormationUpdate = function (slot0)
	if slot0._strategy:GetStrategyType() == slot0.AUTO_PILOT then
		slot0:SwitchStrategy(slot0.AUTO_PILOT)
	end
end

ys.Battle.BattleJoyStickAutoBot.SetActive = function (slot0, slot1)
	slot0._active = slot1

	if slot1 then
		slot0._fleetVO:SetMotionSource(function ()
			return slot0._strategy:Output()
		end)
	else
		slot0._fleetVO:SetMotionSource()
	end
end

ys.Battle.BattleJoyStickAutoBot.SwitchStrategy = function (slot0, slot1)
	if slot0._strategy then
		slot0._strategy:Dispose()
	end

	slot0._strategy = slot1 or slot0.RANDOM.Battle[slot1 or slot0.RANDOM].New(slot0._fleetVO)

	slot0:UpdateFleetArea()
	slot0._strategy:Input(slot0._dataProxy:GetFoeShipList(), slot0._dataProxy:GetFoeAircraftList())
end

ys.Battle.BattleJoyStickAutoBot.init = function (slot0)
	slot0._active = false
	slot0._uiMgr = pg.UIMgr.GetInstance()

	slot0:SwitchStrategy()
end

ys.Battle.BattleJoyStickAutoBot.Dispose = function (slot0)
	if slot0._strategy then
		slot0._strategy:Dispose()
	end

	slot0._dataProxy = nil
	slot0._uiMediator = nil
	slot0._uiMgr = nil
end

return
