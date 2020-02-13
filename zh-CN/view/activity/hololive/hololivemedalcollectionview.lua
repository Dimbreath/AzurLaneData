slot0 = class("HololiveMedalCollectionView", import("view.base.BaseUI"))

function slot0.getUIName(slot0)
	return "HololiveMedalCollectionUI"
end

function slot0.init(slot0)
	slot0:InitData()
	slot0:FindUI()
	slot0:AddListener()
end

function slot0.didEnter(slot0)
	slot0:UpdateView()
end

function slot0.InitData(slot0)
	slot0.taskProxy = getProxy(TaskProxy)
	slot0.actMedal = getProxy(ActivityProxy).getActivityById(slot1, ActivityConst.HOLOLIVE_MEDAL_COLLECTION)
	slot0.allIDList = slot0.actMedal:getConfig("config_data")
	slot0.taskGroup = pg.activity_template[ActivityConst.HOLOLIVE_MEDAL_COLLECTION_TASK].config_data
	slot0.activatableIDList = slot0.actMedal.data1_list
	slot0.activeIDList = slot0.actMedal.data2_list
end

slot1 = {
	"mio",
	"fubuki",
	"matsuri",
	"sora",
	"shion",
	"aqua",
	"ayame",
	"purer",
	"tnt"
}
slot2 = {
	1,
	2,
	3,
	6,
	9,
	8,
	7,
	4,
	5
}

function slot0.FindUI(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.top = slot0:findTF("top")
	slot0.backBtn = slot0:findTF("back", slot0.top)
	slot0.helpBtn = slot0:findTF("help", slot0.top)
	slot0.progressText = slot0:findTF("middle/board/progress")
	slot0.taskScroll = slot0:findTF("middle/board/Scroll View")
	slot0.taskScrollBar = slot0:findTF("middle/board/Scrollbar")
	slot0.taskListItems = slot0:Clone2Full(slot0.taskScroll:Find("Content"), #slot0.taskGroup)
	slot0.medalListItems = slot0:Clone2Full(slot0:findTF("middle/console/grid"), 9)
	slot0.medalImg = slot0:findTF("middle/console/slot"):GetComponent(typeof(Image))
	slot0.medalGet = slot0:findTF("middle/console/get")
	slot0.medalGot = slot0:findTF("middle/console/got")

	for slot4 = 1, #slot0.taskGroup, 1 do
		slot0.taskListItems[slot4]:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite("ui/HololiveMedalCollectionUI_atlas", slot0[slot4])
		slot0.taskListItems[slot4].Find("icon").GetComponent(typeof(Image)).enabled = true
		slot0.medalListItems[slot1[slot4]]:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite("ui/HololiveMedalCollectionUI_atlas", slot0[slot4])
		slot0.medalListItems[slot1[slot4]].Find("icon").GetComponent(typeof(Image)).enabled = true
	end

	slot0.materialGray = LoadAny("ui/HololiveMedalCollectionUI_atlas", "gray.mat")
end

function slot0.AddListener(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:closeView()
	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.hololive_dalaozhang.tip
		})
	end, SFX_PANEL)

	slot1 = slot0:findTF("middle/board/arrow")

	onScroll(slot0, slot0.taskScroll, function (slot0)
		setActive(slot0, slot0.y > 0.001)
	end)
	onButton(slot0, slot0.medalGet, function ()
		slot0:GetFinal()
	end, SFX_PANEL)
end

function slot0.DataSetting(slot0)
	if #slot0.activatableIDList > 0 then
		slot1 = 1
		slot2 = nil

		while #slot0.activatableIDList >= 1 do
			if not table.contains(slot0.activeIDList, slot0.activatableIDList[slot1]) then
				slot2 = slot3

				break
			end

			slot1 = slot1 + 1
		end

		if slot2 then
			pg.m02:sendNotification(GAME.MEMORYBOOK_UNLOCK, {
				id = slot2,
				actId = ActivityConst.HOLOLIVE_MEDAL_COLLECTION
			})

			return true
		end
	end
end

