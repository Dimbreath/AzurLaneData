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

function slot2(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = slot2
	slot6 = slot2.SetOutRangeCallback
	slot8 = slot0.OutRangeFunc

	slot6(slot7, slot8)

	slot7 = slot0
	slot6 = slot0.MakeBullet
	slot6 = slot6(slot7)
	slot8 = slot6
	slot7 = slot6.SetFactory
	slot9 = slot0

	slot7(slot8, slot9)

	slot8 = slot6
	slot7 = slot6.SetBulletData
	slot9 = slot2

	slot7(slot8, slot9)

	slot8 = slot0
	slot7 = slot0.MakeModel
	slot9 = slot6
	slot10 = slot3
	slot11 = slot4
	slot12 = slot5

	slot7(slot8, slot9, slot10, slot11, slot12)

	if slot4 and slot4 ~= "" then
		slot8 = slot0
		slot7 = slot0.PlayFireFX
		slot9 = slot1
		slot10 = slot2
		slot11 = slot3
		slot12 = slot4
		slot13 = slot5
		slot14 = nil

		slot7(slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	end

	slot8 = slot2
	slot7 = slot2.GetTemplate
	slot7 = slot7(slot8)
	slot8 = slot7.extra_param
	slot8 = slot8.shrapnel
	slot10 = slot2
	slot9 = slot2.GetTemplate
	slot9 = slot9(slot10)
	slot9 = slot9.extra_param
	slot9 = slot9.initialSplit

	if slot9 then
		slot10 = slot0
		slot10 = slot10.bulletSplit
		slot11 = slot6

		slot10(slot11)
	end

	return slot6
end

slot1.CreateBullet = slot2

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

	if slot1 ~= nil and slot2 ~= nil then
		slot7 = nil
		slot8 = slot0
		slot8 = slot8.Battle
		slot8 = slot8.BattleConst
		slot8 = slot8.UnitType
		slot8 = slot8.AIRCRAFT_UNIT

		if slot2 == slot8 then
			slot8 = slot1
			slot8 = slot8.GetSceneMediator
			slot8 = slot8()
			slot9 = slot8
			slot8 = slot8.GetAircraft
			slot10 = slot1
			slot8 = slot8(slot9, slot10)
			slot7 = slot8
		else
			slot8 = slot0
			slot8 = slot8.Battle
			slot8 = slot8.BattleConst
			slot8 = slot8.UnitType
			slot8 = slot8.PLAYER_UNIT

			if slot2 == slot8 then
				slot8 = slot1
				slot8 = slot8.GetSceneMediator
				slot8 = slot8()
				slot9 = slot8
				slot8 = slot8.GetCharacter
				slot10 = slot1
				slot8 = slot8(slot9, slot10)
				slot7 = slot8
			else
				slot8 = slot0
				slot8 = slot8.Battle
				slot8 = slot8.BattleConst
				slot8 = slot8.UnitType
				slot8 = slot8.ENEMY_UNIT

				if slot2 == slot8 then
					slot8 = slot1
					slot8 = slot8.GetSceneMediator
					slot8 = slot8()
					slot9 = slot8
					slot8 = slot8.GetCharacter
					slot10 = slot1
					slot8 = slot8(slot9, slot10)
					slot7 = slot8
				end
			end
		end

		slot9 = slot7
		slot8 = slot7.GetUnitData
		slot8 = slot8(slot9)
		slot10 = slot7
		slot9 = slot7.AddFX
		slot12 = slot0
		slot11 = slot0.GetFXID
		slot9 = slot9(slot10, slot11(slot12))
		slot11 = slot8
		slot10 = slot8.GetIFF
		slot10 = slot10(slot11)
		slot12 = slot5
		slot11 = slot5.GetFoeCode
		slot11 = slot11(slot12)

		if slot10 == slot11 then
			slot10 = slot9.transform
			slot11 = slot10.localRotation
			slot12 = Vector3
			slot13 = slot11.x
			slot14 = 180
			slot15 = slot11.z
			slot12 = slot12(slot13, slot14, slot15)
			slot10.localRotation = slot12
		end
	end

	slot7 = slot0
	slot7 = slot7.Battle
	slot7 = slot7.PlayBattleSFX
	slot8 = slot6.hit_sfx

	slot7(slot8)

	slot7 = slot1
	slot7 = slot7.bulletSplit
	slot8 = slot0
	slot9 = true

	slot7(slot8, slot9)
end

slot1.onBulletHitFunc = slot2

function slot2(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetBulletData
	slot2 = slot2(slot3)
	slot3 = slot0
	slot3 = slot3.GetDataProxy
	slot3 = slot3()
	slot5 = slot2
	slot4 = slot2.GetTemplate
	slot4 = slot4(slot5)
	slot5 = slot4.extra_param
	slot5 = slot5.shrapnel
	slot7 = slot2
	slot6 = slot2.GetSrcHost
	slot6 = slot6(slot7)
	slot8 = slot2
	slot7 = slot2.GetWeapon
	slot7 = slot7(slot8)
	slot8 = slot4.extra_param
	slot8 = slot8.FXID

	if slot8 ~= nil then
		slot8 = slot0
		slot8 = slot8.GetFXPool
		slot8 = slot8()
		slot9 = slot8
		slot8 = slot8.GetFX
		slot10 = slot4.extra_param
		slot10 = slot10.FXID
		slot8, slot9 = slot8(slot9, slot10)
		slot10 = pg
		slot10 = slot10.EffectMgr
		slot10 = slot10.GetInstance
		slot10 = slot10()
		slot11 = slot10
		slot10 = slot10.PlayBattleEffect
		slot12 = slot8
		slot14 = slot9
		slot13 = slot9.Add
		slot16 = slot0
		slot15 = slot0.GetPosition
		slot13 = slot13(slot14, slot15(slot16))
		slot14 = true

		slot10(slot11, slot12, slot13, slot14)
	end

	slot8 = nil
	slot8 = (slot2:GetSpeed().x > 0 and 0) or 180
	slot9 = 0
	slot10, slot11, slot12 = ipairs(slot5)

	for slot13, slot14 in slot10, slot11, slot12 do
		slot15 = slot14.barrage_ID
		slot16 = slot14.bullet_ID
		slot17 = slot14.emitterType

		if not slot17 then
			slot17 = slot1
			slot17 = slot17.Battle
			slot17 = slot17.BattleWeaponUnit
			slot17 = slot17.EMITTER_SHOTGUN
		end

		slot18 = slot14.inheritAngle
		slot19 = slot14.reaim

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

			slot5 = slot5

			if slot5 then
				slot5 = slot6:GetYAngle() or slot7
				slot6 = slot8

				if slot6 then
					slot6 = slot9
					slot6 = slot6.Battle
					slot6 = slot6.BattleTargetChoise
					slot6 = slot6.TargetHarmNearest
					slot7 = slot6
					slot6 = slot6(slot7)
					slot6 = slot6[1]

					if slot6 == nil then
						slot8 = slot4
						slot7 = slot4.SetRotateInfo
						slot9 = nil
						slot10 = slot5
						slot11 = slot2

						slot7(slot8, slot9, slot10, slot11)
					else
						slot8 = slot4
						slot7 = slot4.SetRotateInfo
						slot10 = slot6
						slot9 = slot6.GetCLDZCenterPosition
						slot9 = slot9(slot10)
						slot10 = slot5
						slot11 = slot2

						slot7(slot8, slot9, slot10, slot11)
					end
				else
					slot7 = slot4
					slot6 = slot4.SetRotateInfo
					slot8 = nil
					slot9 = slot5
					slot10 = slot2

					slot6(slot7, slot8, slot9, slot10)
				end
			end

			slot6 = slot10
			slot6 = slot6.GetFactoryList
			slot6 = slot6()
			slot8 = slot4
			slot7 = slot4.GetTemplate
			slot7 = slot7(slot8)
			slot7 = slot7.type
			slot6 = slot6[slot7]
			slot8 = slot6
			slot7 = slot6.CreateBullet
			slot9 = slot11
			slot10 = slot9
			slot9 = slot9.GetTf
			slot9 = slot9(slot10)
			slot10 = slot4
			slot11 = slot11
			slot12 = slot11
			slot11 = slot11.GetPosition

			slot7(slot8, slot9, slot10, slot11(slot12))
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
			slot0 = slot2

			if slot0 then
				slot0 = slot1
				slot1 = slot3
				slot1 = #slot1

				if slot0 == slot1 then
					slot0 = slot4
					slot1 = slot0
					slot0 = slot0.RemoveBulletUnit
					slot2 = slot5
					slot3 = slot2
					slot2 = slot2.GetUniqueID

					slot0(slot1, slot2(slot3))
				end
			end
		end

		slot23 = slot1
		slot23 = slot23.Battle
		slot23 = slot23[slot17]
		slot23 = slot23.New
		slot24 = slot20
		slot25 = slot22
		slot26 = slot15
		slot23 = slot23(slot24, slot25, slot26)
		slot21 = slot23
		slot24 = slot21
		slot23 = slot21.Ready

		slot23(slot24)

		slot24 = slot21
		slot23 = slot21.Fire
		slot25 = nil
		slot27 = slot7
		slot26 = slot7.GetDirection
		slot26 = slot26(slot27)
		slot27 = slot1
		slot27 = slot27.Battle
		slot27 = slot27.BattleDataFunction
		slot27 = slot27.GetBarrageTmpDataFromID
		slot28 = slot15
		slot27 = slot27(slot28)
		slot27 = slot27.angle

		slot23(slot24, slot25, slot26, slot27)
	end
end

slot1.bulletSplit = slot2

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

		slot1(slot2, slot3)
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
