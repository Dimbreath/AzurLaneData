slot0 = class("BattleMediator", import("..base.ContextMediator"))
slot0.ON_BATTLE_RESULT = "BattleMediator:ON_BATTLE_RESULT"
slot0.ON_PAUSE = "BattleMediator:ON_PAUSE"
slot0.ENTER = "BattleMediator:ENTER"
slot0.ON_BACK_PRE_SCENE = "BattleMediator:ON_BACK_PRE_SCENE"
slot0.ON_LEAVE = "BattleMediator:ON_LEAVE"
slot0.ON_CHAT = "BattleMediator:ON_CHAT"
slot0.CLOSE_CHAT = "BattleMediator:CLOSE_CHAT"
slot0.ON_AUTO = "BattleMediator:ON_AUTO"

function slot0.register(slot0)
	Screen.sleepTimeout = SleepTimeout.NeverSleep

	slot0:GenBattleData()

	slot0.contextData.battleData = slot0._battleData
	slot1 = ys.Battle.BattleState.GetInstance()
	slot2 = slot0.contextData.system

	slot0:bind(slot0.ON_BATTLE_RESULT, function (slot0, slot1)
		slot0:sendNotification(GAME.FINISH_STAGE, {
			token = slot0.contextData.token,
			mainFleetId = slot0.contextData.mainFleetId,
			stageId = slot0.contextData.stageId,
			rivalId = slot0.contextData.rivalId,
			memory = slot0.contextData.memory,
			exitCallback = slot0.contextData.exitCallback,
			system = slot1,
			statistics = slot1,
			actID = slot0.contextData.actId,
			mode = slot0.contextData.mode
		})
	end)
	slot0:bind(slot0.ON_AUTO, function (slot0, slot1)
		slot0:onAutoBtn(slot1)
	end)
	slot0:bind(slot0.ON_PAUSE, function (slot0)
		slot0:onPauseBtn()
	end)
	slot0:bind(slot0.ON_LEAVE, function (slot0)
		slot0:warnFunc()
	end)
	slot0:bind(slot0.ON_CHAT, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			data = {
				form = NotificationLayer.FORM_BATTLE,
				chatViewParent = slot1
			}
		}))
	end)
	slot0:bind(slot0.ENTER, function (slot0)
		slot0:EnterBattle(slot1._battleData, slot1.contextData.prePause)
	end)
	slot0:bind(slot0.ON_BACK_PRE_SCENE, function ()
		slot0 = getProxy(ContextProxy)
		slot2 = slot0:getContextByMediator(LevelMediator2)
		slot3 = slot0:getContextByMediator(ChallengeMainMediator)
		slot4 = slot0:getContextByMediator(ActivityBossBattleMediator3)

		if slot0:getContextByMediator(DailyLevelMediator) then
			slot1:removeChild(slot1:getContextByMediator(PreCombatMediator))
		elseif slot3 then
			slot0:sendNotification(GAME.CHALLENGE2_RESET, {
				mode = slot0.contextData.mode
			})
			slot3:removeChild(slot3:getContextByMediator(ChallengePreCombatMediator))
		elseif slot2 then
			if slot1 == SYSTEM_DUEL then
			elseif slot1 == SYSTEM_SHAM then
				slot2:removeChild(slot2:getContextByMediator(ShamPreCombatMediator))
			elseif slot1 == SYSTEM_GUILD then
				if slot2:getContextByMediator(GuildPreCombatMediator) then
					slot2:removeChild(slot5)
				end
			elseif slot1 == SYSTEM_SCENARIO then
				if slot2:getContextByMediator(ChapterPreCombatMediator) then
					slot2:removeChild(slot5)
				end
			elseif slot1 ~= SYSTEM_PERFORM and slot1 ~= SYSTEM_SIMULATION then
				slot2:removeChild(slot2:getContextByMediator(PreCombatMediator))
			end
		elseif slot4 and slot4:getContextByMediator(PreCombatMediator) then
			slot4:removeChild(slot5)
		end

		slot0:sendNotification(GAME.GO_BACK)
	end)

	if getProxy(PlayerProxy) then
		slot0.player = slot3:getData()

		slot3:setFlag("battle", true)
	end
end

function slot0.onAutoBtn(slot0, slot1)
	slot0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = slot1.isOn,
		toggle = slot1.toggle
	})
end

