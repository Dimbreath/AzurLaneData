slot0 = ys
slot0 = slot0 or {}
ys = slot0
slot0 = ys
slot1 = slot0.Battle
slot1 = slot1.BattleConfig
slot2 = singletonClass
slot3 = "BattleCharacterFactory"
slot2 = slot2(slot3)
slot3 = slot0.Battle
slot3.BattleCharacterFactory = slot2
slot3 = "BattleCharacterFactory"
slot2.__name = slot3
slot3 = ""
slot2.HP_BAR_NAME = slot3
slot3 = "popup"
slot2.POPUP_NAME = slot3
slot3 = "ChargeAreaContainer/LockTag"
slot2.TAG_NAME = slot3
slot3 = Vector3
slot4 = 0
slot5 = -2.3
slot6 = -1.5
slot3 = slot3(slot4, slot5, slot6)
slot2.MOVE_WAVE_FX_POS = slot3
slot3 = "movewave"
slot2.MOVE_WAVE_FX_NAME = slot3
slot3 = "smoke"
slot2.SMOKE_FX_NAME = slot3
slot3 = "Bomb"
slot2.BOMB_FX_NAME = slot3
slot3 = "danchuanlanghuazhong2"
slot2.DANCHUAN_MOVE_WAVE_FX_NAME = slot3

function slot3(slot0)
end

slot2.Ctor = slot3

function slot3(slot0, slot1)
	slot2 = slot1.unit
	slot4 = slot0
	slot3 = slot0.MakeCharacter
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.SetFactory
	slot6 = slot0

	slot4(slot5, slot6)

	slot5 = slot3
	slot4 = slot3.SetUnitData
	slot6 = slot2

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.MakeModel
	slot6 = slot3

	slot4(slot5, slot6)

	return slot3
end

slot2.CreateCharacter = slot3

function slot3(slot0)
	slot1 = uv0
	slot1 = slot1.Battle
	slot1 = slot1.BattleState
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.GetMediatorByName
	slot3 = uv0
	slot3 = slot3.Battle
	slot3 = slot3.BattleSceneMediator
	slot3 = slot3.__name

	return slot1(slot2, slot3)
end

slot2.GetSceneMediator = slot3

function slot3(slot0)
	slot1 = uv0
	slot1 = slot1.Battle
	slot1 = slot1.BattleFXPool
	slot1 = slot1.GetInstance

	return slot1()
end

slot2.GetFXPool = slot3

function slot3(slot0)
	slot1 = uv0
	slot1 = slot1.Battle
	slot1 = slot1.BattleResourceManager
	slot1 = slot1.GetInstance

	return slot1()
end

slot2.GetCharacterPool = slot3

function slot3(slot0)
	slot1 = uv0
	slot1 = slot1.Battle
	slot1 = slot1.BattleHPBarManager
	slot1 = slot1.GetInstance

	return slot1()
end

slot2.GetHPBarPool = slot3

function slot3(slot0)
	slot1 = uv0
	slot1 = slot1.Battle
	slot1 = slot1.BattleDataProxy
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot1 = slot1._mapId
	slot2 = uv0
	slot2 = slot2.Battle
	slot2 = slot2.BattleDataFunction
	slot2 = slot2.GetDivingFilter
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = Color
	slot3 = slot3.New
	slot4 = slot2.r
	slot5 = slot2.g
	slot6 = slot2.b
	slot7 = slot2.a
	slot3 = slot3(slot4, slot5, slot6, slot7)

	return slot3
end

slot2.GetDivingFilterColor = slot3

function slot3(slot0)
	slot1 = uv0
	slot1 = slot1.Battle
	slot1 = slot1.BattleCharacterFXContainersPool
	slot1 = slot1.GetInstance

	return slot1()
end

slot2.GetFXContainerPool = slot3

function slot3(slot0)
	slot1 = nil

	return slot1
end

slot2.MakeCharacter = slot3

function slot3(slot0, slot1)
	slot2 = nil

	return slot2
end

slot2.MakeModel = slot3

function slot3(slot0, slot1)
	slot2 = nil

	return slot2
end

slot2.MakeBloodBar = slot3

