slot0 = class("AttireScene", import("..base.BaseUI"))
slot0.PAGE_ICONFRAME = 1
slot0.PAGE_CHATFRAME = 2
slot0.PAGE_ACHIEVEMENT = 3

function slot0.getUIName(slot0)
	return "AttireUI"
end

function slot0.setAttires(slot0, slot1)
	slot0.rawAttireVOs = slot1

	slot0:updateTips(getProxy(AttireProxy):needTip())
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.toggles = {
		slot0:findTF("adapt/left_length/frame/tagRoot/iconframe", slot0.blurPanel),
		slot0:findTF("adapt/left_length/frame/tagRoot/chatframe", slot0.blurPanel),
		slot0:findTF("adapt/left_length/frame/tagRoot/achievement", slot0.blurPanel)
	}
	slot0.panels = {
		AttireIconFramePanel.New(slot0._tf, slot0.event, slot0.contextData),
		AttireChatFramePanel.New(slot0._tf, slot0.event, slot0.contextData),
		AttireAchievementPanel.New(slot0._tf, slot0.event, slot0.contextData)
	}
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)

	for slot4, slot5 in ipairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				slot0:switchPage(slot0.switchPage)
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot0.toggles[slot0.contextData.index or slot0.PAGE_ICONFRAME], true)
end

function slot0.switchPage(slot0, slot1)
	slot2 = slot0.panels[slot1]

	if slot0.page then
		slot0.panels[slot0.page]:ActionInvoke("Hide")
	end

	slot0.page = slot1

	slot0:updateCurrPage(function ()
		slot0:ActionInvoke("Show")
	end)
end

function slot0.updateCurrPage(slot0, slot1)
	function slot3()
		slot0:ActionInvoke("Update", slot1.rawAttireVOs, slot1.playerVO)

		if "Update" then
			slot2()
		end
	end

	if not slot0.panels[slot0.page]:GetLoaded() then
		slot2:Load()
		slot2:AddLoadedCallback(slot3)
	else
		slot3()
	end
end

function slot0.updateTips(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		setActive(slot0.toggles[slot5]:Find("tip"), slot6)
	end
end

function slot0.willExit(slot0)
	for slot4, slot5 in ipairs(slot0.panels) do
		slot5:Destroy()
	end
end

return slot0
