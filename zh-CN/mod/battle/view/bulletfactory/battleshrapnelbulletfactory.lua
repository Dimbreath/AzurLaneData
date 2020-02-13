ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleShrapnelBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleShrapnelBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleShrapnelBulletFactory
slot2 = "BattleShrapnelBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleShrapnelBulletFactory

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)
end

slot1.Ctor = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.Battle
	slot1 = slot1.BattleShrapnelBullet
	slot1 = slot1.New

	return slot1()
end

slot1.MakeBullet = slot2

function slot2(slot0, slot1, slot2)
	slot4 = slot0
	slot3 = slot0.GetBulletData
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.GetCurrentState
	slot4 = slot4(slot5)
	slot5 = slot3.STATE_SPLIT

	if slot4 ~= slot5 then
		slot5 = slot3.STATE_SPIN

		if slot4 == slot5 then
		else
			slot6 = slot3
			slot5 = slot3.GetPierceCount
			slot5 = slot5(slot6)
			slot6 = 0

			if slot5 > slot6 then
				slot5 = slot0
				slot5 = slot5.Battle
				slot5 = slot5.BattleCannonBulletFactory
				slot5 = slot5.onBulletHitFunc
				slot6 = slot0
				slot7 = slot1
				slot8 = slot2

				slot5(slot6, slot7, slot8)

				return
			end
		end
	end

	slot5 = slot1
	slot5 = slot5.GetDataProxy
	slot5 = slot5()
	slot7 = slot3
	slot6 = slot3.GetTemplate
	slot6 = slot6(slot7)
	slot7 = slot6.extra_param
	slot7 = slot7.shrapnel

	if slot1 ~= nil and slot2 ~= nil then
		slot8 = nil
		slot9 = slot0
		slot9 = slot9.Battle
		slot9 = slot9.BattleConst
		slot9 = slot9.UnitType
		slot9 = slot9.AIRCRAFT_UNIT

		if slot2 == slot9 then
			slot9 = slot1
			slot9 = slot9.GetSceneMediator
			slot9 = slot9()
			slot10 = slot9
			slot9 = slot9.GetAircraft
			slot11 = slot1
			slot9 = slot9(slot10, slot11)
			slot8 = slot9
		else
			slot9 = slot0
			slot9 = slot9.Battle
			slot9 = slot9.BattleConst
			slot9 = slot9.UnitType
			slot9 = slot9.PLAYER_UNIT

			if slot2 == slot9 then
				slot9 = slot1
				slot9 = slot9.GetSceneMediator
				slot9 = slot9()
				slot10 = slot9
				slot9 = slot9.GetCharacter
				slot11 = slot1
				slot9 = slot9(slot10, slot11)
				slot8 = slot9
			else
				slot9 = slot0
				slot9 = slot9.Battle
				slot9 = slot9.BattleConst
				slot9 = slot9.UnitType
				slot9 = slot9.ENEMY_UNIT

				if slot2 == slot9 then
					slot9 = slot1
					slot9 = slot9.GetSceneMediator
					slot9 = slot9()
					slot10 = slot9
					slot9 = slot9.GetCharacter
					slot11 = slot1
					slot9 = slot9(slot10, slot11)
					slot8 = slot9
				end
			end
		end

		slot10 = slot8
		slot9 = slot8.GetUnitData
		slot9 = slot9(slot10)
		slot11 = slot8
		slot10 = slot8.AddFX
		slot13 = slot0
		slot12 = slot0.GetFXID
		slot10 = slot10(slot11, slot12(slot13))
		slot12 = slot9
		slot11 = slot9.GetIFF
		slot11 = slot11(slot12)
		slot13 = slot5
		slot12 = slot5.GetFoeCode
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

	slot8 = slot0
	slot8 = slot8.Battle
	slot8 = slot8.PlayBattleSFX
	slot9 = slot6.hit_sfx

	slot8(slot9)

	slot9 = slot3
	slot8 = slot3.GetSrcHost
	slot8 = slot8(slot9)
	slot10 = slot3
	slot9 = slot3.GetWeapon
	slot9 = slot9(slot10)
	slot10 = slot6.extra_param
	slot10 = slot10.FXID

	if slot10 ~= nil then
		slot10 = slot1
		slot10 = slot10.GetFXPool
		slot10 = slot10()
		slot11 = slot10
		slot10 = slot10.GetFX
		slot12 = slot6.extra_param
		slot12 = slot12.FXID
		slot10, slot11 = slot10(slot11, slot12)
		slot12 = pg
		slot12 = slot12.EffectMgr
		slot12 = slot12.GetInstance
		slot12 = slot12()
		slot13 = slot12
		slot12 = slot12.PlayBattleEffect
		slot14 = slot10
		slot16 = slot11
		slot15 = slot11.Add
		slot18 = slot0
		slot17 = slot0.GetPosition
		slot15 = slot15(slot16, slot17(slot18))
		slot16 = true

		slot12(slot13, slot14, slot15, slot16)
	end

	slot10 = nil
	slot10 = (slot3:GetSpeed().x > 0 and 0) or 180
	slot11 = 0
	slot12, slot13, slot14 = ipairs(slot7)

	for slot15, slot16 in slot12, slot13, slot14 do
		slot17 = slot16.barrage_ID
		slot18 = slot16.bullet_ID
		slot19 = slot16.emitterType

		if not slot19 then
			slot19 = slot0
			slot19 = slot19.Battle
			slot19 = slot19.BattleWeaponUnit
			slot19 = slot19.EMITTER_SHOTGUN
		end

		function slot20(slot0, slot1, slot2, slot3)
			slot4 = slot0
			slot5 = slot4
			slot4 = slot4.CreateBulletUnit
			slot6 = slot1
			slot7 = slot2
			slot8 = slot3
			slot9 = Vector3
			slot9 = slot9.zero
			slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
			slot6 = slot4
			slot5 = slot4.OverrideCorrectedDMG
			slot7 = slot4
			slot7 = slot7.damage

			slot5(slot6, slot7)

			slot6 = slot4
			slot5 = slot4.SetOffsetPriority
			slot7 = slot3

			slot5(slot6, slot7)

			slot6 = slot4
			slot5 = slot4.SetShiftInfo
			slot7 = slot0
			slot8 = slot1

			slot5(slot6, slot7, slot8)

			slot6 = slot4
			slot5 = slot4.SetRotateInfo
			slot7 = nil
			slot8 = slot5
			slot9 = slot2

			slot5(slot6, slot7, slot8, slot9)

			slot5 = slot6
			slot5 = slot5.GetFactoryList
			slot5 = slot5()
			slot7 = slot4
			slot6 = slot4.GetTemplate
			slot6 = slot6(slot7)
			slot6 = slot6.type
			slot5 = slot5[slot6]
			slot7 = slot5
			slot6 = slot5.CreateBullet
			slot8 = slot7
			slot9 = slot8
			slot8 = slot8.GetTf
			slot8 = slot8(slot9)
			slot9 = slot4
			slot10 = slot7
			slot11 = slot10
			slot10 = slot10.GetPosition

			slot6(slot7, slot8, slot9, slot10(slot11))
		end

		slot21 = nil

		function slot22()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.Destroy

			slot0(slot1)

			slot0 = slot1
			slot0 = slot0 + 1
			slot1 = slot0
			slot0 = slot1
			slot1 = slot2
			slot1 = #slot1

			if slot0 == slot1 then
				slot0 = slot3
				slot1 = slot0
				slot0 = slot0.RemoveBulletUnit
				slot2 = slot4
				slot3 = slot2
				slot2 = slot2.GetUniqueID

				slot0(slot1, slot2(slot3))
			end
		end

		slot23 = slot0
		slot23 = slot23.Battle
		slot23 = slot23[slot19]
		slot23 = slot23.New
		slot24 = slot20
		slot25 = slot22
		slot26 = slot17
		slot23 = slot23(slot24, slot25, slot26)
		slot21 = slot23
		slot24 = slot21
		slot23 = slot21.Ready

		slot23(slot24)

		slot24 = slot21
		slot23 = slot21.Fire
		slot25 = nil
		slot27 = slot9
		slot26 = slot9.GetDirection
		slot26 = slot26(slot27)
		slot27 = slot0
		slot27 = slot27.Battle
		slot27 = slot27.BattleDataFunction
		slot27 = slot27.GetBarrageTmpDataFromID
		slot28 = slot17
		slot27 = slot27(slot28)
		slot27 = slot27.angle

		slot23(slot24, slot25, slot26, slot27)
	end
