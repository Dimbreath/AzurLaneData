ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleBulletEvent
slot2 = slot0.Battle
slot2 = slot2.BattleConfig
slot3 = slot0.Battle
slot3 = slot3.BattleVariable
slot4 = slot0.Battle
slot5 = class
slot6 = "BattleBullet"
slot7 = slot0.Battle
slot7 = slot7.BattleSceneObject
slot5 = slot5(slot6, slot7)
slot4.BattleBullet = slot5
slot4 = slot0.Battle
slot4 = slot4.BattleBullet
slot5 = "BattleBullet"
slot4.__name = slot5
slot4 = slot0.Battle
slot4 = slot4.BattleBullet

function slot5(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)

	slot1 = slot1
	slot1 = slot1.EventListener
	slot1 = slot1.AttachEventListener
	slot2 = slot0

	slot1(slot2)

	slot1 = slot1
	slot1 = slot1.Battle
	slot1 = slot1.BattleResourceManager
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot0.resMgr = slot1
	slot1 = Vector3
	slot1 = slot1.zero
	slot0._oldSpeed = slot1
	slot1 = Vector3
	slot1 = slot1.zero
	slot0._curSpeed = slot1
end

slot4.Ctor = slot5

function slot5(slot0, slot1)
	slot2 = slot0._bulletData
	slot3 = slot2
	slot2 = slot2.GetSpeed
	slot2 = slot2(slot3)
	slot3 = slot0._curSpeed
	slot4 = slot3
	slot3 = slot3.Set
	slot5 = slot2.x
	slot6 = slot2.y
	slot7 = slot2.z

	slot3(slot4, slot5, slot6, slot7)

	slot3 = slot0._bulletData
	slot4 = slot3
	slot3 = slot3.GetVerticalSpeed
	slot3 = slot3(slot4)

	if slot3 ~= 0 then
		slot4 = slot0._curSpeed
		slot5 = slot0._curSpeed
		slot5 = slot5.y
		slot5 = slot5 + slot3
		slot4.y = slot5
	end

	slot4 = slot0._oldSpeed
	slot5 = slot0._curSpeed

	if slot4 ~= slot5 then
		slot4 = slot0._rotateScript
		slot5 = slot4
		slot4 = slot4.SetSpeed
		slot6 = slot0._curSpeed

		slot4(slot5, slot6)

		slot4 = slot0._oldSpeed
		slot5 = slot4
		slot4 = slot4.Set
		slot6 = slot0._curSpeed
		slot6 = slot6.x
		slot7 = slot0._curSpeed
		slot7 = slot7.y
		slot8 = slot0._curSpeed
		slot8 = slot8.z

		slot4(slot5, slot6, slot7, slot8)
	end

	slot5 = slot0
	slot4 = slot0.UpdatePosition

	slot4(slot5)
end

slot4.Update = slot5

function slot5(slot0)
	slot1 = slot0._tf
	slot3 = slot0
	slot2 = slot0.GetPosition
	slot2 = slot2(slot3)
	slot1.localPosition = slot2
end

slot4.UpdatePosition = slot5

function slot5(slot0)
	slot1 = slot0._bulletMissFunc
	slot2 = slot0

	slot1(slot2)
end

slot4.DoOutRange = slot5

function slot5(slot0, slot1)
	slot0._bulletData = slot1
	slot2 = slot0._bulletData
	slot3 = slot2
	slot2 = slot2.SetStartTimeStamp
	slot4 = pg
	slot4 = slot4.TimeMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot5 = slot4
	slot4 = slot4.GetCombatTime

	slot2(slot3, slot4(slot5))

	slot3 = slot1
	slot2 = slot1.GetTemplate
	slot2 = slot2(slot3)
	slot0._cfgTpl = slot2
	slot3 = slot1
	slot2 = slot1.GetIFF
	slot2 = slot2(slot3)
	slot0._IFF = slot2
	slot3 = slot0
	slot2 = slot0.AddBulletEvent

	slot2(slot3)
end

slot4.SetBulletData = slot5

