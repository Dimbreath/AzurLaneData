slot0 = class("GuildMember", import(".Friend"))
slot0.DUTY_COMMANDER = 1
slot0.DUTY_DEPUTY_COMMANDER = 2
slot0.DYTY_PICKED = 3
slot0.DUTY_ORDINARY = 4
slot1 = {
	i18n("guild_word_commder"),
	i18n("guild_word_deputy_commder"),
	i18n("guild_word_picked"),
	i18n("guild_word_ordinary")
}

slot0.dutyId2Name = function (slot0)
	return slot0[slot0]
end

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.liveness = slot1.liveness or 0
	slot0.duty = slot1.duty or slot0.DUTY_ORDINARY
end

slot0.setDuty = function (slot0, slot1)
	slot0.duty = slot1
end

slot0.isLongOffLine = function (slot0)
	return pg.TimeMgr.GetInstance():GetServerTime() - slot0.preOnLineTime > 864000
end

slot0.setDamage = function (slot0, slot1)
	slot0.damage = slot1
end

slot0.getDamage = function (slot0)
	if slot0.damage then
		return slot0.damage
	end

	return 0
end

return slot0
