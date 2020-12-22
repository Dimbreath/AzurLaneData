slot0 = class("SubmitGuildReportCommand", import(".GuildEventBaseCommand"))

function slot0.execute(slot0, slot1)
	slot3 = slot1:getBody().ids

	if getProxy(GuildProxy):getRawData():getMemberById(getProxy(PlayerProxy):getRawData().id):IsRecruit() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("guild_duty_is_too_low"))

		return
	end

	if _.any(slot3, function (slot0)
		return not uv0:GetReportById(slot0):CanSubmit()
	end) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("guild_get_report_failed"))

		return
	end

	slot8 = slot2.callback

	pg.ConnectionMgr.GetInstance():Send(61019, {
		ids = slot3
	}, 61020, function (slot0)
		if slot0.result == 0 then
			for slot5, slot6 in ipairs(slot0.drop_list) do
				slot7 = Item.New({
					type = slot6.type,
					id = slot6.id,
					count = slot6.number
				})

				uv0:sendNotification(GAME.ADD_ITEM, slot7)
				table.insert({}, slot7)
			end

			for slot5, slot6 in ipairs(uv1) do
				uv2:GetReportById(slot6):Submit()
			end

			uv0:sendNotification(GAME.SUBMIT_GUILD_REPORT_DONE, {
				awards = slot1,
				list = uv1,
				callback = uv3
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[slot0.result] .. slot0.result)
		end
	end)
end

return slot0
