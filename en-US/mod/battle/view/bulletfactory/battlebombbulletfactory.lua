ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleBombBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleBombBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleBombBulletFactory
slot2 = "BattleBombBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleBombBulletFactory

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)
end

slot1.Ctor = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.GetTemplate
	slot1 = slot1(slot2)
	slot2 = slot1.hit_type
	slot3 = slot0
	slot3 = slot3.GetDataProxy
	slot3 = slot3()
	slot5 = slot0
	slot4 = slot0.GetDiveFilter
	slot4 = slot4(slot5)
	slot5 = {
		_bullet = slot0
	}
	slot7 = slot0
	slot6 = slot0.GetWeapon
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.GetEquipmentIndex
	slot6 = slot6(slot7)
	slot5.equipIndex = slot6
	slot7 = slot0
	slot6 = slot0.BuffTrigger
	slot8 = slot1
	slot8 = slot8.Battle
	slot8 = slot8.BattleConst
	slot8 = slot8.BuffEffectType
	slot8 = slot8.ON_BOMB_BULLET_BANG
	slot9 = slot5

	slot6(slot7, slot8, slot9)

	function slot6(slot0)
		slot1 = ipairs
		slot2 = slot0
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = slot5.Active

			if slot6 then
				slot6 = slot0
				slot6 = slot6.GetSceneMediator
				slot6 = slot6()
				slot7 = slot6
				slot6 = slot6.GetCharacter
				slot8 = slot5.UID
				slot6 = slot6(slot7, slot8)
				slot7 = slot6
				slot6 = slot6.GetUnitData
				slot6 = slot6(slot7)
				slot7 = false
				slot9 = slot6
				slot8 = slot6.GetCurrentOxyState
				slot8 = slot8(slot9)
				slot9 = ipairs
				slot10 = slot1
				slot9, slot10, slot11 = slot9(slot10)

				for slot12, slot13 in slot9, slot10, slot11 do
					if slot8 == slot13 then
						slot7 = true
					end
				end

				if not slot7 then
					slot9 = slot2
					slot10 = slot9
					slot9 = slot9.HandleDamage
					slot11 = slot3
					slot12 = slot6

					slot9(slot10, slot11, slot12)
				end
			end
		end
	end

	slot8 = slot3
	slot7 = slot3.SpawnColumnArea
	slot10 = slot0
	slot9 = slot0.GetEffectField
	slot9 = slot9(slot10)
	slot11 = slot0
	slot10 = slot0.GetIFF
	slot10 = slot10(slot11)
	slot12 = slot0
	slot11 = slot0.GetExplodePostion
	slot11 = slot11(slot12)
	slot12 = slot2.range
	slot13 = slot2.time
	slot14 = slot6

	slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14)

	slot7 = slot1.extra_param
	slot7 = slot7.friendlyFire

	if slot7 then
		slot8 = slot3
		slot7 = slot3.SpawnColumnArea
		slot10 = slot0
		slot9 = slot0.GetEffectField
		slot9 = slot9(slot10)
		slot10 = slot3.GetOppoSideCode
		slot12 = slot0
		slot11 = slot0.GetIFF
		slot10 = slot10(slot11(slot12))
		slot12 = slot0
		slot11 = slot0.GetExplodePostion
		slot11 = slot11(slot12)
		slot12 = slot2.range
		slot13 = slot2.time
		slot14 = slot6

		slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	end

	slot8 = slot3
	slot7 = slot3.RemoveBulletUnit
	slot10 = slot0
	slot9 = slot0.GetUniqueID

	slot7(slot8, slot9(slot10))
end

slot1.OutRangeFunc = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.Battle
	slot1 = slot1.BattleBombBullet
	slot1 = slot1.New

	return slot1()
end

slot1.MakeBullet = slot2

