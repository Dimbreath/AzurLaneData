ys = ys or {}
ys.Battle.BattleCommand = class("BattleCommand", ys.MVC.Command)
ys.Battle.BattleCommand.__name = "BattleCommand"

ys.Battle.BattleCommand.Ctor = function (slot0)
	slot0.Battle.BattleCommand.super.Ctor(slot0)
end

ys.Battle.BattleCommand.Initialize = function (slot0)
	slot0.Battle.BattleCommand.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot0.Battle.BattleDataProxy.__name)

	slot0:InitProtocol()
	slot0:InitBattleEvent()
end

ys.Battle.BattleCommand.StartBattle = function (slot0)
	slot0._state:Active()
end

ys.Battle.BattleCommand.InitProtocol = function (slot0)
	return
end

ys.Battle.BattleCommand.InitBattleEvent = function (slot0)
	return
end

return
