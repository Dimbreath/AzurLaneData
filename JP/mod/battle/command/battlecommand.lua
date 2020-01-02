ys = ys or {}
ys.Battle.BattleCommand = class("BattleCommand", ys.MVC.Command)
ys.Battle.BattleCommand.__name = "BattleCommand"

function ys.Battle.BattleCommand.Ctor(slot0)
	slot0.Battle.BattleCommand.super.Ctor(slot0)
end

function ys.Battle.BattleCommand.Initialize(slot0)
	slot0.Battle.BattleCommand.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot0.Battle.BattleDataProxy.__name)

	slot0:InitProtocol()
	slot0:InitBattleEvent()
end

function ys.Battle.BattleCommand.StartBattle(slot0)
	slot0._state:Active()
end

function ys.Battle.BattleCommand.InitProtocol(slot0)
	return
end

function ys.Battle.BattleCommand.InitBattleEvent(slot0)
	return
end

return
