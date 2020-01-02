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

function slot0.dutyId2Name(slot0)
	return slot0[slot0]
end

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.liveness = slot1.liveness or 0
	slot0.duty = slot1.duty or slot0.DUTY_ORDINARY
end

function slot0.setDuty(slot0, slot1)
	slot0.duty = slot1
end

function slot0.isLongOffLine(slot0)
	return pg.TimeMgr.GetInstance():GetServerTime() - slot0.preOnLineTime > 864000
end

function slot0.setDamage(slot0, slot1)
	slot0.damage = slot1
end

function slot0.getDamage(slot0)
	if slot0.damage then
		return slot0.damage
	end

	return 0
end

return slot0
