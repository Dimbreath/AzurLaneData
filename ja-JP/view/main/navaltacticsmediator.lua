slot0 = class("NavalTacticsMediator", import("..base.ContextMediator"))
slot0.OPEN_DOCKYARD = "NavalTacticsMediator:OPEN_DOCKYARD"
slot0.ON_START = "NavalTacticsMediator:ON_START"
slot0.ON_CANCEL = "NavalTacticsMediator:ON_CANCEL"
slot0.ON_SHOPPING = "NavalTacticsMediator:ON_SHOPPING"
slot1 = 10

function slot0.register(slot0)
	slot0.viewComponent:setShips(getProxy(BayProxy):getData())

	slot0.bagProxy = getProxy(BagProxy)

	slot0.viewComponent:setItemVOs(slot0.bagProxy:getItemsByType(uv0))

	slot4 = {}
	slot4 = getProxy(NavalAcademyProxy):getStudents()

	if slot0.contextData.students then
		for slot9, slot10 in pairs(slot0.contextData.students) do
			slot4[slot10.id] = slot10
		end

		slot0.contextData.students = nil
	end

	slot0.viewComponent:setStudents(slot4)
	slot0:bind(uv1.OPEN_DOCKYARD, function (slot0, slot1, slot2, slot3)
		uv0.contextData.students = slot2

		for slot8, slot9 in pairs(uv1:getStudents()) do
			table.insert({}, slot9.shipId)
		end

		PoolMgr.GetInstance():AddTempCache("DockyardUI", "NavalAcademyUI")

		slot9.ignoredIds = slot4
		slot9.activeShipId = activeShipId
		slot9.prevPage = uv0.__cname
		slot9.flags = {
			inExercise = true,
			inChapter = false,
			inPvp = false,
			inFleet = false,
			inClass = false,
			inTactics = false,
			inBackyard = false,
			inSham = false,
			inEvent = false,
			inAdmiral = true
		}

		function slot9.onShip(slot0, slot1, slot2)
			slot3, slot4 = Ship.ShipStateConflict("inTactics", slot0)

			if slot3 == Ship.STATE_CHANGE_FAIL then
				return false, i18n(slot4)
			elseif slot3 == Ship.STATE_CHANGE_CHECK then
				return Ship.ChangeStateCheckBox(slot4, slot0, slot1)
			end

			return true
		end

		function slot9.onSelected(slot0)
			if uv0 and slot0[1] then
				for slot4, slot5 in pairs(uv1) do
					if uv0 == slot5 then
						uv2.contextData.students[slot4] = nil
					end
				end
			end

			slot2.shipId = slot0[1]
			slot2.index = uv3
			uv2.contextData.shipToLesson = {}
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1
		})
	end)
	slot0:bind(uv1.ON_START, function (slot0, slot1)
		uv0:sendNotification(GAME.START_TO_LEARN_TACTICS, slot1)
	end)
	slot0:bind(uv1.ON_CANCEL, function (slot0, slot1, slot2)
		slot6.shipId = slot1
		slot6.type = slot2

		uv0:sendNotification(GAME.CANCEL_LEARN_TACTICS, {})
	end)
	slot0:bind(uv1.ON_SHOPPING, function (slot0, slot1)
		slot5.id = slot1

		uv0:sendNotification(GAME.SHOPPING, {
			count = 1
		})
	end)

	if slot0.contextData.shipToLesson then
		slot6 = slot0.contextData.shipToLesson

		slot0.viewComponent:addStudent(slot6.shipId, slot6.index, slot6.skillIndex)

		slot0.contextData.shipToLesson = nil
	end

	slot0.viewComponent:setSKillClassNum(slot5:getSkillClassNum())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = NavalAcademyProxy.START_LEARN_TACTICS
	slot1[2] = GAME.CANCEL_LEARN_TACTICS_DONE
	slot1[3] = BagProxy.ITEM_UPDATED
	slot1[4] = NavalAcademyProxy.SKILL_CLASS_POS_UPDATED

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == NavalAcademyProxy.START_LEARN_TACTICS then
		slot0.viewComponent:updateStudentVO(slot1:getBody())
	elseif slot2 == GAME.CANCEL_LEARN_TACTICS_DONE then
		slot0.viewComponent:updateShipVO(slot3.newShipVO)
		slot0.viewComponent:addDeleteStudentQueue(slot3.id, slot3.totalExp, slot3.oldSkill, slot3.newSkill)
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItemVOs(slot0.bagProxy:getItemsByType(uv0))
	elseif slot2 == NavalAcademyProxy.SKILL_CLASS_POS_UPDATED then
		slot0.viewComponent:setSKillClassNum(slot3)
		slot0.viewComponent:updateLockStudentPos(slot3, true)
	end
end

return slot0
