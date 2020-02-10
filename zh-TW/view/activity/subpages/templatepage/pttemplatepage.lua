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

function slot0.OnDestroy(slot0)
end

function slot0.GetWorldPtData(slot0, slot1)
	if slot1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()
		slot5.activity_id = slot0.ptData:GetId()

		slot0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2
		})
	end
end

return slot0
