slot0 = class("BackYardShipInfoLayer", import("..base.BaseUI"))
slot0.SHIP_TRAIN_TYPE = 1
slot0.SHIP_REST_TYPE = 2
slot0.SHIP_CLASS_TYPE = 3
slot1 = {
	i18n("backyard_traning_tip"),
	i18n("backyard_rest_tip"),
	i18n("backyard_class_tip")
}
slot2 = "RectShipCardTpl"
slot3 = {
	OPEN = 2,
	INFO = 3,
	LOCK = 1
}

function slot4(slot0)
	function slot3(slot0, slot1)
		if slot0.shipVO and slot1.id == slot0.shipVO.id and slot0.currSpeed == slot0.speed then
			return
		end

		slot0.currSpeed = slot0.speed
		slot0.shipVO = slot1

		slot0.formationCard:update(slot1)

		if slot0.type == slot0.SHIP_TRAIN_TYPE then
			slot3:updateProps({
				{
					i18n("word_lv"),
					slot1.level
				},
				{
					i18n("word_next_level"),
					math.max(slot1:getLevelExpConfig().exp - slot1.exp, 0)
				},
				{
					i18n("word_exp_chinese") .. i18n("word_get"),
					slot0.speed
				}
			})
		elseif slot2 == slot0.SHIP_REST_TYPE then
			slot3:updateProps1({
				{
					i18n("word_lv"),
					slot1.level
				},
				{
					i18n("word_nowenergy"),
					slot1.energy
				},
				{
					i18n("word_energy_recov_speed"),
					10 * (slot1:getRecoverEnergyPoint() + Ship.BACKYARD_2F_ENERGY_ADDITION) .. "/h"
				}
			})
		elseif slot2 == slot0.SHIP_CLASS_TYPE then
			slot3:updateProps1({
				{
					i18n("word_lv"),
					slot1.level
				},
				{
					i18n("word_next_level"),
					math.max(slot1:getLevelExpConfig().exp - slot1.exp, 0)
				},
				{
					i18n("word_exp_chinese") .. i18n("word_get"),
					(slot0.speed or "") .. "/h"
				}
			})
		end

		setActive(slot3.propsTr, slot2 == slot0.SHIP_TRAIN_TYPE)
		setActive(slot3.propsTr1, slot2 == slot0.SHIP_REST_TYPE or slot2 == slot0.SHIP_CLASS_TYPE)
	end


	-- Decompilation error in this vicinity:
	function (slot0)
		slot0._go = slot0
		slot0._tf = tf(slot0)
		slot0.shipPanel = slot0._tf:Find("shiptpl")
		slot0.shipTF = slot0.shipPanel:Find(slot0.shipPanel.Find)
		slot0.addPanel = slot0._tf:Find("addtpl")
		slot0.extendPanel = slot0._tf:Find("extendtpl")
		slot0.formationCard = FormationCard.New(slot0.shipTF)
		slot0.speed = 0
	end({
		updateExpSpeed = function (slot0, slot1)
			slot0.speed = slot1
		end,
		update = function (slot0, slot1, slot2, slot3)
			slot0.type = slot2

			if slot1 == slot0.LOCK then
			elseif slot1 == slot0.OPEN then
			elseif slot1 == slot0.INFO then
				slot1(slot0, slot3)
			end

			setActive(slot0.shipPanel, slot1 == slot0.INFO)
			setActive(slot0.addPanel, slot1 == slot0.OPEN)
			setActive(slot0.extendPanel, slot1 == slot0.LOCK)
		end,
		Clear = function (slot0)
			removeOnButton(slot0.shipTF)
			removeOnButton(slot0.addPanel)
			removeOnButton(slot0.extendPanel)
		end,
		Dispose = function (slot0)
			slot0.formationCard:clear()
			slot0:Clear()
		end
	})

	return 
end

function slot0.getUIName(slot0)
	return "BackYardShipInfoUI"
end

function slot0.setTrainShipVOs(slot0, slot1)
	slot0.trainShipVOs = slot1
end

function slot0.setResetShipVOs(slot0, slot1)
	slot0.restShipVOs = slot1
end

function slot0.setClassShipVOs(slot0, slot1)
	slot0.classShipVOs = slot1
end

function slot0.setCourseVO(slot0, slot1)
	slot0.courseVO = slot1
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setDormVO(slot0, slot1)
	slot0.dormVO = slot1
end

