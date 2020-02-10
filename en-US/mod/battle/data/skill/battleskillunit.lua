ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConfig
slot2 = slot0.Battle.BattleVariable
slot0.Battle.BattleSkillUnit = class("BattleSkillUnit")
slot0.Battle.BattleSkillUnit.__name = "BattleSkillUnit"
slot3 = slot0.Battle.BattleSkillUnit

function slot3.Ctor(slot0, slot1, slot2)
	uv0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._id = slot1
	slot0._level = slot2
	slot0._tempData = uv0.Battle.BattleDataFunction.GetSkillTemplate(slot1, slot2)
	slot0._cd = slot0._tempData.cd
	slot0._effectList = {}
	slot0._lastEffectTarget = {}

	for slot6, slot7 in ipairs(slot0._tempData.effect_list) do
		slot0._effectList[slot6] = uv0.Battle[slot7.type].New(slot7, slot2)
	end

	slot0._dataProxy = uv0.Battle.BattleDataProxy.GetInstance()
end

function slot3.GenerateSpell(slot0, slot1, slot2, slot3)
	slot4 = uv0.Battle.BattleSkillUnit.New(slot0, slot1)
	slot4._attachData = slot3

	return slot4
end

function slot3.GetSkillEffectList(slot0)
	return slot0._effectList
end

function slot3.Cast(slot0, slot1, slot2)
	if slot0._tempData.focus_duration then
		uv0.Battle.BattleState.GetInstance():GetUIMediator():ShowSkillPainting(slot1, slot0._tempData)
	end

	if slot0._tempData.painting == 1 then
		if slot2 then
			slot4:ShowSkillFloat(slot1, slot2:getSkills()[1]:getConfig("name"), slot2:getPainting())
		else
			slot4:ShowSkillFloat(slot1, slot0._tempData.name)
		end
	elseif type(slot0._tempData.painting) == "string" then
		slot4:ShowSkillFloatCover(slot1, slot0._tempData.name, slot0._tempData.painting)
	end

	if type(slot0._tempData.castCV) == "string" then
		slot1:DispatchVoice(slot0._tempData.castCV)
	elseif slot5 == "table" then
		playSoundEffect(Ship.getCVPath(slot0._tempData.castCV.skinID, slot0._tempData.castCV.key))
	end

	for slot10, slot11 in ipairs(slot0._effectList) do
		slot12 = slot11:GetTarget(slot1, slot0)
		slot0._lastEffectTarget = slot12

		slot11:SetCommander(slot2)
		slot11:Effect(slot1, slot12, slot0._attachData)
	end

	if slot0._tempData.aniEffect and slot7 ~= "" then
		slot8.effect = slot7.effect
		slot8.time = slot7.time
		slot8.offset = slot7.offset
		slot8.posFun = slot7.posFun

		slot1:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.ADD_EFFECT, {}))
	end

	slot8.skillID = slot0._id
	slot8.caster = slot1

	slot0._dataProxy:DispatchEvent(uv0.Event.New(uv0.Battle.BattleEvent.CAST_SKILL, {}))
end

function slot3.SetTarget(slot0, slot1)
	slot0._lastEffectTarget = slot1
end

function slot3.Clear(slot0)
	for slot4, slot5 in ipairs(slot0._effectList) do
		slot5:Clear()
	end
end

function slot3.Dispose(slot0)
	uv0.EventDispatcher.DetachEventDispatcher(slot0)
end
