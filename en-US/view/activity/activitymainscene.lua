slot0 = class("ActivityMainScene", import("..base.BaseUI"))
slot0.LOCK_ACT_MAIN = "ActivityMainScene:LOCK_ACT_MAIN"
slot0.UPDATE_ACTIVITY = "ActivityMainScene:UPDATE_ACTIVITY"
slot0.SELECT_ACTIVITY_OPEN = "ActivityMainScene:SELECT_ACTIVITY_OPEN"

function slot0.preload(slot0, slot1)
	slot1()
end

function slot0.getUIName(slot0)
	return "ActivityMainUI"
end

function slot0.onBackPressed(slot0)
	if slot0.locked then
		return
	end

	for slot4, slot5 in pairs(slot0.windowList) do
		if isActive(slot5._tf) then
			slot0:HideWindow(slot5.class)

			return
		end
	end

	slot0:emit(uv0.ON_BACK_PRESSED)
end

slot1 = nil

function slot0.init(slot0)
	slot0.btnBack = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.pageContainer = slot0:findTF("pages")
	slot0.tabs = slot0:findTF("scroll/viewport/content")
	slot0.tab = slot0:findTF("tab", slot0.tabs)
	slot0.entranceList = UIItemList.New(slot0:findTF("enter/viewport/content"), slot0:findTF("enter/viewport/content/btn"))
	slot0.windowList = {}
	slot0.lockAll = slot0:findTF("blur_panel/lock_all")

	setActive(slot0.lockAll, false)
	setActive(slot0.tab, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	slot0:updateEntrances()
	slot0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY)
	slot0:bind(uv0.LOCK_ACT_MAIN, function (slot0, slot1)
		uv0.locked = slot1

		setActive(uv0.lockAll, slot1)
	end)
	slot0:bind(uv0.UPDATE_ACTIVITY, function (slot0, slot1)
		uv0:updateActivity(slot1)
	end)
	slot0:bind(uv0.SELECT_ACTIVITY_OPEN, function ()
		uv0:selectActivityOpen()
	end)
end

function slot0.setPlayer(slot0, slot1)
	slot0.shareData:SetPlayer(slot1)
end

function slot0.setFlagShip(slot0, slot1)
	slot0.shareData:SetFlagShip(slot1)
end

function slot0.setAllActivity(slot0, slot1)
	slot0.allActivity = slot1
end

function slot0.updateTaskLayers(slot0)
	if not slot0.activity then
		return
	end

	slot0:updateActivity(slot0.activity)
end

function slot0.setActivities(slot0, slot1)
	slot0.activities = slot1 or {}
	slot0.shareData = slot0.shareData or ActivityShareData.New()
	slot0.pageDic = slot0.pageDic or {}

	for slot5, slot6 in ipairs(slot1) do
		if slot6:getConfig("page_info").class_name and not slot0.pageDic[slot6.id] and not slot6:isEnd() then
			if import("view.activity.subPages." .. slot7.class_name).New(slot0.pageContainer, slot0.event, slot0.contextData):UseSecondPage(slot6) then
				slot9:SetUIName(slot7.ui_name2)
			else
				slot9:SetUIName(slot7.ui_name)
			end

			slot9:SetShareData(slot0.shareData)

			slot0.pageDic[slot6.id] = slot9
		end
	end

	slot0.activity = nil

	table.sort(slot0.activities, function (slot0, slot1)
		if slot0:getShowPriority() == slot1:getShowPriority() then
			return slot1.id < slot0.id
		end

		return slot3 < slot2
	end)
	slot0:flushTabs()
end

function slot0.updateActivity(slot0, slot1)
	slot0.allActivity[slot1.id] = slot1

	if not slot1:isShow() then
		if ActivityConst.PageIdLink[slot1.id] then
			slot1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[slot1.id])
		else
			slot0:flushTabs()

			if slot0.pageDic[slot1.id] then
				slot2:ActionInvoke("OnHideFulsh", slot1)
			end

			return
		end
	end

	slot0.activities[function ()
		for slot3, slot4 in ipairs(uv0.activities) do
			if slot4.id == uv1.id then
				return slot3
			end
		end

		return #uv0.activities + 1
	end()] = slot1

	slot0:flushTabs()

	if slot0.activity and slot0.activity.id == slot1.id then
		slot0.activity = slot1

		slot0.pageDic[slot1.id]:ActionInvoke("Flush", slot1)
	end
end

function slot0.GetOnShowEntranceData()
	uv0 = uv0 or require("GameCfg.activity.EntranceData")
	uv0 = uv0 or {}

	return _.select(uv0, function (slot0)
		return slot0.isShow and slot0.isShow()
	end)
end

