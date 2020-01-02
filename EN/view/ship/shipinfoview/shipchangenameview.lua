slot0 = class("ShipChangeNameView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShipChangeNameView"
end

function slot0.OnInit(slot0)
	slot0._renamePanel = slot0._tf
	slot0._renameConfirmBtn = slot0._renamePanel:Find("frame/queren")
	slot0._renameCancelBtn = slot0._renamePanel:Find("frame/cancel")
	slot0._renameRevert = slot0._renamePanel:Find("frame/revert_button")
	slot0._renameCloseBtn = slot0._renamePanel:Find("frame/close_btn")

	onButton(slot0, slot0._renameConfirmBtn, function ()
		slot0 = getInputText(findTF(slot0._renamePanel, "frame/name_field"))

		slot0:emit(ShipMainMediator.RENAME_SHIP, slot0:GetShipVO().id, slot0)
	end, SFX_CONFIRM)
	onButton(slot0, slot0._renameRevert, function ()
		setInputText(findTF((slot0:GetShipVO():isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot0:GetShipVO():getRemouldSkinId()].name)) or pg.ship_data_statistics[slot0:GetShipVO().configId].name._renamePanel, "frame/name_field"), (slot0.GetShipVO().isRemoulded() and HXSet.hxLan(pg.ship_skin_template[slot0.GetShipVO().getRemouldSkinId()].name)) or pg.ship_data_statistics[slot0.GetShipVO().configId].name)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCloseBtn, function ()
		slot0:DisplayRenamePanel(false)
	end, SFX_PANEL)
	onButton(slot0, slot0._renameCancelBtn, function ()
		slot0:DisplayRenamePanel(false)
	end, SFX_CANCEL)
end

function slot0.SetShareData(slot0, slot1)
	slot0.shareData = slot1
end

function slot0.GetShipVO(slot0)
	if slot0.shareData and slot0.shareData.shipVO then
		return slot0.shareData.shipVO
	end

	return nil
end

function slot0.DisplayRenamePanel(slot0, slot1)
	slot0.isOpenRenamePanel = slot1

	SetActive(slot0._renamePanel, slot1)

	if slot1 then
		pg.UIMgr.GetInstance():BlurPanel(slot0._renamePanel, false)
		setInputText(findTF(slot0._renamePanel, "frame/name_field"), slot0:GetShipVO():getName())
	else
		pg.UIMgr.GetInstance():UnblurPanel(slot0._renamePanel, slot0._tf)
	end
end

function slot0.OnDestroy(slot0)
	slot0.shareData = nil
end

return slot0
