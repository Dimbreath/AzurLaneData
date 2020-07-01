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

	slot0:bind(uv0.ON_BATTLE_RESULT, function (slot0, slot1)
		uv0:sendNotification(GAME.FINISH_STAGE, {
			token = uv0.contextData.token,
			mainFleetId = uv0.contextData.mainFleetId,
			stageId = uv0.contextData.stageId,
			rivalId = uv0.contextData.rivalId,
			memory = uv0.contextData.memory,
			exitCallback = uv0.contextData.exitCallback,
			system = uv1,
			statistics = slot1,
			actID = uv0.contextData.actId,
			mode = uv0.contextData.mode
		})
	end)
	slot0:bind(uv0.ON_AUTO, function (slot0, slot1)
		uv0:onAutoBtn(slot1)
	end)
	slot0:bind(uv0.ON_PAUSE, function (slot0)
		uv0:onPauseBtn()
	end)
	slot0:bind(uv0.ON_LEAVE, function (slot0)
		uv0:warnFunc()
	end)
	slot0:bind(uv0.ON_CHAT, function (slot0, slot1)
		uv0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			data = {
				form = NotificationLayer.FORM_BATTLE,
				chatViewParent = slot1
			}
		}))
	end)
	slot0:bind(uv0.ENTER, function (slot0)
		uv0:EnterBattle(uv1._battleData, uv1.contextData.prePause)
	end)
	slot0:bind(uv0.ON_BACK_PRE_SCENE, function ()
		slot0 = getProxy(ContextProxy)
		slot2 = slot0:getContextByMediator(LevelMediator2)
		slot3 = slot0:getContextByMediator(ChallengeMainMediator)
		slot4 = slot0:getContextByMediator(ActivityBossBattleMediator3)

		if slot0:getContextByMediator(DailyLevelMediator) then
			slot1:removeChild(slot1:getContextByMediator(PreCombatMediator))
		elseif slot3 then
			uv0:sendNotification(GAME.CHALLENGE2_RESET, {
				mode = uv0.contextData.mode
			})
			slot3:removeChild(slot3:getContextByMediator(ChallengePreCombatMediator))
		elseif slot2 then
			if uv1 == SYSTEM_DUEL then
				-- Nothing
			elseif uv1 == SYSTEM_SCENARIO then
				if slot2:getContextByMediator(ChapterPreCombatMediator) then
					slot2:removeChild(slot5)
				end
			elseif uv1 ~= SYSTEM_PERFORM and uv1 ~= SYSTEM_SIMULATION then
				slot2:removeChild(slot2:getContextByMediator(PreCombatMediator))
			end
		elseif slot4 and slot4:getContextByMediator(PreCombatMediator) then
			slot4:removeChild(slot5)
		end

		uv0:sendNotification(GAME.GO_BACK)
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
					uv0:Deactive()
					uv1:sendNotification(GAME.GO_SCENE, SCENE.CREATE_PLAYER)
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
						uv0:warnFunc(function ()
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
						uv0:warnFunc(function ()
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
	slot3 = slot0.contextData.system
	slot4, slot5 = nil

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		hideYes = true,
		hideNo = true,
		content = (not slot0.contextData.warnMsg or #slot6 <= 0 or i18n(slot6)) and (slot3 ~= SYSTEM_CHALLENGE or i18n("battle_battleMediator_clear_warning")) and (slot3 ~= SYSTEM_SIMULATION or i18n("tech_simulate_quit")) and i18n("battle_battleMediator_quest_exist"),
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
					uv0:Stop()
				end,
				sound = SFX_CONFIRM
			}
		}
	})
end

function slot0.guideDispatch(slot0)
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

	for slot9, slot10 in pairs(slot1.skills) do
		slot11 = {
			level = slot10.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(slot0, slot10.id)
		}
		ys.Battle.BattleDataFunction.GenerateHiddenBuff(slot1.configId)[slot11.id] = slot11
	end

	for slot9, slot10 in pairs(slot1:getTriggerSkills()) do
		slot11 = {
			level = slot10.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(slot0, slot10.id)
		}
		slot5[slot11.id] = slot11
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
		intimacy = slot1:getCVIntimacy(),
		shipGS = slot1:getShipCombatPower(),
		skills = slot5,
		baseList = slot1:getBaseList(),
		preloasList = slot1:getPreLoadCount(),
		name = slot1:getName()
	}
end

