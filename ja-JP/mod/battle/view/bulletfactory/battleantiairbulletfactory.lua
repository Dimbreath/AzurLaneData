ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleAntiAirBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleAntiAirBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleAntiAirBulletFactory
slot2 = "BattleAntiAirBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleAntiAirBulletFactory

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)

	slot1 = {}
	slot0._tmpTimerList = slot1
end

slot1.Ctor = slot2

function slot2(slot0)
	slot1 = pairs
	slot2 = slot0._tmpTimerList
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = pg
		slot6 = slot6.TimeMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.RemoveBattleTimer
		slot8 = slot5

		slot6(slot7, slot8)

		slot6 = slot0._tmpTimerList
		slot7 = nil
		slot6[slot5] = slot7
	end
end

slot1.NeutralizeBullet = slot2

function slot2(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = slot2
	slot6 = slot2.GetTemplate
	slot6 = slot6(slot7)
	slot7 = slot6.hit_type
	slot9 = slot0
	slot8 = slot0.GetDataProxy
	slot8 = slot8(slot9)
	slot10 = slot2
	slot9 = slot2.GetDirectHitUnit
	slot9 = slot9(slot10)

	if not slot9 then
		slot11 = slot8
		slot10 = slot8.RemoveBulletUnit
		slot13 = slot2
		slot12 = slot2.GetUniqueID

		slot10(slot11, slot12(slot13))

		return
	end

	slot11 = slot9
	slot10 = slot9.GetUniqueID
	slot10 = slot10(slot11)
	slot12 = slot0
	slot11 = slot0.GetSceneMediator
	slot11 = slot11(slot12)
	slot12 = slot11
	slot11 = slot11.GetAircraft
	slot13 = slot10
	slot11 = slot11(slot12, slot13)

	if slot11 == nil then
		slot13 = slot8
		slot12 = slot8.RemoveBulletUnit
		slot15 = slot2
		slot14 = slot2.GetUniqueID

		slot12(slot13, slot14(slot15))

		return
	end

	slot13 = slot11
	slot12 = slot11.GetPosition
	slot12 = slot12(slot13)
	slot13 = slot12
	slot12 = slot12.Clone
	slot12 = slot12(slot13)
	slot13 = slot7.range

	function slot14(slot0)
		slot1 = {}
		slot2 = ipairs
		slot3 = slot0
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			slot7 = slot6.Active

			if slot7 then
				slot7 = slot0
				slot8 = slot7
				slot7 = slot7.GetSceneMediator
				slot7 = slot7(slot8)
				slot8 = slot7
				slot7 = slot7.GetAircraft
				slot9 = slot6.UID
				slot7 = slot7(slot8, slot9)

				if slot7 then
					slot9 = slot7
					slot8 = slot7.GetUnitData
					slot8 = slot8(slot9)
					slot10 = slot8
					slot9 = slot8.IsVisitable
					slot9 = slot9(slot10)

					if slot9 then
						slot9 = #slot1
						slot9 = slot9 + 1
						slot1[slot9] = slot8
					end
				end
			end
		end

		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.HandleMeteoDamage
		slot4 = slot2
		slot5 = slot1

		slot2(slot3, slot4, slot5)
	end

	function slot15()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.SpawnColumnArea
		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.GetEffectField
		slot2 = slot2(slot3)
		slot3 = slot1
		slot4 = slot3
		slot3 = slot3.GetIFF
		slot3 = slot3(slot4)
		slot4 = slot2
		slot5 = slot3
		slot6 = slot4
		slot6 = slot6.time
		slot7 = slot5

		slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.RemoveBulletUnit
		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.GetUniqueID

		slot0(slot1, slot2(slot3))
	end

	function slot16()
		slot0 = nil
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.IsAlive
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = slot1

			if slot1 then
				slot1 = slot1
				slot2 = slot1
				slot1 = slot1.GetPosition
				slot1 = slot1(slot2)
				slot2 = slot1
				slot1 = slot1.Clone
				slot1 = slot1(slot2)
				slot2 = slot1
				slot1 = slot1.Add
				slot3 = Vector3
				slot4 = math
				slot4 = slot4.random
				slot5 = slot2
				slot4 = slot4(slot5)
				slot5 = slot2
				slot5 = slot5 * 0.5
				slot4 = slot4 - slot5
				slot5 = 0
				slot6 = math
				slot6 = slot6.random
				slot7 = slot2
				slot6 = slot6(slot7)
				slot7 = slot2
				slot7 = slot7 * 0.5
				slot6 = slot6 - slot7
				slot1 = slot1(slot2, slot3(slot4, slot5, slot6))
				slot0 = slot1
				slot3 = slot0
			end
		else
			slot0 = slot3
		end

		slot1 = slot4
		slot2 = slot1
		slot1 = slot1.GetFXPool
		slot1 = slot1(slot2)
		slot2 = slot1
		slot1 = slot1.GetFX
		slot3 = slot5
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
		slot8 = slot0
		slot6 = slot6(slot7, slot8)
		slot7 = true

		slot3(slot4, slot5, slot6, slot7)
	end

	slot17, slot18 = nil

	function slot19()
		slot0 = slot0

		if slot0 == nil then
			slot0 = slot1

			slot0()
		else
			slot0 = slot2
			slot1 = slot0
			slot0 = slot0.PlayFireFX
			slot2 = slot3
			slot3 = slot4
			slot4 = slot5
			slot5 = slot0
			slot6 = slot6
			slot7 = slot7

			slot0(slot1, slot2, slot3, slot4, slot5, slot6, slot7)
		end
	end

	function slot18()
		slot0 = slot0
		slot0 = slot0._tmpTimerList
		slot1 = slot1
		slot0 = slot0[slot1]

		if slot0 ~= nil then
			slot0 = slot2

			slot0()

			slot0 = slot3

			slot0()
		else
			slot0 = slot4

			slot0()
		end
	end

	function slot20()
		slot0 = pg
		slot0 = slot0.TimeMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.RemoveBattleTimer
		slot2 = slot0

		slot0(slot1, slot2)

		slot0 = slot1
		slot0 = slot0._tmpTimerList
		slot1 = slot0
		slot2 = nil
		slot0[slot1] = slot2
		slot0 = nil
	end

	slot21 = pg
	slot21 = slot21.TimeMgr
	slot21 = slot21.GetInstance
	slot21 = slot21()
	slot22 = slot21
	slot21 = slot21.AddBattleTimer
	slot23 = "antiAirTimer"
	slot24 = -1
	slot25 = 0.5
	slot26 = slot20
	slot27 = true
	slot21 = slot21(slot22, slot23, slot24, slot25, slot26, slot27)
	slot17 = slot21
	slot21 = slot0._tmpTimerList
	slot21[slot17] = slot17
	slot21 = slot19

	slot21()
end

slot1.CreateBullet = slot2

return