function slot0.UpdateView(slot0)
	slot0:InitData()

	if slot0:DataSetting() then
		return
	end

	slot1 = #slot0.activeIDList == #slot0.allIDList and slot0.actMedal.data1 ~= 1
	slot2 = slot0.actMedal.data1 == 1
	slot3 = 0

	for slot7 = 1, #slot0.taskGroup, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-69, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 173-176, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 180-184, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 188-192, warpins: 2 ---
		slot11 = slot0:findTF("btn_go", slot8)
		slot12 = slot0:findTF("btn_get", slot8)
		slot13 = slot0:findTF("btn_got", slot8)
		slot14 = table.contains(slot0.activeIDList, slot0.allIDList[slot7])
		slot15 = nil
		slot16 = 0

		if slot0.taskProxy:getTaskVO(slot9) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-108, warpins: 1 ---
			setText(slot0:findTF("desc", slot8), string.gsub(string.gsub(slot10:getConfig("desc"), "$1", slot17), "$2", slot18))

			if slot10:getTaskStatus() ~= 2 or not slot0.materialGray then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 112-112, warpins: 2 ---
				slot15 = nil
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 113-125, warpins: 2 ---
			onButton(slot0, slot11, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(ActivityMediator.ON_TASK_GO, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			onButton(slot0, slot12, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(ActivityMediator.ON_TASK_SUBMIT, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 126-131, warpins: 1 ---
			slot17 = pg.task_data_template[slot9].target_num

			if not slot14 or not slot17 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 134-134, warpins: 2 ---
				slot18 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 135-162, warpins: 2 ---
			setText(slot0:findTF("desc", slot8), string.gsub(string.gsub(pg.task_data_template[slot9].desc, "$1", slot18), "$2", slot17))

			if slot14 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 163-164, warpins: 1 ---
				slot16 = 2
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 165-165, warpins: 1 ---
				slot16 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 166-172, warpins: 2 ---
			slot15 = slot0.materialGray

			onButton(slot0, slot11, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-11, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #2 ---



		end

		slot17 = setActive
		slot18 = slot11

		if slot16 ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 177-178, warpins: 1 ---
			slot19 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 179-179, warpins: 1 ---
			slot19 = true
			--- END OF BLOCK #0 ---



		end

		slot17(slot18, slot19)

		slot17 = setActive
		slot18 = slot12

		if slot16 ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 185-186, warpins: 1 ---
			slot19 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 187-187, warpins: 1 ---
			slot19 = true
			--- END OF BLOCK #0 ---



		end

		slot17(slot18, slot19)

		slot17 = setActive
		slot18 = slot13
		slot19 = slot16 == 2

		setActive(slot18, slot19)

		slot8:GetComponent(typeof(Image)).material = slot15
		slot8:Find("icon"):GetComponent(typeof(Image)).material = slot15
		slot0.medalListItems[slot0[slot7]].Find(setActive, "icon"):GetComponent(typeof(Image)).enabled = slot14
		slot18.material = (slot2 and slot0.materialGray) or nil
		slot3 = slot3 + ((slot16 == 2 and 1) or 0)
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #4 193-194, warpins: 1 ---
		slot19 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 195-195, warpins: 1 ---
			slot19 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 196-231, warpins: 2 ---
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #6 232-234, warpins: 1 ---
		if not slot0.materialGray then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 235-235, warpins: 2 ---
			slot19 = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 236-238, warpins: 2 ---
		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #8 239-240, warpins: 1 ---
		slot19 = 1

		if 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 241-241, warpins: 1 ---
			slot19 = 0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 242-244, warpins: 2 ---
		--- END OF BLOCK #9 ---



	end

	setText(slot0.progressText, slot3 .. "/9")

	slot0.medalImg.material = not slot1 and not slot2 and slot0.materialGray

	setActive(slot0.medalGet, slot1)
	setActive(slot0.medalGot, slot2)
end

function slot0.GetFinal(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if #slot0.activeIDList == #slot0.allIDList and slot0.actMedal.data1 ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-21, warpins: 1 ---
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = ActivityConst.HOLOLIVE_MEDAL_COLLECTION
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.PlayStory(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot0.actMedal:getConfig("config_client").story and not pg.StoryMgr.GetInstance():IsPlayed(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-28, warpins: 1 ---
		pg.StoryMgr.GetInstance():Play(slot2, slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-30, warpins: 2 ---
		slot1()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.Clone2Full(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = {}
	slot4 = slot1:GetChild(0)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-19, warpins: 0 ---
	for slot9 = 0, slot1.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-19, warpins: 2 ---
		table.insert(slot3, slot1:GetChild(slot9))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-23, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-35, warpins: 0 ---
	for slot9 = slot5, slot2 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-35, warpins: 2 ---
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 36-36, warpins: 1 ---
	return slot3
	--- END OF BLOCK #4 ---



end

function slot0.IsTip()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot1 = getProxy(TaskProxy)

	if getProxy(ActivityProxy):getActivityById(ActivityConst.HOLOLIVE_MEDAL_COLLECTION) and not slot2:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-34, warpins: 1 ---
		slot3 = slot2:getConfig("config_data")
		slot5 = slot2.data1_list
		slot6 = slot2.data2_list

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 35-50, warpins: 0 ---
		for slot10, slot11 in ipairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-41, warpins: 1 ---
			if slot1:getTaskVO(slot4[slot10]) and slot13:getTaskStatus() == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-48, warpins: 1 ---
				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 49-50, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 51-54, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 55-65, warpins: 0 ---
		for slot10, slot11 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-61, warpins: 1 ---
			if not table.contains(slot6, slot11) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 62-63, warpins: 1 ---
				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 64-65, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 66-69, warpins: 1 ---
		if #slot6 == #slot3 and slot2.data1 ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-74, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 75-75, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
