slot0 = class("TechnologyMediator", import("..base.ContextMediator"))
slot0.ON_START = "TechnologyMediator:ON_START"
slot0.ON_FINISHED = "TechnologyMediator:ON_FINISHED"
slot0.ON_TIME_OVER = "TechnologyMediator:ON_TIME_OVER"
slot0.ON_REFRESH = "TechnologyMediator:ON_REFRESH"
slot0.ON_STOP = "TechnologyMediator:ON_STOP"
slot0.CHANGE_TENDENCY = "TechnologyMediator:CHANGE_TENDENCY"

function slot0.register(slot0)
	slot0:bind(uv0.ON_START, function (slot0, slot1)
		slot5.id = slot1.id
		slot5.pool_id = slot1.pool_id

		uv0:sendNotification(GAME.START_TECHNOLOGY, {})
	end)
	slot0:bind(uv0.ON_TIME_OVER, function (slot0, slot1)
		slot2 = getProxy(TechnologyProxy)
		slot3 = slot2:getTechnologyById(slot1)

		if slot3:canFinish() then
			slot3:finish()
			slot2:updateTechnology(slot3)
		end
	end)
	slot0:bind(uv0.ON_FINISHED, function (slot0, slot1)
		slot5.id = slot1.id
		slot5.pool_id = slot1.pool_id

		uv0:sendNotification(GAME.FINISH_TECHNOLOGY, {})
	end)
	slot0:bind(uv0.ON_REFRESH, function (slot0)
		uv0:sendNotification(GAME.REFRESH_TECHNOLOGYS)
	end)
	slot0:bind(uv0.ON_STOP, function (slot0, slot1)
		slot5.id = slot1.id
		slot5.pool_id = slot1.pool_id

		uv0:sendNotification(GAME.STOP_TECHNOLOGY, {})
	end)
	slot0:bind(uv0.CHANGE_TENDENCY, function (slot0, slot1)
		slot5.tendency = slot1

		uv0:sendNotification(GAME.CHANGE_REFRESH_TECHNOLOGYS_TENDENCY, {
			pool_id = 2
		})
	end)

	slot1 = getProxy(TechnologyProxy)

	slot0.viewComponent:setTechnologys(slot1:getTechnologys())
	slot0.viewComponent:setRefreshFlag(slot1.refreshTechnologysFlag)
	slot0.viewComponent:setTendency(slot1:getTendency(2))
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = TechnologyProxy.TECHNOLOGY_UPDATED
	slot1[2] = GAME.FINISH_TECHNOLOGY_DONE
	slot1[3] = GAME.REFRESH_TECHNOLOGYS_DONE
	slot1[4] = TechnologyProxy.REFRESH_UPDATED
	slot1[5] = PlayerProxy.UPDATED
	slot1[6] = GAME.CHANGE_REFRESH_TECHNOLOGYS_TENDENCY_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getBody()

	if slot1:getName() == TechnologyProxy.TECHNOLOGY_UPDATED then
		slot0.viewComponent:updateTechnology(slot2)
		slot0.viewComponent:updateSelectedInfo(slot2)
	else
		if slot3 == GAME.FINISH_TECHNOLOGY_DONE then
			_.each(slot2.items, function (slot0)
				slot0.riraty = true

				table.insert(uv0, slot0)
			end)

			if #slot2.commons > 0 then
				slot9.items = slot5

				slot0.viewComponent:emit(BaseUI.ON_AWARD, {
					animation = true
				})
			end

			slot0:onRefresh()

			return
		end

		if GAME.REFRESH_TECHNOLOGYS_DONE == slot3 then
			slot0:onRefresh()
		elseif slot3 == TechnologyProxy.REFRESH_UPDATED then
			slot0.viewComponent:setRefreshFlag(slot2)
			slot0.viewComponent:updateRefreshBtn(slot2)
		elseif slot3 == PlayerProxy.UPDATED then
			slot0.viewComponent:setPlayer(slot2)
		elseif slot3 == GAME.CHANGE_REFRESH_TECHNOLOGYS_TENDENCY_DONE then
			slot0.viewComponent:setTendency(getProxy(TechnologyProxy):getTendency(2))
		end
	end
end

function slot0.onRefresh(slot0)
	slot0.viewComponent:clearTimer()
	slot0.viewComponent:cancelSelected()
	slot0.viewComponent:setTechnologys(getProxy(TechnologyProxy):getTechnologys())
	slot0.viewComponent:initTechnologys()
end

return slot0
