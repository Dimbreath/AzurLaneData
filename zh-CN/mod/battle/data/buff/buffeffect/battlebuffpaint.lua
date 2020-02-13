ys = ys or {}
ys.Battle.BattleBuffPaint = class("BattleBuffPaint", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffPaint.__name = "BattleBuffPaint"

function ys.Battle.BattleBuffPaint.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffPaint.SetArgs(slot0, slot1, slot2)
	slot0._paintName = slot0._tempData.arg_list.name or slot2._tempData.name
end

function ys.Battle.BattleBuffPaint.onTrigger(slot0, slot1, slot2, slot3)
	slot0.super.onTrigger(slot0, slot1, slot2, attach)
	slot1.Battle.BattleState.GetInstance().GetUIMediator(slot4):ShowSkillFloat(slot1, {
		name = slot0._paintName
	})
end

return
