slot0 = class("JapanesePTPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.displayBtn, function ()
		uv0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			type = uv0.ptData.type,
			dropList = uv0.ptData.dropList,
			targets = uv0.ptData.targets,
			level = uv0.ptData.level,
			count = uv0.ptData.count,
			resId = uv0.ptData.resId
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		uv0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0, slot1 = uv0.ptData:GetResProgress()

		uv0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = uv0.ptData:GetId(),
			arg1 = slot1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	if checkExist(slot0.activity:getConfig("config_client").story, {
		slot0.ptData:getTargetLevel()
	}, {
		1
	}) and not pg.StoryMgr.GetInstance():IsPlayed(slot2[slot1][1]) then
		slot3:Play(slot2[slot1][1])
	end

	slot3, slot4, slot5 = slot0.ptData:GetLevelProgress()
	slot6, slot7, slot8 = slot0.ptData:GetResProgress()

	setText(slot0.step, slot3 .. "/" .. slot4)
	setText(slot0.progress, (slot8 >= 1 and setColorStr(slot6, COLOR_GREEN) or slot6) .. "/" .. slot7)
	setSlider(slot0.slider, 0, 1, slot8)

	slot9 = slot0.ptData:CanGetAward()
	slot10 = slot0.ptData:CanGetNextAward()

	setActive(slot0.battleBtn, slot0.ptData:CanGetMorePt() and not slot9 and slot10)
	setActive(slot0.getBtn, slot9)
	setActive(slot0.gotBtn, not slot10)
	updateDrop(slot0.awardTF, slot0.ptData:GetAward())
	onButton(slot0, slot0.awardTF, function ()
		uv0:emit(BaseUI.ON_DROP, uv1)
	end, SFX_PANEL)
end

return slot0
