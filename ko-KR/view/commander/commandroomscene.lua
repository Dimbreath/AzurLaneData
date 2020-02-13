slot0 = class("CommandRoomScene", import("..base.BaseUI"))
slot0.MODE_VIEW = 1
slot0.MODE_SELECT = 2
slot0.SELECT_MODE_SINGLE = 1
slot0.SELECT_MODE_MULTI = 2

function slot0.getUIName(slot0)
	return "CommandRoomUI"
end

function slot0.setBoxes(slot0, slot1)
	slot0.boxes = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
	slot0.commanderBagMax = slot0.playerVO.commanderBagMax

	slot0:updateCapcity()
	slot0:updateGold()
end

function slot0.setCommanders(slot0, slot1)
	slot0.commanderVOs = slot1

	slot0:updateCapcity()
end

function slot0.setReserveBoxCnt(slot0, slot1)
	slot0.reserveBoxCnt = slot1

	slot0:updateReserveBtn(slot0)
	slot0.reservePanel:ActionInvoke("Update", slot0.reserveBoxCnt, slot0.playerVO)
end

function slot0.setPools(slot0, slot1)
	slot0.pools = slot1

	slot0:updateRes()
end

function slot0.init(slot0)
	slot0.bgTF = slot0:findTF("background"):GetComponent(typeof(Image))
	slot0.topPanel = slot0:findTF("blur_panel/top")
	slot0.mainTF = slot0:findTF("blur_panel/main")
	slot0.rightPanel = slot0:findTF("blur_panel/main/right_panel")
	slot0.leftPanel = slot0:findTF("blur_panel/main/left_panel")

	setActive(slot0.leftPanel, false)

	slot0.leftPanelCG = slot0.leftPanel:GetComponent(typeof(CanvasGroup))
	slot0.eyeTF = slot0:findTF("eye", slot0.leftPanel)
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.backBtn = slot0:findTF("blur_panel/top/back_btn")
	slot0.paintingTF = slot0:findTF("paint_panel/paint")
	slot0.commandersPanel = slot0:findTF("commanders", slot0.rightPanel)
	slot0.selctedPanel = slot0:findTF("commanders/bottom", slot0.rightPanel)
	slot0.selectedNumTxt = slot0:findTF("commanders/bottom/value/Text", slot0.rightPanel):GetComponent(typeof(Text))
	slot0.selectedBtn = slot0:findTF("commanders/bottom/select_btn", slot0.rightPanel)
	slot0.cancelBtn = slot0:findTF("commanders/bottom/cancel_btn", slot0.rightPanel)
	slot0.ascBtn = slot0:findTF("commanders/top/asc_btn", slot0.rightPanel)
	slot0.sortBtn = slot0:findTF("commanders/top/sort_btn", slot0.rightPanel)
	slot0.boxTF = slot0:findTF("commanders/box", slot0.rightPanel)
	slot0.boxClickTF = slot0:findTF("click", slot0.boxTF)
	slot0.capcity = slot0.boxTF:Find("capcity/Text")
	slot0.resPanel = slot0:findTF("blur_panel/top/res/bg")
	slot0.goldTxt = slot0:findTF("blur_panel/top/res/bg/gold/Text")
	slot0.toggles = {
		slot0:findTF("blur_panel/main/left_panel/toggles/play"),
		slot0:findTF("blur_panel/main/left_panel/toggles/talent")
	}
	slot0.mode = slot0.contextData.mode or slot0.MODE_VIEW
	slot0.sortData = slot0.contextData.sortData or CommandRoomScene.sortData or {
		asc = true,
		sortData = "id",
		nationData = {},
		rarityData = {}
	}
	slot0.onCommander = slot0.contextData.onCommander or function (slot0)
		return true
	end
	slot0.onSelected = slot0.contextData.onSelected or function (slot0, slot1)
		slot1()
	end
	slot0.onQuit = slot0.contextData.onQuit or function ()
		return
	end

	setActive(slot0.selctedPanel, slot0.mode == slot0.MODE_SELECT)
	eachChild(slot0.sortBtn, function (slot0)
		setActive(slot0, go(slot0).name == slot0.sortData.sortData)
	end)
	setActive(slot0.boxTF, slot0.mode == slot0.MODE_VIEW)

	slot0.isMultSelectMode = slot0.mode == slot0.MODE_SELECT and slot0.contextData.maxCount > 1

	if slot0.isMultSelectMode then
		setActive(slot0.topPanel, false)
		onButton(slot0, go(slot0.bgTF), function ()
			slot0:emit(slot1.ON_BACK)
		end, SOUND_BACK)
	end

	slot0.indexPanel = CommanderIndexPage.New(pg.UIMgr.GetInstance().OverlayMain, slot0.event)
	slot0.treePage = CommanderTreePage.New(pg.UIMgr.GetInstance().OverlayMain, slot0.event)
	slot0.renamePanel = CommanderRenamePage.New(pg.UIMgr.GetInstance().OverlayMain, slot0.event)
	slot0.msgboxPage = CommanderMsgBoxPage.New(pg.UIMgr.GetInstance().OverlayMain, slot0.event)
	slot0.reservePanel = CommanderReservePage.New(pg.UIMgr.GetInstance().OverlayMain, slot0.event)
	slot0.detailPage = CommanderDetailPage.New(slot0.mainTF, slot0.event, slot0.contextData)
	slot0.boxesPanel = CommanderBoxesPage.New(pg.UIMgr.GetInstance().OverlayMain, slot0.event)

	slot0:enterAnim(function ()
		if slot0.isMultSelectMode then
			setParent(slot0.rightPanel, pg.UIMgr.GetInstance().OverlayMain, true)

			slot0.rightPanel.localPosition = Vector3(setParent.rightPanel.localPosition.x, setParent.rightPanel.localPosition.y, 0)
		end

		slot0:tryPlayStroy()
	end)
