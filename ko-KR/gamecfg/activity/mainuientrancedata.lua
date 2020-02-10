slot1.CellSize = Vector2(208, 215)
slot0.LayoutProperty = {}
slot0.CurrentEntrancesList = {
	1,
	2,
	3,
	6
}

function slot1.UpdateButton(slot0, slot1)
	setActive(slot1, true)
	onButton(slot0, slot1, function ()
		slot3[1] = SCENE.ACTIVITY

		uv0:emit(MainUIMediator.GO_SCENE, {})
	end, SFX_PANEL)
end

slot0[1] = {
	Tip = "tip_1920",
	Image = "event_all",
	ButtonName = "activityButton"
}

function slot1.UpdateButton(slot0, slot1)
	slot2 = getProxy(ActivityProxy)
	slot3 = slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2:isEnd()

	setActive(slot1, slot3)

	if slot3 then
		onButton(slot0, slot1, function ()
			uv0:emit(MainUIMediator.ON_ACTIVITY_MAP, uv1.id)
		end, SFX_PANEL)
	end
end

slot0[2] = {
	Image = "event_map",
	ButtonName = "activity_map_btn"
}

function slot1.CtorButton(slot0, slot1)
	slot2 = getProxy(MiniGameProxy)

	if slot2:GetMiniGameData(3) and not slot2:GetRuntimeData("isInited") then
		slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
			3,
			1
		})
	end
end

function slot1.UpdateButton(slot0, slot1)
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

slot0[3] = {
	Image = "event_minigame",
	ButtonName = "activity_newyear",
	Tip = "tip_1920"
}

function slot1.UpdateButton(slot0, slot1)
	setActive(slot1, OPEN_ESCORT)
	onButton(slot0, slot1, function ()
		uv0:emit(MainUIMediator.OPEN_ESCORT)
	end, SFX_PANEL)
end

slot0[4] = {
	Image = "event_escort",
	ButtonName = "activity_escort"
}

function slot1.UpdateButton(slot0, slot1)
	slot2 = getProxy(ActivityProxy)
	slot3 = slot2:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) and not slot2:isEnd()

	setActive(slot1, slot3)

	if slot3 then
		slot4 = false
		slot5 = getProxy(ActivityProxy)

		if slot5:getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then
			slot4 = ActivityBossPtData.New(slot5):CanGetAward()
		end

		setActive(slot1:Find("Tip"), slot4)
		onButton(slot0, slot1, function ()
			slot3[1] = SCENE.ACT_BOSS_BATTLE

			uv0:emit(MainUIMediator.GO_SCENE, {})
		end, SFX_PANEL)
	end
end

slot0[5] = {
	Tip = "tip",
	Image = "event_boss",
	ButtonName = "activity_boss"
}

function slot1.UpdateButton(slot0, slot1)
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

slot0[6] = {
	ButtonName = "activity_ins"
}

return {}
