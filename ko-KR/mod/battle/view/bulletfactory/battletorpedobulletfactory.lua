ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleTorpedoBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleTorpedoBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleTorpedoBulletFactory
slot2 = "BattleTorpedoBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleTorpedoBulletFactory

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
	slot1 = slot1.BattleTorpedoBullet
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
	slot5 = slot4.hit_type
	slot6 = slot0
	slot6 = slot6.GetDataProxy
	slot6 = slot6()
	slot8 = slot0
	slot7 = slot0.GetBulletData
	slot7 = slot7(slot8)
	slot9 = slot7
	slot8 = slot7.GetTemplate
	slot8 = slot8(slot9)
	slot9 = slot1
	slot9 = slot9.Battle
	slot9 = slot9.PlayBattleSFX
	slot10 = slot8.hit_sfx

	slot9(slot10)

	slot10 = slot7
	slot9 = slot7.GetDiveFilter
	slot9 = slot9(slot10)

	function slot10(slot0)
		slot1 = ipairs
		slot2 = slot0
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = slot5.Active

			if slot6 then
				slot6 = slot0
				slot7 = slot6
				slot6 = slot6.GetSceneMediator
				slot6 = slot6(slot7)
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

	slot11 = slot5.range

	if slot11 then
		slot12 = slot6
		slot11 = slot6.SpawnColumnArea
		slot14 = slot7
		slot13 = slot7.GetEffectField
		slot13 = slot13(slot14)
		slot15 = slot7
		slot14 = slot7.GetIFF
		slot14 = slot14(slot15)
		slot15 = pg
		slot15 = slot15.Tool
		slot15 = slot15.FilterY
		slot17 = slot0
		slot16 = slot0.GetPosition
		slot16 = slot16(slot17)
		slot17 = slot16
		slot16 = slot16.Clone
		slot15 = slot15(slot16(slot17))
		slot16 = slot5.range
		slot17 = slot5.time
		slot18 = slot10

		slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	else
		slot12 = slot6
		slot11 = slot6.SpawnCubeArea
		slot14 = slot7
		slot13 = slot7.GetEffectField
		slot13 = slot13(slot14)
		slot15 = slot7
		slot14 = slot7.GetIFF
		slot14 = slot14(slot15)
		slot15 = pg
		slot15 = slot15.Tool
		slot15 = slot15.FilterY
		slot17 = slot0
		slot16 = slot0.GetPosition
		slot16 = slot16(slot17)
		slot17 = slot16
		slot16 = slot16.Clone
		slot15 = slot15(slot16(slot17))
		slot16 = slot5.width
		slot17 = slot5.height
		slot18 = slot5.time
		slot19 = slot10

		slot11(slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19)
	end

	slot11 = slot0
	slot11 = slot11.GetFXPool
	slot11 = slot11()
	slot12 = slot11
	slot11 = slot11.GetFX
	slot14 = slot0
	slot13 = slot0.GetFXID
	slot11, slot12 = slot11(slot12, slot13(slot14))
	slot14 = slot0
	slot13 = slot0.GetTf
	slot13 = slot13(slot14)
	slot13 = slot13.localPosition
	slot14 = pg
	slot14 = slot14.EffectMgr
	slot14 = slot14.GetInstance
	slot14 = slot14()
	slot15 = slot14
	slot14 = slot14.PlayBattleEffect
	slot16 = slot11
	slot18 = slot12
	slot17 = slot12.Add
	slot19 = slot13
	slot17 = slot17(slot18, slot19)
	slot18 = true

	slot14(slot15, slot16, slot17, slot18)

	slot15 = slot7
	slot14 = slot7.GetPierceCount
	slot14 = slot14(slot15)
	slot15 = 0

	if slot14 <= slot15 then
		slot15 = slot6
		slot14 = slot6.RemoveBulletUnit
		slot17 = slot7
		slot16 = slot7.GetUniqueID

		slot14(slot15, slot16(slot17))
	end
end

slot1.onBulletHitFunc = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.onBulletHitFunc
	slot2 = slot0

	slot1(slot2)
end

slot1.onBulletMissFunc = slot2

function slot2(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.GetBulletData
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.GetTemplate
	slot4 = slot4(slot5)
	slot6 = slot0
	slot5 = slot0.GetDataProxy
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

	slot8 = slot3
	slot7 = slot3.GetIFF
	slot7 = slot7(slot8)
	slot9 = slot5
	slot8 = slot5.GetFriendlyCode
	slot8 = slot8(slot9)

	if slot7 ~= slot8 then
		slot7 = slot4.alert_fx

		if slot7 ~= "" then
			slot8 = slot1
			slot7 = slot1.MakeAlert
			slot10 = slot0
			slot9 = slot0.GetFXPool
			slot9 = slot9(slot10)
			slot10 = slot9
			slot9 = slot9.GetFX
			slot11 = slot4.alert_fx

			slot7(slot8, slot9(slot10, slot11))
		end
	end
end

slot1.MakeModel = slot2

return
