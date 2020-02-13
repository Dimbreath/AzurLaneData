ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleEffectBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleEffectBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleEffectBulletFactory
slot2 = "BattleEffectBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleEffectBulletFactory

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
	slot3 = slot0
	slot3 = slot3.GetDataProxy
	slot3 = slot3()
	slot5 = slot0
	slot4 = slot0.GetBulletData
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.GetTemplate
	slot5 = slot5(slot6)
	slot6 = slot1
	slot6 = slot6.Battle
	slot6 = slot6.PlayBattleSFX
	slot7 = slot5.hit_sfx

	slot6(slot7)

	slot7 = slot4
	slot6 = slot4.IsFlare
	slot6 = slot6(slot7)

	if not slot6 then
		slot7 = slot4
		slot6 = slot4.spawnArea

		slot6(slot7)
	end

	slot6 = slot0
	slot6 = slot6.GetFXPool
	slot6 = slot6()
	slot7 = slot6
	slot6 = slot6.GetFX
	slot9 = slot0
	slot8 = slot0.GetFXID
	slot6, slot7 = slot6(slot7, slot8(slot9))
	slot9 = slot0
	slot8 = slot0.GetTf
	slot8 = slot8(slot9)
	slot8 = slot8.localPosition
	slot9 = pg
	slot9 = slot9.EffectMgr
	slot9 = slot9.GetInstance
	slot9 = slot9()
	slot10 = slot9
	slot9 = slot9.PlayBattleEffect
	slot11 = slot6
	slot13 = slot7
	slot12 = slot7.Add
	slot14 = slot8
	slot12 = slot12(slot13, slot14)
	slot13 = true

	slot9(slot10, slot11, slot12, slot13)

	slot10 = slot4
	slot9 = slot4.GetPierceCount
	slot9 = slot9(slot10)
	slot10 = 0

	if slot9 <= slot10 then
		slot10 = slot3
		slot9 = slot3.RemoveBulletUnit
		slot12 = slot4
		slot11 = slot4.GetUniqueID

		slot9(slot10, slot11(slot12))
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
end

slot1.MakeModel = slot2

return
