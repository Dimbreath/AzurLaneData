slot0 = class("SpringFestivalTownScene", import("view.activity.TemplateMV.BackHillTemplate"))

function slot0.getUIName(slot0)
	return "SpringFestivalTownUI"
end

function slot0.getBGM(slot0)
	return "story-china"
end

slot0.HUB_ID = 5
slot0.edge2area = {
	default = "_middle",
	9_9 = "_bottom",
	4_4 = "_front"
}

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0._closeBtn = slot0:findTF("top/return_btn")
	slot0._homeBtn = slot0:findTF("top/return_main_btn")
	slot0._helpBtn = slot0:findTF("top/help_btn")
	slot0._map = slot0:findTF("map")

	for slot4 = 0, slot0._map.childCount - 1, 1 do
		slot0["_" .. go(slot5).name] = slot0._map:GetChild(slot4)
	end

	slot0._front = slot0._map:Find("top")
	slot0._middle = slot0._map:Find("middle")
	slot0._bottom = slot0._map:Find("bottom")
	slot0.containers = {
		slot0._front,
		slot0._middle,
		slot0._bottom
	}
	slot0._shipTpl = slot0._map:Find("ship")
	slot0.graphPath = GraphPath.New(import("GameCfg.SpringFestivalTownGraph"))
	slot0._upper = slot0:findTF("upper")
	slot0.usableTxt = slot0.top:Find("usable_count/Text"):GetComponent(typeof(Text))
	slot0.diedieleTF = slot0.top:Find("diediele_count")
	slot0.diedieleTxt = slot0.diedieleTF:Find("Text"):GetComponent(typeof(Text))
	slot0.effectReq = LoadPrefabRequestPackage.New("ui/map_donghuangchunjie", "map_donghuangchunjie", function (slot0)
		setParent(slot0, slot0._map, false)

		slot2 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(Canvas)).sortingOrder

		for slot7 = 0, slot0:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
			slot3[slot7].sortingOrder = slot2 + 1
		end

		slot0.mapeffect = slot0
	end):Start()

	slot0:managedTween(LeanTween.value, nil, go(slot0._map), System.Action_UnityEngine_Color(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		go(slot0._map):GetComponent(typeof(Image)).material:SetColor("_Color", slot0)

		return
		--- END OF BLOCK #0 ---



	end), Color(0, 0, 0, 0), Color(1, 1, 0, 0), 1.5):setLoopPingPong(-1)
end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-86, warpins: 1 ---
	slot1 = getProxy(MiniGameProxy)

	onButton(slot0, slot0._closeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(slot1.ON_BACK)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.diedieleTF, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.ON_OPEN_PILE_SIGNED)

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
			helps = pg.gametip.help_chunjie_feast.tip
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "kaihongbao", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SUBLAYER, Context.New({
			mediator = RedPacketMediator,
			viewComponent = RedPacketLayer,
			onRemoved = function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot0.mapeffect then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-9, warpins: 1 ---
					setActive(slot0.mapeffect, true)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 10-10, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
		}), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.mapeffect then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-9, warpins: 1 ---
				setActive(slot0.mapeffect, false)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-10, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "danianshou", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.BEAT_MONSTER_NIAN_2020
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "dafuweng", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.MONOPOLY_2020
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "diediele", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 9)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "jianzao", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.GETBOAT, {
			projectName = "new",
			page = 1
		})

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "sishu", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.COLORING)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.InitFacility(slot0._map, slot0._upper, "pifushangdian", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.SKINSHOP)

		return
		--- END OF BLOCK #0 ---



	end)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.top, false)
	slot0:InitStudents(ActivityConst.ACTIVITY_478, 3, 5)
	slot0:UpdateView()

	return
	--- END OF BLOCK #0 ---



end

function slot0.UpdateView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot1, slot2 = nil
	slot4 = getProxy(MiniGameProxy)
	slot5 = setActive
	slot6 = slot0._upper:Find("danianshou/tip")
	slot7 = getProxy(ActivityProxy).getActivityById(slot3, ActivityConst.BEAT_MONSTER_NIAN_2020) and slot2:readyToAchieve()

	slot5(slot6, slot7)
	setActive(slot0._upper:Find("dafuweng/tip"), slot3:getActivityById(ActivityConst.MONOPOLY_2020) and slot2:readyToAchieve())
	setActive(slot1, getProxy(ColoringProxy):CheckTodayTip())
	setActive(slot1, false)
	setActive(slot1, false)
	setActive(slot1, RedPacketLayer.isShowRedPoint())
	setActive(slot0._upper:Find("diediele/tip"), slot4:GetHubByHubId(slot0.HUB_ID).count > 0)
	slot0:UpdateDieDieleCnt(setActive)

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-26, warpins: 1 ---
	slot7 = slot2.readyToAchieve()
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-43, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-46, warpins: 1 ---
	slot7 = slot2.readyToAchieve()
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-110, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 111-112, warpins: 1 ---
	slot8 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-113, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 114-119, warpins: 2 ---
	--- END OF BLOCK #6 ---



end

function slot0.UpdateDieDieleCnt(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.usableTxt.text = "X" .. slot1.count
	slot0.diedieleTxt.text = slot1.usedtime .. "/" .. slot1:getConfig("reward_need")

	return
	--- END OF BLOCK #0 ---



end

function slot0.TryPlayStory(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot0.effectReq:Stop()

	slot0.mapeffect = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.top, slot0._tf)
	slot0:clearStudents()

	return
	--- END OF BLOCK #0 ---



end

return slot0
