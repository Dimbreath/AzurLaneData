ys = ys or {}
slot1 = class("BattleBuffDiva", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffDiva = slot1
slot1.__name = "BattleBuffDiva"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.onInitGame(slot0, slot1, slot2)
	playBGM(slot0.Battle.BattleDataProxy.GetInstance():GetBGMList()[math.random(#slot0.Battle.BattleDataProxy.GetInstance().GetBGMList())])
end

function slot1.onTrigger(slot0)
	playBGM(slot0.Battle.BattleDataProxy.GetInstance():GetBGMList(true)[math.random(#slot0.Battle.BattleDataProxy.GetInstance().GetBGMList(true))])
end

return
