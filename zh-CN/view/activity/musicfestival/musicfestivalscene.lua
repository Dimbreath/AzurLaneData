slot0 = class("MusicFestivalScene", import("view.base.BaseUI"))

function slot0.getUIName(slot0)
	return "MusicFestivalUI"
end

slot0.HUB_ID = 2

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0._closeBtn = slot0:findTF("top/back")
	slot0._helpBtn = slot0:findTF("top/help")
	slot0.btn_actskin = slot0.top:Find("idol_jump")
	slot0.btn_ins = slot0.top:Find("ins_jump")
	slot0._map = slot0:findTF("scrollRect/map")
	slot0.stage = slot0._map:Find("stage")
	slot0.screen = slot0._map:Find("screen")
	slot0.shop = slot0._map:Find("shop")
	slot0.painting = slot0._map:Find("painting")
	slot0.cube = slot0._map:Find("cube")
	slot0.foutain = slot0._map:Find("foutain")
	slot0.door = slot0._map:Find("door")
	slot0.bottom = slot0._map:Find("bottom")
	slot0.front = slot0._map:Find("front")
	slot0._shipTpl = slot0._map:Find("ship")
	slot0._xiefei = slot0._map:Find("model/xiefei")
	slot0._modeltip = slot0._xiefei:Find("tip")
	slot0._stageShip = slot0._map:Find("stageship")

	setActive(slot0._modeltip, false)

	slot0.graphPath = GraphPath.New(MusicFestivalGraph)
	slot0._loadingRequest = {}
	slot0._ReturnRequest = {}

	table.insert(slot0._loadingRequest, LoadPrefabRequestPackage.New("ui/" .. slot1, slot1, function (slot0)
		setParent(slot0, slot0._map)

		slot2 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(Canvas)).sortingOrder

		for slot7 = 0, slot0:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
			slot3[slot7].sortingOrder = slot2 + 1
		end
	end):Start())
