slot0 = class("CommanderHomeLayer", import("...base.BaseUI"))

function slot0.getUIName(slot0)
	return "CommanderHomeUI"
end

function slot0.SetHome(slot0, slot1)
	slot0.home = slot1
end

function slot0.OnCatteryUpdate(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.cards) do
		if slot7.cattery.id == slot1 then
			slot7:Update(slot7.cattery)
		end
	end

	if slot2 and slot0.catteryDescPage:GetLoaded() and slot0.catteryDescPage:isShowing() then
		slot0.catteryDescPage:OnCatteryUpdate(slot2)
	end

	slot0:UpdateMain()
end

function slot0.OnCatteryStyleUpdate(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.cards) do
		if slot7.cattery.id == slot1 then
			slot7:UpdateStyle(slot7.cattery)
		end
	end

	if slot2 and slot0.catteryDescPage:GetLoaded() and slot0.catteryDescPage:isShowing() then
		slot0.catteryDescPage:OnCatteryStyleUpdate(slot2)
	end
end

function slot0.OnCommanderExpChange(slot0)
	for slot4, slot5 in pairs(slot0.cards) do
		if slot5.cattery:ExistCommander() then
			slot5:Update(slot6)
		end
	end

	if slot0.catteryDescPage:GetLoaded() and slot0.catteryDescPage:isShowing() then
		slot0.catteryDescPage:FlushCatteryInfo()
	end
end

function slot0.OnCatteryOPDone(slot0)
	slot0:UpdateMain()
end

function slot0.OnZeroHour(slot0)
	slot0:UpdateMain()
end

function slot0.OnOpAnimtion(slot0, slot1, slot2)
	setActive(slot0.opAnim.gameObject, true)

	if not ({
		"clean",
		"feed",
		"play"
	})[slot1] then
		slot2()

		return
	end

	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	slot8 = 1
	slot0.timer = Timer.New(function ()
		uv0:CancelOpAnim()
	end, 1, slot8)

	slot0.timer:Start()
	slot0.opAnim:SetTrigger(slot4)

	for slot8, slot9 in pairs(slot0.cards) do
		if slot9.cattery:ExistCommander() then
			floatAni(slot9.char, 20, 0.1, 2)
		end
	end

	slot0.callback = slot2
end

function slot0.CancelOpAnim(slot0)
	if slot0.callback then
		slot0.timer:Stop()

		slot0.timer = nil

		slot0.opAnim:SetTrigger("empty")
		slot0.callback()

		slot0.callback = nil

		setActive(slot0.opAnim.gameObject, false)
	end
end

function slot0.OnDisplayAwardDone(slot0, slot1)
	slot0.awardDisplayView:AddPlan(slot1)
end

function slot0.init(slot0)
	slot0.closeBtn = slot0:findTF("bg/frame/close_btn")
	slot0.helpBtn = slot0:findTF("bg/frame/title/help")
	slot0.levelTxt = slot0:findTF("bg/frame/title/Text"):GetComponent(typeof(Text))
	slot0.scrollRect = slot0:findTF("bg/frame/scrollrect"):GetComponent("ScrollRect")
	slot0.scrollRectContent = slot0:findTF("bg/frame/scrollrect/content")
	slot0.opAnim = slot0:findTF("animation"):GetComponent(typeof(Animator))
	slot0.UIlist = UIItemList.New(slot0.scrollRectContent, slot0.scrollRectContent:Find("tpl"))
	slot0.cards = {}
	slot0.catteryDescPage = CatteryDescPage.New(slot0._tf, slot0.event, slot0.contextData)
	slot0.levelInfoPage = CommanderHomeLevelInfoPage.New(slot0._tf, slot0.event, slot0.contextData)
	slot0.awardDisplayView = CommanderHomeAwardDisplayView.New(slot0._tf, slot0.cards)
	slot0.flower = CatteryFlowerView.New(slot0:findTF("bg/frame/flower"))
	slot0.bubbleTF = slot0:findTF("bg/bubble")
	slot0.bubbleClean = slot0.bubbleTF:Find("clean")
	slot0.bubbleFeed = slot0.bubbleTF:Find("feed")
	slot0.bubblePlay = slot0.bubbleTF:Find("play")
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.closeBtn, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		if uv0.forbiddenClose then
			return
		end

		uv0:emit(uv1.ON_CLOSE)
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		uv0.levelInfoPage:ExecuteAction("Show", uv0.home)
	end, SFX_PANEL)
	onButton(slot0, slot0.bubbleClean, function ()
		uv0:CancelOpAnim()
		uv0:emit(CommanderHomeMediator.ON_CLEAN)
	end, SFX_PANEL)
	onButton(slot0, slot0.bubbleFeed, function ()
		uv0:CancelOpAnim()
		uv0:emit(CommanderHomeMediator.ON_FEED)
	end, SFX_PANEL)
	onButton(slot0, slot0.bubblePlay, function ()
		uv0:CancelOpAnim()
		uv0:emit(CommanderHomeMediator.ON_PLAY)
	end, SFX_PANEL)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0:OnUpdateItem(slot2, uv0.displays[slot1 + 1])
		end
	end)
	slot0:UpdateMain()

	slot0.UIMgr = pg.UIMgr.GetInstance()

	slot0.UIMgr:BlurPanel(slot0._tf)
