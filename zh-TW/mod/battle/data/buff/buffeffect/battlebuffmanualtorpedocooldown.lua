ys = ys or {}
ys.Battle.BattleBuffManualTorpedoCoolDown = class("BattleBuffManualTorpedoCoolDown", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffManualTorpedoCoolDown.__name = "BattleBuffManualTorpedoCoolDown"

function ys.Battle.BattleBuffManualTorpedoCoolDown.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffManualTorpedoCoolDown.SetArgs(slot0, slot1, slot2)
	slot0._rant = slot0._tempData.arg_list.rant or 10000
end

function ys.Battle.BattleBuffManualTorpedoCoolDown.onTrigger(slot0, slot1)
	slot0.super.onTrigger(slot0, slot1, buff, attach)

	if slot1.Battle.BattleFormulas.IsHappen(slot0._rant) and slot1:GetTorpedoQueue():GetQueueHead() then
		slot2:QuickCoolDown()
	end
end

return
