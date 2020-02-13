ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleAntiSeaBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleAntiSeaBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleAntiSeaBulletFactory
slot2 = "BattleAntiSeaBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleAntiSeaBulletFactory

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
	slot11 = slot11.GetCharacter
	slot13 = slot10
	slot11 = slot11(slot12, slot13)

	if not slot11 then
		slot13 = slot8
		slot12 = slot8.RemoveBulletUnit
		slot15 = slot2
		slot14 = slot2.GetUniqueID

		slot12(slot13, slot14(slot15))

		return
	end

	slot12 = slot7.range
	slot13, slot14, slot15 = nil

	function slot16()
		slot0 = slot0

		if slot0 then
			slot0 = nil
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.GetPosition
			slot1 = slot1(slot2)
			slot2 = slot1
			slot1 = slot1.Clone
			slot1 = slot1(slot2)
			slot2 = slot2
			slot3 = slot2
			slot2 = slot2.IsAlive
			slot2 = slot2(slot3)

			if slot2 then
				slot2 = slot1

				if slot2 then
					slot3 = slot1
					slot2 = slot1.Add
					slot4 = Vector3
					slot5 = math
					slot5 = slot5.random
					slot6 = slot3
					slot5 = slot5(slot6)
					slot6 = slot3
					slot6 = slot6 * 0.5
					slot5 = slot5 - slot6
					slot6 = 0
					slot7 = math
					slot7 = slot7.random
					slot8 = slot3
					slot7 = slot7(slot8)
					slot8 = slot3
					slot8 = slot8 * 0.5
					slot7 = slot7 - slot8
					slot2 = slot2(slot3, slot4(slot5, slot6, slot7))
					slot0 = slot2
				end
			else
				slot0 = slot1
			end

			slot2 = slot4
			slot3 = slot2
			slot2 = slot2.GetFXPool
			slot2 = slot2(slot3)
			slot3 = slot2
			slot2 = slot2.GetFX
			slot4 = slot5
			slot5 = slot4
			slot4 = slot4.GetTemplate
			slot4 = slot4(slot5)
			slot4 = slot4.hit_fx
			slot2, slot3 = slot2(slot3, slot4)
			slot4 = pg
			slot4 = slot4.EffectMgr
			slot4 = slot4.GetInstance
			slot4 = slot4()
			slot5 = slot4
			slot4 = slot4.PlayBattleEffect
			slot6 = slot2
			slot8 = slot3
			slot7 = slot3.Add
			slot9 = slot0
			slot7 = slot7(slot8, slot9)
			slot8 = true

			slot4(slot5, slot6, slot7, slot8)
		end
	end

	function slot17()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.IsAlive
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.HandleDamage
			slot2 = slot2
			slot3 = slot0

			slot0(slot1, slot2, slot3)

			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.RemoveBulletUnit
			slot2 = slot2
			slot3 = slot2
			slot2 = slot2.GetUniqueID

			slot0(slot1, slot2(slot3))
		end

		slot0 = pg
		slot0 = slot0.TimeMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.RemoveBattleTimer
		slot2 = slot3

		slot0(slot1, slot2)

		slot0 = slot4
		slot0 = slot0._tmpTimerList
		slot1 = slot3
		slot2 = nil
		slot0[slot1] = slot2
		slot3 = nil
	end

	slot18 = pg
	slot18 = slot18.TimeMgr
	slot18 = slot18.GetInstance
	slot18 = slot18()
	slot19 = slot18
	slot18 = slot18.AddBattleTimer
	slot20 = "antiAirTimer"
	slot21 = 0
	slot22 = 0.5
	slot23 = slot17
	slot24 = true
	slot18 = slot18(slot19, slot20, slot21, slot22, slot23, slot24)
	slot13 = slot18
	slot18 = slot0._tmpTimerList
	slot18[slot13] = slot13

	if slot4 ~= nil then
		slot19 = slot0
		slot18 = slot0.PlayFireFX
		slot20 = slot1
		slot21 = slot2
		slot22 = slot3
		slot23 = slot4
		slot24 = slot5
		slot25 = nil

		slot18(slot19, slot20, slot21, slot22, slot23, slot24, slot25)

		slot18 = pg
		slot18 = slot18.TimeMgr
		slot18 = slot18.GetInstance
		slot18 = slot18()
		slot19 = slot18
		slot18 = slot18.AddBattleTimer
		slot20 = "showHitFXTimer"
		slot21 = -1
		slot22 = 0.1
		slot23 = slot16
		slot24 = true
		slot18 = slot18(slot19, slot20, slot21, slot22, slot23, slot24)
		slot14 = slot18
		slot18 = slot0._tmpTimerList
		slot18[slot14] = slot14
		slot18 = slot16

		slot18()
	else
		slot19 = slot8
		slot18 = slot8.HandleDamage
		slot20 = slot2
		slot21 = slot9

		slot18(slot19, slot20, slot21)

		slot19 = slot8
		slot18 = slot8.RemoveBulletUnit
		slot21 = slot2
		slot20 = slot2.GetUniqueID

		slot18(slot19, slot20(slot21))
	end
end

slot1.CreateBullet = slot2

return
