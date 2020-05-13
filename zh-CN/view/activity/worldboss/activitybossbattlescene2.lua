slot0 = class("ActivityBossBattleScene2", import("view.base.BaseUI"))
slot1 = pg.expedition_data_template

function slot0.getUIName(slot0)
	return "ActivityBossBattleUI2"
end

slot0.phaseColor = {
	{
		130,
		85,
		70
	},
	{
		130,
		85,
		70
	},
	{
		70,
		130,
		105
	},
	{
		80,
		140,
		255
	}
}

function slot0.returnPhaseColor(slot0)
	return uv0.phaseColor[slot0.phase][1] / 255, uv0.phaseColor[slot0.phase][2] / 255, uv0.phaseColor[slot0.phase][3] / 255
end

function slot0.setFleet(slot0, slot1)
	slot0.fleet = slot1
end

function slot0.setPtID(slot0, slot1)
	slot0.ptId = slot1
end

function slot0.setInfomation(slot0, slot1, slot2, slot3, slot4)
	slot0.battleTime = slot1
	slot0.taskList = slot2
	slot0.itemDisplayList = slot3
	slot0.stageList = slot4

	for slot8 = 1, 4 do
		updateDrop(slot0.bonusWindow:Find("window/scrollview/item/award"), {
			type = slot0.itemDisplayList[5 - slot8][1],
			id = slot0.itemDisplayList[5 - slot8][2],
			count = slot0.itemDisplayList[5 - slot8][3]
		})
		onButton(slot0, slot0:findTF("phase" .. slot8 .. "/monument/item", slot0.hpBar), function ()
			uv0:emit(uv1.ON_DROP, uv2)
		end, SFX_PANEL)
	end
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0._resPanel:setResources(slot1)

	slot0.ptScore = slot0.player:getResource(slot0.ptId)

	setText(slot0:findTF("point", slot0.awardBtn), slot0.ptScore)

	slot0.openedCommanerSystem = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
	slot0.bossHP = slot1.data1
	slot0.monument = slot1.data1_list
	slot0.isdead = slot1.data2 == 1 or slot0.monument[4]
	slot0.phase = math.floor(math.min(slot0.bossHP, 9999) / 2500) + 1

	slot0:updatePage()
	slot0:checkStory()
	slot0:updateAward()

	if not slot0.isdead then
		slot0:emit(ActivityBossBattleMediator2.UPDATE_ACT_RANK_PT, slot0.ptScore)
	end

	if slot0.enterStage then
		function slot2()
			if uv0.isdead then
				return uv0.stageList[0]
			end

			for slot3, slot4 in ipairs(uv0.stageList) do
				if uv0.bossHP < slot4[1][1] + (slot3 == 1 and 1 or 0) and slot4[1][2] <= uv0.bossHP then
					return slot4[2]
				end
			end
		end

		slot0.enterStage = false

		if slot0.battleTime == 0 or slot0.timeMgr:parseTimeFromConfig(slot0.battleTime) <= slot0.timeMgr:GetServerTime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		slot0:emit(ActivityBossBattleMediator2.ON_STAGE, slot2(), slot0.bossHP)
	end
end

