return {
	{
		ButtonName = "activityButton",
		Image = "event_all",
		TipText = true,
		Tip = "tip_1920",
		IsShow = function ()
			return true
		end,
		OnClick = function (slot0)
			slot0:emit(MainUIMediator.GO_SCENE, {
				SCENE.ACTIVITY
			})
		end,
		UpdateTip = function (slot0)
			setActive(slot0, false)
		end
	},
	{
		ButtonName = "activity_map_btn",
		Image = "event_map",
		TipText = false,
		IsShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot0:isEnd()
		end,
		OnClick = function (slot0)
			slot0:emit(MainUIMediator.ON_ACTIVITY_MAP, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT).id)
		end
	},
	{
		ButtonName = "activity_newyear",
		Image = "event_minigame",
		TipText = true,
		Tip = "tip_1920",
		IsShow = function ()
			return getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot0:isEnd()
		end,
		OnClick = function (slot0)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NEWYEAR_SQUARE)
		end,
		UpdateTip = function (slot0)
			slot3 = getProxy(MiniGameProxy):GetHubByHubId(slot2)

			setActive(slot0, slot3.count > 0 or (slot3:getConfig("reward_need") <= slot3.usedtime and slot3.ultimate == 0))
			setText(slot0:Find("Text"), (slot3.getConfig("reward_need") <= slot3.usedtime and slot3.ultimate == 0 and "!") or slot3.count)
		end
	},
	{
		ButtonName = "activity_escort",
		Image = "event_escort",
		IsShow = function ()
			return OPEN_ESCORT
		end,
		OnClick = function (slot0)
			slot0:emit(MainUIMediator.OPEN_ESCORT)
		end
	},
	{
		ButtonName = "activity_boss",
		Image = "event_boss",
		TipText = false,
		Tip = "tip",
		IsShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot0:isEnd()
		end,
		OnClick = function (slot0)
			slot0:emit(MainUIMediator.GO_SCENE, {
				SCENE.ACT_BOSS_BATTLE
			})
		end,
		UpdateTip = function (slot0)
			slot1 = false

			if getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then
				slot1 = ActivityBossPtData.New(slot2):CanGetAward()
			end

			setActive(slot0, slot1)
		end
	},
	{
		ButtonName = "activity_ins",
		Image = "rukou",
		IsShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot0:isEnd()
		end,
		OnClick = function (slot0)
			slot0:emit(MainUIMediator.OPEN_INS)
		end,
		UpdateTip = function (slot0)
			setActive(slot0, getProxy(InstagramProxy):ShouldShowTip())
		end
	},
	LayoutProperty = {
		CellSize = Vector2(208, 215)
	},
	CurrentEntrancesList = {
		1,
		2,
		3,
		6
	}
}
