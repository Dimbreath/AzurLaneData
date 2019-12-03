ys = ys or {}
ys.Battle.BattleBuffLink = class("BattleBuffLink", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffLink.__name = "BattleBuffLink"

ys.Battle.BattleBuffLink.Ctor = function (slot0, slot1)
	slot0.Battle.BattleBuffLink.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffLink.SetArgs = function (slot0, slot1, slot2)
	slot0._target = slot0._tempData.arg_list.target
	slot0._buff_id = slot0._tempData.arg_list.buff_id
end

ys.Battle.BattleBuffLink.Trigger = function (slot0, slot1, slot2, slot3, slot4)
	if slot0:getTargetList(slot2, slot0._target, slot0._tempData.arg_list) then
		for slot9, slot10 in ipairs(slot5) do
			if slot10:GetBuff(slot0._buff_id) then
				slot11:onTrigger(slot1, slot10, slot4)
			end
		end
	end
end

return
