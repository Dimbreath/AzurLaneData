class("ColoringCellCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(26004, {
		act_id = slot2.activityId,
		id = slot2.id,
		cell_list = slot2.cells
	}, 26005, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ColoringProxy)
			slot4 = slot1:getColorGroup(slot0).getConfig(slot3, "color_id_list")

			_.each(slot1, function (slot0)
				slot0:setFill(slot0.row, slot0.column, slot0.color)

				if not slot0:canBeCustomised() and slot0.color > 0 then
					slot0.color[slot1[slot0.color]] = math.max(slot2[slot1[slot0.color]] - 1, 0)
				end
			end)
			slot2:sendNotification(GAME.COLORING_CELL_DONE, {
				cells = slot1,
				stateChange = slot1:checkState()
			})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_cell", slot0.result))
	end)
end

return class("ColoringCellCommand", pm.SimpleCommand)
