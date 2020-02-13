ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleConst
slot1 = slot1.UnitType
slot2 = slot0.Battle
slot3 = singletonClass
slot4 = "BattleCannonBulletFactory"
slot5 = slot0.Battle
slot5 = slot5.BattleBulletFactory
slot3 = slot3(slot4, slot5)
slot2.BattleCannonBulletFactory = slot3
slot2 = slot0.Battle
slot2 = slot2.BattleCannonBulletFactory
slot3 = "BattleCannonBulletFactory"
slot2.__name = slot3
slot2 = slot0.Battle
slot2 = slot2.BattleCannonBulletFactory

function slot3(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)
end

slot2.Ctor = slot3

function slot3(slot0)
	slot1 = slot0
	slot1 = slot1.Battle
	slot1 = slot1.BattleCannonBullet
	slot1 = slot1.New

	return slot1()
end

slot2.MakeBullet = slot3

function slot3(slot0, slot1, slot2)
	slot3 = slot0
	slot3 = slot3.GetDataProxy
	slot3 = slot3()
	slot5 = slot0
	slot4 = slot0.GetBulletData
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.GetTemplate
	slot5 = slot5(slot6)
	slot6 = nil
	slot7 = slot1
	slot7 = slot7.AIRCRAFT_UNIT

	if slot2 ~= slot7 then
		slot7 = slot1
		slot7 = slot7.AIRFIGHTER_UNIT

		if slot2 == slot7 then
			slot7 = slot0
			slot7 = slot7.GetSceneMediator
			slot7 = slot7()
			slot8 = slot7
			slot7 = slot7.GetAircraft
			slot9 = slot1
			slot7 = slot7(slot8, slot9)
			slot6 = slot7
		else
			slot7 = slot1
			slot7 = slot7.PLAYER_UNIT

			if slot2 == slot7 then
				slot7 = slot0
				slot7 = slot7.GetSceneMediator
				slot7 = slot7()
				slot8 = slot7
				slot7 = slot7.GetCharacter
				slot9 = slot1
				slot7 = slot7(slot8, slot9)
				slot6 = slot7
			else
				slot7 = slot1
				slot7 = slot7.ENEMY_UNIT

				if slot2 == slot7 then
					slot7 = slot0
					slot7 = slot7.GetSceneMediator
					slot7 = slot7()
					slot8 = slot7
					slot7 = slot7.GetCharacter
					slot9 = slot1
					slot7 = slot7(slot8, slot9)
					slot6 = slot7
				end
			end
		end
	end

	if not slot6 then
		return
	end

	slot8 = slot6
	slot7 = slot6.GetUnitData
	slot7 = slot7(slot8)
	slot9 = slot3
	slot8 = slot3.HandleDamage
	slot10 = slot4
	slot11 = slot7
	slot8, slot9 = slot8(slot9, slot10, slot11)
	slot10 = nil
	slot12 = slot6
	slot11 = slot6.GetGO
	slot11 = slot11(slot12)

	if slot11 then
		if slot8 then
			slot11 = slot0
			slot11 = slot11.GetFXPool
			slot11 = slot11()
			slot12 = slot11
			slot11 = slot11.GetFX
			slot14 = slot0
			slot13 = slot0.GetMissFXID
			slot11, slot12 = slot11(slot12, slot13(slot14))
			slot14 = slot6
			slot13 = slot6.GetUnitData
			slot13 = slot13(slot14)
			slot14 = slot13
			slot13 = slot13.GetBoxSize
			slot13 = slot13(slot14)
			slot14 = math
			slot14 = slot14.random
			slot15 = 0
			slot16 = 1
			slot14 = slot14(slot15, slot16)

			if slot14 == 0 then
				slot14 = -1
			end

			slot15 = math
			slot15 = slot15.random
			slot15 = slot15()
			slot15 = slot15 - 0.5
			slot16 = slot13.x
			slot15 = slot15 * slot16
			slot16 = Vector3
			slot17 = slot15
			slot18 = 0
			slot19 = slot13.z
			slot19 = slot19 * slot14
			slot16 = slot16(slot17, slot18, slot19)
			slot17 = slot16
			slot16 = slot16.Add
			slot19 = slot6
			slot18 = slot6.GetPosition
			slot16 = slot16(slot17, slot18(slot19))
			slot17 = pg
			slot17 = slot17.EffectMgr
			slot17 = slot17.GetInstance
			slot17 = slot17()
			slot18 = slot17
			slot17 = slot17.PlayBattleEffect
			slot19 = slot11
			slot21 = slot16
			slot20 = slot16.Add
			slot22 = slot12
			slot20 = slot20(slot21, slot22)
			slot21 = true

			slot17(slot18, slot19, slot20, slot21)

			slot17 = slot2
			slot17 = slot17.Battle
			slot17 = slot17.PlayBattleSFX
			slot18 = slot5.miss_sfx

			slot17(slot18)
		else
			slot12 = slot6
			slot11 = slot6.AddFX
			slot14 = slot0
			slot13 = slot0.GetFXID
			slot11 = slot11(slot12, slot13(slot14))
			slot10 = slot11
			slot11 = slot2
			slot11 = slot11.Battle
			slot11 = slot11.PlayBattleSFX
			slot12 = slot5.hit_sfx

			slot11(slot12)

			slot12 = slot6
			slot11 = slot6.GetPosition
			slot11 = slot11(slot12)
			slot11 = slot11.x
			slot13 = slot0
			slot12 = slot0.GetPosition
			slot12 = slot12(slot13)
			slot12 = slot12.x
			slot11 = slot11 - slot12
			slot13 = slot6
			slot12 = slot6.GetInitScale
			slot12 = slot12(slot13)
			slot11 = slot11 / slot12
			slot12 = slot10.transform
			slot12 = slot12.localPosition
			slot13 = Vector3
			slot14 = slot12.x
			slot14 = slot14 + slot11
			slot15 = slot12.y
			slot16 = slot12.z
			slot13 = slot13(slot14, slot15, slot16)
			slot14 = slot10.transform
			slot14.localPosition = slot13
		end
	end

	if slot10 then
		slot12 = slot7
		slot11 = slot7.GetIFF
		slot11 = slot11(slot12)
		slot13 = slot3
		slot12 = slot3.GetFoeCode
		slot12 = slot12(slot13)

		if slot11 == slot12 then
			slot11 = slot10.transform
			slot12 = slot11.localRotation
			slot13 = Vector3
			slot14 = slot12.x
			slot15 = 180
			slot16 = slot12.z
			slot13 = slot13(slot14, slot15, slot16)
			slot11.localRotation = slot13
		end
	end

	slot12 = slot4
	slot11 = slot4.GetPierceCount
	slot11 = slot11(slot12)
	slot12 = 0

	if slot11 <= slot12 then
		slot12 = slot3
		slot11 = slot3.RemoveBulletUnit
		slot14 = slot4
		slot13 = slot4.GetUniqueID

		slot11(slot12, slot13(slot14))
	end