function slot0.init(slot0)
	slot0.timeMgr = pg.TimeMgr.GetInstance()
	slot0.taskProxy = getProxy(TaskProxy)
	slot0.top = slot0:findTF("top")
	slot0.backBtn = slot0:findTF("back", slot0.top)
	slot0.playerRes = slot0:findTF("playerRes", slot0.top)
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0.playerRes), false)

	slot0.mainTF = slot0:findTF("main")
	slot0.bg = slot0:findTF("bg")
	slot0.titleTF = slot0:findTF("title", slot0.mainTF)

	setActive(slot0.titleTF, false)

	slot0.rankTF = slot0:findTF("rank", slot0.mainTF)
	slot0.bottom = slot0:findTF("bottom", slot0.mainTF)
	slot0.msgPanel = slot0:findTF("msg_panel", slot0.bottom)
	slot0.hpBar = slot0:findTF("hp_bar", slot0.bottom)
	slot0.hpPoint = slot0:findTF("hp_point", slot0.bottom)
	slot0.battleBtn = slot0:findTF("btn_battle", slot0.bottom)
	slot0.formationBtn = slot0:findTF("btn_formation", slot0.bottom)
	slot0.awardBtn = slot0:findTF("btn_award", slot0.bottom)
	slot0.helpBtn = slot0:findTF("help", slot0.mainTF)
	slot0.bonusWindow = slot0:findTF("bonusWindow")

	setActive(slot0.bonusWindow, false)

	slot0.fleetSelect = slot0:findTF("fleet_select")
	slot0.fleetEditPanel = ActivityFleetPanel.New(slot0.fleetSelect.gameObject)

	function slot0.fleetEditPanel.onCancel()
		uv0:hideFleetEdit()
	end

	function slot0.fleetEditPanel.onCommit()
		uv0:commitEdit()
	end

	function slot0.fleetEditPanel.onCombat()
		uv0:commitEdit()
		uv0:emit(ActivityBossBattleMediator2.ON_PRECOMBAT, function ()
			if uv0.isdead then
				return uv0.stageList[0]
			end

			for slot3, slot4 in ipairs(uv0.stageList) do
				if uv0.bossHP < slot4[1][1] + (slot3 == 1 and 1 or 0) and slot4[1][2] <= uv0.bossHP then
					return slot4[2]
				end
			end
		end())
	end

	function slot0.fleetEditPanel.onLongPressShip(slot0, slot1)
		uv0:openShipInfo(slot0, slot1)
	end

	slot0.commanderFormationPanel = CmdLevelFormationPanel.New(slot0:findTF("commander_panel"))

	slot0.commanderFormationPanel:attach(slot0)

	slot0.enterStage = false
	slot0.anim = slot0._tf:GetComponent("Animator")
	slot0.anim.enabled = false

	setActive(slot0.top, false)
	setActive(slot0.mainTF, false)
end

function slot0.enterAnim(slot0)
	if not slot0.contextData.showAni then
		function ()
			if uv0.titleEffect then
				setActive(uv0.titleEffect, false)
			end

			setActive(uv0.titleTF, true)
			setActive(uv0.top, true)
			setActive(uv0.mainTF, true)
		end()

		return
	end

	slot0.contextData.showAni = nil

	function slot2()
		slot0 = uv0.titleEffect:GetComponent("DftAniEvent")

		slot0:SetEndEvent(function (slot0)
			setActive(uv0.titleEffect, false)
			setActive(uv0.titleTF, true)
		end)
		slot0:SetTriggerEvent(function (slot0)
			uv0.anim.enabled = true

			uv0.anim:Play("enter", -1, 0)
		end)
		setActive(uv0.titleEffect, true)
	end

	if not slot0.titleEffect then
		PoolMgr.GetInstance():GetUI("ASKS", true, function (slot0)
			uv0.titleEffect = slot0

			setParent(uv0.titleEffect, uv0._tf)
			uv1()
			onButton(uv0, uv0.titleEffect, function ()
				uv0()
			end)
		end)
	else
		slot2()
	end
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.awardBtn, function ()
		uv0:showAwards()
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		uv0:tryBattle()
	end, SFX_PANEL)
	onButton(slot0, slot0.formationBtn, function ()
		uv0.fleetEditPanel:attach(uv0)
		uv0.fleetEditPanel:setFleets(uv0.fleet)
		uv0.fleetEditPanel:set(1, 1)
		pg.UIMgr.GetInstance():BlurPanel(uv0.fleetEditPanel._tf)
	end, SFX_PANEL)
	onButton(slot0, slot0.rankTF, function ()
		uv0:emit(ActivityBossBattleMediator2.ON_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.world_boss_help.tip
		})
	end, SFX_PANEL)

	if slot0.contextData.editFleet then
		triggerButton(slot0.formationBtn)

		slot0.contextData.editFleet = nil
	end

	slot0:enterAnim()
end

function slot0.checkStory(slot0)
	slot1 = pg.StoryMgr.GetInstance()
	slot2 = slot0.activity:getConfig("config_client").story
	slot3 = nil
	slot3 = coroutine.create(function ()
		for slot3, slot4 in ipairs(uv0) do
			if (uv1.bossHP < slot4[1] + (slot3 == 1 and 1 or 0) or slot4[1] == 0 and uv1.isdead) and not uv1.player:IsPlayed(slot4[2]) then
				uv2:Play(slot4[2], uv3)
				coroutine.yield()
			end
		end
	end)

	function ()
		if uv0 and coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end()
