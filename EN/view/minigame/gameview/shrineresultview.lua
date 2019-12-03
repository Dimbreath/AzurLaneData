slot0 = class("ShrineResultView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShrineResult"
end

function slot0.OnInit(slot0)
	slot0:Show()
	slot0:initData()
	slot0:initUI()
end

function slot0.OnDestroy(slot0)
	if slot0.closeFunc then
		slot0.closeFunc()

		slot0.closeFunc = nil
	end
end

function slot0.initData(slot0)
	return
end

function slot0.initUI(slot0)
	slot0.bg = slot0:findTF("BGImg")
	slot0.text = slot0:findTF("Main/MainBox/Text")
	slot0.button = slot0:findTF("Main/MainBox/Button")

	onButton(slot0, slot0.bg, function ()
		slot0:Destroy()
	end, SFX_CANCEL)
	onButton(slot0, slot0.button, function ()
		slot0:Destroy()
	end, SFX_CANCEL)
end

function slot0.updateView(slot0, slot1)
	setText(slot0.text, slot1)
end

function slot0.setCloseFunc(slot0, slot1)
	slot0.closeFunc = slot1
end

return slot0
