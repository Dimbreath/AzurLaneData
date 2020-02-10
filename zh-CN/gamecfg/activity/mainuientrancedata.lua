return {
	{
		Tip = "tip_1920",
		Image = "event_all",
		ButtonName = "activityButton",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, true)
			onButton(slot0, slot1, function ()
				uv0:emit(MainUIMediator.GO_SCENE, {
					SCENE.ACTIVITY
				})
			end, SFX_PANEL)
		end
	},
	{
		Image = "event_map",
		ButtonName = "activity_map_btn",
		UpdateButton = function (slot0, slot1)
			slot2 = getProxy(ActivityProxy)
			slot3 = slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				onButton(slot0, slot1, function ()
					uv0:emit(MainUIMediator.ON_ACTIVITY_MAP, uv1.id)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_newyear",
		Tip = "tip_1920",
		CtorButton = function (slot0, slot1)
			slot2 = getProxy(ActivityProxy)

			if slot2:getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd() then
				slot3 = getProxy(MiniGameProxy)

				if slot3:GetMiniGameData(3) and not slot3:GetRuntimeData("isInited") then
					slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
						3,
						1
					})
				end
			end
		end,
		UpdateButton = function (slot0, slot1)
			slot2 = getProxy(ActivityProxy)
			slot3 = slot2:getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot6 = getProxy(MiniGameProxy):GetHubByHubId(slot2:getConfig("config_id"))
				slot11 = slot6.count > 0 or slot6:getConfig("reward_need") <= slot6.usedtime and slot6.ultimate == 0 or (function ()
					if uv0:GetMiniGameData(3) then
						return (slot0:GetRuntimeData("count") or 0) > 0 and NewYearShrinePage.IsTip()
					end
				end() or CygnetBathrobePage.IsTip())

				setActive(slot1:Find("Tip"), slot11)

				if slot11 then
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
				uv0:emit(MainUIMediator.OPEN_ESCORT)
			end, SFX_PANEL)
		end
	},
	{
		Tip = "tip",
		Image = "event_boss",
		ButtonName = "activity_boss",
		UpdateButton = function (slot0, slot1)
			slot2 = getProxy(ActivityProxy)
			slot3 = slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot4 = false
				slot5 = false

				if pg.activity_event_worldboss[slot2:getConfig("config_id")] then
					if slot7.time ~= "stop" then
						slot8 = pg.TimeMgr.GetInstance():parseTimeFromConfig(slot7.time[2])
					else
						slot8 = false

						if false then
							slot8 = true
						end
					end

					if slot8 then
						slot5 = slot8 <= pg.TimeMgr.GetInstance():GetServerTime()
					end
				end

				if not slot5 then
					slot4 = slot2.data2 ~= 1
				else
					slot8 = getProxy(ActivityProxy)

					if slot8:getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then
						slot4 = ActivityBossPtData.New(slot8):CanGetAward()
					end
				end

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()
					uv0:emit(MainUIMediator.GO_SCENE, {
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
			slot2 = getProxy(ActivityProxy)
			slot3 = slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot4 = getProxy(InstagramProxy):ShouldShowTip()
				slot1:Find("icon"):GetComponent(typeof(Animator)).enabled = slot4

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()
					uv0:emit(MainUIMediator.OPEN_INS)
				end, SFX_PANEL)
			end
		end
	},
	{
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_springfestival",
		UpdateButton = function (slot0, slot1)
			slot2 = getProxy(ActivityProxy)
			slot3 = slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot5 = getProxy(ActivityProxy)
				slot6 = getProxy(MiniGameProxy)
				slot7 = nil
				slot7 = slot5:getActivityById(ActivityConst.BEAT_MONSTER_NIAN_2020)
				slot7 = slot5:getActivityById(ActivityConst.MONOPOLY_2020)

				if not (false or slot7 and slot7:readyToAchieve() or slot7 and slot7:readyToAchieve()) then
					slot4 = getProxy(ColoringProxy):CheckTodayTip()
				end

				setActive(slot1:Find("Tip"), slot4 or RedPacketLayer.isShowRedPoint() or slot6:GetHubByHubId(slot2:getConfig("config_id")).count > 0)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SPRING_TOWN)
				end, SFX_PANEL)
			end
		end
	},
	{
		Tip = "tip",
		Image = "event_LanternFestival",
		ButtonName = "activity_LanternFestival",
		UpdateButton = function (slot0, slot1)
			slot2 = getProxy(ActivityProxy)
			slot3 = slot2:getActivityById(ActivityConst.LANTERNFESTIVAL) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), getProxy(MiniGameProxy):GetHubByHubId(slot2:getConfig("config_id")).count > 0 and slot5.usedtime < 7)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_MINI_GAME, 10)
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
		8,
		6
	}
}
