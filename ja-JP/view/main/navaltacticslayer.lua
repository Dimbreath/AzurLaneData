slot0 = class("NavalTacticsLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "NavalTacticsUI"
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setSKillClassNum(slot0, slot1)
	slot0.skillClassNum = slot1
end

function slot0.setStudents(slot0, slot1)
	slot0.studentVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setItemVOs(slot0, slot1)
	slot0.itemVOs = slot1 or {}

	table.sort(slot0.itemVOs, function (slot0, slot1)
		if slot0:getConfig("rarity") == slot1:getConfig("rarity") then
			return slot0.id < slot1.id
		else
			return slot3 < slot2
		end
	end)
end

function slot0.updateShipVO(slot0, slot1)
	slot0.shipVOs[slot1.id] = slot1
end

function slot0.init(slot0)
	slot0.shipCards = {}
	slot0.backBtn = slot0:findTF("blur_container/adapt/top/btnBack")
	slot0.mainPanel = slot0:findTF("mainPanel")

	setActive(slot0.mainPanel, true)

	slot0.helpBtn = slot0:findTF("paint/help_btn", slot0.mainPanel)
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.studentContain = slot0:findTF("students/contain/content", slot0.mainPanel)
	slot0.skillsPanel = slot0:findTF("blurOther/skillsPanel/frame")
	slot0.skillsMask = slot0:findTF("blurOther/skillsPanel")
	slot0.skillSelBtn = slot0:findTF("confirm_btn", slot0.skillsPanel)
	slot0.skillContent = slot0:findTF("skill_contain/content", slot0.skillsPanel)
	slot0.lessonPanel = slot0:findTF("blurOther/lessonPanel/frame")
	slot0.lessonMask = slot0:findTF("blurOther/lessonPanel")
	slot0.lessonSelBtn = slot0:findTF("confirm_btn", slot0.lessonPanel)
	slot0.lessonCancelBtn = slot0:findTF("cancel_btn", slot0.lessonPanel)
	slot0.lessonContent = slot0:findTF("bg/lessons/content", slot0.lessonPanel)
	slot0.UIMain = GameObject.Find("/OverlayCamera/Overlay/UIMain")
	slot0.nameTxts = {}
	slot0.deleteStuentQueue = {}
	slot0.blurPanelTF = slot0:findTF("blurOther")
end

function slot0.didEnter(slot0)
	slot0.lessonOverTimer = {}

	onButton(slot0, slot0.backBtn, function ()
		uv0:closeView()
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp", slot0.mainPanel), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp", slot0.mainPanel), false)
	end

	onButton(slot0, slot0:findTF("stamp", slot0.mainPanel), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(3)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.helpBtn, function ()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = pg.gametip.tactics_lesson_system_introduce.tip

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end, SFX_PANEL)
	checkFirstHelpShow("tactics_lesson_system_introduce")
	onButton(slot0, slot0.lessonCancelBtn, function ()
		uv0:closeLessonSel()
		uv0:unblurView()
	end, SFX_PANEL)
	onButton(slot0, slot0.skillsMask, function ()
		uv0:closeSkllSel()
		uv0:unblurView()
	end, SFX_PANEL)
	slot0:initStudents()
end

function slot0.initStudents(slot0)
	slot0.studentTFs = {}

	for slot4 = 1, 4, 1 do
		slot0.studentTFs[slot4] = slot0.studentContain:GetChild(slot4 - 1)

		if slot4 <= NavalAcademyProxy.MAX_SKILL_CLASS_NUM then
			setActive(slot0.studentTFs[slot4], true)

			if slot4 <= slot0.skillClassNum then
				slot0:updateLockStudentPos(slot4, true)
			else
				slot0:updateLockStudentPos(slot4, false)
			end
		else
			setActive(slot0.studentTFs[slot4], false)
		end
	end
end

slot0.NUM2SHOPID = {
	21
}

