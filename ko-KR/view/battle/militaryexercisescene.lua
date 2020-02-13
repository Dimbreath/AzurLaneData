slot0 = class
slot1 = "MilitaryExerciseScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 1
slot0.TYPE_SHOP = slot1

function slot1(slot0)
	slot1 = "MilitaryExerciseUI"

	return slot1
end

slot0.getUIName = slot1

function slot1(slot0, slot1)
	slot0.ships = slot1
end

slot0.setShips = slot1

function slot1(slot0, slot1)
	slot0.fleet = slot1
end

slot0.setFleet = slot1

function slot1(slot0, slot1)
	slot2 = table
	slot2 = slot2.sort
	slot3 = slot1

	function slot4(slot0, slot1)
		return slot0.rank < slot1.rank
	end

	slot2(slot3, slot4)

	slot0.rivalVOs = slot1
end

slot0.setRivals = slot1

function slot1(slot0, slot1)
	slot0.exerciseCount = slot1
end

slot0.setExerciseCount = slot1

function slot1(slot0, slot1)
	slot0.seasonTime = slot1
end

slot0.setSeasonTime = slot1

function slot1(slot0, slot1)
	slot0.recoverTime = slot1
end

slot0.setRecoverTime = slot1

function slot1(slot0, slot1)
	slot0.activity = slot1
	slot3 = slot0
	slot2 = slot0.setSeasonTime
	slot4 = slot1.stopTime

	slot2(slot3, slot4)
end

slot0.setActivity = slot1

function slot1(slot0, slot1)
	slot0.seasonInfo = slot1
	slot3 = slot0
	slot2 = slot0.setFleet
	slot4 = slot1.fleet

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setRivals
	slot4 = slot1.rivals

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setExerciseCount
	slot4 = slot1.fightCount

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setRecoverTime
	slot4 = slot1.resetTime

	slot2(slot3, slot4)
end

slot0.updateSeaInfoVO = slot1

