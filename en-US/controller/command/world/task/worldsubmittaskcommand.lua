slot0 = class("WorldSubmitTaskCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.taskId
	slot4 = slot2.callback
	slot5 = nowWorld
	slot6 = slot5:GetInventoryProxy()

	print("submit task ", slot3)

	if not slot5:GetTaskProxy():getTaskById(slot3) then
		return
	end

	table.insert({}, function (slot0)
		slot1, slot2 = uv0:canSubmit()

		if slot1 then
			slot0()
		else
			pg.TipsMgr.GetInstance():ShowTips(slot2)
		end
	end)

	if not slot8:IsAutoSubmit() and (slot8.config.complete_condition == WorldConst.TaskTypeSubmitItem and slot8.config.item_retrieve == 1) then
		table.insert(slot9, function (slot0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("sub_item_warning"),
				items = {
					{
						type = DROP_TYPE_WORLD_ITEM,
						id = uv0.config.complete_parameter[1],
						count = uv0:getMaxProgress()
					}
				},
				onYes = slot0
			})
		end)
	end

	seriesAsync(slot9, function ()
		pg.ConnectionMgr.GetInstance():Send(33207, {
			taskId = uv0
		}, 33208, function (slot0)
			if slot0.result == 0 then
				slot3 = slot0.exp

				for slot9, slot10 in pairs(uv0:GetFleets()) do
					if slot3 > 0 then
						table.insert({}, function (slot0, slot1, slot2)
							slot3 = getProxy(BayProxy)
							slot4 = {}
							slot5 = {}

							for slot10, slot11 in ipairs(slot0:GetShipVOs()) do
								table.insert(slot4, slot11)

								slot12 = slot3:getShipById(slot11.id)

								slot12:setIntimacy(slot12:getIntimacy() + slot2)
								slot12:addExp(slot1)
								slot3:updateShip(slot12)
								table.insert(slot5, WorldConst.FetchShipVO(slot11.id))
							end

							return {
								oldships = slot4,
								newships = slot5
							}
						end(slot10, slot3, slot0.intimacy))
					end
				end

				for slot10, slot11 in ipairs(slot0.drops) do
					slot12 = Item.New({
						type = slot11.type,
						id = slot11.id,
						count = slot11.number
					})

					table.insert({}, slot12)
					uv1:sendNotification(GAME.ADD_ITEM, slot12)
				end

				uv2:commited()
				uv3:updateTask(uv2)
				uv3:riseTaskFinishCount()
				uv0:UpdateProgress(uv2.config.complete_stage)

				if uv4 then
					uv5:RemoveItem(uv2.config.complete_parameter[1], uv2:getMaxProgress())
				end

				slot7 = nil

				coroutine.wrap(function ()
					if #uv0.config.task_ed > 0 then
						pg.NewStoryMgr.GetInstance():Play(uv0.config.task_ed, uv1, true)
						coroutine.yield()
					end

					uv2:sendNotification(GAME.WORLD_SUMBMIT_TASK_DONE, {
						task = uv0,
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
	end)
end

return slot0
