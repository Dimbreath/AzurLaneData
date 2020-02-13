slot0 = class
slot1 = "ActivityScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = {}
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_7DAYSLOGIN
slot3 = "7days_login"
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_LEVELAWARD
slot3 = "level_award"
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_LEVELPLAN
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_MONTHSIGN
slot3 = "month_sign"
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_PROGRESSLOGIN
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_CHARGEAWARD
slot3 = "charge_award"
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_ZPROJECT
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_SHOP
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_DAILY_TASK
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_PUZZLA
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_BB
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_HITMONSTERNIAN
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_CARD_PAIRS
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_ANSWER
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_BOSS_BATTLE
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_TASKS
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_SUMMARY
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_TASK_RES
slot3 = nil
slot1[slot2] = slot3
slot2 = ActivityConst
slot2 = slot2.ACTIVITY_TYPE_LINK_LINK
slot3 = nil
slot1[slot2] = slot3
slot2 = {}
slot3 = {}
slot4 = ActivityConst
slot4 = slot4.ACTIVITY_TYPE_7DAYSLOGIN
slot5 = "clutter/activity_bg_7days_login"
slot3[slot4] = slot5
slot4 = ActivityConst
slot4 = slot4.ACTIVITY_TYPE_LEVELAWARD
slot5 = "clutter/activity_bg_level_award"
slot3[slot4] = slot5
slot4 = ActivityConst
slot4 = slot4.ACTIVITY_TYPE_MONTHSIGN
slot5 = "clutter/activity_bg_month_sign"
slot3[slot4] = slot5
slot4 = ActivityConst
slot4 = slot4.ACTIVITY_TYPE_CHARGEAWARD
slot5 = "clutter/activity_bg_charge_award"
slot3[slot4] = slot5
slot4 = {}
slot5 = {}
slot6 = "Assets/ArtResource/UI/ActivityUI/page"

function slot7(slot0, slot1)
	slot2 = slot1

	slot2()
end

slot0.preload = slot7

function slot7(slot0)
	slot1 = "ActivityUI"

	return slot1
end

slot0.getUIName = slot7

function slot7(slot0)
	slot1 = {}
	slot0.pages = slot1
	slot1 = {}
	slot0.pagesInit = slot1
	slot1 = {}
	slot0.activities = slot1
	slot1 = nil
	slot0.activity = slot1
	slot1 = {}
	slot0.pageId = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_panel/adapt/top/back_btn"
	slot1 = slot1(slot2, slot3)
	slot0.btnBack = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "scroll/viewport/content"
	slot1 = slot1(slot2, slot3)
	slot0.tabs = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "tab"
	slot4 = slot0.tabs
	slot1 = slot1(slot2, slot3, slot4)
	slot0.tab = slot1
	slot1 = setActive
	slot2 = slot0.tab
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "animation"
	slot1 = slot1(slot2, slot3)
	slot0.animation = slot1
	slot1 = eachChild
	slot2 = slot0.animation

	function slot3(slot0)
		slot1 = setActive
		slot2 = slot0
		slot3 = false

		slot1(slot2, slot3)
	end

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.animation
	slot3 = true

	slot1(slot2, slot3)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot2 = slot1
	slot1 = slot1.GetInstance
	slot1 = slot1(slot2)
	slot1 = slot1.UIMain
	slot0.UIMain = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot2 = slot1
	slot1 = slot1.GetInstance
	slot1 = slot1(slot2)
	slot1 = slot1.OverlayMain
	slot0.overlay = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "pages"
	slot1 = slot1(slot2, slot3)
	slot2 = eachChild
	slot3 = slot1

	function slot4(slot0)
		slot1 = slot0
		slot1 = slot1.pages
		slot2 = slot0.name
		slot3 = slot0.gameObject
		slot1[slot2] = slot3
		slot1 = slot0
		slot1 = slot1.pages
		slot2 = slot0.name
		slot1 = slot1[slot2]
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)
	end

	slot2(slot3, slot4)
end

slot0.init = slot7

