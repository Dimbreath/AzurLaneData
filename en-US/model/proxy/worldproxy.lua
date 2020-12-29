slot0 = class("WorldProxy", import(".NetProxy"))

function slot0.register(slot0)
	WPool = BaseEntityPool.New()
	WBank = BaseEntityBank.New()

	slot0:BuildTestFunc()
	slot0:on(33001, function (slot0)
		uv0.isProtoLock = slot0.is_world_open == 0

		uv0:BuildWorld(false, slot0.count_info.task_progress)
		uv0:NetUpdateWorld(slot0.world, slot0.vision_list, slot0.camp)
		uv0:NetUpdateWorldDefaultFleets(slot0.fleet_list)
		uv0:NetUpdateWorldAchievements(slot0.target_list, slot0.target_fetch_list)
		uv0:NetUpdateWorldCountInfo(slot0.count_info)
		uv0:NetUpdateWorldMapPressing(slot0.clean_chapter)
		uv0:NetUpdateWorldShopGoods(slot0.out_shop_buy_list)
		uv0:NetUpdateWorldPressingAward(slot0.chapter_award)
		uv0:NetUpdateWorldPortTaskMark(slot0.port_list)
	end)
	slot0:on(33105, function (slot0)
		uv0:UpdateMapAttachmentCells(nowWorld:GetActiveMap().id, uv0:NetBuildMapAttachmentCells(slot0.pos_list))
	end)
	slot0:on(33203, function (slot0)
		slot1 = nowWorld:GetTaskProxy()

		for slot5, slot6 in ipairs(slot0.update_list) do
			if slot1:getTaskById(WorldTask.New(slot6).id) then
				slot1:updateTask(slot7)
			else
				slot1:addTask(slot7)
				uv0:sendNotification(GAME.WORLD_TRIGGER_TASK_DONE, {
					task = slot7
				})
			end
		end
	end)
	slot0:on(33204, function (slot0)
		for slot5, slot6 in ipairs(slot0.delete_list) do
			nowWorld:GetTaskProxy():deleteTask(slot6)
		end
	end)
	slot0:on(33601, function (slot0)
		uv0:NetUpdateAchievements(slot0.target_list)
	end)
	slot0:on(34507, function (slot0)
		if nowWorld then
			slot2 = WorldBoss.New()

			slot2:Setup(slot0.boss_info, Player.New(slot0.user_info))
			slot2:UpdateBossType(slot0.type)
			slot2:SetJoinTime(pg.TimeMgr.GetInstance():GetServerTime())

			if nowWorld:GetBossProxy().isSetup then
				slot1:UpdateCacheBoss(slot2)
			end

			if not slot1:IsSelfBoss(slot2) and nowWorld:IsSystemOpen(WorldConst.SystemWorldBoss) then
				pg.WorldBossTipMgr.GetInstance():Show(slot2)
			end
		end
	end)
	slot0:on(34508, function (slot0)
		if nowWorld:GetBossProxy().isSetup then
			uv0:sendNotification(GAME.WORLD_GET_BOSS_RANK, {
				bossId = slot0.boss_id,
				callback = function ()
					uv0:updateBossHp(uv1.boss_id, uv1.hp)
				end
			})
		end
	end)

	slot0.storyList = {}
end

function slot0.remove(slot0)
	nowWorld:GetBossProxy():Dispose()
	nowWorld:Dispose()

	nowWorld = nil

	WPool:Dispose()

	WPool = nil

	WBank:Dispose()

	WBank = nil
end

function slot0.BuildTestFunc(slot0)
	world_skip_battle = PlayerPrefs.GetInt("world_skip_battle") or 0

	function switch_world_skip_battle()
		if getProxy(PlayerProxy):getRawData():CheckIdentityFlag() then
			world_skip_battle = 1 - world_skip_battle

			PlayerPrefs.SetInt("world_skip_battle", world_skip_battle)
			PlayerPrefs.Save()
			pg.TipsMgr.GetInstance():ShowTips(world_skip_battle == 1 and "已开启大世界战斗跳略" or "已关闭大世界战斗跳略")
		end
	end

	if Application.isEditor then
		function display_world_debug_panel()
			if pg.m02:retrieveMediator(WorldMediator.__cname) then
				slot0.viewComponent:ShowSubView("DebugPanel")
			end
		end

		pg.UIMgr.GetInstance():AddWorldTestButton("WorldDebug", function ()
			WorldConst.Debug = true
		end)
	end
end

function slot0.BuildWorld(slot0, slot1, slot2)
	nowWorld = World.New(nowWorld and nowWorld:Dispose(slot1))

	nowWorld:NewAtlas(WorldConst.GetProgressAtlas(slot2 or nowWorld:GetProgress()))
	pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inWorld")
	slot0:sendNotification(GAME.WORLD_GET_BOSS)
