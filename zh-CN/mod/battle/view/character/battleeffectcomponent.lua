ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleBuffEvent
slot2 = slot0.Battle.BattleUnitEvent
slot3 = slot0.Battle.BattleResourceManager
slot0.Battle.BattleEffectComponent = class("BattleEffectComponent")
slot4 = slot0.Battle.BattleEffectComponent
slot4.__name = "BattleEffectComponent"

function slot4.Ctor(slot0, slot1)
	uv0.EventListener.AttachEventListener(slot0)

	slot0._owner = slot1
	slot0._blinkIDList = {}
	slot0._buffLastEffects = {}
	slot0._effectIndex = 0
	slot0._effectList = {}
end

function slot4.Dispose(slot0)
	for slot4, slot5 in pairs(slot0._blinkIDList) do
		slot0._owner:RemoveBlink(slot5)
	end

	uv0.EventListener.DetachEventListener(slot0)
end

function slot4.GetFXPool(slot0)
	return uv0.Battle.BattleFXPool.GetInstance()
end

function slot4.SetUnitDataEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, uv0.BUFF_ATTACH, slot0.onBuffAdd)
	slot1:RegisterEventListener(slot0, uv0.BUFF_STACK, slot0.onBuffStack)
	slot1:RegisterEventListener(slot0, uv0.BUFF_REMOVE, slot0.onBuffRemove)
	slot1:RegisterEventListener(slot0, uv1.ADD_EFFECT, slot0.onAddEffect)
	slot1:RegisterEventListener(slot0, uv1.CANCEL_EFFECT, slot0.onCancelEffect)
	slot1:RegisterEventListener(slot0, uv1.DEACTIVE_EFFECT, slot0.onDeactiveEffect)
end

function slot4.RemoveUnitEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, uv0.BUFF_ATTACH)
	slot1:UnregisterEventListener(slot0, uv0.BUFF_STACK)
	slot1:UnregisterEventListener(slot0, uv0.BUFF_REMOVE)
	slot1:UnregisterEventListener(slot0, uv1.ADD_EFFECT)
	slot1:UnregisterEventListener(slot0, uv1.CANCEL_EFFECT)
	slot1:UnregisterEventListener(slot0, uv1.DEACTIVE_EFFECT)
end

function slot4.Update(slot0, slot1)
	slot0._dir = slot0._owner:GetUnitData():GetDirection()

	for slot5, slot6 in pairs(slot0._effectList) do
		slot6.currentTime = slot1 - slot6.startTime

		slot0:_UpdateEffect(slot6)
	end
end

function slot4.onAddEffect(slot0, slot1)
	slot0:DoAddEffect(slot1)
end

function slot4.DoAddEffect(slot0, slot1)
	slot0:_AddEffect(slot1.Data)
end

function slot4.onCancelEffect(slot0, slot1)
	slot0:_CancelEffect(slot1.Data)
end

function slot4.onDeactiveEffect(slot0, slot1)
	slot0:_DeactiveEffect(slot1.Data)
end

function slot4.onBuffAdd(slot0, slot1)
	slot0:DoWhenAddBuff(slot1)
end

function slot4.DoWhenAddBuff(slot0, slot1)
	if uv0.Battle.BattleDataFunction.GetBuffTemplate(slot1.Data.buff_id).init_effect and slot3.init_effect ~= "" then
		slot0._owner:AddFX(slot3.init_effect)
	end

	if slot3.last_effect ~= nil and slot3.last_effect ~= "" then
		slot4 = slot0._owner:AddFX(slot3.last_effect)
		slot0._buffLastEffects[slot2] = slot4

		slot4:SetActive(true)
	end

	if slot3.blink then
		slot4 = slot3.blink
		slot0._blinkIDList[slot2] = slot0._owner:AddBlink(slot4[1], slot4[2], slot4[3], slot4[4], slot4[5])
	end
end

function slot4.onBuffStack(slot0, slot1)
	slot0:DoWhenStackBuff(slot1)
end

function slot4.DoWhenStackBuff(slot0, slot1)
	if uv0.Battle.BattleDataFunction.GetBuffTemplate(slot1.Data.buff_id).init_effect ~= nil and slot3.init_effect ~= "" then
		slot0._owner:AddFX(slot3.init_effect)
	end
end

function slot4.onBuffRemove(slot0, slot1)
	if slot0._buffLastEffects[slot1.Data.buff_id] ~= nil then
		slot0._buffLastEffects[slot2] = nil

		slot0._owner:RemoveFX(slot3)
	end

	if slot0._blinkIDList[slot2] then
		slot0._owner:RemoveBlink(slot4)

		slot0._blinkIDList[slot2] = nil
	end
end

function slot4._AddEffect(slot0, slot1)
	if slot0._effectList[slot1.index or slot0:_GetIndex()] then
		slot3.effect_go:SetActive(true)

		slot3.effect_tf.localScale = slot3.effect_tf.localScale
	else
		slot4 = slot0._owner:AddFX(slot1.effect)
		slot3 = {
			currentTime = 0,
			effect_go = slot4,
			effect_tf = slot4.transform,
			posFun = slot1.posFun,
			rotationFun = slot1.rotationFun,
			startTime = pg.TimeMgr.GetInstance():GetCombatTime(),
			effectFun = slot1.effectFun
		}
		slot0._effectList[slot2] = slot3

		slot0:_UpdateEffect(slot3)
		pg.EffectMgr.GetInstance():PlayBattleEffect(slot4, slot4.transform.localPosition, false, function (slot0)
			uv0._owner:RemoveFX(uv1)

			if uv0._effectList[uv2] and uv0._effectList[uv2].effectFun then
				uv0._effectList[uv2].effectFun()
			end

			uv0._effectList[uv2] = nil
		end)
	end
end

function slot4._CancelEffect(slot0, slot1)
	if slot0._effectList[slot1.index] then
		slot0._owner:RemoveFX(slot3.effect_go)

		slot0._effectList[slot2] = nil
	end
end

function slot4._DeactiveEffect(slot0, slot1)
	if slot0._effectList[slot1.index] then
		slot3.effect_go:SetActive(false)
	end
end

function slot4._GetIndex(slot0)
	slot1 = slot0._effectIndex + 1
	slot0._effectIndex = slot1

	return slot1
end

function slot4._UpdateEffect(slot0, slot1)
	if slot1.posFun then
		slot1.effect_tf.localPosition = slot1.posFun(slot1.currentTime)
	end

	if slot1.rotationFun then
		slot2 = slot1.rotationFun(slot1.currentTime)

		if slot0._dir == uv0.Battle.BattleConst.UnitDir.LEFT then
			slot2.y = slot2.y - 180
		end

		slot1.effect_tf.localEulerAngles = slot2
	end
end
