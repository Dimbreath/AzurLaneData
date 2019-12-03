slot0 = class("ShrineBuffView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShrineBuff"
end

function slot0.OnInit(slot0)
	slot0:Show()
	slot0:initData()
	slot0:initUI()
	slot0:updateView()
end

function slot0.OnDestroy(slot0)
	slot0.contextData.onClose()

	slot0.lockBackPress = false
end

function slot0.initData(slot0)
	slot0.lockBackPress = true
end

function slot0.initUI(slot0)
	slot0.bg = slot0:findTF("BG")
	slot0.buffListTF = slot0:findTF("Main/BuffList")

	for slot4 = 1, 3, 1 do
		onButton(slot0, slot0.buffListTF:GetChild(slot4 - 1), function ()
			slot0.contextData.onSelect(slot1)
			slot0.contextData.onSelect:Destroy()
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.bg, function ()
		slot0:Destroy()
	end, SFX_CANCEL)
end

function slot0.updateView(slot0)
	return
end

return slot0
