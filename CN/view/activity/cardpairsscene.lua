slot0 = class("CardPairsScene", import("..base.BaseUI"))
slot0.CARD_NUM = 18
slot0.GAME_STATE_BEGIN = 0
slot0.GAME_STATE_GAMING = 1
slot0.GAME_STATE_END = 2
slot0.config_init = false

function slot0.getUIName(slot0)
	return "CardPairsUI"
end

function slot0.setPlayerData(slot0, slot1)
	slot0.playerData = slot1
end

function slot0.setActivityData(slot0, slot1)
	slot0.activityData = slot1

	if not slot0.config_init then
		if slot0.activityData:getConfig("config_client")[2] then
			slot0.firstShowingTime = slot2.firstShowingTime
			slot0.showingTime = slot2.showingTime
			slot0.aniTime = slot2.aniTime
			slot0.cardEffectTimesMax = slot0.activityData:getConfig("config_data")[4]
		else
			slot0.firstShowingTime = 2
			slot0.showingTime = 0.3
			slot0.aniTime = 0.2
			slot0.cardEffectTimesMax = 7
		end

		CardPairsCard.ANI_TIME = slot0.aniTime
		slot0.config_init = true
	end

	slot0:updateTimes()

	if slot0.activityData.data4 <= 0 then
		setText(slot0.bestTxt, "--'--'--")
	else
		setText(slot0.bestTxt, slot0:getTimeFormat(slot0.activityData.data4))
	end
end

