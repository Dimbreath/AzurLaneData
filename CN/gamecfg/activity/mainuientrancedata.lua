return {
	{
		Tip = "tip_1920",
		Image = "event_all",
		ButtonName = "activityButton",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, true)
			onButton(slot0, slot1, function ()
				slot0:emit(MainUIMediator.GO_SCENE, {
					SCENE.ACTIVITY
				})
			end, SFX_PANEL)
		end
	},
	{
		Image = "event_map",
		ButtonName = "activity_map_btn",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2.isEnd() then
				onButton(slot0, slot1, function ()
					slot0:emit(MainUIMediator.ON_ACTIVITY_MAP, slot1.id)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_newyear",
		Tip = "tip_1920",
		CtorButton = function (slot0, slot1)
			if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd() and getProxy(MiniGameProxy):GetMiniGameData(3) and not slot3:GetRuntimeData("isInited") then
				slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
					3,
					1
				})
			end
		end,
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2.isEnd() then
				slot6 = getProxy(MiniGameProxy).GetHubByHubId(slot5, slot4)

				setActive(slot1:Find("Tip"), slot6.count > 0 or (slot6:getConfig("reward_need") <= slot6.usedtime and slot6.ultimate == 0) or slot9() or CygnetBathrobePage.IsTip())

				if slot6.count > 0 or (slot6.getConfig("reward_need") <= slot6.usedtime and slot6.ultimate == 0) or slot9() or CygnetBathrobePage.IsTip() then
					slot12 = slot1:Find("Tip/Text")
					slot13 = nil

					if slot8 then
						slot13 = "!"
					elseif slot7 > 0 then
						slot13 = slot7
					elseif slot10 then
						slot13 = "!"
					end

					setText(slot12, slot13 or "")
				end

				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NEWYEAR_SQUARE)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_escort",
		ButtonName = "activity_escort",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, OPEN_ESCORT)
			onButton(slot0, slot1, function ()
				slot0:emit(MainUIMediator.OPEN_ESCORT)
			end, SFX_PANEL)
		end
	},
	{
		Tip = "tip",
		Image = "event_boss",
		ButtonName = "activity_boss",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot2.isEnd() then
				slot4 = false
				slot5 = false

				if not (slot7.time ~= "stop" and pg.TimeMgr.GetInstance():parseTimeFromConfig(slot7.time[2]) and (slot7.time ~= "stop" and pg.TimeMgr.GetInstance().parseTimeFromConfig(slot7.time[2])) <= pg.TimeMgr.GetInstance():GetServerTime()) then
					slot4 = slot2.data2 ~= 1
				elseif getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then
					slot4 = ActivityBossPtData.New(slot8):CanGetAward()
				end

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()
					slot0:emit(MainUIMediator.GO_SCENE, {
						SCENE.ACT_BOSS_SPF
					})
				end, SFX_PANEL)
			end
		end
	},
	{
		ButtonName = "activity_ins",
		CtorButton = function (slot0, slot1)
			GetOrAddComponent(LayoutElement).ignoreLayout = true
			slot1.anchoredPosition = Vector2(104, -752.5)
		end,
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot2.isEnd() then
				slot1:Find("icon"):GetComponent(typeof(Animator)).enabled = getProxy(InstagramProxy):ShouldShowTip()

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()
					slot0:emit(MainUIMediator.OPEN_INS)
				end, SFX_PANEL)
			end
		end
	},
	{
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_springfestival",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot2.isEnd() then
				slot7 = nil
				slot7 = getProxy(ActivityProxy):getActivityById(ActivityConst.BEAT_MONSTER_NIAN_2020)
				slot7 = slot5:getActivityById(ActivityConst.MONOPOLY_2020)

				setActive(slot1:Find("Tip"), false or (slot7 and slot7:readyToAchieve()) or (slot7 and slot7:readyToAchieve()) or getProxy(ColoringProxy):CheckTodayTip() or RedPacketLayer.isShowRedPoint() or getProxy(MiniGameProxy):GetHubByHubId(slot2:getConfig("config_id")).count > 0)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SPRING_TOWN)
				end, SFX_PANEL)
			end
		end
	},
	LayoutProperty = {
		CellSize = Vector2(208, 215)
	},
	CurrentEntrancesList = {
		1,
		2,
		5,
		7,
		6
	}
}
