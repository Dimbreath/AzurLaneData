ys = ys or {}
slot1 = ys.Battle.BattleBulletEvent
slot2 = ys.Battle.BattleResourceManager
slot3 = ys.Battle.BattleConfig
slot4 = class("BattleBombBullet", ys.Battle.BattleBullet)
ys.Battle.BattleBombBullet = slot4
slot4.__name = "BattleBombBullet"

function slot4.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot4.Dispose(slot0)
	if slot0._alert then
		slot0._alert:Dispose()
	end

	slot0.super.Dispose(slot0)
end

function slot4.AddBulletEvent(slot0)
	slot0._bulletData:RegisterEventListener(slot0, slot0.EXPLODE, slot0.onBulletExplode)
end

function slot4.RemoveBulletEvent(slot0)
	slot0._bulletData:UnregisterEventListener(slot0, slot0.EXPLODE)
end

function slot4.onBulletExplode(slot0, slot1)
	slot0:_bulletHitFunc()
end

function slot4.UpdatePosition(slot0)
	slot0._tf.localPosition = Vector3.Lerp(slot0._tf.localPosition, slot0:GetPosition(), slot0.BulletMotionRate)
end

return