function slot7(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.btnBack

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = slot1
		slot2 = slot2.ON_BACK

		slot0(slot1, slot2)
	end

	slot5 = SOUND_BACK

	slot1(slot2, slot3, slot4, slot5)
end

slot0.didEnter = slot7

function slot7(slot0, slot1)
	slot0.activities = slot1 or {}
	slot3 = slot0
	slot2 = slot0.flushTabs

	slot2(slot3)
end

slot0.setActivities = slot7

function slot7(slot0, slot1)
	slot0.allActivity = slot1
end

slot0.setAllActivity = slot7

function slot7(slot0, slot1)
	slot0.player = slot1
end

slot0.setPlayer = slot7

function slot7(slot0, slot1)
	slot0.flagShip = slot1
end

slot0.setFlagShip = slot7

function slot7(slot0, slot1)
	slot2 = slot0.allActivity
	slot3 = slot1.id
	slot2[slot3] = slot1
	slot3 = slot1
	slot2 = slot1.isShow
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = slot0
		slot3 = slot1.id
		slot2 = slot2[slot3]

		if slot2 then
			slot2 = getProxy
			slot3 = ActivityProxy
			slot2 = slot2(slot3)
			slot3 = slot2
			slot2 = slot2.getActivityById
			slot4 = slot0
			slot5 = slot1.id
			slot4 = slot4[slot5]
			slot2 = slot2(slot3, slot4)
			slot1 = slot2
		else
			return
		end
	end

	function slot2()
		slot0 = ipairs
		slot1 = slot0
		slot1 = slot1.activities
		slot0, slot1, slot2 = slot0(slot1)

		for slot3, slot4 in slot0, slot1, slot2 do
			slot5 = slot4.id
			slot6 = slot1
			slot6 = slot6.id

			if slot5 == slot6 then
				return slot3
			end
		end

		slot0 = slot0
		slot0 = slot0.activities
		slot0 = #slot0
		slot0 = slot0 + 1

		return slot0
	end

	slot3 = slot0.activities
	slot4 = slot2
	slot4 = slot4()
	slot3[slot4] = slot1
	slot4 = slot0
	slot3 = slot0.flushTabs

	slot3(slot4)

	slot3 = slot0.activity

	if slot3 then
		slot3 = slot0.activity
		slot3 = slot3.id
		slot4 = slot1.id

		if slot3 == slot4 then
			slot0.activity = slot1
			slot4 = slot0
			slot3 = slot0.flushActivity

			slot3(slot4)

			slot4 = slot0
			slot3 = slot0.verifyTabs

			slot3(slot4)
		end
	end
end

slot0.updateActivity = slot7

function slot7(slot0)
	slot1 = slot0.activity
	slot3 = slot0
	slot2 = slot0.activity2Page
	slot4 = slot1
	slot2 = slot2(slot3, slot4)
	slot3 = "flush_"
	slot4 = slot2
	slot3 = slot3 .. slot4
	slot3 = slot0[slot3]
	slot4 = slot0

	slot3(slot4)
end

slot0.updateTaskLayers = slot7

function slot7(slot0, slot1)
	slot2 = _
	slot2 = slot2.detect
	slot3 = slot0.activities

	function slot4(slot0)
		return slot0.id == slot0
	end

	slot2 = slot2(slot3, slot4)

	if not slot2 then
		slot2 = slot0.activities
		slot2 = slot2[1]
	end

	if slot2 then
		slot3 = slot0.activity

		if slot3 then
			slot3 = slot0.activity
			slot3 = slot3.id
			slot4 = slot2.id

			if slot3 ~= slot4 then
				slot4 = slot0
				slot3 = slot0.activity2Page
				slot5 = slot2
				slot3 = slot3(slot4, slot5)
				slot4 = slot0.activity

				if not slot4 then
					slot4 = slot0.pages
					slot4 = slot4[slot3]
					slot5 = slot4
					slot4 = slot4.SetActive
					slot6 = true

					slot4(slot5, slot6)
				else
					slot4 = slot0.activity
					slot4 = slot4.id
					slot5 = slot2.id

					if slot4 ~= slot5 then
						slot5 = slot0
						slot4 = slot0.activity2Page
						slot6 = slot0.activity
						slot4 = slot4(slot5, slot6)
						slot5 = slot0.pages
						slot5 = slot5[slot4]
						slot6 = slot5
						slot5 = slot5.SetActive
						slot7 = false

						slot5(slot6, slot7)

						slot5 = "close_"
						slot6 = slot4
						slot5 = slot5 .. slot6
						slot5 = slot0[slot5]

						if slot5 then
							slot5 = "close_"
							slot6 = slot4
							slot5 = slot5 .. slot6
							slot5 = slot0[slot5]
							slot6 = slot0

							slot5(slot6)
						end

						slot5 = slot0.pages
						slot5 = slot5[slot3]
						slot6 = slot5
						slot5 = slot5.SetActive
						slot7 = true

						slot5(slot6, slot7)
					end
				end

				slot0.activity = slot2
				slot4 = slot0.contextData
				slot5 = slot2.id
				slot4.id = slot5
				slot5 = slot0
				slot4 = slot0.flushActivity

				slot4(slot5)

				slot5 = slot0
				slot4 = slot0.verifyTabs

				slot4(slot5)
			end
		end
	end
end

slot0.selectActivity = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.activity2Page
	slot3 = slot0.activity
	slot1 = slot1(slot2, slot3)
	slot2 = "flush_"
	slot3 = slot1
	slot2 = slot2 .. slot3
	slot2 = slot0[slot2]
	slot3 = slot0

	slot2(slot3)
end

slot0.flushActivity = slot7

function slot7(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getConfig
	slot4 = "type"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot4 = slot1.id
	slot3 = slot3[slot4]

	if not slot3 then
		slot3 = slot1
		slot3 = slot3[slot2]
	end

	return slot3
end

slot0.activity2Page = slot7

function slot7(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getConfig
	slot4 = "type"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0
	slot4 = slot1.id
	slot3 = slot3[slot4]

	if not slot3 then
		slot3 = slot1
		slot3 = slot3[slot2]
	end

	return slot3
end

slot0.activity2Bg = slot7

function slot7(slot0)
	slot1 = slot0.tabsList

	if not slot1 then
		slot1 = UIItemList
		slot1 = slot1.New
		slot2 = slot0.tabs
		slot3 = slot0.tab
		slot1 = slot1(slot2, slot3)
		slot0.tabsList = slot1
		slot1 = slot0.tabsList
		slot2 = slot1
		slot1 = slot1.make

		function slot3(slot0, slot1, slot2)
			slot3 = UIItemList
			slot3 = slot3.EventUpdate

			if slot0 == slot3 then
				slot3 = slot0
				slot3 = slot3.activities
				slot4 = slot1 + 1
				slot3 = slot3[slot4]
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.activity2Page
				slot6 = slot3
				slot4 = slot4(slot5, slot6)

				if slot4 then
					slot5 = slot0
					slot6 = slot5
					slot5 = slot5.findTF
					slot7 = "red"
					slot8 = slot2
					slot5 = slot5(slot6, slot7, slot8)
					slot6 = slot0
					slot7 = slot6
					slot6 = slot6.findTF
					slot8 = "text/"
					slot9 = slot4
					slot10 = "_text"
					slot8 = slot8 .. slot9 .. slot10
					slot6 = slot6(slot7, slot8)

					if not slot6 then
						slot6 = slot0
						slot7 = slot6
						slot6 = slot6.findTF
						slot8 = "text/default_text"
						slot6 = slot6(slot7, slot8)
					end

					slot7 = slot0
					slot8 = slot7
					slot7 = slot7.findTF
					slot9 = "text/"
					slot10 = slot4
					slot11 = "_text_selected"
					slot9 = slot9 .. slot10 .. slot11
					slot7 = slot7(slot8, slot9)

					if not slot7 then
						slot7 = slot0
						slot8 = slot7
						slot7 = slot7.findTF
						slot9 = "text/default_text_selected"
						slot7 = slot7(slot8, slot9)
					end

					slot8 = setImageSprite
					slot9 = slot0
					slot10 = slot9
					slot9 = slot9.findTF
					slot11 = "off/text"
					slot12 = slot2
					slot9 = slot9(slot10, slot11, slot12)
					slot10 = getImageSprite
					slot11 = slot6
					slot10 = slot10(slot11)
					slot11 = true

					slot8(slot9, slot10, slot11)

					slot8 = setImageSprite
					slot9 = slot0
					slot10 = slot9
					slot9 = slot9.findTF
					slot11 = "on/text"
					slot12 = slot2
					slot9 = slot9(slot10, slot11, slot12)
					slot10 = getImageSprite
					slot11 = slot7
					slot10 = slot10(slot11)
					slot11 = true

					slot8(slot9, slot10, slot11)

					slot8 = setActive
					slot9 = slot5
					slot11 = slot3
					slot10 = slot3.readyToAchieve

					slot8(slot9, slot10(slot11))

					slot8 = onToggle
					slot9 = slot0
					slot10 = slot2

					function slot11(slot0)
						if slot0 then
							slot1 = slot0
							slot2 = slot1
							slot1 = slot1.selectActivity
							slot3 = slot1
							slot3 = slot3.id

							slot1(slot2, slot3)
						end
					end

					slot12 = SFX_PANEL

					slot8(slot9, slot10, slot11, slot12)
				else
					slot5 = onToggle
					slot6 = slot0
					slot7 = slot2

					function slot8(slot0)
						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.loadActivityPanel
						slot3 = slot0
						slot4 = slot1

						slot1(slot2, slot3, slot4)
					end

					slot9 = SFX_PANEL

					slot5(slot6, slot7, slot8, slot9)
				end
			end
		end

		slot1(slot2, slot3)
	end

	slot1 = slot0.tabsList
	slot2 = slot1
	slot1 = slot1.align
	slot3 = slot0.activities
	slot3 = #slot3

	slot1(slot2, slot3)
end

slot0.flushTabs = slot7

function slot7(slot0, slot1, slot2)
	slot4 = slot2
	slot3 = slot2.getConfig
	slot5 = "type"
	slot3 = slot3(slot4, slot5)
	slot4 = nil
	slot5 = ActivityConst
	slot5 = slot5.ACTIVITY_TYPE_HITMONSTERNIAN

	if slot3 == slot5 then
		slot5 = Context
		slot5 = slot5.New
		slot6 = {}
		slot7 = HitMonsterNianMediator
		slot6.mediator = slot7
		slot7 = HitMonsterNianLayer
		slot6.viewComponent = slot7
		slot5 = slot5(slot6)
		slot4 = slot5
	end

	if slot4 and slot1 then
		slot6 = slot0
		slot5 = slot0.emit
		slot7 = ActivityMediator
		slot7 = slot7.OPEN_LAYER
		slot8 = slot4

		slot5(slot6, slot7, slot8)
	elseif slot4 and not slot1 then
		slot6 = slot0
		slot5 = slot0.emit
		slot7 = ActivityMediator
		slot7 = slot7.CLOSE_LAYER
		slot8 = slot4.mediator

		slot5(slot6, slot7, slot8)
	else
		slot5 = print
		slot6 = "------活动id为"
		slot7 = slot2.id
		slot8 = "类型为"
		slot10 = slot2
		slot9 = slot2.getConfig
		slot11 = "type"
		slot9 = slot9(slot10, slot11)
		slot10 = "的页面不存在"
		slot6 = slot6 .. slot7 .. slot8 .. slot9 .. slot10

		slot5(slot6)
	end
end

slot0.loadActivityPanel = slot7

function slot7(slot0)
	slot1 = slot0.tabs
	slot2 = slot1
	slot1 = slot1.GetChild
	slot3 = table
	slot3 = slot3.indexof
	slot4 = slot0.activities
	slot5 = slot0.activity
	slot3 = slot3(slot4, slot5)
	slot3 = slot3 - 1
	slot1 = slot1(slot2, slot3)
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "text"
	slot5 = slot1
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "text_selected"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = triggerToggle
	slot5 = slot1
	slot6 = true

	slot4(slot5, slot6)
end

slot0.verifyTabs = slot7

function slot7(slot0)
	slot1 = removeAllChildren
	slot2 = slot0.tabs

	slot1(slot2)
end

slot0.clearTabs = slot7

function slot7(slot0)
	slot1 = slot0.activity
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = pg
	slot3 = slot3.activity_7_day_sign
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "config_id"
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = slot0.pagesInit
	slot5 = slot2.name
	slot4 = slot4[slot5]

	if not slot4 then
		slot4 = {}
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "bg"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.bg = slot5
		slot5 = LoadImageSpriteAsync
		slot7 = slot0
		slot6 = slot0.activity2Bg
		slot8 = slot1
		slot6 = slot6(slot7, slot8)
		slot7 = slot4.bg

		slot5(slot6, slot7)

		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "days"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.labelDay = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "items"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.items = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "item"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.item = slot5
		slot5 = setActive
		slot6 = slot4.item
		slot7 = false

		slot5(slot6, slot7)

		slot5 = 1
		slot6 = 7
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = cloneTplTo
			slot10 = slot4.item
			slot11 = slot4.items
			slot9 = slot9(slot10, slot11)
			slot11 = slot0
			slot10 = slot0.findTF
			slot12 = "item"
			slot13 = slot9
			slot10 = slot10(slot11, slot12, slot13)
			slot11 = slot3.front_drops
			slot11 = slot11[slot8]
			slot12 = {}
			slot13 = slot11[1]
			slot12.type = slot13
			slot13 = slot11[2]
			slot12.id = slot13
			slot13 = slot11[3]
			slot12.count = slot13
			slot13 = updateDrop
			slot14 = slot10
			slot15 = slot12

			slot13(slot14, slot15)

			slot13 = onButton
			slot14 = slot0
			slot15 = slot9

			function slot16()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = slot1
				slot2 = slot2.ON_DROP
				slot3 = slot2

				slot0(slot1, slot2, slot3)
			end

			slot17 = SFX_PANEL

			slot13(slot14, slot15, slot16, slot17)
		end

		slot5 = slot0.pagesInit
		slot6 = slot2.name
		slot5[slot6] = slot4
		slot5 = slot0.pageId
		slot6 = slot2.name
		slot7 = slot1.id
		slot5[slot6] = slot7
	end

	slot5 = GetImageSpriteFromAtlasAsync
	slot6 = "ui/activityui_atlas"
	slot7 = string
	slot7 = slot7.format
	slot8 = "0%d"
	slot9 = math
	slot9 = slot9.max
	slot10 = slot1.data1
	slot11 = 1
	slot7 = slot7(slot8, slot9(slot10, slot11))
	slot8 = slot4.labelDay
	slot9 = true

	slot5(slot6, slot7, slot8, slot9)

	slot5 = 1
	slot6 = 7
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		GetImageSpriteFromAtlasAsync("ui/activityui_atlas", string.format("day%d", slot8) .. ((slot8 <= slot1.data1 and "_sel") or ""), slot0:findTF("day", slot4.items:GetChild(slot8 - 1)), true)

		slot11 = setActive
		slot13 = slot0
		slot12 = slot0.findTF
		slot14 = "got"
		slot15 = slot9
		slot12 = slot12(slot13, slot14, slot15)
		slot13 = slot10

		slot11(slot12, slot13)
	end
end

slot0.flush_7days_login = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)

		slot4 = removeAllChildren
		slot5 = slot3.items

		slot4(slot5)
	end
end

slot0.clear_7days_login = slot7

function slot7(slot0)
	slot1 = slot0.activity
	slot2 = slot0.pages
	slot3 = slot0
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "type"
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot2 = slot2[slot3]
	slot3 = pg
	slot3 = slot3.activity_level_award
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "config_id"
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = slot0.pagesInit
	slot5 = slot2.name
	slot4 = slot4[slot5]

	if not slot4 then
		slot4 = {}
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "bg"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.bg = slot5
		slot5 = LoadImageSpriteAsync
		slot7 = slot0
		slot6 = slot0.activity2Bg
		slot8 = slot1
		slot6 = slot6(slot7, slot8)
		slot7 = slot4.bg

		slot5(slot6, slot7)

		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "scroll/content"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.content = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "scroll/award"
		slot8 = slot2
		slot5 = slot5(slot6, slot7, slot8)
		slot4.award = slot5
		slot5 = setActive
		slot6 = slot4.award
		slot7 = false

		slot5(slot6, slot7)

		slot5 = 1
		slot6 = slot3.front_drops
		slot6 = #slot6
		slot7 = 1

		for slot8 = slot5, slot6, slot7 do
			slot9 = slot3.front_drops
			slot9 = slot9[slot8]
			slot10 = slot9[1]
			slot11 = cloneTplTo
			slot12 = slot4.award
			slot13 = slot4.content
			slot14 = "award"
			slot15 = tostring
			slot16 = slot8
			slot15 = slot15(slot16)
			slot14 = slot14 .. slot15
			slot11 = slot11(slot12, slot13, slot14)
			slot13 = slot0
			slot12 = slot0.findTF
			slot14 = "limit_label/labelLevel"
			slot15 = slot11
			slot12 = slot12(slot13, slot14, slot15)
			slot14 = slot0
			slot13 = slot0.findTF
			slot15 = "btnAchieve"
			slot16 = slot11
			slot13 = slot13(slot14, slot15, slot16)
			slot15 = slot0
			slot14 = slot0.findTF
			slot16 = "items"
			slot17 = slot11
			slot14 = slot14(slot15, slot16, slot17)
			slot16 = slot0
			slot15 = slot0.findTF
			slot17 = "item"
			slot18 = slot11
			slot15 = slot15(slot16, slot17, slot18)
			slot16 = setActive
			slot17 = slot15
			slot18 = false

			slot16(slot17, slot18)

			slot16 = GetImageSpriteFromAtlasAsync
			slot17 = "ui/activityui_atlas"
			slot18 = slot1
			slot19 = "/"
			slot20 = slot2.name
			slot21 = "/"
			slot22 = tostring
			slot23 = slot10
			slot22 = slot22(slot23)
			slot23 = ".png"
			slot18 = slot18 .. slot19 .. slot20 .. slot21 .. slot22 .. slot23
			slot19 = slot12
			slot20 = true

			slot16(slot17, slot18, slot19, slot20)

			slot16 = 2
			slot17 = #slot9
			slot18 = 1

			for slot19 = slot16, slot17, slot18 do
				slot20 = cloneTplTo
				slot21 = slot15
				slot22 = slot14
				slot20 = slot20(slot21, slot22)
				slot21 = slot9[slot19]
				slot22 = {}
				slot23 = slot21[1]
				slot22.type = slot23
				slot23 = slot21[2]
				slot22.id = slot23
				slot23 = slot21[3]
				slot22.count = slot23
				slot23 = updateDrop
				slot24 = slot20
				slot25 = slot22

				slot23(slot24, slot25)

				slot23 = onButton
				slot24 = slot0
				slot25 = slot20

				function slot26()
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = slot1
					slot2 = slot2.ON_DROP
					slot3 = slot2

					slot0(slot1, slot2, slot3)
				end

				slot27 = SFX_PANEL

				slot23(slot24, slot25, slot26, slot27)
			end

			slot16 = onButton
			slot17 = slot0
			slot18 = slot13

			function slot19()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ActivityMediator
				slot2 = slot2.EVENT_OPERATION
				slot3 = {
					cmd = 1
				}
				slot4 = slot1
				slot4 = slot4.id
				slot3.activity_id = slot4
				slot4 = slot2
				slot3.arg1 = slot4

				slot0(slot1, slot2, slot3)
			end

			slot20 = SFX_PANEL

			slot16(slot17, slot18, slot19, slot20)
		end

		slot5 = slot0.pagesInit
		slot6 = slot2.name
		slot5[slot6] = slot4
		slot5 = slot0.pageId
		slot6 = slot2.name
		slot7 = slot1.id
		slot5[slot6] = slot7
	end

	slot5 = 1
	slot6 = slot3.front_drops
	slot6 = #slot6
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot9 = slot3.front_drops
		slot9 = slot9[slot8]
		slot11 = slot0
		slot10 = slot0.findTF
		slot12 = "award"
		slot13 = tostring
		slot14 = slot8
		slot13 = slot13(slot14)
		slot12 = slot12 .. slot13
		slot13 = slot4.content
		slot10 = slot10(slot11, slot12, slot13)
		slot12 = slot0
		slot11 = slot0.findTF
		slot13 = "btnAchieve"
		slot14 = slot10
		slot11 = slot11(slot12, slot13, slot14)
		slot13 = slot0
		slot12 = slot0.findTF
		slot14 = "achieve_sign"
		slot15 = slot10
		slot12 = slot12(slot13, slot14, slot15)
		slot13 = _
		slot13 = slot13.include
		slot14 = slot1.data1_list
		slot15 = slot9[1]
		slot13 = slot13(slot14, slot15)

		if slot13 then
			slot14 = slot10.transform
			slot15 = slot14
			slot14 = slot14.SetAsLastSibling

			slot14(slot15)
		end

		setGray(slot0:findTF("limit_label", slot10), slot13)
		setGray(slot0:findTF("items", slot10), slot13)
		setActive(slot12, slot13)
		setActive(slot11, slot9[1] <= slot0.player.level and not slot13)
	end
end

slot0.flush_level_award = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = removeAllChildren
		slot5 = slot3.content

		slot4(slot5)
	end
end

slot0.clear_level_award = slot7

function slot7(slot0)
	slot1 = slot0.activity
	slot2 = slot0.pages
	slot3 = slot0
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "type"
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot2 = slot2[slot3]
	slot3 = pg
	slot3 = slot3.activity_month_sign
	slot4 = slot1.data2
	slot3 = slot3[slot4]

	if not slot3 then
		return
	end

	slot4 = pg
	slot4 = slot4.TimeMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot5 = slot4
	slot4 = slot4.CalcMonthDays
	slot6 = slot1.data1
	slot7 = slot1.data2
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot0.pagesInit
	slot6 = slot2.name
	slot5 = slot5[slot6]

	if not slot5 then
		slot5 = {}
		slot7 = slot0
		slot6 = slot0.findTF
		slot8 = "bg"
		slot9 = slot2
		slot6 = slot6(slot7, slot8, slot9)
		slot5.bg = slot6
		slot6 = LoadImageSpriteAsync
		slot8 = slot0
		slot7 = slot0.activity2Bg
		slot9 = slot1
		slot7 = slot7(slot8, slot9)
		slot8 = slot5.bg

		slot6(slot7, slot8)

		slot7 = slot0
		slot6 = slot0.findTF
		slot8 = "items"
		slot9 = slot2
		slot6 = slot6(slot7, slot8, slot9)
		slot5.items = slot6
		slot7 = slot0
		slot6 = slot0.findTF
		slot8 = "item"
		slot9 = slot5.items
		slot6 = slot6(slot7, slot8, slot9)
		slot5.item = slot6
		slot6 = UIItemList
		slot6 = slot6.New
		slot7 = slot5.items
		slot8 = slot5.item
		slot6 = slot6(slot7, slot8)
		slot5.list = slot6
		slot6 = slot5.list
		slot7 = slot6
		slot6 = slot6.make

		function slot8(slot0, slot1, slot2)
			slot3 = UIItemList
			slot3 = slot3.EventUpdate

			if slot0 == slot3 then
				updateDrop(slot2, _.map(slot0["day" .. slot3], function (slot0)
					return {
						type = slot0[1],
						id = slot0[2],
						count = slot0[3]
					}
				end)[1])
				onButton(slot1, slot2, function ()
					if #slot0 == 1 then
						slot1:emit(slot2.ON_DROP, slot0[1])
					else
						slot1:emit(slot2.ON_DROP_LIST, {
							content = "",
							item2Row = true,
							itemList = slot1.emit
						})
					end
				end, SFX_PANEL)
				setText(slot2:Find("day/Text"), "Day " .. slot3)
				setActive(slot2:Find("got"), slot1 + 1 <= #slot3.data1_list)
				setActive(slot2:Find("today"), slot1 + 1 == #slot1 + 1.data1_list)
			end
		end

		slot6(slot7, slot8)

		slot6 = slot0.pagesInit
		slot7 = slot2.name
		slot6[slot7] = slot5
		slot6 = slot0.pageId
		slot7 = slot2.name
		slot8 = slot1.id
		slot6[slot7] = slot8
	end

	slot6 = slot5.list
	slot7 = slot6
	slot6 = slot6.align
	slot8 = slot4

	slot6(slot7, slot8)
end

slot0.flush_month_sign = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = removeAllChildren
		slot5 = slot3.items

		slot4(slot5)
	end
end

slot0.clear_month_sign = slot7

function slot7(slot0)
	slot1 = slot0.activity
	slot2 = slot0.pages
	slot3 = slot0
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "type"
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if not slot3 then
		slot3 = {}
		slot5 = slot0
		slot4 = slot0.findTF
		slot6 = "bg"
		slot7 = slot2
		slot4 = slot4(slot5, slot6, slot7)
		slot3.bg = slot4
		slot4 = LoadImageSpriteAsync
		slot6 = slot0
		slot5 = slot0.activity2Bg
		slot7 = slot1
		slot5 = slot5(slot6, slot7)
		slot6 = slot3.bg

		slot4(slot5, slot6)

		slot5 = slot0
		slot4 = slot0.findTF
		slot6 = "charge"
		slot7 = slot2
		slot4 = slot4(slot5, slot6, slot7)
		slot3.charge = slot4
		slot5 = slot0
		slot4 = slot0.findTF
		slot6 = "take"
		slot7 = slot2
		slot4 = slot4(slot5, slot6, slot7)
		slot3.take = slot4
		slot5 = slot0
		slot4 = slot0.findTF
		slot6 = "finish"
		slot7 = slot2
		slot4 = slot4(slot5, slot6, slot7)
		slot3.finish = slot4
		slot4 = onButton
		slot5 = slot0
		slot6 = slot3.charge

		function slot7()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ActivityMediator
			slot2 = slot2.EVENT_GO_SCENE
			slot3 = SCENE
			slot3 = slot3.CHARGE
			slot4 = {}
			slot5 = ChargeScene
			slot5 = slot5.TYPE_DIAMOND
			slot4.wrap = slot5

			slot0(slot1, slot2, slot3, slot4)
		end

		slot4(slot5, slot6, slot7)

		slot4 = onButton
		slot5 = slot0
		slot6 = slot3.take

		function slot7()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ActivityMediator
			slot2 = slot2.EVENT_OPERATION
			slot3 = {
				cmd = 1
			}
			slot4 = slot1
			slot4 = slot4.id
			slot3.activity_id = slot4

			slot0(slot1, slot2, slot3)
		end

		slot4(slot5, slot6, slot7)

		slot4 = slot0.pagesInit
		slot5 = slot2.name
		slot4[slot5] = slot3
		slot4 = slot0.pageId
		slot5 = slot2.name
		slot6 = slot1.id
		slot4[slot5] = slot6
	end

	slot4 = setActive
	slot5 = slot3.charge
	slot6 = slot1.data2

	if slot6 == 0 then
		slot4(slot5, slot1.data1 == 0)
		setButtonEnabled(slot3.take, slot1.data2 == 0)
		setActive(slot3.take, slot1.data1 > 0)
		setActive(slot3.finish, slot1.data2 == 1)

		return
	end
end

slot0.flush_charge_award = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)
	end
end

slot0.clear_charge_award = slot7

function slot7(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.pages
	slot7 = slot0
	slot6 = slot0.activity2Page
	slot8 = slot1
	slot6 = slot6(slot7, slot8)
	slot5 = slot5[slot6]
	slot6 = slot0.pagesInit
	slot7 = slot5.name
	slot6 = slot6[slot7]
	slot8 = slot0
	slot7 = slot0.GetDoingTask
	slot9 = slot1
	slot7, slot8, slot9 = slot7(slot8, slot9)
	slot11 = slot9
	slot10 = slot9.isReceive
	slot10 = slot10(slot11)

	if not slot10 then
		slot7 = slot7 - 1
	end

	slot10 = nil
	slot11 = slot1.id
	slot12 = ActivityConst
	slot12 = slot12.GR_ACTIVITY_ID

	if slot11 == slot12 then
		slot11 = getProxy
		slot12 = ChapterProxy
		slot11 = slot11(slot12)
		slot13 = slot11
		slot12 = slot11.getChapterById
		slot14 = 1050013
		slot12 = slot12(slot13, slot14)

		if slot12 then
			slot10 = slot12.defeatCount or 0
		end
	else
		slot12 = slot1
		slot11 = slot1.getConfig
		slot13 = "type"
		slot11 = slot11(slot12, slot13)
		slot12 = ActivityConst
		slot12 = slot12.ACTIVITY_TYPE_TASK_RES

		if slot11 == slot12 then
			if slot9 then
				slot12 = slot9
				slot11 = slot9.getProgress
				slot11 = slot11(slot12)

				if not slot11 then
					slot11 = pg
					slot11 = slot11.task_data_template
					slot11 = slot11[slot8]
					slot10 = slot11.target_num
				end
			end
		else
			slot11 = ptActivity
			slot10 = slot11.data1
			slot11 = getProxy
			slot12 = ActivityProxy
			slot11 = slot11(slot12)
			slot12 = slot11
			slot11 = slot11.getActivityById
			slot14 = slot1
			slot13 = slot1.getConfig
			slot15 = "config_client"
			slot13 = slot13(slot14, slot15)
			slot13 = slot13.rank_act_id
			slot11 = slot11(slot12, slot13)
		end
	end

	slot11 = slot6.initPtBonusList

	if not slot11 then
		slot12 = slot0
		slot11 = slot0.findTF
		slot13 = "bonusWindow"
		slot11 = slot11(slot12, slot13)
		slot6.bonusWindow = slot11
		slot12 = slot0
		slot11 = slot0.findTF
		slot13 = "window/panel"
		slot14 = slot6.bonusWindow
		slot11 = slot11(slot12, slot13, slot14)
		slot6.ptPanel = slot11
		slot12 = slot0
		slot11 = slot0.findTF
		slot13 = "list"
		slot14 = slot6.ptPanel
		slot11 = slot11(slot12, slot13, slot14)
		slot6.ptBonusContainer = slot11
		slot12 = slot0
		slot11 = slot0.findTF
		slot13 = "item"
		slot14 = slot6.ptBonusContainer
		slot11 = slot11(slot12, slot13, slot14)
		slot6.ptBonusTpl = slot11
		slot11 = true
		slot6.initPtBonusList = slot11
		slot11 = onButton
		slot12 = slot0
		slot13 = slot6.bonusWindow

		function slot14()
			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.bonusWindow
			slot2 = false

			slot0(slot1, slot2)
		end

		slot15 = SOUND_BACK

		slot11(slot12, slot13, slot14, slot15)

		slot11 = onButton
		slot12 = slot0
		slot14 = slot0
		slot13 = slot0.findTF
		slot15 = "window/top/btnBack"
		slot16 = slot6.bonusWindow
		slot13 = slot13(slot14, slot15, slot16)

		function slot14()
			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.bonusWindow
			slot2 = false

			slot0(slot1, slot2)
		end

		slot15 = SOUND_BACK

		slot11(slot12, slot13, slot14, slot15)

		slot11 = UIItemList
		slot11 = slot11.New
		slot12 = slot6.ptBonusContainer
		slot13 = slot6.ptBonusTpl
		slot11 = slot11(slot12, slot13)
		slot6.itemList = slot11
		slot11 = slot6.itemList
		slot12 = slot11
		slot11 = slot11.make

		function slot13(slot0, slot1, slot2)
			slot3 = UIItemList
			slot3 = slot3.EventUpdate

			if slot0 == slot3 then
				updateDrop(slot2:Find("award"), slot6)
				onButton(slot1, slot2:Find("award"), function ()
					slot0:emit(slot1.ON_DROP, )
				end, SFX_PANEL)
				setActive(slot2:Find("award/mask"), slot1 + 1 <= slot3)
				setText(slot2:Find("target/Text"), pg.task_data_template[slot0[slot1 + 1]].target_num)
				setText(slot2:Find("target/title"), slot4)
				setText(slot2:Find("title/Text"), "PHASE   " .. slot1 + 1)
			end
		end

		slot11(slot12, slot13)

		slot11 = slot0.pagesInit
		slot12 = slot5.name
		slot11[slot12] = slot6
		slot11 = slot0.pageId
		slot12 = slot5.name
		slot13 = slot1.id
		slot11[slot12] = slot13
	end

	slot11 = slot6.itemList
	slot12 = slot11
	slot11 = slot11.align
	slot13 = #slot2

	slot11(slot12, slot13)

	slot11 = setText
	slot13 = slot0
	slot12 = slot0.findTF
	slot14 = "window/pt/title"
	slot15 = slot6.bonusWindow
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = slot4

	slot11(slot12, slot13)

	slot11 = setText
	slot13 = slot0
	slot12 = slot0.findTF
	slot14 = "window/pt/Text"
	slot15 = slot6.bonusWindow
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = slot10

	slot11(slot12, slot13)

	slot11 = setActive
	slot12 = slot6.bonusWindow
	slot13 = true

	slot11(slot12, slot13)
end

slot0.showPtBonusList = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot4 = slot0.activity
	slot5 = slot0.pages
	slot7 = slot0
	slot6 = slot0.activity2Page
	slot8 = slot4
	slot6 = slot6(slot7, slot8)
	slot5 = slot5[slot6]
	slot6 = slot0.pagesInit
	slot7 = slot5.name
	slot6 = slot6[slot7]
	slot7 = _
	slot7 = slot7.flatten
	slot9 = slot4
	slot8 = slot4.getConfig
	slot10 = "config_data"
	slot7 = slot7(slot8(slot9, slot10))

	if not slot6 then
		slot6 = {}
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "bg"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.bg = slot8
		slot8 = LoadImageSpriteAsync
		slot10 = slot0
		slot9 = slot0.activity2Bg
		slot11 = slot4
		slot9 = slot9(slot10, slot11)
		slot10 = slot6.bg

		slot8(slot9, slot10)

		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "btn"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.btn = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "bonus_list"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.bonusList = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "progress"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.progress = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "progressText"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.progressTxt = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "phase/Text"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.phaseTxt = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "award"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.award = slot8
		slot8 = pg
		slot8 = slot8.item_data_statistics
		slot9 = id2ItemId
		slot11 = slot4
		slot10 = slot4.getConfig
		slot12 = "config_client"
		slot10 = slot10(slot11, slot12)
		slot10 = slot10.pt_id
		slot9 = slot9(slot10)
		slot8 = slot8[slot9]
		slot8 = slot8.name
		slot9 = onButton
		slot10 = slot0
		slot11 = slot6.bonusList

		function slot12()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showPtBonusList
			slot2 = slot1
			slot3 = slot2
			slot4 = i18n
			slot5 = "pt_count"
			slot6 = slot3
			slot4 = slot4(slot5, slot6)
			slot5 = i18n
			slot6 = "pt_total_count"
			slot7 = slot3

			slot0(slot1, slot2, slot3, slot4, slot5(slot6, slot7))
		end

		slot9(slot10, slot11, slot12)

		slot9 = slot0.pagesInit
		slot10 = slot5.name
		slot9[slot10] = slot6
		slot9 = slot0.pageId
		slot10 = slot5.name
		slot11 = slot4.id
		slot9[slot10] = slot11
	end

	slot9 = slot4
	slot8 = slot4.getConfig
	slot10 = "config_client"
	slot8 = slot8(slot9, slot10)
	slot8 = slot8.story

	if slot8 then
		slot9 = pg
		slot9 = slot9.StoryMgr
		slot9 = slot9.GetInstance
		slot9 = slot9()
		slot10 = slot8[slot3]
		slot10 = slot10[1]

		if slot10 then
			slot11 = slot9
			slot10 = slot9.IsPlayed
			slot12 = slot8[slot3]
			slot12 = slot12[1]
			slot10 = slot10(slot11, slot12)

			if not slot10 then
				slot11 = slot9
				slot10 = slot9.Play
				slot12 = slot8[slot3]
				slot12 = slot12[1]

				slot10(slot11, slot12)
			end
		end
	end

	slot9 = getProxy
	slot10 = ActivityProxy
	slot9 = slot9(slot10)
	slot10 = slot9
	slot9 = slot9.getActivityById
	slot12 = slot4
	slot11 = slot4.getConfig
	slot13 = "config_client"
	slot11 = slot11(slot12, slot13)
	slot11 = slot11.rank_act_id
	slot9 = slot9(slot10, slot11)
	slot10 = slot9.data1
	slot12 = slot0
	slot11 = slot0.GetDoingTask
	slot13 = slot4
	slot11, slot12, slot13 = slot11(slot12, slot13)
	slot14 = setText
	slot15 = slot6.phaseTxt
	slot16 = slot11
	slot17 = "/"
	slot18 = #slot7
	slot16 = slot16 .. slot17 .. slot18

	slot14(slot15, slot16)

	if slot13 then
		slot15 = slot13
		slot14 = slot13.getConfig
		slot16 = "target_num"
		slot14 = slot14(slot15, slot16)
		slot15 = setColorStr
		slot16 = math
		slot16 = slot16.min
		slot17 = slot10
		slot18 = slot14
		slot16 = slot16(slot17, slot18)

		if slot10 < slot14 then
			slot15 = slot15(slot16, COLOR_RED or COLOR_GREEN)
			slot16 = "/"
			slot17 = slot14
			slot15 = slot15 .. slot16 .. slot17
			slot16 = setText
			slot17 = slot6.progressTxt
			slot18 = slot15

			slot16(slot17, slot18)

			slot16 = setSlider
			slot17 = slot6.progress
			slot18 = 0
			slot19 = slot14
			slot20 = math
			slot20 = slot20.min
			slot21 = slot10
			slot22 = slot14

			slot16(slot17, slot18, slot19, slot20(slot21, slot22))

			slot17 = slot13
			slot16 = slot13.getConfig
			slot18 = "award_display"
			slot16 = slot16(slot17, slot18)
			slot16 = slot16[1]
			slot17 = {}
			slot18 = slot16[1]
			slot17.type = slot18
			slot18 = slot16[2]
			slot17.id = slot18
			slot18 = slot16[3]
			slot17.count = slot18
			slot18 = updateDrop
			slot19 = slot6.award
			slot20 = slot17

			slot18(slot19, slot20)

			slot18 = onButton
			slot19 = slot0
			slot20 = slot6.award

			function slot21()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = slot1
				slot2 = slot2.ON_DROP
				slot3 = slot2

				slot0(slot1, slot2, slot3)
			end

			slot22 = SFX_PANEL

			slot18(slot19, slot20, slot21, slot22)

			slot18 = slot6.btn
			slot19 = slot18
			slot18 = slot18.GetComponent
			slot20 = typeof
			slot21 = Image
			slot18 = slot18(slot19, slot20(slot21))
			slot20 = slot13
			slot19 = slot13.isFinish
			slot19 = slot19(slot20)
			slot19 = not slot19
			slot18.enabled = slot19
			slot18 = setActive
			slot19 = slot6.btn
			slot20 = slot19
			slot19 = slot19.Find
			slot21 = "get"
			slot19 = slot19(slot20, slot21)
			slot21 = slot13
			slot20 = slot13.isFinish
			slot20 = slot20(slot21)

			if slot20 then
				slot21 = slot13
				slot20 = slot13.isReceive
				slot20 = slot20(slot21)
				slot20 = not slot20
			end
		end

		slot18(slot19, slot20)

		slot18 = setActive
		slot19 = slot6.btn
		slot20 = slot19
		slot19 = slot19.Find
		slot21 = "got"
		slot19 = slot19(slot20, slot21)
		slot21 = slot13
		slot20 = slot13.isReceive

		slot18(slot19, slot20(slot21))

		slot18 = onButton
		slot19 = slot0
		slot20 = slot6.btn

		function slot21()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.isFinish
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ActivityMediator
				slot2 = slot2.ON_TASK_GO
				slot3 = slot0

				slot0(slot1, slot2, slot3)
			else
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.TaskSubmitCheck
				slot2 = slot0
				slot0 = slot0(slot1, slot2)

				if not slot0 then
					return
				end

				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ActivityMediator
				slot2 = slot2.ON_TASK_SUBMIT
				slot3 = slot0

				slot0(slot1, slot2, slot3)
			end
		end

		slot22 = SFX_PANEL

		slot18(slot19, slot20, slot21, slot22)

		slot18 = setButtonEnabled
		slot19 = slot6.btn
		slot21 = slot13
		slot20 = slot13.isReceive
		slot20 = slot20(slot21)
		slot20 = not slot20

		slot18(slot19, slot20)
	end

	slot14 = slot11
	slot15 = slot13
	slot16 = slot10

	return slot14, slot15, slot16
end

slot0.flush_activity_pt = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)
	end
end

slot0.clear_task_list_pt = slot7

function slot7(slot0)
	slot1 = updateActivityTaskStatue
	slot2 = slot0.activity
	slot1 = slot1(slot2)

	if slot1 then
		return
	end

	slot2 = getProxy
	slot3 = TaskProxy
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.getActivityTask
	slot4 = slot0.activity
	slot2 = slot2(slot3, slot4)
	slot3 = pg
	slot3 = slot3.task_data_template
	slot3 = slot3[slot2]
	slot3 = slot3.sub_type
	slot4 = TASK_SUB_TYPE_RES_GOLD

	if slot3 == slot4 then
		slot4 = 1
	else
		slot0:update_task_list_res_layer(slot0.activity, i18n("pt_count", slot5), i18n("pt_total_count", pg.item_data_statistics[id2ItemId(slot4)].name))

		return
	end
end

slot0.flush_task_list_res = slot7

function slot7(slot0, slot1, slot2, slot3)
	slot4 = slot0.activity
	slot5 = slot0.pages
	slot7 = slot0
	slot6 = slot0.activity2Page
	slot8 = slot4
	slot6 = slot6(slot7, slot8)
	slot5 = slot5[slot6]
	slot6 = slot0.pagesInit
	slot7 = slot5.name
	slot6 = slot6[slot7]
	slot7 = _
	slot7 = slot7.flatten
	slot9 = slot4
	slot8 = slot4.getConfig
	slot10 = "config_data"
	slot7 = slot7(slot8(slot9, slot10))

	if not slot6 then
		slot6 = {}
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "bg"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.bg = slot8
		slot8 = LoadImageSpriteAsync
		slot10 = slot0
		slot9 = slot0.activity2Bg
		slot11 = slot4
		slot9 = slot9(slot10, slot11)
		slot10 = slot6.bg

		slot8(slot9, slot10)

		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "layer"
		slot11 = slot5
		slot8 = slot8(slot9, slot10, slot11)
		slot6.layer = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "btn"
		slot11 = slot6.layer
		slot8 = slot8(slot9, slot10, slot11)
		slot6.btn = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "progress"
		slot11 = slot6.layer
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Slider
		slot8 = slot8(slot9, slot10(slot11))
		slot6.progress = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "progressText"
		slot11 = slot6.layer
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot6.progressTxt = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "phase/Text"
		slot11 = slot6.layer
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot6.phaseTxt = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "award"
		slot11 = slot6.layer
		slot8 = slot8(slot9, slot10, slot11)
		slot6.award = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "mask"
		slot11 = slot6.award
		slot8 = slot8(slot9, slot10, slot11)
		slot6.awardMask = slot8
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "bonus_list"
		slot11 = slot6.layer
		slot8 = slot8(slot9, slot10, slot11)
		slot6.detailBtn = slot8
		slot8 = onButton
		slot9 = slot0
		slot10 = slot6.detailBtn

		function slot11()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showPtBonusList
			slot2 = slot1
			slot3 = slot2
			slot4 = slot3
			slot5 = slot4

			slot0(slot1, slot2, slot3, slot4, slot5)
		end

		slot12 = SFX_PANEL

		slot8(slot9, slot10, slot11, slot12)

		slot8 = slot0.pagesInit
		slot9 = slot5.name
		slot8[slot9] = slot6
		slot8 = slot0.pageId
		slot9 = slot5.name
		slot10 = slot4.id
		slot8[slot9] = slot10
	end

	slot9 = slot0
	slot8 = slot0.GetDoingTask
	slot10 = slot4
	slot8, slot9, slot10 = slot8(slot9, slot10)

	if slot10 then
		slot11 = setActive
		slot12 = slot6.award
		slot13 = true

		slot11(slot12, slot13)

		slot11 = slot6.progress
		slot13 = slot10
		slot12 = slot10.getProgress
		slot12 = slot12(slot13)
		slot14 = slot10
		slot13 = slot10.getConfig
		slot15 = "target_num"
		slot13 = slot13(slot14, slot15)
		slot12 = slot12 / slot13
		slot11.value = slot12
		slot11 = slot6.progressTxt
		slot13 = slot10
		slot12 = slot10.getProgress
		slot12 = slot12(slot13)
		slot13 = "/"
		slot15 = slot10
		slot14 = slot10.getConfig
		slot16 = "target_num"
		slot14 = slot14(slot15, slot16)
		slot12 = slot12 .. slot13 .. slot14
		slot11.text = slot12
		slot11 = slot6.phaseTxt
		slot12 = slot8
		slot13 = "/"
		slot14 = #slot7
		slot12 = slot12 .. slot13 .. slot14
		slot11.text = slot12
		slot12 = slot10
		slot11 = slot10.getConfig
		slot13 = "award_display"
		slot11 = slot11(slot12, slot13)
		slot11 = slot11[1]
		slot12 = {}
		slot13 = slot11[1]
		slot12.type = slot13
		slot13 = slot11[2]
		slot12.id = slot13
		slot13 = slot11[3]
		slot12.count = slot13
		slot13 = updateDrop
		slot14 = slot6.award
		slot15 = slot12

		slot13(slot14, slot15)

		slot13 = onButton
		slot14 = slot0
		slot15 = slot6.award

		function slot16()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_DROP
			slot3 = slot2

			slot0(slot1, slot2, slot3)
		end

		slot17 = SFX_PANEL

		slot13(slot14, slot15, slot16, slot17)

		slot13 = slot6.btn
		slot14 = slot13
		slot13 = slot13.GetComponent
		slot15 = typeof
		slot16 = Image
		slot13 = slot13(slot14, slot15(slot16))
		slot15 = slot10
		slot14 = slot10.isFinish
		slot14 = slot14(slot15)
		slot14 = not slot14
		slot13.enabled = slot14
		slot13 = setActive
		slot14 = slot6.btn
		slot15 = slot14
		slot14 = slot14.Find
		slot16 = "get"
		slot14 = slot14(slot15, slot16)
		slot16 = slot10
		slot15 = slot10.isFinish
		slot15 = slot15(slot16)

		if slot15 then
			slot16 = slot10
			slot15 = slot10.isReceive
			slot15 = slot15(slot16)
			slot15 = not slot15
		end

		slot13(slot14, slot15)

		slot13 = setActive
		slot14 = slot6.btn
		slot15 = slot14
		slot14 = slot14.Find
		slot16 = "got"
		slot14 = slot14(slot15, slot16)
		slot16 = slot10
		slot15 = slot10.isReceive

		slot13(slot14, slot15(slot16))

		slot13 = setButtonEnabled
		slot14 = slot6.btn
		slot16 = slot10
		slot15 = slot10.isReceive
		slot15 = slot15(slot16)
		slot15 = not slot15

		slot13(slot14, slot15)

		slot13 = setActive
		slot14 = slot6.awardMask
		slot16 = slot10
		slot15 = slot10.isReceive

		slot13(slot14, slot15(slot16))

		slot13 = onButton
		slot14 = slot0
		slot15 = slot6.btn

		function slot16()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.isFinish
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ActivityMediator
				slot2 = slot2.ON_TASK_GO
				slot3 = slot0

				slot0(slot1, slot2, slot3)
			else
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ActivityMediator
				slot2 = slot2.ON_TASK_SUBMIT
				slot3 = slot0

				slot0(slot1, slot2, slot3)
			end
		end

		slot17 = SFX_PANEL

		slot13(slot14, slot15, slot16, slot17)
	end
end

slot0.update_task_list_res_layer = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)
	end
end

slot0.clear_task_list_res = slot7

function slot7(slot0)
	slot1 = updateActivityTaskStatue
	slot2 = slot0.activity
	slot1, slot2 = slot1(slot2)

	if slot1 then
		return
	end

	slot4 = slot0
	slot3 = slot0.update_task_list
	slot5 = slot2

	slot3(slot4, slot5)
end

slot0.flush_task_list = slot7

function slot7(slot0, slot1)
	slot2 = slot0.activity
	slot3 = slot0.pages
	slot5 = slot0
	slot4 = slot0.activity2Page
	slot6 = slot2
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = getProxy
	slot5 = TaskProxy
	slot4 = slot4(slot5)
	slot6 = slot2
	slot5 = slot2.getConfig
	slot7 = "config_data"
	slot5 = slot5(slot6, slot7)
	slot6 = slot0.pagesInit
	slot7 = slot3.name
	slot6 = slot6[slot7]

	if not slot6 then
		slot6 = {}
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "bg"
		slot10 = slot3
		slot7 = slot7(slot8, slot9, slot10)
		slot6.bg = slot7
		slot7 = LoadImageSpriteAsync
		slot9 = slot0
		slot8 = slot0.activity2Bg
		slot10 = slot2
		slot8 = slot8(slot9, slot10)
		slot9 = slot6.bg

		slot7(slot8, slot9)

		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "layer"
		slot10 = slot3
		slot7 = slot7(slot8, slot9, slot10)
		slot6.layer = slot7
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "day"
		slot10 = slot6.layer
		slot7 = slot7(slot8, slot9, slot10)
		slot6.day = slot7
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "items"
		slot10 = slot6.layer
		slot7 = slot7(slot8, slot9, slot10)
		slot6.items = slot7
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "layout"
		slot10 = slot6.items
		slot7 = slot7(slot8, slot9, slot10)
		slot6.layout = slot7
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "item"
		slot10 = slot6.layout
		slot7 = slot7(slot8, slot9, slot10)
		slot6.item = slot7
		slot7 = UIItemList
		slot7 = slot7.New
		slot8 = slot6.layout
		slot9 = slot6.item
		slot7 = slot7(slot8, slot9)
		slot6.itemList = slot7
		slot7 = slot6.itemList
		slot8 = slot7
		slot7 = slot7.make

		function slot9(slot0, slot1, slot2)
			slot3 = UIItemList
			slot3 = slot3.EventUpdate

			if slot0 == slot3 then
				slot3 = slot0
				slot4 = slot1
				slot3 = slot3[slot4]
				slot4 = slot1 + 1
				slot3 = slot3[slot4]
				slot4 = slot2
				slot5 = slot4
				slot4 = slot4.getTaskById
				slot6 = slot3
				slot4 = slot4(slot5, slot6)

				if not slot4 then
					slot4 = slot2
					slot5 = slot4
					slot4 = slot4.getFinishTaskById
					slot6 = slot3
					slot4 = slot4(slot5, slot6)
				end

				slot5 = slot3
				slot6 = slot5
				slot5 = slot5.findTF
				slot7 = "btn"
				slot8 = slot2
				slot5 = slot5(slot6, slot7, slot8)

				if slot4 then
					slot6 = slot4.progress
					slot8 = slot4
					slot7 = slot4.getConfig
					slot9 = "target_num"
					slot7 = slot7(slot8, slot9)
					slot8 = setText
					slot9 = slot3
					slot10 = slot9
					slot9 = slot9.findTF
					slot11 = "description"
					slot12 = slot2
					slot9 = slot9(slot10, slot11, slot12)
					slot11 = slot4
					slot10 = slot4.getConfig
					slot12 = "desc"

					slot8(slot9, slot10(slot11, slot12))

					slot8 = setSlider
					slot9 = slot3
					slot10 = slot9
					slot9 = slot9.findTF
					slot11 = "progress"
					slot12 = slot2
					slot9 = slot9(slot10, slot11, slot12)
					slot10 = 0
					slot11 = slot7
					slot12 = slot6

					slot8(slot9, slot10, slot11, slot12)

					slot8 = setText
					slot9 = slot3
					slot10 = slot9
					slot9 = slot9.findTF
					slot11 = "progressText"
					slot12 = slot2
					slot9 = slot9(slot10, slot11, slot12)
					slot10 = slot6
					slot11 = "/"
					slot12 = slot7
					slot10 = slot10 .. slot11 .. slot12

					slot8(slot9, slot10)

					slot8 = slot3
					slot9 = slot8
					slot8 = slot8.findTF
					slot10 = "award"
					slot11 = slot2
					slot8 = slot8(slot9, slot10, slot11)
					slot10 = slot4
					slot9 = slot4.getConfig
					slot11 = "award_display"
					slot9 = slot9(slot10, slot11)
					slot9 = slot9[1]
					slot10 = {}
					slot11 = slot9[1]
					slot10.type = slot11
					slot11 = slot9[2]
					slot10.id = slot11
					slot11 = slot9[3]
					slot10.count = slot11
					slot11 = updateDrop
					slot12 = slot8
					slot13 = slot10

					slot11(slot12, slot13)

					slot11 = onButton
					slot12 = slot3
					slot13 = slot8

					function slot14()
						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.emit
						slot2 = slot1
						slot2 = slot2.ON_DROP
						slot3 = slot2

						slot0(slot1, slot2, slot3)
					end

					slot15 = SFX_PANEL

					slot11(slot12, slot13, slot14, slot15)

					slot12 = slot5
					slot11 = slot5.GetComponent
					slot13 = typeof
					slot14 = Image
					slot11 = slot11(slot12, slot13(slot14))
					slot13 = slot4
					slot12 = slot4.isFinish
					slot12 = slot12(slot13)
					slot12 = not slot12
					slot11.enabled = slot12
					slot11 = setActive
					slot13 = slot5
					slot12 = slot5.Find
					slot14 = "get"
					slot12 = slot12(slot13, slot14)
					slot14 = slot4
					slot13 = slot4.isFinish
					slot13 = slot13(slot14)

					if slot13 then
						slot14 = slot4
						slot13 = slot4.isReceive
						slot13 = slot13(slot14)
						slot13 = not slot13
					end

					slot11(slot12, slot13)

					slot11 = setActive
					slot13 = slot5
					slot12 = slot5.Find
					slot14 = "got"
					slot12 = slot12(slot13, slot14)
					slot14 = slot4
					slot13 = slot4.isReceive

					slot11(slot12, slot13(slot14))

					slot11 = setButtonEnabled
					slot12 = slot5
					slot14 = slot4
					slot13 = slot4.isReceive
					slot13 = slot13(slot14)
					slot13 = not slot13

					slot11(slot12, slot13)

					slot11 = onButton
					slot12 = slot3
					slot13 = slot5

					function slot14()
						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.isFinish
						slot0 = slot0(slot1)

						if not slot0 then
							slot0 = slot1
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = ActivityMediator
							slot2 = slot2.ON_TASK_GO
							slot3 = slot0

							slot0(slot1, slot2, slot3)
						else
							slot0 = slot1
							slot1 = slot0
							slot0 = slot0.emit
							slot2 = ActivityMediator
							slot2 = slot2.ON_TASK_SUBMIT
							slot3 = slot0

							slot0(slot1, slot2, slot3)
						end
					end

					slot15 = SFX_PANEL

					slot11(slot12, slot13, slot14, slot15)
				end
			end
		end

		slot7(slot8, slot9)

		slot7 = slot0.pagesInit
		slot8 = slot3.name
		slot7[slot8] = slot6
		slot7 = slot0.pageId
		slot8 = slot3.name
		slot9 = slot2.id
		slot7[slot8] = slot9
	end

	slot8 = slot2
	slot7 = slot2.getConfig
	slot9 = "config_client"
	slot7 = slot7(slot8, slot9)
	slot7 = slot7.story

	if slot7 then
		slot8 = pg
		slot8 = slot8.StoryMgr
		slot8 = slot8.GetInstance
		slot8 = slot8()
		slot9 = slot7[slot1]
		slot9 = slot9[1]

		if slot9 then
			slot10 = slot8
			slot9 = slot8.IsPlayed
			slot11 = slot7[slot1]
			slot11 = slot11[1]
			slot9 = slot9(slot10, slot11)

			if not slot9 then
				slot10 = slot8
				slot9 = slot8.Play
				slot11 = slot7[slot1]
				slot11 = slot11[1]

				slot9(slot10, slot11)
			end
		end
	end

	slot8 = slot6.day

	if slot8 then
		slot8 = setText
		slot9 = slot6.day
		slot10 = tostring
		slot11 = slot1

		slot8(slot9, slot10(slot11))
	end

	slot8 = slot6.itemList
	slot9 = slot8
	slot8 = slot8.align
	slot10 = slot5[slot1]
	slot10 = #slot10

	slot8(slot9, slot10)
end

slot0.update_task_list = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)
	end
end

slot0.clear_task_list = slot7

function slot7(slot0, slot1)
	slot2 = slot0.activity
	slot3 = slot0.pages
	slot5 = slot0
	slot4 = slot0.activity2Page
	slot6 = slot2
	slot4 = slot4(slot5, slot6)
	slot3 = slot3[slot4]
	slot4 = slot0.pagesInit
	slot5 = slot3.name
	slot4 = slot4[slot5]

	if not slot4 then
		slot4 = {}
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "bg"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.bg = slot5
		slot5 = LoadImageSpriteAsync
		slot7 = slot0
		slot6 = slot0.activity2Bg
		slot8 = slot2
		slot6 = slot6(slot7, slot8)
		slot7 = slot4.bg

		slot5(slot6, slot7)

		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "btn_list/task"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.task = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "btn_list/shop"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.shop = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "btn_list/fight"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.fight = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "btn_list/build"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.build = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "btn_list/lottery"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.lottery = slot5
		slot6 = slot0
		slot5 = slot0.findTF
		slot7 = "btn_list/memory"
		slot8 = slot3
		slot5 = slot5(slot6, slot7, slot8)
		slot4.memory = slot5
		slot5 = slot0.pagesInit
		slot6 = slot3.name
		slot5[slot6] = slot4
		slot5 = slot0.pageId
		slot6 = slot3.name
		slot7 = slot2.id
		slot5[slot6] = slot7
	end

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4.task

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.EVENT_GO_SCENE
		slot3 = SCENE
		slot3 = slot3.TASK
		slot4 = {
			page = "activity"
		}

		slot0(slot1, slot2, slot3, slot4)
	end

	slot5(slot6, slot7, slot8)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4.shop

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.isEnd
		slot0 = slot0(slot1)

		if not slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ActivityMediator
			slot2 = slot2.GO_SHOPS_LAYER

			slot0(slot1, slot2)
		else
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = i18n
			slot3 = "common_activity_not_start"

			slot0(slot1, slot2(slot3))
		end
	end

	slot5(slot6, slot7, slot8)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4.build

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.EVENT_GO_SCENE
		slot3 = SCENE
		slot3 = slot3.GETBOAT
		slot4 = {
			projectName = "new"
		}

		slot0(slot1, slot2, slot3, slot4)
	end

	slot5(slot6, slot7, slot8)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4.fight

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.isEnd
		slot0 = slot0(slot1)

		if not slot0 then
			slot0 = slot1
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ActivityMediator
			slot2 = slot2.BATTLE_OPERA

			slot0(slot1, slot2)
		else
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = i18n
			slot3 = "common_activity_not_start"

			slot0(slot1, slot2(slot3))
		end
	end

	slot5(slot6, slot7, slot8)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4.lottery

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.GO_LOTTERY

		slot0(slot1, slot2)
	end

	slot5(slot6, slot7, slot8)

	slot5 = onButton
	slot6 = slot0
	slot7 = slot4.memory

	function slot8()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ActivityMediator
		slot2 = slot2.EVENT_GO_SCENE
		slot3 = SCENE
		slot3 = slot3.COLLECTSHIP
		slot4 = {
			toggle = 4
		}
		slot5 = slot1
		slot4.memoryGroup = slot5

		slot0(slot1, slot2, slot3, slot4)
	end

	slot5(slot6, slot7, slot8)
end

slot0.flush_preview_page = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)
	end