function slot1(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.updateSeaInfoVO
	slot4 = slot1

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setFleet
	slot4 = slot1.fleet

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setRivals
	slot4 = slot1.rivals

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setExerciseCount
	slot4 = slot1.fightCount

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.setRecoverTime
	slot4 = slot1.resetTime

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateSeasonTime

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initPlayerFleet

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.initPlayerInfo

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateRivals

	slot2(slot3)
end

slot0.setSeasonInfo = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_panel/adapt/top/backBtn"
	slot1 = slot1(slot2, slot3)
	slot0.backBtn = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot1 = slot1.UIMain
	slot0._normalUIMain = slot1
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot1 = slot1.OverlayMain
	slot0._overlayUIMain = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "playerRes"
	slot1 = slot1(slot2, slot3)
	slot0.playerResOb = slot1
	slot1 = PlayerResource
	slot1 = slot1.New
	slot1 = slot1()
	slot0.resPanel = slot1
	slot1 = tf
	slot2 = slot0.resPanel
	slot2 = slot2._go
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.SetParent
	slot3 = tf
	slot4 = slot0.playerResOb
	slot3 = slot3(slot4)
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot1 = findTF
	slot2 = slot0._tf
	slot3 = "blur_panel/adapt/top"
	slot1 = slot1(slot2, slot3)
	slot0.top = slot1
	slot1 = SetParent
	slot2 = slot0.playerResOb
	slot3 = slot0.top

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "award_info_panel"
	slot1 = slot1(slot2, slot3)
	slot0.awardPanel = slot1
	slot1 = setActive
	slot2 = slot0.awardPanel
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "center/rival_list"
	slot1 = slot1(slot2, slot3)
	slot0.rivalList = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bottom"
	slot1 = slot1(slot2, slot3)
	slot0.bottomPanel = slot1
	slot2 = slot0
	slot1 = slot0.getTpl
	slot3 = "fleet_info/shiptpl"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipTpl = slot1
	slot2 = slot0
	slot1 = slot0.getTpl
	slot3 = "fleet_info/emptytpl"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.emptyTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "fleet_info/main"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.mainContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "fleet_info/vanguard"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.vanguardContainer = slot1
	slot1 = pg
	slot1 = slot1.arena_data_rank
	slot0.rankCfg = slot1
	slot2 = slot0
	slot1 = slot0.uiStartAnimating

	slot1(slot2)
end

slot0.init = slot1

function slot1(slot0, slot1)
	slot0.player = slot1
	slot2 = slot0.resPanel
	slot3 = slot2
	slot2 = slot2.setResources
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = findTF
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "bottom/player_info"
	slot4 = slot4(slot5, slot6)
	slot5 = "statistics_panel/exploit_bg/score"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.exploit

	slot2(slot3, slot4)
end

slot0.updatePlayer = slot1

function slot1(slot0)
	slot1 = 0
	slot2 = slot0.bottomPanel
	slot2 = slot2.localPosition
	slot2 = slot2.y
	slot3 = setAnchoredPosition
	slot4 = slot0.bottomPanel
	slot5 = {}
	slot6 = slot2 - 308
	slot5.y = slot6

	slot3(slot4, slot5)

	slot3 = shiftPanel
	slot4 = slot0.bottomPanel
	slot5 = nil
	slot6 = slot2
	slot7 = 0.3
	slot8 = slot1
	slot9 = true
	slot10 = true

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

slot0.uiStartAnimating = slot1

function slot1(slot0)
	slot1 = 0
	slot2 = slot0.bottomPanel
	slot2 = slot2.localPosition
	slot2 = slot2.y
	slot3 = shiftPanel
	slot4 = slot0.bottomPanel
	slot5 = nil
	slot6 = slot2 - 308
	slot7 = 0.3
	slot8 = slot1
	slot9 = true
	slot10 = true

	slot3(slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

slot0.uiExitAnimating = slot1

function slot1(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.isOpenRivalInfoPanel

		if slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.closeRivalInfoPanel

			slot0(slot1)
		else
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_BACK

			slot0(slot1, slot2)
		end
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = setActive
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "stamp"
	slot2 = slot2(slot3, slot4)
	slot3 = getProxy
	slot4 = TaskProxy
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.mingshiTouchFlagEnabled

	slot1(slot2, slot3(slot4))

	slot1 = LOCK_CLICK_MINGSHI

	if slot1 then
		slot1 = setActive
		slot3 = slot0
		slot2 = slot0.findTF
		slot4 = "stamp"
		slot2 = slot2(slot3, slot4)
		slot3 = false

		slot1(slot2, slot3)
	end

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "stamp"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = getProxy
		slot1 = TaskProxy
		slot0 = slot0(slot1)
		slot1 = slot0
		slot0 = slot0.dealMingshiTouchFlag
		slot2 = 10

		slot0(slot1, slot2)
	end

	slot5 = SFX_CONFIRM

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "bottom/buttons/rank_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = MilitaryExerciseMediator
		slot2 = slot2.OPEN_RANK

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "bottom/buttons/shop_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = MilitaryExerciseMediator
		slot2 = slot2.OPEN_SHOP

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "bottom/buttons/award_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = slot0
		slot1 = true
		slot0.isOpenAwards = slot1
		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.BlurPanel
		slot2 = slot0
		slot2 = slot2.awardPanel

		slot0(slot1, slot2)

		slot0 = slot0
		slot0 = slot0.isInitAward

		if not slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.initAwards

			slot0(slot1)

			slot0 = slot0
			slot1 = true
			slot0.isInitAward = slot1
		else
			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.awardPanel
			slot2 = true

			slot0(slot1, slot2)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = findTF
	slot4 = slot0._tf
	slot5 = "center/replace_rival_btn"
	slot3 = slot3(slot4, slot5)

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = MilitaryExerciseMediator
		slot2 = slot2.REPLACE_RIVALS

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = slot0.contextData
	slot1 = slot1.mode
	slot2 = slot0
	slot2 = slot2.TYPE_SHOP

	if slot1 == slot2 then
		slot1 = triggerToggle
		slot2 = slot0.shopBtn
		slot3 = true

		slot1(slot2, slot3)
	end
end

slot0.didEnter = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "center/season_info"
	slot1 = slot1(slot2, slot3)
	slot0.seasonInfoPanel = slot1
	slot2 = slot0
	slot1 = slot0.updateSeasonLeftTime
	slot3 = slot0.seasonTime

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateRecoverTime
	slot3 = slot0.recoverTime

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.updateExerciseCount

	slot1(slot2)
end

slot0.updateSeasonTime = slot1

function slot1(slot0)
	setText(findTF(slot0.seasonInfoPanel, "count"), math.max(slot0.exerciseCount or 0, 0) .. "/" .. SeasonInfo.MAX_FIGHTCOUNT)
end

slot0.updateExerciseCount = slot1

function slot1(slot0, slot1)
	slot2 = slot0.leftTimeTimer

	if slot2 then
		slot2 = slot0.leftTimeTimer
		slot3 = slot2
		slot2 = slot2.Stop

		slot2(slot3)

		slot2 = nil
		slot0.leftTimeTimer = slot2
	end

	slot2 = findTF
	slot3 = slot0.seasonInfoPanel
	slot4 = "left_time_container/day"
	slot2 = slot2(slot3, slot4)
	slot3 = findTF
	slot4 = slot0.seasonInfoPanel
	slot5 = "left_time_container/time"
	slot3 = slot3(slot4, slot5)
	slot4 = Timer
	slot4 = slot4.New

	function slot5()
		slot0 = slot0
		slot1 = pg
		slot1 = slot1.TimeMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.GetServerTime
		slot1 = slot1(slot2)
		slot0 = slot0 - slot1
		slot1 = 0

		if slot0 > slot1 then
			slot1 = pg
			slot1 = slot1.TimeMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.parseTimeFrom
			slot3 = slot0
			slot1, slot2, slot3, slot4 = slot1(slot2, slot3)
			slot5 = setText
			slot6 = slot1
			slot7 = slot1

			slot5(slot6, slot7)

			slot5 = setText
			slot6 = slot2
			slot7 = string
			slot7 = slot7.format
			slot8 = "%02d:%02d:%02d"
			slot9 = slot2
			slot10 = slot3
			slot11 = slot4

			slot5(slot6, slot7(slot8, slot9, slot10, slot11))
		else
			slot1 = setText
			slot2 = slot1
			slot3 = 0

			slot1(slot2, slot3)

			slot1 = setText
			slot2 = slot2
			slot3 = string
			slot3 = slot3.format
			slot4 = "%02d:%02d:%02d"
			slot5 = 0
			slot6 = 0
			slot7 = 0

			slot1(slot2, slot3(slot4, slot5, slot6, slot7))

			slot1 = slot3
			slot1 = slot1.leftTimeTimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = slot3
			slot2 = nil
			slot1.leftTimeTimer = slot2
		end
	end

	slot6 = 1
	slot7 = -1
	slot4 = slot4(slot5, slot6, slot7)
	slot0.leftTimeTimer = slot4
	slot4 = slot0.leftTimeTimer
	slot5 = slot4
	slot4 = slot4.Start

	slot4(slot5)

	slot4 = slot0.leftTimeTimer
	slot4 = slot4.func

	slot4()
end

slot0.updateSeasonLeftTime = slot1

function slot1(slot0, slot1)
	slot2 = slot0.recoverTimer

	if slot2 then
		slot2 = slot0.recoverTimer
		slot3 = slot2
		slot2 = slot2.Stop

		slot2(slot3)

		slot2 = nil
		slot0.recoverTimer = slot2
	end

	slot2 = findTF
	slot3 = slot0.seasonInfoPanel
	slot4 = "recover_container/time"
	slot2 = slot2(slot3, slot4)

	if slot1 == 0 then
		slot3 = setText
		slot4 = slot2
		slot5 = ""

		slot3(slot4, slot5)

		return
	end

	slot3 = Timer
	slot3 = slot3.New

	function slot4()
		slot0 = slot0
		slot1 = pg
		slot1 = slot1.TimeMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.GetServerTime
		slot1 = slot1(slot2)
		slot0 = slot0 - slot1
		slot1 = 0

		if slot0 > slot1 then
			slot1 = setText
			slot2 = slot1
			slot3 = i18n
			slot4 = "exercise_count_recover_tip"
			slot5 = pg
			slot5 = slot5.TimeMgr
			slot5 = slot5.GetInstance
			slot5 = slot5()
			slot6 = slot5
			slot5 = slot5.DescCDTime
			slot7 = slot0

			slot1(slot2, slot3(slot4, slot5(slot6, slot7)))
		else
			slot1 = slot2
			slot1 = slot1.recoverTimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = slot2
			slot2 = nil
			slot1.recoverTimer = slot2
		end
	end

	slot5 = 1
	slot6 = -1
	slot3 = slot3(slot4, slot5, slot6)
	slot0.recoverTimer = slot3
	slot3 = slot0.recoverTimer
	slot4 = slot3
	slot3 = slot3.Start

	slot3(slot4)

	slot3 = slot0.recoverTimer
	slot3 = slot3.func

	slot3()
end

slot0.updateRecoverTime = slot1

function slot1(slot0)
	function slot1(slot0, slot1, slot2)
		slot3 = cloneTplTo
		slot4 = slot0
		slot4 = slot4.shipTpl
		slot5 = slot1
		slot3 = slot3(slot4, slot5)
		slot4 = slot0.configId
		slot5 = slot0.skinId
		slot6 = updateShip
		slot7 = slot3
		slot8 = slot0
		slot9 = {
			initStar = true
		}

		slot6(slot7, slot8, slot9)

		slot6 = setText
		slot7 = findTF
		slot8 = slot3
		slot9 = "icon_bg/lv/Text"
		slot7 = slot7(slot8, slot9)
		slot8 = slot0.level

		slot6(slot7, slot8)

		slot6 = onButton
		slot7 = slot0
		slot8 = slot3

		function slot9()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = MilitaryExerciseMediator
			slot2 = slot2.OPEN_DOCKYARD
			slot3 = slot1
			slot4 = slot2
			slot4 = slot4.id

			slot0(slot1, slot2, slot3, slot4)
		end

		slot10 = SFX_PANEL

		slot6(slot7, slot8, slot9, slot10)
	end

	slot2 = removeAllChildren
	slot3 = slot0.mainContainer

	slot2(slot3)

	slot2 = removeAllChildren
	slot3 = slot0.vanguardContainer

	slot2(slot3)

	slot2 = 1
	slot3 = 3
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot0.fleet
		slot6 = slot6.mainShips
		slot6 = slot6[slot5]

		if slot6 then
			slot7 = slot0.ships
			slot7 = slot7[slot6]

			if slot7 then
				slot8 = slot1
				slot9 = slot7
				slot10 = slot0.mainContainer
				slot11 = TeamType
				slot11 = slot11.Main

				slot8(slot9, slot10, slot11)
			end
		else
			slot7 = cloneTplTo
			slot8 = slot0.emptyTpl
			slot9 = slot0.mainContainer
			slot7 = slot7(slot8, slot9)
			slot8 = onButton
			slot9 = slot0
			slot10 = findTF
			slot11 = slot7
			slot12 = "icon_bg"
			slot10 = slot10(slot11, slot12)

			function slot11()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = MilitaryExerciseMediator
				slot2 = slot2.OPEN_DOCKYARD
				slot3 = TeamType
				slot3 = slot3.Main
				slot4 = 0

				slot0(slot1, slot2, slot3, slot4)
			end

			slot12 = SFX_PANEL

			slot8(slot9, slot10, slot11, slot12)
		end
	end

	slot2 = 1
	slot3 = 3
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = slot0.fleet
		slot6 = slot6.vanguardShips
		slot6 = slot6[slot5]

		if slot6 then
			slot7 = slot0.ships
			slot7 = slot7[slot6]

			if slot7 then
				slot8 = slot1
				slot9 = slot7
				slot10 = slot0.vanguardContainer
				slot11 = TeamType
				slot11 = slot11.Vanguard

				slot8(slot9, slot10, slot11)
			end
		else
			slot7 = cloneTplTo
			slot8 = slot0.emptyTpl
			slot9 = slot0.vanguardContainer
			slot7 = slot7(slot8, slot9)
			slot8 = onButton
			slot9 = slot0
			slot10 = findTF
			slot11 = slot7
			slot12 = "icon_bg"
			slot10 = slot10(slot11, slot12)

			function slot11()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = MilitaryExerciseMediator
				slot2 = slot2.OPEN_DOCKYARD
				slot3 = TeamType
				slot3 = slot3.Vanguard
				slot4 = 0

				slot0(slot1, slot2, slot3, slot4)
			end

			slot12 = SFX_PANEL

			slot8(slot9, slot10, slot11, slot12)
		end
	end
end

slot0.initPlayerFleet = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-98, warpins: 1 ---
	slot1 = slot0.seasonInfo
	slot1 = slot1.score
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "bottom/player_info"
	slot2 = slot2(slot3, slot4)
	slot3 = setText
	slot4 = findTF
	slot5 = slot2
	slot6 = "statistics_panel/score_bg/score"
	slot4 = slot4(slot5, slot6)
	slot5 = slot1

	slot3(slot4, slot5)

	slot3 = setText
	slot4 = findTF
	slot5 = slot2
	slot6 = "statistics_panel/rank_bg/score"
	slot4 = slot4(slot5, slot6)
	slot5 = slot0.seasonInfo
	slot5 = slot5.rank

	slot3(slot4, slot5)

	slot3 = findTF
	slot4 = slot2
	slot5 = "upgrade_tip/level"
	slot3 = slot3(slot4, slot5)
	slot4 = findTF
	slot5 = slot2
	slot6 = "upgrade_rank_tip/level"
	slot4 = slot4(slot5, slot6)
	slot5 = findTF
	slot6 = slot2
	slot7 = "upgrade_score_tip/level"
	slot5 = slot5(slot6, slot7)
	slot6 = SeasonInfo
	slot6 = slot6.getMilitaryRank
	slot7 = slot1
	slot8 = slot0.seasonInfo
	slot8 = slot8.rank
	slot6 = slot6(slot7, slot8)
	slot7 = SeasonInfo
	slot7 = slot7.getEmblem
	slot8 = slot1
	slot9 = slot0.seasonInfo
	slot9 = slot9.rank
	slot7 = slot7(slot8, slot9)
	slot8 = LoadImageSpriteAsync
	slot9 = "emblem/"
	slot10 = slot7
	slot9 = slot9 .. slot10
	slot10 = findTF
	slot11 = slot2
	slot12 = "medal_bg/medal"
	slot10 = slot10(slot11, slot12)
	slot11 = true

	slot8(slot9, slot10, slot11)

	slot8 = LoadImageSpriteAsync
	slot9 = "emblem/n_"
	slot10 = slot7
	slot9 = slot9 .. slot10
	slot10 = findTF
	slot11 = slot2
	slot12 = "medal_bg/Text"
	slot10 = slot10(slot11, slot12)
	slot11 = true

	slot8(slot9, slot10, slot11)

	slot8 = findTF
	slot9 = slot2
	slot10 = "exp_slider"
	slot8 = slot8(slot9, slot10)
	slot9 = slot8
	slot8 = slot8.GetComponent
	slot10 = "Slider"
	slot8 = slot8(slot9, slot10)
	slot9 = SeasonInfo
	slot9 = slot9.getNextMilitaryRank
	slot10 = slot1
	slot11 = slot0.seasonInfo
	slot11 = slot11.rank
	slot9, slot10, slot11 = slot9(slot10, slot11)
	slot12 = math
	slot12 = slot12.min
	slot13 = slot10
	slot14 = slot1
	slot12 = slot12(slot13, slot14)
	slot1 = slot12
	slot12 = setText
	slot13 = slot3
	slot14 = slot9

	slot12(slot13, slot14)

	slot12 = setText
	slot13 = slot5
	slot14 = slot10

	slot12(slot13, slot14)

	slot12 = setText
	slot13 = slot4
	slot14 = 0
	slot14 = (slot11 > slot14 and slot11) or "-"

	slot12(slot13, slot14)

	slot12 = slot1 / slot10
	slot8.value = slot12

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 99-100, warpins: 1 ---
	if not slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-101, warpins: 2 ---
		slot14 = "-"
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 102-105, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.initPlayerInfo = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = {}
	slot0.rivalTFs = slot1
	slot1 = 1
	slot2 = 4
	slot3 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-16, warpins: 0 ---
	for slot4 = slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-16, warpins: 2 ---
		slot5 = table
		slot5 = slot5.insert
		slot6 = slot0.rivalTFs
		slot7 = slot0.rivalList
		slot8 = slot7
		slot7 = slot7.GetChild
		slot9 = slot4 - 1

		slot5(slot6, slot7(slot8, slot9))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-20, warpins: 1 ---
	slot1 = 1
	slot2 = 4
	slot3 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 21-41, warpins: 0 ---
	for slot4 = slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-28, warpins: 2 ---
		slot5 = slot0.rivalTFs
		slot5 = slot5[slot4]
		slot6 = setActive
		slot7 = slot5
		slot8 = slot0.rivalVOs
		slot8 = #slot8

		if slot4 > slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-30, warpins: 1 ---
			slot8 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-31, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-36, warpins: 2 ---
		slot6(slot7, slot8)

		slot6 = slot0.rivalVOs
		slot6 = #slot6

		if slot4 <= slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-40, warpins: 1 ---
			slot7 = slot0
			slot6 = slot0.updateRival
			slot8 = slot4

			slot6(slot7, slot8)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 41-41, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 42-42, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.updateRivals = slot1

function slot1(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-113, warpins: 1 ---
	slot2 = slot0.rivalTFs
	slot2 = slot2[slot1]
	slot3 = slot0.rivalVOs
	slot3 = slot3[slot1]
	slot4 = SeasonInfo
	slot4 = slot4.getMilitaryRank
	slot5 = slot3.score
	slot6 = slot3.rank
	slot4 = slot4(slot5, slot6)
	slot5 = findTF
	slot6 = slot2
	slot7 = "shiptpl"
	slot5 = slot5(slot6, slot7)
	slot6 = SeasonInfo
	slot6 = slot6.getEmblem
	slot7 = slot3.score
	slot8 = slot3.rank
	slot6 = slot6(slot7, slot8)
	slot7 = LoadImageSpriteAsync
	slot8 = "emblem/"
	slot9 = slot6
	slot8 = slot8 .. slot9
	slot9 = findTF
	slot10 = slot2
	slot11 = "medal"
	slot9 = slot9(slot10, slot11)
	slot10 = true

	slot7(slot8, slot9, slot10)

	slot7 = LoadImageSpriteAsync
	slot8 = "emblem/n_"
	slot9 = slot6
	slot8 = slot8 .. slot9
	slot9 = findTF
	slot10 = slot2
	slot11 = "Text"
	slot9 = slot9(slot10, slot11)
	slot10 = true

	slot7(slot8, slot9, slot10)

	slot7 = updateDrop
	slot8 = slot5
	slot9 = {}
	slot10 = DROP_TYPE_SHIP
	slot9.type = slot10
	slot10 = slot3.icon
	slot9.id = slot10
	slot10 = slot3.skinId
	slot9.skinId = slot10
	slot10 = slot3.proposeTime
	slot9.propose = slot10
	slot10 = slot3.remoulded
	slot9.remoulded = slot10
	slot10 = {
		initStar = true
	}

	slot7(slot8, slot9, slot10)

	slot7 = setActive
	slot8 = findTF
	slot9 = slot5
	slot10 = "icon_bg/lv"
	slot8 = slot8(slot9, slot10)
	slot9 = false

	slot7(slot8, slot9)

	slot7 = setText
	slot8 = findTF
	slot9 = slot2
	slot10 = "rank_bg/rank_container/name"
	slot8 = slot8(slot9, slot10)
	slot9 = slot3.rank

	slot7(slot8, slot9)

	slot7 = setText
	slot8 = findTF
	slot9 = slot2
	slot10 = "name_container/name"
	slot8 = slot8(slot9, slot10)
	slot9 = slot3.name

	slot7(slot8, slot9)

	slot7 = setText
	slot8 = findTF
	slot9 = slot2
	slot10 = "name_container/lv"
	slot8 = slot8(slot9, slot10)
	slot9 = "Lv."
	slot10 = slot3.level
	slot9 = slot9 .. slot10

	slot7(slot8, slot9)

	slot7 = setText
	slot8 = findTF
	slot9 = slot2
	slot10 = "comprehensive_panel/comprehensive/main_fleet/value"
	slot8 = slot8(slot9, slot10)
	slot10 = slot3
	slot9 = slot3.GetGearScoreSum
	slot11 = TeamType
	slot11 = slot11.Main

	slot7(slot8, slot9(slot10, slot11))

	slot7 = setText
	slot8 = findTF
	slot9 = slot2
	slot10 = "comprehensive_panel/comprehensive/vanguard_fleet/value"
	slot8 = slot8(slot9, slot10)
	slot10 = slot3
	slot9 = slot3.GetGearScoreSum
	slot11 = TeamType
	slot11 = slot11.Vanguard

	slot7(slot8, slot9(slot10, slot11))

	slot7 = onButton
	slot8 = slot0
	slot9 = slot2

	function slot10()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = MilitaryExerciseMediator
		slot2 = slot2.OPEN_RIVAL_INFO
		slot3 = slot1

		slot0(slot1, slot2, slot3)

		return
		--- END OF BLOCK #0 ---



	end

	slot11 = SFX_PANEL

	slot7(slot8, slot9, slot10, slot11)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateRival = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-89, warpins: 1 ---
	slot1 = setActive
	slot2 = slot0.awardPanel
	slot3 = true

	slot1(slot2, slot3)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "top/btnBack"
	slot6 = slot0.awardPanel
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.closeAwards

		slot0(slot1)

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bg/frame/content/time_panel/Text"
	slot4 = slot0.awardPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = setText
	slot3 = slot1
	slot4 = i18n
	slot5 = "exercise_time_tip"
	slot6 = "   "
	slot7 = os
	slot7 = slot7.date
	slot8 = "%Y.%m.%d"
	slot9 = slot0.activity
	slot9 = slot9.data1
	slot7 = slot7(slot8, slot9)
	slot8 = " — "
	slot9 = os
	slot9 = slot9.date
	slot10 = "%Y.%m.%d"
	slot11 = slot0.activity
	slot11 = slot11.stopTime
	slot9 = slot9(slot10, slot11)
	slot6 = slot6 .. slot7 .. slot8 .. slot9

	slot2(slot3, slot4(slot5, slot6))

	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "bg/frame/content/desc_panel/Text"
	slot5 = slot0.awardPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = setText
	slot4 = slot2
	slot5 = i18n
	slot6 = "exercise_rule_tip"

	slot3(slot4, slot5(slot6))

	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "bg/frame/content/award_panel/award_list"
	slot6 = slot0.awardPanel
	slot3 = slot3(slot4, slot5, slot6)
	slot5 = slot0
	slot4 = slot0.getTpl
	slot6 = "awardtpl"
	slot7 = slot3
	slot4 = slot4(slot5, slot6, slot7)
	slot6 = slot0
	slot5 = slot0.getTpl
	slot7 = "awards/equipmenttpl"
	slot8 = slot4
	slot5 = slot5(slot6, slot7, slot8)
	slot7 = slot0
	slot6 = slot0.findTF
	slot8 = "linetpl"
	slot9 = slot3
	slot6 = slot6(slot7, slot8, slot9)
	slot8 = slot0
	slot7 = slot0.findTF
	slot9 = "bg/frame/content/award_panel/Text"
	slot10 = slot0.awardPanel
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = setText
	slot9 = slot7
	slot10 = i18n
	slot11 = "exercise_award_tip"

	slot8(slot9, slot10(slot11))

	function slot8(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-22, warpins: 1 ---
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.findTF
		slot4 = "awards"
		slot5 = slot0
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = slot0
		slot3 = slot3.rankCfg
		slot3 = slot3[slot1]
		slot4 = setText
		slot5 = findTF
		slot6 = slot0
		slot7 = "Text"
		slot5 = slot5(slot6, slot7)
		slot6 = slot3.name
		slot7 = ":"
		slot6 = slot6 .. slot7

		slot4(slot5, slot6)

		slot4 = ipairs
		slot5 = slot3.award_list
		slot4, slot5, slot6 = slot4(slot5)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-48, warpins: 0 ---
		for slot7, slot8 in slot4, slot5, slot6 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-46, warpins: 1 ---
			slot9 = cloneTplTo
			slot10 = slot1
			slot11 = slot2
			slot9 = slot9(slot10, slot11)
			slot10 = updateDrop
			slot11 = slot9
			slot12 = {}
			slot13 = slot8[1]
			slot12.type = slot13
			slot13 = slot8[2]
			slot12.id = slot13
			slot13 = slot8[3]
			slot12.count = slot13

			slot10(slot11, slot12)

			slot10 = onButton
			slot11 = slot0
			slot13 = slot9
			slot12 = slot9.Find
			slot14 = "icon_bg"
			slot12 = slot12(slot13, slot14)

			function slot13()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = BaseUI
				slot2 = slot2.ON_ITEM
				slot3 = slot1
				slot3 = slot3[1]

				if slot3 == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-15, warpins: 1 ---
					slot3 = id2ItemId
					slot4 = slot1
					slot4 = slot4[2]
					slot3 = slot3(slot4)

					if not slot3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-17, warpins: 2 ---
						slot3 = slot1
						slot3 = slot3[2]
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-19, warpins: 2 ---
				slot0(slot1, slot2, slot3)

				return
				--- END OF BLOCK #1 ---



			end

			slot14 = SFX_PANEL

			slot10(slot11, slot12, slot13, slot14)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 47-48, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 49-64, warpins: 1 ---
		slot4 = setText
		slot5 = findTF
		slot6 = slot0
		slot7 = "upgrade_score_tip/level"
		slot5 = slot5(slot6, slot7)
		slot6 = slot3.point

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = findTF
		slot6 = slot0
		slot7 = "upgrade_rank_tip/level"
		slot5 = slot5(slot6, slot7)
		slot6 = slot3.order
		slot7 = 0

		if slot6 > slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-67, warpins: 1 ---
			slot6 = slot3.order

			if not slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-68, warpins: 2 ---
				slot6 = "-"
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 69-70, warpins: 2 ---
		slot4(slot5, slot6)

		return
		--- END OF BLOCK #3 ---



	end

	slot9 = slot0.rankCfg
	slot9 = slot9.all
	slot9 = #slot9
	slot10 = 1
	slot11 = -1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 90-111, warpins: 0 ---
	for slot12 = slot9, slot10, slot11 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-99, warpins: 2 ---
		slot13 = slot0.rankCfg
		slot13 = slot13.all
		slot13 = slot13[slot12]
		slot14 = slot0.rankCfg
		slot14 = slot14[slot13]
		slot14 = slot14.award_list
		slot14 = #slot14
		slot15 = 0

		if slot14 > slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 100-110, warpins: 1 ---
			slot14 = slot8
			slot15 = cloneTplTo
			slot16 = slot4
			slot17 = slot3
			slot15 = slot15(slot16, slot17)
			slot16 = slot13

			slot14(slot15, slot16)

			slot14 = cloneTplTo
			slot15 = slot6
			slot16 = slot3

			slot14(slot15, slot16)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 111-111, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 112-113, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.initAwards = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.isOpenAwards

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-18, warpins: 1 ---
		slot1 = setActive
		slot2 = slot0.awardPanel
		slot3 = false

		slot1(slot2, slot3)

		slot1 = false
		slot0.isOpenAwards = slot1
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.UnblurPanel
		slot3 = slot0.awardPanel
		slot4 = slot0._tf

		slot1(slot2, slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.closeAwards = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.isOpenAwards

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot2 = slot0
		slot1 = slot0.closeAwards

		slot1(slot2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		slot1 = playSoundEffect
		slot2 = SFX_CANCEL

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.emit
		slot3 = slot0
		slot3 = slot3.ON_BACK

		slot1(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.onBackPressed = slot1

function slot1(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.tweens

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot1 = cancelTweens
		slot2 = slot0.tweens

		slot1(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	slot1 = slot0.leftTimeTimer

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot1 = slot0.leftTimeTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.leftTimeTimer = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-18, warpins: 2 ---
	slot1 = slot0.recoverTimer

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-24, warpins: 1 ---
		slot1 = slot0.recoverTimer
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.recoverTimer = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-30, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.closeAwards

	slot1(slot2)

	slot1 = slot0.resPanel

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-36, warpins: 1 ---
		slot1 = slot0.resPanel
		slot2 = slot1
		slot1 = slot1.exit

		slot1(slot2)

		slot1 = nil
		slot0.resPanel = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-37, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.willExit = slot1

return slot0
