class("CancelLearnTacticsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.type
	slot6 = getProxy(NavalAcademyProxy).getStudentById(slot5, slot3)
	slot7 = slot2.callback
	slot8 = slot2.onConfirm

	if not getProxy(BayProxy).getShipById(slot9, slot6.shipId).skills[slot6:getSkillId(getProxy(BayProxy).getShipById(slot9, slot6.shipId))] then
		pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_noskill_erro"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(22203, {
		room_id = slot3,
		type = slot4
	}, 22204, function (slot0)
		if slot0.result == 0 then
			slot1 = Clone(slot0.skills[Clone])

			slot0:addSkillExp(slot1.id, slot0.exp)
			slot0.addSkillExp:updateShip(slot0)
			slot0.addSkillExp:deleteStudent(slot0)
			slot5:sendNotification(GAME.CANCEL_LEARN_TACTICS_DONE, {
				id = slot4,
				shipId = slot4.shipId,
				totalExp = slot0.exp,
				oldSkill = slot1,
				newSkill = slot0.skills[slot1],
				onConfirm = slot7,
				newShipVO = slot0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("lesson_endToLearn", slot0.result))
		end

		if slot8 ~= nil then
			slot8()
		end
	end)
end

return class("CancelLearnTacticsCommand", pm.SimpleCommand)