function slot3(slot0, slot1, slot2, slot3)
	slot5 = slot1
	slot4 = slot1.GetUnitData
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.GetTemplate
	slot5 = slot5(slot6)
	slot5 = slot5.hp_bar
	slot5 = slot5[1]
	slot6 = slot2.transform
	slot7 = slot6.rect
	slot7 = slot7.height
	slot8 = Vector2
	slot9 = slot5
	slot10 = slot7
	slot8 = slot8(slot9, slot10)
	slot6.sizeDelta = slot8
	slot9 = slot6
	slot8 = slot6.Find
	slot10 = "blood"
	slot8 = slot8(slot9, slot10)
	slot8 = slot8.transform
	slot9 = slot8.rect
	slot7 = slot9.height
	slot9 = Vector2
	slot10 = slot5 + slot3

	if not slot10 then
		slot10 = 0
	end

	slot11 = slot7
	slot9 = slot9(slot10, slot11)
	slot8.sizeDelta = slot9
end

slot2.SetHPBarWidth = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.AddUIComponentContainer

	slot2(slot3)
end

slot2.MakeUIComponentContainer = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.GetTf
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.GetFXPool
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.PopCharacterAttachPoint
	slot3 = slot3(slot4)
	slot4 = slot3.transform
	slot5 = SetActive
	slot6 = slot4
	slot7 = true

	slot5(slot6, slot7)

	slot6 = slot4
	slot5 = slot4.SetParent
	slot7 = slot2
	slot8 = false

	slot5(slot6, slot7, slot8)

	slot5 = Vector3
	slot5 = slot5.zero
	slot4.localPosition = slot5
	slot5 = slot2.localEulerAngles
	slot6 = Vector3
	slot7 = slot5.x
	slot7 = slot7 * -1
	slot8 = slot5.y
	slot9 = slot5.z
	slot6 = slot6(slot7, slot8, slot9)
	slot4.localEulerAngles = slot6
	slot7 = slot1
	slot6 = slot1.GetUnitData
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.GetTemplate
	slot6 = slot6(slot7)
	slot6 = slot6.fx_container
	slot7 = {}
	slot8 = ipairs
	slot9 = uv0
	slot9 = slot9.Battle
	slot9 = slot9.BattleConst
	slot9 = slot9.FXContainerIndex
	slot8, slot9, slot10 = slot8(slot9)

	for slot11, slot12 in slot8, slot9, slot10 do
		slot13 = slot6[slot11]
		slot14 = Vector3
		slot15 = slot13[1]
		slot16 = slot13[2]
		slot17 = slot13[3]
		slot14 = slot14(slot15, slot16, slot17)
		slot7[slot11] = slot14
	end

	slot9 = slot1
	slot8 = slot1.AddFXOffsets
	slot10 = slot3
	slot11 = slot7

	slot8(slot9, slot10, slot11)
end

slot2.MakeFXContainer = slot3

function slot3(slot0)
	slot1 = nil

	return slot1
end

slot2.MakeShadow = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.GetUnitData
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.GetTemplate
	slot2 = slot2(slot3)
	slot2 = slot2.smoke
	slot3 = {}
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = slot8[2]
		slot10 = {}
		slot11 = ipairs
		slot12 = slot9
		slot11, slot12, slot13 = slot11(slot12)

		for slot14, slot15 in slot11, slot12, slot13 do
			slot16 = {}
			slot17 = true
			slot16.unInitialize = slot17
			slot17 = slot15[1]
			slot16.resID = slot17
			slot17 = Vector3
			slot18 = slot15[2]
			slot18 = slot18[1]
			slot19 = slot15[2]
			slot19 = slot19[2]
			slot20 = slot15[2]
			slot20 = slot20[3]
			slot17 = slot17(slot18, slot19, slot20)
			slot16.pos = slot17
			slot17 = false
			slot10[slot16] = slot17
		end

		slot11 = {
			active = false
		}
		slot12 = slot8[1]
		slot12 = slot12 / 100
		slot11.rate = slot12
		slot11.smokes = slot10
		slot3[slot7] = slot11
	end

	slot5 = slot1
	slot4 = slot1.AddSmokeFXs
	slot6 = slot3

	slot4(slot5, slot6)
end

slot2.MakeSmokeFX = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.GetUnitData
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.GetSkinAttachmentInfo
	slot2 = slot2(slot3)

	if slot2 then
		slot3 = pairs
		slot4 = slot2
		slot3, slot4, slot5 = slot3(slot4)

		for slot6, slot7 in slot3, slot4, slot5 do
			slot9 = slot1
			slot8 = slot1.AddFX
			slot10 = slot7

			slot8(slot9, slot10)
		end
	end
end

slot2.MakeEquipSkinAttachment = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.AddWaveFX
	slot4 = slot0.MOVE_WAVE_FX_NAME

	slot2(slot3, slot4)
end

