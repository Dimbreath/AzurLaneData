ys = ys or {}
slot1 = ys.Battle.BattleVariable
slot2 = class("BattleInkView")
ys.Battle.BattleInkView = slot2
slot2.__name = "BattleInkView"
slot2.ANIMATION_STATE_INITIAL = "intial"
slot2.ANIMATION_STATE_IDLE = "idle"
slot2.ANIMATION_STATE_FINALE = "int"

function slot2.Ctor(slot0, slot1)
	slot0._go = slot1

	slot0:init()
end

function slot2.init(slot0)
	slot0._tf = slot0._go.transform
	slot0._hollowTpl = slot0._tf:Find("ink_tpl")
	slot0._hollowContainer = slot0._tf:Find("container")
	slot0._unitHollowList = {}
	slot0._state = slot0.ANIMATION_STATE_IDLE
end

function slot2.IsActive(slot0)
	return slot0._isActive
end

function slot2.Update(slot0)
	for slot4, slot5 in pairs(slot0._unitHollowList) do
		if slot4:IsAlive() then
			slot5.hollow.position = slot0.CameraPosToUICamera(slot5.pos.Copy(slot6, slot4:GetPosition()) + Vector3(0, 0, 0))
		else
			slot0:RemoveHollow(slot4)
		end
	end
end

function slot2.SetActive(slot0, slot1, slot2)
	slot0._isActive = slot1

	if slot1 then
		slot0._state = slot0.ANIMATION_STATE_INITIAL

		for slot6, slot7 in ipairs(slot2) do
			slot0:AddHollow(slot7)
		end

		setActive(slot0._go, true)
	else
		slot3 = true

		for slot7, slot8 in pairs(slot0._unitHollowList) do
			slot0.doHollowScaleAnima(slot8.hollow, 125, 0.3, (slot3 and function ()
				slot0:RemoveHollow(slot0)
				setActive(slot0._go, false)

				setActive._state = slot2.ANIMATION_STATE_IDLE
			end) or nil)

			slot3 = false
		end
	end
end

function slot2.AddHollow(slot0, slot1)
	slot2 = slot1:GetAttrByName("blindedHorizon")

	if slot0._unitHollowList[slot1] then
		if slot3.range ~= slot2 then
			slot0.doHollowScaleAnima(slot3.hollow, slot2)
		end

		slot3.range = slot2

		return
	elseif slot2 == 0 then
		return
	end

	slot4 = cloneTplTo(slot0._hollowTpl, slot0._hollowContainer)
	slot4.localScale = Vector3(125, 125, 0)

	slot0.doHollowScaleAnima(slot4, slot2)
	Vector3.zero:Copy(slot1:GetPosition())

	slot0._unitHollowList[slot1] = {
		range = slot2,
		hollow = slot4,
		pos = Vector3.zero
	}
end

function slot2.RemoveHollow(slot0, slot1, slot2)
	LeanTween.cancel(slot4)
	Destroy(slot4)

	slot0._unitHollowList[slot1] = nil
end

function slot2.UpdateHollow(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0:AddHollow(slot6)
	end
end

function slot2.doHollowScaleAnima(slot0, slot1, slot2, slot3)
	LeanTween.cancel(go(slot0))

	slot5 = LeanTween.scale(slot0, Vector3(slot1, slot1, 0), slot2 or 0.5)

	if slot3 then
		slot5:setOnComplete(System.Action(function ()
			slot0()
		end))
	end
end

function slot2.Dispose(slot0)
	slot0:SetActive(false)

	for slot4, slot5 in pairs(slot0._unitHollowList) do
		LeanTween.cancel(slot6)
		Destroy(slot5.hollow.gameObject)
	end

	slot0._go = nil
	slot0._tf = nil
	slot0._unitHollowList = nil
end

return
