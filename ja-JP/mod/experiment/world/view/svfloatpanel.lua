slot0 = class("SVFloatPanel", import("view.base.BaseSubView"))
slot0.ShowView = "SVFloatPanel.ShowView"
slot0.HideView = "SVFloatPanel.HideView"
slot0.ReturnCall = "SVFloatPanel.ReturnCall"

function slot0.getUIName(slot0)
	return "SVFloatPanel"
end

function slot0.OnLoaded(slot0)
end

function slot0.OnInit(slot0)
	slot1 = slot0._tf
	slot0.rtBasePoint = slot1:Find("point")
	slot0.rtInfoPanel = slot0.rtBasePoint:Find("line/bg")
	slot0.rtPressingMark = slot0.rtInfoPanel:Find("icon/pressing")
	slot0.rtRes = slot1:Find("res")
	slot0.awardItemList = UIItemList.New(slot0.rtInfoPanel:Find("pressing_award"), slot0.rtInfoPanel:Find("pressing_award/award_tpl"))

	slot0.awardItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0.awardConfig[slot1 + 1]

			updateDrop(slot2:Find("IconTpl"), {
				type = slot3[1],
				id = slot3[2],
				count = slot3[3]
			})
			onButton(uv0, slot2:Find("IconTpl"), function ()
				uv0:emit(BaseUI.ON_DROP, uv1)
			end, SFX_PANEL)
			setActive(slot2:Find("is_pressing"), uv0.destMap.isPressing)
			setActive(slot2:Find("IconTpl"), not uv0.destMap.isPressing)
		end
	end)

	slot0.btnBack = slot0.rtInfoPanel:Find("back")

	onButton(slot0, slot0.btnBack, function ()
		if uv0.entrance.active then
			uv0:emit(WorldScene.SceneOp, "OpSetInMap", true)
		else
			uv0:emit(WorldScene.SceneOp, "OpTransport", uv0.entrance)
		end
	end, SFX_CONFIRM)

	slot0.btnEnter = slot0.rtInfoPanel:Find("enter")

	onButton(slot0, slot0.btnEnter, function ()
		slot0 = {}

		if WorldConst.HasDangerConfirm(uv0.destMap.config.entrance_ui) then
			table.insert(slot0, function (slot0)
				uv0:emit(WorldScene.SceneOp, "OpCall", function (slot0)
					slot0()
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("world_map_dangerous_confirm"),
						onYes = uv0
					})
				end)
			end)
		end

		seriesAsync(slot0, function ()
			if not uv0.destMap.isCost and nowWorld.staminaMgr:GetTotalStamina() < uv0.destMap.config.enter_cost then
				nowWorld.staminaMgr:Show()
			else
				uv0:emit(WorldScene.SceneOp, "OpTransport", uv0.entrance)
			end
		end)
	end, SFX_CONFIRM)

	slot0.btnLock = slot0.rtInfoPanel:Find("lock")
	slot0.btnReturn = slot0.rtInfoPanel:Find("return")

	onButton(slot0, slot0.btnReturn, function ()
		uv0:emit(uv1.ReturnCall, uv0.entrance)
	end, SFX_CONFIRM)
end

function slot0.OnDestroy(slot0)
end

function slot0.Show(slot0)
	setActive(slot0._tf, true)
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)
end

function slot0.Setup(slot0, slot1, slot2, slot3)
	slot0.entrance = slot1
	slot0.destMap = nowWorld:EntranceToDisplayMap(slot1)

	setAnchoredPosition(slot0.rtBasePoint, slot0._tf:InverseTransformPoint(GameObject.Find("OverlayCamera"):GetComponent(typeof(Camera)):ScreenToWorldPoint(slot2:GetMapScreenPos(Vector2(slot1.config.area_pos[1], slot1.config.area_pos[2])))))
	slot0:UpdatePanel(slot3)
end

