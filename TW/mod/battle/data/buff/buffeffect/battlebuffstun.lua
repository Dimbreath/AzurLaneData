ys = ys or {}
ys.Battle.BattleBuffStun = class("BattleBuffStun", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffStun.__name = "BattleBuffStun"

ys.Battle.BattleBuffStun.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffStun.SetArgs = function (slot0, slot1, slot2)
	slot0._maxDistance = slot0._tempData.arg_list.max_distance
	slot0._check_target = slot0._tempData.arg_list.check_target or "TargetNull"
end

ys.Battle.BattleBuffStun.onAttach = function (slot0, slot1, slot2)
	if slot0.Battle.BattleAttr.IsStun(slot1) then
		return
	end

	for slot8, slot9 in ipairs(slot4) do
		if slot0:targetInBounds(slot1, slot9) then
			slot0:onTrigger(slot1, slot2)

			break
		end
	end
end

ys.Battle.BattleBuffStun.onUpdate = function (slot0, slot1, slot2)
	if slot0.Battle.BattleAttr.IsStun(slot1) then
		return
	end

	for slot8, slot9 in ipairs(slot4) do
		if slot0:targetInBounds(slot1, slot9) then
			slot0:onTrigger(slot1, slot2)

			break
		end
	end
end

ys.Battle.BattleBuffStun.onTrigger = function (slot0, slot1, slot2)
	slot0.super.onTrigger(slot0, slot1, slot2)
	slot1.Battle.BattleAttr.Stun(slot1)
	slot1:UpdateMoveLimit()
end

ys.Battle.BattleBuffStun.targetInBounds = function (slot0, slot1, slot2)
	if slot0._maxDistance then
		return slot1:GetDistance(slot2) <= slot0._maxDistance
	else
		return true
	end
end

ys.Battle.BattleBuffStun.onRemove = function (slot0, slot1, slot2)
	slot0.Battle.BattleAttr.CancelStun(slot1)
	slot1:UpdateMoveLimit()
end

return