function slot0.GenBattleData(slot0)
	slot1 = {}
	slot0._battleData = slot1
	slot1.battleType = slot0.contextData.system
	slot1.StageTmpId = slot0.contextData.stageId
	slot1.MainUnitList = {}
	slot1.VanguardUnitList = {}
	slot1.SubUnitList = {}
	slot1.AidUnitList = {}
	slot1.SubFlag = -1
	slot1.ActID = slot0.contextData.actId

	if pg.battle_cost_template[slot0.contextData.system].global_buff_effected > 0 then
		slot3 = {}
		slot5 = getProxy(PlayerProxy):getData():getBuffByType(ys.Battle.BattleConst.BATTLE_GLOBAL_BUFF)

		for slot10, slot11 in ipairs(getProxy(ActivityProxy):GetBuildingBuff()) do
			if pg.benefit_buff_template[slot11.id].benefit_type == ys.Battle.BattleConst.BATTLE_GLOBAL_BUFF then
				table.insert(slot5, slot11)
			end
		end

		_.each(slot5, function (slot0)
			table.insert(uv0, pg.benefit_buff_template[slot0.id].benefit_effect)
		end)

		slot1.GlobalBuffIDs = slot3 or {}
	end

	slot3 = getProxy(BayProxy)
	slot4 = {}

	if slot2 == SYSTEM_SCENARIO then
		slot5 = getProxy(ChapterProxy)
		slot6 = slot5:getActiveChapter()
		slot1.RepressInfo = slot6:getRepressInfo()

		slot0.viewComponent:setChapter(slot6)

		slot7 = slot6.fleet
		slot1.KizunaJamming = slot6.extraFlagList
		slot1.DefeatCount = slot7:getDefeatCount()
		slot1.ChapterBuffIDs, slot1.CommanderList = slot6:getFleetBattleBuffs(slot7)
		slot1.StageWaveFlags = slot6:GetFleetAttachmentConfig("stage_flags", slot7.line.row, slot7.line.column)
		slot1.MapAuraSkills = slot5.GetChapterAuraBuffs(slot6)
		slot8 = _.values(slot7:getCommanders())
		slot9 = {}
		slot10 = slot7:getShipsByTeam(TeamType.Main, false)
		slot11 = slot7:getShipsByTeam(TeamType.Vanguard, false)
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

		slot1.MapAidSkills = {}

		for slot19, slot20 in pairs(slot5.GetChapterAidBuffs(slot6)) do
			table.insert(slot1.AidUnitList, uv0(slot2, slot19, _.values(slot6:getFleetByShipVO(slot19):getCommanders())))

			for slot27, slot28 in ipairs(slot20) do
				table.insert(slot1.MapAidSkills, slot28)
			end
		end

		slot0.mainShips = {}

		for slot20, slot21 in ipairs(slot10) do
			function (slot0, slot1, slot2)
				slot4 = slot0.hpRant * 0.0001

				if table.contains(uv0, slot0.id) then
					BattleVertify.cloneShipVertiry = true
				end

				uv0[#uv0 + 1] = slot3
				slot5 = uv1(uv2, slot0, slot1)
				slot5.initHPRate = slot4

				table.insert(uv3.mainShips, slot0)
				table.insert(slot2, slot5)
			end(slot21, slot8, slot1.MainUnitList)
		end

		for slot20, slot21 in ipairs(slot11) do
			slot16(slot21, slot8, slot1.VanguardUnitList)
		end

		for slot20, slot21 in ipairs(slot12) do
			slot16(slot21, slot9, slot1.SubUnitList)
		end

		slot0.viewComponent:setFleet(slot10, slot11, slot12)
	elseif slot2 == SYSTEM_CHALLENGE then
		slot7 = getProxy(ChallengeProxy):getUserChallengeInfo(slot0.contextData.mode)
		slot1.ChallengeInfo = slot7

		slot0.viewComponent:setChapter(slot7)

		slot8 = slot7:getRegularFleet()
		slot1.CommanderList = slot8:buildBattleBuffList()
		slot9 = _.values(slot8:getCommanders())
		slot10 = {}
		slot11 = slot8:getShipsByTeam(TeamType.Main, false)
		slot12 = slot8:getShipsByTeam(TeamType.Vanguard, false)
		slot13 = {}

		if #slot7:getSubmarineFleet():getShipsByTeam(TeamType.Submarine, false) > 0 then
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

		for slot19, slot20 in ipairs(slot11) do
			function (slot0, slot1, slot2)
				slot4 = slot0.hpRant * 0.0001

				if table.contains(uv0, slot0.id) then
					BattleVertify.cloneShipVertiry = true
				end

				uv0[#uv0 + 1] = slot3
				slot5 = uv1(uv2, slot0, slot1)
				slot5.initHPRate = slot4

				table.insert(uv3.mainShips, slot0)
				table.insert(slot2, slot5)
			end(slot20, slot9, slot1.MainUnitList)
		end

		for slot19, slot20 in ipairs(slot12) do
			slot15(slot20, slot9, slot1.VanguardUnitList)
		end

		for slot19, slot20 in ipairs(slot13) do
			slot15(slot20, slot10, slot1.SubUnitList)
		end

		slot0.viewComponent:setFleet(slot11, slot12, slot13)
	elseif slot2 == SYSTEM_WORLD then
		slot6 = getProxy(WorldProxy):GetWorld()
		slot7 = slot6:GetActiveMap()
		slot8 = slot7:GetFleet()
		slot1.AffixBuffList = slot7:GetCell(slot8.row, slot8.column):GetStageEnemy():GetBattleBuffList()
		slot11 = slot8:GetTeamShipVOs(TeamType.Main, false)
		slot12 = slot8:GetTeamShipVOs(TeamType.Vanguard, false)
		slot13 = {}

		if slot6:IsSubmarineSupporting() then
			if slot7:GetSubmarineFleet():GetAmmo() <= 0 then
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
			slot21 = uv0(slot2, slot18)
			slot21.initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.MainUnitList, slot21)
		end

		for slot17, slot18 in ipairs(slot12) do
			slot20 = slot18.bindingData.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot21 = uv0(slot2, slot18)
			slot21.initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.VanguardUnitList, slot21)
		end

		for slot17, slot18 in ipairs(slot13) do
			slot20 = slot18.bindingData.hpRant * 0.0001

			if table.contains(slot4, slot18.id) then
				BattleVertify.cloneShipVertiry = true
			end

			slot4[#slot4 + 1] = slot19
			slot21 = uv0(slot2, slot18)
			slot21.initHPRate = slot20

			table.insert(slot0.mainShips, slot18)
			table.insert(slot1.SubUnitList, slot21)
		end

		slot0.viewComponent:setFleet(slot11, slot12, slot13)
	elseif slot2 == SYSTEM_HP_SHARE_ACT_BOSS or slot2 == SYSTEM_ACT_BOSS or slot2 == SYSTEM_BOSS_EXPERIMENT then
		if slot0.contextData.mainFleetId then
			slot7 = getProxy(FleetProxy):getActivityFleets()[slot0.contextData.actId][slot0.contextData.mainFleetId]
			slot1.CommanderList = slot7:buildBattleBuffList()
			slot0.mainShips = {}
			slot10 = {}
			slot11 = {}
			slot14 = slot7:getTeamByName(TeamType.Vanguard)

			for slot18, slot19 in ipairs(slot7:getTeamByName(TeamType.Main)) do
				function (slot0, slot1, slot2, slot3)
					if table.contains(uv0, slot0) then
						BattleVertify.cloneShipVertiry = true
					end

					uv0[#uv0 + 1] = slot0
					slot4 = uv1:getShipById(slot0)

					table.insert(uv4.mainShips, slot4)
					table.insert(slot3, slot4)
					table.insert(slot2, uv2(uv3, slot4, slot1))
				end(slot19, _.values(slot7:getCommanders()), slot1.MainUnitList, {})
			end

			for slot18, slot19 in ipairs(slot14) do
				slot12(slot19, slot8, slot1.VanguardUnitList, slot10)
			end

			slot15 = slot6[slot0.contextData.mainFleetId + 10]

			for slot21, slot22 in ipairs(slot15:getTeamByName(TeamType.Submarine)) do
				slot12(slot22, _.values(slot15:getCommanders()), slot1.SubUnitList, slot11)
			end

			if slot15:isLegalToFight() == true and (slot2 == SYSTEM_BOSS_EXPERIMENT or slot15:GetCostSum().oil + slot7:GetCostSum().oil < getProxy(PlayerProxy):getRawData().oil) then
				slot1.SubFlag = 1
				slot1.TotalSubAmmo = 1
			end

			slot1.SubCommanderList = slot15:buildBattleBuffList()

			slot0.viewComponent:setFleet(slot9, slot10, slot11)
		end
	elseif slot0.contextData.mainFleetId then
		slot5 = slot2 == SYSTEM_DUEL
		slot7, slot8 = nil
		slot7 = getProxy(FleetProxy):getFleetById(slot0.contextData.mainFleetId)
		slot0.mainShips = slot3:getShipsByFleet(slot7)
		slot9 = {}
		slot10 = {}
		slot11 = {}

		function slot12(slot0, slot1, slot2)
			for slot6, slot7 in ipairs(slot0) do
				if table.contains(uv0, slot7) then
					BattleVertify.cloneShipVertiry = true
				end

				uv0[#uv0 + 1] = slot7
				slot8 = uv1:getShipById(slot7)

				table.insert(slot1, slot8)
				table.insert(slot2, uv2(uv3, slot8, nil, uv4))
			end
		end

		slot12(slot7:getTeamByName(TeamType.Main), slot9, slot1.MainUnitList)
		slot12(slot7:getTeamByName(TeamType.Vanguard), slot10, slot1.VanguardUnitList)
		slot12(slot7:getTeamByName(TeamType.Submarine), slot11, slot1.SubUnitList)
		slot0.viewComponent:setFleet(slot9, slot10, slot11)
	end

	slot1.RivalVanguardUnitList = {}
	slot1.RivalMainUnitList = {}
	slot5 = nil

	if slot2 == SYSTEM_DUEL and slot0.contextData.rivalId then
		slot6 = getProxy(MilitaryExerciseProxy)
		slot5 = slot6:getRivalById(slot0.contextData.rivalId)
		slot0.oldRank = slot6:getSeasonInfo()
	end

	if slot5 then
		slot1.RivalVO = slot5

		for slot10, slot11 in ipairs(slot5.mainShips) do
			slot6 = 0 + slot11.level
		end

		for slot10, slot11 in ipairs(slot5.vanguardShips) do
			slot6 = slot6 + slot11.level
		end

		BattleVertify.rivalLevel = slot6

		for slot10, slot11 in ipairs(slot5.mainShips) do
			if not slot11.hpRant or slot11.hpRant > 0 then
				slot12 = uv0(slot2, slot11, nil, true)

				if slot11.hpRant then
					slot12.initHPRate = slot11.hpRant * 0.0001
				end

				table.insert(slot1.RivalMainUnitList, slot12)
			end
		end

		for slot10, slot11 in ipairs(slot5.vanguardShips) do
			if not slot11.hpRant or slot11.hpRant > 0 then
				slot12 = uv0(slot2, slot11, nil, true)

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
		uv0.CLOSE_CHAT
	}
end

function slot0.handleNotification(slot0, slot1)
	slot4 = ys.Battle.BattleState.GetInstance()
	slot5 = slot0.contextData.system

	if slot1:getName() == GAME.FINISH_STAGE_DONE then
		pg.MsgboxMgr.GetInstance():hide()
		gcAll(true)

		if slot1:getBody().system == SYSTEM_PROLOGUE then
			ys.Battle.BattleState.GetInstance():Deactive()
			slot0:sendNotification(GAME.GO_SCENE, SCENE.CREATE_PLAYER)
		elseif slot6 == SYSTEM_PERFORM or slot6 == SYSTEM_SIMULATION then
			ys.Battle.BattleState.GetInstance():Deactive()
			slot0.viewComponent:exitBattle()

			if slot3.exitCallback then
				slot3.exitCallback()
			end
		else
			slot7 = BattleResultMediator.GetResultView(slot6)
			slot8 = {}

			if slot6 == SYSTEM_SCENARIO then
				chapter = getProxy(ChapterProxy):getActiveChapter()
				slot8 = chapter.operationBuffList
			end

			slot0:addSubLayers(Context.New({
				mediator = BattleResultMediator,
				viewComponent = slot7,
				data = {
					system = slot6,
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
					extraBuffList = slot8,
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

		slot6 = getProxy(ContextProxy)
		slot8 = slot6:getContextByMediator(LevelMediator2)
		slot9 = slot6:getContextByMediator(ChallengeMainMediator)
		slot10 = slot6:getContextByMediator(ActivityBossBattleMediator2)

		if slot6:getContextByMediator(DailyLevelMediator) then
			slot7:removeChild(slot7:getContextByMediator(PreCombatMediator))
		elseif slot9 then
			slot9:removeChild(slot9:getContextByMediator(ChallengePreCombatMediator))
		elseif slot8 then
			if slot5 == SYSTEM_DUEL then
				-- Nothing
			elseif slot5 == SYSTEM_SCENARIO then
				slot8:removeChild(slot8:getContextByMediator(ChapterPreCombatMediator))
			elseif slot5 ~= SYSTEM_PERFORM and slot5 ~= SYSTEM_SIMULATION then
				slot8:removeChild(slot8:getContextByMediator(PreCombatMediator))
			end
		elseif slot10 and slot10:getContextByMediator(PreCombatMediator) then
			slot10:removeChild(slot11)
		end

		slot0:sendNotification(GAME.GO_BACK)
	elseif slot2 == uv0.CLOSE_CHAT then
		slot0.viewComponent:OnCloseChat()
	end
end

function slot0.remove(slot0)
	Screen.sleepTimeout = SleepTimeout.SystemSetting
end

return slot0
