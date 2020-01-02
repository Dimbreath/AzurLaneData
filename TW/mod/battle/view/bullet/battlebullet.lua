ys = ys or {}
slot1 = ys.Battle.BattleBulletEvent
slot2 = ys.Battle.BattleConfig
slot3 = ys.Battle.BattleVariable
ys.Battle.BattleBullet = class("BattleBullet", ys.Battle.BattleSceneObject)
ys.Battle.BattleBullet.__name = "BattleBullet"

function ys.Battle.BattleBullet.Ctor(slot0)
	slot0.super.Ctor(slot0)
	slot0.super.Ctor.EventListener.AttachEventListener(slot0)

	slot0.resMgr = slot0.super.Ctor.EventListener.AttachEventListener.Battle.BattleResourceManager.GetInstance()
	slot0._oldSpeed = Vector3.zero
	slot0._curSpeed = Vector3.zero
end

function ys.Battle.BattleBullet.Update(slot0, slot1)
	slot2 = slot0._bulletData:GetSpeed()

	slot0._curSpeed:Set(slot2.x, slot2.y, slot2.z)

	if slot0._bulletData:GetVerticalSpeed() ~= 0 then
		slot0._curSpeed.y = slot0._curSpeed.y + slot3
	end

	if slot0._oldSpeed ~= slot0._curSpeed then
		slot0._rotateScript:SetSpeed(slot0._curSpeed)
		slot0._oldSpeed:Set(slot0._curSpeed.x, slot0._curSpeed.y, slot0._curSpeed.z)
	end

	slot0:UpdatePosition()
end

function ys.Battle.BattleBullet.UpdatePosition(slot0)
	slot0._tf.localPosition = slot0:GetPosition()
end

function ys.Battle.BattleBullet.DoOutRange(slot0)
	slot0:_bulletMissFunc()
end

function ys.Battle.BattleBullet.SetBulletData(slot0, slot1)
	slot0._bulletData = slot1

	slot0._bulletData:SetStartTimeStamp(pg.TimeMgr.GetInstance():GetCombatTime())

	slot0._cfgTpl = slot1:GetTemplate()
	slot0._IFF = slot1:GetIFF()

	slot0:AddBulletEvent()
end

function ys.Battle.BattleBullet.AddBulletEvent(slot0)
	slot0._bulletData:RegisterEventListener(slot0, slot0.HIT, slot0.onBulletHit)
	slot0._bulletData:RegisterEventListener(slot0, slot0.INTERCEPTED, slot0.onIntercepted)
	slot0._bulletData:RegisterEventListener(slot0, slot0.OUT_RANGE, slot0.onOutRange)
end

function ys.Battle.BattleBullet.RemoveBulletEvent(slot0)
	slot0._bulletData:UnregisterEventListener(slot0, slot0.HIT)
	slot0._bulletData:UnregisterEventListener(slot0, slot0.INTERCEPTED)
	slot0._bulletData:UnregisterEventListener(slot0, slot0.OUT_RANGE)
end

function ys.Battle.BattleBullet.onBulletHit(slot0, slot1)
	slot2 = slot1.Data

	slot0:_bulletHitFunc(slot1.Data.UID, slot1.Data.type)
end

function ys.Battle.BattleBullet.onIntercepted(slot0)
	slot5, slot7 = slot0.Battle.BattleFXPool.GetInstance():GetFX(slot0:GetBulletData():GetTemplate().hit_fx)

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot1, slot2:Add(slot0:GetPosition()), true)
end

function ys.Battle.BattleBullet.onOutRange(slot0, slot1)
	slot0:DoOutRange()
end

function ys.Battle.BattleBullet.GetBulletData(slot0)
	return slot0._bulletData
end

function ys.Battle.BattleBullet.GetPosition(slot0)
	return slot0._bulletData:GetPosition()
end

function ys.Battle.BattleBullet.Dispose(slot0)
	if slot0._rotateScript then
		slot0._rotateScript:SetSpeed(Vector3.zero)
	end

	slot0:RemoveBulletEvent()

	if slot0._isTempGO then
		slot0._factory:RecyleTempModel(slot0._go)
	else
		slot0.Battle.BattleResourceManager.GetInstance():DestroyOb(slot0._go)
	end

	if slot0._trackFX then
		resMgr.GetInstance():DestroyOb(slot0._trackFX)
	end

	slot0._go = nil
	slot0._tf = nil
	slot0._trackFX = nil

	slot0.EventListener.DetachEventListener(slot0)