end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-76, warpins: 1 ---
	onButton(slot0, slot0._closeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(slot1.ON_BACK)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0._helpBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.music_main.tip
		})

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.btn_actskin, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.MUSIC_CHUIXUE7DAY_ID
		})

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.btn_ins, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SUBLAYER, Context.New({
			viewComponent = InstagramLayer,
			mediator = InstagramMediator,
			data = {
				id = ActivityConst.IDOL_INS_ID
			}
		}))

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0._xiefei, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.MUSIC_FESTIVAL_ID
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.stage, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 6)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.screen, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.IDOL_PT_ID
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.shop, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.SHOP, {
			warp = ShopsLayer.TYPE_ACTIVITY
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.painting, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.SKINSHOP)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.cube, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.GETBOAT, {
			projectName = "new",
			page = 1
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.foutain, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot0:emit(MusicFestivalMediator.GO_SUBLAYER, Context.New({
			mediator = IdolMedalCollectionMediator,
			viewComponent = IdolMedalCollectionView,
			data = {},
			onRemoved = function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				setActive(slot0._tf, true)

				return
				--- END OF BLOCK #0 ---



			end
		}), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			setActive(slot0._tf, false)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.door, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0, slot1 = getProxy(ChapterProxy):getLastMapForActivity()
		slot2 = slot0 and getProxy(ActivityProxy):getActivityById(pg.expedition_data_by_map[slot0].on_activity)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 2 ---
		if not slot2 or slot2:isEnd() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-36, warpins: 2 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 37-48, warpins: 2 ---
		slot0:emit(MusicFestivalMediator.GO_SCENE, SCENE.LEVEL, {
			chapterId = slot1,
			mapIdx = slot0
		})

		return
		--- END OF BLOCK #2 ---



	end)

	slot0.academyStudents = {}

	slot0:InitAreaTransFunc()
	slot0:updateStudents()
	slot0:updateStageShip()
	slot0:UpdateView()

	return
	--- END OF BLOCK #0 ---



end

function slot0.UpdateView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot3 = nil

	if getProxy(ActivityProxy).getActivityById(slot1, ActivityConst.MUSIC_FESTIVAL_ID) and not slot2:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 1 ---
		slot3 = slot2:readyToAchieve()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-36, warpins: 3 ---
	setActive(slot0._modeltip, slot3)
	setActive(slot0.btn_actskin:Find("tip"), slot1:getActivityById(ActivityConst.MUSIC_CHUIXUE7DAY_ID) and not slot5:isEnd() and slot5:readyToAchieve())
	setActive(slot6, slot7)
	setActive(slot8, slot7)
	setActive(slot9, slot7)
	setActive(slot0.stage:Find("tip"), getProxy(MiniGameProxy).GetHubByHubId(slot11, slot0.HUB_ID).count > 0)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-110, warpins: 4 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 114-118, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot0.InitFacility(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	onButton(slot0, slot1, slot2)
	onButton(slot0, slot1:Find("button"), slot2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.getStudents(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1 = {}

	if not getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		return slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	if slot3:getConfig("config_client") and slot4.stage_off_ship then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-27, warpins: 1 ---
		slot5 = 0
		slot6 = #Clone(slot4)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-30, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 34-50, warpins: 0 ---
		while slot5 < 3 and slot6 > 0 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-34, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-49, warpins: 1 ---
			table.insert(slot1, slot4[math.random(1, slot6)])

			slot4[math.random(1, slot6)] = slot4[slot6]
			slot6 = slot6 - 1
			slot5 = slot5 + 1
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 50-50, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-50, warpins: 3 ---
	return slot1
	--- END OF BLOCK #2 ---



end

function slot0.InitAreaTransFunc(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.edge2area = {
		1_2 = slot0.bottom,
		2_3 = slot0.bottom,
		3_4 = slot0.bottom
	}

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateStudents(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-40, warpins: 0 ---
	for slot5, slot6 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		if not slot0.academyStudents[slot5] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-38, warpins: 1 ---
			cloneTplTo(slot0._shipTpl, slot0._map).gameObject.name = slot5
			slot8 = SummerFeastNavigationAgent.New(cloneTplTo(slot0._shipTpl, slot0._map).gameObject)

			slot8:attach()
			slot8:setPathFinder(slot0.graphPath)
			slot8:SetOnTransEdge(function (slot0, slot1, slot2)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-21, warpins: 1 ---
				slot0._tf:SetParent(slot0.edge2area[slot1 .. "_" .. math.max(slot1, slot2)] or slot0.front)

				return
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 24-29, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end)
			slot8:updateStudent(slot6)

			slot0.academyStudents[slot5] = slot8
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 39-40, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-44, warpins: 1 ---
	if #slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-58, warpins: 1 ---
		slot0.sortTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0:sortStudents()

			return
			--- END OF BLOCK #0 ---



		end, 0.2, -1)

		slot0.sortTimer:Start()
		slot0.sortTimer.func()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 59-60, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

function slot0.getStageShip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if not getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-20, warpins: 2 ---
	if slot2:getConfig("config_client") and slot3.stage_on_ship then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-30, warpins: 1 ---
		return slot4[math.random(1, slot5)], slot4.action[1]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 31-31, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.updateStageShip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1, slot2 = slot0:getStageShip()

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-15, warpins: 1 ---
		slot0._loadingRequest[slot1] = GetSpineRequestPackage.New(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-54, warpins: 1 ---
			slot0.transform.localScale = Vector3(0.5, 0.5, 1)
			slot0.transform.localPosition = Vector3.zero

			slot0.transform:SetParent(slot0._stageShip, false)
			slot0.transform:SetSiblingIndex(1)
			setActive(slot0._stageShip, true)

			slot1 = slot0:GetComponent(typeof(SpineAnimUI))

			slot1:SetAction(slot1, 0)

			slot0._loadingRequest[] = nil
			slot0._ReturnRequest[] = ReturnSpineRequestPackage.New(slot0._ReturnRequest, slot0)

			return
			--- END OF BLOCK #0 ---



		end):Start()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-17, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.sortStudents(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-50, warpins: 0 ---
	for slot5, slot6 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		if slot6.childCount > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot7 = {}

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-32, warpins: 0 ---
			for slot11 = 1, slot6.childCount, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-32, warpins: 2 ---
				table.insert(slot7, {
					tf = slot6:GetChild(slot11 - 1),
					index = slot11
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 33-41, warpins: 1 ---
			table.sort(slot7, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				if math.abs(slot2) < 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-18, warpins: 1 ---
					return slot0.index < slot1.index
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 22-23, warpins: 2 ---
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-26, warpins: 1 ---
					return slot2 > 0
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 30-30, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 31-31, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 42-48, warpins: 0 ---
			for slot11, slot12 in ipairs(slot7) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-46, warpins: 1 ---
				slot12.tf:SetSiblingIndex(slot11 - 1)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 47-48, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 49-50, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 51-51, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.clearStudents(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.sortTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.sortTimer:Stop()

		slot0.sortTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-13, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-21, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.academyStudents) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-19, warpins: 1 ---
		slot5:detach()
		Destroy(slot5._go)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-21, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-24, warpins: 1 ---
	slot0.academyStudents = {}

	return
	--- END OF BLOCK #3 ---



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

function slot0.TryPlayStory(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if "TIANHOUYUYI2" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		pg.StoryMgr.GetInstance():Play(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:clearStudents()

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-12, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._loadingRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-20, warpins: 1 ---
	table.clear(slot0._loadingRequest)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-24, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._ReturnRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-22, warpins: 1 ---
		slot5()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-24, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 25-29, warpins: 1 ---
	table.clear(slot0._ReturnRequest)

	return
	--- END OF BLOCK #4 ---



end

return slot0
