slot0 = class("ActivityScene", import("..base.BaseUI"))
slot1 = {
	[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = "7days_login",
	[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = "level_award",
	[ActivityConst.ACTIVITY_TYPE_LEVELPLAN] = nil,
	[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = "month_sign",
	[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = nil,
	[ActivityConst.ACTIVITY_TYPE_CHARGEAWARD] = "charge_award",
	[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = nil,
	[ActivityConst.ACTIVITY_TYPE_SHOP] = nil,
	[ActivityConst.ACTIVITY_TYPE_DAILY_TASK] = nil,
	[ActivityConst.ACTIVITY_TYPE_PUZZLA] = nil,
	[ActivityConst.ACTIVITY_TYPE_BB] = nil,
	[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = nil,
	[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = nil,
	[ActivityConst.ACTIVITY_TYPE_ANSWER] = nil,
	[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE] = nil,
	[ActivityConst.ACTIVITY_TYPE_TASKS] = nil,
	[ActivityConst.ACTIVITY_TYPE_SUMMARY] = nil,
	[ActivityConst.ACTIVITY_TYPE_TASK_RES] = nil,
	[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = nil
}
slot2 = {}
slot3 = {
	[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = "clutter/activity_bg_7days_login",
	[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = "clutter/activity_bg_level_award",
	[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = "clutter/activity_bg_month_sign",
	[ActivityConst.ACTIVITY_TYPE_CHARGEAWARD] = "clutter/activity_bg_charge_award"
}
slot4 = {}
slot5 = {}
slot6 = "Assets/ArtResource/UI/ActivityUI/page"

function slot0.preload(slot0, slot1)
	slot1()
end

function slot0.getUIName(slot0)
	return "ActivityUI"
end

function slot0.init(slot0)
	slot0.pages = {}
	slot0.pagesInit = {}
	slot0.activities = {}
	slot0.activity = nil
	slot0.pageId = {}
	slot0.btnBack = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.tabs = slot0:findTF("scroll/viewport/content")
	slot0.tab = slot0:findTF("tab", slot0.tabs)

	setActive(slot0.tab, false)

	slot0.animation = slot0:findTF("animation")

	eachChild(slot0.animation, function (slot0)
		setActive(slot0, false)
	end)
	setActive(slot0.animation, true)

	slot0.UIMain = pg.UIMgr:GetInstance().UIMain
	slot0.overlay = pg.UIMgr:GetInstance().OverlayMain

	eachChild(slot0:findTF("pages"), function (slot0)
		uv0.pages[slot0.name] = slot0.gameObject

		uv0.pages[slot0.name]:SetActive(false)
	end)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
end

function slot0.setActivities(slot0, slot1)
	slot0.activities = slot1 or {}

	slot0:flushTabs()
end

function slot0.setAllActivity(slot0, slot1)
	slot0.allActivity = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setFlagShip(slot0, slot1)
	slot0.flagShip = slot1
end

function slot0.updateActivity(slot0, slot1)
	slot0.allActivity[slot1.id] = slot1

	if not slot1:isShow() then
		if uv0[slot1.id] then
			slot1 = getProxy(ActivityProxy):getActivityById(uv0[slot1.id])
		else
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

		slot0:flushActivity()
		slot0:verifyTabs()
	end
end

function slot0.updateTaskLayers(slot0)
	slot0["flush_" .. slot0:activity2Page(slot0.activity)](slot0)
end

function slot0.selectActivity(slot0, slot1)
	if (_.detect(slot0.activities, function (slot0)
		return slot0.id == uv0
	end) or slot0.activities[1]) and (not slot0.activity or slot0.activity.id ~= slot2.id) then
		if not slot0.activity then
			slot0.pages[slot0:activity2Page(slot2)]:SetActive(true)
		elseif slot0.activity.id ~= slot2.id then
			slot4 = slot0:activity2Page(slot0.activity)

			slot0.pages[slot4]:SetActive(false)

			if slot0["close_" .. slot4] then
				slot0["close_" .. slot4](slot0)
			end

			slot0.pages[slot3]:SetActive(true)
		end

		slot0.activity = slot2
		slot0.contextData.id = slot2.id

		slot0:flushActivity()
		slot0:verifyTabs()
	end
end

function slot0.flushActivity(slot0)
	slot0["flush_" .. slot0:activity2Page(slot0.activity)](slot0)
end

function slot0.activity2Page(slot0, slot1)
	return uv0[slot1.id] or uv1[slot1:getConfig("type")]
end

function slot0.activity2Bg(slot0, slot1)
	return uv0[slot1.id] or uv1[slot1:getConfig("type")]
end

function slot0.flushTabs(slot0)
	if not slot0.tabsList then
		slot0.tabsList = UIItemList.New(slot0.tabs, slot0.tab)

		slot0.tabsList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				if uv0:activity2Page(uv0.activities[slot1 + 1]) then
					setImageSprite(uv0:findTF("off/text", slot2), getImageSprite(uv0:findTF("text/" .. slot4 .. "_text") or uv0:findTF("text/default_text")), true)
					setImageSprite(uv0:findTF("on/text", slot2), getImageSprite(uv0:findTF("text/" .. slot4 .. "_text_selected") or uv0:findTF("text/default_text_selected")), true)
					setActive(uv0:findTF("red", slot2), slot3:readyToAchieve())
					onToggle(uv0, slot2, function (slot0)
						if slot0 then
							uv0:selectActivity(uv1.id)
						end
					end, SFX_PANEL)
				else
					onToggle(uv0, slot2, function (slot0)
						uv0:loadActivityPanel(slot0, uv1)
					end, SFX_PANEL)
				end
			end
		end)
	end

	slot0.tabsList:align(#slot0.activities)
end

function slot0.loadActivityPanel(slot0, slot1, slot2)
	slot4 = nil

	if slot2:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		slot4 = Context.New({
			mediator = HitMonsterNianMediator,
			viewComponent = HitMonsterNianLayer
		})
	end

	if slot4 and slot1 then
		slot0:emit(ActivityMediator.OPEN_LAYER, slot4)
	elseif slot4 and not slot1 then
		slot0:emit(ActivityMediator.CLOSE_LAYER, slot4.mediator)
	else
		print("------活动id为" .. slot2.id .. "类型为" .. slot2:getConfig("type") .. "的页面不存在")
	end
end

function slot0.verifyTabs(slot0)
	slot1 = slot0.tabs:GetChild(table.indexof(slot0.activities, slot0.activity) - 1)
	slot2 = slot0:findTF("text", slot1)
	slot3 = slot0:findTF("text_selected", slot1)

	triggerToggle(slot1, true)
end

function slot0.clearTabs(slot0)
	removeAllChildren(slot0.tabs)
end

function slot0.flush_7days_login(slot0)
	slot1 = slot0.activity
	slot3 = pg.activity_7_day_sign[slot1:getConfig("config_id")]

	if not slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		slot4 = {
			bg = slot0:findTF("bg", slot2)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot1), slot4.bg)

		slot4.labelDay = slot0:findTF("days", slot2)
		slot4.items = slot0:findTF("items", slot2)
		slot8 = slot2
		slot4.item = slot0:findTF("item", slot8)

		setActive(slot4.item, false)

		for slot8 = 1, 7 do
			slot9 = cloneTplTo(slot4.item, slot4.items)
			slot11 = slot3.front_drops[slot8]

			updateDrop(slot0:findTF("item", slot9), {
				type = slot11[1],
				id = slot11[2],
				count = slot11[3]
			})
			onButton(slot0, slot9, function ()
				uv0:emit(uv1.ON_DROP, uv2)
			end, SFX_PANEL)
		end

		slot0.pagesInit[slot2.name] = slot4
		slot0.pageId[slot2.name] = slot1.id
	end

	slot8 = slot4.labelDay

	GetImageSpriteFromAtlasAsync("ui/activityui_atlas", string.format("0%d", math.max(slot1.data1, 1)), slot8, true)

	for slot8 = 1, 7 do
		slot9 = slot4.items:GetChild(slot8 - 1)
		slot10 = slot8 <= slot1.data1

		GetImageSpriteFromAtlasAsync("ui/activityui_atlas", string.format("day%d", slot8) .. (slot10 and "_sel" or ""), slot0:findTF("day", slot9), true)
		setActive(slot0:findTF("got", slot9), slot10)
	end
end

function slot0.clear_7days_login(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)
		removeAllChildren(slot3.items)
	end
end

function slot0.flush_level_award(slot0)
	slot1 = slot0.activity
	slot3 = pg.activity_level_award[slot1:getConfig("config_id")]

	if not slot0.pagesInit[slot0.pages[uv0[slot1:getConfig("type")]].name] then
		slot4 = {
			bg = slot0:findTF("bg", slot2)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot1), slot4.bg)

		slot4.content = slot0:findTF("scroll/content", slot2)
		slot8 = slot2
		slot4.award = slot0:findTF("scroll/award", slot8)

		setActive(slot4.award, false)

		for slot8 = 1, #slot3.front_drops do
			slot9 = slot3.front_drops[slot8]
			slot11 = cloneTplTo(slot4.award, slot4.content, "award" .. tostring(slot8))
			slot13 = slot0:findTF("btnAchieve", slot11)

			setActive(slot0:findTF("item", slot11), false)

			slot19 = slot0:findTF("limit_label/labelLevel", slot11)

			GetImageSpriteFromAtlasAsync("ui/activityui_atlas", uv1 .. "/" .. slot2.name .. "/" .. tostring(slot9[1]) .. ".png", slot19, true)

			for slot19 = 2, #slot9 do
				slot20 = cloneTplTo(slot15, slot0:findTF("items", slot11))
				slot21 = slot9[slot19]

				updateDrop(slot20, {
					type = slot21[1],
					id = slot21[2],
					count = slot21[3]
				})
				onButton(slot0, slot20, function ()
					uv0:emit(uv1.ON_DROP, uv2)
				end, SFX_PANEL)
			end

			onButton(slot0, slot13, function ()
				uv0:emit(ActivityMediator.EVENT_OPERATION, {
					cmd = 1,
					activity_id = uv1.id,
					arg1 = uv2
				})
			end, SFX_PANEL)
		end

		slot0.pagesInit[slot2.name] = slot4
		slot0.pageId[slot2.name] = slot1.id
	end

	for slot8 = 1, #slot3.front_drops do
		slot10 = slot0:findTF("award" .. tostring(slot8), slot4.content)
		slot11 = slot0:findTF("btnAchieve", slot10)
		slot12 = slot0:findTF("achieve_sign", slot10)

		if _.include(slot1.data1_list, slot3.front_drops[slot8][1]) then
			slot10.transform:SetAsLastSibling()
		end

		setGray(slot0:findTF("limit_label", slot10), slot13)
		setGray(slot0:findTF("items", slot10), slot13)
		setActive(slot12, slot13)
		setActive(slot11, slot9[1] <= slot0.player.level and not slot13)
	end
end

function slot0.clear_level_award(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		removeAllChildren(slot3.content)
	end
end

function slot0.flush_month_sign(slot0)
	slot1 = slot0.activity
	slot2 = slot0.pages[uv0[slot1:getConfig("type")]]

	if not pg.activity_month_sign[slot1.data2] then
		return
	end

	slot4 = pg.TimeMgr.GetInstance():CalcMonthDays(slot1.data1, slot1.data2)

	if not slot0.pagesInit[slot2.name] then
		slot5 = {
			bg = slot0:findTF("bg", slot2)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot1), slot5.bg)

		slot5.items = slot0:findTF("items", slot2)
		slot5.item = slot0:findTF("item", slot5.items)
		slot5.list = UIItemList.New(slot5.items, slot5.item)

		slot5.list:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot3 = slot1 + 1

				updateDrop(slot2, _.map(uv0["day" .. slot3], function (slot0)
					return {
						type = slot0[1],
						id = slot0[2],
						count = slot0[3]
					}
				end)[1])
				onButton(uv1, slot2, function ()
					if #uv0 == 1 then
						uv1:emit(uv2.ON_DROP, uv0[1])
					else
						uv1:emit(uv2.ON_DROP_LIST, {
							content = "",
							item2Row = true,
							itemList = uv0
						})
					end
				end, SFX_PANEL)
				setText(slot2:Find("day/Text"), "Day " .. slot3)
				setActive(slot2:Find("got"), slot3 <= #uv3.data1_list)
				setActive(slot2:Find("today"), slot3 == #uv3.data1_list)
			end
		end)

		slot0.pagesInit[slot2.name] = slot5
		slot0.pageId[slot2.name] = slot1.id
	end

	slot5.list:align(slot4)
end

function slot0.clear_month_sign(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		removeAllChildren(slot3.items)
	end
end

function slot0.flush_charge_award(slot0)
	if not slot0.pagesInit[slot0.pages[uv0[slot0.activity:getConfig("type")]].name] then
		slot3 = {
			bg = slot0:findTF("bg", slot2)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot1), slot3.bg)

		slot3.charge = slot0:findTF("charge", slot2)
		slot3.take = slot0:findTF("take", slot2)
		slot3.finish = slot0:findTF("finish", slot2)

		onButton(slot0, slot3.charge, function ()
			uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.CHARGE, {
				wrap = ChargeScene.TYPE_DIAMOND
			})
		end)
		onButton(slot0, slot3.take, function ()
			uv0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = uv1.id
			})
		end)

		slot0.pagesInit[slot2.name] = slot3
		slot0.pageId[slot2.name] = slot1.id
	end

	setActive(slot3.charge, slot1.data2 == 0 and slot1.data1 == 0)
	setButtonEnabled(slot3.take, slot1.data2 == 0)
	setActive(slot3.take, slot1.data1 > 0)
	setActive(slot3.finish, slot1.data2 == 1)
end

function slot0.clear_charge_award(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)
	end
end

function slot0.showPtBonusList(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name]
	slot7, slot8, slot9 = slot0:GetDoingTask(slot1)

	if not slot9:isReceive() then
		slot7 = slot7 - 1
	end

	slot10 = nil

	if slot1.id == ActivityConst.GR_ACTIVITY_ID then
		slot10 = getProxy(ChapterProxy):getChapterById(1050013) and slot12.defeatCount or 0
	elseif slot1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RES then
		slot10 = slot9 and slot9:getProgress() or pg.task_data_template[slot8].target_num
	else
		slot10 = ptActivity.data1
		slot11 = getProxy(ActivityProxy):getActivityById(slot1:getConfig("config_client").rank_act_id)
	end

	if not slot6.initPtBonusList then
		slot6.bonusWindow = slot0:findTF("bonusWindow")
		slot6.ptPanel = slot0:findTF("window/panel", slot6.bonusWindow)
		slot6.ptBonusContainer = slot0:findTF("list", slot6.ptPanel)
		slot6.ptBonusTpl = slot0:findTF("item", slot6.ptBonusContainer)
		slot6.initPtBonusList = true

		onButton(slot0, slot6.bonusWindow, function ()
			setActive(uv0.bonusWindow, false)
		end, SOUND_BACK)
		onButton(slot0, slot0:findTF("window/top/btnBack", slot6.bonusWindow), function ()
			setActive(uv0.bonusWindow, false)
		end, SOUND_BACK)

		slot6.itemList = UIItemList.New(slot6.ptBonusContainer, slot6.ptBonusTpl)

		slot6.itemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot5 = pg.task_data_template[uv0[slot1 + 1]].award_display[1]

				updateDrop(slot2:Find("award"), {
					type = slot5[1],
					id = slot5[2],
					count = slot5[3]
				})
				onButton(uv1, slot2:Find("award"), function ()
					uv0:emit(uv1.ON_DROP, uv2)
				end, SFX_PANEL)
				setActive(slot2:Find("award/mask"), slot1 + 1 <= uv3)
				setText(slot2:Find("target/Text"), slot4.target_num)
				setText(slot2:Find("target/title"), uv4)
				setText(slot2:Find("title/Text"), "PHASE   " .. slot1 + 1)
			end
		end)

		slot0.pagesInit[slot5.name] = slot6
		slot0.pageId[slot5.name] = slot1.id
	end

	slot6.itemList:align(#slot2)
	setText(slot0:findTF("window/pt/title", slot6.bonusWindow), slot4)
	setText(slot0:findTF("window/pt/Text", slot6.bonusWindow), slot10)
	setActive(slot6.bonusWindow, true)
end

function slot0.flush_activity_pt(slot0, slot1, slot2, slot3)
	slot4 = slot0.activity
	slot7 = _.flatten(slot4:getConfig("config_data"))

	if not slot0.pagesInit[slot0.pages[slot0:activity2Page(slot4)].name] then
		slot6 = {
			bg = slot0:findTF("bg", slot5)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot4), slot6.bg)

		slot6.btn = slot0:findTF("btn", slot5)
		slot6.bonusList = slot0:findTF("bonus_list", slot5)
		slot6.progress = slot0:findTF("progress", slot5)
		slot6.progressTxt = slot0:findTF("progressText", slot5)
		slot6.phaseTxt = slot0:findTF("phase/Text", slot5)
		slot6.award = slot0:findTF("award", slot5)
		slot8 = pg.item_data_statistics[id2ItemId(slot4:getConfig("config_client").pt_id)].name

		onButton(slot0, slot6.bonusList, function ()
			uv0:showPtBonusList(uv1, uv2, i18n("pt_count", uv3), i18n("pt_total_count", uv3))
		end)

		slot0.pagesInit[slot5.name] = slot6
		slot0.pageId[slot5.name] = slot4.id
	end

	if slot4:getConfig("config_client").story then
		slot9 = pg.StoryMgr.GetInstance()

		if slot8[slot3][1] and not slot9:IsPlayed(slot8[slot3][1]) then
			slot9:Play(slot8[slot3][1])
		end
	end

	slot10 = getProxy(ActivityProxy):getActivityById(slot4:getConfig("config_client").rank_act_id).data1
	slot11, slot12, slot13 = slot0:GetDoingTask(slot4)

	setText(slot6.phaseTxt, slot11 .. "/" .. #slot7)

	if slot13 then
		slot14 = slot13:getConfig("target_num")

		setText(slot6.progressTxt, setColorStr(math.min(slot10, slot14), slot10 < slot14 and COLOR_RED or COLOR_GREEN) .. "/" .. slot14)
		setSlider(slot6.progress, 0, slot14, math.min(slot10, slot14))

		slot16 = slot13:getConfig("award_display")[1]

		updateDrop(slot6.award, {
			type = slot16[1],
			id = slot16[2],
			count = slot16[3]
		})
		onButton(slot0, slot6.award, function ()
			uv0:emit(uv1.ON_DROP, uv2)
		end, SFX_PANEL)

		slot6.btn:GetComponent(typeof(Image)).enabled = not slot13:isFinish()

		setActive(slot6.btn:Find("get"), slot13:isFinish() and not slot13:isReceive())
		setActive(slot6.btn:Find("got"), slot13:isReceive())
		onButton(slot0, slot6.btn, function ()
			if not uv0:isFinish() then
				uv1:emit(ActivityMediator.ON_TASK_GO, uv0)
			else
				if not uv1:TaskSubmitCheck(uv0) then
					return
				end

				uv1:emit(ActivityMediator.ON_TASK_SUBMIT, uv0)
			end
		end, SFX_PANEL)
		setButtonEnabled(slot6.btn, not slot13:isReceive())
	end

	return slot11, slot13, slot10
end

function slot0.clear_task_list_pt(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)
	end
end

function slot0.flush_task_list_res(slot0)
	if updateActivityTaskStatue(slot0.activity) then
		return
	end

	slot5 = pg.item_data_statistics[id2ItemId(pg.task_data_template[getProxy(TaskProxy):getActivityTask(slot0.activity)].sub_type == TASK_SUB_TYPE_RES_GOLD and 1 or slot3 == TASK_SUB_TYPE_RES_OIL and 2 or nil)].name

	slot0:update_task_list_res_layer(slot0.activity, i18n("pt_count", slot5), i18n("pt_total_count", slot5))
end

function slot0.update_task_list_res_layer(slot0, slot1, slot2, slot3)
	slot4 = slot0.activity
	slot7 = _.flatten(slot4:getConfig("config_data"))

	if not slot0.pagesInit[slot0.pages[slot0:activity2Page(slot4)].name] then
		slot6 = {
			bg = slot0:findTF("bg", slot5)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot4), slot6.bg)

		slot6.layer = slot0:findTF("layer", slot5)
		slot6.btn = slot0:findTF("btn", slot6.layer)
		slot6.progress = slot0:findTF("progress", slot6.layer):GetComponent(typeof(Slider))
		slot6.progressTxt = slot0:findTF("progressText", slot6.layer):GetComponent(typeof(Text))
		slot6.phaseTxt = slot0:findTF("phase/Text", slot6.layer):GetComponent(typeof(Text))
		slot6.award = slot0:findTF("award", slot6.layer)
		slot6.awardMask = slot0:findTF("mask", slot6.award)
		slot6.detailBtn = slot0:findTF("bonus_list", slot6.layer)

		onButton(slot0, slot6.detailBtn, function ()
			uv0:showPtBonusList(uv1, uv2, uv3, uv4)
		end, SFX_PANEL)

		slot0.pagesInit[slot5.name] = slot6
		slot0.pageId[slot5.name] = slot4.id
	end

	slot8, slot9, slot10 = slot0:GetDoingTask(slot4)

	if slot10 then
		setActive(slot6.award, true)

		slot6.progress.value = slot10:getProgress() / slot10:getConfig("target_num")
		slot6.progressTxt.text = slot10:getProgress() .. "/" .. slot10:getConfig("target_num")
		slot6.phaseTxt.text = slot8 .. "/" .. #slot7
		slot11 = slot10:getConfig("award_display")[1]

		updateDrop(slot6.award, {
			type = slot11[1],
			id = slot11[2],
			count = slot11[3]
		})
		onButton(slot0, slot6.award, function ()
			uv0:emit(uv1.ON_DROP, uv2)
		end, SFX_PANEL)

		slot6.btn:GetComponent(typeof(Image)).enabled = not slot10:isFinish()

		setActive(slot6.btn:Find("get"), slot10:isFinish() and not slot10:isReceive())
		setActive(slot6.btn:Find("got"), slot10:isReceive())
		setButtonEnabled(slot6.btn, not slot10:isReceive())
		setActive(slot6.awardMask, slot10:isReceive())
		onButton(slot0, slot6.btn, function ()
			if not uv0:isFinish() then
				uv1:emit(ActivityMediator.ON_TASK_GO, uv0)
			else
				uv1:emit(ActivityMediator.ON_TASK_SUBMIT, uv0)
			end
		end, SFX_PANEL)
	end
end

function slot0.clear_task_list_res(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)
	end
end

function slot0.flush_task_list(slot0)
	slot1, slot2 = updateActivityTaskStatue(slot0.activity)

	if slot1 then
		return
	end

	slot0:update_task_list(slot2)
end

function slot0.update_task_list(slot0, slot1)
	slot2 = slot0.activity
	slot4 = getProxy(TaskProxy)
	slot5 = slot2:getConfig("config_data")

	if not slot0.pagesInit[slot0.pages[slot0:activity2Page(slot2)].name] then
		slot6 = {
			bg = slot0:findTF("bg", slot3)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot2), slot6.bg)

		slot6.layer = slot0:findTF("layer", slot3)
		slot6.day = slot0:findTF("day", slot6.layer)
		slot6.items = slot0:findTF("items", slot6.layer)
		slot6.layout = slot0:findTF("layout", slot6.items)
		slot6.item = slot0:findTF("item", slot6.layout)
		slot6.itemList = UIItemList.New(slot6.layout, slot6.item)

		slot6.itemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot5 = uv3:findTF("btn", slot2)

				if uv2:getTaskById(uv0[uv1][slot1 + 1]) or uv2:getFinishTaskById(slot3) then
					slot6 = slot4.progress
					slot7 = slot4:getConfig("target_num")

					setText(uv3:findTF("description", slot2), slot4:getConfig("desc"))
					setSlider(uv3:findTF("progress", slot2), 0, slot7, slot6)
					setText(uv3:findTF("progressText", slot2), slot6 .. "/" .. slot7)

					slot8 = uv3:findTF("award", slot2)
					slot9 = slot4:getConfig("award_display")[1]

					updateDrop(slot8, {
						type = slot9[1],
						id = slot9[2],
						count = slot9[3]
					})
					onButton(uv3, slot8, function ()
						uv0:emit(uv1.ON_DROP, uv2)
					end, SFX_PANEL)

					slot5:GetComponent(typeof(Image)).enabled = not slot4:isFinish()

					setActive(slot5:Find("get"), slot4:isFinish() and not slot4:isReceive())
					setActive(slot5:Find("got"), slot4:isReceive())
					setButtonEnabled(slot5, not slot4:isReceive())
					onButton(uv3, slot5, function ()
						if not uv0:isFinish() then
							uv1:emit(ActivityMediator.ON_TASK_GO, uv0)
						else
							uv1:emit(ActivityMediator.ON_TASK_SUBMIT, uv0)
						end
					end, SFX_PANEL)
				end
			end
		end)

		slot0.pagesInit[slot3.name] = slot6
		slot0.pageId[slot3.name] = slot2.id
	end

	if slot2:getConfig("config_client").story then
		slot8 = pg.StoryMgr.GetInstance()

		if slot7[slot1][1] and not slot8:IsPlayed(slot7[slot1][1]) then
			slot8:Play(slot7[slot1][1])
		end
	end

	if slot6.day then
		setText(slot6.day, tostring(slot1))
	end

	slot6.itemList:align(#slot5[slot1])
end

function slot0.clear_task_list(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)
	end
end

function slot0.flush_preview_page(slot0, slot1)
	if not slot0.pagesInit[slot0.pages[slot0:activity2Page(slot0.activity)].name] then
		slot4 = {
			bg = slot0:findTF("bg", slot3)
		}

		LoadImageSpriteAsync(slot0:activity2Bg(slot2), slot4.bg)

		slot4.task = slot0:findTF("btn_list/task", slot3)
		slot4.shop = slot0:findTF("btn_list/shop", slot3)
		slot4.fight = slot0:findTF("btn_list/fight", slot3)
		slot4.build = slot0:findTF("btn_list/build", slot3)
		slot4.lottery = slot0:findTF("btn_list/lottery", slot3)
		slot4.memory = slot0:findTF("btn_list/memory", slot3)
		slot0.pagesInit[slot3.name] = slot4
		slot0.pageId[slot3.name] = slot2.id
	end

	onButton(slot0, slot4.task, function ()
		uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity"
		})
	end)
	onButton(slot0, slot4.shop, function ()
		if not uv0:isEnd() then
			uv1:emit(ActivityMediator.GO_SHOPS_LAYER)
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_not_start"))
		end
	end)
	onButton(slot0, slot4.build, function ()
		uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			projectName = "new"
		})
	end)
	onButton(slot0, slot4.fight, function ()
		if not uv0:isEnd() then
			uv1:emit(ActivityMediator.BATTLE_OPERA)
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_activity_not_start"))
		end
	end)
	onButton(slot0, slot4.lottery, function ()
		uv0:emit(ActivityMediator.GO_LOTTERY)
	end)
	onButton(slot0, slot4.memory, function ()
		uv0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.COLLECTSHIP, {
			toggle = 4,
			memoryGroup = uv1
		})
	end)