end

slot0.clear_preview_page = slot7

function slot7(slot0, slot1)
	slot2 = slot1.id

	if slot2 == 13983 then
		slot2 = getProxy
		slot3 = BayProxy
		slot2 = slot2(slot3)
		slot3 = slot2
		slot2 = slot2.getShips
		slot2 = slot2(slot3)
		slot3 = ipairs
		slot4 = slot2
		slot3, slot4, slot5 = slot3(slot4)

		for slot6, slot7 in slot3, slot4, slot5 do
			slot9 = slot7
			slot8 = slot7.getGroupId
			slot8 = slot8(slot9)

			if slot8 == 1030006 then
				slot9 = slot7
				slot8 = slot7.isActivityNpc
				slot8 = slot8(slot9)

				if slot8 then
					slot8 = true

					return slot8
				end
			end
		end

		slot3 = pg
		slot3 = slot3.TipsMgr
		slot4 = slot3
		slot3 = slot3.GetInstance
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.ShowTips
		slot5 = i18n
		slot6 = "task_submitTask_error_client"

		slot3(slot4, slot5(slot6))

		slot3 = false

		return slot3
	end

	slot2 = true

	return slot2
end

slot0.TaskSubmitCheck = slot7

function slot7(slot0, slot1)
	slot2 = getProxy
	slot3 = TaskProxy
	slot2 = slot2(slot3)
	slot3 = _
	slot3 = slot3.flatten
	slot5 = slot1
	slot4 = slot1.getConfig
	slot6 = "config_data"
	slot3 = slot3(slot4(slot5, slot6))
	slot4, slot5, slot6 = nil
	slot8 = slot1
	slot7 = slot1.getConfig
	slot9 = "type"
	slot7 = slot7(slot8, slot9)
	slot8 = ActivityConst
	slot8 = slot8.ACTIVITY_TYPE_TASKS

	if slot7 == slot8 then
		slot7 = #slot3
		slot8 = 1
		slot9 = -1

		for slot10 = slot7, slot8, slot9 do
			slot5 = slot3[slot10]
			slot12 = slot2
			slot11 = slot2.getTaskById
			slot13 = slot5
			slot11 = slot11(slot12, slot13)

			if not slot11 then
				slot12 = slot2
				slot11 = slot2.getFinishTaskById
				slot13 = slot5
				slot11 = slot11(slot12, slot13)
				slot6 = slot11
			end

			if slot6 then
				slot4 = slot10

				break
			end
		end
	else
		slot8 = slot2
		slot7 = slot2.getActivityTask
		slot9 = slot1
		slot7, slot8 = slot7(slot8, slot9)
		slot6 = slot8
		slot5 = slot7
		slot7 = table
		slot7 = slot7.indexof
		slot8 = slot3
		slot9 = slot5
		slot7 = slot7(slot8, slot9)
		slot4 = slot7

		if not slot6 then
			slot4 = slot4 - 1
			slot5 = slot3[slot4]
			slot8 = slot2
			slot7 = slot2.getFinishTaskById
			slot9 = slot5
			slot7 = slot7(slot8, slot9)
			slot6 = slot7
		end
	end

	slot7 = slot4
	slot8 = slot5
	slot9 = slot6

	return slot7, slot8, slot9
