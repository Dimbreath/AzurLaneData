slot0 = class("NewYearShrinePage", import("...base.BaseActivityPage"))
slot0.MAX_COUNT = 7

function slot0.OnInit(slot0)
	slot0.progressTpl = slot0:findTF("ProgressTpl")
	slot0.progressTplContainer = slot0:findTF("ProgressList")
	slot0.progressUIItemList = UIItemList.New(slot0.progressTplContainer, slot0.progressTpl)
	slot0.countText = slot0:findTF("CountText")
	slot1 = slot0:findTF("Award")
	slot0.lockTF = slot0:findTF("Unlock", slot1)
	slot0.getBtn = slot0:findTF("Achieve", slot1)
	slot0.gotTag = slot0:findTF("Got", slot1)
	slot0.goBtn = slot0:findTF("GoBtn")
end

function slot0.OnDataSetting(slot0)
	slot0.isAchieved = slot0.activity.data1
	slot0.playCount = slot0.activity.data2
	slot0.startTimestamp = slot0.activity.data3
	slot0.dayFromStart = pg.TimeMgr.GetInstance():DiffDay(slot0.startTimestamp, pg.TimeMgr.GetInstance():GetServerTime()) + 1
	slot0.curDay = math.clamp(slot0.dayFromStart, 1, slot0.MAX_COUNT)
	slot0.storyIDTable = {}

	if slot0.activity:getConfig("config_client").story then
		for slot5, slot6 in ipairs(slot1) do
			if slot6[1] then
				slot0.storyIDTable[slot5] = slot7
			end
		end
	end
end

function slot0.OnFirstFlush(slot0)
	setText(slot0.countText, slot1)
	slot0.progressUIItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = slot0:findTF("Achieve", slot2)
			slot4 = slot0:findTF("Unlock", slot2)

			setActive(slot0:findTF("Lock", slot2), slot1 + 1 > slot0.curDay)

			if slot1 <= slot0.curDay then
				setActive(slot3, slot1 <= slot1)
				setActive(slot4, slot1 < slot1)
			else
				setActive(slot3, false)
				setActive(slot4, true)
			end
		end
	end)
	slot0.progressUIItemList:align(slot0.MAX_COUNT)
	onButton(slot0, slot0.goBtn, function ()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NEWYEAR_SQUARE, {
			isOpenShrine = true
		})
	end, SFX_PANEL)

	slot2 = {}
	slot3 = pg.StoryMgr.GetInstance()
	slot4 = math.clamp(slot0.playCount, 0, slot0.MAX_COUNT)

	for slot8 = 1, slot0.MAX_COUNT, 1 do
		if slot0.storyIDTable[slot8] and slot8 <= slot0.curDay and slot8 <= slot4 and not slot3:IsPlayed(slot9) then
			table.insert(slot2, function (slot0)
				slot0:Play(slot0.Play, slot0)
			end)
		end
	end

	seriesAsync(slot2, function ()
		print("play story done,count:", #slot0)
		"play story done,count:":emit(ActivityMainScene.UPDATE_ACTIVITY, slot1.activity)
	end)
end

function slot0.OnUpdateFlush(slot0)
	setActive(slot0.gotTag, slot0.isAchieved > 0)

	if slot0.MAX_COUNT <= slot0.curDay and slot0.MAX_COUNT <= slot0.playCount and slot0.isAchieved <= 0 then
		setActive(slot0.lockTF, false)
		setActive(slot0.getBtn, true)
		onButton(slot0, slot0.getBtn, function ()
			if slot0.isAchieved <= 0 then
				slot0:emit(ActivityMediator.EVENT_OPERATION, {
					cmd = 1,
					activity_id = slot0.activity.id
				})
			end
		end, SFX_PANEL)
	elseif slot0.isAchieved > 0 then
		setActive(slot0.lockTF, false)
		setActive(slot0.getBtn, true)
	else
		setActive(slot0.lockTF, true)
		setActive(slot0.getBtn, false)
	end
end

function slot0.OnDestroy(slot0)
	return
end

function slot0.IsTip()
	if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_SHRINE_PAGE_ID) and not slot0:isEnd() then
		return math.clamp(slot0.data2, 0, slot0.MAX_COUNT) < math.clamp(slot1, 1, slot0.MAX_COUNT)
	end
end

return slot0
