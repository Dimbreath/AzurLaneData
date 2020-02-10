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
		slot5 = slot0._map
		slot5 = slot5:GetChild(slot4)
		slot0["_" .. go(slot5).name] = slot5
	end

	slot1 = slot0._map
	slot0._front = slot1:Find("top")
	slot1 = slot0._map
	slot0._middle = slot1:Find("middle")
	slot1 = slot0._map
	slot0._bottom = slot1:Find("bottom")
	slot1[1] = slot0._front
	slot1[2] = slot0._middle
	slot1[3] = slot0._bottom
	slot0.containers = {}
	slot1 = slot0._map
	slot0._shipTpl = slot1:Find("ship")
	slot0.graphPath = GraphPath.New(import("GameCfg.SpringFestivalTownGraph"))
	slot0._upper = slot0:findTF("upper")
	slot1 = slot0.top
	slot1 = slot1:Find("usable_count/Text")
	slot0.usableTxt = slot1:GetComponent(typeof(Text))
	slot1 = slot0.top
	slot0.diedieleTF = slot1:Find("diediele_count")
	slot1 = slot0.diedieleTF
	slot1 = slot1:Find("Text")
	slot0.diedieleTxt = slot1:GetComponent(typeof(Text))
	slot1 = LoadPrefabRequestPackage.New("ui/map_donghuangchunjie", "map_donghuangchunjie", function (slot0)
		setParent(slot0, uv0._map, false)

		slot1 = GameObject.Find("UICamera/Canvas")
		slot2 = slot1:GetComponent(typeof(Canvas)).sortingOrder

		for slot7 = 0, slot0:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
			slot3[slot7].sortingOrder = slot2 + 1
		end

		uv0.mapeffect = slot0
	end)
	slot0.effectReq = slot1:Start()
	slot1 = slot0:managedTween(LeanTween.value, nil, go(slot0._map), System.Action_UnityEngine_Color(function (slot0)
		slot1 = go(uv0._map)
		slot1 = slot1:GetComponent(typeof(Image)).material

		slot1:SetColor("_Color", slot0)
	end), Color(0, 0, 0, 0), Color(1, 1, 0, 0), 1.5)

	slot1:setLoopPingPong(-1)
end

function slot0.didEnter(slot0)
	slot1 = getProxy(MiniGameProxy)

	onButton(slot0, slot0._closeBtn, function ()
		slot0 = uv0

		slot0:emit(uv1.ON_BACK)
	end)
	onButton(slot0, slot0.diedieleTF, function ()
		slot0 = uv0

		slot0:emit(NewYearFestivalMediator.ON_OPEN_PILE_SIGNED)
	end)
	onButton(slot0, slot0._homeBtn, function ()
		slot0 = uv0

		slot0:emit(uv1.ON_HOME)
	end)
	onButton(slot0, slot0._helpBtn, function ()
		slot0 = pg.MsgboxMgr.GetInstance()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = pg.gametip.help_chunjie_feast.tip

		slot0:ShowMsgBox({})
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "kaihongbao", function ()
		slot0 = uv0
		slot4.mediator = RedPacketMediator
		slot4.viewComponent = RedPacketLayer

		function slot4.onRemoved()
			if uv0.mapeffect then
				setActive(uv0.mapeffect, true)
			end
		end

		slot0:emit(NewYearFestivalMediator.GO_SUBLAYER, Context.New({}), function ()
			if uv0.mapeffect then
				setActive(uv0.mapeffect, false)
			end
		end)
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "danianshou", function ()
		slot0 = uv0
		slot4.id = ActivityConst.BEAT_MONSTER_NIAN_2020

		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {})
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "dafuweng", function ()
		slot0 = uv0
		slot4.id = ActivityConst.MONOPOLY_2020

		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.ACTIVITY, {})
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "diediele", function ()
		slot0 = pg.m02

		slot0:sendNotification(GAME.GO_MINI_GAME, 9)
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "jianzao", function ()
		slot0 = uv0

		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.GETBOAT, {
			projectName = "new",
			page = 1
		})
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "sishu", function ()
		slot0 = uv0

		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.COLORING)
	end)
	slot0.InitFacility(slot0._map, slot0._upper, "pifushangdian", function ()
		slot0 = uv0

		slot0:emit(NewYearFestivalMediator.GO_SCENE, SCENE.SKINSHOP)
	end)

	slot2 = pg.UIMgr.GetInstance()

	slot2:OverlayPanel(slot0.top, false)
	slot0:InitStudents(ActivityConst.ACTIVITY_478, 3, 5)
	slot0:UpdateView()
end

function slot0.UpdateView(slot0)
	slot1, slot2 = nil
	slot3 = getProxy(ActivityProxy)
	slot4 = getProxy(MiniGameProxy)
	slot5 = slot0._upper
	slot5 = setActive
	slot6 = slot5:Find("danianshou/tip")
	slot7 = slot3:getActivityById(ActivityConst.BEAT_MONSTER_NIAN_2020) and slot2:readyToAchieve()

	slot5(slot6, slot7)

	slot5 = slot0._upper
	slot5 = setActive

	slot5(slot5:Find("dafuweng/tip"), slot3:getActivityById(ActivityConst.MONOPOLY_2020) and slot2:readyToAchieve())
	setActive(slot0._upper:Find("sishu/tip"), getProxy(ColoringProxy):CheckTodayTip())
	setActive(slot0._upper:Find("jianzao/tip"), false)
	setActive(slot0._upper:Find("pifushangdian/tip"), false)

	slot5 = slot0._upper

	setActive(slot5:Find("kaihongbao/tip"), RedPacketLayer.isShowRedPoint())

	slot6 = slot0._upper
	slot6 = setActive

	slot6(slot6:Find("diediele/tip"), slot4:GetHubByHubId(slot0.HUB_ID).count > 0)
	slot0:UpdateDieDieleCnt(slot5)
end

function slot0.UpdateDieDieleCnt(slot0, slot1)
	slot0.usableTxt.text = "X" .. slot1.count
	slot0.diedieleTxt.text = slot1.usedtime .. "/" .. slot1:getConfig("reward_need")
end

function slot0.TryPlayStory(slot0)
end

function slot0.willExit(slot0)
	slot1 = slot0.effectReq

	slot1:Stop()

	slot0.mapeffect = nil
	slot1 = pg.UIMgr.GetInstance()

	slot1:UnOverlayPanel(slot0.top, slot0._tf)
	slot0:clearStudents()
end

return slot0
