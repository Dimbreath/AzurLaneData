slot0 = class("GuildSearchCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not slot1:getBody() or slot2 == "" then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_should_input_keyword"))

		return
	end

	slot2 = slot2 and string.gsub(slot2, "^%s*(.-)%s*$", "%1")
	slot3 = nil
	slot7.type = tonumber(slot2) and 0 or 1
	slot7.keyword = slot2

	pg.ConnectionMgr.GetInstance():Send(60028, {}, 60029, function (slot0)
		if slot0.result == 0 then
			slot1 = {}
			slot2 = Guild.New(slot0.guild)
			slot3 = GuildMember.New(slot0.guild.leader)

			slot3:setDuty(GuildMember.DUTY_COMMANDER)
			slot2:addMember(slot3)
			table.insert(slot1, slot2)
			uv0:sendNotification(GAME.GUILD_SEARCH_DONE, slot1)
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_search_sucess"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_no_exist"))
		end
	end)
end

return slot0
