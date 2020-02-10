slot0 = class("BackYardShipInfoLayer", import("..base.BaseUI"))
slot0.SHIP_TRAIN_TYPE = 1
slot0.SHIP_REST_TYPE = 2
slot0.SHIP_CLASS_TYPE = 3
slot1 = {
	i18n("backyard_traning_tip"),
	i18n("backyard_rest_tip"),
	i18n("backyard_class_tip")
}
slot1[MULTRES] = i18n("backyard_class_tip")
slot2 = "RectShipCardTpl"
slot3 = {
	OPEN = 2,
	INFO = 3,
	LOCK = 1
}

function slot4(slot0)
	slot1 = {}

	function slot3(slot0, slot1)
		if slot0.shipVO and slot1.id == slot0.shipVO.id and slot0.currSpeed == slot0.speed then
			return
		end

		slot0.currSpeed = slot0.speed
		slot3 = slot0.formationCard
		slot0.shipVO = slot1

		slot3:update(slot1)

		if slot0.type == uv0.SHIP_TRAIN_TYPE then
			slot8[1] = i18n("word_lv")
			slot8[2] = slot1.level
			slot7[1] = {}
			slot8[1] = i18n("word_next_level")
			slot8[MULTRES] = math.max(slot1:getLevelExpConfig().exp - slot1.exp, 0)
			slot7[2] = {}
			slot8[1] = i18n("word_exp_chinese") .. i18n("word_get")
			slot8[2] = slot0.speed
			slot7[3] = {}

			slot3:updateProps({})
		elseif slot2 == uv0.SHIP_REST_TYPE then
			slot7[1] = i18n("word_lv")
			slot7[2] = slot1.level
			slot6[1] = {}
			slot7[1] = i18n("word_nowenergy")
			slot7[2] = slot1.energy
			slot6[2] = {}
			slot7[1] = i18n("word_energy_recov_speed")
			slot7[2] = 10 * (slot1:getRecoverEnergyPoint() + Ship.BACKYARD_2F_ENERGY_ADDITION) .. "/h"
			slot6[3] = {}

			slot3:updateProps1({})
		elseif slot2 == uv0.SHIP_CLASS_TYPE then
			slot8[1] = i18n("word_lv")
			slot8[2] = slot1.level
			slot7[1] = {}
			slot8[1] = i18n("word_next_level")
			slot8[MULTRES] = math.max(slot1:getLevelExpConfig().exp - slot1.exp, 0)
			slot7[2] = {}
			slot8[1] = i18n("word_exp_chinese") .. i18n("word_get")
			slot8[2] = (slot0.speed or "") .. "/h"
			slot7[3] = {}

			slot3.updateProps1(slot3, {})
		end

		setActive(slot3.propsTr, slot2 == uv0.SHIP_TRAIN_TYPE)
		setActive(slot3.propsTr1, slot2 == uv0.SHIP_REST_TYPE or slot2 == uv0.SHIP_CLASS_TYPE)
	end

	function slot1.updateExpSpeed(slot0, slot1)
		slot0.speed = slot1
	end

	function slot1.update(slot0, slot1, slot2, slot3)
		slot0.type = slot2

		if slot1 == uv0.LOCK then
			-- Nothing
		elseif slot1 == uv0.OPEN then
			-- Nothing
		elseif slot1 == uv0.INFO then
			uv1(slot0, slot3)
		end

		setActive(slot0.shipPanel, slot1 == uv0.INFO)
		setActive(slot0.addPanel, slot1 == uv0.OPEN)
		setActive(slot0.extendPanel, slot1 == uv0.LOCK)
	end

	function slot1.Clear(slot0)
		removeOnButton(slot0.shipTF)
		removeOnButton(slot0.addPanel)
		removeOnButton(slot0.extendPanel)
	end

	function slot1.Dispose(slot0)
		slot0.formationCard:clear()
		slot0:Clear()
	end

	function (slot0)
		slot0._go = uv0
		slot0._tf = tf(uv0)
		slot0.shipPanel = slot0._tf:Find("shiptpl")
		slot0.shipTF = slot0.shipPanel:Find(uv1)
		slot0.addPanel = slot0._tf:Find("addtpl")
		slot0.extendPanel = slot0._tf:Find("extendtpl")
		slot0.formationCard = FormationCard.New(slot0.shipTF)
		slot0.speed = 0
	end(slot1)

	return slot1
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
	slot2.name = uv0
	slot2.localPosition = Vector3.zero
	slot2.localScale = Vector3(0.65, 0.65, 1)

	slot2:SetParent(slot0:findTF("main/frame/panel/scrollview/ships/tpl/shiptpl"), false)

	slot3[1] = slot0:findTF("main/frame/top/title_training")
	slot3[2] = slot0:findTF("main/frame/top/title_rest")
	slot3[MULTRES] = slot0:findTF("main/frame/top/title_class")
	slot0.titles = {}
	slot3[1] = slot0:findTF("main/frame/top/train_btn")
	slot3[2] = slot0:findTF("main/frame/top/rest_btn")
	slot3[MULTRES] = slot0:findTF("main/frame/top/class_btn")
	slot0.toggles = {}
	slot0.counter = slot0:findTF("main/frame/top/value/Text"):GetComponent(typeof(Text))
	slot0.uiList = UIItemList.New(slot0:findTF("main/frame/panel/scrollview/ships"), slot0:findTF("main/frame/panel/scrollview/ships/tpl"))
	slot0.panelDesc = slot0:findTF("main/frame/panel/desc"):GetComponent(typeof(Text))
	slot0.backyardui = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)")
	slot0.backyardEffect = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/effects")