function slot2(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.GetBulletData
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.GetTemplate
	slot4 = slot4(slot5)
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.PlayBattleSFX
	slot6 = slot4.hit_sfx

	slot5(slot6)

	slot5 = slot1
	slot5 = slot5.GetFXPool
	slot5 = slot5()
	slot6 = slot5
	slot5 = slot5.GetFX
	slot8 = slot0
	slot7 = slot0.GetFXID
	slot5, slot6 = slot5(slot6, slot7(slot8))
	slot7 = pg
	slot7 = slot7.Tool
	slot7 = slot7.FilterY
	slot9 = slot3
	slot8 = slot3.GetPosition
	slot7 = slot7(slot8(slot9))
	slot8 = pg
	slot8 = slot8.EffectMgr
	slot8 = slot8.GetInstance
	slot8 = slot8()
	slot9 = slot8
	slot8 = slot8.PlayBattleEffect
	slot10 = slot5
	slot12 = slot7
	slot11 = slot7.Add
	slot13 = slot6
	slot11 = slot11(slot12, slot13)
	slot12 = true

	slot8(slot9, slot10, slot11, slot12)
end

slot1.onBulletHitFunc = slot2

function slot2()
	return
end

slot1.onBulletMissFunc = slot2

function slot2(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.GetBulletData
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.GetExplodePostion
	slot4 = slot4(slot5)
	slot6 = slot0
	slot5 = slot0.GetDataProxy
	slot5 = slot5(slot6)
	slot6 = slot5
	slot5 = slot5.GetTotalBounds
	slot5, slot6, slot7, slot8 = slot5(slot6)
	slot9 = slot4.z
	slot10 = slot5 + 3

	if slot9 > slot10 then
		slot10 = slot0
		slot9 = slot0.GetDataProxy
		slot9 = slot9(slot10)
		slot10 = slot9
		slot9 = slot9.RemoveBulletUnit
		slot12 = slot3
		slot11 = slot3.GetUniqueID

		slot9(slot10, slot11(slot12))

		return
	end

	slot10 = slot3
	slot9 = slot3.GetTemplate
	slot9 = slot9(slot10)
	slot11 = slot0
	slot10 = slot0.GetBulletPool
	slot10 = slot10(slot11)
	slot11 = slot10
	slot10 = slot10.InstBullet
	slot13 = slot1
	slot12 = slot1.GetModleID
	slot12 = slot12(slot13)

	function slot13(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.AddModel
		slot3 = slot0
		slot1 = slot1(slot2, slot3)

		if slot1 then
			slot1 = slot1
			slot1 = slot1.track_fx

			if slot1 ~= "" then
				slot1 = slot2
				slot2 = slot1
				slot1 = slot1.GetFXPool
				slot1 = slot1(slot2)
				slot2 = slot1
				slot1 = slot1.GetFX
				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.GetTrackFXID
				slot1, slot2 = slot1(slot2, slot3(slot4))
				slot3 = slot2
				slot4 = slot3
				slot3 = slot3.MakeTrack
				slot5 = slot0
				slot6 = slot1
				slot7 = slot2

				slot3(slot4, slot5, slot6, slot7)
			end
		end
	end

	slot10 = slot10(slot11, slot12, slot13)

	if not slot10 then
		slot12 = slot1
		slot11 = slot1.AddTempModel
		slot14 = slot0
		slot13 = slot0.GetTempGOPool
		slot13 = slot13(slot14)
		slot14 = slot13
		slot13 = slot13.GetObject

		slot11(slot12, slot13(slot14))
	end

	slot12 = slot1
	slot11 = slot1.SetSpawn
	slot13 = slot2

	slot11(slot12, slot13)

	slot12 = slot3
	slot11 = slot3.GetIFF
	slot11 = slot11(slot12)
	slot13 = slot0
	slot12 = slot0.GetDataProxy
	slot12 = slot12(slot13)
	slot13 = slot12
	slot12 = slot12.GetFriendlyCode
	slot12 = slot12(slot13)

	if slot11 ~= slot12 then
		slot12 = slot3
		slot11 = slot3.GetExist
		slot11 = slot11(slot12)

		if slot11 then
			slot11 = slot9.alert_fx

			if slot11 ~= "" then
				slot11 = slot0
				slot11 = slot11.CreateBulletAlert
				slot12 = slot3

				slot11(slot12)
			end
		end
	end

	slot12 = slot3
	slot11 = slot3.SetExist
	slot13 = true

	slot11(slot12, slot13)

	slot12 = slot1
	slot11 = slot1.SetFXFunc
	slot13 = slot0.onBulletHitFunc
	slot14 = slot0.onBulletMissFunc

	slot11(slot12, slot13, slot14)

	slot12 = slot0
	slot11 = slot0.GetSceneMediator
	slot11 = slot11(slot12)
	slot12 = slot11
	slot11 = slot11.AddBullet
	slot13 = slot1

	slot11(slot12, slot13)
end

slot1.MakeModel = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.GetTemplate
	slot1 = slot1(slot2)
	slot1 = slot1.hit_type
	slot1 = slot1.range
	slot3 = slot0
	slot2 = slot0.GetTemplate
	slot2 = slot2(slot3)
	slot2 = slot2.alert_fx
	slot3 = slot0
	slot3 = slot3.Battle
	slot3 = slot3.BattleFXPool
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.GetFX
	slot5 = slot2
	slot3 = slot3(slot4, slot5)
	slot4 = slot3.transform
	slot5 = 0
	slot6 = pg
	slot6 = slot6.effect_offset
	slot7 = slot6[slot2]

	if slot7 then
		slot7 = slot6[slot2]
		slot7 = slot7.y_scale

		if slot7 == true then
			slot5 = slot1
		end
	end

	slot7 = Vector3
	slot8 = slot1
	slot9 = slot5
	slot10 = slot1
	slot7 = slot7(slot8, slot9, slot10)
	slot4.localScale = slot7
	slot7 = pg
	slot7 = slot7.EffectMgr
	slot7 = slot7.GetInstance
	slot7 = slot7()
	slot8 = slot7
	slot7 = slot7.PlayBattleEffect
	slot9 = slot3
	slot11 = slot0
	slot10 = slot0.GetExplodePostion

	slot7(slot8, slot9, slot10(slot11))
end

slot1.CreateBulletAlert = slot2

return
