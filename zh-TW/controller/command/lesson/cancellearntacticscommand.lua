slot0 = class("CancelLearnTacticsCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.type
	slot6 = getProxy(NavalAcademyProxy):getStudentById(slot2.shipId)
	slot7 = slot2.callback
	slot8 = slot2.onConfirm
	slot10 = getProxy(BayProxy):getShipById(slot6.shipId)

	if not slot10.skills[slot6:getSkillId(slot10)] then
		pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_noskill_erro"))

		return
	end

	slot15.room_id = slot3
	slot15.type = slot4

	pg.ConnectionMgr.GetInstance():Send(22203, {}, 22204, function (slot0)
		if slot0.result == 0 then
			slot1 = Clone(uv0.skills[uv1])

			uv0:addSkillExp(slot1.id, slot0.exp)
			uv2:updateShip(uv0)
			uv3:deleteStudent(uv4)

			slot5.id = uv4
			slot5.shipId = uv6.shipId
			slot5.totalExp = slot0.exp
			slot5.oldSkill = slot1
			slot5.newSkill = uv0.skills[uv1]
			slot5.onConfirm = uv7
			slot5.newShipVO = uv0

			uv5:sendNotification(GAME.CANCEL_LEARN_TACTICS_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("lesson_endToLearn", slot0.result))
		end

		if uv8 ~= nil then
			uv8()
		end
	end)
end

return slot0
