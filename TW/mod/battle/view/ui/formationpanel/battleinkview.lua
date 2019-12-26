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
	slot0._initial = slot0._tf:Find("initial_anim")
	slot0._finale = slot0._tf:Find("finale_anim")
	slot0._finaleHollow = slot0._finale:Find("ink_tpl")
	slot0._unitList = {}
	slot0._unitHollowList = {}
	slot0._state = slot0.ANIMATION_STATE_IDLE
end

function slot2.Update(slot0)
	for slot4, slot5 in pairs(slot0._unitHollowList) do
		slot5.hollow.position = slot0.CameraPosToUICamera(slot5.pos.Copy(slot6, slot4:GetPosition()) + Vector3(0, 0, 0))
	end
end

function slot2.SetActive(slot0, slot1, slot2)
	function slot3()
		for slot3, slot4 in pairs(slot0._unitList) do
			slot0:RemoveHollow(slot3)
		end

		setActive(slot0._finale, false)
		setActive(slot0._go, false)
	end

	if slot1 then
		if slot0._state == slot0.ANIMATION_STATE_FINALE then
			slot0._finale:GetComponent("DftAniEvent").enabled = false

			slot3()
		end

		slot0._state = slot0.ANIMATION_STATE_INITIAL

		for slot7, slot8 in ipairs(slot2) do
			slot0:AddHollow(slot8)
		end

		slot0._initial:GetComponent("DftAniEvent").SetEndEvent(slot4, function (slot0)
			setActive(slot0._initial, false)

			slot0._state = slot1.ANIMATION_STATE_IDLE
		end)
		setActive(slot0._go, true)
		setActive(slot0._initial, true)
	else
		slot0._state = slot0.ANIMATION_STATE_FINALE

		slot0._finale:GetComponent("DftAniEvent").SetEndEvent(slot4, function (slot0)
			slot0()

			slot0._state = slot2.ANIMATION_STATE_IDLE
		end)

		for slot8, slot9 in pairs(slot0._unitList) do
			if not slot8:IsMainFleetUnit() then
				slot0._finaleHollow.position = slot0._unitHollowList[slot8].hollow.position

				break
			end
		end

		setActive(slot0._finale, true)
	end
end

function slot2.AddHollow(slot0, slot1)
	slot2 = slot1:GetAttrByName("blindedHorizon")

	if slot0._unitList[slot1] == true then
		slot0._unitHollowList[slot1].hollow.localScale = Vector3(slot2, slot2, 0)

		return
	end

	slot0._unitList[slot1] = true
	cloneTplTo(slot0._hollowTpl, slot0._hollowContainer).localScale = Vector3(slot2, slot2, 0)

	Vector3.zero:Copy(slot1:GetPosition())

	slot0._unitHollowList[slot1] = {
		hollow = cloneTplTo(slot0._hollowTpl, slot0._hollowContainer),
		pos = Vector3.zero
	}
end

function slot2.RemoveHollow(slot0, slot1)
	slot0._unitList[slot1] = nil

	Destroy(slot0._unitHollowList[slot1].hollow.gameObject)

	slot0._unitHollowList[slot1] = nil
end

function slot2.Dispose(slot0)
	slot0:SetActive(false)

	for slot4, slot5 in pairs(slot0._unitHollowList) do
		Destroy(slot5.hollow.gameObject)
	end

	slot0._go = nil
	slot0._tf = nil
	slot0._unitList = nil
	slot0._unitHollowList = nil
end

return