end

function ys.Battle.BattleBullet.GetModleID(slot0)
	return slot0._bulletData:GetModleID()
end

function ys.Battle.BattleBullet.GetFXID(slot0)
	return slot0._cfgTpl.hit_fx
end

function ys.Battle.BattleBullet.GetMissFXID(slot0)
	return slot0._cfgTpl.miss_fx
end

function ys.Battle.BattleBullet.GetTrackFXID(slot0)
	return slot0._cfgTpl.track_fx
end

function ys.Battle.BattleBullet.AddModel(slot0, slot1)
	if slot0._isTempGO and slot0._go == nil then
		slot0.Battle.BattleResourceManager.GetInstance():DestroyOb(slot1)

		return false
	else
		if slot0._isTempGO then
			LuaHelper.CopyTransformInfoGO(slot1, slot0._go)
			slot0._factory:RecyleTempModel(slot0._go)

			slot0._isTempGO = false
		end

		slot0:SetGO(slot1)
		slot0._bulletData:ActiveCldBox()
		slot0:AddRotateScript()

		return true
	end
end

function ys.Battle.BattleBullet.AddRotateScript(slot0)
	slot0._rotateScript = slot0.resMgr:GetRotateScript(slot0._go)
end

function ys.Battle.BattleBullet.AddTempModel(slot0, slot1)
	slot0._isTempGO = true

	slot0:SetGO(slot1)
	slot0:AddRotateScript()
end

function ys.Battle.BattleBullet.AddTrack(slot0, slot1)
	slot0._trackFX = slot1

	LuaHelper.SetGOParentTF(slot1, slot0._tf, false)
end

function ys.Battle.BattleBullet.SetSpawn(slot0, slot1)
	slot5, slot3 = slot0:getHeightAdjust(slot1)
	slot4 = slot2:Clone()
	slot4.z = slot4.z + slot3
	slot0._tf.localPosition = slot4

	slot0._bulletData:SetSpawnPosition(slot4)

	slot5, slot6, slot7 = slot0._bulletData:GetRotateInfo()

	if slot5 then
		slot8 = nil

		slot0._bulletData:InitSpeed((slot0._bulletData:GetOffsetPriority() and math.rad2Deg * math.atan2(slot5.z - slot2.z, slot5.x - slot4.x)) or math.rad2Deg * math.atan2(slot5.z - slot2.z - slot3, slot5.x - slot4.x))
	else
		slot0._bulletData:InitSpeed(nil)
	end
end

function ys.Battle.BattleBullet.getHeightAdjust(slot0, slot1)
	if slot0._bulletData:GetTemplate().extra_param.airdrop then
		slot3 = slot0._bulletData:GetExplodePostion()
		slot4 = 0

		if slot2.dropOffset then
			slot4 = math.sqrt(math.abs((slot2.offsetY * 2) / slot0._bulletData._gravity)) * slot0._bulletData:GetConvertedVelocity()

			if slot0._bulletData:GetSpeed().x < 0 then
				slot4 = slot4 * -1
			end
		end

		return Vector3(slot3.x - slot4, slot2.offsetY or slot1.y, slot3.z), 0
	else
		slot3, slot4 = slot0._bulletData:GetOffset()
		slot3 = slot1.x + slot3
		slot4 = slot1.z + slot4

		if slot0._bulletData:IsGravitate() then
			return Vector3(slot3, slot1.y, slot4), 0
		else
			slot5 = 0
			slot6 = nil

			if slot1.y <= slot0.BulletHeight then
				slot6 = slot1.y
			else
				slot6 = slot7
				slot5 = slot0.GetZExtraOffset(slot1.y)
			end

			return Vector3(slot3, slot6, slot4), slot5
		end
	end
end

function ys.Battle.BattleBullet.GetZExtraOffset(slot0)
	return slot0.HeightOffsetRate * (slot0 - slot0.BulletHeight)
end

function ys.Battle.BattleBullet.GetFactory(slot0)
	return slot0._factory
end

function ys.Battle.BattleBullet.SetFactory(slot0, slot1)
	slot0._factory = slot1
end

function ys.Battle.BattleBullet.SetFXFunc(slot0, slot1, slot2)
	slot0._bulletHitFunc = slot1
	slot0._bulletMissFunc = slot2
end

function ys.Battle.BattleBullet.Neutrailze(slot0)
	if slot0._bulletMissFunc then
		slot0:_bulletMissFunc()
	end

	SetActive(slot0._go, false)
end

return