end

function slot0.finishStroy(slot0, slot1)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = slot1
	})
end

function slot0.tryPlayStroy(slot0)
	pg.SystemGuideMgr.GetInstance():PlayCommander()
end

function slot0.updateRes(slot0)
	for slot4, slot5 in pairs(slot0.pools) do
		setText(slot0.resPanel:Find(slot5.id).Find(slot6, "Text"), slot5:getItemCount())
	end
end

function slot0.updateReserveBtn(slot0)
	if not slot0.boxTF then
		return
	end

	if not IsNil(slot0:findTF("reserve_btn/Text", slot0.boxTF)) then
		setText(slot1, CommanderConst.MAX_GETBOX_CNT - slot0.reserveBoxCnt .. "/" .. CommanderConst.MAX_GETBOX_CNT)
		setActive(slot0:findTF("reserve_btn/free", slot0.boxTF), slot0.reserveBoxCnt == 0)
	end
end

function slot0.UpdateBoxesBtn(slot0)
	if not IsNil(slot0:findTF("boxes_btn/tip/Text", slot0.boxTF)) then
		slot2 = 0

		for slot7, slot8 in ipairs(slot3) do
			print("v:" .. slot8:getState())
		end

		setText(slot1, #slot3)
		setActive(slot0:findTF("boxes_btn/tip", slot0.boxTF), _.any(slot0.boxes, function (slot0)
			return slot0:getState() == CommanderBox.STATE_FINISHED or slot0:getState() == CommanderBox.STATE_EMPTY
		end))
	end
end

function slot0.updateBoxes(slot0)
	if slot0.boxesPanel:GetLoaded() and slot0.boxes then
		slot0.boxesPanel:ActionInvoke("Update", slot0.boxes, slot0.pools)
	end

	slot0:UpdateBoxesBtn()
end

function slot0.initBoxes(slot0)
	slot0:updateCapcity()
	slot0:UpdateBoxesBtn()
	onButton(slot0, slot0:findTF("reserve_btn", slot0.boxTF), function ()
		if slot0.reservePanel:GetLoaded() then
			slot0()
		else
			slot0.reservePanel:Load()
			slot0.reservePanel:AddLoadedCallback(slot0)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("boxes_btn", slot0.boxTF), function ()
		if slot0.boxesPanel:GetLoaded() then
			slot0()
		else
			slot0.boxesPanel:Load()
			slot0.boxesPanel:AddLoadedCallback(slot0)
		end
	end, SFX_PANEL)
end

function slot0.OnReserveDone(slot0, slot1)
	slot0.reservePanel:ActionInvoke("setBlock", true)
	seriesAsync({
		function (slot0)
			slot0.reservePanel:ActionInvoke("playAnim", slot0.reservePanel.ActionInvoke, slot0)
		end,
		function (slot0)
			slot0:emit(slot1.ON_AWARD, {
				items = slot0
			})
			slot0:updateRes()
			slot0.reservePanel:ActionInvoke("setBlock", false)
		end
	})
end

function slot0.updateCapcity(slot0)
	if slot0.commanderBagMax and slot0.commanderVOs and slot0.capcity then
		setText(slot0.capcity, table.getCount(slot0.commanderVOs) .. "/" .. slot0.commanderBagMax)
	end
end

function slot0.updateGold(slot0)
	if slot0.goldTxt then
		setText(slot0.goldTxt, slot0.playerVO.gold)
	end
end

slot1 = 0.3

function slot0.enterAnim(slot0, slot1)
	slot0.leftPanelCG.alpha = 0

	LeanTween.value(go(slot0.leftPanel), 0, 1, slot0):setOnUpdate(System.Action_float(function (slot0)
		if slot0.leftPanelCG then
			slot0.leftPanelCG.alpha = slot0
		end
	end)):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end
	end))
