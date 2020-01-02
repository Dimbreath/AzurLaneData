slot0 = class("PtTemplatePage", import("....base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.slider = slot0:findTF("slider", slot0.bg)
	slot0.step = slot0:findTF("step", slot0.bg)
	slot0.progress = slot0:findTF("progress", slot0.bg)
	slot0.displayBtn = slot0:findTF("display_btn", slot0.bg)
	slot0.awardTF = slot0:findTF("award", slot0.bg)
	slot0.battleBtn = slot0:findTF("battle_btn", slot0.bg)
	slot0.getBtn = slot0:findTF("get_btn", slot0.bg)
	slot0.gotBtn = slot0:findTF("got_btn", slot0.bg)
end

function slot0.OnDataSetting(slot0)
	if slot0.ptData then
		slot0.ptData:Update(slot0.activity)
	else
		slot0.ptData = ActivityPtData.New(slot0.activity)
	end
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
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

function slot0.OnDestroy(slot0)
	return
end

function slot0.GetWorldPtData(slot0, slot1)
	if slot1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		slot0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = slot0.ptData:GetId()
		})
	end
end

return slot0
