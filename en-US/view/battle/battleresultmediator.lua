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
slot0.DIRECT_EXIT = "BattleResultMediator:DIRECT_EXIT"
slot0.OPEN_FAIL_TIP_LAYER = "BattleResultMediator:OPEN_FAIL_TIP_LAYER"

function slot0.register(slot0)
	if ys.Battle.BattleState.IsAutoBotActive() and PlayerPrefs.GetInt(AUTO_BATTLE_LABEL, 0) > 0 then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_AUTO_BATTLE)
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
			slot0.viewComponent:setExpBuff(_.detect(BuffHelper.GetBuffsByActivityType(ActivityConst.ACTIVITY_TYPE_BUFF), function (slot0)
				return slot0:getConfig("benefit_type") == "rookie_battle_exp"
			end), slot8:getBuffShipList())
		end

		slot0.viewComponent:setPlayer(slot4)
	end

	slot10 = nil

	if slot9 == SYSTEM_SCENARIO then
		slot10 = {}
		slot11 = nil

		if slot9 == SYSTEM_SCENARIO then
			slot11 = slot7:getActiveChapter()
		end

		slot12 = slot11.fleet
		slot14 = slot12[TeamType.Vanguard]

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
		slot13 = nowWorld:GetActiveMap():GetFleet()
		slot15 = slot13:GetTeamShipVOs(TeamType.Vanguard, true)

		for slot19, slot20 in ipairs(slot13:GetTeamShipVOs(TeamType.Main, true)) do
			table.insert({}, slot20)
		end

		for slot19, slot20 in ipairs(slot15) do
			table.insert(slot10, slot20)
		end

		if slot12:GetSubmarineFleet() then
			for slot21, slot22 in ipairs(slot16:GetTeamShipVOs(TeamType.Submarine, true)) do
				table.insert(slot10, slot22)
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
	elseif slot9 == SYSTEM_WORLD_BOSS then
		slot10 = getProxy(BayProxy):getShipsByFleet(nowWorld:GetBossProxy():GetFleet())

		slot0.viewComponent:setTitle(slot0.contextData.name)
	elseif slot9 == SYSTEM_DODGEM then
		-- Nothing
	elseif slot9 == SYSTEM_SUBMARINE_RUN then
		-- Nothing
	elseif slot9 == SYSTEM_REWARD_PERFORM then
		-- Nothing
	elseif slot9 == SYSTEM_AIRFIGHT then
		-- Nothing
	elseif slot9 == SYSTEM_HP_SHARE_ACT_BOSS or slot9 == SYSTEM_ACT_BOSS or slot9 == SYSTEM_BOSS_EXPERIMENT then
		slot11 = slot0.contextData.actId

		if slot9 == SYSTEM_HP_SHARE_ACT_BOSS then
			slot0.viewComponent:setActId(slot11)
		end

		slot12 = slot5:getActivityFleets()[slot11]

		for slot19, slot20 in ipairs(slot6:getShipsByFleet(slot12[slot0.contextData.mainFleetId + 10])) do
			table.insert(slot6:getShipsByFleet(slot12[slot0.contextData.mainFleetId]), slot20)
		end
	elseif slot9 == SYSTEM_GUILD then
		for slot18, slot19 in ipairs(getProxy(GuildProxy):getData():GetActiveEvent():GetBossMission():GetMainFleet():GetShips()) do
			table.insert({}, slot19.ship)
		end

		for slot19, slot20 in ipairs(slot13:GetSubFleet():GetShips()) do
			table.insert(slot10, slot20.ship)
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
			if slot2:getContextByMediator(LevelMediator2):getContextByMediator(ChapterPreCombatMediator) then
				slot3:removeChild(slot4)
			end

			if uv1.contextData.score > 1 then
				uv1:showExtraChapterActSocre()
			end

			if getProxy(ChapterProxy):getActiveChapter() then
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
		elseif uv0 == SYSTEM_WORLD_BOSS then
			if slot2:getContextByMediator(WorldBossMediator):getContextByMediator(WorldBossFormationMediator) then
				slot3:removeChild(slot4)
			end
		elseif uv0 == SYSTEM_WORLD then
			if slot2:getContextByMediator(WorldMediator):getContextByMediator(WorldPreCombatMediator) or slot3:getContextByMediator(WorldBossInformationMediator) then
				slot3:removeChild(slot4)
			end
		elseif slot2:getContextByMediator(LevelMediator2) then
			slot3:removeChild(slot3:getContextByMediator(PreCombatMediator))
		end

		uv1:sendNotification(GAME.GO_BACK)
	end)
	slot0:bind(uv0.ON_GO_TO_MAIN_SCENE, function (slot0)
		uv0:sendNotification(GAME.CHANGE_SCENE, SCENE.MAINUI)
	end)
	slot0:bind(uv0.ON_GO_TO_TASK_SCENE, function (slot0)
		if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then
			slot2:removeChild(slot2:getContextByMediator(PreCombatMediator))
		end

		uv0:sendNotification(GAME.CHANGE_SCENE, SCENE.TASK)
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
	slot0:bind(uv0.OPEN_FAIL_TIP_LAYER, function (slot0)
		setActive(uv0.viewComponent._tf, false)
		uv0:addSubLayers(Context.New({
			mediator = BattleFailTipMediator,
			viewComponent = BattleFailTipLayer,
			data = {
				mainShips = uv1,
				battleSystem = uv0.contextData.system
			},
			onRemoved = function ()
				uv0.viewComponent.failTag = nil

				triggerButton(uv0.viewComponent._confirmBtn)
			end
		}))
	end)
	slot0:bind(uv0.DIRECT_EXIT, function (slot0, slot1)
		uv0:sendNotification(GAME.GO_BACK)
	end)

	slot11 = 0

	if slot10 then
		for slot15, slot16 in ipairs(slot10) do
			slot11 = slot16:getBattleTotalExpend() + slot11
		end
	end

	print("耗时：", slot0.contextData.statistics._totalTime, "秒")
	print("编队基础油耗：", slot11)

	if slot0.contextData.statistics._enemyInfoList then
		for slot15, slot16 in pairs(slot0.contextData.statistics._enemyInfoList) do
			print("目标ID>>", slot16.id, "<< 受到伤害共 >>", slot16.damage, "<< 点")
		end
	end
end

function slot0.showExtraChapterActSocre(slot0)
	slot5 = getProxy(ChapterProxy):getActiveChapter() and slot3:getMapById(slot4:getConfig("map"))

	for slot9, slot10 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK)) do
		if slot10 and not slot10:isEnd() and slot10:getConfig("config_data")[1] == slot0.contextData.stageId and slot5 and slot5:isActExtra() then
			slot15, slot16 = ActivityLevelConst.getExtraChapterSocre(slot12, math.floor(slot0.contextData.statistics._totalTime), ActivityLevelConst.getShipsPower(slot0.contextData.prefabFleet or slot0.contextData.oldMainShips), slot10)
			slot17 = slot16 < slot15 and i18n("extra_chapter_record_updated") or i18n("extra_chapter_record_not_updated")

			if slot16 < slot15 then
				slot10.data1 = slot15

				slot1:updateActivity(slot10)

				slot16 = slot15
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("extra_chapter_socre_tip", slot15, slot16, slot17),
				weight = LayerWeightConst.SECOND_LAYER
			})
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
		slot0:sendNotification(GAME.CHANGE_SCENE, SCENE.COMBATLOAD, slot1:getBody())
	end
end

function slot0.GetResultView(slot0)
	uv0.RESULT_VIEW_TRANSFORM = uv0.RESULT_VIEW_TRANSFORM or {
		[SYSTEM_CHALLENGE] = BattleChallengeResultLayer,
		[SYSTEM_DODGEM] = BattleDodgemResultLayer,
		[SYSTEM_SUBMARINE_RUN] = BattleSubmarineRunResultLayer,
		[SYSTEM_SUB_ROUTINE] = BattleSubmarineRoutineResultLayer,
		[SYSTEM_HP_SHARE_ACT_BOSS] = BattleContributionResultLayer,
		[SYSTEM_BOSS_EXPERIMENT] = BattleExperimentResultLayer,
		[SYSTEM_ACT_BOSS] = BattleActivityBossResultLayer,
		[SYSTEM_WORLD_BOSS] = BattleWorldBossResultLayer,
		[SYSTEM_REWARD_PERFORM] = BattleRewardPerformResultLayer,
		[SYSTEM_AIRFIGHT] = BattleAirFightResultLayer,
		[SYSTEM_GUILD] = BattleGuildBossResultLayer
	}

	return uv0.RESULT_VIEW_TRANSFORM[slot0] or BattleResultLayer
end

return slot0