function slot0.UpdatePanel(slot0, slot1)
	slot2 = nowWorld
	slot6 = World.ReplacementMapType(slot0.entrance, slot0.destMap) == "complete_chapter" and "safe" or WorldConst.GetMapIconState(slot4.config.entrance_ui)

	setImageSprite(slot0.rtBasePoint, getImageSprite(slot0.rtRes:Find(slot0.rtBasePoint.name .. "/" .. slot6)), true)
	setImageSprite(slot0.rtInfoPanel, getImageSprite(slot0.rtRes:Find(slot0.rtInfoPanel.name .. "/" .. slot6)))
	setImageSprite(slot0.rtInfoPanel:Find("icon"), GetSpriteFromAtlas("world/mapicon/" .. slot4.config.entrance_mapicon, ""))
	setImageSprite(slot0.btnBack, getImageSprite(slot0.rtRes:Find(slot0.btnBack.name .. "/" .. slot6)), true)
	setImageSprite(slot0.btnEnter, getImageSprite(slot0.rtRes:Find(slot0.btnEnter.name .. "/" .. slot6)), true)
	setImageSprite(slot0.rtPressingMark, getImageSprite(slot0.rtRes:Find(slot0.rtPressingMark.name .. "/" .. slot6)), true)
	setActive(slot0.rtPressingMark, slot5 == "complete_chapter" or slot4.isPressing)
	setActive(slot0.rtInfoPanel:Find("sairen"), slot5 == "sairen_chapter")
	setText(slot0.rtInfoPanel:Find("danger_text"), slot4:IsMapOpen() and slot4:GetDanger() or "?")
	changeToScrollText(slot0.rtInfoPanel:Find("title/name"), slot4:GetName(slot0.entrance:GetBaseMap()))

	slot9, slot10, slot11 = slot2:CountAchievements(slot0.entrance)

	setText(slot0.rtInfoPanel:Find("title/achievement/number"), slot9 + slot10 .. "/" .. slot11)
	setActive(slot0.rtInfoPanel:Find("pressing_award"), slot2:GetPressingAward(slot4.id) and slot12.flag)

	if slot12 and slot12.flag then
		slot0.awardConfig = pg.world_event_complete[slot12.id].tips_icon

		slot0.awardItemList:align(#slot0.awardConfig)
	end

	slot0:UpdateCost()

	slot14 = slot0.entrance

	if slot7 then
		if slot1 then
			setActive(slot0.btnBack, nowWorld:GetAtlas():GetActiveEntrance() == slot14 or slot0.destMap.isCost)
			setActive(slot0.btnEnter, not isActive(slot0.btnBack) and slot13.transportDic[slot14.id])
			setText(slot0.btnLock:Find("Text"), i18n("world_map_locked_border"))
		else
			setActive(slot0.btnBack, slot15 == slot14)
			setActive(slot0.btnEnter, false)
		end

		setActive(slot0.btnLock, slot1 and not isActive(slot0.btnBack) and not isActive(slot0.btnEnter))
		setActive(slot0.btnReturn, not slot1 and not isActive(slot0.btnBack) and not isActive(slot0.btnEnter))
	else
		if slot1 then
			setText(slot0.btnLock:Find("Text"), i18n("world_map_locked_stage"))
		end

		setActive(slot0.btnBack, false)
		setActive(slot0.btnEnter, false)
		setActive(slot0.btnLock, slot1)
		setActive(slot0.btnReturn, not slot1)
	end
end

function slot0.UpdateCost(slot0)
	slot1 = slot0.btnEnter:Find("cost")

	setActive(slot1, not slot0.destMap.isCost)

	slot2 = nowWorld.staminaMgr:GetTotalStamina()

	setText(slot1:Find("Text"), setColorStr(slot2, slot2 < slot0.destMap.config.enter_cost and COLOR_RED or COLOR_GREEN) .. "/" .. slot3)
end

return slot0
