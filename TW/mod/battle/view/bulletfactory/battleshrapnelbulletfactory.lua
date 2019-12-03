ys = ys or {}
ys.Battle.BattleShrapnelBulletFactory = singletonClass("BattleShrapnelBulletFactory", ys.Battle.BattleBulletFactory)
ys.Battle.BattleShrapnelBulletFactory.__name = "BattleShrapnelBulletFactory"

function ys.Battle.BattleShrapnelBulletFactory.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleShrapnelBulletFactory.MakeBullet(slot0)
	return slot0.Battle.BattleShrapnelBullet.New()
end

function ys.Battle.BattleShrapnelBulletFactory.onBulletHitFunc(slot0, slot1, slot2)
	slot3 = slot0:GetBulletData()

	if slot3:GetCurrentState() ~= slot3.STATE_SPLIT then
		if slot4 == slot3.STATE_SPIN then
		elseif slot3:GetPierceCount() > 0 then
			slot0.Battle.BattleCannonBulletFactory.onBulletHitFunc(slot0, slot1, slot2)

			return
		end
	end

	slot5 = slot1.GetDataProxy()
	slot7 = slot3:GetTemplate().extra_param.shrapnel

	if slot1 ~= nil and slot2 ~= nil then
		slot8 = nil

		if slot2 == slot0.Battle.BattleConst.UnitType.AIRCRAFT_UNIT then
			slot8 = slot1.GetSceneMediator():GetAircraft(slot1)
		elseif slot2 == slot0.Battle.BattleConst.UnitType.PLAYER_UNIT then
			slot8 = slot1.GetSceneMediator():GetCharacter(slot1)
		elseif slot2 == slot0.Battle.BattleConst.UnitType.ENEMY_UNIT then
			slot8 = slot1.GetSceneMediator():GetCharacter(slot1)
		end

		slot10 = slot8:AddFX(slot0:GetFXID())

		if slot8:GetUnitData().GetIFF(slot9) == slot5:GetFoeCode() then
			slot10.transform.localRotation = Vector3(slot10.transform.localRotation.x, 180, slot10.transform.localRotation.z)
		end
	end

	slot0.Battle.PlayBattleSFX(slot6.hit_sfx)

	slot8 = slot3:GetSrcHost()
	slot9 = slot3:GetWeapon()

	if slot6.extra_param.FXID ~= nil then
		slot14, slot16 = slot1.GetFXPool():GetFX(slot6.extra_param.FXID)

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot10, slot11:Add(slot0:GetPosition()), true)
	end

	slot10 = nil
	slot10 = (slot3:GetSpeed().x > 0 and 0) or 180
	slot11 = 0

	for slot15, slot16 in ipairs(slot7) do
		slot18 = slot16.bullet_ID

		slot0.Battle[slot16.emitterType or slot0.Battle.BattleWeaponUnit.EMITTER_SHOTGUN].New(slot20, slot22, slot16.barrage_ID).Ready(nil)
		slot0.Battle[slot16.emitterType or slot0.Battle.BattleWeaponUnit.EMITTER_SHOTGUN].New(slot20, slot22, slot16.barrage_ID):Fire(nil, slot9:GetDirection(), slot0.Battle.BattleDataFunction.GetBarrageTmpDataFromID(slot16.barrage_ID).angle)
	end
end

function ys.Battle.BattleShrapnelBulletFactory.onBulletMissFunc(slot0)
	return
end

function ys.Battle.BattleShrapnelBulletFactory.MakeModel(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1:GetBulletData()

	if not slot0:GetBulletPool():InstBullet(slot1:GetModleID(), function (slot0)
		if slot0:AddModel(slot0) == true and slot1:GetTemplate().track_fx ~= "" then
			slot4, slot8 = slot2:GetFXPool():GetFX(slot0:GetTrackFXID())

			slot2:MakeTrack(slot0, slot2, slot3)
		end
	end) then
		slot1:AddTempModel(slot0:GetTempGOPool():GetObject())
	end

	slot1:SetSpawn(slot2)
	slot1:SetFXFunc(slot0.onBulletHitFunc, slot0.onBulletMissFunc)
	slot0:GetSceneMediator():AddBullet(slot1)
end

function ys.Battle.BattleShrapnelBulletFactory.OutRangeFunc(slot0)
	if slot0:IsOutRange() then
		slot0:ChangeShrapnelState(slot0.Battle.BattleShrapnelBulletUnit.STATE_SPIN)
	else
		slot0:ChangeShrapnelState(slot0.Battle.BattleShrapnelBulletUnit.STATE_SPLIT)
	end
end

return
