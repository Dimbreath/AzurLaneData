
-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #1



-- Decompilation error in this vicinity:
--- BLOCK #1 5-17, warpins: 2 ---
slot0 = ys

if not slot0 then

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-4, warpins: 1 ---
	slot0 = {}
	--- END OF BLOCK #0 ---



end

ys = slot0
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleConst
slot2 = pg
slot2 = slot2.bullet_template
slot3 = pg
slot3 = slot3.barrage_template
slot4 = slot0.Battle
slot5 = slot0.Battle
slot5 = slot5.BattleDataFunction
slot5 = slot5 or {}
slot4.BattleDataFunction = slot5
slot4 = slot0.Battle
slot4 = slot4.BattleDataFunction

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.GetBulletTmpDataFromID
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = slot5.type
	slot7 = slot0
	slot7 = slot7.generateBulletFuncs
	slot7 = slot7[slot6]
	slot8 = slot0
	slot9 = slot5
	slot10 = slot2
	slot11 = slot3
	slot12 = slot4
	slot7, slot8 = slot7(slot8, slot9, slot10, slot11, slot12)
	slot10 = slot7
	slot9 = slot7.SetTemplateData
	slot11 = slot5

	slot9(slot10, slot11)

	slot10 = slot7
	slot9 = slot7.SetAttr
	slot11 = slot2._attr

	slot9(slot10, slot11)

	slot10 = slot7
	slot9 = slot7.SetBuffTrigger
	slot11 = slot2

	slot9(slot10, slot11)

	slot10 = slot7
	slot9 = slot7.SetWeapon
	slot11 = slot3

	slot9(slot10, slot11)

	slot9 = slot7
	slot10 = slot8

	return slot9, slot10
	--- END OF BLOCK #0 ---



end

slot4.CreateBattleBulletData = slot5

