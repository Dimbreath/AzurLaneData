slot0 = class("JapanesePTPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.displayBtn, function ()
		slot0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			type = slot0.ptData.type,
			dropList = slot0.ptData.dropList,
			targets = slot0.ptData.targets,
			level = slot0.ptData.level,
			count = slot0.ptData.count,
			resId = slot0.ptData.resId
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		slot0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot2, slot5.arg1 = slot0.ptData:GetResProgress()

		slot0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = slot0.ptData:GetId(),
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

	slot11, slot13, slot5 = slot0.ptData:GetLevelProgress()
	slot6, slot7, slot8 = slot0.ptData:GetResProgress()

	setText(slot0.step, slot3 .. "/" .. slot4)
	setText(slot0.progress, ((slot8 >= 1 and setColorStr(slot6, COLOR_GREEN)) or slot6) .. "/" .. slot7)
	setSlider(slot0.slider, 0, 1, slot8)
	setActive(slot0.battleBtn, slot0.ptData:CanGetMorePt() and not slot0.ptData:CanGetAward() and slot0.ptData:CanGetNextAward())
	setActive(slot0.getBtn, slot0.ptData.CanGetAward())
	setActive(slot0.gotBtn, not slot0.ptData.CanGetNextAward())
	updateDrop(slot0.awardTF, setActive)
	onButton(slot0, slot0.awardTF, function ()
		slot0:emit(BaseUI.ON_DROP, slot0)
	end, SFX_PANEL)
end

return slot0
