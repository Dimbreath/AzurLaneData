ys = ys or {}
slot1 = pg
ys or .MVC = ys.MVC or {}
ys or .MVC.Facade = singletonClass("MVC.Facade")
ys or .MVC.Facade.__name = "MVC.Facade"

ys or .MVC.Facade.Ctor = function (slot0)
	slot0:Initialize()
end

ys or .MVC.Facade.AddDataProxy = function (slot0, slot1)
	slot1._state = slot0

	slot1:ActiveProxy()

	slot0._proxyList[slot1.__name] = slot1

	return slot1
end

ys or .MVC.Facade.AddMediator = function (slot0, slot1)
	if slot1.__name ~= nil and type(slot1.__name) ~= "string" then
	end

	slot0._mediatorList[slot1.__name] = slot1
	slot1._state = slot0

	slot1:Initialize()

	return slot1
end

ys or .MVC.Facade.AddCommand = function (slot0, slot1)
	if slot1.__name ~= nil and type(slot1.__name) ~= "string" then
	end

	slot0._commandList[slot1.__name] = slot1
	slot1._state = slot0

	slot1:Initialize()

	return slot1
end

ys or .MVC.Facade.GetProxyByName = function (slot0, slot1)
	return slot0._proxyList[slot1]
end

ys or .MVC.Facade.GetMediatorByName = function (slot0, slot1)
	return slot0._mediatorList[slot1]
end

ys or .MVC.Facade.GetCommandByName = function (slot0, slot1)
	return slot0._commandList[slot1]
end

ys or .MVC.Facade.RemoveMediator = function (slot0, slot1)
	if type(slot1) == "string" then
		slot1 = slot0._mediatorList[slot1]
	end

	slot1:Dispose()

	slot0._mediatorList[slot1.__name] = nil
end

ys or .MVC.Facade.RemoveCommand = function (slot0, slot1)
	if type(slot1) == "string" then
		slot1 = slot0._commandList[slot1]
	end

	slot1:Dispose()

	slot0._commandList[slot1.__name] = nil
end

ys or .MVC.Facade.RemoveProxy = function (slot0, slot1)
	if type(slot1) == "string" then
		slot1 = slot0._proxyList[slot1]
	end

	slot1:DeactiveProxy()

	slot0._proxyList[slot1.__name] = nil
end

ys or .MVC.Facade.Initialize = function (slot0)
	slot0._proxyList = {}
	slot0._commandList = {}
	slot0._mediatorList = {}
end

ys or .MVC.Facade.Active = function (slot0)
	if not slot0._isPause then
		return
	end

	slot0._isPause = false

	slot0.TimeMgr.GetInstance():ResumeBattleTimer()
end

ys or .MVC.Facade.Deactive = function (slot0)
	if slot0._isPause then
		return
	end

	slot0._isPause = true

	slot0.TimeMgr.GetInstance():PauseBattleTimer()
end

ys or .MVC.Facade.ActiveEscape = function (slot0)
	slot0._escapeAITimer = slot0.TimeMgr.GetInstance():AddTimer("escapeTimer", 0, slot1.Battle.BattleConfig.viewInterval, function ()
		slot0:escapeUpdate()
	end)
end

ys or .MVC.Facade.DeactiveEscape = function (slot0)
	slot0.TimeMgr.GetInstance():RemoveTimer(slot0._escapeAITimer)
end

ys or .MVC.Facade.RemoveAllTimer = function (slot0)
	slot0.TimeMgr.GetInstance():RemoveAllBattleTimer()

	slot0._calcTimer = nil
	slot0._AITimer = nil
end

ys or .MVC.Facade.ResetTimer = function (slot0)
	slot1 = slot0.TimeMgr.GetInstance()

	slot1:ResetCombatTime()
	slot1:RemoveBattleTimer(slot0._calcTimer)
	slot1:RemoveBattleTimer(slot0._AITimer)

	slot0._calcTimer = slot1:AddBattleTimer("calcTimer", -1, slot1.Battle.BattleConfig.calcInterval, function ()
		slot0:calcUpdate()
	end)
end

ys or .MVC.Facade.ActiveAutoComponentTimer = function (slot0)
	slot0._AITimer = slot0.TimeMgr.GetInstance():AddBattleTimer("aiTimer", -1, slot1.Battle.BattleConfig.AIInterval, function ()
		slot0:aiUpdate()
	end)
end

ys or .MVC.Facade.calcUpdate = function (slot0)
	slot1 = slot0.TimeMgr.GetInstance():GetCombatTime()

	for slot5, slot6 in pairs(slot0._proxyList) do
		slot6:Update(slot1)
	end

	for slot5, slot6 in pairs(slot0._commandList) do
		slot6:Update(slot1)
	end
end

ys or .MVC.Facade.aiUpdate = function (slot0)
	slot1 = slot0:GetProxyByName(slot0.Battle.BattleDataProxy.__name)

	slot1:UpdateAutoComponent(slot1.TimeMgr.GetInstance():GetCombatTime())
end

ys or .MVC.Facade.escapeUpdate = function (slot0)
	slot1 = slot0:GetProxyByName(slot0.Battle.BattleDataProxy.__name)

	slot1:UpdateEscapeOnly(slot2)
	slot0:GetMediatorByName(slot0.Battle.BattleSceneMediator.__name):UpdateEscapeOnly(slot1.TimeMgr.GetInstance():GetCombatTime())
end

return
