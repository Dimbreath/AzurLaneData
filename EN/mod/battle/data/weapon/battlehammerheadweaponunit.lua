ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = ys.Battle.BattleConst
ys.Battle.BattleHammerHeadWeaponUnit = class("BattleHammerHeadWeaponUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleHammerHeadWeaponUnit.__name = "BattleHammerHeadWeaponUnit"

function ys.Battle.BattleHammerHeadWeaponUnit.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleHammerHeadWeaponUnit.DoAttack(slot0, slot1)
	if slot0._tmpData.bullet_ID[1] then
		if slot0.GetBulletTmpDataFromID(slot0._tmpData.bullet_ID[1]).type == slot1.BulletType.DIRECT or slot2 == slot1.BulletType.ANTI_AIR or slot2 == slot1.BulletType.ANTI_SEA then
			slot3 = slot0:Spawn(slot0._tmpData.bullet_ID[1], slot1)

			slot3:SetDirectHitUnit(slot1)
			slot0:DispatchBulletEvent(slot3)
		else
			slot2.super.DoAttack(slot0, slot1)
			slot0._host:HandleDamageToDeath()

			return
		end
	end

	slot3.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:TriggerBuffOnFire()
	slot0:CheckAndShake()
	slot0._host:HandleDamageToDeath()
end

return