end

function slot0.EnableUI(slot0, slot1)
	GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).blocksRaycasts = slot1
	GetOrAddComponent(slot0.backyardui, typeof(CanvasGroup)).blocksRaycasts = slot1

	setActive(slot0.backyardEffect, slot1)
end

function slot0.didEnter(slot0)
	slot0:blurPanel()

	slot0.cards = {}

	for slot4, slot5 in pairs(slot0.toggles) do
		if slot4 == uv0.SHIP_TRAIN_TYPE or slot4 == uv0.SHIP_REST_TYPE then
			slot5:GetComponent(typeof(Image)).color = Color.New(0.5, 0.5, 0.5, 1)
		end

		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				uv0:updateSlots(uv1)
			end

			if uv2 then
				uv3.color = slot0 and Color.New(1, 1, 1, 1) or Color.New(0.5, 0.5, 0.5, 1)
			end
		end, SFX_PANEL)
	end

	setActive(slot0.toggles[1], slot0.contextData.type == uv0.SHIP_TRAIN_TYPE or slot1 == uv0.SHIP_REST_TYPE)

	slot2 = setActive
	slot3 = slot0.toggles[2]

	if slot1 == uv0.SHIP_TRAIN_TYPE or slot1 == uv0.SHIP_REST_TYPE then
		slot4 = slot0.dormVO:isUnlockFloor(2)
	else
		slot4 = false

		if false then
			slot4 = true
		end
	end

	slot2(slot3, slot4)
	setActive(slot0.toggles[3], slot1 == uv0.SHIP_CLASS_TYPE)
	triggerToggle(slot0.toggles[slot1], true)
	onButton(slot0, slot0:findTF("bg", slot0.mainPanel), function ()
		if (uv0.contextData.type == uv1.SHIP_TRAIN_TYPE or uv0.contextData.type == uv1.SHIP_REST_TYPE) and uv0.dormVO.food == 0 and table.getCount(uv0.dormVO.shipIds) > 0 then
			uv0:emit(BackYardShipInfoMediator.OPEN_NOFOOD)
		end

		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
end

function slot0.getSlotsInfo(slot0, slot1)
	slot2 = 0
	slot3 = {}
	slot4 = 0

	if slot1 == uv0.SHIP_TRAIN_TYPE then
		slot2 = slot0.dormVO.exp_pos
		slot3 = _.values(slot0.trainShipVOs)
		slot4 = slot0.dormVO:getConfig("training_ship_number")
	elseif slot1 == uv0.SHIP_REST_TYPE then
		slot2 = slot0.dormVO.rest_pos
		slot3 = _.values(slot0.restShipVOs)
		slot4 = slot0.dormVO:getConfig("fix_ship_number")
	elseif slot1 == uv0.SHIP_CLASS_TYPE then
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

	slot1 = slot1 or slot0.contextData.type
	slot2, slot3, slot7 = slot0:getSlotsInfo(slot1)

	slot0.uiList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0.cards[slot1] or uv1(slot2):Clear()

			if slot1 < #uv2 then
				slot3:updateExpSpeed(uv0:getExpAdditionSpeed())
				slot3:update(uv3.INFO, uv4, uv2[slot1 + 1])
				onButton(uv0, slot3.shipTF, function ()
					uv0:goToDockYard(uv1, uv2)
				end, SFX_PANEL)

				return
			end

			if slot1 < uv5 then
				slot3:update(uv3.OPEN, uv4)
				onButton(uv0, slot3.addPanel, function ()
					uv0:goToDockYard(uv1)
				end, SFX_PANEL)
			else
				slot3:update(uv3.LOCK, uv4)
				onButton(uv0, slot3.extendPanel, function ()
					uv0:unlockSlot()
				end, SFX_PANEL)
			end
		end
	end)

	slot0.contextData.type = slot1

	slot0.uiList:align(slot4)

	for slot8, slot9 in ipairs(slot0.titles) do
		setActive(slot9, slot8 == slot1)
	end

	slot0.panelDesc.text = uv2[slot1]

	if slot1 == uv3.SHIP_TRAIN_TYPE then
		slot0.counter.text = table.getCount(slot0.trainShipVOs) .. "/" .. slot0.dormVO.exp_pos
	elseif slot1 == uv3.SHIP_REST_TYPE then
		slot0.counter.text = table.getCount(slot0.restShipVOs) .. "/" .. slot0.dormVO.rest_pos
	elseif slot1 == uv3.SHIP_CLASS_TYPE then
		slot0.counter.text = table.getCount(slot0.classShipVOs) .. "/" .. AcademyCourse.MaxStudentSlot
	end