function slot0.updateLockStudentPos(slot0, slot1, slot2)
	slot3 = slot0.studentTFs[slot1]

	setActive(slot3:Find("mask"), not slot2)
	setActive(slot3:Find("addPanel"), slot2)
	setActive(slot3:Find("infoPanel"), slot2)

	if slot2 then
		slot0:updateStudentTF(slot1, slot0.studentVOs[slot1])
	else
		onButton(slot0, slot4, function ()
			if not id2ItemId(pg.shop_template[uv1.NUM2SHOPID[uv0.skillClassNum - 1]].resource_type) then
				return
			end

			slot4 = slot2.resource_num
			slot5, slot6 = nil

			if slot2.discount ~= 0 then
				if table.getCount(slot2.discount_time) ~= 0 then
					if pg.TimeMgr.GetInstance():inTime(slot2.discount_time) then
						slot5 = {
							discount = slot2.discount
						}
						slot7, slot8 = unpack(slot2.discount_time)
						slot11, slot12, slot13 = unpack(slot7[1])
						slot20.year, slot20.month, slot20.day = unpack(slot8[1])
						slot17 = pg.TimeMgr.GetInstance()
						slot18 = pg.TimeMgr.GetInstance()
						slot20.hour = slot8[2][1]
						slot20.min = slot8[2][2]
						slot20.sec = slot8[2][3]

						if slot18:Table2ServerTime({}) - slot17:GetServerTime() >= 86400 then
							slot5.date = i18n("discount_time", math.floor((slot18 - slot17) / 86400)) .. i18n("word_date")
						elseif slot19 >= 3600 then
							slot5.date = i18n("discount_time", math.floor((slot18 - slot17) / 3600)) .. i18n("word_hour")
						else
							slot5.date = i18n("discount_time", math.floor((slot18 - slot17) / 60)) .. i18n("word_minute")
						end

						slot6 = i18n("open_skill_pos_discount", slot4, slot4 * (100 - slot2.discount) / 100)
						slot4 = slot4 * (100 - slot2.discount) / 100
					end
				end
			end

			slot7 = pg.MsgboxMgr.GetInstance()
			slot9.content = slot6 or i18n("open_skill_pos", slot4)

			function slot9.onYes()
				if uv0.playerVO[id2res(uv1.resource_type)] < uv2 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

					return
				end

				uv0:emit(NavalTacticsMediator.ON_SHOPPING, uv3)
			end

			slot9.discount = slot5

			slot7.ShowMsgBox(slot7, {})
		end, SFX_PANEL)
	end
end

function slot0.addStudent(slot0, slot1, slot2, slot3)
	slot5.id = slot2
	slot5.ship_id = slot1
	slot5.state = Student.WAIT

	if slot3 then
		Student.New({}):setSkillIndex(slot3)
	end

	slot0.select = coroutine.wrap(function ()
		if not uv0 then
			uv1:showSkillSel(uv2, uv1.select)
			coroutine.yield()
		end

		if #uv1.itemVOs > 0 then
			uv1:showLessonSel(uv2, uv1.select, function ()
				uv0.select = nil

				uv0:addStudent(uv1, uv2, uv3)
			end)
		else
			uv1.openMsgBox = false

			uv1:pushDeleteStudentQueue()
			pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))
		end

		coroutine.yield()

		uv1.studentVOs[uv4] = uv2

		uv1:updateStudentTF(uv2.id, uv2)
	end)

	slot0.select()
end

function slot0.startLesson(slot0, slot1, slot2)
	slot3 = slot0.shipVOs[slot1.shipId]
	slot4 = slot1:getSkillId(slot3)
	slot5 = slot3.skills[slot4]
	slot6 = pg.skill_data_template[slot4].max_level
	slot7 = pg.item_data_statistics[slot1.lessonId].name
	slot8 = slot3:getName()
	slot9 = getSkillName(slot1:getSkillId(slot3))

	if slot3:isActivityNpc() then
		slot13.content = i18n("npc_learn_skill_tip")

		function slot13.onYes()
			slot2.content = i18n("tactics_lesson_start_tip", uv0, uv1, uv2)

			function slot2.onYes()
				if uv0.level == uv1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_max_level"))

					return
				end

				if uv2 then
					uv2()
				end

				slot3.shipId = uv4.shipId
				slot3.skillPos = uv4:getSkillId(uv5)
				slot3.lessonId = uv4.lessonId
				slot3.roomId = uv4.id

				uv3:emit(NavalTacticsMediator.ON_START, {})
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	else
		slot10()
	end
end

function slot0.updateStudentVO(slot0, slot1)
	slot0.studentVOs[slot1.id] = slot1

	if slot1:getState() == Student.ATTEND then
		slot0:addLeasonOverTimer(slot1)
	end
