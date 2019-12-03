slot0 = class("ShrineResultView", import("...base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "ShrineResult"
end

slot0.OnInit = function (slot0)
	slot0:Show()
	slot0:initData()
	slot0:initUI()
end

slot0.OnDestroy = function (slot0)
	if slot0.closeFunc then
		slot0.closeFunc()

		slot0.closeFunc = nil
	end
end

slot0.initData = function (slot0)
	return
end

slot0.initUI = function (slot0)
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

slot0.updateView = function (slot0, slot1)
	setText(slot0.text, slot1)
end

slot0.setCloseFunc = function (slot0, slot1)
	slot0.closeFunc = slot1
end

return slot0
