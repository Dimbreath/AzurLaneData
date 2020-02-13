ys = ys or {}
slot1 = ys.Battle.BattleBuffEvent
slot2 = ys.Battle.BattleUnitEvent
slot3 = ys.Battle.BattleResourceManager
ys.Battle.BattleEffectComponent = class("BattleEffectComponent")
ys.Battle.BattleEffectComponent.__name = "BattleEffectComponent"

function ys.Battle.BattleEffectComponent.Ctor(slot0, slot1)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._owner = slot1
	slot0._blinkIDList = {}
	slot0._buffLastEffects = {}
	slot0._effectIndex = 0
	slot0._effectList = {}
end

function ys.Battle.BattleEffectComponent.Dispose(slot0)
	for slot4, slot5 in pairs(slot0._blinkIDList) do
		slot0._owner:RemoveBlink(slot5)
	end

	slot0.EventListener.DetachEventListener(slot0)
end

function ys.Battle.BattleEffectComponent.GetFXPool(slot0)
	return slot0.Battle.BattleFXPool.GetInstance()
end

function ys.Battle.BattleEffectComponent.SetUnitDataEvent(slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.BUFF_ATTACH, slot0.onBuffAdd)
	slot1:RegisterEventListener(slot0, slot0.BUFF_STACK, slot0.onBuffStack)
	slot1:RegisterEventListener(slot0, slot0.BUFF_REMOVE, slot0.onBuffRemove)
	slot1:RegisterEventListener(slot0, slot1.ADD_EFFECT, slot0.onAddEffect)
	slot1:RegisterEventListener(slot0, slot1.CANCEL_EFFECT, slot0.onCancelEffect)
	slot1:RegisterEventListener(slot0, slot1.DEACTIVE_EFFECT, slot0.onDeactiveEffect)
end

function ys.Battle.BattleEffectComponent.RemoveUnitEvent(slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.BUFF_ATTACH)
	slot1:UnregisterEventListener(slot0, slot0.BUFF_STACK)
	slot1:UnregisterEventListener(slot0, slot0.BUFF_REMOVE)
	slot1:UnregisterEventListener(slot0, slot1.ADD_EFFECT)
	slot1:UnregisterEventListener(slot0, slot1.CANCEL_EFFECT)
	slot1:UnregisterEventListener(slot0, slot1.DEACTIVE_EFFECT)
end

function ys.Battle.BattleEffectComponent.Update(slot0, slot1)
	slot0._dir = slot0._owner:GetUnitData():GetDirection()

	for slot5, slot6 in pairs(slot0._effectList) do
		slot6.currentTime = slot1 - slot6.startTime

		slot0:_UpdateEffect(slot6)
	end
end

function ys.Battle.BattleEffectComponent.onAddEffect(slot0, slot1)
	slot0:DoAddEffect(slot1)
end

function ys.Battle.BattleEffectComponent.DoAddEffect(slot0, slot1)
	slot0:_AddEffect(slot1.Data)
end

function ys.Battle.BattleEffectComponent.onCancelEffect(slot0, slot1)
	slot0:_CancelEffect(slot1.Data)
end

function ys.Battle.BattleEffectComponent.onDeactiveEffect(slot0, slot1)
	slot0:_DeactiveEffect(slot1.Data)
end

function ys.Battle.BattleEffectComponent.onBuffAdd(slot0, slot1)
	slot0:DoWhenAddBuff(slot1)
end

function ys.Battle.BattleEffectComponent.DoWhenAddBuff(slot0, slot1)
	if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot2).init_effect and slot3.init_effect ~= "" then
		slot0._owner:AddFX(slot3.init_effect)
	end

	if slot3.last_effect ~= nil and slot3.last_effect ~= "" then
		slot4 = slot0._owner:AddFX(slot3.last_effect)
		slot0._buffLastEffects[slot2] = slot4

		slot4:SetActive(true)
	end

	if slot3.blink then
		slot0._blinkIDList[slot2] = slot0._owner:AddBlink(slot3.blink[1], slot3.blink[2], slot3.blink[3], slot3.blink[4], slot3.blink[5])
	end
end

function ys.Battle.BattleEffectComponent.onBuffStack(slot0, slot1)
	slot0:DoWhenStackBuff(slot1)
end

function ys.Battle.BattleEffectComponent.DoWhenStackBuff(slot0, slot1)
	if slot0.Battle.BattleDataFunction.GetBuffTemplate(slot2).init_effect ~= nil and slot3.init_effect ~= "" then
		slot0._owner:AddFX(slot3.init_effect)
	end
end

function ys.Battle.BattleEffectComponent.onBuffRemove(slot0, slot1)
	if slot0._buffLastEffects[slot1.Data.buff_id] ~= nil then
		slot0._buffLastEffects[slot2] = nil

		slot0._owner:RemoveFX(slot3)
	end

	if slot0._blinkIDList[slot2] then
		slot0._owner:RemoveBlink(slot4)

		slot0._blinkIDList[slot2] = nil
	end
end

function ys.Battle.BattleEffectComponent._AddEffect(slot0, slot1)
	if slot0._effectList[slot1.index or slot0:_GetIndex()] then
		slot3.effect_go:SetActive(true)

		slot3.effect_tf.localScale = slot3.effect_tf.localScale
	else
		slot4 = slot0._owner:AddFX(slot1.effect)
		slot0._effectList[slot2] = {
			currentTime = 0,
			effect_go = slot4,
			effect_tf = slot4.transform,
			posFun = slot1.posFun,
			rotationFun = slot1.rotationFun,
			startTime = pg.TimeMgr.GetInstance():GetCombatTime(),
			effectFun = slot1.effectFun
		}

		slot0:_UpdateEffect(slot3)
		pg.EffectMgr.GetInstance():PlayBattleEffect(slot4, slot4.transform.localPosition, false, function (slot0)
			slot0._owner:RemoveFX(slot0._owner.RemoveFX)

			if slot0._effectList[slot0._owner] and slot0._effectList[slot2].effectFun then
				slot0._effectList[slot2].effectFun()
			end

			slot0._effectList[slot2] = nil
		end)
	end
end

function ys.Battle.BattleEffectComponent._CancelEffect(slot0, slot1)
	if slot0._effectList[slot1.index] then
		slot0._owner:RemoveFX(slot3.effect_go)

		slot0._effectList[slot2] = nil
	end
end

function ys.Battle.BattleEffectComponent._DeactiveEffect(slot0, slot1)
	if slot0._effectList[slot1.index] then
		slot3.effect_go:SetActive(false)
	end
end

function ys.Battle.BattleEffectComponent._GetIndex(slot0)
	slot0._effectIndex = slot0._effectIndex + 1

	return slot0._effectIndex + 1
end

function ys.Battle.BattleEffectComponent._UpdateEffect(slot0, slot1)
	if slot1.posFun then
		slot1.effect_tf.localPosition = slot1.posFun(slot1.currentTime)
	end

	if slot1.rotationFun then
		slot2 = slot1.rotationFun(slot1.currentTime)

		if slot0._dir == slot0.Battle.BattleConst.UnitDir.LEFT then
			slot2.y = slot2.y - 180
		end

		slot1.effect_tf.localEulerAngles = slot2
	end
end

return