end

function slot0.updateStudentTF(slot0, slot1, slot2)
	slot3 = slot0.studentTFs[slot1]

	setActive(slot0:findTF("infoPanel", slot3), slot2)
	setActive(slot0:findTF("addPanel", slot3), not slot2)

	if slot2 then
		slot0:updateShipInfo(slot4, slot2)
		slot0:updateSkillInfo(slot4, slot2)

		slot7 = slot0:findTF("start_btn", slot4)

		setButtonEnabled(slot0:findTF("cancel_btn", slot4), true)

		if slot2:getState() == Student.ATTEND then
			slot0:addLeasonOverTimer(slot2)
		elseif slot2:getState() == Student.WAIT then
			setActive(slot6, false)
			setActive(slot7, true)
		end

		slot8 = slot0.shipVOs[slot2.shipId].configId

		onButton(slot0, slot6, function ()
			slot2.content = i18n("tactics_lesson_cancel")

			function slot2.onYes()
				uv0:emit(NavalTacticsMediator.ON_CANCEL, uv1.id, Student.CANCEL_TYPE_MANUAL)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end, SFX_CANCEL)
	else
		onButton(slot0, findTF(slot5, "add_btn"), function ()
			uv0:goDockYard(uv1, uv2)
		end, SFX_PANEL)
	end
end

function slot0.addDeleteStudentQueue(slot0, slot1, slot2, slot3, slot4)
	slot7[1] = slot1
	slot7[2] = slot2
	slot7[3] = slot3
	slot7[4] = slot4

	table.insert(slot0.deleteStuentQueue, {})
	setButtonEnabled(slot0.studentTFs[slot1]:Find("infoPanel/cancel_btn"), false)

	if slot0.lessonOverTimer[slot1] then
		slot0.lessonOverTimer[slot1]:Stop()

		slot0.lessonOverTimer[slot1] = nil
	end

	slot0:pushDeleteStudentQueue()
end

function slot0.pushDeleteStudentQueue(slot0)
	if not slot0.studentVOs then
		return
	end

	if #slot0.deleteStuentQueue > 0 and not slot0.openMsgBox then
		slot1 = slot0.deleteStuentQueue[1]

		table.remove(slot0.deleteStuentQueue, 1)
		scrollTo(slot0:findTF("students/contain", slot0.mainPanel), 0, 1 - math.max(slot1[1] - 2, 0) / (NavalAcademyProxy.MAX_SKILL_CLASS_NUM - 2))
		slot0:deleteStudentVO(slot1[1], slot1[2], slot1[3], slot1[4])
	end
end

slot1 = 1

