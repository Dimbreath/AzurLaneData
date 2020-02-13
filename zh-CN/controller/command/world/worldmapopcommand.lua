slot0 = class("WorldMapOpCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(33103, {
		act = slot1:getBody().op,
		group_id = slot1.getBody().id or 0,
		act_arg_1 = slot2.arg1,
		act_arg_2 = slot2.arg2,
		pos_list = slot2.locations or {}
	}, 33104, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(WorldProxy)
			slot4 = slot1:GetWorld().GetActiveMap(slot2).GetFleet(slot3)
			slot0.drops = slot1:BuildDrop(slot0.drop_list)
			slot0.updateAttachments = slot1:NetBuildMapAttachments(slot0.item_list)
			slot0.updateTerrains = slot1:NetBulidMapTerrains(slot0.land_list)

			if slot0.op == WorldConst.OpReqMove then
				slot1:BuildFleetMove(slot0.move_path, slot0)
			elseif slot0.op == WorldConst.OpReqRetreat then
				slot0.updateFleets = slot1:NetBuildMapFleets(slot0.item_list)
			elseif slot0.op == WorldConst.OpReqEvent then
				if slot0.attachment:GetEventEffect().effect_type == WorldMapAttachment.EffectEventTeleport then
					slot1:BuildTransfer(slot0, slot0)
				elseif slot5.effect_type == WorldMapAttachment.EffectEventBlink1 or slot5.effect_type == WorldMapAttachment.EffectEventBlink2 then
					slot0.childOps = slot1:BuildBlinkAction(slot0.attachment, slot0.updateAttachments)
				elseif slot5.effect_type == WorldMapAttachment.EffectEventTeleportEvent then
					slot0.updateFleets = slot1:NetBuildMapFleets(slot0.item_list)
				end
			elseif slot0.op == WorldConst.OpReqTransport then
				slot1:BuildTransfer(slot0, slot0)
			elseif slot0.op == WorldConst.OpReqReturn then
				slot1:BuildTransfer(slot0, slot0)
			elseif slot0.op == WorldConst.OpReqRound then
				_.each(slot6, function (slot0)
					table.insert(slot0, slot0)
				end)
				_.each(slot1:BuildAttachmentAction(slot0.ai_act_list), function (slot0)
					table.insert(slot0, slot0)
				end)

				slot0.childOps = {}
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_map_op_error_", slot0.result))
		end

		slot1:sendNotification(GAME.WORLD_MAP_OP_DONE, {
			result = slot0.result,
			mapOp = slot0
		})
	end)
end

