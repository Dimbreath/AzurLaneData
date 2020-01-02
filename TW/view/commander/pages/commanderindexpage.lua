slot0 = class("CommanderIndexPage", import("...base.BaseSubView"))
slot1 = {
	sort = {
		{
			i18n("word_default"),
			"id"
		},
		{
			i18n("word_level"),
			"Level"
		},
		{
			i18n("word_rarity"),
			"Rarity"
		}
	},
	nation = {
		Nation.US,
		Nation.EN,
		Nation.JP,
		Nation.DE,
		Nation.CN,
		Nation.SN,
		Nation.FF,
		Nation.MNF
	},
	rarity = {
		{
			i18n("word_ssr"),
			5
		},
		{
			i18n("word_sr"),
			4
		},
		{
			i18n("word_r"),
			3
		}
	}
}

function slot0.getUIName(slot0)
	return "CommanderIndexUI"
end

function slot0.OnInit(slot0)
	slot0.inited = false

	slot0:resetData()

	slot0.sortPanel = slot0:findTF("frame/frame/frame/sort_panel")
	slot0.tpl = slot0:findTF("tpl", slot0.sortPanel)
	slot0.nationPanel = slot0:findTF("frame/frame/frame/nation_panel")
	slot0.nationAllBtn = slot0:findTF("all_btn", slot0.nationPanel)
	slot0.rarityPanel = slot0:findTF("frame/frame/frame/rarity_panel")
	slot0.rarityAllBtn = slot0:findTF("content/all", slot0.rarityPanel)
	slot0.cancelBtn = slot0:findTF("frame/frame/cancel_btn")
	slot0.confirmBtn = slot0:findTF("frame/frame/confirm_btn")
	slot0.closeBtn = slot0:findTF("frame/close_btn")

	onButton(slot0, slot0.cancelBtn, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0.closeBtn, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0.confirmBtn, function ()
		if slot0.confirm then
			slot0.confirm()
		end

		slot0:Hide()
	end, SFX_PANEL)
	slot0:initToggle()
end

function slot0.initToggle(slot0)
	slot0:initSort()
	slot0:initNation()
	slot0:initRarity()
end

function slot0.initSort(slot0)
	slot0.sortToggles = {}

	for slot4, slot5 in ipairs(slot0.sort) do
		slot6 = cloneTplTo(slot0.tpl, slot0.sortPanel:Find("content"))

		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				slot0.data.sortData = slot1[2]
			end
		end, SFX_PANEL)
		setText(slot6:Find("Text"), slot5[1])

		slot0.sortToggles[slot5[2]] = slot6
	end
end

function slot0.initNation(slot0)
	slot0.nationToggles = {}

	onToggle(slot0, slot0.nationAllBtn, function (slot0)
		if slot0 then
			for slot4, slot5 in pairs(slot0.nationToggles) do
				triggerToggle(slot5, false)
			end

			slot0.data.nationData = {}
		end

		setToggleEnabled(slot0.nationAllBtn, not slot0)
	end, SFX_PANEL)

	for slot4, slot5 in pairs(slot0.nation) do
		slot6 = cloneTplTo(slot0.nationAllBtn, slot0.nationPanel:Find("content"))

		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				if #slot0.data.nationData == 0 then
					triggerToggle(slot0.nationAllBtn, false)
				end

				table.insert(slot0.data.nationData, table.insert)

				if #slot0.data.nationData == #slot0.data.nationData.nation then
					triggerToggle(slot0.nationAllBtn, true)
				end
			elseif #slot0.data.nationData > 0 and table.indexof(slot0.data.nationData, table.indexof) then
				table.remove(slot0.data.nationData, slot1)

				if #slot0.data.nationData == 0 then
					triggerToggle(slot0.nationAllBtn, true)
				end
			end
		end, SFX_PANEL)
		setText(slot6:Find("Text"), Nation.Nation2Name(slot5))

		slot0.nationToggles[slot5] = slot6
	end
end

function slot0.initRarity(slot0)
	slot0.rarityToggles = {}

	onToggle(slot0, slot0.rarityAllBtn, function (slot0)
		if slot0 then
			for slot4, slot5 in pairs(slot0.rarityToggles) do
				triggerToggle(slot5, false)
			end

			slot0.data.rarityData = {}
		end

		setToggleEnabled(slot0.rarityAllBtn, not slot0)
	end, SFX_PANEL)

	for slot4, slot5 in pairs(slot0.rarity) do
		slot6 = cloneTplTo(slot0.rarityAllBtn, slot0.rarityPanel:Find("content"))

		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				if #slot0.data.rarityData == 0 then
					triggerToggle(slot0.rarityAllBtn, false)
				end

				table.insert(slot0.data.rarityData, slot1[2])

				if #slot0.data.rarityData == #slot0.data.rarityData.rarity then
					triggerToggle(slot0.rarityAllBtn, true)
				end
			elseif #slot0.data.rarityData > 0 and table.indexof(slot0.data.rarityData, slot1[2]) then
				table.remove(slot0.data.rarityData, slot1)

				if #slot0.data.rarityData == 0 then
					triggerToggle(slot0.rarityAllBtn, true)
				end
			end
		end, SFX_PANEL)
		setText(slot6:Find("Text"), slot5[1])

		slot0.rarityToggles[slot5[2]] = slot6
	end
end

function slot0.Show(slot0, slot1)
	setActive(slot0._tf, true)
	slot0:updateSelected(slot1)
end

function slot0.updateSelected(slot0, slot1)
	triggerToggle(slot0.sortToggles[slot1.sortData or "id"], true)

	if #(slot1.nationData or {}) > 0 then
		for slot7, slot8 in pairs(slot3) do
			triggerToggle(slot0.nationToggles[slot8], true)
		end
	else
		triggerToggle(slot0.nationAllBtn, true)
	end

	if #(slot1.rarityData or {}) > 0 then
		for slot8, slot9 in pairs(slot4) do
			triggerToggle(slot0.rarityToggles[slot9], true)
		end
	else
		triggerToggle(slot0.rarityAllBtn, true)
	end
end

function slot0.resetData(slot0)
	slot0.data = {
		sortData = "id",
		nationData = {},
		rarityData = {}
	}
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)
	slot0:resetData()
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
