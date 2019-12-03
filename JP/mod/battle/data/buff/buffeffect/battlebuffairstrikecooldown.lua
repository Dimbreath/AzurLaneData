ys = ys or {}
ys.Battle.BattleBuffAirStrikeCoolDown = class("BattleBuffAirStrikeCoolDown", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAirStrikeCoolDown.__name = "BattleBuffAirStrikeCoolDown"

ys.Battle.BattleBuffAirStrikeCoolDown.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffAirStrikeCoolDown.SetArgs = function (slot0, slot1, slot2)
	slot0._rant = slot0._tempData.arg_list.rant or 10000
end

ys.Battle.BattleBuffAirStrikeCoolDown.onTrigger = function (slot0, slot1)
	slot0.super.onTrigger(slot0, slot1, buff, attach)

	if slot1.Battle.BattleFormulas.IsHappen(slot0._rant) and slot1:GetAirAssistQueue():GetQueueHead() then
		slot2:QuickCoolDown()
	end
end

return
