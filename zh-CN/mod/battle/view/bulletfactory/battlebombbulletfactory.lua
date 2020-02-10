ys = ys or {}
slot0 = ys
slot0.Battle.BattleBombBulletFactory = singletonClass("BattleBombBulletFactory", slot0.Battle.BattleBulletFactory)
slot0.Battle.BattleBombBulletFactory.__name = "BattleBombBulletFactory"
slot1 = slot0.Battle.BattleBombBulletFactory

function slot1.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot1.OutRangeFunc(slot0)
	slot1 = slot0:GetTemplate()
	slot2 = slot1.hit_type
	slot4 = slot0:GetDiveFilter()

	slot0:BuffTrigger(uv1.Battle.BattleConst.BuffEffectType.ON_BOMB_BULLET_BANG, {
		_bullet = slot0,
		equipIndex = slot0:GetWeapon():GetEquipmentIndex()
	})
	uv0.GetDataProxy():SpawnColumnArea(slot0:GetEffectField(), slot0:GetIFF(), slot0:GetExplodePostion(), slot2.range, slot2.time, function (slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.Active then
				slot7 = false

				for slot12, slot13 in ipairs(uv1) do
					if uv0.GetSceneMediator():GetCharacter(slot5.UID):GetUnitData():GetCurrentOxyState() == slot13 then
						slot7 = true
					end
				end

				if not slot7 then
					uv2:HandleDamage(uv3, slot6)
				end
			end
		end
	end)

	if slot1.extra_param.friendlyFire then
		slot3:SpawnColumnArea(slot0:GetEffectField(), slot3.GetOppoSideCode(slot0:GetIFF()), slot0:GetExplodePostion(), slot2.range, slot2.time, slot6)
	end

	slot3:RemoveBulletUnit(slot0:GetUniqueID())
end

function slot1.MakeBullet(slot0)
	return uv0.Battle.BattleBombBullet.New()
end

function slot1.onBulletHitFunc(slot0, slot1, slot2)
	slot3 = slot0:GetBulletData()

	uv0.Battle.PlayBattleSFX(slot3:GetTemplate().hit_sfx)

	slot5 = uv1.GetFXPool()
	slot10, slot13 = slot5:GetFX(slot0:GetFXID())

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot5, pg.Tool.FilterY(slot3:GetPosition()):Add(slot6), true)
end

function slot1.onBulletMissFunc()
end

function slot1.MakeModel(slot0, slot1, slot2)
	slot5, slot6, slot7, slot8 = slot0:GetDataProxy():GetTotalBounds()

	if slot1:GetBulletData():GetExplodePostion().z > slot5 + 3 then
		slot0:GetDataProxy():RemoveBulletUnit(slot3:GetUniqueID())

		return
	end

	slot9 = slot3:GetTemplate()

	if not slot0:GetBulletPool():InstBullet(slot1:GetModleID(), function (slot0)
		if uv0:AddModel(slot0) and uv1.track_fx ~= "" then
			slot1 = uv2:GetFXPool()
			slot6, slot7 = slot1:GetFX(uv0:GetTrackFXID())

			uv2:MakeTrack(uv0, slot1, slot2)
		end
	end) then
		slot1:AddTempModel(slot0:GetTempGOPool():GetObject())
	end

	slot1:SetSpawn(slot2)

	if slot3:GetIFF() ~= slot0:GetDataProxy():GetFriendlyCode() and slot3:GetExist() and slot9.alert_fx ~= "" then
		uv0.CreateBulletAlert(slot3)
	end

	slot3:SetExist(true)
	slot1:SetFXFunc(slot0.onBulletHitFunc, slot0.onBulletMissFunc)
	slot0:GetSceneMediator():AddBullet(slot1)
end

function slot1.CreateBulletAlert(slot0)
	slot2 = slot0:GetTemplate().alert_fx
	slot4 = uv0.Battle.BattleFXPool.GetInstance():GetFX(slot2).transform
	slot5 = 0

	if pg.effect_offset[slot2] and slot6[slot2].y_scale == true then
		slot5 = slot0:GetTemplate().hit_type.range
	end

	slot4.localScale = Vector3(slot1, slot5, slot1)

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot3, slot0:GetExplodePostion())
end
