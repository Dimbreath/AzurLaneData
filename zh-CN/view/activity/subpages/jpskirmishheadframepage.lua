slot0 = class("JPSkirmishHeadFramePage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.goBtn = slot0:findTF("GoBtn", slot0.bg)
	slot0.getBtn = slot0:findTF("GetBtn", slot0.bg)
	slot0.gotBtn = slot0:findTF("GotBtn", slot0.bg)
	slot0.gotTag = slot0:findTF("GotTag", slot0.bg)
	slot0.progressBar = slot0:findTF("Progress", slot0.bg)
	slot0.progressText = slot0:findTF("ProgressText", slot0.bg)

	setActive(slot0.goBtn, false)
	setActive(slot0.getBtn, false)
	setActive(slot0.gotBtn, false)
	setActive(slot0.gotTag, false)
	setActive(slot0.progressText, false)
end

function slot0.OnDataSetting(slot0)
	if slot0.ptData then
		slot1 = slot0.ptData

		slot1:Update(slot0.activity)
	else
		slot0.ptData = ActivityPtData.New(slot0.activity)
	end
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	onButton(slot0, slot0.goBtn, function ()
		slot0 = uv0

		slot0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0 = uv0.ptData
		slot0, slot5.arg1 = slot0:GetResProgress()
		slot2 = uv0
		slot6 = uv0.ptData

		slot2:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = slot6:GetId(),
			arg1 = slot1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot1 = getProxy(ActivityProxy)

	if not slot1:getActivityById(ActivityConst.JP_SKIRMISH_EXP_ID) or slot1:isEnd() then
		slot2 = slot0.ptData
		slot8, slot9, slot9 = slot2:GetResProgress()

		setText(slot0.progressText, setColorStr(slot2, "#487CFFFF") .. "/" .. slot3)
		setSlider(slot0.progressBar, 0, 1, slot4)
		setActive(slot0.progressText, true)

		slot5 = slot0.ptData
		slot5 = slot5:CanGetAward()
		slot6 = slot0.ptData
		slot6 = slot6:CanGetNextAward()
		slot7 = slot0.ptData
		slot8 = setActive
		slot9 = slot0.goBtn
		slot10 = slot7:CanGetMorePt() and not slot5 and slot6

		slot8(slot9, slot10)
		setActive(slot0.getBtn, slot5)
		setActive(slot0.gotBtn, not slot6)
		setActive(slot0.gotTag, not slot6)
	end
end

function slot0.OnDestroy(slot0)
end

return slot0