slot2.MakeWaveFX = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.AddPopNumPool
	slot5 = slot0
	slot4 = slot0.GetSceneMediator
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.GetPopNumPool

	slot2(slot3, slot4(slot5))
end

slot2.MakePopNumPool = slot3

function slot3(slot0, slot1)
	slot2 = uv0
	slot2 = slot2.Battle
	slot2 = slot2.BattleLockTag
	slot2 = slot2.New
	slot4 = slot0
	slot3 = slot0.GetSceneMediator
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.InstantiateCharacterComponent
	slot5 = slot0.TAG_NAME
	slot3 = slot3(slot4, slot5)
	slot4 = slot1
	slot2 = slot2(slot3, slot4)

	return slot2
end

slot2.MakeTag = slot3

function slot3(slot0)
	slot2 = slot0
	slot1 = slot0.GetSceneMediator
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.InstantiateCharacterComponent
	slot3 = slot0.POPUP_NAME
	slot1 = slot1(slot2, slot3)

	return slot1
end

slot2.MakePopup = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetSceneMediator
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.AddArrowBar
	slot6 = slot2
	slot5 = slot2.InstantiateCharacterComponent
	slot7 = slot0.ARROW_BAR_NAME

	slot3(slot4, slot5(slot6, slot7))

	slot4 = slot1
	slot3 = slot1.UpdateArrowBarPostition

	slot3(slot4)
end

slot2.MakeArrowBar = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetSceneMediator
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.AddCastClock
	slot6 = slot2
	slot5 = slot2.InstantiateCharacterComponent
	slot7 = "CastClockContainer/castClock"

	slot3(slot4, slot5(slot6, slot7))
end

slot2.MakeCastClock = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetSceneMediator
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.AddBarrierClock
	slot6 = slot2
	slot5 = slot2.InstantiateCharacterComponent
	slot7 = "CastClockContainer/shieldClock"

	slot3(slot4, slot5(slot6, slot7))
end

slot2.MakeBarrierClock = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetSceneMediator
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.AddVigilantBar
	slot6 = slot2
	slot5 = slot2.InstantiateCharacterComponent
	slot7 = "AntiSubVigilantContainer/antiSubMeter"

	slot3(slot4, slot5(slot6, slot7))

	slot4 = slot1
	slot3 = slot1.UpdateVigilantBarPosition

	slot3(slot4)
end

slot2.MakeVigilantBar = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetSceneMediator
	slot2 = slot2(slot3)
	slot4 = slot1
	slot3 = slot1.AddCloakBar
	slot6 = slot2
	slot5 = slot2.InstantiateCharacterComponent
	slot7 = "CloakContainer/cloakMeter"

	slot3(slot4, slot5(slot6, slot7))

	slot4 = slot1
	slot3 = slot1.UpdateCloakBarPosition

	slot3(slot4)
end

slot2.MakeCloakBar = slot3

function slot3(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.GetUnitData
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.GetTemplate
	slot3 = slot3(slot4)
	slot3 = slot3.nationality

	if slot3 then
		slot4 = table
		slot4 = slot4.contains
		slot5 = uv0
		slot5 = slot5.SWEET_DEATH_NATIONALITY
		slot6 = slot3
		slot4 = slot4(slot5, slot6)

		if slot4 then
			-- Nothing
		end
	elseif slot2 then
		slot4 = uv1
		slot4 = slot4.Battle
		slot4 = slot4.BattleConst
		slot4 = slot4.UnitDeathReason
		slot4 = slot4.KILLED

		if slot2 ~= slot4 then
			-- Nothing
		end
	else
		slot5 = slot0
		slot4 = slot0.GetFXPool
		slot4 = slot4(slot5)
		slot5 = slot4
		slot4 = slot4.GetFX
		slot6 = slot0.BOMB_FX_NAME
		slot4, slot5 = slot4(slot5, slot6)
		slot6 = pg
		slot6 = slot6.EffectMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.PlayBattleEffect
		slot8 = slot4
		slot10 = slot5
		slot9 = slot5.Add
		slot12 = slot1
		slot11 = slot1.GetPosition
		slot9 = slot9(slot10, slot11(slot12))
		slot10 = true

		slot6(slot7, slot8, slot9, slot10)
	end

	slot5 = slot1
	slot4 = slot1.Dispose

	slot4(slot5)

	slot5 = slot0
	slot4 = slot0.GetFXPool
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.PushCharacterAttachPoint
	slot7 = slot1
	slot6 = slot1.GetAttachPoint

	slot4(slot5, slot6(slot7))
end

slot2.RemoveCharacter = slot3
