slot0 = class("JapanesePTPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.displayBtn, function ()
		slot4.type = uv0.ptData.type
		slot4.dropList = uv0.ptData.dropList
		slot4.targets = uv0.ptData.targets
		slot4.level = uv0.ptData.level
		slot4.count = uv0.ptData.count
		slot4.resId = uv0.ptData.resId

		uv0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {})
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		uv0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0, slot5.arg1 = uv0.ptData:GetResProgress()
		slot5.activity_id = uv0.ptData:GetId()

		uv0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot1 = slot0.ptData
	slot2 = slot0.activity
	slot5[1] = slot1:getTargetLevel()

	if checkExist(slot2:getConfig("config_client").story, {}, {
		1
	}) then
		slot3 = pg.StoryMgr.GetInstance()

		if not slot3:IsPlayed(slot2[slot1][1]) then
			slot3:Play(slot2[slot1][1])
		end
	end

	slot3 = slot0.ptData
	slot11, slot13, slot5 = slot3:GetLevelProgress()
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