function slot5(slot0)
	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.RegisterEventListener
	slot3 = slot0
	slot4 = slot0
	slot4 = slot4.HIT
	slot5 = slot0.onBulletHit

	slot1(slot2, slot3, slot4, slot5)

	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.RegisterEventListener
	slot3 = slot0
	slot4 = slot0
	slot4 = slot4.INTERCEPTED
	slot5 = slot0.onIntercepted

	slot1(slot2, slot3, slot4, slot5)

	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.RegisterEventListener
	slot3 = slot0
	slot4 = slot0
	slot4 = slot4.OUT_RANGE
	slot5 = slot0.onOutRange

	slot1(slot2, slot3, slot4, slot5)
end

slot4.AddBulletEvent = slot5

function slot5(slot0)
	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.UnregisterEventListener
	slot3 = slot0
	slot4 = slot0
	slot4 = slot4.HIT

	slot1(slot2, slot3, slot4)

	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.UnregisterEventListener
	slot3 = slot0
	slot4 = slot0
	slot4 = slot4.INTERCEPTED

	slot1(slot2, slot3, slot4)

	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.UnregisterEventListener
	slot3 = slot0
	slot4 = slot0
	slot4 = slot4.OUT_RANGE

	slot1(slot2, slot3, slot4)
end

slot4.RemoveBulletEvent = slot5

function slot5(slot0, slot1)
	slot2 = slot1.Data
	slot3 = slot1.Data
	slot3 = slot3.UID
	slot4 = slot1.Data
	slot4 = slot4.type
	slot5 = slot0._bulletHitFunc
	slot6 = slot0
	slot7 = slot3
	slot8 = slot4

	slot5(slot6, slot7, slot8)
end

slot4.onBulletHit = slot5

function slot5(slot0)
	slot1 = slot0
	slot1 = slot1.Battle
	slot1 = slot1.BattleFXPool
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.GetFX
	slot4 = slot0
	slot3 = slot0.GetBulletData
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.GetTemplate
	slot3 = slot3(slot4)
	slot3 = slot3.hit_fx
	slot1, slot2 = slot1(slot2, slot3)
	slot3 = pg
	slot3 = slot3.EffectMgr
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.PlayBattleEffect
	slot5 = slot1
	slot7 = slot2
	slot6 = slot2.Add
	slot9 = slot0
	slot8 = slot0.GetPosition
	slot6 = slot6(slot7, slot8(slot9))
	slot7 = true

	slot3(slot4, slot5, slot6, slot7)
end

slot4.onIntercepted = slot5

