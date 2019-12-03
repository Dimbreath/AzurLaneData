ys = ys or {}
ys.Battle.BattleBuffNewAI = class("BattleBuffNewAI", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffNewAI.__name = "BattleBuffNewAI"

ys.Battle.BattleBuffNewAI.Ctor = function (slot0, slot1)
	slot0.Battle.BattleBuffNewAI.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffNewAI.SetArgs = function (slot0, slot1, slot2)
	slot0._AIOnAttach = slot0._tempData.arg_list.ai_onAttach
	slot0._AIOnRemove = slot0._tempData.arg_list.ai_onRemove
end

ys.Battle.BattleBuffNewAI.onAttach = function (slot0, slot1, slot2)
	if slot0._AIOnAttach then
		slot1:SetAI(slot0._AIOnAttach)
	end
end

ys.Battle.BattleBuffNewAI.onRemove = function (slot0, slot1, slot2)
	if slot0._AIOnRemove then
		slot1:SetAI(slot0._AIOnRemove)
	end
end

return
