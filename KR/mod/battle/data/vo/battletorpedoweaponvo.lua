ys = ys or {}
slot1 = ys.Battle.BattleConfig.TorpedoCFG
slot2 = class("BattleTorpedoWeaponVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleTorpedoWeaponVO = slot2
slot2.__name = "BattleTorpedoWeaponVO"

slot2.Ctor = function (slot0)
	slot0.super.Ctor(slot0, slot1.GCD)
end

slot2.AppendWeapon = function (slot0, slot1)
	slot0.super.AppendWeapon(slot0, slot1)
	slot1:SetPlayerTorpedoWeaponVO(slot0)
end

return
