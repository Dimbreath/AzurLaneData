slot0 = class("ColoringCellCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot9.act_id = slot2.activityId
	slot9.id = slot2.id
	slot9.cell_list = slot2.cells

	pg.ConnectionMgr.GetInstance():Send(26004, {}, 26005, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ColoringProxy)
			slot2 = slot1:getColorItems()
			slot4 = slot1:getColorGroup(uv0):getConfig("color_id_list")

			_.each(uv1, function (slot0)
				uv0:setFill(slot0.row, slot0.column, slot0.color)

				if not uv0:canBeCustomised() and slot0.color > 0 then
					slot1 = uv1[slot0.color]
					uv2[slot1] = math.max(uv2[slot1] - 1, 0)
				end
			end)

			slot9.cells = uv1
			slot9.stateChange = slot1:checkState()

			uv2:sendNotification(GAME.COLORING_CELL_DONE, {})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("coloring_cell", slot0.result))
	end)
end

return slot0
