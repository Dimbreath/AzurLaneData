class("EndToLearnCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(22004, {
		type = 0
	}, 22005, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(NavalAcademyProxy)
			slot2 = getProxy(BayProxy)
			slot3 = slot1:getCourse()
			slot3.proficiency = math.max(slot3.proficiency - slot0.proficiency, 0)
			slot7 = {}
			slot8 = {}

			_.each(slot0.awards, function (slot0)
				slot0[slot0.ship_id] = slot0.exp
				slot0[slot0.ship_id] = slot0.energy
			end)
			_.each(slot10, function (slot0)
				slot0:addExp(slot0[slot0.id] or 0)
				slot0:addExp(slot0.addExp[slot0.id] or 0)
				slot0:updateShip(slot0)
			end)

			slot3.students = {}
			slot3.timestamp = 0

			slot1:setCourse(slot3)
			slot0:sendNotification(GAME.CLASS_STOP_COURSE_DONE, {
				title = slot3:getConfig("name_show"),
				oldProficiency = slot3.proficiency,
				newProficiency = math.max(slot3.proficiency - slot0.proficiency, 0),
				oldStudents = _.map(slot3.students, function (slot0)
					return slot0:getShipById(slot0)
				end),
				newStudents = Clone(slot9)
			})

			return
		end

		pg.TipsMgr.GetInstance():ShowTips(errorTip("lesson_endToLearn", slot0.result))
	end)
end

return class("EndToLearnCommand", pm.SimpleCommand)
