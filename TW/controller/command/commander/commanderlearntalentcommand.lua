class("CommanderLearnTalentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.id
	slot4 = slot2.talentId
	slot5 = slot2.replaceid or 0

	if not getProxy(CommanderProxy):getCommanderById(slot3) then
		return
	end

	if not _.any(slot7:getNotLearnedList(), function (slot0)
		return slot0.id == slot0
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_talent_not_exist"))

		return
	end

	slot9 = slot7:getTalents()

	if slot5 ~= 0 and not _.any(slot9, function (slot0)
		return slot0.id == slot0
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_replace_talent_not_exist"))

		return
	end

	if getProxy(PlayerProxy).getData(slot12).gold < CommanderTalent.New({
		id = slot4
	}).getConfig(slot10, "cost") then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(25012, {
		commanderid = slot3,
		targetid = slot4,
		replaceid = slot5
	}, 25013, function (slot0)
		if slot0.result == 0 then
			slot0:consume({
				gold = slot0.consume
			})
			slot0:updatePlayer(slot0)

			if slot3:getSameGroupTalent(slot4.groupId) then
				slot3:deleteTablent(slot1.id)
			end

			if slot5 ~= 0 then
				slot3:deleteTablent(slot5)
			end

			slot3:addTalent(slot4)
			slot3:updatePt(slot3.pt + 1)
			slot3:updateNotLearnedList({})
			slot6:updateCommander(slot6)
			slot7:sendNotification(GAME.COMMANDER_LEARN_TALENTS_DONE, {
				commander = slot7
			})
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_talent_learned", slot4:getConfig("name")))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_talent_learn_erro", slot0.result))
		end
	end)
end

return class("CommanderLearnTalentCommand", pm.SimpleCommand)
