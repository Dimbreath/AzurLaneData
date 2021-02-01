slot0 = class("LevelStageTotalRewardPanel", BaseUI)

function slot0.getUIName(slot0)
	return "LevelStageTotalRewardPanel"
end

slot1 = 0.15

function slot0.init(slot0)
	slot0.window = slot0._tf:Find("Window")
	slot0.boxView = slot0.window:Find("Box/ScrollView")
	slot0.emptyTip = slot0.window:Find("Box/EmptyTip")
	slot0.itemList = slot0.boxView:Find("Viewport/Content/ItemGrid")
	slot1 = Instantiate(slot0.itemList:GetComponent(typeof(ItemList)).prefabItem[0])
	slot1.name = "Icon"

	setParent(slot1, slot0.itemList:Find("GridItem/Shell"))

	slot0.spList = slot0.window:Find("SpList")

	slot0.CloneIconTpl(slot0.spList:Find("Item/Active/Item"), "Icon")
	setText(slot0.emptyTip, i18n("autofight_rewards_none"))
	setText(slot0.window:Find("top/bg/obtain/title"), i18n("autofight_rewards"))
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:UpdateView()
end

function slot0.willExit(slot0)
	slot0:SkipAnim()
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

function slot0.UpdateView(slot0)
	slot1 = slot0.contextData

	onButton(slot0, slot0._tf:Find("BG"), function ()
		if uv0.isRewardAnimating then
			uv0:SkipAnim()

			return
		end

		existCall(uv1.onClose)
		uv0:closeView()
	end)
	setText(slot0.window:Find("ButtonGO/pic"), i18n("autofight_onceagain"))
	onButton(slot0, slot0.window:Find("ButtonGO"), function ()
		if uv0.contextData.spItemID and not (PlayerPrefs.GetInt("autoFight_firstUse_sp", 0) == 1) then
			PlayerPrefs.SetInt("autoFight_firstUse_sp", 1)
			PlayerPrefs.Save()

			function slot2()
				uv0.contextData.spItemID = nil
				uv0.contextData.SpSelect = nil

				uv0:UpdateSPItem()
			end

			uv0:HandleShowMsgBox({
				hideNo = true,
				content = i18n("autofight_special_operation_tip"),
				onYes = slot2,
				onNo = slot2
			})

			return
		end

		slot1 = true
		slot2 = uv0.contextData.chapter.duties
		slot4 = uv0.contextData.chapter

		if uv0.contextData.chapter:getConfig("type") == Chapter.CustomFleet then
			seriesAsync({
				function (slot0)
					uv0:GetParentView():trackChapter(uv1, slot0)
				end,
				function (slot0)
					uv0.CheckOilCost(uv1, uv2, slot0)
				end,
				function (slot0)
					uv0:emit(LevelMediator2.ON_ELITE_TRACKING, uv1.id, 1, uv2, uv3, uv4)
					uv0:closeView()
				end
			})

			return
		elseif uv0.contextData.fleets and #slot5 > 0 then
			seriesAsync({
				function (slot0)
					uv0:GetParentView():trackChapter(uv1, slot0)
				end,
				function (slot0)
					uv0.CheckOilCost(uv1, uv2, slot0)
				end,
				function (slot0)
					uv0:emit(LevelMediator2.ON_TRACKING, uv1.id, uv2, 1, uv3, uv4, uv5)
					uv0:closeView()
				end
			})

			return
		end

		uv0:closeView()
	end, SFX_CONFIRM)
	setText(slot0.window:Find("ButtonExit/pic"), i18n("autofight_leave"))
	onButton(slot0, slot0.window:Find("ButtonExit"), function ()
		existCall(uv0.onClose)
		uv1:closeView()
	end, SFX_CANCEL)
	slot0:UpdateSPItem()

	slot0.tweenItems = {}
	slot3 = slot1.events
	slot4 = slot1.guildTasks
	slot6 = slot3 and #slot3 > 0
	slot7 = slot4 and table.getCount(slot4) > 0

	if slot1.rewards and #slot2 > 0 or slot6 or slot7 then
		setActive(slot0.window, true)
		setActive(slot0.emptyTip, false)
		setActive(slot0.boxView:Find("Viewport/Content/ItemGrid"), slot5)

		if slot5 then
			for slot12, slot13 in ipairs(CustomIndexLayer.Clone2Full(slot0.itemList, #slot2)) do
				slot15 = slot8[slot12]

				updateDrop(slot15:Find("Shell/Icon"), slot2[slot12])
				onButton(slot0, slot15:Find("Shell/Icon"), function ()
					uv0:emit(BaseUI.ON_DROP, uv1)
				end, SFX_PANEL)
			end

			slot9 = {}

			for slot13 = 1, #slot2 do
				setActive(slot8[slot13], false)
				table.insert(slot9, function (slot0)
					if not uv0.tweenItems then
						slot0()

						return
					end

					setActive(uv1, true)
					Canvas.ForceUpdateCanvases()

					uv0.boxView:GetComponent(typeof(ScrollRect)).verticalNormalizedPosition = 0

					table.insert(uv0.tweenItems, LeanTween.delayedCall(uv2, System.Action(slot0)).id)
				end)
			end

			slot0.isRewardAnimating = true

			table.insert(slot9, function ()
				uv0:SkipAnim()
			end)
			seriesAsync(slot9)
		end

		setActive(slot0.boxView:Find("Viewport/Content/TextArea"), slot6 or slot7)

		slot8 = ""

		if slot6 then
			for slot12, slot13 in ipairs(slot3) do
				slot8 = slot8 .. i18n("autofight_entrust", pg.collection_template[slot13] and pg.collection_template[slot13].title or "") .. "\n"
			end
		end

		if slot7 then
			for slot12, slot13 in pairs(slot4) do
				slot8 = slot8 .. i18n("autofight_task", slot13) .. "\n"
			end
		end

		if #slot8 > 0 then
			slot8 = string.sub(slot8, 1, -2) or slot8
		end

		setText(slot0.boxView:Find("Viewport/Content/TextArea/Text"), slot8)
	else
		setActive(slot0.boxView, false)
		setActive(slot0.emptyTip, true)
	end
end

function slot0.UpdateSPItem(slot0)
	slot2 = getProxy(BagProxy):getItemsByType(Item.SPECIAL_OPERATION_TICKET)

	if slot0.contextData.chapter:getConfig("special_operation_list") == "" then
		slot3 = {} or slot3
	end

	slot4 = {}
	slot5 = {}

	for slot9, slot10 in pairs(pg.benefit_buff_template) do
		if slot10.benefit_type == Chapter.OPERATION_BUFF_TYPE_DESC and table.contains(slot3, slot9) then
			table.insert(slot4, slot10)

			slot11 = tonumber(slot10.benefit_condition)

			if _.detect(slot2, function (slot0)
				return slot0.configId == uv0
			end) and slot12.count > 0 then
				table.insert(slot5, slot10)
			end
		end
	end

	function slot7()
		uv0.contextData.SpSelect = not uv0.contextData.SpSelect

		uv0:UpdateSPItem()
	end

	setActive(slot0.spList, #slot4 ~= 0)
	UIItemList.StaticAlign(slot0.spList, slot0.spList:GetChild(0), not slot0.contextData.SpSelect and 1 or math.max(1, #slot5) + 1, function (slot0, slot1, slot2)
		if slot0 ~= UIItemList.EventUpdate then
			return
		end

		if uv1.contextData.SpSelect then
			if uv0 - slot1 == 1 then
				setActive(slot2:Find("Active"), true)
				setActive(slot2:Find("Block"), false)
				setActive(slot2:Find("Active/Item"), false)
				setText(slot2:Find("Active/Desc"), i18n("levelScene_unselect_SP_OP"))
				onButton(uv1, slot2, function ()
					uv0.contextData.spItemID = nil

					uv1()
				end, SFX_PANEL)
			else
				if slot1 - 1 <= #uv3 then
					setActive(slot2:Find("Active"), true)
					setActive(slot2:Find("Block"), false)
					setActive(slot2:Find("Active/Item"), true)

					slot3 = uv3[slot1 - 1]

					setText(slot2:Find("Active/Desc"), slot3.desc)

					slot5 = _.detect(uv4, function (slot0)
						return slot0.configId == uv0
					end) or {
						count = 0,
						id = tonumber(slot3.benefit_condition),
						type = DROP_TYPE_ITEM
					}
					slot5.type = DROP_TYPE_ITEM

					updateDrop(slot2:Find("Active/Item/Icon"), slot5)
					onButton(uv1, slot2, function ()
						uv0.contextData.spBuff = uv1
						uv0.contextData.spItemID = uv2

						uv3()
					end, SFX_PANEL)

					return
				end

				setActive(slot2:Find("Active"), false)
				setActive(slot2:Find("Block"), true)
				onButton(uv1, slot2, uv2, SFX_PANEL)
			end
		else
			setActive(slot2:Find("Active"), true)
			setActive(slot2:Find("Block"), false)
			setActive(slot2:Find("Active/Item"), uv1.contextData.spItemID)

			if uv1.contextData.spItemID then
				setText(slot2:Find("Active/Desc"), uv1.contextData.spBuff.desc)
			else
				setText(slot2:Find("Active/Desc"), i18n("autofight_selectprops_tip"))
			end

			onButton(uv1, slot2, uv2, SFX_PANEL)
		end
	end)
end

function slot0.CloneIconTpl(slot0, slot1)
	slot3 = Instantiate(slot0:GetComponent(typeof(ItemList)).prefabItem[0])

	if slot1 then
		slot3.name = slot1
	end

	setParent(slot3, slot0)

	return slot3
end

function slot0.GetParentView(slot0)
	slot3 = getProxy(ContextProxy):getCurrentContext() and pg.m02:retrieveMediator(slot2.mediator.__cname)

	return slot3 and slot3:getViewComponent()
end

function slot0.HandleShowMsgBox(slot0, slot1)
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)
end

function slot0.CheckOilCost(slot0, slot1, slot2)
	if not getProxy(PlayerProxy):getRawData():isEnough({
		oil = slot0:getConfig("oil") * TrackingCommand.CalculateSpItemMoreCostRate(slot1)
	}) then
		if not ItemTipPanel.ShowOilBuyTip(slot3) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))
		end

		return
	end

	slot2()
end

function slot0.SkipAnim(slot0)
	if not slot0.isRewardAnimating then
		return
	end

	for slot4, slot5 in ipairs(slot0.tweenItems) do
		LeanTween.cancel(slot5)
	end

	for slot4 = 1, slot0.itemList.childCount do
		setActive(slot0.itemList:GetChild(slot4 - 1), true)
	end

	slot0.isRewardAnimating = nil
end

return slot0