end

slot0.GetDoingTask = slot7

function slot7(slot0, slot1)
	slot2 = slot0.pages
	slot4 = slot0
	slot3 = slot0.activity2Page
	slot5 = slot1
	slot3 = slot3(slot4, slot5)
	slot2 = slot2[slot3]
	slot3 = slot0.pagesInit
	slot4 = slot2.name
	slot3 = slot3[slot4]

	if slot3 then
		slot4 = clearImageSprite
		slot5 = slot3.bg

		slot4(slot5)

		slot4 = slot3.scrollTextList

		if slot4 then
			slot4 = ipairs
			slot5 = slot3.scrollTextList
			slot4, slot5, slot6 = slot4(slot5)

			for slot7, slot8 in slot4, slot5, slot6 do
				slot10 = slot8
				slot9 = slot8.destroy

				slot9(slot10)
			end
		end
	end
end

slot0.clear_commond_page = slot7

function slot7(slot0)
	slot1 = nil
	slot2 = ipairs
	slot3 = slot0.activities
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot0
		slot7 = slot0.activity2Page
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot1 = slot7

		if slot1 then
			slot7 = "clear_"
			slot8 = slot1
			slot7 = slot7 .. slot8
			slot7 = slot0[slot7]

			if slot7 then
				slot7 = "clear_"
				slot8 = slot1
				slot7 = slot7 .. slot8
				slot7 = slot0[slot7]
				slot8 = slot0
				slot9 = slot6

				slot7(slot8, slot9)
			else
				slot8 = slot0
				slot7 = slot0.clear_commond_page
				slot9 = slot6

				slot7(slot8, slot9)
			end
		end
	end

	slot3 = slot0
	slot2 = slot0.clearTabs

	slot2(slot3)

	slot2 = slot0.tweens

	if slot2 then
		slot2 = cancelTweens
		slot3 = slot0.tweens

		slot2(slot3)
	end
end

slot0.willExit = slot7

return slot0