end

function slot0.updatePage(slot0)
	slot1 = string.format("%.2f", slot0.bossHP / 100)
	slot2, slot3 = string.find(slot1, "%.")

	setText(slot0:findTF("number1", slot0.hpPoint), string.sub(slot1, 1, slot3))
	setText(slot0:findTF("number2", slot0.hpPoint), string.sub(slot1, slot3 + 1))
	GetImageSpriteFromAtlasAsync("commonbg/act_boss_bg_" .. slot0.phase, "", slot0.bg)

	slot7 = slot0.returnPhaseColor

	setImageColor(slot0:findTF("back_light", slot0.mainTF), Color.New(slot7(slot0)))

	for slot7 = 1, 4 do
		slot8 = slot0:findTF("phase" .. slot7, slot0.hpBar)

		setSlider(slot0:findTF("Slider", slot8), 0, 2500, math.min(math.max(slot0.bossHP - (slot7 - 1) * 2500, 0), 2500))
		setActive(slot0:findTF("mood", slot8), slot7 == slot0.phase)
		setActive(slot0:findTF("monument/item", slot8), defaultValue(slot0.monument[5 - slot7], 0) == 0)
		setActive(slot0:findTF("monument/time", slot8), defaultValue(slot0.monument[5 - slot7], 0) > 0)

		if slot0.monument[5 - slot7] then
			setText(slot0:findTF("monument/time/word", slot8), slot0.timeMgr:CTimeDescC(slot0.monument[5 - slot7], "%m/%d/%H:%M"))
		end
	end
end

function slot0.tryBattle(slot0)
	slot0:emit(ActivityBossBattleMediator2.ON_TRY_BATTLE)
end

function slot0.showAwards(slot0)
	setActive(slot0.bonusWindow, true)

	if not slot0.awardList then
		onButton(slot0, slot0.bonusWindow, function ()
			uv0:closeAwards()
		end, SFX_PANEL)
		onButton(slot0, slot0.bonusWindow:Find("window/top/btnBack"), function ()
			uv0:closeAwards()
		end, SFX_PANEL)

		slot0.awardList = UIItemList.New(slot0.bonusWindow:Find("window/scrollview/list"), slot0.bonusWindow:Find("window/scrollview/item"))

		setActive(slot0.bonusWindow:Find("window/scrollview/item"), false)
		slot0.awardList:make(function (slot0, slot1, slot2)
			slot5 = uv0.taskProxy:getTaskById(uv0.taskList[slot1 + 1][2]) or uv0.taskProxy:getFinishTaskById(slot4) or Task.New({
				id = slot4
			})

			if slot0 == UIItemList.EventInit then
				setText(slot2:Find("mask/target/Text"), i18n("world_boss_award_limit", string.format("%2d", uv0.taskList[slot1 + 1][1] / 100)))
				setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
				setText(slot2:Find("target/title"), i18n("qiuqiu_count"))
				setText(slot2:Find("target/Text"), slot5:getConfig("target_num"))

				slot6 = slot5:getConfig("award_display")[1]

				updateDrop(slot2:Find("award"), {
					type = slot6[1],
					id = slot6[2],
					count = slot6[3]
				})
				onButton(uv0, slot2, function ()
					uv0:emit(uv1.ON_DROP, uv2)
				end, SFX_PANEL)

				return
			end

			if slot0 == UIItemList.EventUpdate then
				setActive(slot2:Find("target"), uv0.bossHP <= slot3)
				setActive(slot2:Find("mask"), slot3 < uv0.bossHP)
				setActive(slot2:Find("award/mask"), slot5:isReceive())
				setActive(slot2:Find("award/mask_can"), uv0.bossHP <= slot3 and slot5:isFinish() and not slot5:isReceive())
			end
		end)
	end

	slot0:updateAward()
end

function slot0.closeAwards(slot0)
	setActive(slot0.bonusWindow, false)
