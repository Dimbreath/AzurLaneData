slot0 = class("NewyearFestivalScene", import("view.base.BaseUI"))

function slot0.getUIName(slot0)
	return "NewyearFestivalUI"
end

slot0.HUB_ID = 4

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0._closeBtn = slot0:findTF("top/back")
	slot0._homeBtn = slot0:findTF("top/home")
	slot0._helpBtn = slot0:findTF("top/help")
	slot0.ticketTimes = slot0.top:Find("ticket/text")
	slot0.yinhuace = slot0.top:Find("sign")
	slot0.yinhuaceTimes = slot0.yinhuace:Find("get")
	slot0.yinhuaceTips = slot0.yinhuace:Find("tip")
	slot0.shouce = slot0.top:Find("yinhuashouceye")
	slot0.shouce_bg = slot0.shouce:Find("bg")
	slot0.layout_shouce = slot0.shouce:Find("yinhuace/layout")
	slot0.group_get = slot0:Clone2Full(slot0.layout_shouce, 7)
	slot0.btn_receive = slot0.shouce:Find("yinhuace/receive")
	slot0.btn_shouce_help = slot0.shouce:Find("yinhuace/help")
	slot0.img_get = slot0.shouce:Find("yinhuace/get")

	setActive(slot0.shouce, false)

	slot0._map = slot0:findTF("map")
	slot0.shrine = slot0._map:Find("shrine")
	slot0.snack_street = slot0._map:Find("snack")
	slot0.divination = slot0._map:Find("divination")
	slot0.shop = slot0._map:Find("shop")
	slot0.cube = slot0._map:Find("magiccube")
	slot0.bottom2 = slot0._map:Find("bottom2")
	slot0.bottom = slot0._map:Find("bottom")
	slot0.middle = slot0._map:Find("middle")
	slot0.front = slot0._map:Find("top")
	slot0._shipTpl = slot0._map:Find("ship")
	slot0.graphPath = GraphPath.New(import("GameCfg.NewyearFestivalGraph"))
	slot0.effectReq = LoadPrefabRequestPackage.New("ui/xuedichangjing", "xuedichangjing", function (slot0)
		setParent(slot0, slot0._map, false)

		slot2 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(Canvas)).sortingOrder

		for slot7 = 0, slot0:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
			slot3[slot7].sortingOrder = slot2 + 1
		end
	end):Start()
end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-84, warpins: 1 ---
	slot1 = getProxy(MiniGameProxy)

	onButton(slot0, slot0._closeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(slot1.ON_BACK)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0._homeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(slot1.ON_HOME)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0._helpBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_newyear_feast.tip
		})

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.yinhuace, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		setActive(slot0.shouce, true)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.shouce_bg, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		setActive(slot0.shouce, false)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.btn_shouce_help, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_newyear_stamp.tip
		})

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.btn_receive, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if slot0:GetHubByHubId(slot1.HUB_ID).ultimate ~= 0 or slot0.usedtime < slot0:getConfig("reward_need") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 2 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-32, warpins: 2 ---
		slot1:emit(NewYearFestivalMediator.MINI_GAME_OPERATOR, {
			hubid = slot0.id,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})

		return
		--- END OF BLOCK #1 ---



	end)
	slot0:InitFacility(slot0.shrine, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 3)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.snack_street, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 8)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.divination, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.CYGNET_BATHROBE_PAGE_ID
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.shop, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.SKINSHOP)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:InitFacility(slot0.cube, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.GETBOAT, {
			projectName = "new",
			page = 1
		})

		return
		--- END OF BLOCK #0 ---



	end)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.top, false)

	slot0.academyStudents = {}

	slot0:InitStudents()
	slot0:UpdateView()

	if slot0.contextData.isOpenShrine then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-95, warpins: 1 ---
		slot0.contextData.isOpenShrine = nil

		pg.m02:sendNotification(GAME.GO_MINI_GAME, 3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 96-101, warpins: 2 ---
	if slot1:GetMiniGameData(3) and not slot2:GetRuntimeData("isInited") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 108-116, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.MINIGAME_OPERATION, slot0.HUB_ID, MiniGameOPCommand.CMD_SPECIAL_GAME, {
			3,
			1
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 117-118, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.UpdateView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	setText(slot0.ticketTimes, "X " .. getProxy(MiniGameProxy).GetHubByHubId(slot1, slot0.HUB_ID).count)
	setText(slot0.yinhuaceTimes, string.format("%02d", slot3))

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-36, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0.group_get) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		setActive(slot8, slot7 <= slot3)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-34, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 35-36, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-40, warpins: 1 ---
	setActive(slot0.btn_receive, slot3 >= #slot0.group_get and slot2.ultimate == 0)
	setActive(slot0.yinhuaceTips, slot3 >= #slot0.group_get and slot2.ultimate == 0)
	setActive(slot0.img_get, slot2.ultimate ~= 0)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 47-59, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 63-66, warpins: 2 ---
	if slot2.ultimate == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 67-69, warpins: 1 ---
		slot0:TryPlayStory()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 70-80, warpins: 2 ---
	setActive(slot0.snack_street:Find("tip"), slot2.count > 0)

	slot6 = slot0.shrine:Find("tip")
	slot8 = false

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 84-96, warpins: 2 ---
	if slot1:GetMiniGameData(3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-102, warpins: 1 ---
		setActive(slot6, (slot7:GetRuntimeData("count") or 0) > 0 and NewYearShrinePage.IsTip())
		setActive(slot0.divination:Find("tip"), CygnetBathrobePage.IsTip())

		return
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 104-106, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 115-130, warpins: 4 ---
	--- END OF BLOCK #7 ---



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

	if not getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		return slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	if slot3:getConfig("config_client") and slot4.ships then

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
		--- BLOCK #2 34-55, warpins: 0 ---
		while slot5 < 15 and slot6 > 0 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-34, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-54, warpins: 1 ---
			table.insert(slot1, slot4[math.random(1, slot6)])

			slot4[math.random(1, slot6)] = slot4[slot6]
			slot6 = slot6 - 1
			slot5 = slot5 + math.random(3, 5)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 55-55, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 55-55, warpins: 3 ---
	return slot1
	--- END OF BLOCK #2 ---



end

slot0.edge2area = {
	3_8 = "bottom",
	7_8 = "bottom2",
	5_6 = "front"
}

function slot0.InitStudents(slot0)

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
				--- BLOCK #0 1-23, warpins: 1 ---
				slot0._tf:SetParent(slot0[slot0.edge2area[slot1 .. "_" .. math.max(slot1, slot2)]] or slot0.middle)

				return
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 26-31, warpins: 2 ---
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

function slot0.sortStudents(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-52, warpins: 0 ---
	for slot5, slot6 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-17, warpins: 1 ---
		if slot6.childCount > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-22, warpins: 1 ---
			slot7 = {}

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-34, warpins: 0 ---
			for slot11 = 1, slot6.childCount, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-34, warpins: 2 ---
				table.insert(slot7, {
					tf = slot6:GetChild(slot11 - 1),
					index = slot11
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 35-43, warpins: 1 ---
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
			--- BLOCK #3 44-50, warpins: 0 ---
			for slot11, slot12 in ipairs(slot7) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-48, warpins: 1 ---
				slot12.tf:SetSiblingIndex(slot11 - 1)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 49-50, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 51-52, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 53-53, warpins: 1 ---
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
	--- BLOCK #3 22-26, warpins: 1 ---
	table.clear(slot0.academyStudents)

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
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0.effectReq:Stop()
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.top, slot0._tf)
	slot0:clearStudents()

	return
	--- END OF BLOCK #0 ---



end

return slot0
