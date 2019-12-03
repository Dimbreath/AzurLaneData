ys = ys or {}
slot1 = ys.Battle.BattleResourceManager
ys.Battle.BattleCannonBullet = class("BattleCannonBullet", ys.Battle.BattleBullet)
ys.Battle.BattleCannonBullet.__name = "BattleCannonBullet"

function ys.Battle.BattleCannonBullet.Ctor(slot0, slot1, slot2)
	slot0.Battle.BattleCannonBullet.super.Ctor(slot0, slot1, slot2)
end

return