end

function slot0.updateAward(slot0)
	slot1, slot2, slot3 = slot0:getDoingTask()

	setActive(slot0:findTF("flash", slot0.awardBtn), slot0.bossHP <= slot2 and slot3:isFinish() and not slot3:isReceive())

	if slot0.awardList then
		slot0.awardList:align(#slot0.taskList)
		slot0:updateTaskBtn(slot1, slot2, slot3)
	end
end

function slot0.getDoingTask(slot0)
	slot1, slot2, slot3 = nil

	for slot7, slot8 in ipairs(slot0.taskList) do
		slot1 = slot7
		slot2 = slot8[1]

		if slot0.taskProxy:getTaskById(slot8[2]) then
			break
		else
			slot3 = slot0.taskProxy:getFinishTaskById(slot8[2])
		end
	end

	return slot1, slot2, slot3
end

function slot0.updateTaskBtn(slot0, slot1, slot2, slot3)
	scrollTo(slot0.bonusWindow:Find("window/scrollview"), 0, 1 - (slot1 - 1) / (#slot0.taskList - 1))
	setActive(({
		slot0.bonusWindow:Find("window/btn_dis"),
		slot0.bonusWindow:Find("window/btn_get"),
		slot0.bonusWindow:Find("window/btn_got")
	})[1], slot2 < slot0.bossHP or not slot3:isFinish())
	setActive(slot4[2], slot0.bossHP <= slot2 and slot3:isFinish() and not slot3:isReceive())
	setActive(slot4[3], slot3:isReceive())
	onButton(slot0, slot4[2], function ()
		uv0:emit(ActivityBossBattleMediator2.ON_GET, uv1.id)
	end, SFX_PANEL)
end

function slot0.commitEdit(slot0)
	slot0:emit(ActivityBossBattleMediator2.ON_COMMIT_FLEET)
end

function slot0.updateEditPanel(slot0)
	slot0.fleetEditPanel:setFleets(slot0.fleet)
	slot0.fleetEditPanel:updateFleets()
end

function slot0.hideFleetEdit(slot0)
	setActive(slot0.fleetSelect, false)
	slot0:closeCommanderPanel()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetSelect, slot0._tf)
	setParent(slot0.fleetSelect, slot0._tf, false)
end

function slot0.openShipInfo(slot0, slot1, slot2)
	slot0:emit(ActivityBossBattleMediator2.ON_FLEET_SHIPINFO, {
		shipId = slot1,
		shipVOs = slot2
	})
end

function slot0.openCommanderPanel(slot0, slot1)
	slot2 = nil

	slot0.commanderFormationPanel:update(slot1, function (slot0)
		uv0:emit(ActivityBossBattleMediator2.ON_SELECT_COMMANDER, uv1.id, slot0)
		uv0:hideFleetEdit()
	end)
	slot0.commanderFormationPanel:open()
end

function slot0.closeCommanderPanel(slot0)
	slot0.commanderFormationPanel:close()
end

function slot0.initMsg(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0:addMsg(slot6)
	end
end

function slot0.addMsg(slot0, slot1)
	slot2 = slot0.msgPanel:Find("word_panel/list")

	if slot0.msgPanel:Find("word_panel/pool").childCount == 0 then
		setParent(slot2:GetChild(0), slot3)
	end

	slot4 = slot3:GetChild(0)

	setText(slot4, i18n("world_boss_tip", slot1.name, slot1.score))
	setParent(slot4, slot2)
end

function slot0.setRank(slot0, slot1, slot2)
	slot3 = nil

	for slot7 = 1, 3 do
		setActive(slot0.rankTF:GetChild(slot7 - 1), slot1[slot7])

		if slot1[slot7] then
			slot8 = Ship.New({
				configId = slot1[slot7].icon,
				skin_id = slot1[slot7].skinId
			})
			slot8.remoulded = slot1[slot7].remoulded

			GetImageSpriteFromAtlasAsync("SquareIcon/" .. slot8:getPainting(), "", slot3:Find("icon"))
			setText(slot3:Find("name"), slot1[slot7].name)
		end
	end
end

function slot0.willExit(slot0)
	slot0:hideFleetEdit()
end

return slot0
