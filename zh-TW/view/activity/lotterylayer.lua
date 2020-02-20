slot0 = class
slot1 = "LotteryLayer"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = pg
slot1 = slot1.activity_random_award_template
slot2 = true

function slot3(slot0)
	slot1 = slot0

	if slot1 then
		slot1 = "LotteryForCHTUI"

		return slot1
	else
		slot1 = "LotteryUI"

		return slot1
	end
end

slot0.getUIName = slot3

function slot3(slot0, slot1)
	slot0.playerVO = slot1
	slot3 = slot0
	slot2 = slot0.updateResource

	slot2(slot3)
end

slot0.setPlayerVO = slot3

function slot3(slot0)
	slot1 = slot0.playerVO
	slot2 = id2res
	slot3 = slot0.resId
	slot2 = slot2(slot3)
	slot1 = slot1[slot2]
	slot0.resCount = slot1
	slot1 = setText
	slot2 = slot0.resource
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "Text"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.resCount

	slot1(slot2, slot3)
end

slot0.updateResource = slot3

function slot3(slot0, slot1)
	slot0.activityVO = slot1
	slot2 = slot0.activityVO
	slot3 = slot2
	slot2 = slot2.getConfig
	slot4 = "config_client"
	slot2 = slot2(slot3, slot4)
	slot2 = slot2.resId
	slot0.resId = slot2
	slot3 = slot1
	slot2 = slot1.getAwardInfos
	slot2 = slot2(slot3)
	slot0.awardInfos = slot2
	slot3 = slot0
	slot2 = slot0.initActivityPools

	slot2(slot3)
end

slot0.setActivity = slot3

function slot3(slot0)
	slot1 = {}
	slot0.activityPools = slot1
	slot1 = slot0.activityVO
	slot2 = slot1
	slot1 = slot1.getConfig
	slot3 = "config_data"
	slot1 = slot1(slot2, slot3)
	slot2 = _
	slot2 = slot2.select
	slot3 = slot0
	slot3 = slot3.all

	function slot4(slot0)
		slot1 = table
		slot1 = slot1.contains
		slot2 = slot0
		slot3 = slot0

		return slot1(slot2, slot3)
	end

	slot2 = slot2(slot3, slot4)
	slot3 = nil
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = ActivityItemPool
		slot9 = slot9.New
		slot10 = {
			id = slot8
		}
		slot11 = slot0.awardInfos
		slot11 = slot11[slot8]
		slot10.awards = slot11
		slot10.prevId = slot3
		slot10.index = slot7
		slot9 = slot9(slot10)
		slot3 = slot8
		slot10 = slot0.activityPools
		slot11 = slot9.id
		slot10[slot11] = slot9
	end

	slot0.activityPool = slot0.activityPools[slot0.activityVO.data1 or slot1[1]]
end

slot0.initActivityPools = slot3

