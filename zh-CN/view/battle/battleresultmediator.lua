slot0 = class("BattleResultMediator", import("..base.ContextMediator"))
slot0.ON_BACK_TO_LEVEL_SCENE = "BattleResultMediator.ON_BACK_TO_LEVEL_SCENE"
slot0.ON_BACK_TO_DUEL_SCENE = "BattleResultMediator.ON_BACK_TO_DUEL_SCENE"
slot0.ON_GO_TO_TASK_SCENE = "BattleResultMediator.ON_GO_TO_TASK_SCENE"
slot0.GET_NEW_SHIP = "BattleResultMediator.GET_NEW_SHIP"
slot0.ON_GO_TO_MAIN_SCENE = "BattleResultMediator.ON_GO_TO_MAIN_SCENE"
slot0.ON_NEXT_CHALLENGE = "BattleResultMediator.ON_NEXT_CHALLENGE"
slot0.ON_CHALLENGE_RANK = "BattleResultMediator:ON_CHALLENGE_RANK"
slot0.ON_CHALLENGE_SHARE = "BattleResultMediator:ON_CHALLENGE_SHARE"
slot0.ON_CHALLENGE_DEFEAT_SCENE = "BattleResultMediator:ON_CHALLENGE_DEFEAT_SCENE"

function slot0.register(slot0)
	if ys.Battle.BattleState.IsAutoBotActive() and PlayerPrefs.GetInt(AUTO_BATTLE_LABEL, 0) > 0 then
		playSoundEffect(SFX_AUTO_BATTLE)
		LuaHelper.Vibrate()
	end

	slot5 = getProxy(FleetProxy)
	slot6 = getProxy(BayProxy)
	slot7 = getProxy(ChapterProxy)
	slot8 = getProxy(ActivityProxy)

	if slot0.contextData.system == SYSTEM_DUEL then
		slot10 = getProxy(MilitaryExerciseProxy)

		slot0.viewComponent:setRivalVO(slot10:getPreRivalById(slot0.contextData.rivalId))
		slot0.viewComponent:setRank(getProxy(PlayerProxy):getData(), slot10:getSeasonInfo())
	elseif slot9 == SYSTEM_CHALLENGE then
		slot10 = getProxy(ChallengeProxy)

		slot0.viewComponent:setChallengeInfo(slot10:getUserChallengeInfo(slot0.contextData.mode), slot10:userSeaonExpire(slot0.contextData.mode))
	else
		if slot9 == SYSTEM_SCENARIO or slot9 == SYSTEM_ROUTINE or slot9 == SYSTEM_ACT_BOSS or slot9 == SYSTEM_HP_SHARE_ACT_BOSS or slot9 == SYSTEM_SUB_ROUTINE then
			slot0.viewComponent:setExpBuff(slot8:getBuffList()[1], slot8:getBuffShipList())
		end

		slot0.viewComponent:setPlayer(slot4)
	end

	slot10 = nil

	if slot9 == SYSTEM_SCENARIO or slot9 == SYSTEM_SHAM then
		slot10 = {}
		slot11 = nil

		if slot9 == SYSTEM_SCENARIO then
			slot11 = slot7:getActiveChapter()
		elseif slot9 == SYSTEM_SHAM then
			slot11 = slot7:getShamChapter()
		end

		slot14 = slot11.fleet[TeamType.Vanguard]

		for slot18, slot19 in ipairs(slot12[TeamType.Main]) do
			table.insert(slot10, slot19)
		end

		for slot18, slot19 in ipairs(slot14) do
			table.insert(slot10, slot19)
		end

		if _.detect(slot11.fleets, function (slot0)
			return slot0:getFleetType() == FleetType.Submarine
		end) then
			for slot20, slot21 in ipairs(slot15:getShipsByTeam(TeamType.Submarine, true)) do
				table.insert(slot10, slot21)
			end
		end
	elseif slot9 == SYSTEM_WORLD then
		slot16 = getProxy(WorldProxy):GetWorld():GetActiveMap():GetFleet():GetTeamShipVOs(TeamType.Vanguard, true)

		for slot20, slot21 in ipairs(slot14:GetTeamShipVOs(TeamType.Main, true)) do
			table.insert({}, slot21)
		end

		for slot20, slot21 in ipairs(slot16) do
			table.insert(slot10, slot21)
		end

		if slot13:GetSubmarineFleet() then
			for slot22, slot23 in ipairs(slot17:GetTeamShipVOs(TeamType.Submarine, true)) do
				table.insert(slot10, slot23)
			end
		end
	elseif slot9 == SYSTEM_CHALLENGE then
		slot0:bind(uv0.ON_CHALLENGE_SHARE, function (slot0)
			uv0:addSubLayers(Context.New({
				mediator = ChallengeShareMediator,
				viewComponent = ChallengeShareLayer,
				data = {
					mode = uv0.contextData.mode
				}
			}))
		end)
		slot0:bind(uv0.ON_CHALLENGE_DEFEAT_SCENE, function (slot0, slot1)
			uv0:addSubLayers(Context.New({
				mediator = ChallengePassedMediator,
				viewComponent = ChallengePassedLayer,
				data = {
					mode = uv0.contextData.mode
				},
				onRemoved = slot1.callback
			}))
		end)
	elseif slot9 == SYSTEM_DODGEM then
		-- Nothing
	elseif slot9 == SYSTEM_SUBMARINE_RUN then
		-- Nothing
	elseif slot9 == SYSTEM_HP_SHARE_ACT_BOSS or slot9 == SYSTEM_ACT_BOSS or slot9 == SYSTEM_BOSS_EXPERIMENT then
		if slot9 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot0.viewComponent:setActId(slot0.contextData.actId)
		end

		for slot19, slot20 in ipairs(slot6:getShipsByFleet(slot12[slot0.contextData.mainFleetId + 10])) do
			table.insert(slot6:getShipsByFleet(slot5:getActivityFleets()[slot11][slot0.contextData.mainFleetId]), slot20)
		end
	else
		slot10 = slot6:getShipsByFleet(slot5:getFleetById(slot0.contextData.mainFleetId))
	end

	slot0.viewComponent:setShips(slot10)
	slot0:bind(uv0.ON_BACK_TO_LEVEL_SCENE, function (slot0, slot1)
		if uv0 == SYSTEM_ACT_BOSS then
			slot3, slot4 = getProxy(ContextProxy):getContextByMediator(PreCombatMediator)

			if slot3 then
				slot4:removeChild(slot3)
			end
		elseif uv0 == SYSTEM_ROUTINE or uv0 == SYSTEM_SUB_ROUTINE then
			if slot2:getContextByMediator(DailyLevelMediator) then
				slot3:removeChild(slot3:getContextByMediator(PreCombatMediator))
			end
		elseif uv0 == SYSTEM_SCENARIO then
			slot3 = slot2:getContextByMediator(LevelMediator2)

			if slot3:getContextByMediator(ChapterPreCombatMediator) then
				slot3:removeChild(slot4)
			end

			if uv1.contextData.score > 1 then
				uv1:showExtraChapterActSocre()
			end

			slot5 = getProxy(ChapterProxy)

			if slot5:getActiveChapter() then
				if slot6:existOni() then
					slot6:clearSubmarineFleet()
					slot5:updateChapter(slot6)
				elseif slot6:isPlayingWithBombEnemy() then
					slot6.fleets = {
						slot6.fleet
					}
					slot6.findex = 1

					slot5:updateChapter(slot6)
				end
			end
		elseif uv0 == SYSTEM_SHAM then
			slot3 = slot2:getContextByMediator(LevelMediator2)

			slot3:removeChild(slot3:getContextByMediator(ShamPreCombatMediator))
		elseif uv0 == SYSTEM_CHALLENGE then
			slot5 = getProxy(ChallengeProxy):getUserChallengeInfo(uv1.contextData.mode)

			if uv1.contextData.score < ys.Battle.BattleConst.BattleScore.S then
				uv1:sendNotification(GAME.CHALLENGE2_RESET, {
					mode = slot4
				})
			else
				slot5:updateLevelForward()

				if slot5:getMode() == ChallengeProxy.MODE_INFINITE and slot5:IsFinish() then
					slot5:setInfiniteDungeonIDListByLevel()
				end
			end

			if not slot3:userSeaonExpire(slot5:getMode()) then
				slot3:getChallengeInfo():checkRecord(slot5)
			end

			if not slot1.goToNext and slot2:getContextByMediator(ChallengeMainMediator) then
				slot7:removeChild(slot7:getContextByMediator(ChallengePreCombatMediator))
			end
		elseif uv0 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot3, slot4 = slot2:getContextByMediator(PreCombatMediator)

			if slot3 then
				slot4:removeChild(slot3)
			end
		elseif slot2:getContextByMediator(LevelMediator2) then
			slot3:removeChild(slot3:getContextByMediator(PreCombatMediator))
		end

		uv1:sendNotification(GAME.GO_BACK)
	end)
	slot0:bind(uv0.ON_GO_TO_MAIN_SCENE, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI)
	end)
	slot0:bind(uv0.ON_GO_TO_TASK_SCENE, function (slot0)
		if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
			slot2:removeChild(slot2:getContextByMediator(PreCombatMediator))
		end

		slot1:getCurrentContext().ignoreBack = true

		uv0:sendNotification(GAME.GO_SCENE, SCENE.TASK)
	end)
	slot0:bind(uv0.ON_BACK_TO_DUEL_SCENE, function (slot0)
		if getProxy(ContextProxy):getContextByMediator(MilitaryExerciseMediator) then
			slot2:removeChild(slot2:getContextByMediator(PreCombatMediator))
		end

		uv0:sendNotification(GAME.GO_BACK)
	end)
	slot0:bind(uv0.GET_NEW_SHIP, function (slot0, slot1, slot2)
		uv0:addSubLayers(Context.New({
			mediator = NewShipMediator,
			viewComponent = NewShipLayer,
			data = {
				ship = slot1
			},
			onRemoved = slot2
		}))
	end)
