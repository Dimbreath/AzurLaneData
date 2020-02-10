slot0 = class("CommissionInfoMediator", import("...base.ContextMediator"))
slot0.FINISH_EVENT = "CommissionInfoMediator:FINISH_EVENT"
slot0.FINISH_CLASS = "CommissionInfoMediator:FINISH_CLASS"
slot0.GET_OIL_RES = "CommissionInfoMediator:GET_OIL_RES"
slot0.GET_GOLD_RES = "CommissionInfoMediator:GET_GOLD_RES"
slot0.ON_ACTIVE_EVENT = "CommissionInfoMediator:ON_ACTIVE_EVENT"
slot0.ON_ACTIVE_CLASS = "CommissionInfoMediator:ON_ACTIVE_CLASS"
slot0.ON_ACTIVE_TECH = "CommissionInfoMediator:ON_ACTIVE_TECH"
slot0.ON_TECH_TIME_OVER = "CommissionInfoMediator:ON_TECH_TIME_OVER"
slot0.ON_TECH_FINISHED = "CommissionInfoMediator:ON_TECH_FINISHED"
slot0.ON_INS = "CommissionInfoMediator:ON_INS"

function slot0.register(slot0)
	slot0.viewComponent:setProxies(getProxy(EventProxy), getProxy(NavalAcademyProxy), getProxy(TechnologyProxy))
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.ON_TECH_TIME_OVER, function (slot0, slot1, slot2)
		slot3 = getProxy(TechnologyProxy)
		slot4 = slot3:getTechnologyById(slot1)

		if slot4:canFinish() then
			slot4:finish()
			slot3:updateTechnology(slot4)
		end

		if slot2 then
			slot2()
		end
	end)
	slot0:bind(uv0.ON_TECH_FINISHED, function (slot0, slot1)
		slot5.id = slot1.id
		slot5.pool_id = slot1.pool_id

		uv0:sendNotification(GAME.FINISH_TECHNOLOGY, {})
	end)
	slot0:bind(uv0.FINISH_EVENT, function (slot0, slot1, slot2)
		uv0.contextData.inFinished = true
		slot6.id = slot1.id

		function slot6.callback()
			uv0.contextData.inFinished = nil
		end

		slot6.onConfirm = slot2

		uv0:sendNotification(GAME.EVENT_FINISH, {})
	end)
	slot0:bind(uv0.FINISH_CLASS, function (slot0, slot1, slot2, slot3)
		slot7.shipId = slot1
		slot7.type = slot2
		slot7.onConfirm = slot3

		uv0:sendNotification(GAME.CANCEL_LEARN_TACTICS, {})
	end)
	slot0:bind(uv0.ON_ACTIVE_EVENT, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
	end)
	slot0:bind(uv0.ON_ACTIVE_CLASS, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS)
	end)
	slot0:bind(uv0.ON_ACTIVE_TECH, function (slot0)
		uv0:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
	end)
	slot0:bind(uv0.GET_OIL_RES, function (slot0)
		uv0:sendNotification(GAME.HARVEST_RES, ResourceField.TYPE_OIL)
	end)
	slot0:bind(uv0.GET_GOLD_RES, function (slot0)
		uv0:sendNotification(GAME.HARVEST_RES, ResourceField.TYPE_GOLD)
	end)
	slot0:bind(uv0.ON_INS, function (slot0)
		uv0:sendNotification(GAME.ON_OPEN_INS_LAYER)
		uv0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	slot0:Notify()
end

function slot0.Notify(slot0)
	slot0.viewComponent:NotifyIns(getProxy(InstagramProxy), getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM))
	slot0.viewComponent:UpdateLinkPanel()
end

function slot0.continueClass(slot0, slot1, slot2, slot3)
	slot5 = getProxy(BayProxy):getShipById(slot1)

	if table.getCount(getProxy(BagProxy):getItemsByType(10) or {}) <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))

		return
	end

	slot4:setSelectShipId(nil)

	slot14.shipId = slot1
	slot14.skillIndex = slot5:getSkillIndex(slot2)
	slot14.index = slot3
	slot13.shipToLesson = {}

	slot0:sendNotification(GAME.GO_SCENE, SCENE.NAVALTACTICS, {})
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = PlayerProxy.UPDATED
	slot1[2] = GAME.HARVEST_RES_DONE
	slot1[3] = GAME.EVENT_LIST_UPDATE
	slot1[4] = GAME.EVENT_SHOW_AWARDS
	slot1[5] = GAME.CANCEL_LEARN_TACTICS_DONE
	slot1[6] = GAME.FINISH_TECHNOLOGY_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot1:getBody())
	elseif slot2 == GAME.HARVEST_RES_DONE then
		slot4 = nil

		if slot3.type == 2 then
			slot4 = i18n("word_oil")
		elseif slot3.type == 1 then
			slot4 = i18n("word_gold")
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("commission_get_award", slot4, slot3.outPut))
	elseif slot2 == GAME.EVENT_LIST_UPDATE then
		slot4 = getProxy(EventProxy)

		slot0.viewComponent:updateProject(CommissionCard.TYPE_EVENT)
	else
		if slot2 == GAME.EVENT_SHOW_AWARDS then
			slot4 = nil

			coroutine.wrap(function ()
				if #uv0.oldShips > 0 then
					slot3.title = pg.collection_template[uv0.eventId].title
					slot3.oldShips = uv0.oldShips
					slot3.newShips = uv0.newShips
					slot3.isCri = uv0.isCri

					uv1.viewComponent:emit(BaseUI.ON_SHIP_EXP, {}, uv2)
					coroutine.yield()
				end

				uv1.viewComponent:emit(BaseUI.ON_ACHIEVE, uv0.awards, uv0.onConfirm)
			end)()

			return
		end

		if slot2 == GAME.CANCEL_LEARN_TACTICS_DONE then
			slot0.viewComponent:updateProject(CommissionCard.TYPE_CLASS)

			slot4 = slot3.totalExp
			slot6 = slot3.newSkill
			slot7 = getProxy(BayProxy):getShipById(slot3.shipId)
			slot8 = slot6.id
			slot9 = nil

			if pg.skill_data_template[slot8].max_level <= slot6.level then
				slot13.content = slot3.oldSkill.level < slot6.level and i18n("tactics_end_to_learn", slot7:getName(), getSkillName(slot8), slot4) .. i18n("tactics_skill_level_up", slot5.level, slot6.level) or i18n("tactics_end_to_learn", slot7:getName(), getSkillName(slot8), slot4)
				slot13.weight = LayerWeightConst.THIRD_LAYER

				function slot13.onYes()
					if uv0.onConfirm then
						uv0.onConfirm(uv0.shipId, uv1, uv0.id)
					end
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true,
					hideClose = true
				})
			else
				slot13.content = slot9 .. i18n("tactics_continue_to_learn")
				slot13.weight = LayerWeightConst.THIRD_LAYER

				function slot13.onYes()
					uv0.openMsgBox = false

					uv0:continueClass(uv1.shipId, uv2, uv1.id)
				end

				function slot13.onNo()
					uv0.openMsgBox = false
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = false,
					hideClose = true
				})
			end
		elseif slot2 == GAME.FINISH_TECHNOLOGY_DONE then
			slot0.viewComponent:updateProject(CommissionCard.TYPE_TECHNOLOGY)
			_.each(slot3.items, function (slot0)
				slot0.riraty = true

				table.insert(uv0, slot0)
			end)

			if #slot3.commons > 0 then
				slot9.items = slot5

				slot0.viewComponent:emit(BaseUI.ON_AWARD, {
					animation = true
				})
			end
		end
	end
end

return slot0
