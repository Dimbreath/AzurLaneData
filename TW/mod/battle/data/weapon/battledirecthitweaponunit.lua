ys = ys or {}
ys.Battle.BattleDirectHitWeaponUnit = class("BattleDirectHitWeaponUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleDirectHitWeaponUnit.__name = "BattleDirectHitWeaponUnit"

function ys.Battle.BattleDirectHitWeaponUnit.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleDirectHitWeaponUnit.Spawn(slot0, slot1, slot2)
	slot3 = slot0.super.Spawn(slot0, slot1, slot2)

	slot3:SetDirectHitUnit(slot2)

	return slot3
end

return
