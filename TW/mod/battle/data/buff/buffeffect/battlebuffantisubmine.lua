ys = ys or {}
slot1 = class("BattleBuffAntiSubMine", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAntiSubMine = slot1
slot1.__name = "BattleBuffAntiSubMine"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.onAttach(slot0, slot1)
	slot1:InitOxygen()
	slot1:ChangeOxygenState(slot0.Battle.OxyState.STATE_DEEP_MINE)
end

return
