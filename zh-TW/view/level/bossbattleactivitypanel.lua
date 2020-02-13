slot0 = class("BossBattleActivityPanel")
slot1 = pg.extraenemy_template

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.hideBtn = findTF(slot0._tf, "hide_btn")
	slot0.hideBtnImg = slot0.hideBtn:GetComponent(typeof(Image))
	slot0.hideBtnTxt = findTF(slot0.hideBtn, "Text"):GetComponent(typeof(Text))
	slot0.bgImg = findTF(slot0._tf, "panel/bg"):GetComponent(typeof(Image))
	slot0.itemContainer = findTF(slot0._tf, "panel/items")
	slot0.itemTF = findTF(slot0.itemContainer, "item_tpl")
	slot0.msgTF = findTF(slot0._tf, "panel/msg")
	slot0.msgTxt = findTF(slot0._tf, "panel/msg"):GetComponent(typeof(Text))
	slot0.processTxt = findTF(slot0._tf, "panel/process/Text"):GetComponent(typeof(Text))
	slot0.hpSlider = findTF(slot0._tf, "panel/slider"):GetComponent(typeof(Slider))
	slot0.hpSliderTxt = findTF(tf(slot0.hpSlider), "hp"):GetComponent(typeof(Text))
	slot0.nameTxt = findTF(slot0._tf, "panel/slider/Text"):GetComponent(typeof(Text))
	slot0.maskTF = findTF(slot0._tf, "panel/mask")
	slot0.timerTxt = findTF(slot0.maskTF, "Text"):GetComponent(typeof(Text))
	slot0.msgPosition = slot0.msgTF.anchoredPosition
	slot0.msgCG = slot0.msgTF:GetComponent(typeof(CanvasGroup))
	slot0.panel = findTF(slot0._tf, "panel")
	slot0.cachePosition = slot0.panel.anchoredPosition
	slot0.panelPosX = slot0.panel.anchoredPosition.x
	slot0.panelWidth = slot0.panel.rect.width
	slot0.msgTxt.text = ""
	slot0.flag = true
	slot0.msgs = {}

	onButton(slot0, slot0.hideBtn, function ()
		slot0:tweenPanel(0.2)
	end, SFX_PANEL)

	if BossBattleActivityPanel.flag == false then
		slot0:tweenPanel(0)
	end

	slot0.ulist = UIItemList.New(slot0.itemContainer, slot0.itemTF)
end

function slot0.tweenPanel(slot0, slot1)
	if LeanTween.isTweening(go(slot0.panel)) then
		return
	end

	if slot0.flag then
		LeanTween.moveX(slot0.panel, slot0.panelWidth, slot1)
	else
		LeanTween.moveX(slot0.panel, slot0.panelPosX, slot1)
	end

	slot0.flag = not slot0.flag
end

slot2 = 4

function slot0.updateMsg(slot0, slot1)
	if slot0.isTweeningMsg then
		table.insert(slot0.msgs, slot1)
	else
		slot0:tweenMsg(slot1)
	end
end

function slot0.tweenMsg(slot0, slot1)
	slot0.isTweeningMsg = true
	slot0.msgTxt.text = slot1

	LeanTween.moveY(slot0.msgTF, slot0.msgPosition.y + 40, 1):setDelay(slot0):setOnComplete(System.Action(function ()
		if LeanTween.isTweening(go(slot0.msgTF)) then
			LeanTween.cancel(go(slot0.msgTF))
		end

		slot0.msgTF.anchoredPosition = slot0.msgPosition
		slot0.msgTF.isTweeningMsg = nil
		slot0.msgTF.msgCG.alpha = 1

		if #slot0.msgTF.msgCG.msgs == 1 then
			slot0.msgTxt.text = table.remove(slot0.msgs, 1)
		elseif #slot0.msgs > 0 then
			slot0:tweenMsg(table.remove(slot0.msgs, 1))
		end
	end))
	LeanTween.value(go(slot0.msgTF), 1, 0, 1):setOnUpdate(System.Action_float(function (slot0)
		slot0.msgCG.alpha = slot0
	end)):setDelay(slot0)
end

function slot0.update(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.activityVO = slot1
	slot4 = table.indexof(slot0.activityVO:getConfig("config_data")[1] or {}, slot3)
	slot5 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-25, warpins: 2 ---
	if slot0[slot0.activityVO:getData1()].refresh_type == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-38, warpins: 1 ---
		slot5 = pg.TimeMgr.GetInstance():parseTimeFromConfig(slot0[slot3].refresh_config)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-43, warpins: 1 ---
		if slot0[slot3].refresh_type == 2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-63, warpins: 1 ---
			slot5 = pg.TimeMgr.GetInstance():parseTimeFromConfig(slot0[slot0.all[1]].refresh_config) + slot0[slot3].refresh_config[1] * 86400
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 64-66, warpins: 3 ---
	if slot0.openTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 67-72, warpins: 1 ---
		slot0.openTimer:Stop()

		slot0.openTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 73-83, warpins: 2 ---
	setActive(slot0.maskTF, pg.TimeMgr.GetInstance():GetServerTime() < slot5)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 87-89, warpins: 2 ---
	if slot6 < slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-107, warpins: 1 ---
		slot0.openTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-20, warpins: 1 ---
			slot0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot1 - pg.TimeMgr.GetInstance():GetServerTime())

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.openTimer:Start()
		slot0.openTimer.func()

		if slot2[slot4 - 1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 108-116, warpins: 1 ---
			slot0:updateBossInfo(slot7, slot0[slot7].hp)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 117-122, warpins: 1 ---
		slot0:updateBossInfo(slot3, slot0.activityVO.data2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 123-124, warpins: 3 ---
	return
	--- END OF BLOCK #5 ---



end

function slot0.updateBossInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 19-21, warpins: 2 ---
	slot0.hpSlider.value = (slot0[slot1].hp - math.min(slot2, slot0[slot1].hp)) / slot0[slot1].hp
	slot7 = slot3.background

	if slot0[slot1].hp - math.min(slot2, slot0[slot1].hp) == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-26, warpins: 1 ---
		GetSpriteFromAtlasAsync("bg/" .. (slot7 .. "_d" or slot7), "", function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot0.bgImg.sprite = slot0

			return
			--- END OF BLOCK #0 ---



		end)
		slot0.ulist:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-36, warpins: 1 ---
				updateDrop(slot2:Find("bg"), slot4)
				setActive(slot2:Find("mask"), slot1)
				setGray(slot2, slot1, true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 37-37, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot0.ulist:align(#slot3.reward_display)

		slot0.processTxt.text = slot0.activityVO:getData3()
		slot0.nameTxt.text = slot3.name
		slot0.hideBtnTxt.text = math.ceil(slot4 / slot3.hp * 100) .. "%"
		slot0.hpSliderTxt.text = slot5 .. "/" .. slot3.hp

		return
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-71, warpins: 3 ---
	--- END OF BLOCK #1 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	pg.DelegateInfo.Dispose(slot0)

	if slot0.openTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		slot0.openTimer:Stop()

		slot0.openTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-21, warpins: 2 ---
	slot0.panel.anchoredPosition = slot0.cachePosition
	BossBattleActivityPanel.flag = slot0.flag

	return
	--- END OF BLOCK #1 ---



end

return slot0