end

function slot0.NetUpdateWorld(slot0, slot1, slot2, slot3)
	slot4 = nowWorld

	slot4:SetupRealm(slot3)

	slot4.expiredTime = slot1.last_change_group_timestamp
	slot4.roundIndex = slot1.round
	slot4.submarineSupport = slot1.submarine_state == 1

	slot4.staminaMgr:Setup({
		slot1.action_power,
		slot1.action_power_extra,
		slot1.last_recover_timestamp,
		slot1.action_power_fetch_count
	})
	slot4:GetAtlas():SetCostMapList(_.rest(slot1.chapter_list, 1))
	slot4:GetAtlas():SetSairenMapList(_.rest(slot1.sairen_chapter, 1))
	slot4:SetFleets(slot0:NetBuildMapFleetList(slot1.group_list))

	if slot1.map_id > 0 and _.detect(slot1.chapter_list, function (slot0)
		return slot0.random_id == uv0.map_id
	end) then
		slot10 = slot4:GetMap(slot5.random_id)

		slot4:GetEntrance(slot1.enter_map_id):UpdateActive(true)
		slot10:UpdateGridId(slot5.template_id)
		slot10:BindFleets(slot4.fleets)

		slot10.findex = table.indexof(slot4.fleets, slot4:GetFleet(slot1.group_list[1].id))

		slot10:UpdateActive(true)
	end

	slot4:SetPortShips(slot0:NetBuildPortShipList(slot1.ship_in_port))
	slot4:GetInventoryProxy():Setup(slot1.item_list)

	slot7 = slot4:GetTaskProxy()

	slot7:Setup(slot1.task_list)

	slot7.taskFinishCount = slot1.task_finish_count

	_.each(slot1.cd_list, function (slot0)
		uv0.cdTimeList[slot0.id] = slot0.time
	end)
	_.each(slot1.buff_list, function (slot0)
		uv0.globalBuffDic[slot0.id] = WorldBuff.New()

		uv0.globalBuffDic[slot0.id]:Setup({
			id = slot0.id,
			floor = slot0.stack
		})
	end)
end