function slot0.onPauseBtn(slot0)
	slot1 = ys.Battle.BattleState.GetInstance()

	if slot0.contextData.system == SYSTEM_PROLOGUE or slot0.contextData.system == SYSTEM_PERFORM then
		slot2 = {}

		if EPILOGUE_SKIPPABLE then
			table.insert(slot2, 1, {
				text = "关爱胡德",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = function ()
					slot0:Deactive()
					slot0:sendNotification(GAME.GO_SCENE, SCENE.CREATE_PLAYER)
				end
			})
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_rule"),
			onClose = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = slot2
		})
		slot1:Pause()
	elseif slot0.contextData.system == SYSTEM_DODGEM then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_warspite"),
			onClose = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				{
					text = "text_cancel_fight",
					btnType = pg.MsgboxMgr.BUTTON_RED,
					onCallback = function ()
						slot0:warnFunc(function ()
							ys.Battle.BattleState.GetInstance():Resume()
						end)
					end
				}
			}
		})
		slot1:Pause()
	elseif slot0.contextData.system == SYSTEM_SIMULATION then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_rule"),
			onClose = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function ()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				{
					text = "text_cancel_fight",
					btnType = pg.MsgboxMgr.BUTTON_RED,
					onCallback = function ()
						slot0:warnFunc(function ()
							ys.Battle.BattleState.GetInstance():Resume()
						end)
					end
				}
			}
		})
		slot1:Pause()
	elseif slot0.contextData.system == SYSTEM_SUBMARINE_RUN or slot0.contextData.system == SYSTEM_SUB_ROUTINE then
		slot1:Pause()
		slot0:warnFunc(function ()
			ys.Battle.BattleState.GetInstance():Resume()
		end)
	else
		slot0.viewComponent:updatePauseWindow()
		slot1:Pause()
	end
end

function slot0.warnFunc(slot0, slot1)
	slot2 = ys.Battle.BattleState.GetInstance()
	slot4, slot5 = nil

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		hideYes = true,
		hideNo = true,
		content = (slot0.contextData.system ~= SYSTEM_CHALLENGE or i18n("battle_battleMediator_clear_warning")) and (slot3 ~= SYSTEM_SIMULATION or i18n("tech_simulate_quit")) and i18n("battle_battleMediator_quest_exist"),
		onClose = slot1,
		custom = {
			{
				text = "text_cancel",
				onCallback = slot1,
				sound = SFX_CANCEL
			},
			{
				text = "text_exit",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = function ()
					slot0:Stop()
				end,
				sound = SFX_CONFIRM
			}
		}
	})
end

function slot0.guideDispatch(slot0)
	return
end

