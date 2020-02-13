slot0 = class("RedPocketShipPage", import("...base.BaseActivityPage"))
slot1 = 7
slot2 = {
	[0] = 705.6,
	807.608,
	897.5893,
	987.5705,
	1077.552,
	1167.533,
	1257.514,
	1387.6
}

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.tip = slot0:findTF("tip")
	slot0.btn = slot0:findTF("btn")
	slot0.mainAward = slot0:findTF("main_award")
	slot0.subAward = slot0:findTF("sub_award")
	slot0.itemIcon = slot0:findTF("icon")
	slot0.slider = slot0:findTF("slider")
	slot0.uilist = UIItemList.New(slot0.subAward, slot0:findTF("1", slot0.subAward))
end

function slot0.OnFirstFlush(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.activity
	slot2 = LoadImageSpriteAsync
	slot3 = slot0:GetBgImg() or "clutter/U556"

	slot2(slot3, slot0.bg)
	onButton(slot0, slot0.tip, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.metalgearsub_help_tip.tip
		})

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.btn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-22, warpins: 1 ---
		slot0:emit(ActivityMediator.GO_SUBMARINE_RUN, slot1:getConfig("config_client").stage_ids[math.min(slot0.progess + 1, slot0.maxday)])

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.mainAward, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:emit(BaseUI.ON_DROP, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot5 = {
		type = slot0.activity:getConfig("config_client")[1][1],
		id = slot0.activity.getConfig("config_client")[1][2],
		count = slot0.activity.getConfig("config_client")[1][3]
	}

	onButton(slot0, slot0.itemIcon, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0:emit(BaseUI.ON_DROP, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	slot0.uilist:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-10, warpins: 1 ---
			if LeanTween.isTweening(slot2) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				LeanTween.cancel(slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-18, warpins: 2 ---
			if slot1 < slot0.progess then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-23, warpins: 1 ---
				setImageAlpha(slot2, 1)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-42, warpins: 1 ---
				LeanTween.alpha(slot2, 1, 1):setFrom(0.4):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-46, warpins: 1 ---
			if slot0 == UIItemList.EventExcess and LeanTween.isTweening(slot2) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-56, warpins: 1 ---
				LeanTween.cancel(slot2)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-57, warpins: 5 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 1 ---
	slot3 = "clutter/U556"
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-70, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.OnUpdateFlush(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	slot2 = pg.TimeMgr.GetInstance()
	slot0.progess = math.min(slot0.activity.data2, slot0)
	slot0.maxday = math.min(slot2:DiffDay(slot0.activity.data1, slot2:GetServerTime()) + 1, slot0)

	slot0.uilist:align(math.min(slot0.maxday, slot0 - 1))
	setSlider(slot0.slider, slot1[0], slot1[slot0], slot1[slot0.progess])

	slot3 = setActive
	slot4 = findTF(slot0.mainAward, "dis")

	if slot0.activity.data4 and slot1.data4 ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-58, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-59, warpins: 2 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 60-69, warpins: 2 ---
	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF(slot0.mainAward, "dis/lock")

	if slot0.maxday >= slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-71, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-72, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 73-82, warpins: 2 ---
	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF(slot0.mainAward, "get")

	if slot1.data4 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 83-84, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-85, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 86-89, warpins: 2 ---
	slot3(slot4, slot5)

	if slot1.data4 == 0 and slot0 <= slot0.progess then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 94-102, warpins: 1 ---
		slot0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 3,
			activity_id = slot1.id
		})
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 103-110, warpins: 2 ---
		if defaultValue(slot1.data2_list[1], 0) > 0 or defaultValue(slot1.data2_list[2], 0) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-126, warpins: 2 ---
			slot0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 2,
				activity_id = slot1.id
			})
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 127-127, warpins: 3 ---
	return
	--- END OF BLOCK #4 ---



end

function slot0.OnDestroy(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	clearImageSprite(slot0.bg)

	return
	--- END OF BLOCK #0 ---



end

return slot0
