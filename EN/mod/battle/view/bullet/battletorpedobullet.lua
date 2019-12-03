ys = ys or {}
slot1 = ys.Battle.BattleTorpedoBullet
slot2 = ys.Battle.BattleResourceManager
ys.Battle.BattleTorpedoBullet = class("BattleTorpedoBullet", ys.Battle.BattleBullet)
ys.Battle.BattleTorpedoBullet.__name = "BattleTorpedoBullet"

ys.Battle.BattleTorpedoBullet.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.BattleTorpedoBullet.Dispose = function (slot0)
	if slot0._alert then
		slot0._alert:Dispose()
	end

	slot0.super.Dispose(slot0)
end

ys.Battle.BattleTorpedoBullet.Advance = function (slot0)
	slot0._speed = slot0._speed * 2
end

ys.Battle.BattleTorpedoBullet.GetZExtraOffset = function (slot0)
	return 0
end

ys.Battle.BattleTorpedoBullet.MakeAlert = function (slot0, slot1)
	slot0._alert = slot0.Battle.TorAlert.New(slot1)

	slot0._alert:SetPosition(slot0._bulletData:GetPosition(), slot0._bulletData:GetYAngle())
end

ys.Battle.BattleTorpedoBullet.Neutrailze = function (slot0)
	SetActive(slot0._go, false)
end

return
