ys = ys or {}
ys.Battle.BattleBuffBulletHitEmitter = class("BattleBuffBulletHitEmitter", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffBulletHitEmitter.__name = "BattleBuffBulletHitEmitter"

function ys.Battle.BattleBuffBulletHitEmitter.Ctor(slot0, slot1)
	slot0.Battle.BattleBuffBulletHitEmitter.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffBulletHitEmitter.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number
	slot0._rate = slot0._tempData.arg_list.rate or 10000
	slot0._hitEmitterArgs = slot0._tempData.arg_list
end

function ys.Battle.BattleBuffBulletHitEmitter.onBulletCreate(slot0, slot1, slot2, slot3)
	slot4 = slot3._bullet

	if slot0.Battle.BattleFormulas.IsHappen(slot0._rate) then
	end
end

return
