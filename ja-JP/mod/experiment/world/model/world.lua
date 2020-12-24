slot0 = class("World", import("...BaseEntity"))
slot0.Fields = {
	achieveMapStar = "table",
	stepCount = "number",
	cdTimeList = "table",
	progress = "number",
	atlas = "table",
	portShips = "table",
	realm = "number",
	globalBuffDic = "table",
	roundIndex = "number",
	resetAward = "table",
	resetLimitTip = "boolean",
	activateCount = "number",
	staminaMgr = "table",
	achievements = "table",
	treasureCount = "number",
	collectionProxy = "table",
	defaultFleets = "table",
	goodDic = "table",
	inventoryProxy = "table",
	nowEntrance = "number",
	fleets = "table",
	taskProxy = "table",
	worldBossProxy = "table",
	colorDic = "table",
	expiredTime = "number",
	pressingAwardDic = "table",
	submarineSupport = "boolean"
}
slot0.EventUpdateRound = "World.EventUpdateRound"
slot0.EventUpdateSubmarineSupport = "World.EventUpdateSubmarineSupport"
slot0.EventSwitchMap = "World.EventSwitchMap"
slot0.EventUpdateProgress = "World.EventUpdateProgress"
slot0.EventUpdateShopGoods = "World.EventUpdateShopGoods"
slot0.EventUpdateGlobalBuff = "World.EventUpdateGlobalBuff"
slot0.EventAddPortShip = "World.EventAddPortShip"
slot0.EventRemovePortShip = "World.EventRemovePortShip"
slot0.EventAchieved = "World.EventAchieved"
slot0.Listeners = {
	onUpdateItem = "OnUpdateItem",
	onUpdateTask = "OnUpdateTask"
}

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0)
	slot0:InheritReset(slot1)
end

function slot0.Build(slot0)
	slot0.atlas = nil
	slot0.realm = 0
	slot0.fleets = {}
	slot0.defaultFleets = {}
	slot0.portShips = {}
	slot0.expiredTime = 0
	slot0.roundIndex = nil
	slot0.submarineSupport = nil
	slot0.achievements = {}
	slot0.achieveMapStar = {}
	slot0.nowEntrance = nil

	slot0:InitWorldShopGoods()
	slot0:InitWorldColorDictionary()

	slot0.activateCount = 0
	slot0.stepCount = 0
	slot0.treasureCount = 0
	slot0.progress = 0
	slot0.cdTimeList = {}
	slot0.globalBuffDic = {}
	slot0.pressingAwardDic = {}
	slot0.inventoryProxy = WorldInventoryProxy.New()

	slot0.inventoryProxy:AddListener(WorldInventoryProxy.EventUpdateItem, slot0.onUpdateItem)

	slot0.taskProxy = WorldTaskProxy.New()

	slot0.taskProxy:AddListener(WorldTaskProxy.EventUpdateTask, slot0.onUpdateTask)
end

function slot0.Dispose(slot0, slot1)
	slot2 = nil

	if slot1 then
		slot0.staminaMgr:Reset()

		slot2 = {
			realm = slot0.realm,
			defaultFleets = slot0.defaultFleets,
			achievements = slot0.achievements,
			achieveMapStar = slot0.achieveMapStar,
			nowEntrance = slot0.nowEntrance,
			activateCount = slot0.activateCount,
			progress = slot0.progress,
			staminaMgr = slot0.staminaMgr,
			collectionProxy = slot0.collectionProxy,
			worldBossProxy = slot0.worldBossProxy
		}
	else
		slot0.staminaMgr:Dispose()
		slot0.collectionProxy:Dispose()
		slot0.worldBossProxy:Dispose()
	end

	slot0.inventoryProxy:RemoveListener(WorldInventoryProxy.EventUpdateItem, slot0.onUpdateItem)
	slot0.inventoryProxy:Dispose()
	slot0.taskProxy:RemoveListener(WorldTaskProxy.EventUpdateTask, slot0.onUpdateTask)
	slot0.taskProxy:Dispose()
	slot0.atlas:Dispose()
	slot0:Clear()

	return slot2
