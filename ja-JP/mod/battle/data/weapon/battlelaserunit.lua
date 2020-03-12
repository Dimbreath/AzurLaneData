ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleDataFunction
slot2 = slot0.Battle
slot2 = slot2.BattleConst
slot3 = slot0.Battle
slot3 = slot3.BattleConfig
slot4 = class
slot5 = "BattleLaserUnit"
slot6 = slot0.Battle
slot6 = slot6.BattleWeaponUnit
slot4 = slot4(slot5, slot6)
slot5 = slot0.Battle
slot5.BattleLaserUnit = slot4
slot5 = "BattleLaserUnit"
slot4.__name = slot5
slot5 = "FIB"
slot4.STATE_ATTACK = slot5
slot5 = "beamStateReady"
slot4.BEAM_STATE_READY = slot5
slot5 = "beamStateOverHeat"
slot4.BEAM_STATE_OVER_HEAT = slot5

function slot5(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)
end

slot4.Ctor = slot5

function slot5(slot0)
	slot1 = slot0._alertTimer

	if slot1 then
		slot1 = pg
		slot1 = slot1.TimeMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.RemoveBattleTimer
		slot3 = slot0._alertTimer

		slot1(slot2, slot3)
	end

	slot1 = nil
	slot0._alertTimer = slot1
	slot1 = ipairs
	slot2 = slot0._beamList
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.GetBeamState
		slot6 = slot6(slot7)
		slot7 = slot5.BEAM_STATE_ATTACK

		if slot6 == slot7 then
			slot6 = slot0._dataProxy
			slot7 = slot6
			slot6 = slot6.RemoveAreaOfEffect
			slot9 = slot5
			slot8 = slot5.GetAoeData
			slot8 = slot8(slot9)
			slot9 = slot8
			slot8 = slot8.GetUniqueID

			slot6(slot7, slot8(slot9))
		end

		slot7 = slot5
		slot6 = slot5.ClearBeam

		slot6(slot7)
	end

	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Clear
	slot2 = slot0

	slot1(slot2)
end

slot4.Clear = slot5

function slot5(slot0)
	slot2 = slot0
	slot1 = slot0.UpdateReload

	slot1(slot2)

	slot1 = slot0._currentState
	slot2 = slot0.STATE_READY

	if slot1 == slot2 then
		slot2 = slot0
		slot1 = slot0.updateMovementInfo

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.Tracking
		slot1 = slot1(slot2)

		if slot1 then
			slot2 = slot0._preCastInfo
			slot2 = slot2.time

			if slot2 ~= nil then
				slot3 = slot0
				slot2 = slot0.PreCast
				slot4 = slot1

				slot2(slot3, slot4)
			else
				slot2 = slot0.STATE_PRECAST_FINISH
				slot0._currentState = slot2
			end
		end
	end

	slot1 = slot0._currentState
	slot2 = slot0.STATE_PRECAST

	if slot1 == slot2 then
	else
		slot1 = slot0._currentState
		slot2 = slot0.STATE_PRECAST_FINISH

		if slot1 == slot2 then
			slot2 = slot0
			slot1 = slot0.updateMovementInfo

			slot1(slot2)

			slot2 = slot0
			slot1 = slot0.Fire
			slot4 = slot0
			slot3 = slot0.Tracking

			slot1(slot2, slot3(slot4))
		end
	end

	slot1 = slot0._attackStartTime

	if slot1 then
		slot2 = slot0
		slot1 = slot0.updateMovementInfo

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.updateBeamList

		slot1(slot2)
	end
end

slot4.Update = slot5

function slot5(slot0, slot1)
	if slot1 ~= nil then
		slot3 = slot1
		slot2 = slot1.IsAlive
		slot2 = slot2(slot3)

		if slot2 then
			slot3 = slot0
			slot2 = slot0.outOfFireRange
			slot4 = slot1
			slot2 = slot2(slot3, slot4)

			if slot2 then
				slot1 = nil
			end
		end
	end

	slot2 = pg
	slot2 = slot2.TimeMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetCombatTime
	slot2 = slot2(slot3)
	slot0._attackStartTime = slot2
	slot2 = ipairs
	slot3 = slot0._beamList
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.ChangeBeamState
		slot9 = slot6.BEAM_STATE_READY

		slot7(slot8, slot9)

		slot7 = slot0
		slot7 = slot7.GetBarrageTmpDataFromID
		slot9 = slot6
		slot8 = slot6.GetBeamInfoID
		slot7 = slot7(slot8(slot9))
		slot8 = slot7.first_delay

		if slot8 == 0 then
			slot9 = slot0
			slot8 = slot0.createBeam
			slot10 = slot6

			slot8(slot9, slot10)
		end
	end

	slot2 = slot1
	slot2 = slot2.Battle
	slot2 = slot2.PlayBattleSFX
	slot3 = slot0._tmpData
	slot3 = slot3.fire_sfx

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.TriggerBuffOnFire

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.CheckAndShake

	slot2(slot3)
