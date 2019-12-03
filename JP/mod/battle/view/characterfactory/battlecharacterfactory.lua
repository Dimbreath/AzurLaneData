ys = ys or {}
slot1 = singletonClass("BattleCharacterFactory")
ys.Battle.BattleCharacterFactory = slot1
slot1.__name = "BattleCharacterFactory"
slot1.HP_BAR_NAME = ""
slot1.POPUP_NAME = "popup"
slot1.TAG_NAME = "ChargeAreaContainer/LockTag"
slot1.MOVE_WAVE_FX_POS = Vector3(0, -2.3, -1.5)
slot1.MOVE_WAVE_FX_NAME = "movewave"
slot1.SMOKE_FX_NAME = "smoke"
slot1.BOMB_FX_NAME = "Bomb"

function slot1.Ctor(slot0)
	return
end

function slot1.CreateCharacter(slot0, slot1)
	slot3 = slot0:MakeCharacter()

	slot3:SetFactory(slot0)
	slot3:SetUnitData(slot2)
	slot0:MakeModel(slot3)

	return slot3
end

function slot1.GetSceneMediator(slot0)
	return slot0.Battle.BattleState.GetInstance():GetMediatorByName(slot0.Battle.BattleSceneMediator.__name)
end

function slot1.GetFXPool(slot0)
	return slot0.Battle.BattleFXPool.GetInstance()
end

function slot1.GetCharacterPool(slot0)
	return slot0.Battle.BattleResourceManager.GetInstance()
end

function slot1.GetHPBarPool(slot0)
	return slot0.Battle.BattleHPBarManager.GetInstance()
end

function slot1.GetDivingFilterColor(slot0)
	slot2 = slot0.Battle.BattleDataFunction.GetDivingFilter(slot1)

	return Color.New(slot2.r, slot2.g, slot2.b, slot2.a)
end

function slot1.GetFXContainerPool(slot0)
	return slot0.Battle.BattleCharacterFXContainersPool.GetInstance()
end

function slot1.MakeCharacter(slot0)
	return nil
end

function slot1.MakeModel(slot0, slot1)
	return nil
end

function slot1.MakeBloodBar(slot0, slot1)
	return nil
end

function slot1.SetHPBarWidth(slot0, slot1, slot2, slot3)
	slot2.transform.sizeDelta = Vector2(slot5, slot7)
	slot8.sizeDelta = Vector2(slot1:GetUnitData().GetTemplate(slot4).hp_bar[1] + slot3 or 0, slot2.transform.Find(slot6, "blood").transform.rect.height)
end

function slot1.MakeUIComponentContainer(slot0, slot1)
	slot1:AddUIComponentContainer()
end

function slot1.MakeFXContainer(slot0, slot1)
	SetActive(slot4, true)
	slot0:GetFXPool():PopCharacterAttachPoint().transform.SetParent(slot4, slot2, false)

	slot0.GetFXPool().PopCharacterAttachPoint().transform.localPosition = Vector3.zero
	slot0.GetFXPool().PopCharacterAttachPoint().transform.localEulerAngles = Vector3(slot1:GetTf().localEulerAngles.x * -1, slot1.GetTf().localEulerAngles.y, slot1.GetTf().localEulerAngles.z)
	slot6 = slot1:GetUnitData():GetTemplate().fx_container
	slot7 = {}

	for slot11, slot12 in ipairs(slot0.Battle.BattleConst.FXContainerIndex) do
		slot7[slot11] = Vector3(slot6[slot11][1], slot6[slot11][2], slot6[slot11][3])
	end

	slot1:AddFXOffsets(slot3, slot7)
end

function slot1.MakeShadow(slot0)
	return nil
end

function slot1.MakeSmokeFX(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		slot10 = {}

		for slot14, slot15 in ipairs(slot9) do
			slot16 = {
				unInitialize = true,
				resID = slot15[1],
				pos = Vector3(slot15[2][1], slot15[2][2], slot15[2][3]),
				[slot16] = false
			}
		end

		slot3[slot7] = {
			active = false,
			rate = slot8[1] / 100,
			smokes = slot10
		}
	end

	slot1:AddSmokeFXs(slot3)
end

function slot1.MakeEquipSkinAttachment(slot0, slot1)
	if slot1:GetUnitData():GetSkinAttachmentInfo() then
		for slot6, slot7 in pairs(slot2) do
			slot1:AddFX(slot7)
		end
	end
end

function slot1.MakeWaveFX(slot0, slot1)
	slot1:AddWaveFX(slot0.MOVE_WAVE_FX_NAME)
end

function slot1.MakePopNumPool(slot0, slot1)
	slot1:AddPopNumPool(slot0:GetSceneMediator():GetPopNumPool())
end

function slot1.MakeTag(slot0, slot1)
	return slot0.Battle.BattleLockTag.New(slot0:GetSceneMediator():InstantiateCharacterComponent(slot0.TAG_NAME), slot1)
end

function slot1.MakePopup(slot0)
	return slot0:GetSceneMediator():InstantiateCharacterComponent(slot0.POPUP_NAME)
end

function slot1.MakeArrowBar(slot0, slot1)
	slot1:AddArrowBar(slot0:GetSceneMediator():InstantiateCharacterComponent(slot0.ARROW_BAR_NAME))
	slot1:UpdateArrowBarPostition()
end

function slot1.MakeCastClock(slot0, slot1)
	slot1:AddCastClock(slot0:GetSceneMediator():InstantiateCharacterComponent("CastClockContainer/castClock"))
end

function slot1.MakeVigilantBar(slot0, slot1)
	slot1:AddVigilantBar(slot0:GetSceneMediator():InstantiateCharacterComponent("AntiSubVigilantContainer/antiSubMeter"))
	slot1:UpdateVigilantBarPosition()
end

function slot1.RemoveCharacter(slot0, slot1, slot2)
	if slot2 and slot2 ~= slot0.Battle.BattleConst.UnitDeathReason.KILLED then
	else
		slot7, slot9 = slot0:GetFXPool():GetFX(slot0.BOMB_FX_NAME)

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot3, slot4:Add(slot1:GetPosition()), true)
	end

	slot1:Dispose()
	slot0:GetFXPool():PushCharacterAttachPoint(slot1:GetAttachPoint())
end

return
