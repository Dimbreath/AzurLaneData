slot0 = class("WorldSubmitTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.taskId
	slot5 = slot2.callback

	print("submit task ", slot4, " -- fleetid ", slot2.fleetId)

	if not getProxy(WorldProxy):GetWorld():getTaskProxy():getTaskById(slot4) then
		return
	end

	slot10, slot11 = slot9:canSubmit(slot3)

	if not slot10 then
		pg.TipsMgr.GetInstance():ShowTips(slot11)

		return
	end

	function slot12(slot0, slot1, slot2)
		slot3 = {}
		slot4 = {}

		for slot9, slot10 in ipairs(slot0:GetShipVOs()) do
			table.insert(slot3, Clone(slot10))
			slot10:setIntimacy(slot10:getIntimacy() + slot2)
			slot10:addExp(slot1)
			getProxy(BayProxy):updateShip(slot10)
			table.insert(slot4, slot10)
		end

		return {
			oldships = slot3,
			newships = slot4
		}
	end

	pg.ConnectionMgr.GetInstance():Send(33207, {
		taskId = slot4
	}, 33208, function (slot0)
		if slot0.result == 0 then
			slot1 = {}
			slot2 = slot0.exp
			slot3 = slot0.intimacy

			if uv0:isSharing() then
				for slot8, slot9 in pairs(uv1:GetFleets()) do
					table.insert(slot1, uv2(slot9, slot2, slot3))
				end
			else
				table.insert(slot1, uv2(uv1:GetFleet(uv3), slot2, slot3))
			end

			for slot8, slot9 in ipairs(slot0.drops) do
				slot10 = Item.New({
					type = slot9.type,
					id = slot9.id,
					count = slot9.number
				})

				table.insert({}, slot10)
				uv4:sendNotification(GAME.ADD_ITEM, slot10)
			end

			uv0:commited()
			uv5:updateTask(uv0)
			uv5:riseTaskFinishCount()

			slot5 = nil

			coroutine.wrap(function ()
				if #uv0.config.task_ed > 0 then
					pg.StoryMgr.GetInstance():Play(uv0.config.task_ed, uv1, true)
					coroutine.yield()
				end

				uv2:sendNotification(GAME.WORLD_SUMBMIT_TASK_DONE, {
					drops = uv3,
					expfleets = uv4
				})
			end)()

			if uv6 then
				uv6()
			end

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", slot0.result))
	end)
end

return slot0
