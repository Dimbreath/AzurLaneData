ys = ys or {}
ys.Battle.BattleBuffBulletHitEmitter = class("BattleBuffBulletHitEmitter", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffBulletHitEmitter.__name = "BattleBuffBulletHitEmitter"

ys.Battle.BattleBuffBulletHitEmitter.Ctor = function (slot0, slot1)
	slot0.Battle.BattleBuffBulletHitEmitter.super.Ctor(slot0, slot1)
end

ys.Battle.BattleBuffBulletHitEmitter.SetArgs = function (slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number
	slot0._rate = slot0._tempData.arg_list.rate or 10000
	slot0._hitEmitterArgs = slot0._tempData.arg_list
end

ys.Battle.BattleBuffBulletHitEmitter.onBulletCreate = function (slot0, slot1, slot2, slot3)
	slot4 = slot3._bullet

	if slot0.Battle.BattleFormulas.IsHappen(slot0._rate) then
	end
end

return
