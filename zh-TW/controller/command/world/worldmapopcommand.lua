slot0 = class("WorldMapOpCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(33103, {
		act = slot2.op,
		group_id = slot2.id or 0,
		act_arg_1 = slot2.arg1,
		act_arg_2 = slot2.arg2,
		pos_list = slot2.locations or {}
	}, 33104, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(WorldProxy)
			slot4 = slot1:GetWorld():GetActiveMap():GetFleet()
			uv0.drops = uv1:BuildDrop(slot0.drop_list)
			uv0.updateAttachments = slot1:NetBuildMapAttachments(slot0.item_list)
			uv0.updateTerrains = slot1:NetBulidMapTerrains(slot0.land_list)

			if uv0.op == WorldConst.OpReqMove then
				uv1:BuildFleetMove(slot0.move_path, uv0)
			elseif uv0.op == WorldConst.OpReqRetreat then
				uv0.updateFleets = slot1:NetBuildMapFleets(slot0.item_list)
			elseif uv0.op == WorldConst.OpReqEvent then
				if uv0.attachment:GetEventEffect().effect_type == WorldMapAttachment.EffectEventTeleport then
					uv1:BuildTransfer(slot0, uv0)
				elseif slot5.effect_type == WorldMapAttachment.EffectEventBlink1 or slot5.effect_type == WorldMapAttachment.EffectEventBlink2 then
					uv0.childOps = uv1:BuildBlinkAction(uv0.attachment, uv0.updateAttachments)
				elseif slot5.effect_type == WorldMapAttachment.EffectEventTeleportEvent then
					uv0.updateFleets = slot1:NetBuildMapFleets(slot0.item_list)
				end
			elseif uv0.op == WorldConst.OpReqTransport then
				uv1:BuildTransfer(slot0, uv0)
			elseif uv0.op == WorldConst.OpReqReturn then
				uv1:BuildTransfer(slot0, uv0)
			elseif uv0.op == WorldConst.OpReqRound then
				_.each(uv1:BuildFleetAction(slot0.fleet_act_list), function (slot0)
					table.insert(uv0, slot0)
				end)
				_.each(uv1:BuildAttachmentAction(slot0.ai_act_list), function (slot0)
					table.insert(uv0, slot0)
				end)

				uv0.childOps = {}
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_map_op_error_", slot0.result))
		end

		uv1:sendNotification(GAME.WORLD_MAP_OP_DONE, {
			result = slot0.result,
			mapOp = uv0
		})
	end)
end

