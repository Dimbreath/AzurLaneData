ys = ys or {}
slot1 = class("BattleBuffDiva", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffDiva = slot1
slot1.__name = "BattleBuffDiva"

slot1.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot1.onInitGame = function (slot0, slot1, slot2)
	playBGM(slot0.Battle.BattleDataProxy.GetInstance():GetBGMList()[math.random(#slot0.Battle.BattleDataProxy.GetInstance().GetBGMList())])
end

slot1.onTrigger = function (slot0)
	playBGM(slot0.Battle.BattleDataProxy.GetInstance():GetBGMList(true)[math.random(#slot0.Battle.BattleDataProxy.GetInstance().GetBGMList(true))])
end

return
