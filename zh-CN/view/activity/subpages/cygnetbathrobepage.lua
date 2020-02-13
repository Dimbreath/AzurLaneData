slot0 = class("CygnetBathrobePage", import("...base.BaseActivityPage"))
slot0.MAX_COUNT = 7

function slot0.OnInit(slot0)
	slot0.drawBtn = slot0:findTF("DrawBtn")
	slot0.resultTF = slot0:findTF("ResultImg")
	slot0.resultImgLittle = slot0:findTF("Little", slot0.resultTF)
	slot0.resultImgMiddle = slot0:findTF("Middle", slot0.resultTF)
	slot0.resultImgBig = slot0:findTF("Big", slot0.resultTF)
	slot0.progressTF = slot0:findTF("Progress")
	slot0.progressText = slot0:findTF("Progress/ProgressText")
	slot0.gotImg = slot0:findTF("GotImg")
	slot0.awardPanel = slot0:findTF("AwardPanel")
	slot0.itemTpl = slot0:findTF("itemTpl", slot0.awardPanel)
	slot0.resultTextTF = slot0:findTF("ResultImg", slot0.awardPanel)
	slot0.resultTextLittle = slot0:findTF("ResultImg/Little", slot0.awardPanel)
	slot0.resultTextMiddle = slot0:findTF("ResultImg/Middle", slot0.awardPanel)
	slot0.resultTextBig = slot0:findTF("ResultImg/Big", slot0.awardPanel)
	slot0.itemTplContainer = slot0:findTF("AwardList", slot0.awardPanel)
	slot0.animTF = slot0:findTF("Anim")
end

function slot0.OnDataSetting(slot0)
	slot0.progressNum = slot0.activity.data1
	slot0.resultNum = slot0.activity.data2
	slot0.awardDayList = slot0.activity.data1_list
	slot0.isFinished = slot0.MAX_COUNT < slot0.progressNum
	slot0.isAvailable = slot0.resultNum <= 0
end

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.drawBtn, function ()
		slot0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = slot0.activity.id
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	setActive(slot0.drawBtn, slot0.isAvailable)
	setActive(slot0.resultTF, not slot0.isAvailable)

	if not slot0.isAvailable then
		for slot4 = 1, slot0.resultTF.childCount, 1 do
			setActive(slot0.resultTF:GetChild(slot4 - 1), slot4 == slot0.resultNum)
		end
	end

	setActive(slot0.progressTF, not slot0.isFinished)
	setActive(slot0.gotImg, slot0.isFinished)

	if not slot0.isFinished then
		setText(slot0.progressText, slot0.progressNum .. "/" .. slot0.MAX_COUNT)
	end

	if slot0.activity:getConfig("config_data")[2] then
		for slot5, slot6 in ipairs(slot1) do
			if slot0.progressNum == slot6[1] then
				slot0:emit(ActivityMediator.EVENT_OPERATION, {
					cmd = 2,
					activity_id = slot0.activity.id,
					arg1 = slot6[1]
				})

				return
			end
		end
	end
end

function slot0.OnDestroy(slot0)
	return
end

function slot0.showLotteryAwardResult(slot0, slot1, slot2, slot3)
	GetComponent(slot0.animTF, typeof(DftAniEvent)).SetEndEvent(slot4, function (slot0)
		setActive(slot0.animTF, false)
		setActive(slot0.awardPanel, true)

		for slot4 = 1, slot0.resultTextTF.childCount, 1 do
			setActive(slot0.resultTextTF:GetChild(slot4 - 1), slot4 == slot1)
		end

		removeAllChildren(slot0.itemTplContainer)

		for slot4, slot5 in ipairs(slot0.itemTplContainer) do
			updateDrop(slot6, slot7)
			onButton(slot0, cloneTplTo(slot0.itemTpl, slot0.itemTplContainer), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
		end

		slot0:emit(ActivityMainScene.LOCK_ACT_MAIN, false)
		slot3()
		onButton(slot0, slot0.awardPanel, function ()
			setActive(slot0.awardPanel, false)
		end)
	end)
	setActive(slot0.animTF, true)
	slot0:emit(ActivityMainScene.LOCK_ACT_MAIN, true)
end

function slot0.IsTip()
	if getProxy(ActivityProxy):getActivityById(ActivityConst.CYGNET_BATHROBE_PAGE_ID) and not slot0:isEnd() then
		return slot0.data2 <= 0
	end
end

return slot0
