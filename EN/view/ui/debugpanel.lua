slot0 = class("DebugPanel", import("..base.BaseUI"))

slot0.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
	slot0:onUILoaded(DebugMgr.Inst.DebugPanel)
	setActive(slot0._tf, false)

	slot0.ctrls = slot0:findTF("ctrls")
	slot0._customBtnTpl = slot0:getTpl("ctrls/custom_button")
end

slot0.addCustomBtn = function (slot0, slot1, slot2)
	setButtonText(slot3, slot1)
	onButton(slot0, cloneTplTo(slot0._customBtnTpl, slot0.ctrls), slot2)
end

return slot0