function slot5(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.DoOutRange

	slot2(slot3)
end

slot4.onOutRange = slot5

function slot5(slot0)
	slot1 = slot0._bulletData

	return slot1
end

slot4.GetBulletData = slot5

function slot5(slot0)
	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.GetPosition

	return slot1(slot2)
end

slot4.GetPosition = slot5

function slot5(slot0)
	slot1 = slot0._rotateScript

	if slot1 then
		slot1 = slot0._rotateScript
		slot2 = slot1
		slot1 = slot1.SetSpeed
		slot3 = Vector3
		slot3 = slot3.zero

		slot1(slot2, slot3)
	end

	slot2 = slot0
	slot1 = slot0.RemoveBulletEvent

	slot1(slot2)

	slot1 = slot0._isTempGO

	if slot1 then
		slot1 = slot0._factory
		slot2 = slot1
		slot1 = slot1.RecyleTempModel
		slot3 = slot0._go

		slot1(slot2, slot3)
	else
		slot1 = slot0
		slot1 = slot1.Battle
		slot1 = slot1.BattleResourceManager
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.DestroyOb
		slot3 = slot0._go

		slot1(slot2, slot3)
	end

	slot1 = slot0._trackFX

	if slot1 then
		slot1 = resMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.DestroyOb
		slot3 = slot0._trackFX

		slot1(slot2, slot3)
	end

	slot1 = nil
	slot0._go = slot1
	slot1 = nil
	slot0._tf = slot1
	slot1 = nil
	slot0._trackFX = slot1
	slot1 = slot0
	slot1 = slot1.EventListener
	slot1 = slot1.DetachEventListener
	slot2 = slot0

	slot1(slot2)
end

slot4.Dispose = slot5

function slot5(slot0)
	slot1 = slot0._bulletData
	slot2 = slot1
	slot1 = slot1.GetModleID

	return slot1(slot2)
end

slot4.GetModleID = slot5

function slot5(slot0)
	slot1 = slot0._cfgTpl
	slot1 = slot1.hit_fx

	return slot1
end

slot4.GetFXID = slot5

function slot5(slot0)
	slot1 = slot0._cfgTpl
	slot1 = slot1.miss_fx

	return slot1
end

slot4.GetMissFXID = slot5

function slot5(slot0)
	slot1 = slot0._cfgTpl
	slot1 = slot1.track_fx

	return slot1
end

slot4.GetTrackFXID = slot5

function slot5(slot0, slot1)
	slot2 = slot0._isTempGO

	if slot2 then
		slot2 = slot0._go

		if slot2 == nil then
			slot2 = slot0
			slot2 = slot2.Battle
			slot2 = slot2.BattleResourceManager
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.DestroyOb
			slot4 = slot1

			slot2(slot3, slot4)

			slot2 = false

			return slot2
		end
	else
		slot2 = slot0._isTempGO

		if slot2 then
			slot2 = LuaHelper
			slot2 = slot2.CopyTransformInfoGO
			slot3 = slot1
			slot4 = slot0._go

			slot2(slot3, slot4)

			slot2 = slot0._factory
			slot3 = slot2
			slot2 = slot2.RecyleTempModel
			slot4 = slot0._go

			slot2(slot3, slot4)

			slot2 = false
			slot0._isTempGO = slot2
		end

		slot3 = slot0
		slot2 = slot0.SetGO
		slot4 = slot1

		slot2(slot3, slot4)

		slot2 = slot0._bulletData
		slot3 = slot2
		slot2 = slot2.ActiveCldBox

		slot2(slot3)

		slot3 = slot0
		slot2 = slot0.AddRotateScript

		slot2(slot3)

		slot2 = true

		return slot2
	end
end

slot4.AddModel = slot5

function slot5(slot0)
	slot1 = slot0.resMgr
	slot2 = slot1
	slot1 = slot1.GetRotateScript
	slot3 = slot0._go
	slot1 = slot1(slot2, slot3)
	slot0._rotateScript = slot1
end

slot4.AddRotateScript = slot5

function slot5(slot0, slot1)
	slot2 = true
	slot0._isTempGO = slot2
	slot3 = slot0
	slot2 = slot0.SetGO
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.AddRotateScript

	slot2(slot3)
end

slot4.AddTempModel = slot5

function slot5(slot0, slot1)
	slot0._trackFX = slot1
	slot2 = LuaHelper
	slot2 = slot2.SetGOParentTF
	slot3 = slot1
	slot4 = slot0._tf
	slot5 = false

	slot2(slot3, slot4, slot5)
end

slot4.AddTrack = slot5

function slot5(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.getHeightAdjust
	slot4 = slot1
	slot2, slot3 = slot2(slot3, slot4)
	slot5 = slot2
	slot4 = slot2.Clone
	slot4 = slot4(slot5)
	slot5 = slot4.z
	slot5 = slot5 + slot3
	slot4.z = slot5
	slot5 = slot0._tf
	slot5.localPosition = slot4
	slot5 = slot0._bulletData
	slot6 = slot5
	slot5 = slot5.SetSpawnPosition
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = slot0._bulletData
	slot6 = slot5
	slot5 = slot5.GetRotateInfo
	slot5, slot6, slot7 = slot5(slot6)

	if slot5 then
		slot8 = nil
		slot9 = slot0._bulletData
		slot10 = slot9
		slot9 = slot9.GetOffsetPriority
		slot9 = slot9(slot10)

		if slot9 then
			slot9 = math
			slot9 = slot9.rad2Deg
			slot10 = math
			slot10 = slot10.atan2
			slot11 = slot5.z
			slot12 = slot2.z
			slot11 = slot11 - slot12
			slot12 = slot5.x
			slot13 = slot4.x
			slot12 = slot12 - slot13
			slot10 = slot10(slot11, slot12)
			slot8 = slot9 * slot10
		else
			slot9 = math
			slot9 = slot9.rad2Deg
			slot10 = math
			slot10 = slot10.atan2
			slot11 = slot5.z
			slot12 = slot2.z
			slot11 = slot11 - slot12
			slot11 = slot11 - slot3
			slot12 = slot5.x
			slot13 = slot4.x
			slot12 = slot12 - slot13
			slot10 = slot10(slot11, slot12)
			slot8 = slot9 * slot10
		end

		slot9 = slot0._bulletData
		slot10 = slot9
		slot9 = slot9.InitSpeed
		slot11 = slot8

		slot9(slot10, slot11)
	else
		slot8 = slot0._bulletData
		slot9 = slot8
		slot8 = slot8.InitSpeed
		slot10 = nil

		slot8(slot9, slot10)
	end
end

slot4.SetSpawn = slot5

function slot5(slot0, slot1)
	slot2 = slot0._bulletData
	slot3 = slot2
	slot2 = slot2.GetTemplate
	slot2 = slot2(slot3)
	slot2 = slot2.extra_param
	slot3 = slot2.airdrop

	if slot3 then
		slot3 = slot0._bulletData
		slot4 = slot3
		slot3 = slot3.GetExplodePostion
		slot3 = slot3(slot4)
		slot4 = 0
		slot5 = slot2.dropOffset

		if slot5 then
			slot5 = math
			slot5 = slot5.sqrt
			slot6 = math
			slot6 = slot6.abs
			slot7 = slot2.offsetY
			slot7 = slot7 * 2
			slot8 = slot0._bulletData
			slot8 = slot8._gravity
			slot7 = slot7 / slot8
			slot5 = slot5(slot6(slot7))
			slot6 = slot0._bulletData
			slot7 = slot6
			slot6 = slot6.GetConvertedVelocity
			slot6 = slot6(slot7)
			slot4 = slot5 * slot6
			slot5 = slot0._bulletData
			slot6 = slot5
			slot5 = slot5.GetSpeed
			slot5 = slot5(slot6)
			slot5 = slot5.x
			slot6 = 0

			if slot5 < slot6 then
				slot4 = slot4 * -1
			end
		end

		return Vector3(slot3.x - slot4, slot2.offsetY or slot1.y, slot3.z), 0
	else
		slot3 = slot0._bulletData
		slot4 = slot3
		slot3 = slot3.GetOffset
		slot3, slot4 = slot3(slot4)
		slot5 = slot1.x
		slot3 = slot5 + slot3
		slot5 = slot1.z
		slot4 = slot5 + slot4
		slot5 = slot0._bulletData
		slot6 = slot5
		slot5 = slot5.IsGravitate
		slot5 = slot5(slot6)

		if slot5 then
			slot5 = Vector3
			slot6 = slot3
			slot7 = slot1.y
			slot8 = slot4
			slot5 = slot5(slot6, slot7, slot8)
			slot6 = 0

			return slot5, slot6
		else
			slot5 = 0
			slot6 = nil
			slot7 = slot0
			slot7 = slot7.BulletHeight
			slot8 = slot1.y

			if slot8 <= slot7 then
				slot6 = slot1.y
			else
				slot6 = slot7
				slot8 = slot0.GetZExtraOffset
				slot9 = slot1.y
				slot8 = slot8(slot9)
				slot5 = slot8
			end

			slot8 = Vector3
			slot9 = slot3
			slot10 = slot6
			slot11 = slot4
			slot8 = slot8(slot9, slot10, slot11)
			slot9 = slot5

			return slot8, slot9
		end
	end
end

slot4.getHeightAdjust = slot5

function slot5(slot0)
	slot1 = slot0
	slot1 = slot1.HeightOffsetRate
	slot2 = slot0
	slot2 = slot2.BulletHeight
	slot2 = slot0 - slot2
	slot1 = slot1 * slot2

	return slot1
end

slot4.GetZExtraOffset = slot5

function slot5(slot0)
	slot1 = slot0._factory

	return slot1
end

slot4.GetFactory = slot5

function slot5(slot0, slot1)
	slot0._factory = slot1
end

slot4.SetFactory = slot5

function slot5(slot0, slot1, slot2)
	slot0._bulletHitFunc = slot1
	slot0._bulletMissFunc = slot2
end

slot4.SetFXFunc = slot5

function slot5(slot0)
	slot1 = slot0._bulletMissFunc

	if slot1 then
		slot1 = slot0._bulletMissFunc
		slot2 = slot0

		slot1(slot2)
	end

	slot1 = SetActive
	slot2 = slot0._go
	slot3 = false

	slot1(slot2, slot3)
end

slot4.Neutrailze = slot5

return
