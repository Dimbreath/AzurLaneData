slot0 = class("ClassMediator", import("..base.ContextMediator"))
slot0.OPEN_DOCK = "ClassMediator:OPEN_DOCK"
slot0.CLASS_START_COURSE = "ClassMediator:CLASS_START_COURSE"
slot0.CLASS_STOP_COURSE = "ClassMediator:CLASS_STOP_COURSE"
slot0.CLASS_UPGRADE = "ClassMediator:CLASS_UPGRADE"
slot0.CLASS_UPGRADE_TIMES_UP = "ClassMediator:CLASS_UPGRADE_TIMES_UP"
slot0.CLASS_CLEAR_STUDENT = "ClassMediator:CLASS_CLEAR_STUDENT"

function slot0.register(slot0)
	slot1 = getProxy(NavalAcademyProxy)
	slot2 = getProxy(BayProxy)
	slot3 = slot1:getCourse()

	slot0:verifyCourseData(slot3)
	slot1:setCourse(slot3)
	slot0.viewComponent:setCourse(slot3)
	slot0.viewComponent:setResClass(slot4)

	slot5 = getProxy(PlayerProxy)

	slot0.viewComponent:setPlayer(slot5:getRawData())
	slot1:UpgradeFinish()
	slot5:setFlag("blockResourceUpgrade", true)
	slot0:bind(slot0.OPEN_DOCK, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = BackYardShipInfoMediator,
			viewComponent = BackYardShipInfoLayer,
			data = {
				type = BackYardShipInfoLayer.SHIP_CLASS_TYPE
			}
		}))
	end)
	slot0:bind(slot0.CLASS_START_COURSE, function (slot0, slot1)
		slot0:sendNotification(GAME.CLASS_START_COURSE, {
			students = slot1
		})
	end)
	slot0:bind(slot0.CLASS_STOP_COURSE, function (slot0)
		slot0:sendNotification(GAME.CLASS_STOP_COURSE)
	end)
	slot0:bind(slot0.CLASS_UPGRADE, function (slot0, slot1)
		if slot0:getData().level < slot1:bindConfigTable()[slot1:GetLevel()].user_level then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_limit_level", slot4))

			return
		end

		if slot5.gold < slot3.use[2] then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					slot3.use[2] - slot5.gold,
					slot3.use[2]
				}
			})

			return
		end

		slot1:sendNotification(GAME.SHOPPING, {
			count = 1,
			id = slot1:GetUpgradeType()
		})
		slot0:setFlag("blockResourceUpgrade", false)
	end)
	slot0:bind(slot0.CLASS_UPGRADE_TIMES_UP, function (slot0)
		getProxy(NavalAcademyProxy).UpgradeFinish(slot1)
		slot0:updateResourcePanel()
		slot0:updateClassView()
	end)
	slot0:bind(slot0.CLASS_CLEAR_STUDENT, function (slot0)
		slot1 = getProxy(NavalAcademyProxy)
		slot1:getCourse().students = {}

		slot1:setCourse(slot1.getCourse())
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.CLASS_FORCE_UPDATE,
		GAME.CLASS_START_COURSE_DONE,
		GAME.CLASS_STOP_COURSE_DONE,
		NavalAcademyProxy.RESOURCE_UPGRADE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == NavalAcademyProxy.RESOURCE_UPGRADE then
		slot0.viewComponent:setPlayer(getProxy(PlayerProxy):getRawData())
		slot0:updateResourcePanel()
		slot0.viewComponent:updateResourceTimer()
	elseif slot2 == GAME.CLASS_FORCE_UPDATE then
		slot0:updateClassView()
	elseif slot2 == GAME.CLASS_START_COURSE_DONE then
		slot0:updateClassView()
	elseif slot2 == GAME.CLASS_STOP_COURSE_DONE then
		slot0:updateClassView()

		slot5 = getProxy(NavalAcademyProxy).GetClassVO(slot4)

		slot0.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
			type = ShipExpLayer.TypeClass,
			title = slot3.title,
			top = {
				text1 = i18n("word_proficiency"),
				text2 = slot3.newProficiency .. "/" .. slot5:getConfig("store"),
				text3 = slot3.newProficiency - slot3.oldProficiency,
				progress = slot3.newProficiency / slot5:getConfig("store")
			},
			oldShips = slot3.oldStudents,
			newShips = slot3.newStudents
		})
	end
end

function slot0.updateClassView(slot0)
	slot1 = getProxy(NavalAcademyProxy)
	slot2 = slot1:getCourse()

	slot0:verifyCourseData(slot2)
	slot1:setCourse(slot2)
	slot0.viewComponent:setCourse(slot2)
	slot0.viewComponent:updateMainView()
end

function slot0.updateResourcePanel(slot0)
	slot0.viewComponent:setResClass(getProxy(NavalAcademyProxy).GetClassVO(slot1))
	slot0.viewComponent:updateResourcePanel()
end

function slot0.verifyCourseData(slot0, slot1)
	if not slot1:inClass() and slot1:existCourse() then
		slot2 = getProxy(BayProxy)
		slot3 = slot1:getConfig("type")

		for slot8 = #slot1.students, 1, -1 do
			if not slot2:getShipById(slot4[slot8]) or not table.contains(slot3, slot9:getShipType()) or slot9:getEnergy() <= AcademyCourse.MinEnergy then
				table.remove(slot4, slot8)
			end
		end
	end
end

return slot0
