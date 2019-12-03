ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleBulletFactory = singletonClass("BattleBulletFactory")
ys.Battle.BattleBulletFactory.__name = "BattleBulletFactory"

function ys.Battle.BattleBulletFactory.Ctor(slot0)
	return
end

function ys.Battle.BattleBulletFactory.RecyleTempModel(slot0, slot1)
	slot0._tempGOPool:Recycle(slot1)
end

function ys.Battle.BattleBulletFactory.Clear(slot0)
	if slot0._tempGOPool then
		slot0._tempGOPool:Dispose()

		slot0._tempGOPool = nil
	end
end

function ys.Battle.BattleBulletFactory.CreateBullet(slot0, slot1, slot2, slot3, slot4, slot5)
	slot2:SetOutRangeCallback(slot0.OutRangeFunc)

	slot6 = slot0:MakeBullet()

	slot6:SetFactory(slot0)
	slot6:SetBulletData(slot2)
	slot0:MakeModel(slot6, slot3, slot4, slot5)

	if slot4 and slot4 ~= "" then
		slot0:PlayFireFX(slot1, slot2, slot3, slot4, slot5, nil)
	end

	return slot6
end

function ys.Battle.BattleBulletFactory.GetSceneMediator(slot0)
	return slot0.Battle.BattleState.GetInstance():GetSceneMediator()
end

function ys.Battle.BattleBulletFactory.GetDataProxy(slot0)
	return slot0.Battle.BattleDataProxy.GetInstance()
end

function ys.Battle.BattleBulletFactory.GetFXPool(slot0)
	return slot0.Battle.BattleFXPool.GetInstance()
end

function ys.Battle.BattleBulletFactory.GetBulletPool(slot0)
	return slot0.Battle.BattleResourceManager.GetInstance()
end

function ys.Battle.BattleBulletFactory.OutRangeFunc(slot0)
	slot0.GetDataProxy():RemoveBulletUnit(slot0:GetUniqueID())
end

function ys.Battle.BattleBulletFactory.GetTempGOPool(slot0)
	if slot0._tempGOPool == nil then
		slot1 = GameObject("temp_bullet_OBJ")

		SetActive(slot1, false)
		LuaHelper.SetGOParentTF(slot1, slot2, false)

		slot0._tempGOPool = pg.Pool.New(slot2, slot1, 1, 15, false, false):InitSize()
	end

	return slot0._tempGOPool
end

function ys.Battle.BattleBulletFactory.PlayFireFX(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot2:GetWeaponTempData().effect_move == 1

	if slot4 == "" or slot4 == nil then
		if slot6 then
			slot6()
		end
	else
		slot8, slot9 = nil

		if slot7 then
			slot8, slot9 = slot0:GetFXPool():GetFX(slot4, slot1)
		else
			slot8, slot9 = slot0:GetFXPool():GetFX(slot4)
			slot9 = slot11:Add(slot3)
		end

		if slot5 == slot0.UnitDir.LEFT then
			slot8.transform.localEulerAngles.y = 180
			slot8.transform.localEulerAngles = slot8.transform.localEulerAngles
		end

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot8, slot9, true, slot6, true)
	end
end

function ys.Battle.BattleBulletFactory.MakeBullet(slot0)
	return nil
end

function ys.Battle.BattleBulletFactory.MakeModel(slot0, slot1, slot2)
	return nil
end

function ys.Battle.BattleBulletFactory.MakeBombPreCastAlter(slot0, slot1, slot2)
	return slot0:MakeModel(slot1, slot2)
end

function ys.Battle.BattleBulletFactory.MakeModelAfterBombPreCastAlert(slot0, slot1)
	return nil
end

function ys.Battle.BattleBulletFactory.MakeTrack(slot0, slot1, slot2, slot3)
	slot1:AddTrack(slot2)
	pg.EffectMgr.GetInstance():PlayBattleEffect(slot2, slot3, true)
end

function ys.Battle.BattleBulletFactory.RemoveBullet(slot0, slot1)
	slot1:Dispose()
end

function ys.Battle.BattleBulletFactory.GetFactoryList()
	if slot0._factoryList == nil then
		slot0._factoryList = {
			[slot1.BulletType.CANNON] = slot2.Battle.BattleCannonBulletFactory.GetInstance(),
			[slot1.BulletType.BOMB] = slot2.Battle.BattleBombBulletFactory.GetInstance(),
			[slot1.BulletType.TORPEDO] = slot2.Battle.BattleTorpedoBulletFactory.GetInstance(),
			[slot1.BulletType.DIRECT] = slot2.Battle.BattleDirectBulletFactory.GetInstance(),
			[slot1.BulletType.SHRAPNEL] = slot2.Battle.BattleShrapnelBulletFactory.GetInstance(),
			[slot1.BulletType.ANTI_AIR] = slot2.Battle.BattleAntiAirBulletFactory.GetInstance(),
			[slot1.BulletType.ANTI_SEA] = slot2.Battle.BattleAntiSeaBulletFactory.GetInstance(),
			[slot1.BulletType.STRAY] = slot2.Battle.BattleStrayBulletFactory.GetInstance(),
			[slot1.BulletType.EFFECT] = slot2.Battle.BattleEffectBulletFactory.GetInstance(),
			[slot1.BulletType.BEAM] = slot2.Battle.BattleBeamBulletFactory.GetInstance(),
			[slot1.BulletType.G_BULLET] = slot2.Battle.BattleGravitationBulletFactory.GetInstance()
		}
	end

	return slot0._factoryList
end

function ys.Battle.BattleBulletFactory.DestroyFactory()
	slot0._factoryList = nil
end

function ys.Battle.BattleBulletFactory.NeutralizeBullet()
	slot0.Battle.BattleAntiAirBulletFactory.GetInstance():NeutralizeBullet()
	slot0.Battle.BattleAntiAirBulletFactory.GetInstance().NeutralizeBullet.Battle.BattleAntiSeaBulletFactory.GetInstance():NeutralizeBullet()
end

function ys.Battle.BattleBulletFactory.GetRandomBone(slot0)
	return slot0[math.floor(math.Random(0, #slot0)) + 1]
end

return