function slot0.setResClassVO(slot0, slot1)
	slot0.setResClassVO = slot1
end

function slot0.init(slot0)
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.mainPanel = slot0:findTF("main")
	slot2 = tf(instantiate(slot0._tf:GetComponent(typeof(ItemList)).prefabItem[0]))
	slot2.name = slot0
	slot2.localPosition = Vector3.zero
	slot2.localScale = Vector3(0.65, 0.65, 1)

	slot2:SetParent(slot1, false)

	slot0.titles = {
		slot0:findTF("main/frame/top/title_training"),
		slot0:findTF("main/frame/top/title_rest"),
		slot0:findTF("main/frame/top/title_class")
	}
	slot0.toggles = {
		slot0:findTF("main/frame/top/train_btn"),
		slot0:findTF("main/frame/top/rest_btn"),
		slot0:findTF("main/frame/top/class_btn")
	}
	slot0.counter = slot0:findTF("main/frame/top/value/Text"):GetComponent(typeof(Text))
	slot0.uiList = UIItemList.New(slot0:findTF("main/frame/panel/scrollview/ships"), slot0:findTF("main/frame/panel/scrollview/ships/tpl"))
	slot0.panelDesc = slot0:findTF("main/frame/panel/desc"):GetComponent(typeof(Text))

	if slot0.contextData.type ~= slot1.SHIP_CLASS_TYPE then
		slot0.backyardMain = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui")
		slot0.prevPos = tf(slot0.backyardMain).localPosition
	end
end

function slot0.EnableUI(slot0, slot1)
	GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).blocksRaycasts = slot1

	if slot0.contextData.type ~= slot0.SHIP_CLASS_TYPE then
		tf(slot0.backyardMain).localPosition = (slot1 and slot0.prevPos) or Vector3(10000, 10000, 0)
	end
end

function slot0.didEnter(slot0)
	slot0:blurPanel()

	slot0.cards = {}

	for slot4, slot5 in pairs(slot0.toggles) do
		slot6 = slot5:GetComponent(typeof(Image))
		slot7 = slot4 == slot0.SHIP_TRAIN_TYPE or slot4 == slot0.SHIP_REST_TYPE

		if slot7 then
			slot6.color = Color.New(0.5, 0.5, 0.5, 1)
		end

		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				slot0:updateSlots(slot0.updateSlots)
			end

			if slot2 then
				slot3.color = (slot0 and Color.New(1, 1, 1, 1)) or Color.New(0.5, 0.5, 0.5, 1)
			end
		end, SFX_PANEL)
	end

	setActive(slot0.toggles[1], slot0.contextData.type == slot0.SHIP_TRAIN_TYPE or slot1 == slot0.SHIP_REST_TYPE)
	setActive(slot0.toggles[2], (slot1 == slot0.SHIP_TRAIN_TYPE or slot1 == slot0.SHIP_REST_TYPE) and slot0.dormVO:isUnlockFloor(2))
	setActive(slot0.toggles[3], slot1 == slot0.SHIP_CLASS_TYPE)
	triggerToggle(slot0.toggles[slot1], true)
	onButton(slot0, slot0:findTF("bg", slot0.mainPanel), function ()
		if (slot0.contextData.type == slot1.SHIP_TRAIN_TYPE or slot0.contextData.type == slot1.SHIP_REST_TYPE) and slot0.dormVO.food == 0 and table.getCount(slot0.dormVO.shipIds) > 0 then
			slot0:emit(BackYardShipInfoMediator.OPEN_NOFOOD)
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
end

function slot0.getSlotsInfo(slot0, slot1)
	slot2 = 0
	slot3 = {}
	slot4 = 0

	if slot1 == slot0.SHIP_TRAIN_TYPE then
		slot2 = slot0.dormVO.exp_pos
		slot3 = _.values(slot0.trainShipVOs)
		slot4 = slot0.dormVO:getConfig("training_ship_number")
	elseif slot1 == slot0.SHIP_REST_TYPE then
		slot2 = slot0.dormVO.rest_pos
		slot3 = _.values(slot0.restShipVOs)
		slot4 = slot0.dormVO:getConfig("fix_ship_number")
	elseif slot1 == slot0.SHIP_CLASS_TYPE then
		slot2 = AcademyCourse.MaxStudentSlot
		slot3 = _.values(slot0.classShipVOs)
		slot4 = AcademyCourse.MaxStudentSlot
	end

	return slot2, slot3, slot4
end

function slot0.updateSlots(slot0, slot1)
	for slot5, slot6 in pairs(slot0.cards) do
		slot6:Dispose()
	end

	slot2, slot3, slot7 = slot0:getSlotsInfo(slot1 or slot0.contextData.type)

	slot0.uiList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0.cards[slot1] or slot1(slot2):Clear()

			if slot1 < #slot2 then
				slot3:updateExpSpeed(slot5)
				slot3:update(slot3.INFO, slot4, slot4)
				onButton(slot0, slot3.shipTF, function ()
					slot0:goToDockYard(slot0, )
				end, SFX_PANEL)

				return
			end

			if slot1 < slot5 then
				slot3:update(slot3.OPEN, slot3.update)
				onButton(slot0, slot3.addPanel, function ()
					slot0:goToDockYard(slot0)
				end, SFX_PANEL)
			else
				slot3:update(slot3.LOCK, slot3.update)
				onButton(slot0, slot3.extendPanel, function ()
					slot0:unlockSlot()
				end, SFX_PANEL)
			end
		end
	end)

	slot0.contextData.type = slot1 or slot0.contextData.type

	slot0.uiList:align(slot4)

	for slot8, slot9 in ipairs(slot0.titles) do
		setActive(slot9, slot8 == slot1)
	end

	slot0.panelDesc.text = slot2[slot1]

	if slot1 == slot3.SHIP_TRAIN_TYPE then
		slot0.counter.text = table.getCount(slot0.trainShipVOs) .. "/" .. slot0.dormVO.exp_pos
	elseif slot1 == slot3.SHIP_REST_TYPE then
		slot0.counter.text = table.getCount(slot0.restShipVOs) .. "/" .. slot0.dormVO.rest_pos
	elseif slot1 == slot3.SHIP_CLASS_TYPE then
		slot0.counter.text = table.getCount(slot0.classShipVOs) .. "/" .. AcademyCourse.MaxStudentSlot
	end
