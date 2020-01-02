slot0 = class("ShipFashionView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShipFashionView"
end

function slot0.OnInit(slot0)
	slot0:InitFashion()
end

function slot0.InitFashion(slot0)
	slot0.mainPanel = slot0._parentTf.parent
	slot0.stylePanel = slot0._tf
	slot0.styleScroll = slot0:findTF("style_scroll", slot0.stylePanel)
	slot0.styleContainer = slot0:findTF("view_port", slot0.styleScroll)
	slot0.styleCard = slot0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	slot0.hideObjToggleTF = findTF(slot0._tf, "hideObjToggle")

	setActive(slot0.hideObjToggleTF, false)

	slot0.hideObjToggle = GetComponent(slot0.hideObjToggleTF, typeof(Toggle))

	setText(findTF(slot0.hideObjToggleTF, "Label"), i18n("paint_hide_other_obj_tip"))
	setActive(slot0.stylePanel, true)
	setActive(slot0.styleCard, false)

	slot0.fashionSkins = {}
	slot0.fashionCellMap = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
	slot0.onSelected = false
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

function slot0.SetSkinList(slot0, slot1)
	slot0.skinList = slot1
end

function slot0.UpdateUI(slot0)
	slot0:UpdateFashion()
end

function slot0.OnSelected(slot0, slot1)
	slot2 = pg.UIMgr.GetInstance()

	if slot1 then
		slot2:OverlayPanelPB(slot0._parentTf, {
			pbList = {
				slot0.stylePanel:Find("style_desc"),
				slot0.stylePanel:Find("frame")
			},
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		slot2:UnOverlayPanel(slot0._parentTf, slot0.mainPanel)
	end

	slot0.onSelected = slot1
end

function slot0.UpdateFashion(slot0, slot1)
	slot0.fashionSkins = slot0.shareData:GetGroupSkinList(slot0:GetShipVO().groupId)

	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION or #slot0.fashionSkins <= 1 then
		return
	end

	if slot0.fashionGroup ~= slot2 or slot1 then
		slot0.fashionGroup = slot2

		slot0:ResetFashion()

		for slot6 = slot0.styleContainer.childCount, #slot0.fashionSkins - 1, 1 do
			cloneTplTo(slot0.styleCard, slot0.styleContainer)
		end

		for slot6 = #slot0.fashionSkins, slot0.styleContainer.childCount - 1, 1 do
			setActive(slot0.styleContainer:GetChild(slot6), false)
		end

		for slot6, slot7 in ipairs(slot0.fashionSkins) do
			slot8 = slot0.fashionSkins[slot6]

			if not slot0.fashionCellMap[slot0.styleContainer:GetChild(slot6 - 1)] then
				slot0.fashionCellMap[slot9] = ShipSkinCard.New(slot9.gameObject)
			end

			slot10:updateData(slot0:GetShipVO(), slot8, slot0:GetShipVO():proposeSkinOwned(slot8) or table.contains(slot0.skinList, slot8.id) or (slot0:GetShipVO():getRemouldSkinId() == slot8.id and slot0:GetShipVO():isRemoulded()) or slot8.skin_type == ShipSkin.SKIN_TYPE_OLD)
			slot10:updateUsing(slot0:GetShipVO().skinId == slot8.id)
			onButton(slot0, slot9, function ()
				if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
					return
				end

				slot0.fashionSkinId = slot1.id

				slot0:UpdateFashionDetail(slot0)
				slot0.UpdateFashionDetail:emit(ShipViewConst.LOAD_PAINTING, slot1.painting)
				slot0.UpdateFashionDetail.emit:emit(ShipViewConst.LOAD_PAINTING_BG, slot0:GetShipVO():rarity2bgPrintForGet(), slot0:GetShipVO():isBluePrintShip())

				for slot3, slot4 in ipairs(slot0.fashionSkins) do
					slot0.fashionCellMap[slot0.styleContainer:GetChild(slot3 - 1)]:updateSelected(slot4.id == slot0.fashionSkinId)
					slot6:updateUsing(slot0:GetShipVO().skinId == slot4.id)
				end

				slot0 = PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. slot2.paintingName .. "_n"))

				setActive(slot0.hideObjToggle, slot0)

				if slot0 then
					slot0.hideObjToggle.isOn = PlayerPrefs.GetInt("paint_hide_other_obj_" .. slot2.paintingName, 0) ~= 0

					onToggle(slot0, slot0.hideObjToggleTF, function (slot0)
						PlayerPrefs.SetInt("paint_hide_other_obj_" .. slot0.paintingName, (slot0 and 1) or 0)
						slot0:flushSkin()
						slot0.flushSkin:emit(ShipViewConst.LOAD_PAINTING, slot0.paintingName, true)
					end, SFX_PANEL)
				end
			end)
			setActive(slot9, true)
		end
	end

	slot0.fashionSkinId = slot0:GetShipVO().skinId
	slot3 = slot0.styleContainer:GetChild(0)

	for slot7, slot8 in ipairs(slot0.fashionSkins) do
		if slot8.id == slot0.fashionSkinId then
			slot3 = slot0.styleContainer:GetChild(slot7 - 1)

			break
		end
	end

	triggerButton(slot3)
end

function slot0.ResetFashion(slot0)
	slot0.fashionSkinId = 0
end

function slot0.UpdateFashionDetail(slot0, slot1)
	if not slot0.fashionDetailWrapper then
		slot0.fashionDetailWrapper = {
			name = findTF(slot0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(slot0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(slot0.stylePanel, "style_desc/character"),
			confirm = findTF(slot0.stylePanel, "confirm_button"),
			cancel = findTF(slot0.stylePanel, "cancel_button"),
			diamond = findTF(()["confirm"], "diamond"),
			using = findTF(()["confirm"], "using"),
			experience = findTF(()["confirm"], "experience"),
			change = findTF(()["confirm"], "change"),
			buy = findTF(()["confirm"], "buy"),
			activity = findTF(()["confirm"], "activity"),
			cantbuy = findTF(()["confirm"], "cantbuy"),
			prefab = "unknown"
		}
	end

	setText(slot2.name, HXSet.hxLan(slot1.name))
	setText(slot2.descTxt, HXSet.hxLan(slot1.desc))

	if #slot2.descTxt:GetComponent(typeof(Text)).text > 50 then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end

	if slot2.prefab ~= slot1.prefab then
		if not IsNil(slot2.character:Find(slot2.prefab)) then
			PoolMgr.GetInstance():ReturnSpineChar(slot2.prefab, slot4.gameObject)
		end

		slot2.prefab = slot1.prefab

		PoolMgr.GetInstance():GetSpineChar(slot2.prefab, true, function (slot0)
			if slot0.prefab ~=  then
				PoolMgr.GetInstance():ReturnSpineChar(PoolMgr.GetInstance().ReturnSpineChar, slot0)
			else
				slot0.name = slot1
				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3(0.5, 0.5, 1)

				slot0.transform:SetParent(slot0.character, false)
				slot0:GetComponent(typeof(SpineAnimUI)).SetAction(slot2, slot2.show_skin or "stand", true)
			end
		end)
	end

	slot7 = ((slot1.shop_id > 0 and pg.shop_template[slot1.shop_id]) or nil) and not pg.TimeMgr.GetInstance():inTime((slot1.shop_id > 0 and pg.shop_template[slot1.shop_id]) or nil.time)
	slot9 = slot1.id == slot0:GetShipVO():getConfig("skin_id") or (((slot0:GetShipVO():proposeSkinOwned(slot1) or table.contains(slot0.skinList, slot1.id) or (slot0:GetShipVO():getRemouldSkinId() == slot1.id and slot0:GetShipVO():isRemoulded())) and 1) or 0) >= 1 or slot1.skin_type == ShipSkin.SKIN_TYPE_OLD
	slot10 = getProxy(ShipSkinProxy):getSkinById(slot1.id)
	slot11 = slot1.id == slot0:GetShipVO().skinId and slot10 and slot10:isExpireType()

	setGray(slot2.confirm, false)
	setActive(slot2.using, false)
	setActive(slot2.change, false)
	setActive(slot2.buy, false)
	setActive(slot2.experience, false)

	if slot11 then
		setActive(slot2.experience, true)
	elseif slot8 then
		setActive(slot2.using, true)
	elseif slot9 then
		setActive(slot2.change, true)
	elseif slot6 then
		setActive(slot2.buy, true)
		setGray(slot2.confirm, slot7)
	else
		setActive(slot2.change, true)
		setGray(slot2.confirm, true)
	end

	onButton(slot0, slot2.confirm, function ()
		if slot0 then
		elseif slot1 then
			slot2:emit(slot2, slot3, (slot3.id == slot2:GetShipVO():getConfig("skin_id") and 0) or slot3.id)
		elseif slot4 then
			if slot5 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
			else
				slot0 = Goods.New({
					shop_id = slot4.id
				}, Goods.TYPE_SKIN)
				slot1 = slot0:getConfig("resource_num")

				if slot0:isDisCount() then
					slot1 = slot1 * (100 - slot0:getConfig("discount")) / 100
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("text_buy_fashion_tip", slot1, HXSet.hxLan(slot3.name)),
					onYes = function ()
						slot0:emit(ShipMainMediator.BUY_ITEM, slot1.id, 1)
					end
				})
			end
		end
	end)
	onButton(slot0, slot2.cancel, function ()
		slot0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
	end)
end

function slot0.OnDestroy(slot0)
	if slot0.fashionDetailWrapper and not IsNil(slot0.fashionDetailWrapper.character:Find(slot0.fashionDetailWrapper.prefab)) then
		PoolMgr.GetInstance():ReturnSpineChar(slot1.prefab, slot2.gameObject)
	end

	slot0.fashionDetailWrapper = nil

	for slot4, slot5 in pairs(slot0.fashionCellMap) do
		slot5:clear()
	end

	slot0.fashionCellMap = {}
	slot0.fashionSkins = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
	slot0.shareData = nil
end

return slot0