end

function slot0.goToDockYard(slot0, slot1, slot2)
	slot3 = 0

	if slot1 == uv0.SHIP_TRAIN_TYPE then
		slot3 = slot0.dormVO.exp_pos
	elseif slot1 == uv0.SHIP_REST_TYPE then
		slot3 = slot0.dormVO.rest_pos
	elseif slot1 == uv0.SHIP_CLASS_TYPE then
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
	slot1 = slot0.dormVO

	if slot1:getExtendTrainPosShopId() then
		slot5.content = i18n("backyard_backyardShipInfoLayer_quest_openPos", pg.shop_template[slot1].resource_num)

		function slot5.onYes()
			if uv0.playerVO then
				if uv0.playerVO:getTotalGem() < uv1 then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
				end
			else
				uv0:emit(BackYardShipInfoMediator.EXTEND, uv2, 1)
			end
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end
end

function slot0.getExpAdditionSpeed(slot0)
	slot1 = 0

	if slot0.contextData.type == uv0.SHIP_TRAIN_TYPE then
		slot1 = math.floor(function ()
			if table.getCount(uv0.trainShipVOs) <= 0 then
				return 0
			end

			slot1 = pg.dorm_data_template[uv0.dormVO.id]

			for slot8, slot9 in pairs(uv0.playerVO:getBuffByType(BackYardConst.BACKYARD_BUFF)) do
				if slot9.timestamp >= pg.TimeMgr.GetInstance():GetServerTime() then
					slot4 = tonumber(pg.benefit_buff_template[slot9.id].benefit_effect) / 100 + 1
				end
			end

			slot8 = uv0.dormVO:getComfortable()

			return pg.gameset["dorm_exp_ratio_by_" .. slot0].key_value / 100 * (pg.gameset.dorm_exp_base.key_value + slot1.exp * slot8 / (slot8 + pg.gameset.dorm_exp_ratio_comfort_degree.key_value)) * slot4 * (1 + 0.05 * uv0.playerVO.level)
		end() * 3600 / pg.dorm_data_template[slot0.dormVO.id].time)
	elseif slot0.contextData.type == uv0.SHIP_CLASS_TYPE then
		slot2 = 0

		if table.getCount(slot0.classShipVOs) > 0 then
			slot2 = math.floor(60 * slot0.setResClassVO:getConfig("proficency_cost_per_min") * slot0.setResClassVO:getConfig("proficency_to_exp_rant_" .. slot3) / 100)
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
