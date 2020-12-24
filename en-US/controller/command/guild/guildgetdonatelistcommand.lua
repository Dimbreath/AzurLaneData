slot0 = class("GuildGetDonateListCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().callback

	pg.ConnectionMgr.GetInstance():Send(62031, {
		type = 0
	}, 62032, function (slot0)
		slot1 = {}

		for slot5, slot6 in ipairs(slot0.donate_tasks) do
			slot7 = GuildDonateTask.New({
				id = slot6
			})

			table.insert(slot1, slot7)
			print("donate id : ", slot7.id)
		end

		slot2 = getProxy(GuildProxy)
		slot3 = slot2:getData()

		slot3:updateDonateTasks(slot1)
		slot2:updateGuild(slot3)
		uv0:sendNotification(GAME.GUILD_DONATE_LIST_UPDATE_DONE)

		getProxy(GuildProxy).shouldRefreshDonateList = false

		if uv1 then
			uv1()
		end
	end)
end

return slot0