end

function slot0.exitAnim(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	LeanTween.moveLocalX(go(slot0.rightPanel), 2110, slot0):setFrom(960):setOnComplete(System.Action(slot1))

	return
	--- END OF BLOCK #0 ---



end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-13, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0.toggles) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		onButton(slot0, slot5, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0:SwitchPage(slot0)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-13, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-32, warpins: 1 ---
	slot0.helpBtn = slot0:findTF("help_btn", slot0.leftPanel)

	onButton(slot0, slot0.helpBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_command_room.tip
		})

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	setActive(slot0.helpBtn, slot0.MODE_VIEW == slot0.mode)
	onButton(slot0, slot0.eyeTF, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:paintingView()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 36-47, warpins: 2 ---
	if slot0.MODE_VIEW == slot0.mode then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-50, warpins: 1 ---
		slot0:initBoxes()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 51-54, warpins: 2 ---
	slot0.selecteds = slot0.contextData.selectedIds or {}

	onButton(slot0, slot0.ascBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-35, warpins: 1 ---
		slot0.sortData.asc = not slot0.sortData.asc

		setActive(slot0.ascBtn:Find("asc"), slot0.sortData.asc)
		setActive(slot0.ascBtn:Find("desc"), not slot0.sortData.asc)
		setActive:updateCommanders()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.sortBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		if slot0.indexPanel:GetLoaded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-22, warpins: 1 ---
			slot0.indexPanel:Load()
			slot0.indexPanel:AddLoadedCallback(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:exitAnim(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0:emit(slot1.ON_BACK)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.selectedBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 2 ---
		if (slot0.contextData.minCount or 1) > #slot0.contextData.minCount or 1.selecteds then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-23, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_select_min_cnt", slot0))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-30, warpins: 1 ---
		slot0.onSelected(slot0.selecteds, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			triggerButton(slot0.backBtn)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-31, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(slot0.backBtn)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.activeCommanderId = slot0.contextData.activeCommander and slot0.contextData.activeCommander.id
	slot0.conmmanderId = CommandRoomScene.commanderId or slot0.contextData.conmmanderId
	CommandRoomScene.commanderId = nil

	slot0:initCommandersPanel()
	triggerButton(slot0.ascBtn, true)
	slot0:updateGold()

	return
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 56-90, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 94-98, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 101-116, warpins: 2 ---
	--- END OF BLOCK #7 ---



end

function slot0.paintingView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if LeanTween.isTweening(slot0.topPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-61, warpins: 1 ---
	slot0.detailPage:tweenHide(slot1)
	slot0.detailPage:onPaintingView()
	LeanTween.moveY(rtf(slot0.topPanel), slot0.topPanel.localPosition.y - 300, slot1)
	LeanTween.moveX(rtf(slot0.leftPanel), -300, slot1)
	LeanTween.moveX(rtf(slot0.rightPanel), 1000, slot1)
	LeanTween.moveX(rtf(slot0.paintingTF), 0, slot1):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-75, warpins: 1 ---
		slot0 = GetOrAddComponent(slot0.bgTF, "MultiTouchZoom")

		slot0:SetZoomTarget(slot0.paintingTF)

		slot1 = GetOrAddComponent(slot0.bgTF, "EventTriggerListener")
		slot0.enabled = true
		slot1.enabled = true

		onButton(slot0, slot0.bgTF, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			GetOrAddComponent(slot0.bgTF, "MultiTouchZoom").enabled = false
			false.enabled = false

			slot0:MainView()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		slot3 = slot0.paintingTF.anchoredPosition.x
		slot4 = slot0.paintingTF.anchoredPosition.y
		slot7 = slot0._tf.rect.width / UnityEngine.Screen.width
		slot8 = slot0._tf.rect.height / UnityEngine.Screen.height
		slot9 = slot0.paintingTF.rect.width / 2
		slot10 = slot0.paintingTF.rect.height / 2
		slot11, slot12 = nil
		slot13 = true
		slot14 = false

		slot1:AddPointDownFunc(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if Input.touchCount == 1 or Application.isEditor then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-11, warpins: 2 ---
				slot0 = true
				slot1 = true
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-16, warpins: 1 ---
				if Input.touchCount >= 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-18, warpins: 1 ---
					slot1 = false
					slot0 = false
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 19-19, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1:AddPointUpFunc(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if Input.touchCount <= 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-6, warpins: 1 ---
				slot0 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 7-7, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1:AddBeginDragFunc(function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-24, warpins: 1 ---
			slot0 = false
			slot5 = slot1.position.x *  - slot1.position.x - slot4.localPosition.x.position.y * slot6 - slot7 - slot4.localPosition.y

			return
			--- END OF BLOCK #0 ---



		end)
		slot1:AddDragFunc(function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-28, warpins: 1 ---
				slot1.paintingTF.localPosition = Vector3(slot1.position.x * slot2 - slot3 - slot4, slot1.position.y * slot5 -  - slot1.position.y * slot5, -22)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-29, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 62-62, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.MainView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if LeanTween.isTweening(slot0.topPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-59, warpins: 2 ---
	slot0.detailPage:onExitPaintingView()
	LeanTween.moveY(rtf(slot0.topPanel), 0, slot1)
	LeanTween.moveX(rtf(slot0.leftPanel), 0, slot1)
	LeanTween.moveX(rtf(slot0.rightPanel), 0, slot1)

	slot0.paintingTF.localPosition = Vector3(slot0.paintingTF.localPosition.x, -58, 0)

	LeanTween.moveX(rtf(slot0.paintingTF), -535, 0.5)
	slot0.detailPage:tweenShow(0.5)

	return
	--- END OF BLOCK #1 ---



end

function slot0.SwitchPage(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0.commanderVOs[slot0.conmmanderId].inBattle and slot1 == CommanderInfoScene.PAGE_PLAY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-21, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_battle"))

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-29, warpins: 3 ---
	slot0:emit(CommandRoomMediator.ON_DETAIL, slot2, slot1)

	return
	--- END OF BLOCK #1 ---



end

function slot0.opeRenamePanel(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		slot0:openMsgBox({
			content = i18n("commander_rename_warning", slot0),
			onYes = function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				slot0:emit(CommandRoomMediator.ON_RENAME, slot1.id, )

				return
				--- END OF BLOCK #0 ---



			end
		})

		return
		--- END OF BLOCK #0 ---



	end

	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.renamePanel:ActionInvoke("Show", slot0.renamePanel, )

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.renamePanel:GetLoaded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		slot3()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-20, warpins: 1 ---
		slot0.renamePanel:Load()
		slot0.renamePanel:AddLoadedCallback(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-22, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.closeRenamePanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.renamePanel:ActionInvoke("Hide")

	return
	--- END OF BLOCK #0 ---



end

function slot0.initCommandersPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0.commanderRect = slot0.commandersPanel:Find("frame/frame"):GetComponent("LScrollRect")
	slot0.cards = {}

	function slot0.commanderRect.onInitItem(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot1 = CommamderCard.New(slot0)

		onButton(slot0, slot1.infoTF, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if not slot0.commanderVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-12, warpins: 2 ---
			if slot1.contextData.mode == slot2.MODE_SELECT then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-19, warpins: 1 ---
				slot1:checkCommander(slot0.commanderVO)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-35, warpins: 1 ---
				slot0:selectedAnim()
				setActive(slot0.mark2, true)

				if slot1.conmmanderId == slot0.commanderVO.id then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-36, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 37-54, warpins: 2 ---
				slot1.conmmanderId = slot0.commanderVO.id
				slot1.contextData.conmmanderId = slot0.commanderVO.id.conmmanderId

				slot0.commanderVO.id.conmmanderId:updateCommanderInfo()

				if slot1.card then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-60, warpins: 1 ---
					setActive(slot1.card.mark2, false)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 61-63, warpins: 2 ---
				slot1.card = slot1
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 64-64, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end, SFX_PANEL)
		onButton(slot0, slot1.quitTF, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if not slot0.commanderVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-10, warpins: 1 ---
			if slot0.commanderVO.id == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot1.onQuit(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					slot0:emit(slot1.ON_BACK)

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 15-15, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 16-16, warpins: 2 ---
			--- END OF BLOCK #3 ---



		end, SFX_PANEL)

		slot0.cards[slot0] = slot1

		return
		--- END OF BLOCK #0 ---



	end

	function slot0.commanderRect.onUpdateItem(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if not slot0.cards[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-13, warpins: 1 ---
			slot0.cards[slot1] = CommamderCard.New(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-30, warpins: 2 ---
		slot2:update(slot0.disPlayCommanderVOs[slot0 + 1])
		slot2:clearSelected()

		if slot0.mode == slot1.MODE_VIEW and slot0.conmmanderId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-36, warpins: 1 ---
			if slot3 and slot3.id == slot0.conmmanderId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-45, warpins: 1 ---
				if slot0.card then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 46-51, warpins: 1 ---
					setActive(slot0.card.mark2, false)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 52-61, warpins: 2 ---
				triggerButton(slot2.infoTF)
				slot0:updateCommanderInfo()

				slot0.card = slot2
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-67, warpins: 2 ---
			if slot0.mode == slot1.MODE_VIEW and not slot0.conmmanderId and slot0 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 74-77, warpins: 1 ---
				triggerButton(slot2.infoTF)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-83, warpins: 3 ---
				if slot0.mode == slot1.MODE_SELECT and slot0.conmmanderId and slot0.contextData.maxCount == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 93-95, warpins: 1 ---
					if slot2.commanderVO and slot2.commanderVO.id == slot0.conmmanderId then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 102-107, warpins: 1 ---
						slot0:checkCommander(slot2.commanderVO)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-113, warpins: 3 ---
					if slot0.mode == slot1.MODE_SELECT and not slot0.activeCommanderId and slot0.contextData.maxCount == 1 and slot0 == 0 and slot2.commanderVO ~= nil then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 128-130, warpins: 1 ---
						triggerButton(slot2.infoTF)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 131-136, warpins: 13 ---
		if slot0.mode == slot1.MODE_SELECT and slot0.contextData.activeGroupId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 142-152, warpins: 1 ---
			setActive(slot2.expUp, slot2.commanderVO:isSameGroup(slot0.contextData.activeGroupId))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 153-156, warpins: 3 ---
		setActive(slot2.formationTF, slot3 and slot3.inFleet and not slot3.inBattle)
		setActive(slot2.inbattleTF, slot3 and slot3.inBattle)
		setActive(slot2.mark2, slot2.commanderVO and slot0.conmmanderId == slot2.commanderVO.id)
		setActive(slot2.mark1, (slot2.commanderVO and table.contains(slot0.selecteds, slot2.commanderVO.id) and not slot0.mode == slot1.MODE_SELECT) or (slot0.isMultSelectMode and slot2.commanderVO and table.contains(slot0.selecteds, slot2.commanderVO.id)))

		return
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 162-166, warpins: 3 ---
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 168-173, warpins: 2 ---
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 183-188, warpins: 3 ---
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 223-224, warpins: 5 ---
		--- END OF BLOCK #7 ---



	end

	if slot0.mode == slot0.MODE_SELECT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 1 ---
		function slot0.commanderRect.onStart()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.contextData.activeCommander then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-12, warpins: 1 ---
				slot0:updateCommanderInfo(slot0.contextData.activeCommander)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-16, warpins: 2 ---
			if slot0.isMultSelectMode then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-20, warpins: 1 ---
				slot0:updateSelecteds()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 21-25, warpins: 2 ---
			slot0:updateSelectCntTxt()

			return
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-28, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.checkCommander(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = slot1
	slot3 = slot0.contextData.maxCount or table.getCount(slot0.commanderVOs)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-16, warpins: 2 ---
	if table.contains(slot0.selecteds, slot2.id) and slot3 == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-22, warpins: 1 ---
		slot0:updateSelecteds()

		return
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 0 ---
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-30, warpins: 2 ---
		if table.contains(slot0.selecteds, slot2.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-44, warpins: 1 ---
			table.remove(slot0.selecteds, table.indexof(slot0.selecteds, slot2.id))
			slot0:updateSelecteds()

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 45-52, warpins: 2 ---
	slot4, slot5 = slot0.onCommander(slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-18, warpins: 0 ---
		for slot3, slot4 in ipairs(slot0.selecteds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-9, warpins: 1 ---
			if slot4 == slot1.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-16, warpins: 1 ---
				table.remove(slot0.selecteds, slot3)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-17, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-18, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-23, warpins: 2 ---
		slot0:updateSelecteds()

		return
		--- END OF BLOCK #2 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0:emit(CommandRoomMediator.ON_REMARK)
		slot0.emit:updateCommanders()
		slot0.emit.updateCommanders:updateSelecteds()

		return
		--- END OF BLOCK #0 ---



	end, slot0)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-62, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(slot5)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 63-64, warpins: 2 ---
	if slot3 == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-82, warpins: 1 ---
		slot0.conmmanderId = slot1.id
		slot0.contextData.conmmanderId = slot1.id

		slot0:updateCommanderInfo()
		table.remove(slot0.selecteds, #slot0.selecteds)

		if slot0.contextData.activeCommander then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 83-91, warpins: 1 ---
			slot0.detailPage:ActionInvoke("updatePreviewAddition", slot0.contextData.activeCommander, true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 92-95, warpins: 1 ---
		if slot3 <= #slot0.selecteds then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 96-107, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_select_max"))

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 108-117, warpins: 4 ---
	table.insert(slot0.selecteds, slot1.id)
	slot0:updateSelecteds()

	return
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 118-118, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 119-119, warpins: 2 ---
	--- END OF BLOCK #6 ---



end

function slot0.updateSelecteds(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = slot0.contextData.maxCount or table.getCount(slot0.commanderVOs)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-12, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-33, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		if slot6.commanderVO then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-23, warpins: 1 ---
			setActive((slot1 == 1 and slot6.mark2) or slot6.mark1, table.contains(slot0.selecteds, slot6.commanderVO.id))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-31, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-33, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-40, warpins: 1 ---
	slot0:updateSelectCntTxt()

	if slot0.contextData.activeCommander then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-50, warpins: 1 ---
		slot2 = Clone(slot0.contextData.activeCommander)
		slot3 = 0

		if slot0.contextData.maxCount > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-56, warpins: 1 ---
			slot3 = CommanderPlayPanel.getSkillExpAndCommanderExp(slot2, slot0.selecteds)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-69, warpins: 2 ---
		slot2:addExp(slot3)
		slot0.detailPage:ActionInvoke("updatePreView", slot2, slot0.contextData.maxCount == 1)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 73-73, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 74-74, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

function slot0.updateSelectCntTxt(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0.selectedNumTxt.text = #slot0.selecteds .. "/" .. (slot0.contextData.maxCount or table.getCount(slot0.commanderVOs))

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-16, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

function slot0.updateBg(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0.bg ~= slot1:getConfig("bg") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		slot0.bg = slot2
		slot0.bgTF.sprite = LoadSprite("bg/commander_bg_" .. slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.updateCommanderInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = nil

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		slot2 = slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		if not slot0.conmmanderId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-9, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-12, warpins: 2 ---
		slot2 = slot0.commanderVOs[slot0.conmmanderId]
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-23, warpins: 2 ---
	slot0.detailPage:ActionInvoke("Update", slot2)

	if slot0.mode == slot0.MODE_SELECT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-29, warpins: 1 ---
		slot0.detailPage:ActionInvoke("ToggleOn")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-35, warpins: 1 ---
		if slot2:getTalentPoint() > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-44, warpins: 1 ---
			setText(slot0.toggles[2]:Find("tip/Text"), slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-54, warpins: 2 ---
		setActive(slot0.toggles[2]:Find("tip"), slot3 > 0)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 58-58, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 59-65, warpins: 2 ---
	setActive(slot0.leftPanel, slot0.mode ~= slot0.MODE_SELECT)
	slot0:updateBg(slot2)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 69-76, warpins: 2 ---
	if slot0.painting then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 77-83, warpins: 1 ---
		retPaintingPrefab(slot0.paintingTF, slot0.painting:getPainting())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 84-92, warpins: 2 ---
	setPaintingPrefab(slot0.paintingTF, slot2:getPainting(), "info")

	slot0.painting = slot2

	return
	--- END OF BLOCK #4 ---



end

function slot0.updateCommanders(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.disPlayCommanderVOs = {}
	slot1 = slot0.sortData

	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if #slot0.nationData > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-15, warpins: 1 ---
			return table.contains(slot0.nationData, slot0:getConfig("nationality"))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	function slot3(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if #slot0.rarityData > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-14, warpins: 1 ---
			return table.contains(slot0.rarityData, slot0:getRarity())
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-37, warpins: 0 ---
	for slot7, slot8 in pairs(slot0.commanderVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 2 ---
		if not table.contains(slot0.contextData.ignoredIds or {}, slot8.id) and slot2(slot8) and slot3(slot8) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-35, warpins: 1 ---
			table.insert(slot0.disPlayCommanderVOs, slot8)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-37, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-45, warpins: 1 ---
	table.sort(slot0.disPlayCommanderVOs, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-14, warpins: 2 ---
		if ((slot0.inFleet and 1) or 0) == ((slot1.inFleet and 1) or 0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-32, warpins: 2 ---
			if ((slot0.activeCommanderId == slot0.id and 1) or 0) == ((slot0.activeCommanderId == slot1.id and 1) or 0) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-36, warpins: 1 ---
				if slot1.sortData == "id" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-40, warpins: 1 ---
					if slot1.asc then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 41-45, warpins: 1 ---
						slot6 = {
							slot0.configId < slot1.configId
						}

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 49-51, warpins: 2 ---
						if not slot6 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 52-56, warpins: 2 ---
							slot6 = {
								slot1.configId < slot0.configId
							}
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 60-60, warpins: 2 ---
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 61-63, warpins: 2 ---
					return slot6[1]
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 64-79, warpins: 1 ---
					if slot0["get" .. slot1.sortData](slot0) == slot1["get" .. slot1.sortData](slot1) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 80-83, warpins: 1 ---
						if slot1.asc then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 84-88, warpins: 1 ---
							slot8 = {
								slot0.configId < slot1.configId
							}

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 92-94, warpins: 2 ---
							if not slot8 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 95-99, warpins: 2 ---
								slot8 = {
									slot1.configId < slot0.configId
								}
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 103-103, warpins: 2 ---
								--- END OF BLOCK #1 ---



							end
							--- END OF BLOCK #1 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 104-106, warpins: 2 ---
						return slot8[1]
						--- END OF BLOCK #1 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 107-110, warpins: 1 ---
						if slot1.asc then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 111-113, warpins: 1 ---
							slot8 = {
								slot6 < slot7
							}

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 117-119, warpins: 2 ---
							if not slot8 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 120-122, warpins: 2 ---
								slot8 = {
									slot7 < slot6
								}
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 126-126, warpins: 2 ---
								--- END OF BLOCK #1 ---



							end
							--- END OF BLOCK #1 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 127-129, warpins: 2 ---
						return slot8[1]
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 130-131, warpins: 1 ---
				return slot5 < slot4
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 135-136, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 137-138, warpins: 1 ---
			return slot3 < slot2
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 142-142, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 143-143, warpins: 5 ---
		return
		--- END OF BLOCK #1 ---



	end)

	if slot0.activeCommanderId and slot0.contextData.maxCount == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-55, warpins: 1 ---
		table.insert(slot0.disPlayCommanderVOs, 1, {
			id = 0
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 56-60, warpins: 3 ---
	if slot0.mode == slot0.MODE_VIEW then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-66, warpins: 1 ---
		slot5 = #slot0.disPlayCommanderVOs + ((#slot0.disPlayCommanderVOs % 4 > 0 and 4 - #slot0.disPlayCommanderVOs % 4) or 0)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 74-79, warpins: 2 ---
		if slot0.conmmanderId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 80-84, warpins: 1 ---
			slot6 = 0

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 85-92, warpins: 0 ---
			for slot10, slot11 in ipairs(slot0.disPlayCommanderVOs) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-88, warpins: 1 ---
				if slot11.id == slot0.conmmanderId then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 89-90, warpins: 1 ---
					slot6 = slot10

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 91-91, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 91-92, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 93-110, warpins: 2 ---
			slot0.commanderRect:SetTotalCount(math.max(12, slot5), math.floor(slot6 / 4) / (#slot0.disPlayCommanderVOs / 4) or slot0.contextData.scrollValue or 0)
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 116-117, warpins: 3 ---
			--- END OF BLOCK #3 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-129, warpins: 1 ---
			slot0.commanderRect:SetTotalCount(math.max(12, slot5), slot0.contextData.scrollValue or 0)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 131-132, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 133-137, warpins: 1 ---
		if slot0.mode == slot0.MODE_SELECT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-146, warpins: 1 ---
			slot0.commanderRect:SetTotalCount(#slot0.disPlayCommanderVOs, slot0.contextData.scrollValue or 0)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 148-148, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 149-150, warpins: 4 ---
	return
	--- END OF BLOCK #4 ---



end

function slot0.clearAllSelected(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:clearSelected()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.renamePanel.isShowMsgBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot0.renamePanel:ActionInvoke("Hide")

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 2 ---
	if slot0.isShowMsgBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-17, warpins: 1 ---
		slot0:closeMsgBox()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-20, warpins: 2 ---
	if slot0.boxesPanel and slot0.boxesPanel:isShow() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-31, warpins: 1 ---
		slot0.boxesPanel:onBackPressed()

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-37, warpins: 3 ---
	slot0:emit(slot0.ON_BACK_PRESSED)

	return
	--- END OF BLOCK #3 ---



end

function slot0.openMsgBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.isShowMsgBox = true

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0.msgboxPage:ActionInvoke("OnUpdate", slot0.msgboxPage)

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.msgboxPage:GetLoaded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-12, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		slot0.msgboxPage:Load()
		slot0.msgboxPage:AddLoadedCallback(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.closeMsgBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.isShowMsgBox = nil

	slot0.msgboxPage:ActionInvoke("Hide")

	return
	--- END OF BLOCK #0 ---



end

function slot0.openTreePanel(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0.treePage:ActionInvoke("openTreePanel", slot0.treePage)

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.treePage:GetLoaded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-19, warpins: 1 ---
		slot0.treePage:Load()
		slot0.treePage:AddLoadedCallback(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.closeTreePanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.treePage:ActionInvoke("closeTreePanel")

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:clear()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-12, warpins: 1 ---
	if slot0.painting then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-19, warpins: 1 ---
		retPaintingPrefab(slot0.paintingTF, slot0.painting:getPainting())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-24, warpins: 2 ---
	if slot0.mode == slot0.MODE_SELECT and slot0.contextData.maxCount > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-38, warpins: 1 ---
		setParent(slot0.rightPanel, slot0._tf, true)
		setActive(slot0.leftPanel, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 39-41, warpins: 3 ---
	if slot0.modelTf and slot0.prefabName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-53, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.modelTf.gameObject)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 54-100, warpins: 3 ---
	slot0.renamePanel:Destroy()
	slot0.indexPanel:Destroy()
	slot0.msgboxPage:Destroy()
	slot0.reservePanel:Destroy()
	slot0.detailPage:Destroy()
	slot0.boxesPanel:Destroy()

	slot0.contextData.sortData = slot0.sortData
	slot0.contextData.sortData.asc = not slot0.contextData.sortData.asc
	slot0.contextData.scrollValue = math.min(slot0.commanderRect.value, 1)
	CommandRoomScene.sortData = slot0.contextData.sortData

	return
	--- END OF BLOCK #5 ---



end

return slot0
