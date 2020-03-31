slot0 = class("DockyardQuickSelectSettingPage", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "DockyardQuickSelectSettingUI"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
end

function slot0.InitUI(slot0)
	setText(findTF(slot0._tf, "window/top/bg/obtain/title"), i18n("retire_title"))

	slot2 = {
		sr = 4,
		n = 2,
		empty = 0,
		r = 3
	}
	slot3 = {}

	for slot7 = 1, #{
		findTF(slot0._tf, "window/notifications/options/notify_tpl_1"),
		findTF(slot0._tf, "window/notifications/options/notify_tpl_2"),
		findTF(slot0._tf, "window/notifications/options/notify_tpl_3")
	}, 1 do
		slot3[slot7] = {}

		for slot11, slot12 in pairs(slot2) do
			slot3[slot7][slot11] = findTF(slot1[slot7], slot11)
		end
	end

	for slot7 = 1, #slot1, 1 do
		for slot11, slot12 in pairs(slot2) do
			onToggle(slot0, slot3[slot7][slot11], function (slot0)
				slot1 = slot0[][slot0]:GetComponent(typeof(Toggle))

				if slot0 then
					slot3.settingChanged = true

					PlayerPrefs.SetInt("QuickSelectRarity" .. slot1, slot1)
				elseif not slot1.group:AnyTogglesOn() then
					triggerToggle(slot0[slot1].empty, true)
				end
			end)
		end
	end

	onToggle(slot0, findTF(slot0._tf, "window/notifications/options/notify_tpl_4/on"), function (slot0)
		slot0.settingChanged = true

		PlayerPrefs.SetInt("QuickSelectRequireLockAtLeastOne", (slot0 and 1) or 0)
	end)
	onToggle(slot0, findTF(slot0._tf, "window/notifications/options/notify_tpl_5/on"), function (slot0)
		slot0.settingChanged = true

		PlayerPrefs.SetInt("QuickSelectRequireMaxstar", (slot0 and 1) or 0)
	end)
	onToggle(slot0, findTF(slot0._tf, "window/notifications/options/notify_tpl_6/on"), function (slot0)
		slot0.settingChanged = true

		PlayerPrefs.SetInt("QuickSelectRequireLvOne", (slot0 and 1) or 0)
	end)
	setActive(findTF(slot0._tf, "window/notifications/options/notify_tpl_6/"), false)
	onButton(slot0, findTF(slot0._tf, "window/top/btnBack"), function ()
		slot0:Hide()
	end, SFX_CANCEL)
	triggerToggle(findTF(slot0._tf, "window/notifications/options/notify_tpl_4/on"), PlayerPrefs.GetInt("QuickSelectRequireLockAtLeastOne", 1) == 1)
	triggerToggle(findTF(slot0._tf, "window/notifications/options/notify_tpl_5/on"), PlayerPrefs.GetInt("QuickSelectRequireMaxstar", 1) == 1)
	triggerToggle(findTF(slot0._tf, "window/notifications/options/notify_tpl_6/on"), PlayerPrefs.GetInt("QuickSelectRequireLvOne", 1) == 1)
	triggerToggle(findTF(slot0._tf, "window/notifications/options/notify_tpl_4/off"), not (PlayerPrefs.GetInt("QuickSelectRequireLockAtLeastOne", 1) == 1))
	triggerToggle(findTF(slot0._tf, "window/notifications/options/notify_tpl_5/off"), not (PlayerPrefs.GetInt("QuickSelectRequireMaxstar", 1) == 1))
	triggerToggle(findTF(slot0._tf, "window/notifications/options/notify_tpl_6/off"), not (PlayerPrefs.GetInt("QuickSelectRequireLvOne", 1) == 1))
	setText(findTF(slot0._tf, "window/notifications/options/notify_tpl_4/Text"), i18n("retire_1"))
	setText(findTF(slot0._tf, "window/notifications/options/notify_tpl_5/Text"), i18n("retire_2"))
	setText(findTF(slot0._tf, "window/notifications/options/notify_tpl_6/Text"), i18n("retire_3"))

	slot7 = {
		PlayerPrefs.GetInt("QuickSelectRarity1", 3),
		PlayerPrefs.GetInt("QuickSelectRarity2", 4),
		PlayerPrefs.GetInt("QuickSelectRarity3", 2)
	}

	for slot11 = 1, #slot1, 1 do
		setText(findTF(slot1[slot11], "Text"), i18n("retire_rarity", slot11))

		for slot15, slot16 in pairs(slot2) do
			if slot16 == slot7[slot11] then
				triggerToggle(slot3[slot11][slot15], true)
			end
		end
	end
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)

	if slot0.settingChangedCB then
		slot0.settingChangedCB()
	end
end

function slot0.OnDestroy(slot0)
	slot0.settingChangedCB = nil
end

function slot0.OnSettingChanged(slot0, slot1)
	slot0.settingChangedCB = slot1
end

return slot0
