slot0 = class("ChapterOpRoutine", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	return
end

function slot0.initData(slot0, slot1, slot2, slot3)
	slot0.op = slot1
	slot0.data = slot2
	slot0.chapter = slot3
	slot0.items = {}
	slot0.fullpath = nil
	slot0.flag = 0
end

function slot0.doDropUpdate(slot0)
	slot2 = slot0.items

	for slot6, slot7 in ipairs(slot0.data.drop_list) do
		table.insert(slot2, slot8)
		slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
	end
end

function slot0.doMapUpdate(slot0)
	slot1 = slot0.data
	slot2 = slot0.flag
	slot3 = slot0.extraFlag or 0
	slot4 = slot0.chapter

	if #slot1.map_update > 0 then
		_.each(slot1.map_update, function (slot0)
			if slot0.item_type == ChapterConst.AttachStory and slot0.item_data == ChapterConst.StoryTrigger then
				slot1 = ChapterCell.New(slot0)

				if _.detect(slot0.cellAttachments, function (slot0)
					return slot0.row == slot0.row and slot0.column == slot0.column
				end) then
					if slot2.flag == 3 and slot1.flag == 4 and pg.map_event_template[slot2.attachmentId].gametip ~= "" then
						pg.TipsMgr.GetInstance():ShowTips(i18n(slot3))
					end

					slot2.attachment = slot1.attachment
					slot2.attachmentId = slot1.attachmentId
					slot2.flag = slot1.flag
					slot2.data = slot1.data
				else
					table.insert(slot0.cellAttachments, slot1)
				end

				return
			end

			if slot0.item_type ~= ChapterConst.AttachNone and slot0.item_type ~= ChapterConst.AttachBorn and slot0.item_type ~= ChapterConst.AttachBorn_Sub then
				slot0:mergeChapterCell(ChapterCell.New(slot0))
			end
		end)

		slot2 = bit.bor(slot2, ChapterConst.DirtyAttachment)
		slot3 = bit.bor(slot3, ChapterConst.DirtyAutoAction)
	end

	slot0.flag = slot2
	slot0.extraFlag = slot3
end

function slot0.doCellFlagUpdate(slot0)
	slot2 = slot0.flag
	slot3 = slot0.chapter

	if #slot0.data.cell_flag_list > 0 then
		_.each(slot1.cell_flag_list, function (slot0)
			if slot0:getChapterCell(slot0.pos.row, slot0.pos.column) then
				slot1:updateFlagList(slot0)
			else
				slot1 = ChapterCell.New(slot0)
			end

			slot1.chapter:updateChapterCell(slot1)
		end)

		slot2 = bit.bor(slot2, ChapterConst.DirtyCellFlag)
	end

	slot0.flag = slot2
end

function slot0.doAIUpdate(slot0)
	slot1 = slot0.data
	slot2 = slot0.flag
	slot3 = slot0.extraFlag or 0
	slot4 = slot0.chapter

	if #slot1.ai_list > 0 then
		_.each(slot1.ai_list, function (slot0)
			slot0:mergeChampion(ChapterChampionPackage.New(slot0))
		end)

		slot2 = bit.bor(slot2, ChapterConst.DirtyChampion)
		slot3 = bit.bor(slot3, ChapterConst.DirtyAutoAction)
	end

	slot0.flag = slot2
	slot0.extraFlag = slot3
end

function slot0.doShipUpdate(slot0)
	slot2 = slot0.flag
	slot4 = slot0.chapter.fleet

	if #slot0.data.ship_update > 0 then
		_.each(slot1.ship_update, function (slot0)
			if slot0:getShip(slot0.id) and slot1.hpRant * slot0.hp_rant == 0 and slot1:getShipType() == ShipType.WeiXiu then
				slot1 = bit.bor(slot1, ChapterConst.DirtyStrategy)
			end

			slot0:updateShipHp(slot0.id, slot0.hp_rant)
		end)

		slot2 = bit.bor(slot2, ChapterConst.DirtyFleet)
	end

	slot0.flag = slot2
end

function slot0.doBuffUpdate(slot0)
	slot2 = slot0.chapter

	if slot0.data.buff_list then
		for slot6, slot7 in ipairs(slot1.buff_list) do
			if not _.include(slot2.buff_list, slot7) then
				table.insert(slot2.buff_list, slot7)
			end
		end
	end
end

function slot0.doExtraFlagUpdate(slot0)
	slot2 = slot0.chapter
	slot3 = getProxy(ChapterProxy)

	if #slot0.data.add_flag_list > 0 or #slot1.del_flag_list > 0 then
		slot3:updateExtraFlag(slot2, slot1.add_flag_list, slot1.del_flag_list)
		slot3:updateChapter(slot2, bit.bor(ChapterConst.DirtyStrategy, ChapterConst.DirtyCellFlag))
	end
end

function slot0.doRetreat(slot0)
	slot2 = slot0.data
	slot3 = slot0.flag
	slot4 = slot0.chapter

	if slot0.op.id then
		if #slot4.fleets > 0 then
			_.each(slot4.fleets, function (slot0)
				if slot0.id ~= slot0.id then
					table.insert(table.insert, slot0)
				end
			end)

			slot4.fleets = {}
			slot4.findex = 1
			slot3 = bit.bor(slot3, ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampion, ChapterConst.DirtyStrategy)
		end
	else
		slot4:retreat(slot1.win)

		slot3 = 0
	end

	slot0.flag = slot3
end

function slot0.doMove(slot0)
	slot1 = slot0.op
	slot4 = slot0.chapter.fleet
	slot5 = nil

	if #slot0.data.move_path > 0 then
		slot5 = _.rest(slot2.move_path, 1)
		slot7, slot8 = slot3:findPath(ChapterConst.SubjectPlayer, slot4.line, {
			row = slot1.arg1,
			column = slot1.arg2
		})

		if slot7 < PathFinding.PrioObstacle and #slot8 >= #slot2.move_path then
			slot5 = slot8
		end

		slot4.line = {
			row = slot2.move_path[#slot2.move_path].row,
			column = slot2.move_path[#slot2.move_path].column
		}
	end

	slot0.fullpath = slot5

	slot3:IncreaseRound()

	slot0.flag = 0
end

function slot0.doOpenBox(slot0)
	slot1 = slot0.items
	slot6 = slot0.chapter.getChapterCell(slot3, slot0.chapter.fleet.line.row, slot0.chapter.fleet.line.column)
	slot6.flag = 1

	slot0.chapter.updateChapterCell(slot3, slot6)

	slot2 = bit.bor(slot0.flag, ChapterConst.DirtyAttachment)

	if pg.box_data_template[slot6.attachmentId].type == ChapterConst.BoxStrategy then
		slot4:achievedOneStrategy(slot8)
		table.insert(slot1, Item.New({
			count = 1,
			type = DROP_TYPE_STRATEGY,
			id = slot7.effect_id
		}))

		slot2 = bit.bor(slot2, ChapterConst.DirtyStrategy)
	elseif slot7.type == ChapterConst.BoxSupply then
		slot8, slot9 = slot3:getFleetAmmo(slot4)
		slot4.restAmmo = slot4.restAmmo + math.min(slot8 - slot9, slot7.effect_id)
		slot2 = bit.bor(slot2, ChapterConst.DirtyFleet)

		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply_p1", slot7.effect_id))
	end

	slot0.flag = slot2
end

function slot0.doPlayStory(slot0)
	slot0.chapter.getChapterCell(slot2, slot0.chapter.fleet.line.row, slot0.chapter.fleet.line.column).flag = 1

	slot0.chapter.updateChapterCell(slot2, slot5)

	slot0.flag = bit.bor(slot0.flag, ChapterConst.DirtyAttachment)
end

function slot0.doAmbush(slot0)
	slot3 = slot0.chapter.fleet

	if slot0.op.arg1 == 1 then
		if slot2:getChapterCell(slot3.line.row, slot3.line.column).flag == 2 then
			slot2:clearChapterCell(slot4.row, slot4.column)
		end

		pg.TipsMgr.GetInstance():ShowTips((slot5.flag == 0 and i18n("chapter_tip_aovid_failed")) or i18n("chapter_tip_aovid_succeed"))
	end
end

function slot0.doStrategy(slot0)
	slot1 = slot0.flag
	slot4 = slot0.chapter.fleet

	if pg.strategy_data_template[slot0.op.arg1].type == ChapterConst.StgTypeForm then
		for slot9, slot10 in ipairs(slot4.stgIds) do
			if pg.strategy_data_template[slot10].type == ChapterConst.StgTypeForm then
				slot4.stgIds[slot9] = slot5.id
			end
		end

		PlayerPrefs.SetInt("team_formation_" .. slot4.id, slot5.id)
		pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_change", slot5.name))
	elseif slot5.type == ChapterConst.StgTypeConsume then
		slot4:consumeOneStrategy(slot5.id)
		pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_use", slot5.name))
	end

	if slot5.id == ChapterConst.StrategyExchange then
		slot3:getFleetById(slot2.arg2).line = slot3:getFleetById(slot2.id).line
		slot3.getFleetById(slot2.id).line = slot3.getFleetById(slot2.arg2).line
		slot1 = bit.bor(slot1, ChapterConst.DirtyFleet)
	end

	slot0.flag = bit.bor(slot1, ChapterConst.DirtyStrategy)
end

function slot0.doRepair(slot0)
	slot1 = getProxy(ChapterProxy)
	slot1.repairTimes = slot1.repairTimes + 1
	slot2, slot3, slot4 = ChapterConst.GetRepairParams()

	if slot2 < slot1.repairTimes then
		slot5 = getProxy(PlayerProxy)
		slot6 = slot5:getData()

		slot6:consume({
			gem = slot4
		})
		slot5:updatePlayer(slot6)
	end
end

function slot0.doSupply(slot0)
	slot1 = slot0.flag
	slot4, slot5 = slot0.chapter.getFleetAmmo(slot2, slot3)
	slot7 = slot0.chapter.getChapterCell(slot2, slot0.chapter.fleet.line.row, slot0.chapter.fleet.line.column)
	slot7.attachmentId = slot7.attachmentId - math.min(slot7.attachmentId, slot4 - slot5)
	slot0.chapter.fleet.restAmmo = slot0.chapter.fleet.restAmmo + math.min(slot7.attachmentId, slot4 - slot5)

	slot0.chapter.updateChapterCell(slot2, slot7)

	if slot7.attachmentId > 20 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply_p1", slot8))
	elseif slot7.attachmentId > 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply", slot8, slot7.attachmentId))
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_empty", slot8))
	end

	slot0.flag = bit.bor(slot1, ChapterConst.DirtyAttachment, ChapterConst.DirtyFleet)
end

function slot0.doSubState(slot0)
	slot0.chapter.subAutoAttack = slot0.op.arg1
	slot0.flag = bit.bor(slot0.flag, ChapterConst.DirtyStrategy)
end

function slot0.doCollectAI(slot0)
	slot2 = slot0.flag
	slot3 = slot0.chapter
	slot0.aiActs = {}

	if slot0.data.submarine_act_list then
		_.each(slot1.submarine_act_list, function (slot0)
			table.insert(slot0.aiActs, SubAIAction.New(slot0))
		end)
	end

	if slot1.escort_act_list then
		_.each(slot1.escort_act_list, function (slot0)
			table.insert(slot0.aiActs, TransportAIAction.New(slot0))
		end)
	end

	_.each(slot1.ai_act_list, function (slot0)
		table.insert(slot0.aiActs, ChapterAIAction.New(slot0))
	end)
	_.each(slot1.fleet_act_list, function (slot0)
		table.insert(slot0.aiActs, FleetAIAction.New(slot0))
	end)
end

function slot0.doBarrier(slot0)
	slot1 = slot0.flag
	slot6 = _.detect(pg.box_data_template.all, function (slot0)
		return pg.box_data_template[slot0].type == ChapterConst.BoxBarrier
	end)

	if slot0.chapter.getChapterCell(slot3, slot0.op.arg1, slot0.op.arg2).attachment ~= ChapterConst.AttachBox or slot4.attachmentId ~= slot6 then
		slot4.attachment = slot5
		slot4.attachmentId = slot6
		slot4.flag = 1
	end

	slot3.modelCount = slot3.modelCount + ((slot4.flag == 1 and -1) or 1)
	slot4.flag = 1 - slot4.flag

	slot3:updateChapterCell(slot4)

	slot0.flag = bit.bor(slot1, ChapterConst.DirtyAttachment, ChapterConst.DirtyStrategy)
end

function slot0.doRequest(slot0)
	slot2 = slot0.flag
	slot4 = slot0.chapter.fleet

	if #slot0.data.move_path > 0 then
		slot4.line = {
			row = slot1.move_path[#slot1.move_path].row,
			column = slot1.move_path[#slot1.move_path].column
		}
		slot2 = bit.bor(slot2, ChapterConst.DirtyFleet)
	end

	slot0.flag = slot2
end

function slot0.doSkipBattle(slot0)
	slot0.flag = bit.bor(slot0.flag, ChapterConst.DirtyAttachment, ChapterConst.DirtyAchieve, ChapterConst.DirtyFleet, ChapterConst.DirtyChampion)
end

function slot0.doTeleportSub(slot0)
	slot3 = _.detect(slot0.chapter.fleets, function (slot0)
		return slot0:getFleetType() == FleetType.Submarine and slot0:isValid()
	end)
	slot3.line = {
		row = slot0.op.arg1,
		column = slot0.op.arg2
	}
	slot3.startPos = {
		row = slot0.op.arg1,
		column = slot0.op.arg2
	}
	slot0.fullpath = {
		slot3.startPos,
		slot3.line
	}
end

function slot0.doEnemyRound(slot0)
	slot0.chapter.IncreaseRound(slot1)

	if slot0.chapter.getPlayType(slot1) == ChapterConst.TypeDefence then
		slot0.flag = bit.bor(slot0.flag, ChapterConst.DirtyAttachment)
	end
end

return slot0