end

function slot0.goToDockYard(slot0, slot1, slot2)
	slot3 = 0

	if slot1 == slot0.SHIP_TRAIN_TYPE then
		slot3 = slot0.dormVO.exp_pos
	elseif slot1 == slot0.SHIP_REST_TYPE then
		slot3 = slot0.dormVO.rest_pos
	elseif slot1 == slot0.SHIP_CLASS_TYPE then
		if slot0.courseVO:inClass() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("course_learning"))

			return
		end

		slot3 = AcademyCourse.MaxStudentSlot
	end

	slot0:emit(BackYardShipInfoMediator.OPEN_CHUANWU, slot1, slot3, slot2)
	slot0:unblurPanel()
end

function slot0.unlockSlot(slot0)
	if slot0.dormVO:getExtendTrainPosShopId() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("backyard_backyardShipInfoLayer_quest_openPos", pg.shop_template[slot1].resource_num),
			onYes = function ()
				if slot0.playerVO and slot0.playerVO:getTotalGem() < slot0.playerVO then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
				else
					slot0:emit(BackYardShipInfoMediator.EXTEND, , 1)
				end
			end
		})
	end
end

function slot0.getExpAdditionSpeed(slot0)
	slot1 = 0

	if slot0.contextData.type == slot0.SHIP_TRAIN_TYPE then
		slot1 = math.floor((slot2() * 3600) / pg.dorm_data_template[slot0.dormVO.id].time)
	elseif slot0.contextData.type == slot0.SHIP_CLASS_TYPE then
		slot2 = 0

		if table.getCount(slot0.classShipVOs) > 0 then
			slot2 = math.floor((60 * slot0.setResClassVO:getConfig("proficency_cost_per_min") * slot0.setResClassVO:getConfig("proficency_to_exp_rant_" .. slot3)) / 100)
		end

		slot1 = slot2
	end

	return slot1
end

function slot0.blurPanel(slot0)
	if slot0.isBlurPanel then
		return
	end

	slot0.UIMgr:BlurPanel(slot0.mainPanel)

	slot0.isBlurPanel = true
end

function slot0.unblurPanel(slot0)
	if not slot0.isBlurPanel then
		return
	end

	slot0.UIMgr:UnblurPanel(slot0.mainPanel, slot0._tf)

	slot0.isBlurPanel = nil
end

function slot0.willExit(slot0)
	slot0:unblurPanel()

	for slot4, slot5 in pairs(slot0.cards) do
		slot5:Dispose()
	end
end

return slot0
