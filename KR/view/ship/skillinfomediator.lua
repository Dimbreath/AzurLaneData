slot0 = class("SkillInfoMediator", import("..base.ContextMediator"))
slot0.WARP_TO_TACTIC = "SkillInfoMediator:WARP_TO_TACTIC"
slot1 = 10

function slot0.register(slot0)
	slot0:bind(slot0.WARP_TO_TACTIC, function (slot0)
		slot1 = getProxy(NavalAcademyProxy)
		slot2 = slot1:getStudents()
		slot3 = 0
		slot4 = 0

		for slot9 = 1, slot1.MAX_SKILL_CLASS_NUM, 1 do
			if slot2[slot9] then
				slot3 = slot3 + 1
			else
				slot4 = slot9

				break
			end
		end

		if slot1:getSkillClassNum() <= slot3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_lesson_full"))
			slot0.viewComponent:close()

			return
		end

		if table.getCount(getProxy(BagProxy).getItemsByType(slot7, slot1) or {}) <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))
			slot0.viewComponent:close()

			return
		end

		for slot12, slot13 in pairs(slot2) do
			if slot13.shipId == slot0.contextData.shipId then
				pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_lesson_repeated"))
				slot0.viewComponent:close()

				return
			end
		end

		getProxy(BayProxy):setSelectShipId(nil)
		slot0.viewComponent:close()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE, {
			warp = NavalAcademyScene.WARP_TO_TACTIC,
			shipToLesson = {
				shipId = slot0.contextData.shipId,
				skillIndex = slot0.contextData.index,
				index = slot4
			}
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()
end

return slot0