end

slot2.onBulletHitFunc = slot3

function slot3(slot0)
	slot2 = slot0
	slot1 = slot0.GetBulletData
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.GetTemplate
	slot2 = slot2(slot3)
	slot3 = slot0
	slot3 = slot3.GetFXPool
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.GetFX
	slot6 = slot0
	slot5 = slot0.GetMissFXID
	slot3, slot4 = slot3(slot4, slot5(slot6))
	slot5 = pg
	slot5 = slot5.EffectMgr
	slot5 = slot5.GetInstance
	slot5 = slot5()
	slot6 = slot5
	slot5 = slot5.PlayBattleEffect
	slot7 = slot3
	slot9 = slot4
	slot8 = slot4.Add
	slot11 = slot0
	slot10 = slot0.GetPosition
	slot8 = slot8(slot9, slot10(slot11))
	slot9 = true

	slot5(slot6, slot7, slot8, slot9)

	slot5 = slot1
	slot5 = slot5.Battle
	slot5 = slot5.PlayBattleSFX
	slot6 = slot2.miss_sfx

	slot5(slot6)
end

slot2.onBulletMissFunc = slot3

function slot3(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot0
	slot5 = slot0.GetDataProxy
	slot5 = slot5(slot6)
	slot7 = slot1
	slot6 = slot1.GetBulletData
	slot6 = slot6(slot7)
	slot8 = slot0
	slot7 = slot0.GetBulletPool
	slot7 = slot7(slot8)
	slot8 = slot7
	slot7 = slot7.InstBullet
	slot10 = slot1
	slot9 = slot1.GetModleID
	slot9 = slot9(slot10)

	function slot10(slot0)
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.AddModel
		slot3 = slot0
		slot1 = slot1(slot2, slot3)

		if slot1 == true then
			slot2 = slot1
			slot3 = slot2
			slot2 = slot2.GetTemplate
			slot2 = slot2(slot3)
			slot2 = slot2.track_fx

			if slot2 ~= "" then
				slot2 = slot2
				slot3 = slot2
				slot2 = slot2.GetFXPool
				slot2 = slot2(slot3)
				slot3 = slot2
				slot2 = slot2.GetFX
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.GetTrackFXID
				slot2, slot3 = slot2(slot3, slot4(slot5))
				slot4 = slot2
				slot5 = slot4
				slot4 = slot4.MakeTrack
				slot6 = slot0
				slot7 = slot2
				slot8 = slot3

				slot4(slot5, slot6, slot7, slot8)
			end
		end
	end

	slot7 = slot7(slot8, slot9, slot10)

	if not slot7 then
		slot9 = slot1
		slot8 = slot1.AddTempModel
		slot11 = slot0
		slot10 = slot0.GetTempGOPool
		slot10 = slot10(slot11)
		slot11 = slot10
		slot10 = slot10.GetObject

		slot8(slot9, slot10(slot11))
	end

	slot9 = slot1
	slot8 = slot1.SetSpawn
	slot10 = slot2

	slot8(slot9, slot10)

	slot9 = slot1
	slot8 = slot1.SetFXFunc
	slot10 = slot0.onBulletHitFunc
	slot11 = slot0.onBulletMissFunc

	slot8(slot9, slot10, slot11)

	slot9 = slot0
	slot8 = slot0.GetSceneMediator
	slot8 = slot8(slot9)
	slot9 = slot8
	slot8 = slot8.AddBullet
	slot10 = slot1

	slot8(slot9, slot10)
end

slot2.MakeModel = slot3

return