function slot3(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel/pool_list/content"
	slot1 = slot1(slot2, slot3)
	slot0.lotteryPoolContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel/pool_list/arrs"
	slot1 = slot1(slot2, slot3)
	slot0.attrs = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "right_panel/main_item_list/content"
	slot1 = slot1(slot2, slot3)
	slot0.mainItenContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "equipmenttpl"
	slot4 = slot0.mainItenContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.mainItenTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel/resource"
	slot1 = slot1(slot2, slot3)
	slot0.resource = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel/launch_one_btn"
	slot1 = slot1(slot2, slot3)
	slot0.launchOneBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "res/Text"
	slot4 = slot0.launchOneBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.launchOneBtnTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel/launch_ten_btn"
	slot1 = slot1(slot2, slot3)
	slot0.launchTenBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "res/Text"
	slot4 = slot0.launchTenBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.launchTenBtnTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel/launch_max_btn"
	slot1 = slot1(slot2, slot3)
	slot0.launchMaxBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "res/Text"
	slot4 = slot0.launchMaxBtn
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.launchMaxBtnTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "right_panel/count_container/Text"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.awardsCounttxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "right_panel"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Image
	slot1 = slot1(slot2, slot3(slot4))
	slot0.bgTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "right_panel/desc_btn"
	slot1 = slot1(slot2, slot3)
	slot0.descBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Msgbox"
	slot1 = slot1(slot2, slot3)
	slot0.bonusWindow = slot1
	slot1 = setActive
	slot2 = slot0.bonusWindow
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top"
	slot1 = slot1(slot2, slot3)
	slot0.topPanel = slot1
	slot1 = {}
	slot0.nameTxts = slot1
	slot1 = {}
	slot0.nameTxtsN = slot1
end

slot0.init = slot3

function slot3(slot0)
	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "top/back_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = slot1
		slot2 = slot2.ON_CLOSE

		slot0(slot1, slot2)
	end

	slot5 = SOUND_BACK

	slot1(slot2, slot3, slot4, slot5)

	slot1 = {}
	slot2 = slot0.launchOneBtn
	slot1[1] = slot2
	slot2 = slot0.launchTenBtn
	slot1[2] = slot2
	slot2 = slot0.launchMaxBtn
	slot1[3] = slot2
	slot2 = {
		1,
		10,
		"max"
	}
	slot3 = ipairs
	slot4 = slot1
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = GetImageSpriteFromAtlasAsync
		slot9 = pg
		slot9 = slot9.item_data_statistics
		slot10 = id2ItemId
		slot11 = slot0.resId
		slot10 = slot10(slot11)
		slot9 = slot9[slot10]
		slot9 = slot9.icon
		slot10 = ""
		slot12 = slot7
		slot11 = slot7.Find
		slot13 = "res/icon"
		slot11 = slot11(slot12, slot13)
		slot12 = true

		slot8(slot9, slot10, slot11, slot12)

		slot8 = onButton
		slot9 = slot0
		slot10 = slot7

		function slot11()
			slot0 = slot0
			slot0 = slot0.activityPool

			if not slot0 then
				return
			end

			slot0 = slot0
			slot0 = slot0.activityPool
			slot1 = slot0
			slot1 = slot1.showActivityPool

			if slot0 ~= slot1 then
				slot0 = pg
				slot0 = slot0.TipsMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowTips
				slot2 = i18n
				slot3 = "amercian_notice_5"

				slot0(slot1, slot2(slot3))

				return
			end

			slot0 = slot0
			slot0 = slot0.activityPool
			slot1 = slot0
			slot0 = slot0.getleftItemCount
			slot0 = slot0(slot1)

			if slot0 == 0 then
				slot1 = pg
				slot1 = slot1.TipsMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ShowTips
				slot3 = i18n
				slot4 = "activity_pool_awards_empty"

				slot1(slot2, slot3(slot4))

				return
			end

			slot1 = slot0
			slot1 = slot1.activityPool
			slot2 = slot1
			slot1 = slot1.getComsume
			slot1 = slot1(slot2)
			slot2 = slot1
			slot3 = slot2
			slot2 = slot2[slot3]

			if slot2 == "max" then
				slot2 = math
				slot2 = slot2.min
				slot3 = slot0
				slot4 = math
				slot4 = slot4.max
				slot5 = math
				slot5 = slot5.floor
				slot6 = slot0
				slot6 = slot6.resCount
				slot7 = slot1.count
				slot6 = slot6 / slot7
				slot5 = slot5(slot6)
				slot6 = 1
				slot2 = slot2(slot3, slot4(slot5, slot6))
				slot0 = slot2
			else
				slot2 = math
				slot2 = slot2.min
				slot3 = slot0
				slot4 = slot1
				slot5 = slot2
				slot4 = slot4[slot5]
				slot2 = slot2(slot3, slot4)
				slot0 = slot2
			end

			slot2 = slot0
			slot2 = slot2.activityPool
			slot3 = slot2
			slot2 = slot2.enoughResForUsage
			slot4 = slot0
			slot2 = slot2(slot3, slot4)

			if not slot2 then
				slot2 = pg
				slot2 = slot2.TipsMgr
				slot2 = slot2.GetInstance
				slot2 = slot2()
				slot3 = slot2
				slot2 = slot2.ShowTips
				slot4 = i18n
				slot5 = "common_no_resource"

				slot2(slot3, slot4(slot5))

				return
			end

			function slot2()
				slot0 = pg
				slot0 = slot0.MsgboxMgr
				slot0 = slot0.GetInstance
				slot0 = slot0()
				slot1 = slot0
				slot0 = slot0.ShowMsgBox
				slot2 = {}
				slot3 = i18n
				slot4 = "amercian_notice_1"
				slot5 = slot0
				slot6 = slot1
				slot6 = slot6.count
				slot5 = slot5 * slot6
				slot6 = slot0
				slot3 = slot3(slot4, slot5, slot6)
				slot2.content = slot3

				function slot3()
					slot0:emit(LotteryMediator.ON_LAUNCH, slot0.activityVO.id, slot0.activityPool.id, slot0, slot2[slot0.activityVO.id] == "max")
				end

				slot2.onYes = slot3

				slot0(slot1, slot2)
			end

			slot3 = slot0
			slot3 = slot3.playerVO
			slot4 = slot3
			slot3 = slot3.OilMax
			slot5 = 1
			slot3 = slot3(slot4, slot5)

			if not slot3 then
				slot3 = slot0
				slot3 = slot3.playerVO
				slot4 = slot3
				slot3 = slot3.GoldMax
				slot5 = 1
				slot3 = slot3(slot4, slot5)

				if slot3 then
					slot3 = pg
					slot3 = slot3.MsgboxMgr
					slot3 = slot3.GetInstance
					slot3 = slot3()
					slot4 = slot3
					slot3 = slot3.ShowMsgBox
					slot5 = {}
					slot6 = i18n
					slot7 = "amercian_notice_6"
					slot6 = slot6(slot7)
					slot5.content = slot6

					function slot6()
						slot0 = slot0

						slot0()
					end

					slot5.onYes = slot6

					slot3(slot4, slot5)
				else
					slot3 = slot2

					slot3()
				end
			end
		end

		slot12 = SFX_PANEL

		slot8(slot9, slot10, slot11, slot12)
	end

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.descBtn

	function slot6()
		slot0 = slot0
		slot0 = slot0.showActivityPool

		if not slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.showActivityPool
		slot1 = slot0
		slot0 = slot0.getItems
		slot0, slot1 = slot0(slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.showBonus
		slot4 = slot0
		slot5 = slot1

		slot2(slot3, slot4, slot5)
	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	slot3 = onButton
	slot4 = slot0
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "window/top/btnBack"
	slot8 = slot0.bonusWindow
	slot5 = slot5(slot6, slot7, slot8)

	function slot6()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.bonusWindow
		slot2 = false

		slot0(slot1, slot2)
	end

	slot3(slot4, slot5, slot6)

	slot3 = onButton
	slot4 = slot0
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "window/button"
	slot8 = slot0.bonusWindow
	slot5 = slot5(slot6, slot7, slot8)

	function slot6()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.bonusWindow
		slot2 = false

		slot0(slot1, slot2)
	end

	slot3(slot4, slot5, slot6)

	slot3 = onButton
	slot4 = slot0
	slot5 = slot0.bonusWindow

	function slot6()
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.bonusWindow
		slot2 = false

		slot0(slot1, slot2)
	end

	slot3(slot4, slot5, slot6)

	slot3 = {}
	slot0.bgs = slot3
	slot3 = {}
	slot0.attrTFs = slot3
	slot3 = 1
	slot4 = table
	slot4 = slot4.getCount
	slot5 = slot0.activityPools
	slot4 = slot4(slot5)
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = slot0.attrs
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "arr_"
		slot10 = slot6
		slot9 = slot9 .. slot10
		slot7 = slot7(slot8, slot9)
		slot8 = IsNil
		slot9 = slot7
		slot8 = slot8(slot9)

		if not slot8 then
			slot8 = table
			slot8 = slot8.insert
			slot9 = slot0.attrTFs
			slot10 = slot7

			slot8(slot9, slot10)
		end
	end

	slot4 = slot0
	slot3 = slot0.updateResource

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.initPoolTFs

	slot3(slot4)

	slot4 = slot0
	slot3 = slot0.updateActivityPoolState

	slot3(slot4)

	slot3 = triggerToggle
	slot4 = slot0.activityPoolTFs
	slot5 = slot0.activityPool
	slot5 = slot5.id
	slot4 = slot4[slot5]
	slot5 = true

	slot3(slot4, slot5)
end

slot0.didEnter = slot3

function slot3(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.setActivity
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateActivityPoolState

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.switchToPool
	slot4 = slot1.data1

	slot2(slot3, slot4)
end

slot0.onActivityUpdated = slot3

function slot3(slot0)
	slot1 = {}
	slot0.activityPoolTFs = slot1
	slot1 = pairs
	slot2 = slot0.activityPools
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = slot0.lotteryPoolContainer
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5.index
		slot8 = slot8 - 1
		slot6 = slot6(slot7, slot8)
		slot7 = slot0.activityPoolTFs
		slot8 = slot5.id
		slot7[slot8] = slot6
		slot7 = onToggle
		slot8 = slot0
		slot9 = slot6

		function slot10(slot0)
			if slot0 then
				slot1 = slot0
				slot1 = slot1.prevId

				if slot1 then
					slot1 = slot1
					slot1 = slot1.activityPools
					slot2 = slot0
					slot2 = slot2.prevId
					slot1 = slot1[slot2]
					slot2 = slot1
					slot1 = slot1.canOpenNext
					slot1 = slot1(slot2)

					if slot1 then
						slot1 = slot1
						slot2 = slot1
						slot1 = slot1.emit
						slot3 = LotteryMediator
						slot3 = slot3.ON_SWITCH
						slot4 = slot1
						slot4 = slot4.activityVO
						slot4 = slot4.id
						slot5 = slot0
						slot5 = slot5.id

						slot1(slot2, slot3, slot4, slot5)
					else
						slot1 = slot1
						slot2 = slot1
						slot1 = slot1.switchToPool
						slot3 = slot0
						slot3 = slot3.id

						slot1(slot2, slot3)
					end
				end
			end
		end

		slot7(slot8, slot9, slot10)
	end
end

slot0.initPoolTFs = slot3

function slot3(slot0)
	slot1 = pairs
	slot2 = slot0.activityPools
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot6 = slot0.activityPoolTFs
		slot6 = slot6[slot4]
		slot7 = slot5.prevId

		if slot7 then
			slot7 = slot0.activityPools
			slot8 = slot5.prevId
			slot7 = slot7[slot8]
			slot8 = slot7
			slot7 = slot7.canOpenNext
			slot7 = slot7(slot8)

			if slot7(slot8) then
				slot7 = false
			end
		else
			slot7 = true
		end

		slot8 = setActive
		slot10 = slot6
		slot9 = slot6.Find
		slot11 = "bg/unlock"
		slot9 = slot9(slot10, slot11)
		slot10 = slot7

		slot8(slot9, slot10)

		slot8 = setActive
		slot10 = slot6
		slot9 = slot6.Find
		slot11 = "bg/lock"
		slot9 = slot9(slot10, slot11)
		slot10 = not slot7

		slot8(slot9, slot10)

		slot8 = setActive
		slot10 = slot6
		slot9 = slot6.Find
		slot11 = "selected/unlock"
		slot9 = slot9(slot10, slot11)
		slot10 = slot7

		slot8(slot9, slot10)

		slot8 = setActive
		slot10 = slot6
		slot9 = slot6.Find
		slot11 = "selected/lock"
		slot9 = slot9(slot10, slot11)
		slot10 = not slot7

		slot8(slot9, slot10)

		slot8 = slot0

		if slot8 then
			slot8 = setActive
			slot10 = slot6
			slot9 = slot6.Find
			slot11 = "icon"
			slot9 = slot9(slot10, slot11)
			slot10 = slot7

			slot8(slot9, slot10)

			slot8 = setActive
			slot10 = slot6
			slot9 = slot6.Find
			slot11 = "icon_g"
			slot9 = slot9(slot10, slot11)
			slot10 = not slot7

			slot8(slot9, slot10)
		end

		setActive(slot6:Find("finish"), slot5:getleftItemCount() == 0)

		slot9 = slot0.attrTFs[slot5.index - 1]

		if slot9 then
			slot9 = triggerToggle
			slot10 = slot0.attrTFs
			slot11 = slot5.index
			slot11 = slot11 - 1
			slot10 = slot10[slot11]
			slot11 = slot7

			slot9(slot10, slot11)
		end
	end
end

slot0.updateActivityPoolState = slot3

function slot3(slot0, slot1)
	slot2 = slot0.activityPools
	slot2 = slot2[slot1]
	slot3 = slot0.activityPoolTFs
	slot3 = slot3[slot1]
	slot5 = slot0
	slot4 = slot0.updateMainItems
	slot6 = slot2

	slot4(slot5, slot6)

	slot5 = slot0
	slot4 = slot0.updateAwardsFetchedCount
	slot6 = slot2

	slot4(slot5, slot6)

	slot4 = slot0.bgs
	slot4 = slot4[slot1]

	if not slot4 then
		slot5 = slot0

		if slot5 then
			slot5 = LoadSprite
			slot6 = "lotterybg/cht_"
			slot7 = slot2.index
			slot6 = slot6 .. slot7
			slot5 = slot5(slot6)
			slot4 = slot5
		else
			slot5 = LoadSprite
			slot6 = "lotterybg/kr_re_"
			slot7 = slot2.index
			slot6 = slot6 .. slot7
			slot5 = slot5(slot6)
			slot4 = slot5
		end

		slot5 = slot0.bgs
		slot5[slot1] = slot4
	end

	slot5 = slot0.bgTF
	slot5.sprite = slot4
	slot6 = slot2
	slot5 = slot2.getComsume
	slot5 = slot5(slot6)
	slot6 = math
	slot6 = slot6.min
	slot8 = slot2
	slot7 = slot2.getleftItemCount
	slot7 = slot7(slot8)
	slot8 = 10
	slot6 = slot6(slot7, slot8)
	slot7 = math
	slot7 = slot7.min
	slot9 = slot2
	slot8 = slot2.getleftItemCount
	slot8 = slot8(slot9)
	slot9 = math
	slot9 = slot9.max
	slot10 = math
	slot10 = slot10.floor
	slot11 = slot0.resCount
	slot12 = slot5.count
	slot11 = slot11 / slot12
	slot10 = slot10(slot11)
	slot11 = 1
	slot7 = slot7(slot8, slot9(slot10, slot11))
	slot8 = slot0.launchOneBtnTxt
	slot9 = slot5.count
	slot8.text = slot9
	slot8 = slot0.launchTenBtnTxt
	slot9 = slot5.count
	slot9 = slot9 * slot6
	slot8.text = slot9
	slot8 = slot0.launchMaxBtnTxt
	slot9 = slot5.count
	slot9 = slot9 * slot7
	slot8.text = slot9
	slot8 = slot0.activityPools
	slot9 = slot2.id
	slot8 = slot8[slot9]
	slot0.showActivityPool = slot8
end

slot0.switchToPool = slot3

function slot3(slot0, slot1)
	slot2 = slot0.awardsCounttxt

	if slot2 then
		slot3 = slot1
		slot2 = slot1.getFetchCount
		slot2 = slot2(slot3)
		slot4 = slot1
		slot3 = slot1.getItemCount
		slot3 = slot3(slot4)
		slot4 = slot0.awardsCounttxt
		slot5 = setColorStr
		slot6 = slot3 - slot2

		if slot2 < slot3 then
			slot5 = slot5(slot6, COLOR_GREEN or COLOR_RED)
			slot6 = "/"
			slot7 = slot3
			slot5 = slot5 .. slot6 .. slot7
			slot4.text = slot5
		end
	end
end

slot0.updateAwardsFetchedCount = slot3

function slot3(slot0, slot1)
	slot3 = slot1
	slot2 = slot1.getMainItems
	slot2 = slot2(slot3)
	slot3 = slot0.mainItenContainer
	slot3 = slot3.childCount
	slot4 = slot3
	slot5 = #slot2
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		slot8 = cloneTplTo
		slot9 = slot0.mainItenTpl
		slot10 = slot0.mainItenContainer

		slot8(slot9, slot10)
	end

	slot4 = slot0.mainItenContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	for slot7 = slot4, slot5, slot6 do
		setActive(slot0.mainItenContainer:GetChild(slot7 - 1), slot7 <= #slot2)

		if slot9 then
			updateDrop(slot8, slot10)
			setActive(slot8:Find("mask"), slot2[slot7].surplus <= 0)
			setText(slot8:Find("icon_bg/surplus"), "X" .. slot2[slot7].surplus or "")

			slot11 = onButton
			slot12 = slot0
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
		end
	end
end

slot0.updateMainItems = slot3

function slot3(slot0, slot1, slot2)
	slot3 = setActive
	slot4 = slot0.bonusWindow
	slot5 = true

	slot3(slot4, slot5)

	slot0.awardMain = slot1
	slot0.awardNormal = slot2
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "Msgbox/window/items/scrollview/item"
	slot3 = slot3(slot4, slot5)
	slot0.trDropTpl = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "Msgbox/window/items/scrollview/list/list_main"
	slot3 = slot3(slot4, slot5)
	slot0.trDrops = slot3
	slot3 = UIItemList
	slot3 = slot3.New
	slot4 = slot0.trDrops
	slot5 = slot0.trDropTpl
	slot3 = slot3(slot4, slot5)
	slot0.dropList = slot3
	slot3 = slot0.dropList
	slot4 = slot3
	slot3 = slot3.make

	function slot5(slot0, slot1, slot2)
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.updateDrop
		slot5 = slot0
		slot6 = slot1
		slot7 = slot2
		slot8 = slot0
		slot8 = slot8.nameTxts
		slot9 = slot0
		slot9 = slot9.awardMain

		slot3(slot4, slot5, slot6, slot7, slot8, slot9)
	end

	slot3(slot4, slot5)

	slot3 = slot0.dropList
	slot4 = slot3
	slot3 = slot3.align
	slot5 = slot0.awardMain
	slot5 = #slot5

	slot3(slot4, slot5)

	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "Msgbox/window/items/scrollview/list/list_normal"
	slot3 = slot3(slot4, slot5)
	slot0.trDropsN = slot3
	slot3 = UIItemList
	slot3 = slot3.New
	slot4 = slot0.trDropsN
	slot5 = slot0.trDropTpl
	slot3 = slot3(slot4, slot5)
	slot0.dropListN = slot3
	slot3 = slot0.dropListN
	slot4 = slot3
	slot3 = slot3.make

	function slot5(slot0, slot1, slot2)
		slot3 = slot0
		slot4 = slot3
		slot3 = slot3.updateDrop
		slot5 = slot0
		slot6 = slot1
		slot7 = slot2
		slot8 = slot0
		slot8 = slot8.nameTxtsN
		slot9 = slot0
		slot9 = slot9.awardNormal

		slot3(slot4, slot5, slot6, slot7, slot8, slot9)
	end

	slot3(slot4, slot5)

	slot3 = slot0.dropListN
	slot4 = slot3
	slot3 = slot3.align
	slot5 = slot0.awardNormal
	slot5 = #slot5

	slot3(slot4, slot5)
end

slot0.showBonus = slot3

function slot3(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = UIItemList
	slot6 = slot6.EventUpdate

	if slot1 == slot6 then
		updateDrop(slot3, slot6)
		setText(slot3:Find("count"), slot5[slot2 + 1].surplus .. "/" .. slot5[slot2 + 1].total)
		setActive(slot3:Find("mask"), slot5[slot2 + 1].surplus <= 0)

		slot7 = slot4[slot2]

		if not slot7 then
			slot8 = ScrollTxt
			slot8 = slot8.New
			slot9 = findTF
			slot10 = slot3
			slot11 = "name_mask"
			slot9 = slot9(slot10, slot11)
			slot10 = findTF
			slot11 = slot3
			slot12 = "name_mask/name"
			slot10 = slot10(slot11, slot12)
			slot11 = true
			slot8 = slot8(slot9, slot10, slot11)
			slot7 = slot8
			slot4[slot2] = slot7
		end

		slot9 = slot7
		slot8 = slot7.setText
		slot10 = slot6.name

		if not slot10 then
			slot10 = slot6.cfg
			slot10 = slot10.name
		end

		slot8(slot9, slot10)
	end
end

slot0.updateDrop = slot3

function slot3(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = #slot1
	slot3 = 1
	slot4 = -1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot1[slot5]

		if slot6 then
			slot6 = slot1[slot5]
			slot7 = slot6
			slot6 = slot6.destroy

			slot6(slot7)

			slot6 = table
			slot6 = slot6.remove
			slot7 = slot1
			slot8 = slot5

			slot6(slot7, slot8)
		end
	end
end

slot0.clearAllNameTxt = slot3

function slot3(slot0)
	slot1 = nil
	slot0.bgs = slot1
	slot2 = slot0
	slot1 = slot0.clearAllNameTxt
	slot3 = slot0.nameTxts

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.clearAllNameTxt
	slot3 = slot0.nameTxtsN

	slot1(slot2, slot3)
end

slot0.willExit = slot3

return slot0