end

function slot0.InheritReset(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0[slot5] = slot6
		end
	else
		slot0.worldBossProxy = WorldBossProxy.New()
		slot0.staminaMgr = WorldStaminaManager.New()
		slot0.collectionProxy = WorldCollectionProxy.New()
	end
end

function slot0.NewAtlas(slot0, slot1)
	slot0.atlas = WorldAtlas.New()

	slot0.atlas:Setup(slot1)
end

function slot0.IsReseted(slot0)
	return slot0.activateCount > 1
end

function slot0.IsActivate(slot0)
	return tobool(slot0:GetActiveMap())
end

function slot0.CheckResetProgress(slot0)
	return pg.gameset.world_resetting_stage.key_value <= slot0.progress
end

function slot0.GetResetWaitingTime(slot0)
	return slot0.expiredTime - pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.CheckReset(slot0, slot1)
	return slot0:IsActivate() and (slot1 or slot0:CheckResetProgress()) and slot0:GetResetWaitingTime() < 0
end

function slot0.SetupRealm(slot0, slot1)
	if slot0.realm ~= slot1 then
		slot0.realm = slot1
	end
end

function slot0.GetAtlas(slot0)
	return slot0.atlas
end

function slot0.GetEntrance(slot0, slot1)
	return slot0.atlas:GetEntrance(slot1)
end

function slot0.GetActiveEntrance(slot0)
	return slot0.atlas:GetActiveEntrance()
end

function slot0.GetMap(slot0, slot1)
	return slot0.atlas:GetMap(slot1)
end

function slot0.GetActiveMap(slot0)
	return slot0.atlas:GetActiveMap()
end

function slot0.OnSwitchMap(slot0)
	slot0:ResetRound()

	if slot0.submarineSupport then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_submarine_5"))
		slot0:ResetSubmarine()
		slot0:UpdateSubmarineSupport(false)
	end

	slot0:DispatchEvent(uv0.EventSwitchMap)
	print("switch 2 map: " .. slot0:GetActiveMap().id .. ", " .. tostring(slot0:GetActiveMap().gid))
end

function slot0.GetRound(slot0)
	return slot0.roundIndex % 2
end

function slot0.IncRound(slot0)
	slot0.roundIndex = slot0.roundIndex + 1

	slot0:DispatchEvent(uv0.EventUpdateRound)
end

function slot0.ResetRound(slot0)
	slot0.roundIndex = 0
end

function slot0.UpdateProgress(slot0, slot1)
	if slot0.progress < slot1 then
		slot0.progress = slot1

		slot0.atlas:UpdateProgress(slot0.progress, slot1)
		slot0:DispatchEvent(uv0.EventUpdateProgress)
	end
end

function slot0.GetProgress(slot0)
	return slot0.progress
end

function slot0.GetCurrentProgress(slot0)
	slot1, slot2 = nil
	slot3 = slot0:GetProgress()

	for slot8, slot9 in ipairs(pg.world_stage_data.all) do
		if slot4[slot9].start_num <= slot3 and slot3 <= slot10.end_num then
			slot1 = slot3 - slot10.start_num
			slot2 = slot10.end_num - slot10.start_num
		end
	end

	return slot1, slot2
end

function slot0.CanCallSubmarineSupport(slot0)
	return slot0:GetSubmarineFleet()
end

function slot0.IsSubmarineSupporting(slot0)
	return slot0.submarineSupport
end

function slot0.UpdateSubmarineSupport(slot0, slot1)
	slot0.submarineSupport = slot1

	slot0:DispatchEvent(uv0.EventUpdateSubmarineSupport)
end

function slot0.GetSubAidFlag(slot0)
	return slot0:IsSubmarineSupporting() and slot0:GetSubmarineFleet():GetAmmo() > 0
end

function slot0.ResetSubmarine(slot0)
	if slot0:GetSubmarineFleet() then
		slot1:RepairSubmarine()
	end
end

function slot0.SetFleets(slot0, slot1)
	slot0.fleets = slot1

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inWorld")
end

function slot0.GetFleets(slot0)
	return _.rest(slot0.fleets, 1)
end

function slot0.GetFleet(slot0, slot1)
	return slot1 and _.detect(slot0.fleets, function (slot0)
		return slot0.id == uv0
	end) or slot0:GetActiveMap():GetFleet()
end

function slot0.GetNormalFleets(slot0)
	return _.filter(slot0.fleets, function (slot0)
		return slot0:GetFleetType() == FleetType.Normal
	end)
end

function slot0.GetSubmarineFleet(slot0)
	return _.detect(slot0.fleets, function (slot0)
		return slot0:GetFleetType() == FleetType.Submarine
	end)
end

function slot0.GetShips(slot0)
	_.each(slot0:GetFleets(), function (slot0)
		_.each(slot0:GetShips(true), function (slot0)
			table.insert(uv0, slot0)
		end)
	end)

	return table.mergeArray({}, slot0:GetPortShips())
end

function slot0.GetShipVOs(slot0)
	return _.map(slot0:GetShips(), function (slot0)
		return WorldConst.FetchShipVO(slot0.id)
	end)
end

function slot0.GetShip(slot0, slot1)
	return _.detect(slot0:GetShips(), function (slot0)
		return slot0.id == uv0
	end)
end

function slot0.GetShipVO(slot0, slot1)
	return slot0:GetShip(slot1) and WorldConst.FetchShipVO(slot2.id)
end

function slot0.SetPortShips(slot0, slot1)
	slot0.portShips = slot1

	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inWorld")
end

function slot0.GetPortShips(slot0)
	return slot0.portShips
end

function slot0.GetPortShipVOs(slot0)
	return _.map(slot0:GetPortShips(), function (slot0)
		return WorldConst.FetchShipVO(slot0.id)
	end)
end

function slot0.AddPortShip(slot0, slot1)
	slot1.fleetId = nil

	table.insert(slot0.portShips, slot1)
	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inWorld")
	slot0:DispatchEvent(uv0.EventAddPortShip, slot1)
end

function slot0.RemovePortShip(slot0, slot1)
	for slot5 = #slot0.portShips, 1, -1 do
		if slot0.portShips[slot5].id == slot1 then
			slot6 = table.remove(slot0.portShips, slot5)

			pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inWorld")
			slot0:DispatchEvent(uv0.EventRemovePortShip, slot6)

			return slot6
		end
	end
end

function slot0.SetDefaultFleets(slot0, slot1)
	slot0.defaultFleets = slot1
end

function slot0.GetDefaultFleets(slot0)
	return underscore.rest(slot0.defaultFleets, 1)
end

function slot0.TransDefaultFleets(slot0)
	slot0.defaultFleets = underscore.map(slot0.fleets, function (slot0)
		return slot0:Trans(WorldBaseFleet)
	end)
end

function slot0.GetLevel(slot0)
	return _(slot0:GetFleets()):chain():map(function (slot0)
		return slot0:GetLevel()
	end):max():value()
end

function slot0.GetWorldPower(slot0)
	underscore.each(slot0.fleets, function (slot0)
		uv0 = uv0 + slot0:GetGearScoreSum()
	end)

	return math.floor(0 * (1 + slot0:GetWorldMapBuffAverageLevel() / pg.gameset.world_strength_correct.key_value))
end

function slot0.GetWorldRank(slot0)
	for slot7, slot8 in ipairs(underscore.map(slot0:GetNormalFleets(), function (slot0)
		return slot0:GetLevelCount() / 6
	end)) do
		slot1 = 0 + slot8 * pg.gameset.world_level_correct.description[slot7]
	end

	if slot0:GetSubmarineFleet() then
		slot1 = slot1 + slot4:GetLevelCount() / 3 * slot3[5]
	end

	slot5 = nil

	for slot10, slot11 in ipairs(pg.gameset.world_suggest_level.description) do
		if slot1 * slot0:GetWorldMapBuffAverageLevel() < slot11 then
			break
		else
			slot5 = slot10
		end
	end

	return slot5
end

function slot0.GetBossProxy(slot0)
	return slot0.worldBossProxy
end

function slot0.GetTaskProxy(slot0)
	return slot0.taskProxy
end

function slot0.GetInventoryProxy(slot0)
	return slot0.inventoryProxy
end

function slot0.GetCollectionProxy(slot0)
	return slot0.collectionProxy
end

function slot0.VerifyFormation(slot0)
	slot1 = {}

	_.each(slot0:GetShips(), function (slot0)
		uv0[slot0.id] = (uv0[slot0.id] or 0) + 1
	end)
end

function slot0.CalcRepairCost(slot0, slot1)
	slot3 = WorldConst.FetchShipVO(slot1.id).level - slot0:GetLevel()

	if slot1:IsBroken() then
		return (_.detect(pg.gameset.world_port_service_2_interval.description, function (slot0)
			return uv0 <= slot0[1]
		end) or slot4[#slot4])[2] * pg.gameset.world_port_service_2_price.key_value
	elseif not slot1:IsHpFull() then
		slot5 = pg.gameset.world_port_service_1_price.description

		return (_.detect(pg.gameset.world_port_service_1_interval.description, function (slot0)
			return uv0 <= slot0[1]
		end) or slot4[#slot4])[2] * (_.detect(slot5, function (slot0)
			return uv0.hpRant <= slot0[1]
		end) or slot5[#slot5])[2]
	end

	return 0
end

function slot0.GetMoveRange(slot0, slot1)
	if slot0:GetActiveMap():IsUnlockFleetMode() and not slot1:HasTrapBuff() then
		return slot2:GetLongMoveRange(slot1)
	else
		return slot2:GetMoveRange(slot1)
	end
end

function slot0.IsRookie(slot0)
	return slot0.activateCount == 0 and slot0.progress <= 0
end

function slot0.EntranceToDisplayMap(slot0, slot1)
	if slot1.active then
		return slot0:GetAtlas():GetActiveMap()
	else
		return slot0:EntranceToReplacementMap(slot1)
	end
end

function slot0.EntranceToReplacementMap(slot0, slot1)
	for slot6, slot7 in ipairs(slot1:GetBaseMap().config.stage_chapter) do
		if slot7[1] <= slot0:GetProgress() and slot0:GetProgress() <= slot7[2] then
			return slot0:GetMap(slot7[3])
		end
	end

	for slot6, slot7 in ipairs(slot2.config.task_chapter) do
		if slot0.taskProxy:getTaskById(slot7[1]) and slot8:getState() == WorldTask.STATE_ONGOING then
			return slot0:GetMap(slot7[2])
		end
	end

	for slot6, slot7 in ipairs(slot2.config.teasure_chapter) do
		if slot0.inventoryProxy:GetItemCount(slot7[1]) > 0 then
			return slot0:GetMap(slot7[2])
		end
	end

	if slot2.becomeSairen then
		return slot0:GetMap(slot2.config.sairen_chapter[1])
	end

	if slot2.isPressing and #slot2.config.complete_chapter > 0 then
		return slot0:GetMap(slot2.config.complete_chapter[1])
	end

	return slot2
end

function slot0.ReplacementMapType(slot0, slot1)
	for slot6, slot7 in ipairs(slot0:GetBaseMap().config.stage_chapter) do
		if slot7[3] == slot1.id then
			return "stage_chapter"
		end
	end

	for slot6, slot7 in ipairs(slot2.config.task_chapter) do
		if slot7[2] == slot1.id then
			return "task_chapter"
		end
	end

	for slot6, slot7 in ipairs(slot2.config.teasure_chapter) do
		if slot7[2] == slot1.id then
			return "teasure_chapter"
		end
	end

	if slot2.config.sairen_chapter[1] == slot1.id then
		return "sairen_chapter"
	end

	if slot2.config.complete_chapter[1] == slot1.id then
		return "complete_chapter"
	end
end

function slot0.FindTreasureEntrance(slot0, slot1)
	return _.values(slot0.atlas:GetTreasureDic(slot1))[1]
end

function slot0.TreasureMap2ItemId(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot0:GetEntrance(slot2):GetBaseMap().config.teasure_chapter) do
		if slot8[2] == slot1 then
			return slot8[1]
		end
	end
end

function slot0.CheckFleetMovable(slot0)
	return slot0:GetRound() == WorldConst.RoundPlayer and slot1:CheckFleetMovable(slot0:GetActiveMap():GetFleet()) and not slot1:CheckInteractive()
end

function slot0.IsFeetCageInTerrain(slot0)
	slot1 = slot0:GetActiveMap()
	slot2 = slot1:GetFleet()

	return slot1:GetCell(slot2.row, slot2.column):IsTerrainCage()
end

function slot0.SetMapAchieveSuccess(slot0, slot1, slot2)
	slot0.achieveMapStar[slot1] = slot0.achieveMapStar[slot1] or {}
	slot0.achieveMapStar[slot1][slot2] = true
end

function slot0.GetMapAchieveStarDic(slot0, slot1)
	return slot0.achieveMapStar[slot1] or {}
end

function slot0.GetAchievement(slot0, slot1)
	if not slot0.achievements[slot1] then
		slot0.achievements[slot1] = WorldAchievement.New()

		slot0.achievements[slot1]:Setup(slot1)
	end

	return slot0.achievements[slot1]
end

function slot0.GetAchievements(slot0, slot1)
	_.each(slot1.config.normal_target, function (slot0)
		table.insert(uv0, uv1:GetAchievement(slot0))
	end)
	_.each(slot1.config.cryptic_target, function (slot0)
		table.insert(uv0, uv1:GetAchievement(slot0))
	end)

	return {}
end

function slot0.IsNormalAchievementAchieved(slot0, slot1)
	return slot0:CountAchievements(slot1) >= #slot1:GetBaseMap().config.normal_target
end

function slot0.AnyUnachievedAchievement(slot0, slot1)
	slot2 = slot1:GetBaseMap()
	slot3 = slot0:GetMapAchieveStarDic(slot2.id)

	if _.detect(slot2:GetAchievementAwards(), function (slot0)
		return not uv0[slot0.star]
	end) then
		slot5, slot6 = slot0:CountAchievements(slot1)

		return slot4.star <= slot5 + slot6, slot4
	end
end

function slot0.GetFinishAchievements(slot0, slot1)
	table.foreachi(slot1 and {
		slot1
	} or slot0.atlas:GetAchEntranceList(), function (slot0, slot1)
		slot2, slot3 = uv0:CountAchievements(slot1)
		slot4 = slot1:GetBaseMap()
		slot6 = {}

		for slot10, slot11 in ipairs(slot4:GetAchievementAwards()) do
			if not uv0:GetMapAchieveStarDic(slot4.id)[slot11.star] and slot11.star <= slot2 + slot3 then
				table.insert(slot6, slot11.star)
			end
		end

		if #slot6 > 0 then
			table.insert(uv1, {
				id = slot1:GetBaseMapId(),
				star_list = slot6
			})
			table.insert(uv2, slot1.id)
		end
	end)

	return {}, {}
end

function slot0.CountAchievements(slot0, slot1)
	table.foreachi(slot1 and {
		slot1
	} or slot0.atlas:GetAchEntranceList(), function (slot0, slot1)
		slot2 = slot1:GetBaseMap()

		table.foreachi(slot2.config.normal_target, function (slot0, slot1)
			uv0 = uv0 + (uv1.achievements[slot1] and uv1.achievements[slot1]:IsAchieved() and 1 or 0)
		end)
		table.foreachi(slot2.config.cryptic_target, function (slot0, slot1)
			uv0 = uv0 + (uv1.achievements[slot1] and uv1.achievements[slot1]:IsAchieved() and 1 or 0)
		end)

		uv3 = uv3 + #slot2.config.normal_target + #slot2.config.cryptic_target
	end)

	return 0, 0, 0
end

function slot1()
	return {
		[TeamType.Main] = {},
		[TeamType.Vanguard] = {},
		[TeamType.Submarine] = {},
		commanders = {}
	}
end

function slot0.BuildFormationIds(slot0)
	slot1 = {
		[FleetType.Normal] = {},
		[FleetType.Submarine] = {}
	}
	slot2 = {
		[FleetType.Normal] = 2,
		[FleetType.Submarine] = 0
	}
	slot3 = {
		[FleetType.Normal] = 1,
		[FleetType.Submarine] = 1
	}

	for slot7, slot8 in ipairs(pg.world_stage_template) do
		if slot8.stage_key <= slot0:GetProgress() then
			slot2[FleetType.Normal] = math.max(slot2[FleetType.Normal], slot8.fleet_num)
		else
			break
		end
	end

	if slot0:IsSystemOpen(WorldConst.SystemSubmarine) then
		slot2[FleetType.Submarine] = 1
	end

	for slot7, slot8 in pairs(slot1) do
		for slot12 = 1, slot2[slot7] do
			table.insert(slot8, uv0())
		end
	end

	for slot7, slot8 in ipairs(slot0:IsActivate() and slot0:GetFleets() or slot0:GetDefaultFleets()) do
		slot9 = slot8:GetFleetType()

		if slot3[slot9] <= slot2[slot9] then
			slot1[slot9][slot10] = slot8:BuildFormationIds()
			slot3[slot9] = slot10 + 1
		end
	end

	slot4 = nil

	for slot9, slot10 in pairs(slot0:GetTaskProxy():getTasks()) do
		if slot10.config.complete_condition == WorldConst.TaskTypeFleetExpansion and slot10:getState() == WorldTask.STATE_ONGOING then
			slot4 = slot10.config.complete_parameter[1]

			break
		end
	end

	if slot4 then
		for slot9 = #slot1[FleetType.Normal] + 1, slot4 do
			slot1[FleetType.Normal][slot9] = uv0()
		end
	end

	for slot10, slot11 in pairs(slot1) do
		slot6 = 0 + #slot11
	end

	return slot4 and WorldConst.FleetExpansion or WorldConst.FleetRedeploy, slot1, slot6
end

function slot0.FormationIds2NetIds(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs({
		FleetType.Normal,
		FleetType.Submarine
	}) do
		for slot11, slot12 in ipairs(slot1[slot7]) do
			slot13 = {}

			for slot17, slot18 in ipairs({
				TeamType.Main,
				TeamType.Vanguard,
				TeamType.Submarine
			}) do
				for slot22 = 1, 3 do
					if slot12[slot18][slot22] then
						table.insert(slot13, slot12[slot18][slot22])
					end
				end
			end

			if #slot13 > 0 then
				table.insert(slot2, {
					ship_id_list = slot13,
					commanders = Clone(slot12.commanders)
				})
			end
		end
	end

	return slot2
end

function slot0.CompareRedeploy(slot0, slot1)
	slot2 = {
		TeamType.Main,
		TeamType.Vanguard,
		TeamType.Submarine
	}
	slot3 = {}
	slot4 = 0

	for slot8, slot9 in pairs(slot1) do
		for slot13, slot14 in ipairs(slot9) do
			for slot18, slot19 in ipairs(slot2) do
				for slot23 = 1, 3 do
					if slot14[slot19][slot23] and not slot3[slot24] then
						slot3[slot24] = true
						slot4 = slot4 + 1
					end
				end
			end
		end
	end

	slot5 = {}
	slot6 = 0

	for slot10, slot11 in ipairs(slot0:GetFleets()) do
		for slot15, slot16 in ipairs(slot2) do
			for slot21, slot22 in ipairs(slot11:GetTeamShips(slot16, true)) do
				if not slot5[slot22.id] then
					slot5[slot22.id] = true
					slot6 = slot6 + 1
				end
			end
		end
	end

	if slot6 ~= slot4 then
		return true
	end

	for slot10, slot11 in pairs(slot5) do
		if not slot3[slot10] then
			return true
		end
	end

	for slot10, slot11 in pairs(slot3) do
		if not slot5[slot10] then
			return true
		end
	end

	return false
end

function slot0.IsSystemOpen(slot0, slot1)
	for slot5, slot6 in ipairs(pg.world_stage_template.all) do
		if pg.world_stage_template[slot6].stage_ui[1] == slot1 and (slot7.stage_ui[2] == 0 or slot7.stage_ui[2] == slot0.realm) then
			return slot7.stage_key <= slot0:GetProgress()
		end
	end

	return true
end

function slot0.CalcCDTimeCost(slot0, slot1, slot2)
	return math.floor(slot0[1] * math.max(slot0[2] - math.max(pg.TimeMgr.GetInstance():GetServerTime() - slot1, 0), 0) / slot0[2] * math.max(10000 - slot2, 0) / 10000)
end

function slot0.GetReqCDTime(slot0, slot1)
	return slot0.cdTimeList[slot1] or 0
end

function slot0.SetReqCDTime(slot0, slot1, slot2)
	slot0.cdTimeList[slot1] = slot2
end

function slot0.GetNowEntrance(slot0)
	return slot0.nowEntrance
end

function slot0.SetNowEntrance(slot0, slot1)
	slot0.nowEntrance = slot1
end

function slot0.InitWorldShopGoods(slot0)
	slot0.goodDic = {}

	for slot4, slot5 in ipairs(pg.shop_template.all) do
		if pg.shop_template[slot5].genre == ShopArgs.WorldShop then
			slot0.goodDic[slot5] = 0
		end
	end
end

function slot0.UpdateWorldShopGoods(slot0, slot1)
	_.each(slot1, function (slot0)
		uv0.goodDic[slot0.goods_id] = uv0.goodDic[slot0.goods_id] + slot0.count
	end)
	slot0:DispatchEvent(uv0.EventUpdateShopGoods, slot0.goodDic)
end

function slot0.GetWorldShopGoodsDictionary(slot0)
	return slot0.goodDic
end

function slot0.InitWorldColorDictionary(slot0)
	slot0.colorDic = {}

	_.each(pg.world_chapter_colormask.all, function (slot0)
		slot1 = pg.world_chapter_colormask[slot0]
		uv0.colorDic[Color.New(slot1.color[1] / 255, slot1.color[2] / 255, slot1.color[3] / 255):ToHex()] = slot1.id
	end)
end

function slot0.ColorToEntrance(slot0, slot1)
	return slot0.colorDic[slot1:ToHex()] and slot0:GetEntrance(slot0.colorDic[slot1:ToHex()])
end

function slot0.GetGlobalBuff(slot0, slot1)
	if not slot0.globalBuffDic[slot1] then
		slot2 = WorldBuff.New()

		slot2:Setup({
			floor = 0,
			id = slot1
		})

		slot0.globalBuffDic[slot1] = slot2
	end

	return slot0.globalBuffDic[slot1]
end

function slot0.AddGlobalBuff(slot0, slot1, slot2)
	slot0:GetGlobalBuff(slot1):AddFloor(slot2)
	slot0:DispatchEvent(uv0.EventUpdateGlobalBuff)
end

function slot0.RemoveBuff(slot0, slot1, slot2)
	if slot0.globalBuffDic[slot1] then
		if slot2 and slot2 < slot3:GetFloor() then
			slot3:AddFloor(slot2 * -1)
		else
			slot0.globalBuffDic[slot1] = nil
		end

		slot0:DispatchEvent(uv0.EventUpdateGlobalBuff)
	end
end

function slot0.GetWorldMapBuffLevel(slot0)
	return _.map(pg.gameset.world_mapbuff_list.description, function (slot0)
		return uv0:GetGlobalBuff(slot0).floor
	end)
end

function slot0.GetWorldMapBuffAverageLevel(slot0)
	slot1 = slot0:GetWorldMapBuffLevel()

	underscore.each(slot1, function (slot0)
		uv0 = uv0 + slot0
	end)

	return 0 / #slot1
end

function slot0.GetWorldMapBuffs(slot0)
	return _.map(pg.gameset.world_mapbuff_list.description, function (slot0)
		return uv0:GetGlobalBuff(slot0)
	end)
end

function slot0.GetWorldMapDifficultyBuffLevel(slot0)
	return pg.gameset.world_difficult_value.description[slot0:GetActiveMap().config.difficulty]
end

function slot0.OnUpdateItem(slot0, slot1, slot2, slot3)
	if slot3:getWorldItemType() == WorldItem.UsageWorldMap and slot0.atlas then
		slot0.atlas:UpdateTreasure(slot3.id)
	end

	slot0.taskProxy:doUpdateTaskByItem(slot3)
end

function slot0.OnUpdateTask(slot0, slot1, slot2, slot3)
	if slot0.atlas then
		slot0.atlas:UpdateTask(slot3)
	end
end

function slot0.GetPressingAward(slot0, slot1)
	return slot0.pressingAwardDic[slot1]
end

function slot0.FlagMapPressingAward(slot0, slot1)
	if not slot0.pressingAwardDic[slot1] then
		return
	end

	slot0.pressingAwardDic[slot1].flag = false
end

function slot0.CheckAreaUnlock(slot0, slot1)
	return pg.world_regions_data[slot1].open_stage[1] <= slot0.progress
end

function slot0.CheckTaskLockMap(slot0)
	slot2 = slot0:GetActiveMap().gid

	return _.any(slot0.taskProxy:getTaskVOs(), function (slot0)
		return slot0:isAlive() and slot0:IsLockMap() and _.any(slot0.config.task_target_map, function (slot0)
			return slot0 == uv0
		end)
	end)
end

function slot0.CheckResetAward(slot0, slot1)
	slot0.resetAward = slot1

	if getProxy(PlayerProxy):getData():getResource(WorldConst.ResourceID) == pg.gameset.world_resource_max.key_value then
		slot0.resetLimitTip = true
	end
end

function slot0.ClearResetAward(slot0)
	slot0.resetAward = nil
	slot0.resetLimitTip = nil
end

function slot0.GetTargetMapPressingCount(slot0, slot1)
	for slot6, slot7 in ipairs(slot1) do
		if slot0:GetMap(slot7).isPressing then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function slot0.ClearAllFleetDefeatEnemies(slot0)
	underscore.each(slot0:GetFleets(), function (slot0)
		slot0:ClearDefeatEnemies()
	end)
end

function slot0.GetAreaEntranceIds(slot0, slot1)
	return slot0.atlas.areaEntranceList[slot1]
end

function slot0.CalcOrderCost(slot0, slot1)
	if slot1 == WorldConst.OpReqRedeploy then
		return World.CalcCDTimeCost(pg.gameset.world_fleet_redeploy_cost.description, slot0:GetReqCDTime(WorldConst.OpReqRedeploy), 0)
	elseif slot1 == WorldConst.OpReqMaintenance then
		return pg.gameset.world_instruction_maintenance.description[1] * math.max(10000 - slot2, 0) / 10000
	elseif slot1 == WorldConst.OpReqSub then
		if slot0:GetSubmarineFleet() then
			underscore.each(slot3:GetShips(true), function (slot0)
				uv0 = uv0 + slot0:GetImportWorldShipVO():GetStaminaDiscount(WorldConst.OpReqSub)
			end)
		end

		return World.CalcCDTimeCost(pg.gameset.world_instruction_submarine.description, slot0:GetReqCDTime(WorldConst.OpReqSub), slot2)
	elseif slot1 == WorldConst.OpReqVision then
		return World.CalcCDTimeCost(pg.gameset.world_instruction_detect.description, slot0:GetReqCDTime(WorldConst.OpReqVision), slot2)
	end
end

function slot0.GetDisplayPressingCount(slot0)
	table.foreachi(slot0.atlas.pressingMapList, function (slot0, slot1)
		if uv0.atlas:GetMap(slot1):CheckMapPressingDisplay() then
			uv1 = uv1 + 1
		end
	end)

	return 0
end

function slot0.CheckCommanderInFleet(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.fleets) do
		if slot6:HasCommander(slot1) then
			return true
		end
	end

	return false
end

function slot0.CheckSkipBattle(slot0)
	return getProxy(PlayerProxy):getRawData():CheckIdentityFlag() and world_skip_battle == 1
end

return slot0
