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
			slot4 = getProxy(MiniGameProxy).GetHubByHubId(slot3, slot2)

			setActive(slot0, slot4.count > 0 or (slot4:getConfig("reward_need") <= slot4.usedtime and slot4.ultimate == 0) or slot7() or CygnetBathrobePage.IsTip())

			slot9 = slot0:Find("Text")
			slot10 = nil

			if slot6 then
				slot10 = "!"
			elseif slot5 > 0 then
				slot10 = slot5
			elseif slot8 then
				slot10 = "!"
			end

			setText(slot9, slot10)
		end,
		RequestOnCtor = function (slot0)
			if getProxy(MiniGameProxy):GetMiniGameData(3) and not slot1:GetRuntimeData("isInited") then
				slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
					3,
					1
				})
			end
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
		Tip = "tip2",
		IsShow = function ()
			return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot0:isEnd()
		end,
		OnClick = function (slot0)
			slot0:emit(MainUIMediator.OPEN_INS)
		end,
		UpdateTip = function (slot0)
			slot0.parent:Find("icon"):GetComponent(typeof(Animator)).enabled = getProxy(InstagramProxy):ShouldShowTip()

			setActive(slot0, getProxy(InstagramProxy).ShouldShowTip())
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