function slot5(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot4.GetBulletTmpDataFromID = slot5

function slot5(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot4.GetBarrageTmpDataFromID = slot5

function slot5(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.ConvertedBarrageTableList
	slot1 = slot1[slot0]

	return slot1
	--- END OF BLOCK #0 ---



end

slot4.GetConvertedBarrageTableFromID = slot5

function slot5(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = {}
	slot4 = slot0
	slot4 = slot4.GetBarrageTmpDataFromID
	slot5 = slot0
	slot4 = slot4(slot5)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-8, warpins: 2 ---
	slot5 = slot4.trans_ID

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-53, warpins: 0 ---
	while slot5 ~= -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-27, warpins: 1 ---
		slot5 = slot4.trans_ID
		slot6 = slot0
		slot6 = slot6.GetBarrageTmpDataFromID
		slot7 = slot5
		slot6 = slot6(slot7)
		slot4 = slot6
		slot6 = {}
		slot7 = slot4.first_delay
		slot8 = slot4.delay
		slot8 = slot8 * slot2
		slot7 = slot7 + slot8
		slot8 = slot4.delta_delay
		slot8 = slot8 * slot2
		slot7 = slot7 + slot8
		slot6.transStartDelay = slot7
		slot7 = slot4.offset_prioritise

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-38, warpins: 1 ---
			slot7 = slot4.offset_x
			slot8 = slot4.delta_offset_x
			slot8 = slot8 * slot2
			slot7 = slot7 + slot8
			slot6.transAimPosX = slot7
			slot7 = slot4.offset_z
			slot8 = slot4.delta_offset_z
			slot8 = slot8 * slot2
			slot7 = slot7 + slot8
			slot6.transAimPosZ = slot7
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-45, warpins: 1 ---
			slot7 = slot4.angle
			slot8 = slot4.delta_angle
			slot8 = slot8 * slot2
			slot7 = slot7 + slot8
			slot6.transAimAngle = slot7

			if slot1 == -1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 46-48, warpins: 1 ---
				slot7 = slot6.transAimAngle
				slot7 = slot7 + 180
				slot6.transAimAngle = slot7
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 49-52, warpins: 3 ---
		slot7 = #slot3
		slot7 = slot7 + 1
		slot3[slot7] = slot6
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 53-53, warpins: 3 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 53-53, warpins: 1 ---
	return slot3
	--- END OF BLOCK #3 ---



end

slot4.GenerateTransBarrage = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleCannonBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = true

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = true

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createCannonBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleBombBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetAttr
	slot8 = slot2._attr

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetTemplateData
	slot8 = slot1

	slot6(slot7, slot8)

	slot7 = slot4
	slot6 = slot4.EqualZero
	slot6 = slot6(slot7)

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-41, warpins: 1 ---
		slot7 = slot2
		slot6 = slot2.GetPosition
		slot6 = slot6(slot7)
		slot7 = slot6
		slot6 = slot6.Clone
		slot6 = slot6(slot7)
		slot4 = slot6
		slot7 = slot3
		slot6 = slot3.GetTemplateData
		slot6 = slot6(slot7)
		slot6 = slot6.range
		slot8 = slot2
		slot7 = slot2.GetDirection
		slot7 = slot7(slot8)
		slot8 = slot1
		slot8 = slot8.UnitDir
		slot8 = slot8.RIGHT

		if slot7 == slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-45, warpins: 1 ---
			slot7 = slot4.x
			slot7 = slot7 + slot6
			slot4.x = slot7
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-48, warpins: 1 ---
			slot7 = slot4.x
			slot7 = slot7 - slot6
			slot4.x = slot7
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 49-59, warpins: 3 ---
	slot7 = slot5
	slot6 = slot5.SetExplodePosition
	slot8 = slot4

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = false

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = false

	return slot6, slot7
	--- END OF BLOCK #1 ---



end

slot4._createBombBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleStrayBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = true

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = true

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createStrayBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleTorpedoBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetExplodePosition
	slot8 = slot4

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = true

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = true

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createTorpedoBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleAntiAirBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = false

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = false

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createDirectBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleAntiAirBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = false

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = false

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createAntiAirBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleAntiSeaBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = false

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = false

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createAntiSeaBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleShrapnelBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetExplodePosition
	slot8 = slot4

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetSrcHost
	slot8 = slot2

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = true

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = true

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createSharpnelBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleEffectBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetTemplateData
	slot8 = slot1

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = false

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetImmuneCLS
	slot8 = true

	slot6(slot7, slot8)

	slot6 = slot1.attach_buff
	slot6 = slot6[1]
	slot6 = slot6.flare

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot7 = slot5
		slot6 = slot5.spawnArea
		slot8 = true

		slot6(slot7, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-33, warpins: 2 ---
	slot6 = slot5
	slot7 = false

	return slot6, slot7
	--- END OF BLOCK #1 ---



end

slot4._createEffectBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleAntiAirBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = false

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = false

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createBeamBullet = slot5

function slot5(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot5 = slot0
	slot5 = slot5.Battle
	slot5 = slot5.BattleGravitationBulletUnit
	slot5 = slot5.New
	slot6 = slot0
	slot8 = slot2
	slot7 = slot2.GetIFF
	slot5 = slot5(slot6, slot7(slot8))
	slot7 = slot5
	slot6 = slot5.SetExplodePosition
	slot8 = slot4

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetIsCld
	slot8 = true

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.SetImmuneCLS
	slot8 = true

	slot6(slot7, slot8)

	slot6 = slot5
	slot7 = true

	return slot6, slot7
	--- END OF BLOCK #0 ---



end

slot4._createGravitationBullet = slot5
slot5 = {}
slot4.generateBulletFuncs = slot5
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.CANNON
slot7 = slot4._createCannonBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.BOMB
slot7 = slot4._createBombBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.TORPEDO
slot7 = slot4._createTorpedoBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.DIRECT
slot7 = slot4._createDirectBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.ANTI_AIR
slot7 = slot4._createAntiAirBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.ANTI_SEA
slot7 = slot4._createAntiSeaBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.SHRAPNEL
slot7 = slot4._createSharpnelBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.STRAY
slot7 = slot4._createStrayBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.EFFECT
slot7 = slot4._createEffectBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.BEAM
slot7 = slot4._createBeamBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.G_BULLET
slot7 = slot4._createGravitationBullet
slot5[slot6] = slot7
slot5 = slot4.generateBulletFuncs
slot6 = slot1.BulletType
slot6 = slot6.ELECTRIC_ARC
slot7 = slot4._createDirectBullet
slot5[slot6] = slot7

function slot5()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0 = {}
	slot1 = slot0
	slot1 = slot1.Battle
	slot1 = slot1.BattleConst
	slot1 = slot1.UnitDir
	slot1 = slot1.LEFT
	slot2 = slot0
	slot2 = slot2.Battle
	slot2 = slot2.BattleConst
	slot2 = slot2.UnitDir
	slot2 = slot2.RIGHT
	slot3 = ipairs
	slot4 = pg
	slot4 = slot4.barrage_template
	slot4 = slot4.all
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-31, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-29, warpins: 1 ---
		slot8 = slot1
		slot8 = slot8.barrageInteration
		slot9 = pg
		slot9 = slot9.barrage_template
		slot9 = slot9[slot7]
		slot8, slot9 = slot8(slot9)
		slot10 = {}
		slot0[slot7] = slot10
		slot10 = slot0[slot7]
		slot10[slot2] = slot8
		slot10 = slot0[slot7]
		slot10[slot1] = slot9
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-31, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-34, warpins: 1 ---
	slot3 = slot1
	slot3.ConvertedBarrageTableList = slot0

	return
	--- END OF BLOCK #2 ---



end

slot4.ConvertBarrage = slot5

function slot5(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot1 = 1
	slot2 = slot0.primal_repeat
	slot3 = {}
	slot4 = {}
	slot5 = slot0.offset_x
	slot6 = slot0.offset_z
	slot7 = slot0.angle
	slot8 = slot0.delay
	slot9 = slot0.delta_offset_x
	slot10 = slot0.delta_offset_z
	slot11 = slot0.delta_angle
	slot12 = slot0.delta_delay
	slot13 = 0
	slot14 = slot2
	slot15 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-42, warpins: 0 ---
	for slot16 = slot13, slot14, slot15 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-42, warpins: 2 ---
		slot17 = {}
		slot17.OffsetX = slot5
		slot17.OffsetZ = slot6
		slot17.Angle = slot7
		slot17.Delay = slot8
		slot18 = table
		slot18 = slot18.insert
		slot19 = slot3
		slot20 = slot17

		slot18(slot19, slot20)

		slot18 = Clone
		slot19 = slot17
		slot18 = slot18(slot19)
		slot19 = slot18.OffsetX
		slot19 = slot19 * -1
		slot18.OffsetX = slot19
		slot19 = table
		slot19 = slot19.insert
		slot20 = slot4
		slot21 = slot18

		slot19(slot20, slot21)

		slot5 = slot5 + slot9
		slot6 = slot6 + slot10
		slot7 = slot7 + slot11
		slot8 = slot8 + slot12
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-45, warpins: 1 ---
	slot13 = slot3
	slot14 = slot4

	return slot13, slot14
	--- END OF BLOCK #2 ---



end

slot4.barrageInteration = slot5
slot5 = slot4.ConvertBarrage

slot5()

return

--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #3



-- Decompilation error in this vicinity:
--- BLOCK #2 18-18, warpins: 1 ---
slot5 = 
--- END OF BLOCK #2 ---

FLOW; TARGET BLOCK #3



-- Decompilation error in this vicinity:
--- BLOCK #3 19-123, warpins: 2 ---
--- END OF BLOCK #3 ---