function slot0.NetUpdateWorldDefaultFleets(slot0, slot1)
	slot2 = {}

	_.each(slot1, function (slot0)
		slot1 = WorldBaseFleet.New()

		slot1:Setup(slot0)
		table.insert(uv0, slot1)
	end)
	table.sort(slot2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	nowWorld:SetDefaultFleets(slot2)
end

function slot0.NetUpdateWorldAchievements(slot0, slot1, slot2)
	nowWorld.achievements = {}

	slot0:NetUpdateAchievements(slot1)

	nowWorld.achieveMapStar = {}

	_.each(slot2, function (slot0)
		table.foreachi(slot0.star_list, function (slot0, slot1)
			nowWorld:SetMapAchieveSuccess(uv0.id, slot1)
		end)
	end)
end

function slot0.NetUpdateWorldCountInfo(slot0, slot1)
	nowWorld.stepCount = slot1.step_count
	nowWorld.treasureCount = slot1.treasure_count
	nowWorld.activateCount = slot1.activate_count

	nowWorld:GetCollectionProxy():Setup(slot1.collection_list)
	nowWorld:UpdateProgress(slot1.task_progress)
end

function slot0.NetUpdateActiveMap(slot0, slot1, slot2, slot3)
	slot4 = nowWorld:GetActiveEntrance()

	if nowWorld:GetActiveMap():NeedClear() and slot4:GetBaseMap().becomeSairen and slot6:GetSairenMapId() == slot5.id then
		nowWorld:GetAtlas():RemoveSairenEntrance(slot4)
	end

	if slot4.id ~= nowWorld:GetEntrance(slot1).id then
		slot4:UpdateActive(false)
		slot6:UpdateActive(true)
	end

	if slot5.id ~= nowWorld:GetMap(slot2).id then
		slot5:UpdateActive(false)
		slot5:RemoveFleetsCarries()
		slot5:UnbindFleets()

		slot7.findex = slot5.findex
		slot5.findex = nil

		slot7:UpdateGridId(slot3)
		slot7:BindFleets(nowWorld.fleets)
		slot7:UpdateActive(true)
	end

	nowWorld:OnSwitchMap()
end

function slot0.NetUpdateMap(slot0, slot1)
	slot3 = slot1.id.template_id
	slot4 = {}

	_.each(slot1.state_flag, function (slot0)
		uv0[slot0] = true
	end)

	slot5 = nowWorld:GetMap(slot1.id.random_id)

	slot5:UpdateClearFlag(slot4[1])
	slot5:UpdateVisionFlag(slot4[2])
	slot0:NetUpdateMapDiscoveredCells(slot5.id, slot4[3], slot1.cell_list)
	slot0:UpdateMapAttachmentCells(slot5.id, slot0:NetBuildMapAttachmentCells(slot1.pos_list))

	slot7 = slot0:NetBuildFleetAttachUpdate(slot1.pos_list)

	slot0:ApplyFleetAttachUpdate(slot5.id, slot7)
	WPool:ReturnArray(slot7)

	slot8 = slot0:NetBulidTerrainUpdate(slot1.land_list)

	slot0:ApplyTerrainUpdate(slot5.id, slot8)
	WPool:ReturnArray(slot8)
	slot5:SetValid(true)
	slot5:UpdateFOV()
end

function slot0.NetUpdateMapDiscoveredCells(slot0, slot1, slot2, slot3)
	slot4 = nowWorld:GetMap(slot1)

	if slot2 then
		for slot8, slot9 in pairs(slot4.cells) do
			slot9:UpdateDiscovered(true)
		end
	else
		_.each(slot3, function (slot0)
			uv0:GetCell(slot0.pos.row, slot0.pos.column):UpdateDiscovered(true)
		end)
	end
end

function slot0.NetUpdateMapPort(slot0, slot1, slot2)
	slot4 = nowWorld:GetMap(slot1):GetPort(slot2.port_id)

	slot4:UpdateTaskIds(_.rest(slot2.task_list, 1))
	slot4:UpdateGoods(_.map(slot2.goods_list, function (slot0)
		slot1 = WPool:Get(WorldGoods)

		slot1:Setup(slot0)

		return slot1
	end))
	slot4:UpdateExpiredTime(slot2.next_refresh_time)
end

function slot0.NetUpdateAchievements(slot0, slot1)
	_.each(slot1, function (slot0)
		nowWorld:DispatchEvent(World.EventAchieved, nowWorld:GetAchievement(slot0.id):NetUpdate(slot0.process_list))
	end)
end

function slot0.NetBuildMapFleetList(slot0, slot1)
	slot2 = {}

	if slot1 and #slot1 > 0 then
		_.each(slot1, function (slot0)
			slot1 = WorldMapFleet.New()

			slot1:Setup(slot0)
			table.insert(uv0, slot1)
		end)
		table.sort(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		slot3 = {
			[FleetType.Normal] = 1,
			[FleetType.Submarine] = 1
		}

		_.each(slot2, function (slot0)
			slot1 = slot0:GetFleetType()
			slot0.index = uv0[slot1]
			uv0[slot1] = uv0[slot1] + 1
		end)
	end

	return slot2
end

function slot0.NetBuildPortShipList(slot0, slot1)
	return _.map(slot1, function (slot0)
		slot1 = WPool:Get(WorldMapShip)

		slot1:Setup(slot0)

		return slot1
	end)
end

function slot0.NetResetWorld(slot0)
	slot0:sendNotification(GAME.SEND_CMD, {
		cmd = "world",
		arg1 = "reset"
	})
	slot0:sendNotification(GAME.SEND_CMD, {
		cmd = "kick"
	})
end

function slot0.NetSubmitTaskByAutoTypes(slot0, slot1)
	for slot7, slot8 in pairs(nowWorld:GetTaskProxy():getTasks()) do
		if slot8:getState() == WorldTask.STATE_FINISHED and table.contains(slot1, slot8.config.auto_complete) then
			slot0:sendNotification(GAME.WORLD_SUMBMIT_TASK, {
				taskId = slot8.id
			})
		end
	end
end

function slot0.NetBuildMapAttachmentCells(slot0, slot1)
	_.each(slot1, function (slot0)
		uv0[WorldMapCell.GetName(slot0.pos.row, slot0.pos.column)] = {
			pos = {
				row = slot0.pos.row,
				column = slot0.pos.column
			},
			attachmentList = slot0.item_list
		}
	end)

	for slot6, slot7 in pairs({}) do
		_.each(slot7.attachmentList, function (slot0)
			slot1 = WPool:Get(WorldMapAttachment)

			slot1:Setup(setmetatable({
				pos = uv0.pos
			}, {
				__index = slot0
			}))
			table.insert(uv1, slot1)
		end)

		slot7.attachmentList = {}
	end

	return slot2
end

function slot0.UpdateMapAttachmentCells(slot0, slot1, slot2)
	slot3 = nowWorld:GetMap(slot1)

	for slot7, slot8 in pairs(slot2) do
		for slot14 = #slot3:GetCell(slot8.pos.row, slot8.pos.column).attachments, 1, -1 do
			slot15 = slot10[slot14]

			if not WorldMapAttachment.IsFakeType(slot10[slot14].type) and not _.any(slot8.attachmentList, function (slot0)
				return uv0.type == slot0.type and uv0.id == slot0.id
			end) then
				slot9:RemoveAttachment(slot14)
			end
		end

		_.each(slot8.attachmentList, function (slot0)
			if slot0.type ~= WorldMapAttachment.TypeFleet then
				if _.detect(uv0.attachments, function (slot0)
					return slot0.type == uv0.type and slot0.id == uv0.id
				end) then
					slot1:UpdateFlag(slot0.flag)
					slot1:UpdateData(slot0.data)
					uv1:AddPhaseDisplay(slot1:UpdateBuffList(slot0.buffList))
				else
					uv0:AddAttachment(slot0)
				end
			end
		end)
	end
end

function slot0.NetBuildFleetAttachUpdate(slot0, slot1)
	_.each(slot1, function (slot0)
		slot1 = {
			row = slot0.pos.row,
			column = slot0.pos.column
		}

		_.each(slot0.item_list, function (slot0)
			if slot0.item_type == WorldMapAttachment.TypeFleet then
				slot1 = WPool:Get(NetFleetAttachUpdate)

				slot1:Setup(setmetatable({
					pos = uv0
				}, {
					__index = slot0
				}))
				table.insert(uv1, slot1)
			end
		end)
	end)

	return {}
end

function slot0.ApplyFleetAttachUpdate(slot0, slot1, slot2)
	slot3 = nowWorld:GetMap(slot1)

	slot3:SetFleetLocationSkip(true)
	_.each(slot2, function (slot0)
		uv0:GetFleet(slot0.id):UpdateLocation(slot0.row, slot0.column)
	end)
	slot3:SetFleetLocationSkip(false)
end

function slot0.NetBulidTerrainUpdate(slot0, slot1)
	return _.map(slot1, function (slot0)
		slot1 = WPool:Get(NetTerrainUpdate)

		slot1:Setup(slot0)

		return slot1
	end)
end

function slot0.ApplyTerrainUpdate(slot0, slot1, slot2)
	slot3 = nowWorld:GetMap(slot1)

	_.each(slot2, function (slot0)
		uv0:GetCell(slot0.row, slot0.column):UpdateTerrain(slot0:GetTerrain(), slot0.terrainDir, slot0.terrainStrong)
	end)
end

function slot0.NetBuildFleetUpdate(slot0, slot1)
	return _.map(slot1, function (slot0)
		slot1 = WPool:Get(NetFleetUpdate)

		slot1:Setup(slot0)

		return slot1
	end)
end

function slot0.ApplyFleetUpdate(slot0, slot1, slot2)
	slot3 = nowWorld:GetMap(slot1)

	_.each(slot2, function (slot0)
		uv0:GetFleet(slot0.id):UpdateBuffs(slot0.buffs)
	end)
end

function slot0.NetBuildShipUpdate(slot0, slot1)
	return _.map(slot1, function (slot0)
		slot1 = WPool:Get(NetShipUpdate)

		slot1:Setup(slot0)

		return slot1
	end)
end

function slot0.ApplyShipUpdate(slot0, slot1)
	_.each(slot1, function (slot0)
		nowWorld:GetShip(slot0.id):UpdateHpRant(slot0.hpRant)
	end)
end

function slot0.NetUpdateWorldSairenChapter(slot0, slot1)
	nowWorld:GetAtlas():SetSairenMapList(_.rest(slot1, 1))
end

function slot0.NetUpdateWorldMapPressing(slot0, slot1)
	nowWorld:GetAtlas():SetPressingMarkList(_.rest(slot1, 1))
end

function slot0.NetUpdateWorldShopGoods(slot0, slot1)
	nowWorld:InitWorldShopGoods()
	nowWorld:UpdateWorldShopGoods(slot1)
end

function slot0.NetUpdateWorldPressingAward(slot0, slot1)
	slot2 = nowWorld:GetAtlas()

	_.each(slot1, function (slot0)
		slot2 = {
			id = slot0.award,
			flag = slot0.flag == 1
		}
		nowWorld.pressingAwardDic[slot0.id] = slot2

		if not slot2.flag then
			uv0:MarkMapTransport(slot1)
		end
	end)
end

function slot0.NetUpdateWorldPortTaskMark(slot0, slot1)
	nowWorld:GetAtlas():SetPortTaskList(slot1)
end

function slot0.NetBuildSalvageUpdate(slot0, slot1)
	return _.map(slot1, function (slot0)
		slot1 = WPool:Get(NetSalvageUpdate)

		slot1:Setup(slot0)

		return slot1
	end)
end

function slot0.ApplySalvageUpdate(slot0, slot1)
	_.each(slot1, function (slot0)
		nowWorld:GetFleet(slot0.id):UpdateCatSalvage(slot0.step, slot0.list, slot0.mapId)
	end)
end

function slot0.CheckStoryPlayed(slot0, slot1)
	return slot0.storyList[slot1]
end

function slot0.SetStoryPlayed(slot0, slot1)
	slot0.storyList[slot1] = true
end

return slot0