function slot0.BuildDrop(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot8 = Item.New(slot7)

		table.insert(slot2, slot8)
		slot0:sendNotification(GAME.ADD_ITEM, slot8)
	end

	return slot2
end

function slot0.BuildTransfer(slot0, slot1, slot2)
	slot2.destMapId, slot2.destGridId = WorldMap.ParseMapGridId(slot1.id)
	slot2.updateFleets = getProxy(WorldProxy):NetBuildMapFleets(slot1.item_list)
end

function slot0.BuildFleetMove(slot0, slot1, slot2)
	slot3 = nil
	slot6 = getProxy(WorldProxy):GetWorld():GetActiveMap()
	slot7 = slot6:GetFleet()
	slot9 = slot1[#slot1]

	if slot6:GetCell(slot9.row, slot9.column):GetAliveAndVisibleAttachment() and slot11.type == WorldMapAttachment.TypeEvent and (slot11:GetSpEventType() == WorldMapAttachment.SpEventHaibao or slot11:GetSpEventType() == WorldMapAttachment.SpEventFufen) and slot0:BuildBlinkAction(slot11, slot2.updateAttachments) then
		if #slot1 >= 2 then
			slot12 = WorldMapOp.New()
			slot12.op = WorldConst.OpActionFleetMove
			slot12.id = slot2.id
			slot12.arg1 = slot2.arg1
			slot12.arg2 = slot2.arg2
			slot13 = _.slice(slot1, 1, #slot1 - 1)

			slot0:BuildFleetPath(slot13, {
				row = slot7.row,
				column = slot7.column
			}, slot12, slot2.updateAttachments)
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
	slot8 = getProxy(WorldProxy):GetWorld():GetActiveMap():GetFleet()
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
		slot1.id = uv0.id
		slot1.row = slot0.row
		slot1.column = slot0.column
		slot1.updateAttachments = {}
		slot1.hiddenCells = {}
		slot1.hiddenAttachments = {}
		slot2 = uv1.theme

		for slot6, slot7 in pairs(uv1.cells) do
			slot10 = slot7.row .. "_" .. slot7.column

			if not slot7.discovered and WorldConst.InFOVRange(slot0.row, slot0.column, slot7.row, slot7.column, uv1:GetFOVRange(uv2, slot0.row, slot0.column)) and not uv3[slot10] then
				uv3[slot10] = true

				table.insert(slot1.hiddenCells, slot7)

				slot14 = slot7.column

				table.insert(uv4, {
					row = slot7.row,
					column = slot14
				})
				_.each(slot7.attachments, function (slot0)
					if slot0:ShouldMarkAsLurk() then
						slot0:UpdateLurk(true)
						table.insert(uv0.hiddenAttachments, slot0)
					end
				end)

				for slot14 = #uv5, 1, -1 do
					if uv5[slot14].row == slot7.row and slot15.column == slot7.column then
						table.insert(slot1.updateAttachments, slot15)

						if slot15:ShouldMarkAsLurk() then
							table.insert(slot1.hiddenAttachments, slot15)
						end

						table.remove(uv5, slot14)
					end
				end
			end
		end

		table.insert(uv6, slot1)
	end)

	slot15 = slot7:GetCell(slot8.row, slot8.column):GetTerrain()

	for slot19, slot20 in ipairs(_.map(slot1, function (slot0)
		return {
			row = slot0.row,
			column = slot0.column
		}
	end)) do
		slot22 = slot7:GetCell(slot20.row, slot20.column):GetTerrain()
		slot24 = slot14:GetTerrain() ~= WorldMapCell.TerrainWind and slot15 == WorldMapCell.TerrainStream and (slot15 == slot22 or slot19 == #slot13)
		slot25 = slot14:GetTerrain() ~= WorldMapCell.TerrainWind and slot15 == WorldMapCell.TerrainIce and (slot15 == slot22 or slot19 == #slot13)

		if slot14:GetTerrain() == WorldMapCell.TerrainWind and slot14.terrainStrong >= #slot13 then
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
	slot4 = getProxy(WorldProxy):GetWorld():GetActiveMap()

	_.each(slot1, function (slot0)
		slot3 = uv0:FindFleet(slot0.ai_pos.row, slot0.ai_pos.column)
		slot4 = uv1:NetBuildMapAttachments(slot0.item_list)

		if #_.rest(slot0.move_path, 1) > 0 then
			slot7 = uv0:GetCell(slot1, slot2):GetTerrain()
			slot9 = {}

			for slot13, slot14 in ipairs(slot5) do
				slot16 = uv0:GetCell(slot14.row, slot14.column):GetTerrain()

				table.insert(slot9, slot14)

				if slot6:GetTerrain() == WorldMapCell.TerrainWind and slot6.terrainStrong <= #slot9 or slot6:GetTerrain() ~= WorldMapCell.TerrainWind and slot16 == WorldMapCell.TerrainStream and slot16 ~= slot7 or slot6:GetTerrain() ~= WorldMapCell.TerrainWind and slot16 == WorldMapCell.TerrainIce and slot16 ~= slot7 or slot13 == #slot5 then
					slot20 = WorldMapOp.New()
					slot21 = slot9[#slot9]
					slot20.op = WorldConst.OpActionFleetMove
					slot20.id = slot3.id
					slot20.arg1 = slot21.row
					slot20.arg2 = slot21.column

					uv2:BuildFleetPath(slot9, {
						row = slot1,
						column = slot2
					}, slot20, slot4)

					if slot13 == #slot5 then
						slot20.updateAttachments = slot4
					end

					table.insert(uv3, slot20)

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
	slot5 = getProxy(WorldProxy):GetWorld():GetActiveMap()
	slot7 = _.rest(slot1, 1)

	table.insert(slot7, 1, {
		row = slot2.attachment.row,
		column = slot2.attachment.column
	})

	slot2.path = _.rest(slot1, 1)
	slot2.fullPath = slot7
end

function slot0.BuildAttachmentAction(slot0, slot1)
	slot4 = getProxy(WorldProxy):GetWorld():GetActiveMap()

	_.each(slot1, function (slot0)
		slot5 = WorldMapOp.New()

		if #slot0.move_path > 0 then
			slot6 = slot0.move_path[#slot0.move_path]
			slot5.op = WorldConst.OpActionAttachmentMove
			slot5.attachment = uv0:GetCell(slot0.ai_pos.row, slot0.ai_pos.column):FindAliveAttachment(WorldMapAttachment.TypeEnemyAI)

			uv1:BuildAttachmentPath(slot0.move_path, slot5)
			table.insert(uv2, slot5)
		end
	end)

	return {}
end

function slot0.BuildBlinkAction(slot0, slot1, slot2)
	slot3 = nil
	slot4 = _.detect(slot2, function (slot0)
		return slot0.type == uv0.type and slot0.id == uv0.id
	end)

	if slot1:GetSpEventType() == WorldMapAttachment.SpEventHaibao then
		slot6 = WorldMapOp.New()
		slot6.op = WorldConst.OpActionAttachmentAnim
		slot6.attachment = slot1
		slot6.anim = WorldConst.ActionVanish
		slot6.updateAttachments = {}

		for slot10 = #slot2, 1, -1 do
			if slot2[slot10].row == slot1.row and slot11.column == slot1.column or slot4 and slot11.row == slot4.row and slot11.column == slot4.column then
				table.insert(slot6.updateAttachments, slot11)
				table.remove(slot2, slot10)
			end
		end

		if slot4 then
			slot7 = WorldMapOp.New()
			slot7.op = WorldConst.OpActionAttachmentAnim
			slot7.attachment = slot4
			slot7.anim = WorldConst.ActionAppear

			table.insert({
				slot6
			}, slot7)
		end
	elseif slot5 == WorldMapAttachment.SpEventFufen and slot4 then
		slot9, slot10 = getProxy(WorldProxy):GetWorld():GetActiveMap():FindAIPath({
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
