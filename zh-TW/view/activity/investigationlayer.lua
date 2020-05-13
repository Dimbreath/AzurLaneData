slot0 = class("InvestigationLayer", import("..base.BaseUI"))
slot0.Caches = {}

function slot0.getUIName(slot0)
	return "InvestigationUI"
end

function slot0.setInvestigation(slot0, slot1, slot2)
	slot0.finished = slot1
	slot0.investigateId = slot2

	setActive(slot0.scroll, not slot0.finished)
	setActive(slot0.fmask, slot0.finished)
end

function slot0.init(slot0)
	slot0.panel = slot0:findTF("panel")
	slot0.close = slot0:findTF("panel/bgs/btnBack")
	slot0.scroll = slot0:findTF("panel/scroll")
	slot0.list = slot0:findTF("list", slot0.scroll)
	slot0.title = slot0:findTF("title", slot0.list)
	slot0.desc = slot0:findTF("desc", slot0.list)
	slot0.item = slot0:findTF("item", slot0.list)
	slot0.tip = slot0:findTF("tip", slot0.list)
	slot0.submit = slot0:findTF("submit", slot0.list)
	slot0.fmask = slot0:findTF("panel/fmask")

	setActive(slot0.item, false)
	setActive(slot0.tip, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.submit, function ()
		if not uv0:saveScroll() then
			uv0.panel.localPosition = Vector3.zero

			LeanTween.cancel(go(uv0.panel))
			LeanTween.moveLocalX(go(uv0.panel), 10, 0.05):setFrom(-20):setLoopPingPong(3)
		else
			uv0:emit(InvestigationMediator.ON_SUBMIT, uv0.investigateId, uv1.Caches[uv0.investigateId])
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.close, function ()
		uv0:saveScroll()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0._tf, function ()
		uv0:saveScroll()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CANCEL)

	if not slot0.finished then
		slot0:loadScroll()
	end
end

function slot0.loadScroll(slot0)
	if not uv0.Caches[slot0.investigateId] then
		uv0.Caches[slot0.investigateId] = {}
	end

	slot2 = pg.questionnaire_template[slot0.investigateId]

	setText(slot0.title, slot2.title)
	setText(slot0.desc, slot2.desc)

	slot3 = slot0.item:GetSiblingIndex()

	for slot7 = #slot2.problem_list, 1, -1 do
		slot8 = slot2.problem_list[slot7]
		slot9 = pg.questionnaire_problems_template[slot8]

		if not slot1[slot8] then
			slot1[slot8] = {}
		end

		slot11 = cloneTplTo(slot0.item, slot0.list, "item_" .. slot7)

		slot11:SetSiblingIndex(slot3 + 1)
		setText(slot11:Find("desc"), slot9.desc)

		if slot9.optional == 1 then
			slot11:GetComponent(typeof(ToggleGroup)).allowSwitchOff = true
		end

		slot12 = slot11:Find("option")

		setActive(slot12, false)

		for slot17 = #slot9.options, 1, -1 do
			slot19 = slot10[slot17]
			slot20 = cloneTplTo(slot12, slot11, "option_" .. slot17)

			slot20:SetSiblingIndex(slot12:GetSiblingIndex() + 1)
			setText(slot20:Find("toggle"):Find("Label"), slot9.options[slot17][2])

			if slot9.multiply == 1 then
				slot21:GetComponent(typeof(Toggle)).group = nil
			end

			triggerToggle(slot21, slot19 ~= nil)
			onToggle(slot0, slot21, function ()
				setActive(uv0.tip, not uv0:saveScroll())
			end, SFX_PANEL)
			setActive(slot20:Find("input"), slot18[1] == 1)

			if slot19 and slot19.content then
				setInputText(slot22, slot19.content)
			end
		end
	end

	setActive(slot0.tip, not slot0:saveScroll())
end

function slot0.saveScroll(slot0)
	slot1 = true
	slot2 = {}

	for slot8 = 0, slot0.list.childCount - 1 do
		if isActive(slot0.list:GetChild(slot8)) and string.find(slot9.name, "item_") then
			slot13 = {}

			for slot18 = 0, slot9.childCount - 1 do
				if isActive(slot9:GetChild(slot18)) and string.find(slot19.name, "option_") then
					slot14 = 0 + 1

					if slot19:Find("toggle"):GetComponent(typeof(Toggle)).isOn then
						if pg.questionnaire_problems_template[pg.questionnaire_template[slot0.investigateId].problem_list[0 + 1]].options[slot14][1] == 1 and getInputText(slot19:Find("input")) and string.len(slot22) > 0 then
							-- Nothing
						end

						slot13[slot14] = {
							id = slot14,
							content = slot22
						}

						if slot11.multiply ~= 1 then
							break
						end
					end
				end
			end

			if slot11.optional ~= 1 and table.getCount(slot13) == 0 then
				slot1 = false
			end

			slot2[slot10] = slot13
		end
	end

	uv0.Caches[slot0.investigateId] = slot2

	return slot1
end

function slot0.willExit(slot0)
	LeanTween.cancel(go(slot0.panel))
end

return slot0