function slot0.deleteStudentVO(slot0, slot1, slot2, slot3, slot4)
	slot0.openMsgBox = true
	slot5 = slot0.studentVOs[slot1]
	slot8 = nil

	for slot13, slot14 in ipairs(slot6:getSkillList()) do
		if slot14 == slot5:getSkillId(slot0.shipVOs[slot5.shipId]) then
			slot8 = slot13

			break
		end
	end

	slot10 = getSkillConfig(slot7)
	slot11 = slot0.studentTFs[slot1]
	slot12 = slot11:Find("infoPanel/skill_info/exp")
	slot13 = slot11:Find("infoPanel/skill_info")
	slot14 = slot11:Find("infoPanel/skill_info/level_contain/level")

	setButtonEnabled(slot11:Find("infoPanel/cancel_btn"), false)

	function slot17()
		slot0 = nil

		if uv1.level < uv0.level then
			slot0 = i18n("tactics_end_to_learn", uv2:getName(), getSkillName(uv3), uv4) .. i18n("tactics_skill_level_up", uv1.level, uv0.level)
		else
			slot0 = i18n("tactics_end_to_learn", uv2:getName(), getSkillName(uv3), uv4)
		end

		function slot1()
			uv0.flag = nil
			uv0.studentVOs[uv1] = nil

			uv0:updateStudentTF(uv1, nil)

			if uv0.lessonOverTimer[uv1] then
				uv0.lessonOverTimer[uv1]:Stop()

				uv0.lessonOverTimer[uv1] = nil
			end
		end

		if pg.skill_data_template[uv3].max_level <= uv0.level then
			slot5.content = slot0

			function slot5.onYes()
				uv0()

				uv1.openMsgBox = false

				uv1:pushDeleteStudentQueue()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				hideClose = true
			})
		else
			slot5.content = slot0 .. i18n("tactics_continue_to_learn")

			function slot5.onYes()
				uv0()
				uv1:addStudent(uv2.id, uv3, uv4)
			end

			function slot5.onNo()
				uv0()

				uv1.openMsgBox = false

				uv1:pushDeleteStudentQueue()
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideClose = true
			})
		end
	end

	if slot3.level < slot4.level then
		function (slot0, slot1, slot2)
			slot8.id = uv2
			slot8.name = getSkillName(uv2)
			slot8.level = slot0
			slot8.icon = uv3.icon
			slot8.exp = slot1 and slot1 or getConfigFromLevel1(pg.skill_need_exp, slot0).exp

			uv0:updateSkillDesc(uv1, {}, true, slot2)
		end(slot3.level, nil, true)
		slot0:leanTweenValue(slot12, slot12:GetComponent(typeof(Slider)).value, 1, uv0, 0, function (slot0)
			uv0.value = slot0
		end, function ()
			uv0 = uv0 + 1

			uv1(uv0)

			if uv2.level - uv0 > 0 then
				uv3:leanTweenValue(uv4, 0, 1, uv5, 0, uv6, function ()
					uv0 = uv0 + 1

					if uv0 == uv1.level then
						uv2:leanTweenValue(uv3, 0, uv1.exp / getConfigFromLevel1(pg.skill_need_exp, uv0).exp, uv4, 0, uv5, uv6)
						uv7(uv0, uv1.exp)
					else
						uv7(uv0)
					end

					setText(uv8, uv0)
				end, slot0)
			else
				uv3:leanTweenValue(uv4, 0, uv2.exp / getConfigFromLevel1(pg.skill_need_exp, uv0).exp, uv5, 0, uv6, uv7)
				uv1(uv0, uv2.exp)
			end
		end)
	else
		slot0:leanTweenValue(slot12, slot16.value, slot4.exp / getConfigFromLevel1(pg.skill_need_exp, slot19).exp, uv0, 0, slot20, slot17)
		slot18(slot19, slot4.exp, true)
	end
end

function slot0.leanTweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)
		if uv0 then
			uv0(slot0)
		end
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end
	end))

	if slot8 and slot8 > 0 then
		slot9.setDelay(slot9, slot5 or 0):setRepeat(slot8)
	end
end

function slot0.goDockYard(slot0, slot1, slot2)
	if table.getCount(slot0.itemVOs or {}) <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_no_lesson"))

		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot0.studentVOs) do
		if slot8:getState() == Student.WAIT then
			slot3[slot7] = slot8
		end
	end

	slot0:emit(NavalTacticsMediator.OPEN_DOCKYARD, slot2, slot3, slot1)
end

function slot0.addLeasonOverTimer(slot0, slot1)
	slot2 = slot0.studentTFs[slot1.id]

	setActive(slot0:findTF("infoPanel/cancel_btn", slot2), true)
	setActive(slot0:findTF("infoPanel/start_btn", slot2), false)

	function slot3()
		if uv0.flag then
			return
		end

		uv0.flag = true

		uv0.lessonOverTimer[uv1.id]:Stop()

		uv0.lessonOverTimer[uv1.id] = nil

		uv0:emit(NavalTacticsMediator.ON_CANCEL, uv1.id, Student.CANCEL_TYPE_AUTO)
	end

	slot4 = slot1:getFinishTime()
	slot0.lessonOverTimer[slot1.id] = Timer.New(function ()
		if uv0 <= pg.TimeMgr.GetInstance():GetServerTime() then
			uv1()
		else
			setText(uv2:Find("infoPanel/timer/Text"), pg.TimeMgr.GetInstance():DescCDTime(uv0 - slot0))
		end
	end, 1, -1)

	slot0.lessonOverTimer[slot1.id]:Start()
	slot0.lessonOverTimer[slot1.id].func()
end

