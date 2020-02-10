slot0 = class("MonopolyOPCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not getProxy(ActivityProxy):getActivityById(slot1:getBody().activity_id) or slot4:isEnd() then
		return
	end

	slot8.activity_id = slot2.activity_id
	slot8.cmd = slot2.cmd
	slot8.arg1 = slot2.arg1
	slot8.arg2 = slot2.arg2

	pg.ConnectionMgr.GetInstance():Send(11202, {}, 11203, function (slot0)
		if slot0.result == 0 then
			slot2 = {}

			for slot6, slot7 in ipairs(slot0.award_list) do
				slot8.type = slot7.type
				slot8.id = slot7.id
				slot8.count = slot7.number

				table.insert({}, {})
			end

			slot2 = PlayerConst.tranOwnShipSkin(slot1)

			for slot6, slot7 in ipairs(slot1) do
				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
			end

			if uv1.cmd == ActivityConst.MONOPOLY_OP_AWARD then
				uv2.data2_list[2] = uv2.data2_list[2] + 1

				uv3:updateActivity(uv2)

				slot7.awards = slot2

				uv0:sendNotification(GAME.MONOPOLY_AWARD_DONE, {})
			else
				for slot9, slot10 in ipairs(slot0.number) do
					if slot9 > 2 then
						table.insert({}, slot10)

						slot5 = "" .. "-" .. slot10
					end
				end

				slot6 = slot0.number[1]
				slot7 = slot0.number[2]
				slot8 = #slot4 > 0 and slot4[#slot4] or uv2.data2

				if table.contains(slot4, 1) then
					uv2.data1_list[3] = uv2.data1_list[3] + 1
				end

				if slot3 == ActivityConst.MONOPOLY_OP_THROW then
					uv2.data3 = slot6
					uv2.data1_list[2] = uv2.data1_list[2] + 1
					uv2.data2_list[1] = math.floor(uv2.data1_list[2] / uv2:getDataConfig("reward_time"))

					uv3:updateActivity(uv2)

					if uv1.callback then
						uv1.callback(slot6)
					end
				elseif slot3 == ActivityConst.MONOPOLY_OP_MOVE then
					uv2.data3 = slot6
					uv2.data2 = slot8

					uv3:updateActivity(uv2)

					if uv1.callback then
						uv1.callback(slot6, slot4, slot7)
					end
				elseif slot3 == ActivityConst.MONOPOLY_OP_TRIGGER then
					slot9 = uv1.callback or function ()
					end
					uv2.data3 = slot6
					uv2.data2 = slot8
					uv2.data4 = 0

					uv3:updateActivity(uv2)

					if #slot2 > 0 then
						slot13.awards = slot2

						function slot13.callback()
							uv0(uv1, uv2)
						end

						uv0:sendNotification(GAME.MONOPOLY_AWARD_DONE, {})
					else
						slot9(slot4, slot7)
					end
				end
			end
		else
			if uv1.callback then
				uv1.callback()
			end

			print("Monopoly Activity erro code" .. slot0.result .. " cmd:" .. uv1.cmd)
		end
	end)
end

return slot0
