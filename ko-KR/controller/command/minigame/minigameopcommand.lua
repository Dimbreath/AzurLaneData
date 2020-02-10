slot0 = class("MiniGameOPCommand", pm.SimpleCommand)
slot0.CMD_COMPLETE = 1
slot0.CMD_ULTIMATE = 2
slot0.CMD_SPECIAL_GAME = 3

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.hubid

	if slot2.cmd == uv0.CMD_COMPLETE and 2 > #slot2.args1 then
		for slot10 = #slot5, slot6 - 1, 1 do
			table.insert(slot5, 0)
		end
	end

	slot7 = slot2.cbFunc
	slot11.hubid = slot3
	slot11.cmd = slot4
	slot11.args1 = slot5

	pg.ConnectionMgr.GetInstance():Send(26103, {}, 26104, function (slot0)
		if slot0.result == 0 then
			if slot0.hub.id > 0 then
				getProxy(MiniGameProxy):UpdataHubData(slot0.hub)
			end

			if slot0.data.id > 0 then
				MiniGameDataCreator.DataCreateFunc(uv0, uv1, slot0.data.datas)
			end

			for slot6, slot7 in ipairs(slot0.award_list) do
				slot8 = {
					type = slot7.type,
					id = slot7.id,
					count = slot7.number
				}

				table.insert({}, slot8)
				uv2:sendNotification(GAME.ADD_ITEM, Item.New(slot8))
			end

			if uv0 == uv3.CMD_COMPLETE then
				if slot1:GetHubByHubId(uv4):getConfig("reward_target") ~= "" and slot4 ~= 0 then
					slot5.type = DROP_TYPE_VITEM
					slot5.id = slot4

					table.insert(slot2, {
						count = 1
					})
				end
			end

			slot6.awards = slot2
			slot6.hubid = uv4
			slot6.cmd = uv0
			slot6.argList = uv1

			uv2:sendNotification(GAME.SEND_MINI_GAME_OP_DONE, {})
		else
			pg.TipsMgr:GetInstance():ShowTips("mini game Error : " .. slot0.result)
		end
	end)
end

return slot0
