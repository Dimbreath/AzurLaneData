class("ClassOverCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(22006, {
		room_id = slot1:getBody().courseID,
		ship_id = slot1.getBody().slotVO.GetShip(slot4).id
	}, 22007, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(BayProxy)
			slot2 = slot0:GetShip()
			slot4 = {}

			for slot8, slot9 in pairs(slot3) do
				slot2:addAttr(slot8, slot9)
				slot1:updateShip(slot2)

				slot4[#slot4 + 1] = {
					pg.attribute_info_by_type[slot8].condition,
					slot9
				}
			end

			slot5 = slot2:getConfig("name")

			if #slot4 == 2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("main_navalAcademyScene_quest_Classover_long", slot5, slot4[1][1], slot4[1][2], slot4[2][1], slot4[2][2]))
			else
				for slot9, slot10 in ipairs(slot4) do
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_navalAcademyScene_quest_Classover_short", slot5, slot10[1], slot10[2]))
				end
			end

			getProxy(NavalAcademyProxy):GetReward(slot1, slot2.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("lesson_classOver", slot0.result))
		end
	end)
end

return class("ClassOverCommand", pm.SimpleCommand)