function slot0.updateSkillDesc(slot0, slot1, slot2, slot3, slot4)
	setText(findTF(slot1, "name"), slot2.name)
	setText(findTF(slot1, "level_contain/level"), slot2.level)
	setText(findTF(slot1, "descView/Viewport/desc"), Student.getSkillDesc(slot2.id, slot2.level))

	if 26 - math.floor((#findTF(slot1, "descView/Viewport/desc"):GetComponent(typeof(Text)).text - 160) / 40) < 26 then
		slot6 = 26
	end

	if slot6 > 28 then
		slot6 = 28
	end

	slot5.fontSize = slot6

	LoadImageSpriteAsync("skillicon/" .. slot2.icon, findTF(slot1, "icon"))

	slot9 = getConfigFromLevel1(pg.skill_need_exp, slot2.level)

	if slot2.level == pg.skill_data_template[slot2.id].max_level then
		setText(slot0:findTF("next_contain/Text", slot1), "MAX")
	elseif slot3 then
		slot0:leanTweenValue(slot8, slot4 and tonumber(string.sub(getText(slot8), 1, string.find(getText(slot8), "/") - 1)) or 0, slot2.exp, uv0, 0, function (slot0)
			setText(uv0, math.floor(slot0) .. "/" .. uv1.exp)
		end)
	else
		setText(slot8, slot2.exp .. "/" .. slot9.exp)
	end
end

function slot0.updateSkillInfo(slot0, slot1, slot2)
	slot3 = slot0.shipVOs[slot2.shipId]
	slot4 = slot2:getSkillId(slot3)
	slot5 = slot0:findTF("skill_info", slot1)
	slot7 = slot3.skills[slot4]
	slot11.id = slot4
	slot11.icon = getSkillConfig(slot4).icon
	slot11.level = slot7.level
	slot11.name = getSkillName(slot4)
	slot11.exp = slot7.exp

	slot0:updateSkillDesc(slot5, {})

	slot8 = pg.skill_data_template[slot4].max_level

	onButton(slot0, slot5, function ()
		if uv0.studentVOs[uv1.id]:getState() == Student.ATTEND then
			return
		end

		uv0:showSkillSel(uv1, function ()
			uv0:updateSkillInfo(uv0:findTF("infoPanel", uv0.studentTFs[uv1.id]), uv1)
		end)
	end, SFX_PANEL)
	setSlider(slot0:findTF("skill_info/exp", slot1), 0, 1, slot7.exp / getConfigFromLevel1(pg.skill_need_exp, slot7.level).exp)
	setText(findTF(slot1, "timer/Text"), pg.TimeMgr.GetInstance():DescCDTime(slot2:getTime()))
end

function slot0.updateShipInfo(slot0, slot1, slot2)
	if not slot0.shipCards[slot0.shipVOs[slot2.shipId].id] then
		slot0.shipCards[slot4.id] = TacticsShipItem.New(slot0:findTF("ship_tpl", slot1))
	end

	slot0.shipCards[slot4.id]:update(slot4)
end

function slot0.showSkillSel(slot0, slot1, slot2)
	slot0:blurView()

	slot0.openMsgBox = true

	setActive(slot0.skillsMask, true)

	slot3 = slot0.shipVOs[slot1.shipId]
	slot5 = 0

	for slot9, slot10 in pairs(slot3:getSkillList()) do
		if slot3.skills[slot10] then
			slot17.id = slot10
			slot17.name = getSkillName(slot10)
			slot17.icon = getSkillConfig(slot10).icon
			slot17.desc = getSkillDesc(slot10, slot3.skills[slot10].level)
			slot17.level = slot3.skills[slot10].level
			slot17.exp = slot3.skills[slot10].exp

			slot0:updateSkill(slot9, slot0.skillContent:GetChild(slot9 - 1), {
				isLearn = true
			})
		else
			slot17.id = slot10
			slot17.name = getSkillName(slot10)
			slot17.icon = slot12.icon
			slot17.desc = getSkillDesc(slot10, slot3.skills[slot10].level)

			slot0:updateSkill(slot9, slot11, {
				isLearn = false
			})
		end

		slot5 = slot5 + 1
	end

	for slot9 = slot5, 2, 1 do
		slot0:updateSkill(slot9, slot0.skillContent:GetChild(slot9), nil)
	end

	setActive(slot0.skillContent:GetChild(3), slot5 == 4)

	slot6 = slot0:findTF("skill_contain/content", slot0.skillsPanel):GetComponent(typeof(ToggleGroup))

	onButton(slot0, slot0.skillSelBtn, function ()
		if not uv0.selectedSkillIndex then
			return
		end

		if not uv2.skills[uv1[uv0.selectedSkillIndex]] then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_should_exist_skill"))

			return
		end

		if slot1.level == pg.skill_data_template[slot0].max_level then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tactics_max_level"))

			return
		end

		uv3:setSkillIndex(uv0.selectedSkillIndex)

		uv0.selectedSkillIndex = nil

		uv4:SetAllTogglesOff()
		uv0:closeSkllSel()

		if uv5 then
			uv5()
		end
	end, SFX_PANEL)
end

function slot0.updateSkill(slot0, slot1, slot2, slot3, slot4)
	setActive(slot0:findTF("frame/skillInfo", slot2), slot3)
	setActive(slot0:findTF("frame/empty", slot2), not slot3)

	if not slot4 then
		setToggleEnabled(slot2, slot3 and slot3.isLearn)
	end

	setActive(findTF(slot2, "frame/mask"), slot3 and not slot3.isLearn)

	if slot3 then
		setText(findTF(slot5, "name_contain/name"), slot3.name)
		LoadImageSpriteAsync("skillicon/" .. slot3.icon, findTF(slot5, "icon"))
		setText(findTF(slot5, "name_contain/level_contain/label"), slot3.isLearn and "lv" or "")
		setText(findTF(slot5, "name_contain/level_contain/Text"), slot3.isLearn and slot3.level .. (slot3.additionLevel and "<color=#A9F548FF>+" .. slot3.additionLevel .. "</color>" or "") or "")
		setText(findTF(slot5, "next_contain/label"), slot3.isLearn and "NEXT:" or "")

		slot8 = nil

		if slot3.isLearn then
			slot9 = getConfigFromLevel1(pg.skill_need_exp, slot3.level)

			if slot3.level == pg.skill_data_template[slot3.id].max_level then
				setText(findTF(slot5, "next_contain/Text"), "MAX")
			else
				setText(slot10, "<color=#A9F548FF>" .. slot3.exp .. "</color>/" .. slot9.exp)
			end

			setText(findTF(slot5, "descView/Viewport/desc"), Student.getSkillDesc(slot3.id, slot3.level))
		else
			setText(findTF(slot5, "descView/Viewport/desc"), slot3.desc)
		end

		if 26 - math.floor((#findTF(slot5, "descView/Viewport/desc"):GetComponent(typeof(Text)).text - 160) / 40) < 26 then
			slot10 = 26
		end

		if slot10 > 28 then
			slot10 = 28
		end

		slot9.fontSize = slot10

		if not slot4 then
			onToggle(slot0, slot2, function (slot0)
				if not uv0.isLearn then
					return
				end

				if slot0 then
					uv1.selectedSkillIndex = uv2
				end
			end)

			if slot1 == 1 then
				triggerToggle(slot2, true)
			end
		end
	end
end

function slot0.closeSkllSel(slot0)
	setActive(slot0.skillsMask, false)

	slot0.openMsgBox = false

	slot0:pushDeleteStudentQueue()
end

function slot0.showLessonSel(slot0, slot1, slot2, slot3)
	slot0:blurView()

	slot0.openMsgBox = true

	setActive(slot0.lessonMask, true)

	slot5 = slot0.lessonContent:Find("bg")

	if slot0.lessonContent.childCount > #slot0.itemVOs then
		for slot9 = slot4 - 1, #slot0.itemVOs, -1 do
			setActive(slot0.lessonContent:GetChild(slot9), false)
		end
	else
		for slot9 = 1, #slot0.itemVOs - slot4, 1 do
			cloneTplTo(slot5, slot0.lessonContent)
		end
	end

	slot6 = slot0.shipVOs[slot1.shipId].configId
	slot7 = slot1:getSkillId(slot0.shipVOs[slot1.shipId])
	slot8 = slot0.shipVOs[slot1.shipId]

	if slot3 then
		onButton(slot0, slot0:findTF("skill/skilltpl_1", slot0.lessonMask), function ()
			uv0:closeLessonSel()

			uv0.selectedLessonId = nil
			uv0.lessonTime = nil

			if uv1 then
				uv1()
			end
		end)
	end

	slot10 = getSkillConfig(slot7)

	function (slot0)
		if uv0.skills[uv1] then
			slot1 = Clone(uv0)
			slot3 = uv0.skills[uv1]

			if slot0 then
				slot4 = slot0

				slot1:addSkillExp(uv1, uv2:getLessonAddition(uv1, slot4) * pg.item_data_template[slot4].usage_arg[2])

				slot3 = slot1.skills[uv1]
			end

			slot5 = uv2
			slot9.id = uv1
			slot9.name = getSkillName(uv1)
			slot9.icon = uv4.icon
			slot9.desc = getSkillDesc(uv1, slot3.level)
			slot9.level = uv0.skills[uv1].level
			slot9.additionLevel = slot3.level - slot2.level > 0 and slot4
			slot9.exp = slot3.exp

			slot5.updateSkill(slot5, k, uv3, {
				isLesson = true,
				isLearn = true
			}, true)
		else
			slot5.id = uv1
			slot5.name = getSkillName(uv1)
			slot5.icon = uv4.icon
			slot5.desc = getSkillDesc(uv1, uv0.skills[uv1].level)

			uv2:updateSkill(k, uv3, {
				isLearn = false,
				isLesson = true
			}, true)
		end
	end(nil)

	for slot15 = 1, #slot0.itemVOs, 1 do
		slot16 = slot0.lessonContent:GetChild(slot15 - 1)
		slot17 = slot0.itemVOs[slot15]

		updateItem(slot16, slot17)
		SetActive(slot16:Find("addition"), slot0:getLessonAddition(slot7, slot17.id) > 1)
		setText(slot19, slot18 * 100 .. "%exp")
		setText(findTF(slot16, "icon_bg/count"), slot17.count)
		onToggle(slot0, slot16, function (slot0)
			if slot0 then
				uv0.selectedLessonId = uv1.id

				uv0:updateLessonInfo(uv2, uv1.id)
				uv3(uv1.id)
			end
		end)

		if slot15 == 1 then
			triggerToggle(slot16, true)
		end
	end

	onButton(slot0, slot0.lessonSelBtn, function ()
		if not uv0.itemVOs or table.getCount(uv0.itemVOs) == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end

		if not uv0.selectedLessonId then
			return
		end

		uv1:setLesson(uv0.selectedLessonId)
		uv1:setTime(uv0.lessonTime)
		uv0:startLesson(uv1, function ()
			uv0:closeLessonSel()

			if uv1 then
				uv1()
			end

			uv0.selectedLessonId = nil
			uv0.lessonTime = nil
		end)
	end, SFX_PANEL)
end

function slot0.getLessonAddition(slot0, slot1, slot2)
	return pg.skill_data_template[slot1].type == pg.item_data_template[slot2].usage_arg[3] and 1 + pg.gameset.same_color_lesson_addition.key_value / 100 or 1
end

function slot0.updateLessonInfo(slot0, slot1, slot2)
	slot3 = pg.item_data_statistics[slot2]
	slot4 = pg.item_data_template[slot2]

	setText(findTF(slot0.lessonPanel, "skillInfo/contain/name"), slot3.name)
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/desc"), slot3.display)
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/timer_contain/exp_timer/Text"), slot0:getLessonAddition(slot1, slot2) * slot4.usage_arg[2])
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/timer_contain/timer/Text"), pg.TimeMgr.GetInstance():DescCDTime(slot4.usage_arg[1]))

	slot0.lessonTime = slot4.usage_arg[1]
end

function slot0.closeLessonSel(slot0)
	slot0.openMsgBox = false

	slot0:pushDeleteStudentQueue()
	setActive(slot0.lessonMask, false)
	slot0:unblurView()
end

function slot0.blurView(slot0)
	setActive(slot0.blurPanelTF, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanelTF)
end

function slot0.unblurView(slot0)
	setActive(slot0.blurPanelTF, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanelTF, slot0._tf)
end

function slot0.willExit(slot0)
	slot0.UIMgr:UnOverlayPanel(slot0.mainPanel, slot0._tf)
	slot0:closeLessonSel()
	slot0:closeSkllSel()
	slot0:unblurView()

	if slot0.lessonOverTimer then
		for slot4, slot5 in pairs(slot0.lessonOverTimer) do
			slot5:Stop()
		end

		slot0.lessonOverTimer = nil
	end

	for slot4, slot5 in pairs(slot0.nameTxts) do
		slot5:destroy()
	end

	slot0.nameTxts = nil
end

return slot0
