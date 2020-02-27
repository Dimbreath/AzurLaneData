ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleElectricArcBulletFactory = singletonClass("BattleElectricArcBulletFactory", ys.Battle.BattleBulletFactory)
ys.Battle.BattleElectricArcBulletFactory.__name = "BattleElectricArcBulletFactory"

function ys.Battle.BattleElectricArcBulletFactory.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleElectricArcBulletFactory.CreateBullet(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:PlayFireFX(slot1, slot2, slot3, slot4, slot5, nil)

	if slot2:GetDirectHitUnit() == nil then
		return
	end

	slot7 = slot6:GetUniqueID()
	slot9 = nil

	if slot6:GetUnitType() == slot0.Battle.BattleConst.UnitType.AIRCRAFT_UNIT or slot8 == slot0.Battle.BattleConst.UnitType.AIRFIGHTER_UNIT then
		slot9 = slot0:GetSceneMediator():GetAircraft(slot7)
	elseif slot8 == slot0.Battle.BattleConst.UnitType.PLAYER_UNIT then
		slot9 = slot0:GetSceneMediator():GetCharacter(slot7)
	elseif slot8 == slot0.Battle.BattleConst.UnitType.ENEMY_UNIT then
		slot9 = slot0:GetSceneMediator():GetCharacter(slot7)
	elseif slot8 == slot0.Battle.BattleConst.UnitType.NPC_UNIT then
		slot9 = slot0:GetSceneMediator():GetCharacter(slot7)
	end

	if slot9 then
		slot9:AddFX(slot2:GetTemplate().hit_fx)
		slot0:GetDataProxy():HandleDamage(slot2, slot6)

		if slot2:GetWeapon():GetHost() then
			slot0:GetSceneMediator():AddArcEffect(slot2:GetTemplate().modle_ID, slot0:GetSceneMediator():GetCharacter(slot10:GetUniqueID()), slot6, slot2:GetWeapon():GetTemplateData().spawn_bound)
		end
	end
end

return