function slot0.updateEntrances(slot0)
	slot0.entranceList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = "empty"

			removeOnButton(slot2)

			slot5 = false

			if uv0[slot1 + 1] and table.getCount(slot3) ~= 0 and slot3.isShow() then
				onButton(uv1, slot2, function ()
					uv0:emit(uv1.event, uv1.data[1], uv1.data[2])
				end, SFX_PANEL)

				slot4 = slot3.banner

				if slot3.isTip then
					slot5 = slot3.isTip()
				end
			end

			setActive(slot2:Find("tip"), slot5)
			LoadImageSpriteAsync("activitybanner/" .. slot4, slot2)
		end
	end)
	slot0.entranceList:align(math.max(#uv0.GetOnShowEntranceData(), 5))
end

function slot0.flushTabs(slot0)
	if not slot0.tabsList then
		slot0.tabsList = UIItemList.New(slot0.tabs, slot0.tab)

		slot0.tabsList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				if uv0.pageDic[uv0.activities[slot1 + 1].id] ~= nil then
					if slot3:getConfig("title_res_tag") then
						setImageSprite(uv0:findTF("off/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text"), true)
						setImageSprite(uv0:findTF("on/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text_selected") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text_selected"), true)
						setActive(uv0:findTF("red", slot2), slot3:readyToAchieve())
						onToggle(uv0, slot2, function (slot0)
							if slot0 then
								uv0:selectActivity(uv1)
							end
						end, SFX_PANEL)
					else
						onToggle(uv0, slot2, function (slot0)
							uv0:loadActivityPanel(slot0, uv1)
						end, SFX_PANEL)
					end
				end
			end
		end)
	end

	slot0.tabsList:align(#slot0.activities)
end

function slot0.selectActivity(slot0, slot1)
	if slot1 and (not slot0.activity or slot0.activity.id ~= slot1.id) then
		slot2 = slot0.pageDic[slot1.id]

		slot2:Load()
		slot2:ActionInvoke("Flush", slot1)
		slot2:ActionInvoke("ShowOrHide", true)

		if slot0.activity and slot0.activity.id ~= slot1.id then
			slot0.pageDic[slot0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		slot0.activity = slot1
		slot0.contextData.id = slot1.id

		if slot0.openPageId ~= slot1.id then
			slot0.openPageId = nil
			slot0.openPageFlag = nil
		end
	end
end

function slot0.verifyTabs(slot0, slot1)
	slot2 = 1

	warning(slot1)

	for slot6, slot7 in ipairs(slot0.activities) do
		warning("ACT ", slot7)

		if slot7.id == slot1 then
			slot2 = slot6

			break
		end
	end

	triggerToggle(slot0.tabs:GetChild(slot2 - 1), true)
end

function slot0.loadActivityPanel(slot0, slot1, slot2)
	slot3 = slot2:getConfig("type")

	if nil and slot1 then
		slot0:emit(ActivityMediator.OPEN_LAYER, slot4)
	elseif slot4 and not slot1 then
		slot0:emit(ActivityMediator.CLOSE_LAYER, slot4.mediator)
	else
		print("------活动id为" .. slot2.id .. "类型为" .. slot2:getConfig("type") .. "的页面不存在")
	end
end

function slot0.getBonusWindow(slot0, slot1, slot2)
	if not slot0:findTF(slot1) then
		PoolMgr.GetInstance():GetUI("ActivitybonusWindow", true, function (slot0)
			SetParent(slot0, uv0._tf, false)

			slot0.name = uv1

			uv2(slot0)
		end)
	else
		slot2(slot3)
	end
end

function slot0.ShowWindow(slot0, slot1, slot2)
	if not slot0.windowList[slot1.__cname] then
		slot0:getBonusWindow(slot3, function (slot0)
			uv0.windowList[uv1] = uv2.New(tf(slot0), uv0)

			uv0.windowList[uv1]:Show(uv3)
		end)
	else
		slot0.windowList[slot3]:Show(slot2)
	end
end

function slot0.HideWindow(slot0, slot1)
	if not slot0.windowList[slot1.__cname] then
		return
	end

	slot0.windowList[slot2]:Hide()
end

function slot0.selectActivityOpen(slot0)
	if slot0.activity ~= nil then
		slot0.openPageFlag = true

		if slot0.openPageCallBack and slot0.openPageId == slot0.activity.id then
			slot0.openPageCallBack()

			slot0.openPageCallBack = nil
		end
	end
end

function slot0.setSelectOpenHandle(slot0, slot1, slot2)
	if slot0.openPageFlag and slot1 == slot0.activity.id then
		slot2()
	else
		slot0.openPageId = slot1
		slot0.openPageCallBack = slot2
	end
end

function slot0.willExit(slot0)
	slot0.shareData = nil

	for slot4, slot5 in pairs(slot0.pageDic) do
		slot5:Destroy()
	end

	for slot4, slot5 in pairs(slot0.windowList) do
		slot5:Dispose()
	end
end

return slot0