function slot1(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8, slot9 in ipairs(slot1:getActiveEquipments()) do
		if slot9 then
			slot4[#slot4 + 1] = {
				id = slot9.configId,
				skin = slot9.skinId,
				equipmentInfo = slot9
			}
		else
			slot4[#slot4 + 1] = {
				skin = 0,
				id = slot9,
				equipmentInfo = slot9
			}
		end
	end

	slot5 = ys.Battle.BattleDataFunction.GenerateHiddenBuff(slot1.configId)

	for slot9, slot10 in pairs(slot1.skills) do
		slot5[({
			level = slot10.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(slot0, slot10.id)
		})["id"]] = 
	end

	for slot9, slot10 in pairs(slot1:getTriggerSkills()) do
		slot5[({
			level = slot10.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(slot0, slot10.id)
		})["id"]] = 
	end

	return {
		id = slot1.id,
		tmpID = slot1.configId,
		skinId = slot1.skinId,
		level = slot1.level,
		equipment = slot4,
		properties = slot1:getProperties(slot2, slot3),
		proficiency = slot1:getEquipProficiencyList(),
		rarity = slot1:getRarity(),
		shipGS = slot1:getShipCombatPower(),
		skills = slot5,
		baseList = slot1:getBaseList(),
		preloasList = slot1:getPreLoadCount(),
		name = slot1:getName()
	}
end

function slot0.GenBattleData(slot0)
	slot0._battleData = {
		battleType = slot0.contextData.system,
		StageTmpId = slot0.contextData.stageId,
		MainUnitList = {},
		VanguardUnitList = {},
		SubUnitList = {},
		SubFlag = -1,
		ActID = slot0.contextData.actId
	}

	if pg.battle_cost_template[slot0.contextData.system].global_buff_effected > 0 then
		_.each(getProxy(PlayerProxy):getData().getBuffByType(slot4, ys.Battle.BattleConst.BATTLE_GLOBAL_BUFF), function (slot0)
			table.insert(slot0, pg.benefit_buff_template[slot0.id].benefit_effect)
		end)

		slot1.GlobalBuffIDs = {} or {}
	end

	slot3 = getProxy(BayProxy)
	slot4 = {}

	if slot2 == SYSTEM_SCENARIO or slot2 == SYSTEM_SHAM or slot2 == SYSTEM_GUILD then
		slot5 = getProxy(ChapterProxy)
		slot6 = nil

		if slot2 == SYSTEM_SCENARIO then
			slot1.RepressInfo = slot5:getActiveChapter():getRepressInfo()
		elseif slot2 == SYSTEM_SHAM then
			slot6 = slot5:getShamChapter()
		elseif slot2 == SYSTEM_GUILD then
			slot6 = slot5:getGuildChapter()
		end

		slot0.viewComponent:setChapter(slot6)

		slot1.KizunaJamming = slot6.extraFlagList
		slot1.DefeatCount = slot6.fleet.getDefeatCount(slot7)
		slot1.ChapterBuffIDs, slot1.CommanderList = slot6:getFleetBattleBuffs(slot7)
		slot8 = _.values(slot6.fleet.getCommanders(slot7))
		slot9 = {}
		slot10 = slot6.fleet.getShipsByTeam(slot7, TeamType.Main, false)
		slot11 = slot6.fleet.getShipsByTeam(slot7, TeamType.Vanguard, false)
		slot12 = {}
		slot13, slot14 = slot5.getSubAidFlag(slot6)

		if slot13 == true or slot13 > 0 then
			slot1.SubFlag = 1
			slot1.TotalSubAmmo = 1
			slot12 = slot14:getShipsByTeam(TeamType.Submarine, false)
			slot9 = _.values(slot14:getCommanders())
			slot15, slot1.SubCommanderList = slot6:getFleetBattleBuffs(slot14)
		else
			slot1.SubFlag = slot13

			if slot13 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				slot1.TotalSubAmmo = 0
			end
		end

		slot0.mainShips = {}

		function slot15(slot0, slot1, slot2)
			slot4 = slot0.hpRant * 0.0001

			if table.contains(slot0, slot0.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot0[#slot0 + 1] = slot3
			slot1(slot2, slot0, slot1).initHPRate = slot4

			table.insert(slot3.mainShips, slot0)
			table.insert(slot2, slot1(slot2, slot0, slot1))
		end

		for slot19, slot20 in ipairs(slot10) do
			slot15(slot20, slot8, slot1.MainUnitList)
		end

		for slot19, slot20 in ipairs(slot11) do
			slot15(slot20, slot8, slot1.VanguardUnitList)
		end

		for slot19, slot20 in ipairs(slot12) do
			slot15(slot20, slot9, slot1.SubUnitList)
		end

		slot0.viewComponent:setFleet(slot10, slot11, slot12)
	elseif slot2 == SYSTEM_CHALLENGE then
		slot7 = getProxy(ChallengeProxy).getUserChallengeInfo(slot6, slot5)
		slot1.ChallengeInfo = slot7

		slot0.viewComponent:setChapter(slot7)

		slot8 = slot7:getRegularFleet()
		slot1.CommanderList = slot8:buildBattleBuffList()
		slot9 = _.values(slot8:getCommanders())
		slot10 = {}
		slot11 = slot8:getShipsByTeam(TeamType.Main, false)
		slot12 = slot8:getShipsByTeam(TeamType.Vanguard, false)
		slot13 = {}

		if #slot7:getSubmarineFleet().getShipsByTeam(slot14, TeamType.Submarine, false) > 0 then
			slot1.SubFlag = 1
			slot1.TotalSubAmmo = 1
			slot10 = _.values(slot14:getCommanders())
			slot1.SubCommanderList = slot14:buildBattleBuffList()
		else
			slot1.SubFlag = 0

			if flag ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				slot1.TotalSubAmmo = 0
			end
		end

		slot0.mainShips = {}

		function slot15(slot0, slot1, slot2)
			slot4 = slot0.hpRant * 0.0001

			if table.contains(slot0, slot0.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot0[#slot0 + 1] = slot3
			slot1(slot2, slot0, slot1).initHPRate = slot4

			table.insert(slot3.mainShips, slot0)
			table.insert(slot2, slot1(slot2, slot0, slot1))
		end

		for slot19, slot20 in ipairs(slot11) do
			slot15(slot20, slot9, slot1.MainUnitList)
		end

		for slot19, slot20 in ipairs(slot12) do
			slot15(slot20, slot9, slot1.VanguardUnitList)
		end

		for slot19, slot20 in ipairs(slot13) do
			slot15(slot20, slot10, slot1.SubUnitList)
		end

		slot0.viewComponent:setFleet(slot11, slot12, slot13)
	elseif slot2 == SYSTEM_WORLD then
		slot6 = getProxy(WorldProxy).GetWorld(slot5)
		slot7 = slot6:GetActiveMap()
		slot8 = slot7:GetFleet()
		slot1.AffixBuffList = slot7:GetCell(slot8.row, slot8.column).GetStageEnemy(slot9).GetBattleBuffList(slot10)
		slot11 = slot8:GetTeamShipVOs(TeamType.Main, false)
		slot12 = slot8:GetTeamShipVOs(TeamType.Vanguard, false)
		slot13 = {}

		if slot6:IsSubmarineSupporting() then
			if slot7:GetSubmarineFleet().GetAmmo(slot14) <= 0 then
				slot1.SubFlag = ys.Battle.BattleConst.SubAidFlag.AMMO_EMPTY
				slot1.TotalSubAmmo = 0
			else
				slot1.SubFlag = 1
				slot1.TotalSubAmmo = 1
				slot13 = slot14:GetTeamShipVOs(TeamType.Submarine, false)
			end
		else
			slot1.SubFlag = ys.Battle.BattleConst.SubAidFlag.AID_EMPTY
		end

		slot0.mainShips = {}

		for slot17, slot18 in ipairs(slot11) do
			slot20 = slot18.bindingData.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot0(slot2, slot18).initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.MainUnitList, slot0(slot2, slot18))
		end

		for slot17, slot18 in ipairs(slot12) do
			slot20 = slot18.bindingData.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot0(slot2, slot18).initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.VanguardUnitList, slot0(slot2, slot18))
		end

		for slot17, slot18 in ipairs(slot13) do
			slot20 = slot18.bindingData.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot0(slot2, slot18).initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.SubUnitList, slot0(slot2, slot18))
		end

		slot0.viewComponent:setFleet(slot11, slot12, slot13)
	elseif slot2 == SYSTEM_HP_SHARE_ACT_BOSS or slot2 == SYSTEM_ACT_BOSS or slot2 == SYSTEM_BOSS_EXPERIMENT then
		if slot0.contextData.mainFleetId then
			slot8 = _.values(getProxy(FleetProxy).getActivityFleets(slot5)[slot0.contextData.actId][slot0.contextData.mainFleetId].getCommanders(slot7))
			slot1.CommanderList = getProxy(FleetProxy).getActivityFleets(slot5)[slot0.contextData.actId][slot0.contextData.mainFleetId].buildBattleBuffList(slot7)
			slot0.mainShips = {}
			slot9 = {}
			slot10 = {}
			slot11 = {}

			function slot12(slot0, slot1, slot2, slot3)
				if table.contains(slot0, slot0) then
					BattleVertify.cloneShipVertiry = true
				end

				slot0[#slot0 + 1] = slot0
				slot4 = slot1:getShipById(slot0)

				table.insert(slot4.mainShips, slot4)
				table.insert(slot3, slot4)
				table.insert(slot2, slot2(slot3, slot4, slot1))
			end

			slot14 = getProxy(FleetProxy).getActivityFleets(slot5)[slot0.contextData.actId][slot0.contextData.mainFleetId].getTeamByName(slot7, TeamType.Vanguard)

			for slot18, slot19 in ipairs(slot13) do
				slot12(slot19, slot8, slot1.MainUnitList, slot9)
			end

			for slot18, slot19 in ipairs(slot14) do
				slot12(slot19, slot8, slot1.VanguardUnitList, slot10)
			end

			slot16 = _.values(slot6[slot0.contextData.mainFleetId + 10].getCommanders(slot15))

			for slot21, slot22 in ipairs(slot17) do
				slot12(slot22, slot16, slot1.SubUnitList, slot11)
			end

			slot19 = getProxy(PlayerProxy).getRawData(slot18)
			slot20 = slot15:GetCostSum().oil + slot7:GetCostSum().oil

			if slot15:isLegalToFight() == true and (slot2 == SYSTEM_BOSS_EXPERIMENT or slot20 < slot19.oil) then
				slot1.SubFlag = 1
				slot1.TotalSubAmmo = 1
			end

			slot1.SubCommanderList = slot15:buildBattleBuffList()

			slot0.viewComponent:setFleet(slot9, slot10, slot11)
		end
	elseif slot0.contextData.mainFleetId then
		slot5 = slot2 == SYSTEM_DUEL
		slot0.mainShips = slot3:getShipsByFleet(nil)

		slot12(slot13, slot9, slot1.MainUnitList)
		slot12(slot14, slot10, slot1.VanguardUnitList)
		slot12(slot15, slot11, slot1.SubUnitList)
		slot0.viewComponent:setFleet({}, {}, {})
	end

	slot1.RivalVanguardUnitList = {}
	slot1.RivalMainUnitList = {}
	slot5 = nil

	if slot2 == SYSTEM_SHAM then
		slot7 = getProxy(ChapterProxy).getShamChapter(slot6)
		slot5 = slot7:getChapterCell(slot7.fleet.line.row, slot7.fleet.line.column).rival
	elseif slot2 == SYSTEM_DUEL and slot0.contextData.rivalId then
		slot6 = getProxy(MilitaryExerciseProxy)
		slot5 = slot6:getRivalById(slot0.contextData.rivalId)
		slot0.oldRank = slot6:getSeasonInfo()
	end

	if slot5 then
		slot1.RivalVO = slot5
		slot6 = 0

		for slot10, slot11 in ipairs(slot5.mainShips) do
			slot6 = slot6 + slot11.level
		end

		for slot10, slot11 in ipairs(slot5.vanguardShips) do
			slot6 = slot6 + slot11.level
		end

		BattleVertify.rivalLevel = slot6

		for slot10, slot11 in ipairs(slot5.mainShips) do
			if not slot11.hpRant or slot11.hpRant > 0 then
				slot12 = slot0(slot2, slot11, nil, true)

				if slot11.hpRant then
					slot12.initHPRate = slot11.hpRant * 0.0001
				end

				table.insert(slot1.RivalMainUnitList, slot12)
			end
		end

		for slot10, slot11 in ipairs(slot5.vanguardShips) do
			if not slot11.hpRant or slot11.hpRant > 0 then
				slot12 = slot0(slot2, slot11, nil, true)

				if slot11.hpRant then
					slot12.initHPRate = slot11.hpRant * 0.0001
				end

				table.insert(slot1.RivalVanguardUnitList, slot12)
			end
		end
	end

	slot7 = slot0.contextData.prefabFleet.vanguard_unitList
	slot8 = slot0.contextData.prefabFleet.submarine_unitList

	if slot0.contextData.prefabFleet.main_unitList then
		for slot12, slot13 in ipairs(slot6) do
			slot14 = {}

			for slot18, slot19 in ipairs(slot13.equipment) do
				slot14[#slot14 + 1] = {
					skin = 0,
					id = slot19
				}
			end

			table.insert(slot1.MainUnitList, {
				id = slot13.id,
				tmpID = slot13.configId,
				skinId = slot13.skinId,
				level = slot13.level,
				equipment = slot14,
				properties = slot13.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = slot13.skills
			})
		end
	end

	if slot7 then
		for slot12, slot13 in ipairs(slot7) do
			slot14 = {}

			for slot18, slot19 in ipairs(slot13.equipment) do
				slot14[#slot14 + 1] = {
					skin = 0,
					id = slot19
				}
			end

			table.insert(slot1.VanguardUnitList, {
				id = slot13.id,
				tmpID = slot13.configId,
				skinId = slot13.skinId,
				level = slot13.level,
				equipment = slot14,
				properties = slot13.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = slot13.skills
			})
		end
	end

	if slot8 then
		for slot12, slot13 in ipairs(slot8) do
			slot14 = {}

			for slot18, slot19 in ipairs(slot13.equipment) do
				slot14[#slot14 + 1] = {
					skin = 0,
					id = slot19
				}
			end

			table.insert(slot1.SubUnitList, {
				id = slot13.id,
				tmpID = slot13.configId,
				skinId = slot13.skinId,
				level = slot13.level,
				equipment = slot14,
				properties = slot13.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = slot13.skills
			})

			if slot2 == SYSTEM_SIMULATION and #slot1.SubUnitList > 0 then
				slot1.SubFlag = 1
				slot1.TotalSubAmmo = 1
			end
		end
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.FINISH_STAGE_DONE,
		GAME.FINISH_STAGE_ERROR,
		GAME.STORY_BEGIN,
		GAME.STORY_END,
		GAME.END_GUIDE,
		GAME.START_GUIDE,
		GAME.PAUSE_BATTLE,
		slot0.CLOSE_CHAT
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()
	slot4 = ys.Battle.BattleState.GetInstance()

	if slot1:getName() == GAME.FINISH_STAGE_DONE then
		pg.MsgboxMgr.GetInstance():hide()
		gcAll(true)

		if slot3.system == SYSTEM_PROLOGUE then
			ys.Battle.BattleState.GetInstance():Deactive()
			slot0:sendNotification(GAME.GO_SCENE, SCENE.CREATE_PLAYER)
		elseif slot5 == SYSTEM_PERFORM or slot5 == SYSTEM_SIMULATION then
			ys.Battle.BattleState.GetInstance():Deactive()
			slot0.viewComponent:exitBattle()

			if slot3.exitCallback then
				slot3.exitCallback()
			end
		else
			slot6 = BattleResultMediator.GetResultView(slot5)
			slot7 = {}

			if slot5 == SYSTEM_SCENARIO then
				chapter = getProxy(ChapterProxy):getActiveChapter()
				slot7 = chapter.operationBuffList
			end

			slot0:addSubLayers(Context.New({
				mediator = BattleResultMediator,
				viewComponent = slot6,
				data = {
					system = slot5,
					rivalId = slot0.contextData.rivalId,
					mainFleetId = slot0.contextData.mainFleetId,
					stageId = slot0.contextData.stageId,
					oldMainShips = slot0.mainShips,
					oldPlayer = slot0.player,
					oldRank = slot0.oldRank,
					statistics = slot3.statistics,
					score = slot3.score,
					drops = slot3.drops,
					prefabFleet = slot3.prefabFleet,
					commanderExps = slot3.commanderExps,
					actId = slot0.contextData.actId,
					result = slot3.result,
					extraDrops = slot3.extraDrops,
					extraBuffList = slot7,
					mode = slot0.contextData.mode
				}
			}))
		end
	elseif slot2 == GAME.STORY_BEGIN then
		slot4:Pause()
	elseif slot2 == GAME.STORY_END then
		slot4:Resume()
	elseif slot2 == GAME.START_GUIDE then
		slot4:Pause()
	elseif slot2 == GAME.END_GUIDE then
		slot4:Resume()
	elseif slot2 == GAME.PAUSE_BATTLE then
		if not slot4:IsPause() then
			slot0:onPauseBtn()
		end
	elseif slot2 == GAME.FINISH_STAGE_ERROR then
		gcAll(true)

		slot5 = getProxy(ContextProxy)
		slot7 = slot5:getContextByMediator(LevelMediator2)
		slot8 = slot5:getContextByMediator(ChallengeMainMediator)
		slot9 = slot5:getContextByMediator(ActivityBossBattleMediator2)

		if slot5:getContextByMediator(DailyLevelMediator) then
			slot6:removeChild(slot6:getContextByMediator(PreCombatMediator))
		elseif slot8 then
			slot8:removeChild(slot8:getContextByMediator(ChallengePreCombatMediator))
		elseif slot7 then
			if battleSystem == SYSTEM_DUEL then
			elseif battleSystem == SYSTEM_SHAM then
				slot7:removeChild(slot7:getContextByMediator(ShamPreCombatMediator))
			elseif battleSystem == SYSTEM_GUILD then
				if slot7:getContextByMediator(GuildPreCombatMediator) then
					slot7:removeChild(slot10)
				end
			elseif battleSystem == SYSTEM_SCENARIO then
				slot7:removeChild(slot7:getContextByMediator(ChapterPreCombatMediator))
			elseif battleSystem ~= SYSTEM_PERFORM and battleSystem ~= SYSTEM_SIMULATION then
				slot7:removeChild(slot7:getContextByMediator(PreCombatMediator))
			end
		elseif slot9 and slot9:getContextByMediator(PreCombatMediator) then
			slot9:removeChild(slot10)
		end

		slot0:sendNotification(GAME.GO_BACK)
	elseif slot2 == slot0.CLOSE_CHAT then
		slot0.viewComponent:OnCloseChat()
	end
end

function slot0.remove(slot0)
	Screen.sleepTimeout = SleepTimeout.SystemSetting
end

return slot0