end

function slot0.showExtraChapterActSocre(slot0)
	slot1 = getProxy(ActivityProxy)

	if slot1:getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK) and not slot2:isEnd() then
		if getProxy(ChapterProxy):getActiveChapter() then
			slot6 = slot0.contextData.stageId

			if Map.New({
				id = slot4:getConfig("map")
			}):isActExtra() and slot2:getConfig("config_data")[1] == slot6 then
				slot10, slot11 = ActivityLevelConst.getExtraChapterSocre(slot6, math.floor(slot0.contextData.statistics._totalTime), ActivityLevelConst.getShipsPower(slot0.contextData.prefabFleet or slot0.contextData.oldMainShips), slot2)
				slot12 = slot11 < slot10 and i18n("extra_chapter_record_updated") or i18n("extra_chapter_record_not_updated")

				if slot11 < slot10 then
					slot2.data1 = slot10

					slot1:updateActivity(slot2)

					slot11 = slot10
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					content = i18n("extra_chapter_socre_tip", slot10, slot11, slot12)
				})
			end
		end
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.BEGIN_STAGE_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot1:getBody())
	end
end

function slot0.GetResultView(slot0)
	uv0.RESULT_VIEW_TRANSFORM = uv0.RESULT_VIEW_TRANSFORM or {
		[SYSTEM_CHALLENGE] = BattleChallengeResultLayer,
		[SYSTEM_DODGEM] = BattleDodgemResultLayer,
		[SYSTEM_SUBMARINE_RUN] = BattleSubmarineRunResultLayer,
		[SYSTEM_SUB_ROUTINE] = BattleSubmarineRoutineResultLayer,
		[SYSTEM_HP_SHARE_ACT_BOSS] = BattleContributionResultLayer,
		[SYSTEM_BOSS_EXPERIMENT] = BattleExperimentResultLayer
	}

	return uv0.RESULT_VIEW_TRANSFORM[slot0] or BattleResultLayer
end

return slot0
