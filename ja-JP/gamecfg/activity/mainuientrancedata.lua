return {
	{
		Tip = "tip_1920",
		Image = "event_all",
		ButtonName = "activityButton"
	},
	{
		Image = "event_map",
		ButtonName = "activity_map_btn",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2:isEnd()

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
			if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd() and getProxy(MiniGameProxy):GetMiniGameData(3) and not slot3:GetRuntimeData("isInited") then
				slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
					3,
					1
				})
			end
		end,
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd()

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
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_springfestival",
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
		Tip = "tip",
		Image = "event_LanternFestival",
		ButtonName = "activity_LanternFestival",
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
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_musicfestival",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				slot6 = getProxy(ActivityProxy)

				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MUSIC_FESTIVAL)
				end, SFX_PANEL)
				setActive(slot1:Find("Tip"), IdolPTPage.NeedTip() or IdolMedalCollectionView.isHaveActivableMedal() or function ()
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

			slot5 = getProxy(ActivityProxy):getActivityById(ActivityConst.IDOL_MEDAL_COLLECTION) and not slot4:isEnd()

			setActive(slot1, slot5)

			if slot5 then
				setActive(slot1:Find("Tip"), IdolMedalCollectionView.isHaveActivableMedal())
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
		Tip = "tip",
		Image = "main_decodegame",
		ButtonName = "activity_decode",
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
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_thirdAnniversary",
		UpdateButton = function (slot0, slot1)
			slot3 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF) and not slot2:isEnd()

			setActive(slot1, slot3)

			if slot3 then
				for slot9, slot10 in ipairs(slot2:getConfig("config_data")) do
					slot11 = slot2.data1KeyValueList[2][slot10] or 0

					if pg.activity_event_building[arg] and slot11 < slot12.buff then
						slot4 = false or slot12.material[slot11] <= (slot2.data1KeyValueList[1][slot12.material_id] or 0)
					end
				end

				setActive(slot1:Find("Tip"), slot4 or getProxy(MiniGameProxy):GetHubByHubId(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME):getConfig("config_id")).count > 0)
				onButton(slot0, slot1, function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.THIRD_ANNIVERSARY_SQUARE)
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
		6
	}
}
