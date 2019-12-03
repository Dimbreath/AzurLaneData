slot0 = class("ShipEvaluationLayer", import("..base.BaseUI"))
slot0.EVENT_LIKE = "event like"
slot0.EVENT_EVA = "event eva"
slot0.EVENT_ZAN = "event zan"

function slot0.getUIName(slot0)
	return "EvaluationUI"
end

function slot0.init(slot0)
	slot0.mainPanel = slot0:findTF("mainPanel")
	slot0.head = slot0:findTF("bg/left_panel/ship_tpl", slot0.mainPanel)
	slot0.labelHeart = slot0:findTF("bg/left_panel/evaluation_count/heart", slot0.mainPanel)
	slot0.labelEva = slot0:findTF("bg/left_panel/evaluation_count/count", slot0.mainPanel)
	slot0.btnLike = slot0:findTF("bg/left_panel/btnLike", slot0.mainPanel)
	slot0.btnEva = slot0:findTF("bg/bottom_panel/send_btn", slot0.mainPanel)
	slot0.input = slot0:findTF("bg/bottom_panel/Input", slot0.mainPanel)
	slot0.inputText = slot0:findTF("Text", slot0.input)
	slot0.list = slot0:findTF("bg/right_panel/list", slot0.mainPanel)
	slot0.hotContent = slot0:findTF("content/hots", slot0.list)
	slot0.commonContent = slot0:findTF("content/commons", slot0.list)
	slot0.hotTpl = slot0:findTF("content/hot_tpl", slot0.list)
	slot0.commonTpl = slot0:findTF("content/commom_tpl", slot0.list)
	slot0.iconType = findTF(slot0.head, "content/main_bg/type_mask/type_icon"):GetComponent(typeof(Image))
	slot0.imageBg = findTF(slot0.head, "content/icon_bg"):GetComponent(typeof(Image))
	slot0.imageFrame = findTF(slot0.head, "content/main_bg")
	slot0.iconShip = findTF(slot0.head, "content/icon"):GetComponent(typeof(Image))
	slot0.labelName = findTF(slot0.head, "content/main_bg/name_mask/name"):GetComponent(typeof(Text))
	slot0.stars = findTF(slot0.head, "content/main_bg/stars")
	slot0.star = findTF(slot0.stars, "tpl")
	slot0.bg = slot0:findTF("BG")

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		groupName = slot0:getGroupNameFromData()
	})
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.bg, function ()
		slot0:emit(BaseUI.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("mainPanel/bg/top_panel/btnBack"), function ()
		slot0:emit(BaseUI.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnLike, function ()
		slot0:emit(slot1.EVENT_LIKE)
	end, SFX_PANEL)
	onButton(slot0, slot0.btnEva, function ()
		if string.len(slot0) > 0 then
			setInputText(slot0.input, "")
			slot0:emit(slot1.EVENT_EVA, slot0)
		end
	end, SFX_PANEL)
	onInputChanged(slot0, slot0.input, function ()
		slot1, slot2 = nil

		if string.len(slot0) > 0 then
			if CollectionProxy.MAX_DAILY_EVA_COUNT <= slot0.shipGroup.evaluation.ievaCount then
				slot1 = true
				slot2 = i18n("eva_count_limit")
			elseif wordVer(slot0) > 0 then
				slot1 = true
				slot2 = i18n("invalidate_evaluation")
			end
		end

		if slot1 then
			setTextColor(slot0.inputText, Color.red)
			setButtonEnabled(slot0.btnEva, false)
			pg.TipsMgr.GetInstance():ShowTips(slot2)
		else
			setTextColor(slot0.inputText, Color.white)
			setButtonEnabled(slot0.btnEva, true)
		end
	end)
end

function slot0.setShipGroup(slot0, slot1)
	slot0.shipGroup = slot1
end

function slot0.setShowTrans(slot0, slot1)
	slot0.showTrans = slot1
end

function slot0.flushAll(slot0)
	slot0:flushShip()
	slot0:flushHeart()
	slot0:flushEva()
end

function slot0.flushShip(slot0)
	slot1 = slot0.shipGroup.shipConfig

	setShipCardFrame(slot0.imageFrame, slot4, nil)
	LoadImageSpriteAsync("bg/star_level_card_" .. ((slot0.shipGroup:isBluePrintGroup() and "0") or "") .. slot4, slot0.imageBg)

	slot0.iconShip.sprite = GetSpriteFromAtlas("shipYardIcon/unknown", "")

	LoadImageSpriteAsync("shipYardIcon/" .. slot0.shipGroup:getPainting(slot0.showTrans), slot0.iconShip)

	slot0.labelName.text = slot0.shipGroup:getName(slot0.showTrans)

	if not GetSpriteFromAtlas("shiptype", shipType2print(slot0.shipGroup:getShipType(slot0.showTrans))) then
		warning("找不到船形, shipConfigId: " .. shipVO.configId)
	end

	slot0.iconType.sprite = slot5

	for slot11 = slot0.stars.childCount, pg.ship_data_template[slot1.id].star_max - 1, 1 do
		slot12 = cloneTplTo(slot0.star, slot0.stars)
	end
end

function slot0.flushHeart(slot0)
	setButtonEnabled(slot0.btnLike, not slot0.shipGroup.iheart)
	setText(slot0.labelHeart, slot0.shipGroup.evaluation.hearts)
end

function slot0.flushEva(slot0)
	setText(slot0.labelEva, slot0.shipGroup.evaluation.evaCount)

	slot2 = slot0.shipGroup.evaluation.evas

	for slot6 = 1, slot0.hotContent.childCount, 1 do
		if go(slot0.hotContent:GetChild(slot6 - 1)).name ~= "tag" then
			Destroy(slot7)
		end
	end

	for slot6 = 1, slot0.commonContent.childCount, 1 do
		if go(slot0.commonContent:GetChild(slot6 - 1)).name ~= "tag" then
			Destroy(slot7)
		end
	end

	for slot6 = 1, #slot2, 1 do
		slot7 = nil

		setText(slot10, slot8.nick_name .. ":")
		setText(slot11, slot8.good_count - slot8.bad_count)

		slot0:findTF("bg/evaluation", (not slot2[slot6].hot or cloneTplTo(slot0.hotTpl, slot0.hotContent)) and cloneTplTo(slot0.commonTpl, slot0.commonContent)):GetComponent(typeof(Text)).supportRichText = false
		slot0.findTF("bg/evaluation", (not slot2[slot6].hot or cloneTplTo(slot0.hotTpl, slot0.hotContent)) and cloneTplTo(slot0.commonTpl, slot0.commonContent)).GetComponent(typeof(Text)).text = slot8.context

		function slot12(slot0)
			if not slot0.izan then
				slot1:emit(slot2.EVENT_ZAN, slot0.id, slot0)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("zan_ship_eva_error_7"))
			end
		end

		onButton(slot0, (not slot2[slot6].hot or cloneTplTo(slot0.hotTpl, slot0.hotContent)) and cloneTplTo(slot0.commonTpl, slot0.commonContent):Find("bg/zan_bg/up"), function ()
			slot0(0)
		end, SFX_PANEL)
		onButton(slot0, (not slot2[slot6].hot or cloneTplTo(slot0.hotTpl, slot0.hotContent)) and cloneTplTo(slot0.commonTpl, slot0.commonContent):Find("bg/zan_bg/down"), function ()
			slot0(1)
		end, SFX_PANEL)
		SetActive((not slot2[slot6].hot or cloneTplTo(slot0.hotTpl, slot0.hotContent)) and cloneTplTo(slot0.commonTpl, slot0.commonContent):Find("bg/zan_bg/down"), not LOCK_DOWNVOTE or false)

		if LOCK_DOWNVOTE then
			slot7:Find("bg/zan_bg/up").position = slot7:Find("bg/zan_bg/down").position + Vector3(0, 0.15, 0)
		end
	end

	slot3 = 1

	for slot7 = 1, slot0.hotContent.childCount, 1 do
		if go(slot0.hotContent:GetChild(slot7 - 1)).name ~= "tag" then
			setActive(slot8:Find("print1"), slot3 % 2 ~= 0)
			setActive(slot8:Find("print2"), slot3 % 2 == 0)

			slot3 = slot3 + 1
		end
	end

	setActive(slot0.hotContent:Find("tag"), slot0.hotContent.childCount > 1)
	setActive(slot0.commonContent:Find("tag"), slot0.commonContent.childCount > 1)
	slot0.hotContent:Find("tag"):SetAsLastSibling()
	slot0.commonContent:Find("tag"):SetAsLastSibling()
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