end

function slot0.OnUpdateItem(slot0, slot1, slot2)
	if not slot0.cards[slot1] then
		slot0.cards[slot1] = CatteryCard.New(slot1)
	end

	onButton(slot0, slot3._tf, function ()
		if not uv0.cattery:IsLocked() then
			uv1.catteryDescPage:ExecuteAction("Update", uv1.home, uv0.cattery)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("cat_home_unlock"))
		end
	end, SFX_PANEL)
	slot3:Update(slot2)
end

function slot0.UpdateMain(slot0)
	slot0.levelTxt.text = "LV." .. slot0.home:GetLevel()

	slot0:InitCatteries()
	slot0.flower:Update(slot0.home)
end

function slot0.InitCatteries(slot0)
	slot0.displays = {}

	for slot6, slot7 in pairs(slot0.home:GetCatteries()) do
		table.insert(slot0.displays, slot7)
	end

	slot0.UIlist:align(#slot0.displays)
	slot0:UpdateBubble()
end

function slot0.UpdateBubble(slot0)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.home:GetCatteries()) do
		if slot7:ExiseFeedOP() or slot7:ExistPlayOP() or slot7:ExistCleanOP() then
			slot2 = slot7
		end
	end

	setActive(slot0.bubbleTF, slot2 ~= nil)

	if LeanTween.isTweening(slot0.bubbleTF.gameObject) then
		LeanTween.cancel(slot0.bubbleTF.gameObject)
	end

	if slot3 then
		floatAni(slot0.bubbleTF, 20, 0.5, -1)
		setActive(slot0.bubbleClean, slot2:ExistCleanOP())
		setActive(slot0.bubbleFeed, slot2:ExiseFeedOP() and not slot4)
		setActive(slot0.bubblePlay, slot2:ExistPlayOP() and not slot5)
	end
end

function slot0.willExit(slot0)
	slot0.UIMgr:UnblurPanel(slot0._tf, slot0.UIMgr._normalUIMain)

	if LeanTween.isTweening(slot0.bubbleTF.gameObject) then
		LeanTween.cancel(slot0.bubbleTF.gameObject)
	end

	for slot4, slot5 in pairs(slot0.cards) do
		slot5:Dispose()
	end

	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	slot0.cards = nil

	slot0.flower:Dispose()

	slot0.flower = nil

	slot0.catteryDescPage:Destroy()

	slot0.catteryDescPage = nil

	slot0.levelInfoPage:Destroy()

	slot0.levelInfoPage = nil

	slot0.awardDisplayView:Dispose()
end

function slot0.onBackPressed(slot0)
	if slot0.catteryDescPage:GetLoaded() and slot0.catteryDescPage:isShowing() then
		slot0.catteryDescPage:Hide()

		return
	end

	if slot0.levelInfoPage:GetLoaded() and slot0.levelInfoPage:isShowing() then
		slot0.levelInfoPage:Hide()

		return
	end

	uv0.super.onBackPressed(slot0)
end

return slot0