end

function slot0.clear_preview_page(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)
	end
end

function slot0.TaskSubmitCheck(slot0, slot1)
	if slot1.id == 13983 then
		for slot6, slot7 in ipairs(getProxy(BayProxy):getShips()) do
			if slot7:getGroupId() == 1030006 and slot7:isActivityNpc() then
				return true
			end
		end

		pg.TipsMgr:GetInstance():ShowTips(i18n("task_submitTask_error_client"))

		return false
	end

	return true
end

function slot0.GetDoingTask(slot0, slot1)
	slot2 = getProxy(TaskProxy)
	slot3 = _.flatten(slot1:getConfig("config_data"))
	slot4, slot5, slot6 = nil

	if slot1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASKS then
		for slot10 = #slot3, 1, -1 do
			if slot2:getTaskById(slot3[slot10]) or slot2:getFinishTaskById(slot5) then
				slot4 = slot10

				break
			end
		end
	else
		slot7, slot8 = slot2:getActivityTask(slot1)
		slot6 = slot8 or slot2:getFinishTaskById(slot3[table.indexof(slot3, slot7) - 1])
	end

	return slot4, slot5, slot6
end

function slot0.clear_commond_page(slot0, slot1)
	if slot0.pagesInit[slot0.pages[slot0:activity2Page(slot1)].name] then
		clearImageSprite(slot3.bg)

		if slot3.scrollTextList then
			for slot7, slot8 in ipairs(slot3.scrollTextList) do
				slot8:destroy()
			end
		end
	end
end

function slot0.willExit(slot0)
	slot1 = nil

	for slot5, slot6 in ipairs(slot0.activities) do
		if slot0:activity2Page(slot6) then
			if slot0["clear_" .. slot1] then
				slot0["clear_" .. slot1](slot0, slot6)
			else
				slot0:clear_commond_page(slot6)
			end
		end
	end

	slot0:clearTabs()

	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end
end

return slot0
