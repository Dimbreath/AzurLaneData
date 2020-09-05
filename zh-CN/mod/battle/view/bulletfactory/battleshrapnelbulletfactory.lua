ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot0.Battle.BattleShrapnelBulletFactory = singletonClass("BattleShrapnelBulletFactory", slot0.Battle.BattleBulletFactory)
slot0.Battle.BattleShrapnelBulletFactory.__name = "BattleShrapnelBulletFactory"
slot2 = slot0.Battle.BattleShrapnelBulletFactory

function slot2.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot2.MakeBullet(slot0)
	return uv0.Battle.BattleShrapnelBullet.New()
end

function slot2.CreateBullet(slot0, slot1, slot2, slot3, slot4, slot5)
	slot2:SetOutRangeCallback(slot0.OutRangeFunc)

	slot6 = slot0:MakeBullet()

	slot6:SetFactory(slot0)
	slot6:SetBulletData(slot2)
	slot0:MakeModel(slot6, slot3, slot4, slot5)

	if slot4 and slot4 ~= "" then
		slot0:PlayFireFX(slot1, slot2, slot3, slot4, slot5, nil)
	end

	uv0.bulletSplit(slot6)

	return slot6
end

function slot2.onBulletHitFunc(slot0, slot1, slot2)
	slot3 = slot0:GetBulletData()

	if slot3:GetCurrentState() ~= slot3.STATE_SPLIT then
		if slot4 == slot3.STATE_SPIN then
			-- Nothing
		elseif slot3:GetPierceCount() > 0 then
			uv0.Battle.BattleCannonBulletFactory.onBulletHitFunc(slot0, slot1, slot2)

			return
		end
	end

	slot5 = uv1.GetDataProxy()
	slot6 = slot3:GetTemplate()

	if slot1 ~= nil and slot2 ~= nil then
		slot7 = nil

		if slot2 == uv0.Battle.BattleConst.UnitType.AIRCRAFT_UNIT then
			slot7 = uv1.GetSceneMediator():GetAircraft(slot1)
		elseif slot2 == uv0.Battle.BattleConst.UnitType.PLAYER_UNIT then
			slot7 = uv1.GetSceneMediator():GetCharacter(slot1)
		elseif slot2 == uv0.Battle.BattleConst.UnitType.ENEMY_UNIT then
			slot7 = uv1.GetSceneMediator():GetCharacter(slot1)
		end

		if slot7:GetUnitData():GetIFF() == slot5:GetFoeCode() then
			slot10 = slot7:AddFX(slot0:GetFXID()).transform
			slot11 = slot10.localRotation
			slot10.localRotation = Vector3(slot11.x, 180, slot11.z)
		end
	end

	uv0.Battle.PlayBattleSFX(slot6.hit_sfx)
	uv1.bulletSplit(slot0, true)
end

function slot2.bulletSplit(slot0, slot1)
	slot2 = slot0:GetBulletData()
	slot3 = uv0.GetDataProxy()
	slot4 = slot2:GetTemplate()
	slot5 = slot4.extra_param.shrapnel
	slot6 = slot2:GetSrcHost()
	slot7 = slot2:GetWeapon()

	if slot4.extra_param.FXID ~= nil then
		slot8, slot9 = uv0.GetFXPool():GetFX(slot4.extra_param.FXID)

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot8, slot9:Add(slot0:GetPosition()), true)
	end

	slot8 = nil
	slot8 = slot2:GetSpeed().x > 0 and 0 or 180

	for slot12, slot13 in ipairs(slot5) do
		if slot1 ~= slot13.initialSplit then
			slot14 = slot13.barrage_ID
			slot15 = slot13.bullet_ID
			slot17 = slot13.inheritAngle
			slot18 = slot13.reaim
			slot20 = nil
			slot20 = uv1.Battle[slot13.emitterType or uv1.Battle.BattleWeaponUnit.EMITTER_SHOTGUN].New(function (slot0, slot1, slot2, slot3)
				slot4 = uv0:CreateBulletUnit(uv1, uv2, uv3, Vector3.zero)

				slot4:OverrideCorrectedDMG(uv4.damage)
				slot4:SetOffsetPriority(slot3)
				slot4:SetShiftInfo(slot0, slot1)

				if uv8 then
					if uv9.Battle.BattleTargetChoise.TargetHarmNearest(uv6)[1] == nil then
						slot4:SetRotateInfo(nil, uv5 and uv6:GetYAngle() or uv7, slot2)
					else
						slot4:SetRotateInfo(slot6:GetCLDZCenterPosition(), slot5, slot2)
					end
				else
					slot4:SetRotateInfo(nil, slot5, slot2)
				end

				uv10.GetFactoryList()[slot4:GetTemplate().type]:CreateBullet(uv11:GetTf(), slot4, uv11:GetPosition())
			end, function ()
				uv0:Destroy()
				uv1:SplitFinishCount()

				if uv1:IsAllSplitFinish() then
					uv2:RemoveBulletUnit(uv1:GetUniqueID())
				end
			end, slot14)

			slot20:Ready()
			slot20:Fire(nil, slot7:GetDirection(), uv1.Battle.BattleDataFunction.GetBarrageTmpDataFromID(slot14).angle)
		end
	end
end

function slot2.onBulletMissFunc(slot0)
end

function slot2.MakeModel(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1:GetBulletData()

	if not slot0:GetBulletPool():InstBullet(slot1:GetModleID(), function (slot0)
		uv0:AddModel(slot0)
	end) then
		slot1:AddTempModel(slot0:GetTempGOPool():GetObject())
	end

	slot1:SetSpawn(slot2)
	slot1:SetFXFunc(slot0.onBulletHitFunc, slot0.onBulletMissFunc)
	slot0:GetSceneMediator():AddBullet(slot1)
end

function slot2.OutRangeFunc(slot0)
	if slot0:IsOutRange() then
		slot0:ChangeShrapnelState(uv0.Battle.BattleShrapnelBulletUnit.STATE_SPIN)
	else
		slot0:ChangeShrapnelState(uv0.Battle.BattleShrapnelBulletUnit.STATE_SPLIT)
	end
end
