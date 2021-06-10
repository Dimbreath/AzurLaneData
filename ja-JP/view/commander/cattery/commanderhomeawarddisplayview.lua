slot0 = class("CommanderHomeAwardDisplayView")

function slot0.Ctor(slot0, slot1, slot2)
	slot0._tf = slot1
	slot0.cards = slot2
	slot0.expAddition = findTF(slot0._tf, "bg/frame/title/exp_addition")
	slot0.expAdditionTxt = slot0.expAddition:Find("Text"):GetComponent(typeof(Text))
	slot0.award = findTF(slot0._tf, "bg/frame/title/award")
	slot0.awardIcon = findTF(slot0._tf, "bg/frame/title/award/icon")
	slot0.animPlans = {}
end

function slot0.AddPlan(slot0, slot1)
	table.insert(slot0.animPlans, slot1)

	if #slot0.animPlans == 1 then
		slot0:Display()
	end
end

function slot0.Display(slot0)
	if #slot0.animPlans == 0 then
		return
	end

	slot0:StartAnim(slot0.animPlans[1], function ()
		table.remove(uv0.animPlans, 1)
		uv0:Display()
	end)
end

function slot0.StartAnim(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6 = slot0:ParseData(slot1)

	parallelAsync({
		function (slot0)
			uv0:DoCommanderAnim(uv1, slot0)
		end,
		function (slot0)
			seriesAsync({
				function (slot0)
					uv0:DoHomeExpAnim(uv1, slot0)
				end,
				function (slot0)
					uv0:DoItemAnim(uv1, slot0)
				end,
				function (slot0)
					uv0:DoResAnim(uv1, slot0)
				end
			}, slot0)
		end
	}, slot2)
end

function slot0.DoCommanderAnim(slot0, slot1, slot2)
	if slot1 <= 0 then
		slot2()

		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot0.cards) do
		table.insert(slot3, function (slot0)
			if uv0.cattery:ExistCommander() then
				uv0:AddExpAnim(uv1, slot0)
			else
				slot0()
			end
		end)
	end

	parallelAsync(slot3, slot2)
end

function slot0.DoHomeExpAnim(slot0, slot1, slot2)
	if slot1 <= 0 then
		slot2()

		return
	end

	slot0.expAdditionTxt.text = slot1

	slot0:RiseAnim(slot0.expAddition, 40, slot2)
end

function slot0.DoItemAnim(slot0, slot1, slot2)
	if not slot1 then
		slot2()

		return
	end

	GetImageSpriteFromAtlasAsync("Props/20010", "", slot0.awardIcon)
	slot0:RiseAnim(slot0.award, 40, slot2)
end

function slot0.DoResAnim(slot0, slot1, slot2)
	if not slot1 then
		slot2()

		return
	end

	GetImageSpriteFromAtlasAsync("Props/dormMoney", "", slot0.awardIcon)
	slot0:RiseAnim(slot0.award, 40, slot2)
end

function slot0.RiseAnim(slot0, slot1, slot2, slot3)
	setActive(slot1, true)

	slot4 = slot1.anchoredPosition.y

	LeanTween.value(go(slot1), slot4, slot4 + slot2, 0.3):setOnUpdate(System.Action_float(function (slot0)
		setAnchoredPosition(uv0, {
			y = slot0
		})
	end)):setOnComplete(System.Action(function ()
		setAnchoredPosition(uv0, {
			y = uv1
		})
		setActive(uv0, false)
		uv2()
	end)):setDelay(1)
end

function slot0.ParseData(slot0, slot1)
	slot2 = false
	slot3 = false

	for slot7, slot8 in ipairs(slot1.awards) do
		if slot8.id == Item.COMMANDER_QUICKLY_TOOL_ID then
			slot2 = true
		end

		if slot8.id == PlayerConst.ResDormMoney then
			slot3 = true
		end
	end

	return slot1.commanderExp, slot1.homeExp, slot2, slot3
end

function slot0.Dispose(slot0)
	if LeanTween.isTweening(go(slot0.award)) then
		LeanTween.cancel(go(slot0.award))
	end

	if LeanTween.isTweening(go(slot0.expAddition)) then
		LeanTween.cancel(go(slot0.expAddition))
	end

	slot0.animPlans = {}
end

return slot0
