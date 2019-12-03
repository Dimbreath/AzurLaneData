slot0 = class("CommanderRenamePage", import("...base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "CommandeRenameUI"
end

slot0.OnInit = function (slot0)
	onButton(slot0, slot0._tf:Find("frame/close_btn"), function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0, slot0._tf:Find("frame/cancel_btn"), function ()
		slot0:Hide()
	end, SFX_PANEL)

	slot0.input = findTF(slot0._tf, "frame/bg/content/input")
	slot0.confirmBtn = slot0._tf:Find("frame/confirm_btn")
end

slot0.Show = function (slot0, slot1, slot2)
	slot0.isShowMsgBox = true

	setActive(slot0._tf, true)
	slot0._tf:SetAsLastSibling()
	setInputText(slot0.input, "")
	onButton(slot0, slot0.confirmBtn, function ()
		if not getInputText(slot0.input) or slot0 == "" then
			return
		end

		if slot1 then
			slot1(slot0)
		end

		slot0:Hide()
	end, SFX_PANEL)
end

slot0.Hide = function (slot0)
	slot0.isShowMsgBox = nil

	setActive(slot0._tf, false)
end

slot0.OnDestroy = function (slot0)
	slot0:Hide()
end

return slot0