end

slot1.onBulletHitFunc = slot2

function slot2(slot0)
	return
end

slot1.onBulletMissFunc = slot2

function slot2(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot1
	slot5 = slot1.GetBulletData
	slot5 = slot5(slot6)
	slot7 = slot0
	slot6 = slot0.GetBulletPool
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.InstBullet
	slot9 = slot1
	slot8 = slot1.GetModleID
	slot8 = slot8(slot9)

	function slot9(slot0)
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

	slot6 = slot6(slot7, slot8, slot9)

	if not slot6 then
		slot8 = slot1
		slot7 = slot1.AddTempModel
		slot10 = slot0
		slot9 = slot0.GetTempGOPool
		slot9 = slot9(slot10)
		slot10 = slot9
		slot9 = slot9.GetObject

		slot7(slot8, slot9(slot10))
	end

	slot8 = slot1
	slot7 = slot1.SetSpawn
	slot9 = slot2

	slot7(slot8, slot9)

	slot8 = slot1
	slot7 = slot1.SetFXFunc
	slot9 = slot0.onBulletHitFunc
	slot10 = slot0.onBulletMissFunc

	slot7(slot8, slot9, slot10)

	slot8 = slot0
	slot7 = slot0.GetSceneMediator
	slot7 = slot7(slot8)
	slot8 = slot7
	slot7 = slot7.AddBullet
	slot9 = slot1

	slot7(slot8, slot9)
end

slot1.MakeModel = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.IsOutRange
	slot1 = slot1(slot2)

	if slot1 then
		slot2 = slot0
		slot1 = slot0.ChangeShrapnelState
		slot3 = slot0
		slot3 = slot3.Battle
		slot3 = slot3.BattleShrapnelBulletUnit
		slot3 = slot3.STATE_SPIN

		slot1(slot2, slot3)
	else
		slot2 = slot0
		slot1 = slot0.ChangeShrapnelState
		slot3 = slot0
		slot3 = slot3.Battle
		slot3 = slot3.BattleShrapnelBulletUnit
		slot3 = slot3.STATE_SPLIT

		slot1(slot2, slot3)
	end
end

slot1.OutRangeFunc = slot2

return