end

slot4.DoAttack = slot5

function slot5(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.super
	slot2 = slot2.SetTemplateData
	slot3 = slot0
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.initBeamList

	slot2(slot3)
end

slot4.SetTemplateData = slot5

function slot5(slot0)
	slot1 = slot0._tmpData
	slot1 = slot1.barrage_ID
	slot2 = slot0._tmpData
	slot2 = slot2.bullet_ID
	slot3 = {}
	slot0._alertList = slot3
	slot3 = {}
	slot0._beamList = slot3
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._beamList
		slot9 = slot0
		slot9 = slot9.Battle
		slot9 = slot9.BattleBeamUnit
		slot9 = slot9.New
		slot10 = slot7
		slot11 = slot1[slot6]
		slot9 = slot9(slot10, slot11)
		slot8[slot6] = slot9
	end
end

slot4.initBeamList = slot5

function slot5(slot0)
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.GetCombatTime
	slot1 = slot1(slot2)
	slot2 = slot0._attackStartTime
	slot1 = slot1 - slot2
	slot2 = 0
	slot3 = ipairs
	slot4 = slot0._beamList
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot9 = slot7
		slot8 = slot7.GetBeamState
		slot8 = slot8(slot9)
		slot9 = slot7.BEAM_STATE_READY

		if slot8 == slot9 then
			slot8 = slot0
			slot8 = slot8.GetBarrageTmpDataFromID
			slot10 = slot7
			slot9 = slot7.GetBeamInfoID
			slot8 = slot8(slot9(slot10))
			slot9 = slot8.first_delay

			if slot9 < slot1 then
				slot10 = slot0
				slot9 = slot0.createBeam
				slot11 = slot7

				slot9(slot10, slot11)
			end
		else
			slot9 = slot7
			slot8 = slot7.GetBeamState
			slot8 = slot8(slot9)
			slot9 = slot7.BEAM_STATE_ATTACK

			if slot8 == slot9 then
				slot9 = slot7
				slot8 = slot7.IsBeamActive
				slot8 = slot8(slot9)

				if not slot8 then
					slot9 = slot7
					slot8 = slot7.ClearBeam

					slot8(slot9)

					slot2 = slot2 + 1
				else
					slot9 = slot7
					slot8 = slot7.UpdateBeamPos
					slot10 = slot0._hostPos

					slot8(slot9, slot10)

					slot9 = slot7
					slot8 = slot7.UpdateBeamAngle

					slot8(slot9)

					slot9 = slot7
					slot8 = slot7.CanDealDamage
					slot8 = slot8(slot9)

					if slot8 then
						slot9 = slot0
						slot8 = slot0.doBeamDamage
						slot10 = slot7

						slot8(slot9, slot10)
					end
				end
			else
				slot9 = slot7
				slot8 = slot7.GetBeamState
				slot8 = slot8(slot9)
				slot9 = slot7.BEAM_STATE_FINISH

				if slot8 == slot9 then
					slot2 = slot2 + 1
				end
			end
		end
	end

	slot3 = slot0._beamList
	slot3 = #slot3

	if slot2 == slot3 then
		slot4 = slot0
		slot3 = slot0.EnterCoolDown

		slot3(slot4)
	end
end

slot4.updateBeamList = slot5

function slot5(slot0, slot1)
	function slot2(slot0)
		slot1 = ipairs
		slot2 = slot0
		slot1, slot2, slot3 = slot1(slot2)

		for slot4, slot5 in slot1, slot2, slot3 do
			slot6 = slot5.Active

			if slot6 then
				slot6 = slot0
				slot6 = slot6._dataProxy
				slot7 = slot6
				slot6 = slot6.GetUnitList
				slot6 = slot6(slot7)
				slot7 = slot5.UID
				slot6 = slot6[slot7]
				slot7 = slot1
				slot8 = slot7
				slot7 = slot7.AddCldUnit
				slot9 = slot6

				slot7(slot8, slot9)
			end
		end
	end

	function slot3(slot0)
		slot1 = slot0.Active

		if slot1 then
			slot1 = slot0
			slot1 = slot1._dataProxy
			slot2 = slot1
			slot1 = slot1.GetUnitList
			slot1 = slot1(slot2)
			slot2 = slot0.UID
			slot1 = slot1[slot2]
			slot2 = slot1
			slot3 = slot2
			slot2 = slot2.RemoveCldUnit
			slot4 = slot1

			slot2(slot3, slot4)
		end
	end

	slot4 = slot0
	slot4 = slot4.GetBarrageTmpDataFromID
	slot6 = slot1
	slot5 = slot1.GetBeamInfoID
	slot4 = slot4(slot5(slot6))
	slot5 = slot0
	slot5 = slot5.GetBulletTmpDataFromID
	slot7 = slot1
	slot6 = slot1.GetBulletID
	slot5 = slot5(slot6(slot7))
	slot6 = slot4.offset_x
	slot7 = slot4.offset_z
	slot8 = slot4.delta_offset_x
	slot9 = slot4.delta_offset_z
	slot10 = slot4.delay
	slot11 = slot0._host
	slot12 = slot11
	slot11 = slot11.GetIFF
	slot11 = slot11(slot12)
	slot12 = slot0._dataProxy
	slot13 = slot12
	slot12 = slot12.SpawnLastingCubeArea
	slot14 = slot1
	slot14 = slot14.AOEField
	slot14 = slot14.SURFACE
	slot15 = slot11
	slot16 = Vector3
	slot17 = slot0._hostPos
	slot17 = slot17.x
	slot17 = slot17 + slot6
	slot18 = 0
	slot19 = slot0._hostPos
	slot19 = slot19.z
	slot19 = slot19 + slot7
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = slot8
	slot18 = slot9
	slot19 = slot10
	slot20 = slot2
	slot21 = slot3
	slot22 = false
	slot23 = slot5.modle_ID
	slot12 = slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23)
	slot13 = slot2
	slot13 = slot13.FRIENDLY_CODE

	if slot11 == slot13 then
		slot14 = slot12
		slot13 = slot12.SetAnchorPointAlignment
		slot15 = slot12.ALIGNMENT_LEFT

		slot13(slot14, slot15)
	else
		slot13 = slot2
		slot13 = slot13.FOE_CODE

		if slot11 == slot13 then
			slot14 = slot12
			slot13 = slot12.SetAnchorPointAlignment
			slot15 = slot12.ALIGNMENT_RIGHT

			slot13(slot14, slot15)
		end
	end

	slot14 = slot12
	slot13 = slot12.SetFXStatic
	slot15 = true

	slot13(slot14, slot15)

	slot14 = slot1
	slot13 = slot1.SetAoeData
	slot15 = slot12

	slot13(slot14, slot15)

	slot14 = slot1
	slot13 = slot1.BeginFocus

	slot13(slot14)

	slot14 = slot1
	slot13 = slot1.ChangeBeamState
	slot15 = slot1.BEAM_STATE_ATTACK

	slot13(slot14, slot15)
