class("MonopolyOPCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id) or slot4:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = slot2.activity_id,
		cmd = slot2.cmd,
		arg1 = slot2.arg1,
		arg2 = slot2.arg2
	}, 11203, function (slot0)
		if slot0.result == 0 then
			slot1 = {}
			slot2 = {}

			for slot6, slot7 in ipairs(slot0.award_list) do
				table.insert(slot1, {
					type = slot7.type,
					id = slot7.id,
					count = slot7.number
				})
			end

			slot2 = PlayerConst.tranOwnShipSkin(slot1)

			for slot6, slot7 in ipairs(slot1) do
				slot0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
			end

			if slot1.cmd == ActivityConst.MONOPOLY_OP_AWARD then
				slot2.data2_list[2] = slot2.data2_list[2] + 1

				slot3:updateActivity(slot2)
				slot0:sendNotification(GAME.MONOPOLY_AWARD_DONE, {
					awards = slot2
				})
			else
				slot4 = {}
				slot5 = ""

				for slot9, slot10 in ipairs(slot0.number) do
					if slot9 > 2 then
						table.insert(slot4, slot10)

						slot5 = slot5 .. "-" .. slot10
					end
				end

				slot6 = slot0.number[1]
				slot7 = slot0.number[2]
				slot8 = (#slot4 > 0 and slot4[#slot4]) or slot2.data2

				if table.contains(slot4, 1) then
					slot2.data1_list[3] = slot2.data1_list[3] + 1
				end

				if slot3 == ActivityConst.MONOPOLY_OP_THROW then
					slot2.data3 = slot6
					slot2.data1_list[2] = slot2.data1_list[2] + 1
					slot2.data2_list[1] = math.floor(slot2.data1_list[2] / slot2:getDataConfig("reward_time"))

					slot3:updateActivity(slot2)

					if slot1.callback then
						slot1.callback(slot6)
					end
				elseif slot3 == ActivityConst.MONOPOLY_OP_MOVE then
					slot2.data3 = slot6
					slot2.data2 = slot8

					slot3:updateActivity(slot2)

					if slot1.callback then
						slot1.callback(slot6, slot4, slot7)
					end
				elseif slot3 == ActivityConst.MONOPOLY_OP_TRIGGER then
					slot9 = slot1.callback or function ()
						return
					end
					slot2.data3 = slot6
					slot2.data2 = slot8
					slot2.data4 = 0

					slot3:updateActivity(slot2)

					if #slot2 > 0 then
						slot0:sendNotification(GAME.MONOPOLY_AWARD_DONE, {
							awards = slot2,
							callback = function ()
								slot0(slot1, slot2)
							end
						})
					else
						slot9(slot4, slot7)
					end
				end
			end
		else
			if slot1.callback then
				slot1.callback()
			end

			print("Monopoly Activity erro code" .. slot0.result .. " cmd:" .. slot1.cmd)
		end
	end)
end

return class("MonopolyOPCommand", pm.SimpleCommand)
