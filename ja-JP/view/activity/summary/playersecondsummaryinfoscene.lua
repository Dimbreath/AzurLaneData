slot0 = class("PlayerSecondSummaryInfoScene", import("...base.BaseUI"))

function slot0.getUIName(slot0)
	return "PlayerSecondSummaryUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activityVO = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.palyerVO = slot1
end

function slot0.setSummaryInfo(slot0, slot1)
	slot0.summaryInfoVO = slot1
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("bg/back_btn")
	slot0.pageContainer = slot0:findTF("bg/main/pages")
	slot0.pageFootContainer = slot0:findTF("bg/main/page_foot")

	setActive(slot0.pageFootContainer, false)
end

function slot0.didEnter(slot0)
	if slot0.summaryInfoVO then
		slot0:initSummaryInfo()
	else
		slot0:emit(PlayerSummaryInfoMediator.GET_PLAYER_SUMMARY_INFO)
	end

	onButton(slot0, slot0.backBtn, function ()
		if uv0:inAnim() then
			return
		end

		uv0:closeView()
	end, SFX_CANCEL)
end

function slot0.inAnim(slot0)
	return slot0.inAniming or slot0.currPage and slot0.pages[slot0.currPage]:inAnim()
end

function slot0.initSummaryInfo(slot0)
	slot0.loadingPage = SecondSummaryPage1.New(slot0:findTF("page1", slot0.pageContainer))
	slot0.pages = {
		SecondSummaryPage2.New(slot0:findTF("page2", slot0.pageContainer)),
		SecondSummaryPage3.New(slot0:findTF("page3", slot0.pageContainer)),
		SecondSummaryPage4.New(slot0:findTF("page4", slot0.pageContainer)),
		SecondSummaryPage4.New(cloneTplTo(slot0:findTF("page4", slot0.pageContainer), slot0.pageContainer, "page4_2")),
		SecondSummaryPage4.New(cloneTplTo(slot0:findTF("page4", slot0.pageContainer), slot0.pageContainer, "page4_3")),
		SecondSummaryPage4.New(cloneTplTo(slot0:findTF("page4", slot0.pageContainer), slot0.pageContainer, "page4_4")),
		SecondSummaryPage5.New(slot0:findTF("page5", slot0.pageContainer))
	}

	table.foreachi(slot0.pages, function (slot0, slot1)
		setActive(slot1._tf, false)
	end)

	function slot1()
		for slot4, slot5 in ipairs(uv0.pages) do
			if slot5.__cname == "SecondSummaryPage4" then
				slot5:Init(setmetatable({
					furniturePage = 0 + 1
				}, {
					__index = uv0.summaryInfoVO
				}))
			else
				slot5:Init(uv0.summaryInfoVO)
			end
		end

		onButton(uv0, uv0:findTF("page5/share", uv0.pageContainer), function ()
			pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeSecondSummary)
		end, SFX_CONFIRM)
	end

	seriesAsync({
		function (slot0)
			uv0.inAniming = true

			uv0.loadingPage:Init(uv0.summaryInfoVO)
			uv0.loadingPage:Show(slot0)
			uv1()
		end,
		function (slot0)
			uv0.inAniming = false

			uv0.loadingPage:Hide()
			uv0:registerFootEvent()
			uv0:registerDrag()
			slot0()
		end
	}, function ()
		setActive(uv0.pageFootContainer, true)
		uv0:updatePageFoot(1)
	end)
end

function slot0.registerFootEvent(slot0)
	slot1 = UIItemList.New(slot0.pageFootContainer:Find("toggles"), slot0.pageFootContainer:Find("toggles/dot"))

	slot1:make(function (slot0, slot1, slot2)
		slot3 = slot1 + 1

		if slot0 == UIItemList.EventUpdate then
			onToggle(uv0, slot2, function (slot0)
				if slot0 then
					uv0.pages[uv1]:Show()

					uv0.currPage = uv1
				else
					uv0.pages[uv0.currPage]:Hide()
				end
			end)
		end
	end)
	slot1:align(#slot0.pages)
end

function slot0.registerDrag(slot0)
	slot0:addVerticalDrag(slot0:findTF("bg"), function ()
		uv0:updatePageFoot(uv0.currPage - 1)
	end, function ()
		uv0:updatePageFoot(uv0.currPage + 1)
	end)
end

function slot0.updatePageFoot(slot0, slot1)
	if slot0:inAnim() or not slot0.pages[slot1] then
		return
	end

	triggerToggle(slot0.pageFootContainer:Find("toggles"):GetChild(slot1 - 1), true)
end

function slot0.addVerticalDrag(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot5 = nil
	slot6 = 0
	slot7 = 50

	slot4:AddBeginDragFunc(function (slot0, slot1)
		uv0 = 0
		uv1 = slot1.position
	end)
	slot4:AddDragFunc(function (slot0, slot1)
		uv0 = slot1.position.x - uv1.x
	end)
	slot4:AddDragEndFunc(function (slot0, slot1)
		if uv0 < -uv1 then
			if uv2 then
				uv2()
			end
		elseif uv1 < uv0 and uv3 then
			uv3()
		end
	end)
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.pages) do
		slot5:Dispose()
	end

	slot0.pages = nil
	slot0.currPage = nil
end

return slot0
