slot0 = class("GuildEventStartCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = getProxy(GuildProxy)

	if slot2:getData() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_boss_appear"))

		slot2.eventTip = true

		slot0:sendNotification(GAME.BOSS_EVENT_START_DONE)
	end
end

return slot0
