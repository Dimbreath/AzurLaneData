return {
	{
		Tip = "tip_1920",
		Image = "event_all",
		ButtonName = "activityButton"
	},
	{
		forceRefreshImage = true,
		ButtonName = "activity_map_btn",
		Image = function ()
			return getProxy(ActivityProxy):GetEarliestActByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot0:isEnd() and LoadSprite("ui/mainui_atlas", "event_map_" .. slot0.id) or LoadSprite("ui/mainui_atlas", "event_map")
		end,
		UpdateButton = function (slot0, slot1)
			slot4 = _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT), function (slot0)
				return not slot0:isEnd()
			end) and not slot3:isEnd()

			setActive(slot1, slot4)

			if slot4 then
				onButton(slot0, slot1, function ()
					uv0:emit(MainUIMediator.ON_ACTIVITY_MAP, uv1.id)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_newyear",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_SNACKSTREET_MINIGAME) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), BackHillTemplate.IsMiniActNeedTip(ActivityConst.NEWYEAR_SNOWBALL_FIGHT) or NewYearSnackPage.IsTip() or NewYearShrineView.IsNeedShowTipWithoutActivityFinalReward())
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NEWYEAR_BACKHILL)
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
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot4 = false
				slot5 = false

				if pg.activity_event_worldboss[slot2:getConfig("config_id")] then
					slot8 = slot7.time ~= "stop" and pg.TimeMgr.GetInstance():parseTimeFromConfig(slot7.time[2])
					slot5 = slot8 and slot8 <= pg.TimeMgr.GetInstance():GetServerTime()
				end

				if not slot5 then
					slot4 = slot2.data2 ~= 1
				elseif getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then
					slot4 = ActivityBossPtData.New(slot8):CanGetAward()
				end

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()
					uv0:emit(MainUIMediator.GO_SCENE, {
						SCENE.ACT_BOSS_BATTLE,
						{
							showAni = true,
							mediatorClass = ActivityBossMediatorTemplate,
							viewClass = ActivityBossAisaikesiScene
						}
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
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot2:isEnd()

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
		Image = "event_minigame",
		ButtonName = "activity_springfestival",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot7 = nil
				slot7 = getProxy(ActivityProxy):getActivityById(ActivityConst.BEAT_MONSTER_NIAN_2020)
				slot7 = slot5:getActivityById(ActivityConst.MONOPOLY_2020)

				setActive(slot1:Find("Tip"), false or slot7 and slot7:readyToAchieve() or slot7 and slot7:readyToAchieve() or getProxy(ColoringProxy):CheckTodayTip() or RedPacketLayer.isShowRedPoint() or getProxy(MiniGameProxy):GetHubByHubId(slot2:getConfig("config_id")).count > 0)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SPRING_TOWN)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_LanternFestival",
		ButtonName = "activity_LanternFestival",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), getProxy(MiniGameProxy):GetHubByHubId(slot2:getConfig("config_id")).count > 0 and slot5.usedtime < 7)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_MINI_GAME, 10)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_musicfestival",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot6 = getProxy(ActivityProxy)

				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MUSIC_FESTIVAL)
				end, SFX_PANEL)
				setActive(slot1:Find("Tip"), IdolPTPage.NeedTip() or IdolMedalCollectionMediator.isHaveActivableMedal() or function ()
					return getProxy(InstagramProxy):ShouldShowTip()
				end() or function ()
					if uv0:getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) and not slot0:isEnd() then
						return slot0:readyToAchieve()
					end
				end() or function ()
					return uv0:getActivityById(ActivityConst.MUSIC_CHUIXUE7DAY_ID) and not slot0:isEnd() and slot0:readyToAchieve()
				end() or function ()
					return getProxy(MiniGameProxy):GetHubByHubId(2).count > 0
				end())

				return
			end

			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.IDOL_MEDAL_COLLECTION) and not slot4:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), IdolMedalCollectionMediator.isHaveActivableMedal())
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.IDOL_MEDAL_COLLECTION_SCENE)
				end, SFX_PANEL)
			end
		end
	},
	{
		Tip = "tip",
		Image = "event_LanternFestival",
		ButtonName = "activity_actpool",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot4 = slot2:getAwardInfos()

				setActive(slot1:Find("Tip"), _.any(slot2:getConfig("config_data"), function (slot0)
					slot2 = ActivityItemPool.New({
						id = slot0,
						awards = uv0[slot0]
					}):getComsume()

					return slot2.count <= getProxy(PlayerProxy):getRawData()[id2res(slot2.id)] and slot1:getleftItemCount() > 0
				end))
				onButton(slot0, slot1, function ()
					uv0:emit(MainUIMediator.ON_LOTTERY, uv1.id)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "main_decodegame",
		ButtonName = "activity_decode",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1, getProxy(MiniGameProxy):GetHubByHubId(slot2:getConfig("config_id")).id == 7)
				setActive(slot1:Find("Tip"), slot5.count > 0)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
						type = MiniGameRequestCommand.REQUEST_HUB_DATA,
						callback = function ()
							pg.m02:sendNotification(GAME.GO_MINI_GAME, 11)
						end
					})
				end, SFX_PANEL)
			end
		end
	},
	{
		Tip = "tip",
		Image = "event_aprilFool",
		ButtonName = "activity_aprilFool",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot5 = pg.activity_event_picturepuzzle[slot2.id]

				setActive(slot1:Find("Tip"), not (slot2.data1 == 1))
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
						id = uv0.id
					})
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_thirdAnniversary",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), slot2:readyToAchieve() or getProxy(MiniGameProxy):GetHubByHubId(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME):getConfig("config_id")).count > 0)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.THIRD_ANNIVERSARY_AKIBA)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_musicfestival2",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID_2) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot4 = getProxy(ActivityProxy)

				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MUSIC_FESTIVAL2)
				end, SFX_PANEL)
				setActive(slot1:Find("Tip"), function ()
					return uv0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF) and not slot0:isEnd() and slot0:readyToAchieve()
				end() or IdolMedalCollectionMediator.isHaveActivableMedal() or function ()
					slot0 = getProxy(MiniGameProxy):GetHubByHubId(uv0:getConfig("config_id"))

					return slot0:getConfig("reward_need") <= slot0.usedtime and slot0.ultimate == 0
				end() or function ()
					return getProxy(MiniGameProxy):GetHubByHubId(uv0:getConfig("config_id")).count > 0
				end())

				return
			end

			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) and not slot4:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), IdolMedalCollectionMediator.isHaveActivableMedal())
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.IDOL_MEDAL_COLLECTION_SCENE2)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_DOALink",
		Tag = "MiniGameHub",
		Tip = "tip",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot4 = getProxy(ActivityProxy)

				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOALINK_ISLAND)
				end, SFX_PANEL)
				setActive(slot1:Find("Tip"), function ()
					return uv0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF) and not slot0:isEnd() and slot0:readyToAchieve()
				end() or DoaMedalCollectionView.isHaveActivableMedal() or function ()
					slot0 = getProxy(MiniGameProxy):GetHubByHubId(uv0:getConfig("config_id"))

					return slot0:getConfig("reward_need") <= slot0.usedtime and slot0.ultimate == 0
				end() or function ()
					return getProxy(MiniGameProxy):GetHubByHubId(uv0:getConfig("config_id")).count > 0
				end())

				return
			end

			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) and not slot4:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				setActive(slot1:Find("Tip"), DoaMedalCollectionView.isHaveActivableMedal())
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOA_MEDAL_COLLECTION_SCENE)
				end, SFX_PANEL)
			end
		end
	},
	LayoutProperty = {
		CellSize = Vector2(208, 215),
		Spacing = Vector2(0, -20),
		Padding = {
			0,
			0,
			-20,
			0
		},
		CellScale = Vector3(0.9, 0.9, 1)
	},
	CurrentEntrancesList = {
		1,
		2,
		5,
		6,
		3
	}
}