end

slot4.createBeam = slot5

function slot5(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.DealDamage

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.Spawn
	slot5 = slot1
	slot4 = slot1.GetBulletID
	slot2 = slot2(slot3, slot4(slot5))
	slot4 = slot1
	slot3 = slot1.GetCldUnitList
	slot3 = slot3(slot4)
	slot4 = pairs
	slot5 = slot3
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot10 = slot8
		slot9 = slot8.IsAlive
		slot9 = slot9(slot10)

		if slot9 then
			slot9 = slot0._dataProxy
			slot10 = slot9
			slot9 = slot9.HandleDamage
			slot11 = slot2
			slot12 = slot8

			slot9(slot10, slot11, slot12)

			slot9 = slot0
			slot9 = slot9.Battle
			slot9 = slot9.BattleFXPool
			slot9 = slot9.GetInstance
			slot9 = slot9()
			slot10 = slot9
			slot9 = slot9.GetFX
			slot12 = slot1
			slot11 = slot1.GetFXID
			slot9, slot10 = slot9(slot10, slot11(slot12))
			slot11 = pg
			slot11 = slot11.EffectMgr
			slot11 = slot11.GetInstance
			slot11 = slot11()
			slot12 = slot11
			slot11 = slot11.PlayBattleEffect
			slot13 = slot9
			slot15 = slot10
			slot14 = slot10.Add
			slot17 = slot8
			slot16 = slot8.GetPosition
			slot14 = slot14(slot15, slot16(slot17))
			slot15 = true

			slot11(slot12, slot13, slot14, slot15)

			slot11 = slot0
			slot11 = slot11.Battle
			slot11 = slot11.PlayBattleSFX
			slot13 = slot1
			slot12 = slot1.GetSFXID

			slot11(slot12(slot13))
		end
	end
end

slot4.doBeamDamage = slot5

function slot5(slot0)
	slot1 = nil
	slot0._attackStartTime = slot1
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.EnterCoolDown
	slot2 = slot0

	slot1(slot2)
end

slot4.EnterCoolDown = slot5

return
