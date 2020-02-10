slot0 = class("Chapter", import(".BaseVO"))
slot0.SelectFleet = 1
slot0.CustomFleet = 2
slot1[1] = i18n("level_chapter_state_high_risk")
slot1[2] = i18n("level_chapter_state_risk")
slot1[3] = i18n("level_chapter_state_low_risk")
slot1[MULTRES] = i18n("level_chapter_state_safety")
slot0.CHAPTER_STATE = {}

function slot0.Ctor(slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
	slot0.unlock = false
	slot0.progress = defaultValue(slot1.progress, 0)
	slot0.defeatCount = slot1.defeat_count or 0
	slot0.passCount = slot1.pass_count or 0
	slot0.todayDefeatCount = slot1.today_defeat_count or 0
	slot0.expireTime = slot1.active_time
	slot0.awardIndex = slot1.index or 0
	slot0.theme = ChapterTheme.New(slot0:getConfig("theme"))
	slot2 = {
		defaultValue(slot1.kill_boss_count, 0),
		defaultValue(slot1.kill_enemy_count, 0),
		defaultValue(slot1.take_box_count, 0)
	}
	slot2[MULTRES] = defaultValue(slot1.take_box_count, 0)
	slot0.achieves = {}

	for slot6 = 1, 3, 1 do
		if slot0:getConfig("star_require_" .. slot6) > 0 then
			slot10.type = slot7
			slot10.config = slot0:getConfig("num_" .. slot6)
			slot10.count = slot2[slot6]

			table.insert(slot0.achieves, {})
		end
	end

	slot0.winConditions = {}

	for slot7, slot8 in pairs(slot0:getConfig("win_condition")) do
		slot11.type = slot8[1]
		slot11.param = slot8[2]

		table.insert(slot0.winConditions, {})
	end

	slot0.loseConditions = {}

	for slot8, slot9 in pairs(slot0:getConfig("lose_condition")) do
		slot12.type = slot9[1]
		slot12.param = slot9[2]

		table.insert(slot0.loseConditions, {})
	end

	slot0.dropShipIdList = {}
	slot5 = ipairs
	slot6 = slot1.drop_ship_id or {}

	for slot8, slot9 in slot5(slot6) do
		table.insert(slot0.dropShipIdList, slot9)
	end

	slot5[1] = {}
	slot5[2] = {}
	slot5[3] = {}
	slot0.eliteFleetList = {}
	slot5[1] = {}
	slot5[2] = {}
	slot5[3] = {}
	slot0.eliteCommanderList = {}
	slot0.pathFinder = nil
	slot0.active = false
	slot0.dueTime = nil
	slot0.cells = {}
	slot0.fleets = {}
	slot0.findex = 0
	slot0.champions = {}
	slot0.roundIndex = 0
	slot0.subAutoAttack = 0
	slot0.barriers = 0
	slot0.loopFlag = 0
	slot0.cellAttachments = {}
	slot0.buff_list = {}

	if slot1.buff_list then
		for slot8, slot9 in ipairs(slot1.buff_list) do
			slot0.buff_list[slot8] = slot9
		end
	end

	slot0.extraFlagList = {}
end

function slot0.BuildEliteFleetList(slot0)
	slot1 = {
		{},
		{},
		{}
	}
	slot2 = {
		{},
		{},
		{}
	}
	slot3 = ipairs
	slot4 = slot0 or {}

	for slot6, slot7 in slot3(slot4) do
		slot8 = {}

		for slot12, slot13 in ipairs(slot7.main_id) do
			slot8[#slot8 + 1] = slot13
		end

		for slot12, slot13 in ipairs(slot7.scout_id) do
			slot8[#slot8 + 1] = slot13
		end

		for slot12, slot13 in ipairs(slot7.submarine_id) do
			slot8[#slot8 + 1] = slot13
		end

		slot1[slot6] = slot8
		slot9 = {}

		for slot13, slot14 in ipairs(slot7.commanders) do
			slot15 = getProxy(CommanderProxy)

			if getProxy(CommanderProxy):getCommanderById(slot14.id) then
				slot9[slot14.pos] = slot14.id
			end
		end

		slot2[slot6] = slot9
	end

	return slot1, slot2
end

function slot0.__index(slot0, slot1)
	if slot1 == "fleet" then
		return slot0.fleets[slot0.findex]
	end

	return rawget(slot0, slot1) or uv0[slot1]
end

function slot0.getFleetById(slot0, slot1)
	return _.detect(slot0.fleets, function (slot0)
		return slot0.id == uv0
	end)
end

function slot0.getMaxCount(slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		if #slot0:getConfig("risk_levels") == 0 then
			return 0
		end

		return slot1[1][1]
	else
		return 0
	end
end

function slot0.hasMitigation(slot0)
	if not LOCK_MITIGATION and slot0:getDataType() == ChapterConst.TypeNone then
		return slot0:getConfig("mitigation_level") > 0
	else
		return false
	end
end

function slot0.getRemainPassCount(slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		return math.max(slot0:getMaxCount() - slot0.passCount, 0)
	else
		return 0
	end
end

function slot0.getRiskLevel(slot0)
	print("rrrr")

	if slot0:getDataType() == ChapterConst.TypeNone then
		slot1 = slot0:getRemainPassCount()

		for slot6, slot7 in ipairs(slot0:getConfig("risk_levels")) do
			if slot1 <= slot7[1] and slot7[2] <= slot1 then
				return slot6
			end
		end
	else
		return 0
	end
end

function slot0.getMitigationRate(slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		return math.min(slot0.passCount, slot0:getMaxCount()) * (LOCK_MITIGATION and 0 or slot0:getConfig("mitigation_rate"))
	else
		return 0
	end
end

function slot0.getRepressInfo(slot0)
	slot1.repressMax = slot0:getMaxCount()
	slot1.repressCount = slot0.passCount
	slot1.repressReduce = slot0:getMitigationRate()
	slot1.repressLevel = LOCK_MITIGATION and 0 or slot0:getRemainPassCount() > 0 and 0 or slot0:getConfig("mitigation_level") or 0
	slot1.repressEnemyHpRant = 1 - slot0:getStageCell(slot0.fleet.line.row, slot0.fleet.line.column).data / 10000

	return {}
end

function slot0.getChapterState(slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		return uv0.CHAPTER_STATE[slot0:getRiskLevel()]
	else
		return ""
	end
end

function slot0.getDataType(slot0)
	return ChapterConst.TypeNone
end

function slot0.getPlayType(slot0)
	return slot0:getConfig("model")
end

function slot0.bindConfigTable(slot0)
	return pg.chapter_template
end

function slot0.isTypeDefence(slot0)
	return slot0:getPlayType() == ChapterConst.TypeDefence
end

function slot0.getConfig(slot0, slot1)
	if slot0:isLoop() and pg.chapter_template_loop[slot0.id][slot1] ~= nil then
		return slot2[slot1]
	end

	return slot0:getConfigTable()[slot1]
end

function slot0.update(slot0, slot1)
	slot0.active = true
	slot0.dueTime = slot1.time
	slot0.loopFlag = slot1.loop_flag
	slot4 = slot0:getConfig("float_items")
	slot5 = slot0:getConfig("grids")
	slot0.cells = {}

	function slot6(slot0)
		if slot0.item_type == ChapterConst.AttachStory and slot0.item_data == ChapterConst.StoryTrigger then
			table.insert(uv0.cellAttachments, ChapterCell.New(slot0))
		end

		if not uv0.cells[ChapterCell.Line2Name(slot0.pos.row, slot0.pos.column)] or uv0.cells[slot1].attachment == ChapterConst.AttachNone then
			if ChapterCell.New(slot0).attachment == ChapterConst.AttachOni_Target or slot2.attachment == ChapterConst.AttachOni or slot2.attachment == ChapterConst.AttachStory and slot2.data == ChapterConst.StoryTrigger then
				slot2.attachment = ChapterConst.AttachNone
			end

			if _.detect(uv1, function (slot0)
				return slot0[1] == uv0.row and slot0[2] == uv0.column
			end) then
				slot2.item = slot3[3]
				slot2.itemOffset = Vector2(slot3[4], slot3[5])
			end

			uv0.cells[slot1] = slot2

			return slot2
		end
	end

	_.each(slot1.cell_list, function (slot0)
		uv0(slot0)
	end)
	_.each(slot5, function (slot0)
		if uv0.cells[ChapterCell.Line2Name(slot0[1], slot0[2])] then
			slot2.walkable = slot0[3]
		elseif not slot0[3] then
			slot5.row = slot0[1]
			slot5.column = slot0[2]
			slot4.pos = {}
			slot4.item_type = ChapterConst.AttachNone
			uv1({}).walkable = false
		end
	end)

	slot0.indexMax = Vector2(-ChapterConst.MaxRow, -ChapterConst.MaxColumn)
	slot0.indexMin = Vector2(ChapterConst.MaxRow, ChapterConst.MaxColumn)

	_.each(slot5, function (slot0)
		uv0.indexMin.x = math.min(uv0.indexMin.x, slot0[1])
		uv0.indexMin.y = math.min(uv0.indexMin.y, slot0[2])
		uv0.indexMax.x = math.max(uv0.indexMax.x, slot0[1])
		uv0.indexMax.y = math.max(uv0.indexMax.y, slot0[2])
	end)
	_.each(slot1.cell_flag_list or {}, function (slot0)
		if uv0.cells[ChapterCell.Line2Name(slot0.pos.row, slot0.pos.column)] then
			slot2:updateFlagList(slot0)
		else
			uv0.cells[slot1] = ChapterCell.New(slot0)
		end
	end)

	slot0.buff_list = {}

	if slot1.buff_list then
		for slot10, slot11 in ipairs(slot1.buff_list) do
			slot0.buff_list[slot10] = slot11
		end
	end

	slot0.pathFinder = PathFinding.New({}, ChapterConst.MaxRow, ChapterConst.MaxColumn)
	slot7 = slot0:getNpcShipByType()
	slot0.fleets = {}

	for slot11, slot12 in ipairs(slot1.group_list) do
		slot13 = ChapterFleet.New()

		slot13:setup(slot0)
		slot13:updateNpcShipList(slot7)
		slot13:update(slot12)

		slot0.fleets[slot11] = slot13
	end

	slot0.fleets = _.sort(slot0.fleets, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	if slot1.escort_list then
		for slot11, slot12 in ipairs(slot1.escort_list) do
			slot0.fleets[#slot0.fleets + 1] = ChapterTransportFleet.New(slot12, #slot0.fleets + 1)
		end
	end

	slot0.findex = 0
	slot0.findex = slot0:getNextValidIndex()
	slot0.champions = {}

	if slot1.ai_list then
		for slot11, slot12 in ipairs(slot1.ai_list) do
			if slot12.item_flag ~= 1 then
				slot0:mergeChampionImmediately(ChapterChampionPackage.New(slot12))
			end
		end
	end

	slot0.roundIndex = slot1.round
	slot0.subAutoAttack = slot1.is_submarine_auto_attack
	slot0.modelCount = slot1.model_act_count
	slot0.operationBuffList = {}

	for slot11, slot12 in ipairs(slot1.operation_buff) do
		slot0.operationBuffList[#slot0.operationBuffList + 1] = slot12
	end

	slot0.airDominanceStatus = nil
	slot0.extraFlagList = {}

	for slot11, slot12 in ipairs(slot1.extra_flag_list) do
		table.insert(slot0.extraFlagList, slot12)
	end

	slot0.defeatEnemies = slot1.kill_count or 0
	slot0.BaseHP = slot1.chapter_hp or 0
	slot0.orignalShipCount = slot1.init_ship_count or 0
	slot0.combo = slot1.continuous_kill_count or 0
	slot0.scoreHistory = slot0.scoreHistory or {}

	for slot11 = ys.Battle.BattleConst.BattleScore.D, ys.Battle.BattleConst.BattleScore.S, 1 do
		slot0.scoreHistory[slot11] = 0
	end

	if slot1.battle_statistics then
		for slot11, slot12 in ipairs(slot1.battle_statistics) do
			slot0.scoreHistory[slot12.id] = slot12.count
		end
	end

	slot8 = {}

	if slot1.chapter_strategy_list then
		for slot12, slot13 in ipairs(slot1.chapter_strategy_list) do
			slot8[slot13.id] = slot13.count
		end
	end

	slot0.strategies = slot8
end

function slot0.retreat(slot0, slot1)
	if slot1 or slot0:isPlayingWithBombEnemy() or slot0:existOni() then
		slot0.todayDefeatCount = slot0.todayDefeatCount + 1

		slot0:updateTodayDefeatCount()
	end

	slot0.active = false
	slot0.dueTime = nil
	slot0.cells = {}
	slot0.fleets = {}
	slot0.findex = 1
	slot0.champions = {}
	slot0.cellAttachments = {}
	slot0.round = 0
	slot0.airDominanceStatus = nil
	slot2 = getProxy(ChapterProxy)

	getProxy(ChapterProxy):RecordLastDefeatedEnemy(slot0.id, nil)
end

function slot0.clearSubChapter(slot0)
	slot0.expireTime = nil
	slot0.awardIndex = nil
end

function slot0.existLoop(slot0)
	return pg.chapter_template_loop[slot0.id] ~= nil
end

function slot0.canActivateLoop(slot0)
	return slot0:getRiskLevel() == 4 and slot0:isAllAchieve()
end

function slot0.isLoop(slot0)
	return slot0.loopFlag == 1
end

function slot0.getRound(slot0)
	return slot0.roundIndex % 2
end

function slot0.getRoundNum(slot0)
	return math.floor(slot0.roundIndex / 2)
end

function slot0.IncreaseRound(slot0)
	slot0.roundIndex = slot0.roundIndex + 1
end

function slot0.existMoveLimit(slot0)
	return slot0:getConfig("limit_move") == 1
end

function slot0.getChapterCell(slot0, slot1, slot2)
	return Clone(slot0.cells[ChapterCell.Line2Name(slot1, slot2)])
end

function slot0.findChapterCell(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.attachment == slot1 and (not slot2 or slot7.attachmentId == slot2) then
			return Clone(slot7)
		end
	end

	return nil
end

function slot0.findChapterCells(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot0.cells) do
		if slot8.attachment == slot1 and (not slot2 or slot8.attachmentId == slot2) then
			table.insert(slot3, Clone(slot8))
		end
	end

	return slot3
end

function slot0.mergeChapterCell(slot0, slot1)
	slot4 = slot0.cells[ChapterCell.Line2Name(slot1.row, slot1.column)] == nil or slot3.attachment ~= slot1.attachment or slot3.attachmentId ~= slot1.attachmentId or slot3.attachment == ChapterConst.AttachRival and slot3.rival.id ~= slot1.rival.id

	if slot3 then
		slot3.attachment = slot1.attachment
		slot3.attachmentId = slot1.attachmentId
		slot3.flag = slot1.flag
		slot3.data = slot1.data
		slot3.rival = slot1.rival
		slot1 = slot3
	end

	if slot4 and ChapterConst.NeedMarkAsLurk(slot1) then
		slot1.trait = ChapterConst.TraitLurk
	end

	if slot1.attachment == ChapterConst.AttachBoss and slot0:getChampionIndex(slot1.row, slot1.column) then
		table.remove(slot0.champions, slot5)
	end

	slot0:updateChapterCell(slot1)
end

function slot0.updateChapterCell(slot0, slot1)
	slot0.cells[ChapterCell.Line2Name(slot1.row, slot1.column)] = Clone(slot1)
end

function slot0.clearChapterCell(slot0, slot1, slot2)
	slot4 = slot0.cells[ChapterCell.Line2Name(slot1, slot2)]
	slot4.attachment = ChapterConst.AttachNone
	slot4.attachmentId = 0
	slot4.flag = 0
	slot4.data = 0
	slot4.trait = ChapterConst.TraitNone
end

function slot0.getShip(slot0, slot1)
	slot2 = nil

	for slot6 = 1, #slot0.fleets, 1 do
		slot7 = slot0.fleets[slot6]

		if slot0.fleets[slot6]:getShip(slot1) then
			break
		end
	end

	return slot2
end

function slot0.getShips(slot0)
	_.each(slot0.fleets, function (slot0)
		_.each(slot0:getShips(true), function (slot0)
			table.insert(uv0, Clone(slot0))
		end)
	end)

	return {}
end

function slot0.getFirstValidIndex(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.fleets) do
		if slot6:isValid() then
			slot1 = slot5

			break
		end
	end

	return slot1
end

function slot0.getNextValidIndex(slot0)
	slot1 = 0

	for slot5 = slot0.findex + 1, #slot0.fleets, 1 do
		slot6 = slot0.fleets[slot5]

		if slot0.fleets[slot5]:getFleetType() == FleetType.Normal then
			slot6 = slot0.fleets[slot5]

			if slot0.fleets[slot5]:isValid() then
				slot1 = slot5

				break
			end
		end
	end

	if slot1 == 0 then
		for slot5 = 1, slot0.findex - 1, 1 do
			slot6 = slot0.fleets[slot5]

			if slot0.fleets[slot5]:getFleetType() == FleetType.Normal then
				slot6 = slot0.fleets[slot5]

				if slot0.fleets[slot5]:isValid() then
					slot1 = slot5

					break
				end
			end
		end
	end

	return slot1
end

function slot0.shipInWartime(slot0, slot1)
	return _.any(slot0.fleets, function (slot0)
		return slot0.ships[uv0] ~= nil
	end)
end

function slot0.existAmbush(slot0)
	return slot0:getDataType() == ChapterConst.TypeNone and slot0:getPlayType() == ChapterConst.TypeLagacy
end

function slot0.getAmbushRate(slot0, slot1, slot2)
	slot4 = slot0:getConfig("investigation_ratio")
	slot7 = _.detect(slot0:getConfig("ambush_ratio_extra"), function (slot0)
		return #slot0 == 1
	end)
	slot6 = (_.detect(slot0:getConfig("ambush_ratio_extra"), function (slot0)
		return slot0[1] == uv0.row and slot0[2] == uv0.column
	end) and slot6[3] / 10000 or 0) + (slot7 and slot7[1] / 10000 or 0)
	slot8 = 0.05 + slot4 / (slot4 + slot1:getInvestSums()) / 4 * math.max(slot1.step - 1, 0) + slot6

	if slot6 == 0 then
		slot8 = 0.05 + slot4 / (slot4 + slot1:getInvestSums()) / 4 * math.max(slot1.step - 1, 0) + slot6 - slot1:getEquipAmbushRateReduce()
	end

	return math.clamp(slot8, 0, 1)
end

function slot0.getAmbushDodge(slot0, slot1)
	slot2 = slot1.line
	slot3 = slot1:getDodgeSums()
	slot5 = slot3 / (slot3 + slot0:getConfig("avoid_ratio"))

	if (_.detect(slot0:getConfig("ambush_ratio_extra"), function (slot0)
		return slot0[1] == uv0.row and slot0[2] == uv0.column
	end) and slot6[3] / 10000 or 0) == 0 then
		slot5 = slot3 / (slot3 + slot0:getConfig("avoid_ratio")) + slot1:getEquipDodgeRateUp()
	end

	return math.clamp(slot5, 0, 1)
end

function slot0.isValid(slot0)
	if slot0:getPlayType() == ChapterConst.TypeMainSub then
		if not slot0.active and slot0.expireTime then
			slot1 = pg.TimeMgr.GetInstance():GetServerTime() < slot0.expireTime
		end

		return slot1
	end

	return true
end

function slot0.inWartime(slot0)
	if slot0.dueTime then
		slot1 = pg.TimeMgr.GetInstance():GetServerTime() < slot0.dueTime
	end

	return slot1
end

function slot0.getRemainTime(slot0)
	return math.max(slot0.dueTime - pg.TimeMgr.GetInstance():GetServerTime() - 1, 0) or 0
end

function slot0.getStartTime(slot0)
	return math.max(slot0.dueTime - slot0:getConfig("time"), 0)
end

function slot0.setUnlock(slot0, slot1)
	slot0.unlock = slot1
end

function slot0.isUnlock(slot0)
	return slot0.unlock
end

function slot0.isClear(slot0)

	-- Decompilation error in this vicinity:
	if slot0:getPlayType() == ChapterConst.TypeMainSub then
		return true
	else
		return slot0.progress >= 100
	end
end

function slot0.ifNeedHide(slot0)
	slot1 = false

	if pg.chapter_setting and table.contains(pg.chapter_setting.all, slot0.id) and pg.chapter_setting[slot0.id].hide == 1 then
		slot1 = true
	end

	if slot1 and slot0:isClear() then
		return true
	end
end

function slot0.existAchieve(slot0)
	return #slot0.achieves > 0
end

function slot0.isAllAchieve(slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.achieves) do
		if ChapterConst.IsAchieved(slot6) then
			slot1 = slot1 + 1
		end
	end

	return slot1 == #slot0.achieves
end

function slot0.findPath(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8 = 0, ChapterConst.MaxRow - 1, 1 do
		if not slot4[slot8] then
			slot4[slot8] = {}
		end

		for slot12 = 0, ChapterConst.MaxColumn - 1, 1 do
			slot13 = PathFinding.PrioForbidden

			if slot0.cells[ChapterCell.Line2Name(slot8, slot12)] and slot15:IsWalkable() then
				slot13 = PathFinding.PrioNormal

				if slot15.row == slot3.row and slot15.column == slot3.column then
					if not slot0:considerAsStayPoint(slot1, slot15.row, slot15.column) then
						slot13 = PathFinding.PrioObstacle
					end
				elseif slot0:considerAsObstacle(slot1, slot15.row, slot15.column) then
					slot13 = PathFinding.PrioObstacle
				end
			end

			slot4[slot8][slot12] = slot13
		end
	end

	if slot1 == ChapterConst.SubjectPlayer then
		for slot9, slot10 in ipairs(slot0:getCoastalGunArea()) do
			if slot10.row ~= slot3.row or slot10.column ~= slot3.column then
				slot4[slot10.row][slot10.column] = math.max(slot4[slot10.row][slot10.column], PathFinding.PrioObstacle)
			end
		end
	end

	slot0.pathFinder.cells = slot4
	slot5 = slot0.pathFinder

	return slot0.pathFinder:Find(slot2, slot3)
end

function slot0.getWaveCount(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.cells) do
		if slot6.attachment == ChapterConst.AttachEnemy and underscore.detect(slot0:getConfig("grids"), function (slot0)
			if slot0[1] == uv0.row and slot0[2] == uv0.column and (slot0[4] == ChapterConst.AttachElite or slot0[4] == ChapterConst.AttachEnemy) then
				return true
			end

			return false
		end) then
			slot1 = slot1 + 1
		end
	end

	slot3 = slot0:getConfig("elite_refresh")
	slot4 = 0

	for slot8, slot9 in pairs(slot0:getConfig("enemy_refresh")) do
		slot4 = slot4 + slot9

		if slot8 <= #slot3 then
			slot4 = slot4 + slot9 + slot3[slot8]
		end

		if slot1 <= slot4 then
			return slot8
		end
	end

	return 1
end

function slot0.bossRefreshed(slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		if slot5.attachment == ChapterConst.AttachBoss then
			return true
		end
	end

	return false
end

function slot0.getFleetAmmo(slot0, slot1)
	slot2 = slot1:getShipAmmo()

	if slot1:getFleetType() == FleetType.Normal then
		slot2 = slot1:getShipAmmo() + slot0:getConfig("ammo_total")
	elseif slot3 == FleetType.Submarine then
		slot2 = slot2 + slot0:getConfig("ammo_submarine")
	end

	return slot2, slot1.restAmmo
end

function slot0.getFleetStgs(slot0, slot1)
	slot2 = slot1:getStrategies()

	if slot0:getPlayType() == ChapterConst.TypeLagacy then
		slot2 = _.filter(slot1:getStrategies(), function (slot0)
			return pg.strategy_data_template[slot0.id].type == ChapterConst.StgTypeForm or slot1.type == ChapterConst.StgTypeConsume and slot1.id == ChapterConst.StrategyRepair or slot1.id == ChapterConst.StrategyExchange
		end)
	end

	return slot2
end

function slot0.getFleetStgIds(slot0, slot1)
	slot2 = {}
	slot3, slot4 = slot0:getFleetAmmo(slot1)

	if ChapterConst.AmmoRich <= slot4 then
		table.insert(, ChapterConst.StrategyAmmoRich)
	elseif slot4 <= ChapterConst.AmmoPoor then
		table.insert(slot2, ChapterConst.StrategyAmmoPoor)
	end

	if #slot1.stgIds > 0 then
		_.each(slot1.stgIds, function (slot0)
			table.insert(uv0, slot0)
		end)
	end

	if OPEN_AIR_DOMINANCE and slot0:getConfig("air_dominance") > 0 then
		table.insert(slot2, slot0:getAirDominanceStg())
	end

	for slot8, slot9 in ipairs(slot0:getExtraFlags()) do
		table.insert(slot2, ChapterConst.Status2StgBuff[slot9])
	end

	for slot9 = #slot2, 1, -1 do
		if pg.strategy_data_template[slot2[slot9]].buff_id == 0 then
			table.remove(slot2, slot9)
		end
	end

	return slot2
end

function slot0.getAirDominanceStg(slot0)
	slot1, slot2 = slot0:getAirDominanceValue()

	return ChapterConst.AirDominance[slot2].StgId
end

function slot0.getAirDominanceValue(slot0)
	slot1 = 0
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.fleets) do
		if slot7:isValid() then
			slot1 = slot1 + slot7:getFleetAirDominanceValue()
			slot2 = slot2 + slot7:getAntiAircraftSums()
		end
	end

	return slot1, calcAirDominanceStatus(slot1, slot0:getConfig("air_dominance"), slot2), slot0.airDominanceStatus
end

function slot0.setAirDominanceStatus(slot0, slot1)
	slot0.airDominanceStatus = slot1
end

function slot0.updateExtraFlags(slot0, slot1, slot2)
	slot3 = false

	for slot7, slot8 in ipairs(slot2) do
		for slot12, slot13 in ipairs(slot0.extraFlagList) do
			if slot13 == slot8 then
				table.remove(slot0.extraFlagList, slot12)

				slot3 = true

				break
			end
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if not table.contains(slot0.extraFlagList, slot8) then
			table.insert(slot0.extraFlagList, slot8)

			slot3 = true
		end
	end

	return slot3
end

function slot0.getExtraFlags(slot0)
	return slot0.extraFlagList
end

function slot0.updateShipStg(slot0, slot1, slot2, slot3)
	slot4 = slot0.fleet

	slot0.fleet:updateShipStg(slot1, slot2, slot3)
end

function slot0.getFleetBattleBuffs(slot0, slot1)
	slot2[MULTRES] = unpack(slot0.buff_list)

	_.each(slot0:getFleetStgIds(slot1), function (slot0)
		table.insert(uv0, pg.strategy_data_template[slot0].buff_id)
	end)

	return {} or {}, slot0:buildBattleBuffList(slot1)
end

function slot0.buildBattleBuffList(slot0, slot1)

	-- Decompilation error in this vicinity:
	slot2 = {}
	slot3, slot4 = slot0:triggerSkill(slot1, FleetSkill.TypeBattleBuff)

	if slot3 and #slot3 > 0 then
		slot5 = {}

		for slot9, slot10 in ipairs(slot3) do
			slot5[slot12] = slot5[slot1:findCommanderBySkillId(slot4[slot9].id)] or {}

			table.insert(slot5[slot12], slot10)
		end

		for slot9, slot10 in pairs(slot5) do
			slot13[1] = slot9
			slot13[2] = slot10

			table.insert(slot2, {})
		end
	end

	for slot9, slot10 in pairs(slot1:getCommanders()) do
		for slot15, slot16 in ipairs(slot10:getTalents()) do
			if #slot16:getBuffsAddition() > 0 then
				slot18 = nil

				for slot22, slot23 in ipairs(slot2) do
					if slot23[1] == slot10 then
						slot18 = slot23[2]

						break
					end
				end

				if not slot18 then
					slot21[1] = slot10
					slot21[2] = {}

					table.insert(slot2, {})
				end

				for slot22, slot23 in ipairs(slot17) do
					table.insert(slot18, slot23)
				end
			end
		end
	end

	return slot2
end

function slot0.updateShipHp(slot0, slot1, slot2)
	slot3 = slot0.fleet

	slot0.fleet:updateShipHp(slot1, slot2)
end

function slot0.updateFleetShipHp(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.fleets) do
		slot7:updateShipHp(slot1, slot2)

		if slot7.id ~= slot0.fleet.id then
			slot7:clearShipHpChange()
		end
	end
end

function slot0.clearEliterFleetByIndex(slot0, slot1)
	if slot1 > #slot0.eliteFleetList then
		return
	end

	slot0.eliteFleetList[slot1] = {}
end

function slot0.wrapEliteFleet(slot0, slot1)
	slot2 = {}
	slot3 = _.flatten(slot0:getEliteFleetList()[slot1])

	for slot7, slot8 in pairs(slot0:getEliteFleetCommanders()[slot1]) do
		slot11.pos = slot7
		slot11.id = slot8

		table.insert(slot2, {})
	end

	slot5.ship_list = slot3
	slot5.commanders = slot2

	return Fleet.New({
		id = 1
	})
end

function slot0.setEliteCommanders(slot0, slot1)
	slot0.eliteCommanderList = slot1
end

function slot0.getEliteFleetCommanders(slot0)
	return slot0.eliteCommanderList
end

function slot0.updateCommander(slot0, slot1, slot2, slot3)
	slot0.eliteCommanderList[slot1][slot2] = slot3
end

function slot0.getEliteFleetList(slot0)
	return slot0.eliteFleetList
end

function slot0.setEliteFleetList(slot0, slot1)
	slot0.eliteFleetList = slot1
end

function slot0.IsEliteFleetLegal(slot0)
	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5, slot6 = nil

	for slot10 = 1, #slot0.eliteFleetList, 1 do
		slot11, slot12 = slot0:singleEliteFleetVertify(slot10)

		if not slot11 then
			if not slot12 then
				if slot10 >= 3 then
					slot3 = slot3 + 1
				else
					slot1 = slot1 + 1
				end
			else
				slot5 = slot12
				slot6 = slot10
			end
		elseif slot10 >= 3 then
			slot4 = slot4 + 1
		else
			slot2 = slot2 + 1
		end
	end

	if slot1 == 2 then
		return false, i18n("elite_disable_no_fleet")
	elseif slot2 == 0 then
		return false, slot5
	elseif slot3 + slot4 < slot0:getConfig("submarine_num") then
		return false, slot5
	end

	slot11, slot8 = slot0:IsPropertyLimitationSatisfy()
	slot9 = 1

	for slot13, slot14 in ipairs(slot7) do
		slot9 = slot9 * slot14
	end

	if slot9 ~= 1 then
		return false, i18n("elite_disable_property_unsatisfied")
	end

	return true, slot6
end

function slot0.IsPropertyLimitationSatisfy(slot0)
	slot1 = getProxy(BayProxy)
	slot1 = getProxy(BayProxy):getRawData()
	slot2 = {}

	for slot6, slot7 in ipairs(slot0:getConfig("property_limitation")) do
		slot2[slot7[1]] = 0
	end

	slot3 = 0

	for slot7 = 1, 2, 1 do
		if slot0:singleEliteFleetVertify(slot7) == true then
			for slot13, slot14 in ipairs(slot0.eliteFleetList[slot7]) do
				slot15 = slot1[slot14]
				slot3 = slot3 + 1
				slot16 = intProperties(slot1[slot14]:getProperties())

				for slot20, slot21 in pairs(slot2) do
					if slot20 == "level" then
						slot2[slot20] = slot21 + slot15.level
					else
						slot2[slot20] = slot21 + slot16[slot20]
					end
				end
			end
		end
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot0:getConfig("property_limitation")) do
		slot10 = slot9[1]
		slot11 = slot9[2]
		slot12 = slot9[3]
		slot13 = slot2[slot10]

		if slot10 == "level" then
			if slot2[slot10] == 0 then
				slot2[slot10] = 0
			else
				slot2[slot10] = math.ceil(slot13 / slot3)
			end
		end

		slot13 = slot2[slot10]
		slot14 = 0

		if slot11 == -1 and slot2[slot10] < slot12 then
			slot14 = 1
		elseif slot11 == 1 and slot12 < slot13 then
			slot14 = 1
		end

		slot4[slot8] = slot14
	end

	return slot4, slot2
end

function slot0.EliteShipTypeFilter(slot0, slot1)
	function slot2(slot0, slot1, slot2)
		slot3 = 0

		for slot7, slot8 in ipairs(slot1) do
			if slot8 == 0 then
				slot3 = slot3 + 1
			end
		end

		slot4 = {}

		for slot8, slot9 in ipairs(Clone(slot1)) do
			if type(slot9) == "string" then
				for slot14, slot15 in ipairs(Clone(ShipType.BundleList[slot9])) do
					slot4[#slot4 + 1] = slot15
				end
			end
		end

		for slot8, slot9 in ipairs(slot4) do
			slot1[#slot1 + 1] = slot9
		end

		for slot8, slot9 in pairs(slot2) do
			if table.contains(slot1, slot8:getShipType()) then
				for slot14, slot15 in ipairs(slot1) do
					if slot15 == slot10 then
						uv0 = slot14

						break
					end
				end

				table.remove(slot1, uv0)
			elseif slot3 - 1 < 0 then
				slot11 = nil

				for slot15, slot16 in ipairs(slot0) do
					if slot16 == slot9 then
						slot11 = slot15

						break
					end
				end

				table.remove(slot0, slot11)
			end
		end
	end

	for slot6, slot7 in ipairs(slot0:getConfig("limitation")) do
		slot8 = getProxy(BayProxy)
		slot8 = getProxy(BayProxy):getRawData()
		slot10 = {}
		slot11 = {}
		slot12 = {}

		for slot16, slot17 in ipairs(slot0.eliteFleetList[slot6]) do
			slot18 = slot8[slot17]

			if slot18:getTeamType() == TeamType.Main then
				slot10[slot18] = slot17
			elseif slot19 == TeamType.Vanguard then
				slot11[slot18] = slot17
			elseif slot19 == TeamType.Submarine then
				slot12[slot18] = slot17
			end
		end

		slot2(slot9, slot7[1], slot10)
		slot2(slot9, slot7[2], slot11)
		slot2(slot9, {
			0,
			0,
			0
		}, slot12)
	end
end

function slot0.singleEliteFleetVertify(slot0, slot1)
	slot2 = getProxy(BayProxy)
	slot2 = getProxy(BayProxy):getRawData()
	slot4 = slot0:getConfig("limitation")

	if #slot0.eliteFleetList[slot1] == 0 then
		return false
	else
		slot5 = 0
		slot6 = 0
		slot7 = {}

		for slot11, slot12 in ipairs(slot3) do
			if slot2[slot12].inEvent then
				return false, i18n("elite_disable_ship_escort")
			end

			if slot13:getTeamType() == TeamType.Main then
				slot5 = slot5 + 1
			elseif slot14 == TeamType.Vanguard then
				slot6 = slot6 + 1
			end

			slot7[#slot7 + 1] = slot13:getShipType()
		end

		if slot1 >= 3 then
			-- Nothing
		elseif slot5 * slot6 == 0 and slot5 + slot6 ~= 0 then
			return false
		else
			slot8 = 1

			for slot12, slot13 in ipairs(slot4[slot1]) do
				slot14 = 0
				slot15 = 0

				for slot19, slot20 in ipairs(slot13) do
					if type(slot20) == "number" then
						slot14 = slot14 + slot20

						if slot20 ~= 0 and table.contains(slot7, slot20) then
							slot15 = 1
						end
					elseif type(slot20) == "string" then
						slot14 = slot14 + 1
						slot21 = Clone(ShipType.BundleList[slot20])

						if _.any(slot7, function (slot0)
							return table.contains(uv0, slot0)
						end) then
							slot15 = 1
						end
					end
				end

				if slot14 == 0 then
					slot15 = 1
				end

				slot8 = slot8 * slot15
			end

			if slot8 == 0 then
				return false, i18n("elite_disable_formation_unsatisfied")
			end
		end
	end

	return true
end

function slot0.getDragExtend(slot0)
	slot1 = slot0.theme
	slot2 = 99999999
	slot3 = 99999999
	slot4 = 0
	slot5 = 0

	for slot9, slot10 in pairs(slot0.cells) do
		if slot10.row < slot2 then
			slot2 = slot10.row
		end

		if slot4 < slot10.row then
			slot4 = slot10.row
		end

		if slot10.column < slot3 then
			slot3 = slot10.column
		end

		if slot5 < slot10.column then
			slot5 = slot10.column
		end
	end

	slot7 = slot1.cellSize + slot1.cellSpace
	slot8 = math.max((slot5 - (slot5 + slot3) * 0.5 - 0) * slot7.x, 0)

	return math.max(10 * slot7.x - slot8, 0), slot8, math.max((ChapterConst.MaxRow * 0.5 - slot2) * slot7.y, 0), math.max((slot4 - ChapterConst.MaxRow * 0.5) * slot7.y, 0)
end

function slot0.getPoisonArea(slot0, slot1)
	slot2 = {}
	slot3 = slot0.theme.cellSize + slot0.theme.cellSpace
	slot4 = math.floor(slot3.x * slot1)
	slot5 = math.floor(slot3.y * slot1)

	for slot9, slot10 in pairs(slot0.cells) do
		if slot10:checkHadFlag(ChapterConst.FlagPoison) then
			slot13.x = math.floor(slot4 * (slot10.column - slot0.indexMin.y))
			slot13.y = math.floor(slot5 * (slot10.row - slot0.indexMin.x))
			slot13.w = slot4
			slot13.h = slot5
			slot2[slot9] = {}
		end
	end

	return slot2
end

function slot0.selectFleets(slot0, slot1, slot2)
	slot3 = Clone(slot1) or {}

	for slot7 = #slot3, 1, -1 do
		if not slot2[slot3[slot7]] or not slot8:isUnlock() or slot8:isLegalToFight() ~= true then
			table.remove(slot3, slot7)
		end
	end

	slot4[FleetType.Normal] = _.filter(slot3, function (slot0)
		return uv0[slot0]:getFleetType() == FleetType.Normal
	end)
	slot4[FleetType.Submarine] = _.filter(slot3, function (slot0)
		return uv0[slot0]:getFleetType() == FleetType.Submarine
	end)
	slot6 = slot0:getConfig("submarine_num")

	for slot10 = #({})[FleetType.Normal], slot0:getConfig("group_num") + 1, -1 do
		table.remove(slot4[FleetType.Normal], slot10)
	end

	for slot10 = #slot4[FleetType.Submarine], slot6 + 1, -1 do
		table.remove(slot4[FleetType.Submarine], slot10)
	end

	for slot10, slot11 in pairs(slot4) do
		if #slot11 == 0 then
			slot12 = 0

			if slot10 == FleetType.Normal then
				slot12 = slot5
			elseif slot10 == FleetType.Submarine then
				slot12 = slot6
			end

			for slot16, slot17 in pairs(slot2) do
				if slot12 <= #slot11 then
					break
				end

				if slot17 and slot17:getFleetType() == slot10 and slot17:isUnlock() and slot17:isLegalToFight() == true then
					table.insert(slot11, slot16)
				end
			end
		end
	end

	slot3 = {}

	for slot10, slot11 in pairs(slot4) do
		for slot15, slot16 in ipairs(slot11) do
			table.insert(slot3, slot16)
		end
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0 < slot1
	end)

	return slot3
end

function slot0.isEliteChapter(slot0)
	slot3.id = slot0:getConfig("map")

	return Map.New({}):getConfig("type") == Map.ELITE
end

function slot0.getInEliteShipIDs(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.eliteFleetList) do
		for slot10, slot11 in ipairs(slot6) do
			slot1[#slot1 + 1] = slot11
		end
	end

	return slot1
end

function slot0.isActivity(slot0)
	slot3.id = slot0:getConfig("map")
	slot2 = Map.New({})

	return Map.New():isActivity()
end

function slot0.activeAlways(slot0)
	if slot0:isActivity() and type(pg.activity_template[slot0:getConfig("act_id")].config_client) == "table" then
		return table.contains(slot2.config_client.prevs or {}, slot0.id)
	end

	return false
end

function slot0.getPrevChapterName(slot0)
	slot1 = ""

	if slot0:getConfig("pre_chapter") ~= 0 then
		slot1 = slot0:bindConfigTable()[slot2].chapter_name
	end

	return slot1
end

function slot0.getMapType(slot0)
	return pg.expedition_data_by_map[slot0:getConfig("map")].type
end

function slot0.getMaxColumnByRow(slot0, slot1)
	slot2 = -1

	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.row == slot1 then
			slot2 = math.max(slot2, slot7.column)
		end
	end

	return slot2
end

function slot0.withNpc(slot0)
	_.any(slot0.fleets, function (slot0)
		if slot0.npcShip then
			uv0 = _.detect(slot0:getShips(true), function (slot0)
				return slot0.id == uv0.npcShip.id
			end)
		end

		return uv0 ~= nil
	end)

	return Clone(nil)
end

function slot0.getDefeatStory(slot0, slot1)
	if #slot0:getConfig("defeat_story_count") <= 0 then
		return nil
	end

	slot4 = slot3

	while slot4 > 0 do
		if slot2[slot4] <= slot1 then
			break
		end

		slot4 = slot4 - 1
	end

	return slot0:getConfig("defeat_story")[slot4]
end

slot1 = {
	cell = 3,
	fleet = 1,
	champion = 2
}
slot2 = {
	"fleet",
	"champion",
	"cell"
}
slot3 = {}

function slot4(slot0, slot1)
	slot2 = uv0[slot1]

	if slot1 and not uv0[slot1] then
		return
	end

	slot2 = slot2 or 0

	for slot6 = slot2 + 1, #uv1, 1 do
		if slot0[uv1[slot6]] then
			return uv1[slot6]
		end
	end
end

slot3.__index = slot3

function slot3.__pairs(slot0, slot1)
	return uv0, slot0, slot1
end

function slot0.GetObjectsInCell(slot0, slot1, slot2)
	slot3.fleet = slot0:getFleet(nil, slot1, slot2)
	slot3.champion = slot0:getChampion(slot1, slot2)
	slot3.cell = slot0:getChapterCell(slot1, slot2)

	return setmetatable({}, uv0)
end

function slot0.getFleet(slot0, slot1, slot2, slot3)
	return _.detect(slot0.fleets, function (slot0)
		return slot0.line.row == uv0 and slot0.line.column == uv1 and (not uv2 or slot0:getFleetType() == uv2) and slot0:isValid()
	end) or _.detect(slot0.fleets, function (slot0)
		return slot0.line.row == uv0 and slot0.line.column == uv1 and (not uv2 or slot0:getFleetType() == uv2)
	end)
end

function slot0.getFleetIndex(slot0, slot1, slot2, slot3)
	if slot0:getFleet(slot1, slot2, slot3) then
		return table.indexof(slot0.fleets, slot4)
	end
end

function slot0.getOni(slot0)
	return _.detect(slot0.champions, function (slot0)
		return slot0.attachment == ChapterConst.AttachOni
	end)
end

function slot0.getChampion(slot0, slot1, slot2)
	champion = _.detect(slot0.champions, function (slot0)
		return slot0.row == uv0 and slot0.column == uv1
	end)

	return champion
end

function slot0.getChampionIndex(slot0, slot1, slot2)
	if slot0:getChampion(slot1, slot2) then
		return table.indexof(slot0.champions, slot3)
	end
end

function slot0.getChampionVisibility(slot0, slot1, slot2, slot3)
	slot2 = slot2 or slot1.row
	slot3 = slot3 or slot1.column

	return slot1.flag == 0
end

function slot0.mergeChampion(slot0, slot1)
	if slot0:getChampionIndex(slot1.row, slot1.column) then
		slot0.champions[slot2] = slot1

		return true
	else
		slot1.trait = ChapterConst.TraitLurk

		table.insert(slot0.champions, slot1)

		return false
	end
end

function slot0.mergeChampionImmediately(slot0, slot1)
	if slot0:getChampionIndex(slot1.row, slot1.column) then
		slot0.champions[slot2] = slot1

		return true
	else
		table.insert(slot0.champions, slot1)

		return false
	end
end

function slot0.RemoveChampion(slot0, slot1)
	if table.indexof(slot0.champions, slot1) then
		table.remove(slot0.champions, slot2)
	end
end

function slot0.considerAsObstacle(slot0, slot1, slot2, slot3)
	if not slot0:getChapterCell(slot2, slot3) or not slot4:IsWalkable(slot1) then
		return true
	end

	if slot0:existBarrier(slot2, slot3) then
		return true
	end

	if slot1 == ChapterConst.SubjectPlayer then
		if slot4.flag == 0 then
			if slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachBoss or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachAreaBoss or slot4.attachment == ChapterConst.AttachBomb_Enemy then
				return true
			end

			if slot4.attachment == ChapterConst.AttachBox and pg.box_data_template[slot4.attachmentId].type == ChapterConst.BoxTorpedo then
				return true
			end

			if slot4.attachment == ChapterConst.AttachStory then
				return true
			end
		end

		if slot0:existChampion(slot2, slot3) then
			return true
		end
	elseif slot1 == ChapterConst.SubjectChampion and slot0:existFleet(FleetType.Normal, slot2, slot3) then
		return true
	end

	return false
end

function slot0.considerAsStayPoint(slot0, slot1, slot2, slot3)
	if not slot0:getChapterCell(slot2, slot3) or not slot4:IsWalkable() then
		return false
	end

	if slot0:existBarrier(slot2, slot3) then
		return false
	end

	if slot1 == ChapterConst.SubjectPlayer then
		if slot4.flag == 0 and slot4.attachment == ChapterConst.AttachStory then
			return true
		end

		if slot4.attachment == ChapterConst.AttachLandbase and slot4.attachmentId == ChapterConst.LBIDHarbor then
			return false
		end

		if slot0:existFleet(FleetType.Normal, slot2, slot3) then
			return false
		end

		if slot0:existOni(slot2, slot3) then
			return false
		end

		if slot0:existBombEnemy(slot2, slot3) then
			return false
		end
	elseif slot1 == ChapterConst.SubjectChampion then
		if slot4.flag ~= 1 and slot4.attachment ~= ChapterConst.AttachNone then
			return false
		end

		if slot0:getChampion(slot2, slot3) and slot5.flag ~= 1 then
			return false
		end
	end

	return true
end

function slot0.existAny(slot0, slot1, slot2)
	if slot0:getChapterCell(slot1, slot2).attachment ~= ChapterConst.AttachNone and slot3.flag == 0 then
		return true
	end

	if slot0:existFleet(nil, slot1, slot2) then
		return true
	end

	if slot0:existChampion(slot1, slot2) then
		return true
	end
end

function slot0.existBarrier(slot0, slot1, slot2)
	if slot0:getChapterCell(slot1, slot2).attachment == ChapterConst.AttachBox and slot3.flag == 0 and pg.box_data_template[slot3.attachmentId].type == ChapterConst.BoxBarrier then
		return true
	end

	if slot3.attachment == ChapterConst.AttachStory and slot3.flag == 3 and pg.map_event_template[slot3.attachmentId].type == ChapterConst.StoryObstacle then
		return true
	end

	if slot0:getChampion(slot1, slot2) and slot4.flag ~= 1 and pg.expedition_data_template[slot4.attachmentId] and slot5.type == 97 then
		return true
	end

	return false
end

function slot0.existEnemy(slot0, slot1, slot2, slot3)
	if slot1 == ChapterConst.SubjectPlayer then
		if slot0:getChapterCell(slot2, slot3) and slot4.flag == 0 and (slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachBoss or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachAreaBoss or slot4.attachment == ChapterConst.AttachBomb_Enemy) then
			return true, slot4.attachment
		end

		if slot0:existChampion(slot2, slot3) then
			return true, ChapterConst.AttachChampion
		end
	elseif slot1 == ChapterConst.SubjectChampion and (slot0:existFleet(FleetType.Normal, slot2, slot3) or slot0:existFleet(FleetType.Transport, slot2, slot3)) then
		return true
	end
end

function slot0.existFleet(slot0, slot1, slot2, slot3)
	if _.any(slot0.fleets, function (slot0)
		return slot0.line.row == uv0 and slot0.line.column == uv1 and (not uv2 or slot0:getFleetType() == uv2) and slot0:isValid()
	end) then
		return true
	end
end

function slot0.existChampion(slot0, slot1, slot2)
	if _.any(slot0.champions, function (slot0)
		if slot0.flag == 0 and slot0.row == uv0 and slot0.column == uv1 then
			slot1 = uv2
			slot1 = uv2:getChampionVisibility(slot0)
		else
			slot1 = false

			if false then
				slot1 = true
			end
		end

		return slot1
	end) then
		return true
	end
end

function slot0.existAlly(slot0, slot1)
	return _.any(slot0.fleets, function (slot0)
		return slot0.id ~= uv0.id and slot0.line.row == uv0.line.row and slot0.line.column == uv0.line.column and slot0:isValid()
	end)
end

function slot0.existOni(slot0, slot1, slot2)
	return _.any(slot0.champions, function (slot0)
		return slot0.attachment == ChapterConst.AttachOni and slot0.flag == 0 and (not uv0 or uv0 == slot0.row) and (not uv1 or uv1 == slot0.column)
	end)
end

function slot0.existBombEnemy(slot0, slot1, slot2)
	if slot1 and slot2 then
		return slot0:getChapterCell(slot1, slot2).attachment == ChapterConst.AttachBomb_Enemy and slot3.flag == 0
	end

	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.attachment == ChapterConst.AttachBomb_Enemy and slot7.flag == 0 and (not slot1 or slot1 == slot7.row) and (not slot2 or slot2 == slot7.column) then
			return true
		end
	end

	return false
end

function slot0.isPlayingWithBombEnemy(slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		if slot5.attachment == ChapterConst.AttachBomb_Enemy then
			return true
		end
	end

	return false
end

function slot0.existCoastalGunNoMatterLiveOrDead(slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		if slot5.attachment == ChapterConst.AttachLandbase and pg.land_based_template[slot5.attachmentId].type == ChapterConst.LBCoastalGun then
			return true
		end
	end

	return false
end

function slot0.calcWalkableCells(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot9 = 0, ChapterConst.MaxRow - 1, 1 do
		if not slot5[slot9] then
			slot5[slot9] = {}
		end

		for slot13 = 0, ChapterConst.MaxColumn - 1, 1 do
			slot5[slot9][slot13] = slot0.cells[ChapterCell.Line2Name(slot9, slot13)] and slot15:IsWalkable(slot1)
		end
	end

	slot6 = {}

	if slot1 == ChapterConst.SubjectPlayer then
		for slot11, slot12 in ipairs(slot0:getCoastalGunArea()) do
			slot6[slot12.row .. "_" .. slot12.column] = true
		end
	end

	slot7 = {}
	slot8 = {}
	slot9.row = slot2
	slot9.column = slot3
	slot8[1] = {
		step = 0
	}
	slot9 = {}

	while #slot8 > 0 do
		table.insert(slot9, table.remove(slot8, 1))

		slot11[1] = {
			row = 1,
			column = 0
		}
		slot11[2] = {
			row = -1,
			column = 0
		}
		slot11[3] = {
			row = 0,
			column = 1
		}
		slot11[4] = {
			row = 0,
			column = -1
		}

		_.each({}, function (slot0)
			slot0.row = uv0.row + slot0.row
			slot0.column = uv0.column + slot0.column
			slot0.step = uv0.step + 1

			if slot0.row >= 0 and slot0.row < ChapterConst.MaxRow and slot0.column >= 0 and slot0.column < ChapterConst.MaxColumn and slot0.step <= uv1 and not (_.any(uv2, function (slot0)
				return slot0.row == uv0.row and slot0.column == uv0.column
			end) or _.any(uv3, function (slot0)
				return slot0.row == uv0.row and slot0.column == uv0.column
			end)) and uv4[slot0.row][slot0.column] then
				table.insert(uv5, slot0)

				slot2 = uv6

				if not uv6:existEnemy(uv7, slot0.row, slot0.column) then
					slot2 = uv6

					if not uv6:existBarrier(slot0.row, slot0.column) and not uv8[slot0.row .. "_" .. slot0.column] then
						table.insert(uv2, slot0)
					end
				end
			end
		end)
	end

	return _.filter(slot7, function (slot0)
		if slot0.row ~= uv0 or slot0.column ~= uv1 then
			slot1 = uv2
			slot1 = uv2:considerAsStayPoint(uv3, slot0.row, slot0.column)

			if uv2:considerAsStayPoint(uv3, slot0.row, slot0.column) then
				slot1 = false
			end
		else
			slot1 = true
		end

		return slot1
	end)
end

function slot0.calcAreaCells(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot9 = 0, ChapterConst.MaxRow - 1, 1 do
		if not slot5[slot9] then
			slot5[slot9] = {}
		end

		for slot13 = 0, ChapterConst.MaxColumn - 1, 1 do
			slot5[slot9][slot13] = slot0.cells[ChapterCell.Line2Name(slot9, slot13)] and slot15:IsWalkable()
		end
	end

	slot6 = {}
	slot7 = {}
	slot8.row = slot1
	slot8.column = slot2
	slot7[1] = {
		step = 0
	}
	slot8 = {}

	while #slot7 > 0 do
		table.insert(slot8, table.remove(slot7, 1))

		slot10[1] = {
			row = 1,
			column = 0
		}
		slot10[2] = {
			row = -1,
			column = 0
		}
		slot10[3] = {
			row = 0,
			column = 1
		}
		slot10[4] = {
			row = 0,
			column = -1
		}

		_.each({}, function (slot0)
			slot0.row = uv0.row + slot0.row
			slot0.column = uv0.column + slot0.column
			slot0.step = uv0.step + 1

			if slot0.row >= 0 and slot0.row < ChapterConst.MaxRow and slot0.column >= 0 and slot0.column < ChapterConst.MaxColumn and slot0.step <= uv1 and not (_.any(uv2, function (slot0)
				return slot0.row == uv0.row and slot0.column == uv0.column
			end) or _.any(uv3, function (slot0)
				return slot0.row == uv0.row and slot0.column == uv0.column
			end)) then
				table.insert(uv2, slot0)

				if uv4[slot0.row][slot0.column] and uv5 <= slot0.step then
					table.insert(uv6, slot0)
				end
			end
		end)
	end

	return slot6
end

function slot0.calcSquareBarrierCells(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8 = -slot3, slot3, 1 do
		for slot12 = -slot3, slot3, 1 do
			if slot0:getChapterCell(slot1 + slot8, slot2 + slot12) and slot15:IsWalkable() and (slot0:existBarrier(slot13, slot14) or not slot0:existAny(slot13, slot14)) then
				slot18.row = slot13
				slot18.column = slot14

				table.insert(slot4, {})
			end
		end
	end

	return slot4
end

function slot0.checkAnyInteractive(slot0)
	slot1 = slot0.fleet.line
	slot2 = slot0:getChapterCell(slot1.row, slot1.column)
	slot3 = false
	slot4 = slot0.fleet

	if slot4:getFleetType() == FleetType.Normal then
		if slot0:existEnemy(ChapterConst.SubjectPlayer, slot2.row, slot2.column) then
			if slot0:getRound() == ChapterConst.RoundPlayer then
				slot3 = true
			end
		elseif slot2.attachment == ChapterConst.AttachAmbush or slot2.attachment == ChapterConst.AttachBox then
			if slot2.flag ~= 1 then
				slot3 = true
			end
		elseif slot2.attachment == ChapterConst.AttachStory then
			slot3 = slot2.flag == 0
		elseif slot2.attachment == ChapterConst.AttachSupply and slot2.attachmentId > 0 then
			slot4, slot5 = slot0:getFleetAmmo(slot0.fleet)

			if slot5 < slot4 then
				slot3 = true
			end
		elseif slot2.attachment == ChapterConst.AttachBox and slot2.flag ~= 1 then
			slot3 = true
		end
	end

	return slot3
end

function slot0.calcAttachmenArea(slot0, slot1)
	slot2 = slot0.theme
	slot3 = ChapterConst.MaxRow + 1
	slot4 = -1
	slot5 = ChapterConst.MaxColumn + 1
	slot6 = -1

	for slot10, slot11 in pairs(slot0.cells) do
		if slot11.attachment == slot1 then
			slot3 = math.min(slot3, slot11.row)
			slot4 = math.max(slot4, slot11.row)
			slot5 = math.min(slot5, slot11.column)
			slot6 = math.max(slot6, slot11.column)
		end
	end

	slot8 = Vector2(slot6 - slot5 + 1, slot4 - slot3 + 1)
	slot8.x = slot8.x * (slot2.cellSize.x + slot2.cellSpace.x) - slot2.cellSpace.x
	slot8.y = slot8.y * (slot2.cellSize.y + slot2.cellSpace.y) - slot2.cellSpace.y

	return slot3, slot4, slot5, slot6, Vector2((slot5 - slot6) * 0.5 * (slot2.cellSize.x + slot2.cellSpace.x), (slot4 - slot3) * 0.5 * (slot2.cellSize.y + slot2.cellSpace.y)), slot8
end

function slot0.getQuadCellPic(slot0, slot1)
	slot2 = nil

	if slot1.trait == ChapterConst.TraitLurk then
		-- Nothing
	elseif (slot1.attachment == ChapterConst.AttachEnemy or slot1.attachment == ChapterConst.AttachElite or slot1.attachment == ChapterConst.AttachAmbush or slot1.attachment == ChapterConst.AttachBoss or slot1.attachment == ChapterConst.AttachRival or slot1.attachment == ChapterConst.AttachAreaBoss or slot1.attachment == ChapterConst.AttachBomb_Enemy) and slot1.flag == 0 then
		slot2 = "cell_enemy"
	elseif slot1.attachment == ChapterConst.AttachBox and slot1.flag == 0 then
		if pg.box_data_template[slot1.attachmentId].type == ChapterConst.BoxDrop or slot3.type == ChapterConst.BoxStrategy or slot3.type == ChapterConst.BoxSupply or slot3.type == ChapterConst.BoxEnemy then
			slot2 = "cell_box"
		elseif slot3.type == ChapterConst.BoxTorpedo then
			slot2 = "cell_enemy"
		elseif slot3.type == ChapterConst.BoxBarrier then
			slot2 = "cell_green"
		end
	elseif slot1.attachment == ChapterConst.AttachStory and slot1.data == ChapterConst.Story then
		if slot1.flag == 0 and pg.map_event_template[slot1.attachmentId].icon == "mapevent1" then
			slot2 = "cell_box"
		end
	elseif slot1.attachment == ChapterConst.AttachSupply and slot1.attachmentId > 0 then
		slot2 = "cell_box"
	elseif slot1.attachment == ChapterConst.AttachTransport_Target then
		slot2 = "cell_box"
	elseif slot1.attachment == ChapterConst.AttachLandbase and (slot1.attachmentId == ChapterConst.LBIDHarbor or slot1.attachmentId == ChapterConst.LBIDDock) then
		slot2 = "cell_box"
	end

	return slot2
end

function slot0.getMapShip(slot0, slot1)
	slot2 = nil

	if slot0:getDataType() == ChapterConst.TypeNone then
		if slot1:isValid() and not _.detect(slot1:getShips(false), function (slot0)
			return slot0.isNpc and slot0.hpRant > 0
		end) then
			if slot1:getFleetType() == FleetType.Normal then
				slot2 = slot1:getShipsByTeam(TeamType.Main, false)[1]
			elseif slot4 == FleetType.Submarine then
				slot2 = slot1:getShipsByTeam(TeamType.Submarine, false)[1]
			end
		end
	elseif slot3 == ChapterConst.TypeSham then
		slot2 = slot1[TeamType.Main][1]
	elseif slot3 == ChapterConst.TypeGuild then
		slot2 = slot1[TeamType.Main][1]
	end

	return slot2
end

function slot0.getTorpedoShip(slot0, slot1)
	slot2 = nil

	if slot1:getFleetType() == FleetType.Submarine then
		slot2 = slot1:getShipsByTeam(TeamType.Submarine, false)[1]
	elseif slot1:getFleetType() == FleetType.Normal then
		slot2 = _.detect(slot1:getShipsByTeam(TeamType.Vanguard, false), function (slot0)
			return slot0:getShipType() == ShipType.QuZhu
		end)
	end

	return slot2
end

function slot0.getCVship(slot0, slot1)
	slot2 = nil

	if slot1:getFleetType() == FleetType.Normal then
		slot2 = _.detect(slot1:getShipsByTeam(TeamType.Main, false), function (slot0)
			return table.contains(ShipType.BundleList[ShipType.BundleAircraftCarrier], slot0:getShipType())
		end)
	end

	return slot2
end

function slot0.getBBship(slot0, slot1)
	slot2 = nil

	if slot1:getFleetType() == FleetType.Normal then
		slot2 = _.detect(slot1:getShipsByTeam(TeamType.Main, false), function (slot0)
			return table.contains(ShipType.BundleList[ShipType.BundleBattleShip], slot0:getShipType())
		end)
	end

	return slot2
end

function slot0.GetSubmarineFleet(slot0)
	for slot4, slot5 in pairs(slot0.fleets) do
		if slot5:getFleetType() == FleetType.Submarine and slot5:isValid() then
			return slot5, slot4
		end
	end
end

function slot0.getStageCell(slot0, slot1, slot2)
	if slot0:getChampion(slot1, slot2) and slot3.flag ~= 1 then
		return slot3
	end

	if slot0:getChapterCell(slot1, slot2) and slot4.flag ~= 1 then
		return slot4
	end
end

function slot0.getStageId(slot0, slot1, slot2)
	if slot0:getChampion(slot1, slot2) and slot3.flag ~= 1 then
		return slot3.id
	end

	if slot0:getChapterCell(slot1, slot2) and slot4.flag ~= 1 then
		return slot4.attachmentId
	end
end

function slot0.getStageExtraAwards(slot0)
	if slot0:getPlayType() == ChapterConst.TypeMainSub then
		slot1 = _.filter(pg.expedition_data_by_map.all, function (slot0)
			return type(pg.expedition_data_by_map[slot0].drop_by_map_display) == "table" and #slot1 > 0
		end)

		if pg.expedition_data_by_map[slot1[math.min(#slot1, slot0.awardIndex)]] then
			return slot2.drop_by_map_display[table.indexof(slot1, slot0:getConfig("map"))]
		end
	end
end

function slot0.GetExtraCostRate(slot0)
	return math.max(1, 1), {}
end

function slot0.getFleetCost(slot0, slot1)
	if slot0:getPlayType() == ChapterConst.TypeExtra then
		return {
			gold = 0,
			oil = 0
		}, {
			gold = 0,
			oil = 0
		}
	end

	return slot1:getCost(slot0:GetExtraCostRate())
end

function slot0.GetWinConditions(slot0)
	return slot0.winConditions
end

function slot0.GetLoseConditions(slot0)
	return slot0.loseConditions
end

function slot0.CanQuickPlay(slot0)
	return pg.chapter_setting[slot0.id] and slot1.expedite > 0
end

function slot0.GetQuickPlayFlag(slot0)
	return PlayerPrefs.GetInt("chapter_quickPlay_flag_" .. slot0.id, 0) == 1
end

function slot0.writeDrops(slot0, slot1)
	_.each(slot1, function (slot0)
		if slot0.dropType == DROP_TYPE_SHIP and not table.contains(uv0.dropShipIdList, slot0.id) then
			table.insert(uv0.dropShipIdList, slot0.id)
		end
	end)
end

function slot0.writeBack(slot0, slot1, slot2)
	function slot4(slot0)
		if uv0.statistics[slot0.id] then
			slot0.hpRant = slot1.bp
		end
	end

	for slot8, slot9 in pairs(slot0.fleet.ships) do
		slot4(slot9)
	end

	slot3.restAmmo = math.max(slot3.restAmmo - 1, 0)

	if slot2.statistics.submarineAid then
		if _.detect(slot0.fleets, function (slot0)
			return slot0:getFleetType() == FleetType.Submarine and slot0:isValid()
		end) and not slot5:inHuntingRange(slot3.line.row, slot3.line.column) then
			slot5:consumeOneStrategy(ChapterConst.StrategyCallSubOutofRange)
		end

		if slot5 then
			for slot9, slot10 in pairs(slot5.ships) do
				slot4(slot10)
			end

			slot5.restAmmo = math.max(slot5.restAmmo - 1, 0)
		end
	end

	slot0:UpdateComboHistory(slot2.statistics._battleScore)

	slot5 = nil

	if slot1 then
		if _.detect(slot0.champions, function (slot0)
			return slot0.id == uv0.stageId and slot0.row == uv1.line.row and slot0.column == uv1.line.column and slot0.flag ~= 1
		end) then
			slot6:Iter()

			slot5 = slot6.attachment
		else
			slot7 = slot0:getChapterCell(slot3.line.row, slot3.line.column)
			slot7.flag = 1

			slot0:updateChapterCell(slot7)

			slot5 = slot7.attachment
		end

		if slot5 == ChapterConst.AttachEnemy or slot5 == ChapterConst.AttachElite or slot5 == ChapterConst.AttachChampion then
			if (not slot6 or slot6.flag == 1) and _.detect(slot0.achieves, function (slot0)
				return slot0.type == ChapterConst.AchieveType2
			end) then
				slot7.count = slot7.count + 1
			end
		elseif slot5 == ChapterConst.AttachBoss and _.detect(slot0.achieves, function (slot0)
			return slot0.type == ChapterConst.AchieveType1
		end) then
			slot7.count = slot7.count + 1
		end

		if slot0:CheckChapterWin() then
			slot7 = pg.TrackerMgr.GetInstance()

			slot7:Tracking(TRACKING_KILL_BOSS)
			_.each(slot0.achieves, function (slot0)
				if slot0.type == ChapterConst.AchieveType3 then
					if _.all(_.values(uv0.cells), function (slot0)
						if slot0.attachment == ChapterConst.AttachEnemy or slot0.attachment == ChapterConst.AttachElite or slot0.attachment == ChapterConst.AttachBoss or slot0.attachment == ChapterConst.AttachBox and pg.box_data_template[slot0.attachmentId].type == ChapterConst.BoxEnemy then
							return slot0.flag == 1
						end

						return true
					end) and _.all(uv0.champions, function (slot0)
						return slot0.flag == 1
					end) then
						slot0.count = slot0.count + 1
					end
				elseif slot0.type == ChapterConst.AchieveType4 then
					if uv0.orignalShipCount <= slot0.config then
						slot0.count = slot0.count + 1
					end
				elseif slot0.type == ChapterConst.AchieveType5 then
					slot2 = uv0

					if not _.any(slot2:getShips(), function (slot0)
						return slot0:getShipType() == uv0.config
					end) then
						slot0.count = slot0.count + 1
					end
				elseif slot0.type == ChapterConst.AchieveType6 then
					slot2 = uv0.scoreHistory[1] or 0
					slot2 = math.max
					slot0.count = slot2((uv0.scoreHistory[0] or 0) + slot2 <= 0 and uv0.combo or 0, slot0.count or 0)
				end
			end)

			if slot0.progress == 100 then
				slot0.passCount = slot0.passCount + 1
			end

			slot0.progress = math.min(slot0.progress + slot0:getConfig("progress_boss"), 100)
			slot0.defeatCount = slot0.defeatCount + 1

			if not slot0:isActivity() then
				if slot0:getMapType() == Map.ELITE then
					slot8 = pg.TrackerMgr.GetInstance()

					slot8:Tracking(TRACKING_HARD_CHAPTER, slot0.id)
				elseif slot7 == Map.SCENARIO then
					if slot0.progress == 100 and slot0.passCount == 0 then
						slot8 = pg.TrackerMgr.GetInstance()

						slot8:Tracking(TRACKING_HIGHEST_CHAPTER, slot0.id)
					end

					if slot0.defeatCount == 1 then
						if slot0.id == 1204 then
							slot8 = pg.TrackerMgr.GetInstance()

							slot8:Tracking(TRACKING_FIRST_PASS_12_4)
						elseif slot0.id == 1301 then
							slot8 = pg.TrackerMgr.GetInstance()

							slot8:Tracking(TRACKING_FIRST_PASS_13_1)
						elseif slot0.id == 1302 then
							slot8 = pg.TrackerMgr.GetInstance()

							slot8:Tracking(TRACKING_FIRST_PASS_13_2)
						elseif slot0.id == 1303 then
							slot8 = pg.TrackerMgr.GetInstance()

							slot8:Tracking(TRACKING_FIRST_PASS_13_3)
						elseif slot0.id == 1304 then
							slot8 = pg.TrackerMgr.GetInstance()

							slot8:Tracking(TRACKING_FIRST_PASS_13_4)
						end
					end
				end
			end
		end

		if not slot6 or slot6.flag == 1 then
			slot0:RemoveChampion(slot6)

			slot3.defeatEnemies = slot3.defeatEnemies + 1
			slot0.defeatEnemies = slot0.defeatEnemies + 1
		end

		if slot0:getPlayType() == ChapterConst.TypeMainSub and slot5 == ChapterConst.AttachBoss and slot2.statistics._battleScore == ys.Battle.BattleConst.BattleScore.S then
			slot10 = getProxy(ChapterProxy)
			slot10.subProgress = math.max(slot10.subProgress, table.indexof(_.filter(pg.expedition_data_by_map.all, function (slot0)
				return type(pg.expedition_data_by_map[slot0].drop_by_map_display) == "table" and #slot1 > 0
			end), slot0:getConfig("map")) + 1)
		end
	end

	if slot5 ~= ChapterConst.AttachBoss then
		slot6 = getProxy(ChapterProxy)
		slot9.score = slot2.statistics._battleScore
		slot10.row = slot3.line.row
		slot10.column = slot3.line.column
		slot9.line = {}
		slot9.type = slot5

		slot6:RecordLastDefeatedEnemy(slot0.id, {})
	end
end

function slot0.UpdateComboHistory(slot0, slot1)
	slot5.scoreHistory = Clone(slot0.scoreHistory)
	slot5.combo = Clone(slot0.combo)

	getProxy(ChapterProxy):RecordComboHistory(slot0.id, {})

	slot0.scoreHistory = slot0.scoreHistory or {}
	slot0.scoreHistory[slot1] = (slot0.scoreHistory[slot1] or 0) + 1

	if slot1 <= ys.Battle.BattleConst.BattleScore.C then
		slot0.combo = 0
	else
		slot0.combo = (slot0.combo or 0) + 1
	end
end

function slot0.CheckChapterWin(slot0)
	slot1 = slot0:CheckTransportState()
	slot3 = false
	slot4 = ChapterConst.ReasonVictory

	for slot8, slot9 in pairs(slot0:GetWinConditions()) do
		if slot9.type == 1 then
			_.each(slot0:findChapterCells(ChapterConst.AttachBoss), function (slot0)
				if slot0 and slot0.flag == 1 then
					uv0 = uv0 + 1
				end
			end)

			slot3 = slot3 or slot9.param <= 0
		elseif slot9.type == 2 then
			slot3 = slot3 or slot9.param <= slot0:GetDefeatCount()
		elseif slot9.type == 3 then
			slot3 = slot3 or slot1 == 1
		elseif slot9.type == 4 then
			slot3 = slot3 or slot9.param < slot0:getRoundNum()
		elseif slot9.type == 5 then
			slot10 = slot9.param
			slot3 = slot3 or not (_.any(slot0.champions, function (slot0)
				slot1 = slot0.attachmentId == uv0

				for slot5, slot6 in pairs(slot0.idList) do
					slot1 = slot1 or slot6 == uv0
				end

				return slot1 and slot0.flag ~= 1
			end) or _.any(slot0.cells, function (slot0)
				return slot0.attachmentId == uv0 and slot0.flag ~= 1
			end))
		elseif slot9.type == 6 then
			slot10 = slot9.param
			slot3 = slot3 or _.any(slot0.fleets, function (slot0)
				return slot0:getFleetType() == FleetType.Normal and slot0:isValid() and slot0.line.row == uv0[1] and slot0.line.column == uv0[2]
			end)
		end

		if slot3 then
			break
		end
	end

	return slot3, slot4
end

function slot0.CheckChapterLose(slot0)
	slot1 = slot0:CheckTransportState()
	slot3 = false
	slot4 = ChapterConst.ReasonDefeat

	for slot8, slot9 in pairs(slot0:GetLoseConditions()) do
		if slot9.type == 1 then
			slot3 = slot3 or not _.any(slot0.fleets, function (slot0)
				return slot0:getFleetType() == FleetType.Normal and slot0:isValid()
			end)
		elseif slot9.type == 2 then
			slot4 = (slot3 or slot0.BaseHP <= 0) and ChapterConst.ReasonDefeatDefense
		end

		if slot3 then
			break
		end
	end

	if slot0:getPlayType() == ChapterConst.TypeTransport then
		slot3 = slot3 or slot1 == -1
	end

	return slot3, slot4
end

function slot0.triggerSkill(slot0, slot1, slot2)
	slot3 = _.filter(slot1:findSkills(slot2), function (slot0)
		return _.any(slot0:GetTriggers(), function (slot0)
			return slot0[1] == FleetSkill.TriggerInSubTeam and slot0[2] == 1
		end) == (uv0:getFleetType() == FleetType.Submarine) and _.all(slot0:GetTriggers(), function (slot0)
			return uv0:triggerCheck(uv1, uv2, slot0)
		end)
	end)

	return _.reduce(slot3, nil, function (slot0, slot1)
		slot3 = slot1:GetArgs()

		if slot1:GetType() == FleetSkill.TypeMoveSpeed or slot2 == FleetSkill.TypeHuntingLv or slot2 == FleetSkill.TypeTorpedoPowerUp then
			return (slot0 or 0) + slot3[1]
		elseif slot2 == FleetSkill.TypeAmbushDodge or slot2 == FleetSkill.TypeAirStrikeDodge then
			return math.max(slot0 or 0, slot3[1])
		elseif slot2 == FleetSkill.TypeAttack or slot2 == FleetSkill.TypeStrategy then
			slot0 = slot0 or {}

			table.insert(slot0, slot3)

			return slot0
		elseif slot2 == FleetSkill.TypeBattleBuff then
			slot0 = slot0 or {}

			table.insert(slot0, slot3[1])

			return slot0
		end
	end), slot3
end

function slot0.triggerCheck(slot0, slot1, slot2, slot3)
	if slot3[1] == FleetSkill.TriggerDDCount then
		return slot3[2] <= #_.filter(slot1:getShipsByTeam(TeamType.Vanguard, false), function (slot0)
			return slot0:getShipType() == ShipType.QuZhu
		end) and slot6 <= slot3[3]
	elseif slot4 == FleetSkill.TriggerDDHead then
		if #slot1:getShipsByTeam(TeamType.Vanguard, false) > 0 then
			return slot5[1]:getShipType() == ShipType.QuZhu
		end
	elseif slot4 == FleetSkill.TriggerVanCount then
		return slot3[2] <= #slot1:getShipsByTeam(TeamType.Vanguard, false) and #slot5 <= slot3[3]
	elseif slot4 == FleetSkill.TriggerShipCount then
		return slot3[3] <= #_.filter(slot1:getShips(false), function (slot0)
			return table.contains(uv0[2], slot0:getShipType())
		end) and #slot5 <= slot3[4]
	else
		if slot4 == FleetSkill.TriggerAroundEnemy then
			slot5 = {
				row = slot1.line.row,
				column = slot1.line.column
			}

			return _.any(_.values(slot0.cells), function (slot0)

				-- Decompilation error in this vicinity:
				slot1 = uv0
				slot1 = uv0
				slot1 = uv0

				if slot1:existChampion(slot0.row, slot0.column) then
					slot1 = uv0
					slot1 = slot1:getChampion(slot0.row, slot0.column)

					if not slot1:getConfig("type") then
						slot1 = uv0:existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) and pg.expedition_data_template[slot0.attachmentId].type or nil
					end
				end

				slot4.row = slot0.row
				slot4.column = slot0.column

				return ManhattonDist(uv1, {}) <= uv2[2] and (type(uv2[3]) == "number" and uv2[3] == slot1 or type(uv2[3]) == "table" and table.contains(uv2[3], slot1))
			end)
			return
		end

		if slot4 == FleetSkill.TriggerNekoPos then
			slot5 = slot1:findCommanderBySkillId(slot2.id)

			for slot9, slot10 in pairs(slot1:getCommanders()) do
				if slot5.id == slot10.id and slot9 == slot3[2] then
					return true
				end
			end
		elseif slot4 == FleetSkill.TriggerAroundLand then
			slot5 = {
				row = slot1.line.row,
				column = slot1.line.column
			}

			return _.any(_.values(slot0.cells), function (slot0)
				slot3.row = slot0.row
				slot3.column = slot0.column

				return ManhattonDist(uv0, {}) <= uv1[2]
			end)
		elseif slot4 == FleetSkill.TriggerAroundCombatAlly then
			slot5 = {
				row = slot1.line.row,
				column = slot1.line.column
			}

			return _.any(slot0.fleets, function (slot0)

				-- Decompilation error in this vicinity:
				slot1 = uv1

				if slot1:existEnemy(ChapterConst.SubjectPlayer, slot0.line.row, slot0.line.column) then
					slot3.row = slot0.line.row
					slot3.column = slot0.line.column
					slot1 = ManhattonDist(uv2, {}) <= uv3[2]
				end

				return slot1
			end)
		elseif slot4 == FleetSkill.TriggerInSubTeam then
			return true
		end
	end
end

slot5 = {
	{
		1,
		0
	},
	{
		-1,
		0
	},
	{
		0,
		1
	},
	{
		0,
		-1
	}
}

function slot0.checkOniState(slot0)
	slot1 = slot0:getOni()

	if _.all(uv0, function (slot0)
		slot1 = {
			uv0.row + slot0[1],
			uv0.column + slot0[2]
		}
		slot2 = uv1

		if slot2:existFleet(FleetType.Normal, slot1[1], slot1[2]) then
			return true
		end

		slot2 = uv1

		if not slot2:getChapterCell(slot1[1], slot1[2]) or not slot2:IsWalkable() then
			return true
		end

		slot3 = uv1

		if slot3:existBarrier(slot2.row, slot2.column) then
			return true
		end
	end) then
		return 1
	end

	if _.any(slot0:getOniChapterInfo().escape_grids, function (slot0)
		return slot0[1] == uv0.row and slot0[2] == uv0.column
	end) then
		return 2
	end
end

function slot0.onOniEnter(slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		slot5.attachment = ChapterConst.AttachNone
		slot5.attachmentId = nil
		slot5.flag = nil
		slot5.data = nil
	end

	slot0.champions = {}
	slot0.modelCount = slot0:getOniChapterInfo().special_item
	slot0.roundIndex = 0
end

function slot0.onBombEnemyEnter(slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		slot5.attachment = ChapterConst.AttachNone
		slot5.attachmentId = nil
		slot5.flag = nil
		slot5.data = nil
	end

	slot0.champions = {}
	slot0.modelCount = 0
	slot0.roundIndex = 0
end

function slot0.clearSubmarineFleet(slot0)
	for slot4 = #slot0.fleets, 1, -1 do
		slot5 = slot0.fleets[slot4]

		if slot5:getFleetType() == FleetType.Submarine then
			table.remove(slot0.fleets, slot4)
		end
	end
end

function slot0.getOniChapterInfo(slot0)
	return pg.chapter_capture[slot0.id]
end

function slot0.getBombChapterInfo(slot0)
	return pg.chapter_boom[slot0.id]
end

function slot0.getSpAppearStory(slot0)
	if slot0:existOni() then
		for slot4, slot5 in ipairs(slot0.champions) do
			if slot5.trait == ChapterConst.TraitLurk and slot5.attachment == ChapterConst.AttachOni and slot5:getConfig("appear_story") and #slot6 > 0 then
				return slot6
			end
		end
	elseif slot0:isPlayingWithBombEnemy() then
		for slot4, slot5 in pairs(slot0.cells) do
			if slot5.attachment == ChapterConst.AttachBomb_Enemy and slot5.trait == ChapterConst.TraitLurk and pg.specialunit_template[slot5.attachmentId].appear_story and #slot6.appear_story > 0 then
				return slot6.appear_story
			end
		end
	end
end

function slot0.getSpAppearGuide(slot0)
	if slot0:existOni() then
		for slot4, slot5 in ipairs(slot0.champions) do
			if slot5.trait == ChapterConst.TraitLurk and slot5.attachment == ChapterConst.AttachOni and slot5:getConfig("appear_guide") and #slot6 > 0 then
				return slot6
			end
		end
	elseif slot0:isPlayingWithBombEnemy() then
		for slot4, slot5 in pairs(slot0.cells) do
			if slot5.attachment == ChapterConst.AttachBomb_Enemy and slot5.trait == ChapterConst.TraitLurk and pg.specialunit_template[slot5.attachmentId].appear_guide and #slot6.appear_guide > 0 then
				return slot6.appear_guide
			end
		end
	end
end

function slot0.CheckTransportState(slot0)
	if not _.detect(slot0.fleets, function (slot0)
		return slot0:getFleetType() == FleetType.Transport
	end) then
		return -1
	end

	slot2 = slot0:findChapterCell(ChapterConst.AttachTransport_Target)

	if not slot1:isValid() then
		return -1
	elseif slot1.line.row == slot2.row and slot1.line.column == slot2.column and not slot0:existEnemy(ChapterConst.SubjectPlayer, slot2.row, slot2.column) then
		return 1
	else
		return 0
	end
end

function slot0.getCoastalGunArea(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.cells) do
		if slot6.attachment == ChapterConst.AttachLandbase and slot6.flag ~= 1 and pg.land_based_template[slot6.attachmentId].type == ChapterConst.LBCoastalGun then
			slot8 = slot7.function_args
			slot9 = {
				math.abs(slot8[1]),
				math.abs(slot8[2])
			}
			slot9[MULTRES] = math.abs(slot8[2])
			slot10 = {
				Mathf.Sign(slot8[1]),
				Mathf.Sign(slot8[2])
			}
			slot10[MULTRES] = Mathf.Sign(slot8[2])

			for slot15 = 1, math.max(slot9[1], slot9[2]), 1 do
				slot18.row = slot6.row + math.min(slot9[1], slot15) * slot10[1]
				slot18.column = slot6.column + math.min(slot9[2], slot15) * slot10[2]

				table.insert(slot1, {})
			end
		end
	end

	return slot1
end

function slot0.GetAntiAirGunArea(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.attachment == ChapterConst.AttachLandbase and slot7.flag ~= 1 and pg.land_based_template[slot7.attachmentId].type == ChapterConst.LBAntiAir then
			function getIndex(slot0, slot1)
				return ChapterConst.MaxColumn * slot0 + slot1
			end

			slot11 = {}
			slot12 = {}

			if math.abs(slot8.function_args[1]) > 0 then
				slot11[getIndex(slot7.row, slot7.column)] = slot7
			end

			while next(slot11) do
				slot13 = next(slot11)
				slot11[slot13] = nil

				if math.abs(slot11[slot13].row - slot7.row) <= slot10 and math.abs(slot14.column - slot7.column) <= slot10 then
					slot12[slot13] = slot14

					for slot18 = 1, #uv0, 1 do
						if not slot12[getIndex(slot14.row + uv0[slot18][1], slot14.column + uv0[slot18][2])] then
							slot22.row = slot19
							slot22.column = slot20
							slot11[slot21] = {}
						end
					end
				end
			end

			for slot16, slot17 in pairs(slot12) do
				slot2[slot16] = slot17
			end
		end
	end

	for slot6, slot7 in pairs(slot2) do
		table.insert(slot1, slot7)
	end

	return slot1
end

function slot0.getNpcShipByType(slot0, slot1)
	slot2 = {}
	slot3 = getProxy(TaskProxy)

	function slot4(slot0)
		if slot0 == 0 then
			return true
		end

		slot1 = uv0

		return slot1:getTaskVO(slot0) and not slot1:isFinish()
	end

	for slot8, slot9 in ipairs(slot0:getConfig("npc_data")) do
		slot10 = pg.npc_squad_template[slot9]

		if not slot1 or slot1 == slot10.type and slot4(slot10.task_id) then
			for slot14, slot15 in ipairs({
				"vanguard_list",
				"main_list"
			}) do
				for slot19, slot20 in ipairs(slot10[slot15]) do
					slot24.id = slot20[1]
					slot24.configId = slot20[1]
					slot24.level = slot20[2]

					table.insert(slot2, NpcShip.New({}))
				end
			end
		end
	end

	return slot2
end

function slot0.GetDefeatCount(slot0)
	return slot0.defeatEnemies
end

function slot0.ExistDivingChampion(slot0)
	return _.any(slot0.champions, function (slot0)
		return slot0.flag == 5
	end)
end

function slot0.IsSkipPrecombat(slot0)
	if slot0:isLoop() then
		slot1 = getProxy(ChapterProxy)
		slot1 = slot1:GetSkipPrecombat()
	end

	return slot1
end

function slot0.getTodayDefeatCount(slot0)
	slot1 = getProxy(DailyLevelProxy)

	return slot1:getChapterDefeatCount(slot0.configId)
end

function slot0.isTriesLimit(slot0)
	return slot0:getConfig("count") and slot1 > 0
end

function slot0.updateTodayDefeatCount(slot0)
	slot1 = getProxy(DailyLevelProxy)

	slot1:updateChapterDefeatCount(slot0.configId)
end

function slot0.enoughTimes2Start(slot0)
	if slot0:isTriesLimit() then
		return slot0:getTodayDefeatCount() < slot0:getConfig("count")
	else
		return true
	end
end

return slot0