function slot0.BuildDrop(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		table.insert(slot2, slot8)
		slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
	end

	return slot2
end

function slot0.BuildTransfer(slot0, slot1, slot2)
	slot2.destMapId, slot2.destGridId = WorldMap.ParseMapGridId(slot1.id)
	slot2.updateFleets = getProxy(WorldProxy):NetBuildMapFleets(slot1.item_list)
end

function slot0.BuildFleetMove(slot0, slot1, slot2)
	slot3 = nil
	slot6 = getProxy(WorldProxy).GetWorld(slot4).GetActiveMap(slot5)
	slot8 = {
		row = slot6:GetFleet().row,
		column = slot6.GetFleet().column
	}

	if slot6:GetCell(slot1[#slot1].row, slot1[#slot1].column):GetAliveAndVisibleAttachment() and slot11.type == WorldMapAttachment.TypeEvent and (slot11:GetSpEventType() == WorldMapAttachment.SpEventHaibao or slot11:GetSpEventType() == WorldMapAttachment.SpEventFufen) and slot0:BuildBlinkAction(slot11, slot2.updateAttachments) then
		if #slot1 >= 2 then
			slot12 = WorldMapOp.New()
			slot12.op = WorldConst.OpActionFleetMove
			slot12.id = slot2.id
			slot12.arg1 = slot2.arg1
			slot12.arg2 = slot2.arg2
			slot13 = _.slice(slot1, 1, #slot1 - 1)

			slot0:BuildFleetPath(slot13, slot8, slot12, slot2.updateAttachments)
			table.insert(slot3, 1, slot12)

			slot8 = slot13[#slot13]
		end

		slot12 = WorldMapOp.New()
		slot12.op = WorldConst.OpActionFleetMove
		slot12.id = slot2.id
		slot12.arg1 = slot2.arg1
		slot12.arg2 = slot2.arg2

		slot0:BuildFleetPath({
			slot9
		}, slot8, slot12, slot2.updateAttachments)
		table.insert(slot3, slot12)
	end

	if not slot3 then
		slot12 = WorldMapOp.New()
		slot12.op = WorldConst.OpActionFleetMove
		slot12.id = slot2.id
		slot12.arg1 = slot2.arg1
		slot12.arg2 = slot2.arg2

		slot0:BuildFleetPath(slot1, slot8, slot12, slot2.updateAttachments)

		slot3 = {
			slot12
		}
	end

	slot2.childOps = slot3
	slot2.path = _.rest(slot1, 1)
end

function slot0.BuildFleetPath(slot0, slot1, slot2, slot3, slot4)
	slot8 = getProxy(WorldProxy).GetWorld(slot5).GetActiveMap(slot6).GetFleet(slot7)
	slot9 = {}

	if #slot1 > 0 then
		slot11, slot12 = slot7:FindPath(slot2, {
			row = slot3.arg1,
			column = slot3.arg2
		})

		if slot11 < PathFinding.PrioObstacle then
			slot9 = {}

			for slot16, slot17 in ipairs(slot12) do
				if slot1[slot16] == nil or slot1[slot16].row ~= slot17.row or slot1[slot16].column ~= slot17.column then
					break
				end

				table.insert(slot9, slot17)
			end
		else
			slot9 = _.rest(slot1, 1)
		end

		table.insert(slot9, 1, {
			row = slot2.row,
			column = slot2.column
		})
	end

	slot10 = {}
	slot11 = {}
	slot12 = {}

	_.each(slot1, function (slot0)
		slot1 = WorldMapOp.New()
		slot1.op = WorldConst.OpActionMoveStep
		slot1.id = slot0.id
		slot1.row = slot0.row
		slot1.column = slot0.column
		slot1.updateAttachments = {}
		slot1.hiddenCells = {}
		slot1.hiddenAttachments = {}
		slot2 = slot1.theme

		for slot6, slot7 in pairs(slot1.cells) do
			slot9 = WorldConst.InFOVRange(slot0.row, slot0.column, slot7.row, slot7.column, slot1:GetFOVRange(slot2, slot0.row, slot0.column))
			slot10 = slot7.row .. "_" .. slot7.column

			if not slot7.discovered and slot9 and not slot3[slot10] then
				slot3[slot10] = true

				table.insert(slot1.hiddenCells, slot7)
				table.insert(slot4, {
					row = slot7.row,
					column = slot7.column
				})
				_.each(slot7.attachments, function (slot0)
					if slot0:ShouldMarkAsLurk() then
						slot0:UpdateLurk(true)
						table.insert(slot0.hiddenAttachments, slot0)
					end
				end)

				for slot14 = #slot5, 1, -1 do
					if slot5[slot14].row == slot7.row and slot15.column == slot7.column then
						table.insert(slot1.updateAttachments, slot15)

						if slot15:ShouldMarkAsLurk() then
							table.insert(slot1.hiddenAttachments, slot15)
						end

						table.remove(slot5, slot14)
					end
				end
			end
		end

		table.insert(slot6, slot1)
	end)

	slot15 = slot7:GetCell(slot8.row, slot8.column).GetTerrain(slot14)

	for slot19, slot20 in ipairs(slot13) do
		slot23 = slot14:GetTerrain() == WorldMapCell.TerrainWind and slot14.terrainStrong >= #slot13
		slot24 = slot14:GetTerrain() ~= WorldMapCell.TerrainWind and slot15 == WorldMapCell.TerrainStream and (slot15 == slot7:GetCell(slot20.row, slot20.column).GetTerrain(slot21) or slot19 == #slot13)
		slot25 = slot14:GetTerrain() ~= WorldMapCell.TerrainWind and slot15 == WorldMapCell.TerrainIce and (slot15 == slot7.GetCell(slot20.row, slot20.column).GetTerrain(slot21) or slot19 == #slot13)

		if slot23 then
			slot20.duration = WorldConst.WindBlowStepDuration
		end

		if slot24 then
			slot20.duration = WorldConst.StreamMoveStepDuration
		end

		if slot25 then
			slot20.duration = WorldConst.IceMoveStepDuration
		end

		slot15 = slot22
	end

	slot3.stepOps = slot10
	slot3.path = slot13
	slot3.fullPath = slot9
	slot3.locations = slot12
end

function slot0.BuildFleetAction(slot0, slot1)
	slot4 = getProxy(WorldProxy).GetWorld(slot2).GetActiveMap(slot3)

	_.each(slot1, function (slot0)
		slot3 = slot0:FindFleet(slot1, slot2)
		slot4 = slot1:NetBuildMapAttachments(slot0.item_list)

		if #_.rest(slot0.move_path, 1) > 0 then
			slot7 = slot0:GetCell(slot1, slot2).GetTerrain(slot6)
			slot8 = {
				row = slot1,
				column = slot2
			}
			slot9 = {}

			for slot13, slot14 in ipairs(slot5) do
				slot16 = slot0:GetCell(slot14.row, slot14.column).GetTerrain(slot15)

				table.insert(slot9, slot14)

				slot17 = slot6:GetTerrain() == WorldMapCell.TerrainWind and slot6.terrainStrong <= #slot9
				slot18 = slot6:GetTerrain() ~= WorldMapCell.TerrainWind and slot16 == WorldMapCell.TerrainStream and slot16 ~= slot7
				slot19 = slot6:GetTerrain() ~= WorldMapCell.TerrainWind and slot16 == WorldMapCell.TerrainIce and slot16 ~= slot7

				if slot17 or slot18 or slot19 or slot13 == #slot5 then
					slot20 = WorldMapOp.New()
					slot20.op = WorldConst.OpActionFleetMove
					slot20.id = slot3.id
					slot20.arg1 = slot9[#slot9].row
					slot20.arg2 = slot9[#slot9].column

					slot2:BuildFleetPath(slot9, slot8, slot20, slot4)

					if slot13 == #slot5 then
						slot20.updateAttachments = slot4
					end

					table.insert(slot3, slot20)

					slot8 = slot21
					slot6 = slot15
					slot9 = {}
				end

				slot7 = slot16
			end
		end
	end)

	return {}
end

function slot0.BuildAttachmentPath(slot0, slot1, slot2)
	slot5 = getProxy(WorldProxy).GetWorld(slot3).GetActiveMap(slot4)

	table.insert(slot7, 1, {
		row = slot2.attachment.row,
		column = slot2.attachment.column
	})

	slot2.path = _.rest(slot1, 1)
	slot2.fullPath = _.rest(slot1, 1)
end

function slot0.BuildAttachmentAction(slot0, slot1)
	slot4 = getProxy(WorldProxy).GetWorld(slot2).GetActiveMap(slot3)

	_.each(slot1, function (slot0)
		slot4 = slot0:GetCell(slot1, slot2).FindAliveAttachment(slot3, WorldMapAttachment.TypeEnemyAI)
		slot5 = WorldMapOp.New()

		if #slot0.move_path > 0 then
			slot6 = slot0.move_path[#slot0.move_path]
			slot5.op = WorldConst.OpActionAttachmentMove
			slot5.attachment = slot4

			slot1:BuildAttachmentPath(slot0.move_path, slot5)
			table.insert(slot2, slot5)
		end
	end)

	return {}
end

function slot0.BuildBlinkAction(slot0, slot1, slot2)
	slot3 = nil
	slot4 = _.detect(slot2, function (slot0)
		return slot0.type == slot0.type and slot0.id == slot0.id
	end)

	if slot1:GetSpEventType() == WorldMapAttachment.SpEventHaibao then
		slot6 = WorldMapOp.New()
		slot6.op = WorldConst.OpActionAttachmentAnim
		slot6.attachment = slot1
		slot6.anim = WorldConst.ActionVanish
		slot6.updateAttachments = {}

		for slot10 = #slot2, 1, -1 do
			if (slot2[slot10].row == slot1.row and slot11.column == slot1.column) or (slot4 and slot11.row == slot4.row and slot11.column == slot4.column) then
				table.insert(slot6.updateAttachments, slot11)
				table.remove(slot2, slot10)
			end
		end

		slot3 = {
			slot6
		}

		if slot4 then
			slot7 = WorldMapOp.New()
			slot7.op = WorldConst.OpActionAttachmentAnim
			slot7.attachment = slot4
			slot7.anim = WorldConst.ActionAppear

			table.insert(slot3, slot7)
		end
	elseif slot5 == WorldMapAttachment.SpEventFufen and slot4 then
		slot9, slot10 = getProxy(WorldProxy).GetWorld(slot6).GetActiveMap(slot7).FindAIPath(slot8, {
			row = slot1.row,
			column = slot1.column
		}, {
			row = slot4.row,
			column = slot4.column
		})

		if slot9 < PathFinding.PrioObstacle then
			slot11 = WorldMapOp.New()
			slot11.op = WorldConst.OpActionAttachmentMove
			slot11.attachment = slot1

			slot0:BuildAttachmentPath(slot10, slot11)

			slot3 = {
				slot11
			}
		end
	end

	return slot3
end

return slot0