function slot0.checkActivityEnd(slot0)
	return
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("top/back", slot0._tf)
	slot0.cardTpl = slot0:findTF("res/card", slot0._tf)
	slot0.cardCon = slot0:findTF("card_con/layout", slot0._tf)
	slot0.pics = slot0:findTF("res/pics", slot0._tf)
	slot0.helpBtn = slot0:findTF("top/help_btn", slot0._tf)
	slot0.timesTxt = slot0:findTF("num_txt", slot0._tf)
	slot0.timeTxt = slot0:findTF("time_txt", slot0._tf)
	slot0.bestTxt = slot0:findTF("best_txt", slot0._tf)
	slot0.maskBtn = slot0:findTF("mask_btn", slot0._tf)
	slot0.endTips = slot0:findTF("end_tips", slot0._tf)

	slot0:hideChild(slot0:findTF("res", slot0._tf))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("card_pairs_help_tip")
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.maskBtn, function ()
		if slot0.lastTimes > 0 then
			slot0:gameInit()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("card_pairs_tips"),
				onYes = function ()
					slot0:gameInit()
				end
			})
		end
	end, SFX_PANEL)

	slot0.updateTimer = Timer.New(function ()
		slot0:updateTimes()
	end, 10, -1)

	slot0.updateTimer:Start()

	slot0.showCards = {}
	slot0.showingCards = {}
	slot0.cardList = {}
	slot0.cardUIList = UIItemList.New(slot0.cardCon, slot0.cardTpl)

	slot0.cardUIList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			if slot0.cardList[slot1 + 1] ~= nil then
				slot3:initCard(slot0.cardIndexList[slot1 + 1][1])
			else
				table.insert(slot0.cardList, slot1 + 1, CardPairsCard.New(slot2, slot0.pics, slot0.cardIndexList[slot1 + 1][1], function (slot0)
					if slot0.gameState == slot0.GAME_STATE_GAMING then
						if slot0.isFrist then
							slot0.isFrist = false
							slot0.beginTime = Time.realtimeSinceStartup
							slot0.countTimer = Timer.New(function ()
								slot0:setTimeTxt(math.floor((Time.realtimeSinceStartup - slot0.beginTime) * 1000))
							end, 0.12, -1)

							slot0.countTimer:Start()
						end

						if slot0.canClick and slot0.enable and #slot0.showCards < 2 then
							slot0:aniShowBack(slot0.cardState == CardPairsCard.CARD_STATE_BACK)
						end
					end
				end, function (slot0, slot1)
					if slot0.gameState == slot0.GAME_STATE_GAMING then
						slot0:setEnable(false)

						if slot1 then
							table.insert(slot0.showCards, #slot0.showCards + 1, slot0)

							if #slot0.showCards == 2 then
								slot0:setAllCardEnale(false)
							end
						end
					end
				end, function (slot0, slot1)
					if slot0.gameState == slot0.GAME_STATE_GAMING then
						if slot1 then
							slot0:setOutline(true)
							table.insert(slot0.showingCards, #slot0.showingCards + 1, slot0)

							if #slot0.showingCards % 2 == 0 then
								table.remove(slot0.showingCards, slot2)
								table.remove(slot0.showingCards, slot3)

								if slot0.showingCards[#slot0.showingCards - 1].getCardIndex(slot4) == slot0.showingCards[#slot0.showingCards]:getCardIndex() then
									slot4:setClear(true)
									slot5:setClear(true)

									slot0.curValue = slot0.curValue + 2

									if slot0.CARD_NUM <= slot0.curValue then
										slot0:gameEndHandler()
									else
										for slot9 = #slot0.showCards, 0, -1 do
											table.remove(slot0.showCards, slot9)
										end

										slot0:setAllCardEnale(true)
									end
								else
									slot4:aniShowBack(false, false, slot0.showingTime)
									slot5:aniShowBack(false, false, slot0.showingTime)
								end
							end
						else
							table.remove(slot0.showCards, #slot0.showCards)
							slot0:setAllCardEnale(#slot0.showingCards == 0)
						end
					end
				end))
			end
		end
	end)

	if not slot0:tryFirstPlayStory() then
		triggerButton(slot0.maskBtn)
	end
end

function slot0.setAllCardEnale(slot0, slot1)
	for slot5, slot6 in pairs(slot0.cardList) do
		slot6:setEnable(slot1)
	end
end

function slot0.setTimeTxt(slot0, slot1)
	setText(slot0.timeTxt, slot0:getTimeFormat(slot1))
end

function slot0.getTimeFormat(slot0, slot1)
	return ((math.floor(slot1 / 60000) >= 10 and slot2) or "0" .. slot2) .. "'" .. ((math.floor(slot1 % 60000 / 1000) >= 10 and slot3) or "0" .. slot3) .. "'" .. ((math.floor(slot1 % 1000 / 10) >= 10 and slot4) or "0" .. slot4)
end

function slot0.updateTimes(slot0)
	if math.ceil(os.difftime(pg.TimeMgr.GetInstance():GetServerTime(), slot0.activityData.data3) / 86400) < 0 then
		slot2 = 0
	end

	if slot0.cardEffectTimesMax < slot2 then
		slot0.lastTimes = (slot0.cardEffectTimesMax or slot2) - slot0.activityData.data2

		setText(slot0.timesTxt, (slot0.lastTimes >= 0 and slot0.lastTimes) or 0)

		return
	end
end

function slot0.gameInit(slot0)
	setActive(slot0.maskBtn, false)
	setActive(slot0.endTips, false)

	slot0.isFrist = true
	slot0.curValue = 0
	slot0.showCards = {}
	slot0.showingCards = {}
	slot0.cardIndexList = {}

	for slot4 = 1, slot0.CARD_NUM / 2, 1 do
		table.insert(slot0.cardIndexList, #slot0.cardIndexList + 1, {
			slot4,
			math.random(0, 100)
		})
		table.insert(slot0.cardIndexList, #slot0.cardIndexList + 1, {
			slot4,
			math.random(0, 100)
		})
	end

	table.sort(slot0.cardIndexList, function (slot0, slot1)
		if slot1[2] < slot0[2] then
			return true
		end

		return false
	end)
	slot0:setTimeTxt(0)
	slot0:clearCountTimer()
	slot0:clearAllCard()
	slot0.cardUIList:align(slot0.CARD_NUM)

	slot0.gameState = slot0.GAME_STATE_BEGIN

	slot0:checkGameState()
end

function slot0.checkGameState(slot0)
	if slot0.gameState == slot0.GAME_STATE_BEGIN then
		slot0:showAllCard()
	elseif slot0.gameState == slot0.GAME_STATE_GAMING then
	elseif slot0.gameState == slot0.GAME_STATE_END then
		slot0:clearCountTimer()
	end
end

function slot0.gameEndHandler(slot0)
	slot0.gameState = slot0.GAME_STATE_END

	slot0:checkGameState()
	setActive(slot0.maskBtn, true)

	if math.floor((Time.realtimeSinceStartup - slot0.beginTime) * 1000) < 0 then
		slot0:setTimeTxt(9 * slot0.aniTime or slot1)
	end

	if slot0.cardEffectTimesMax < ((slot0.lastTimes > 0 and slot0.activityData.data2 + 1) or slot0.activityData.data2) then
		slot2 = slot0.cardEffectTimesMax or slot2
	end

	if slot0.lastTimes > 0 or slot1 < slot0.activityData.data4 then
		slot0:emit(CardPairsMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = slot0.activityData.id,
			arg1 = slot2,
			arg2 = slot1
		})
	end

	setActive(slot0.endTips, true)
end

function slot0.showAllCard(slot0)
	slot0:setAllCardEnale(false)

	slot0.timer = Timer.New(function ()
		for slot3, slot4 in pairs(slot0.cardList) do
			slot4:aniShowBack(true)
		end

		slot0.timer = Timer.New(function ()
			for slot3, slot4 in pairs(slot0.cardList) do
				slot4:aniShowBack()
			end

			slot0.timer = Timer.New(function ()
				slot0.gameState = slot0.GAME_STATE_GAMING

				slot0:checkGameState()
				slot0.checkGameState:setAllCardEnale(true)
			end, slot0.aniTime, 1)

			slot0.timer:Start()
		end, slot0.firstShowingTime, 1)

		slot0.timer:Start()
	end, 0.5, 1)

	slot0.timer:Start()
end

function slot0.clearAllCard(slot0, slot1)
	if slot0.timer ~= nil then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	if slot1 then
		for slot5, slot6 in pairs(slot0.cardList) do
			slot6:destroy()
		end

		slot0.cardList = {}
	else
		for slot5, slot6 in pairs(slot0.cardList) do
			slot6:clear()
		end
	end
end

function slot0.hideChild(slot0, slot1)
	for slot6 = 0, slot1.childCount - 1, 1 do
		setActive(slot1:GetChild(slot6), false)
	end
end

function slot0.tryFirstPlayStory(slot0)
	if slot0.activityData:getConfig("config_client")[1] then
		if slot0.activityData:getConfig("config_client")[1][1] ~= nil and not slot0.playerData:IsPlayed(slot1) then
			pg.StoryMgr.GetInstance():Play(slot1, function ()
				triggerButton(slot0.maskBtn)
			end)

			return true
		end

		return false
	else
		return false
	end
end

function slot0.clearCountTimer(slot0)
	if slot0.countTimer ~= nil then
		slot0.countTimer:Stop()

		slot0.countTimer = nil
	end
end

function slot0.willExit(slot0)
	slot0:clearAllCard(true)
	slot0:clearCountTimer()

	if slot0.updateTimer ~= nil then
		slot0.updateTimer:Stop()

		slot0.updateTimer = nil
	end
end

return slot0
