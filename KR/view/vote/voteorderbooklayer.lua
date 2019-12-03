slot0 = class("VoteOrderBookLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "VoteOrderBookUI"
end

function slot0.setOrderBook(slot0, slot1)
	slot0.orderBook = slot1
	slot0.targetDir = slot0.orderBook:GetDir()
	slot0.dirs = slot0.orderBook:GetBitEncode()
	slot0.ships = slot0.orderBook:GetShips()
	slot0.awardCnt = slot0.orderBook:GetAwardCnt()
	slot0.opRecords = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
end

function slot0.init(slot0)
	slot0.backBtn = slot0._tf
	slot0.timeTF = slot0:findTF("window/main/time"):GetComponent(typeof(Text))
	slot0.submitBtn = slot0:findTF("window/main/sbumit")
	slot0.dirTF = slot0:findTF("window/main/manjuu")
	slot0.failed = slot0:findTF("window/main/failed")
	slot0.failedAnim = slot0.failed:GetComponent(typeof(Animation))
	slot0.failedDftAniEvent = slot0.failed:GetComponent(typeof(DftAniEvent))
	slot0.failedCallbacks = {}

	slot0.failedDftAniEvent:SetEndEvent(function (slot0)
		for slot4, slot5 in ipairs(slot0.failedCallbacks) do
			slot5()
		end

		slot0.failedCallbacks = {}
	end)

	slot0.sucess = slot0:findTF("window/main/sucess")
	slot0.sucessAnim = slot0.sucess:GetComponent(typeof(Animation))
	slot0.sucessCallbacks = {}
	slot0.sucessDftAniEvent = slot0.sucess:GetComponent(typeof(DftAniEvent))

	slot0.sucessDftAniEvent:SetEndEvent(function (slot0)
		for slot4, slot5 in ipairs(slot0.sucessCallbacks) do
			slot5()
		end

		slot0.sucessCallbacks = {}
	end)

	slot0.awardCntTF = slot0:findTF("window/main/award"):GetComponent(typeof(Text))

	SetActive(slot0.failed, false)
	SetActive(slot0.sucess, false)

	slot0.icons = {
		slot0:findTF("window/main/container/1"),
		slot0:findTF("window/main/container/2"),
		slot0:findTF("window/main/container/3"),
		slot0:findTF("window/main/container/4"),
		slot0:findTF("window/main/container/5"),
		slot0:findTF("window/main/container/6"),
		slot0:findTF("window/main/container/7")
	}

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.didEnter(slot0)
	slot0.dirTF.localScale = Vector3((slot0.targetDir == VoteOrderBook.TYPE_POSITIVE and -1) or 1, 1, 1)

	slot0:LoadChars()
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_PANEL)
	onButton(slot0, slot0.submitBtn, function ()
		if not slot0.orderBook:canSubmit() then
			return
		end

		slot0:emit(VoteOrderBookMediator.ON_SUBMIT, table.concat(slot0.opRecords, ""))
	end, SFX_PANEL)
	slot0:AddOverTimer()

	slot0.awardCntTF.text = slot0.awardCnt
end

function slot0.LoadChars(slot0)
	function slot1(slot0, slot1, slot2)
		if slot2 then
			rtf(slot3).pivot = getSpritePivot(slot2)
			slot0.icons[slot0].GetComponent(slot3, typeof(Image)).sprite = slot2

			slot0.icons[slot0].GetComponent(slot3, typeof(Image)):SetNativeSize()

			slot3.localScale = Vector3((slot1 == "0" and 1) or -1, 1, 1)

			onButton(slot0, slot3, function ()
				slot0.localScale = Vector3(-slot0.localScale.x, 1, 1)
				slot1[slot2] = (slot1.opRecords[Vector3(-slot0.localScale.x, 1, 1)] == 1 and 0) or 1
			end, SFX_PANEL)
		end
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.dirs) do
		table.insert(slot2, function (slot0)
			LoadSpriteAsync("shipmodels/" .. slot0.ships[]:getPainting(), function (slot0)
				slot0(slot0, , slot0)
				slot0()
			end)
		end)
	end

	parallelAsync(slot2, function ()
		return
	end)
end

function slot0.AddOverTimer(slot0)
	slot1 = slot0.orderBook:GetEndTime()
	slot0.timer = Timer.New(function ()
		if slot0 - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
			slot1.timeTF.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
		else
			slot1:RemoveOverTimer()

			slot1.RemoveOverTimer.timeTF.text = "00:00:00"
		end
	end, 1, -1)

	slot0.timer:Start()
	slot0.timer.func()
end

function slot0.RemoveOverTimer(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

function slot0.PlayAnim(slot0, slot1, slot2)
	if slot1 then
		setActive(slot0.sucess, true)
		slot0.sucessAnim:Play("blink")
		table.insert(slot0.sucessCallbacks, function ()
			setActive(slot0.sucess, false)
			setActive.sucessAnim:Stop("blink")
			setActive.sucessAnim()
		end)
	else
		setActive(slot0.failed, true)
		slot0.failedAnim:Play("blink")
		table.insert(slot0.failedCallbacks, function ()
			slot0.failedAnim:Stop("blink")
			setActive(slot0.failed, false)
			slot0.failed()
		end)
	end
end

function slot0.willExit(slot0)
	slot0.failedDftAniEvent:SetEndEvent(nil)
	slot0.sucessDftAniEvent:SetEndEvent(nil)
	slot0:RemoveOverTimer()
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, pg.UIMgr.GetInstance()._normalUIMain)
end

return slot0
