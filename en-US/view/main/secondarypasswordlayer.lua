slot0 = class("SecondaryPasswordLayer", import("..base.BaseUI"))
slot0.SetView = 1
slot0.InputView = 2

function slot0.getUIName(slot0)
	return "SecondaryPasswordUI"
end

function slot0.init(slot0)
	slot0.window = slot0:findTF("window")
	slot0.setView = slot0:findTF("sliders/set", slot0.window)
	slot0.inputView = slot0:findTF("sliders/input", slot0.window)
	slot0.frame = slot0:findTF("frame")
	slot0.informBg = slot0:findTF("top/bg/information", slot0.window)
	slot0.textTitle = slot0:findTF("title", slot0.informBg):GetComponent(typeof(Text))
	slot0.textTitleEn = slot0:findTF("title/title_en", slot0.informBg):GetComponent(typeof(Text))
	slot0.inputpanel = slot0:findTF("inputpanel", slot0.window)
	slot0.containerbtn = slot0:findTF("btns", slot0.inputpanel)
	slot0.btngroup = slot0:Clone2Full(slot0.containerbtn, 10)

	_.each(slot0.btngroup, function (slot0)
		slot0.name = tostring(slot1)

		setText(slot0:Find("text"), tostring(slot1))
		setText(slot0:Find("highlight/text2"), tostring((slot0:GetSiblingIndex() + 1) % 10))
	end)

	slot0.btnconfirm = slot0:findTF("confirmbtn", slot0.inputpanel)
	slot0.btndelete = slot0:findTF("deletebtn", slot0.inputpanel)
	slot0.btnclose = slot0:findTF("top/btnBack", slot0.window)
	slot0.resources = slot0:findTF("resources")
	slot0.selectFrame = slot0:findTF("resources/xian")
	slot0.setDigitGroup = {}
	slot0.setLine1Grid = slot0:findTF("line1/input/grid", slot0.setView)
	slot0.setLine2Grid = slot0:findTF("line2/input/grid", slot0.setView)

	slot0:Clone2Full(slot0.setLine1Grid, 6)
	slot0:Clone2Full(slot0.setLine2Grid, 6)

	for slot5 = 0, slot0.setLine1Grid.childCount - 1, 1 do
		table.insert(slot0.setDigitGroup, slot0.setLine1Grid:GetChild(slot5))
	end

	for slot5 = 0, slot1 - 1, 1 do
		table.insert(slot0.setDigitGroup, slot0.setLine2Grid:GetChild(slot5))
	end

	slot0.btnhide = slot0:findTF("line1/hidebtn/hide", slot0.setView)
	slot0.btnshow = slot0:findTF("line1/hidebtn/show", slot0.setView)
	slot0.tipseterror = slot0:findTF("line2/tip", slot0.setView)
	slot0.inputDigitGroup = {}
	slot0.inputLineGrid = slot0:findTF("line1/input/grid", slot0.inputView)

	slot0:Clone2Full(slot0.inputLineGrid, 6)

	for slot6 = 0, slot0.inputLineGrid.childCount - 1, 1 do
		table.insert(slot0.inputDigitGroup, slot0.inputLineGrid:GetChild(slot6))
	end

	slot0.inputMode = false
	slot0.timers = {}

	slot0:InitInteractable()
end

function slot0.InitInteractable(slot0)
	_.each(slot0.btngroup, function (slot0)
		onButton(slot0, slot0, function ()
			slot0 = (slot0:GetSiblingIndex() + 1) % 10

			if slot0.inputPos + 1 > 0 and slot1 <= #slot1.digitGroup then
				slot1.inputs = slot1.inputs .. tostring(slot0)

				setText(slot2, slot0)
				setActive(slot1.digitGroup[slot1]:Find("filled"), false)
				setActive(slot1.digitGroup[slot1]:Find("space"), false)

				function slot3()
					setText(setText, "")
					setActive(setText.digitGroup[""]:Find("filled"), true)
				end

				if not slot1.inputMode then
					if slot1.timers["input" .. slot1] then
						slot1.timers["input" .. slot1]:Reset(slot3, 1, 1)
					else
						slot1.timers["input" .. slot1] = Timer.New(slot3, 1, 1)
					end

					slot1.timers["input" .. slot1]:Start()
				end

				slot1:SetInputPos(slot1)
			end

			setActive(slot0:Find("highlight"), true)

			function slot2()
				setActive(slot0:Find("highlight"), false)
			end

			if slot1.timers["btn" .. slot0] then
				slot1.timers["btn" .. slot0]:Reset(slot2, 0.2, 1)
			else
				slot1.timers["btn" .. slot0] = Timer.New(slot2, 0.2, 1)
			end

			slot1.timers["btn" .. slot0]:Start()
		end)
	end)
	onButton(slot0, slot0.btndelete, function ()
		if slot0.inputPos > 0 and slot0 <= #slot0.digitGroup then
			slot0.inputs = string.sub(slot0.inputs, 1, -2)

			setText(slot0.digitGroup[slot0]:Find("text"), "")
			setActive(slot0.digitGroup[slot0]:Find("filled"), false)
			setActive(slot0.digitGroup[slot0]:Find("space"), not slot0.inputMode)

			if slot0.timers["input" .. slot0] then
				slot0.timers["input" .. slot0]:Stop()
			end

			slot0:SetInputPos(slot0 - 1)
		end

		setActive(slot0.btndelete:Find("highlight"), true)

		function slot1()
			setActive(slot0.btndelete:Find("highlight"), false)
		end

		if slot0.timers.btndel then
			slot0.timers.btndel:Reset(slot1, 0.3, 1)
		else
			slot0.timers.btndel = Timer.New(slot1, 0.3, 1)
		end

		slot0.timers.btndel:Start()
	end)
	onButton(slot0, slot0.btnconfirm, function ()
		if slot0.mode == slot1.InputView then
			slot0.inputnone = false

			if #slot0.inputs ~= 6 then
				return
			end

			slot0:emit(SecondaryPasswordMediator.CONFIRM_PASSWORD, slot0.inputs)
		else
			slot0.inputnone = false

			if #slot0.inputs ~= 12 then
				slot0 = false
			end

			for slot4 = 1, 6, 1 do
				if string.byte(slot0.inputs, slot4) ~= string.byte(slot0.inputs, 6 + slot4) then
					slot0 = false

					break
				end
			end

			if not slot0 then
				slot0:UpdateView()

				return
			end

			slot1 = string.sub(slot0.inputs, 1, 6)
			slot2 = nil
			slot4 = nil

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				mode = "settips",
				hideYes = true,
				title = "setting",
				type = MSGBOX_TYPE_SECONDPWD,
				references = {},
				onYes = function ()
					slot0.lasttext = slot0.inputfield.text
					slot1 = {
						modal = true,
						content = string.format(i18n("secondarypassword_confirm_tips"), slot0.inputfield.text),
						onNo = function ()
							pg.MsgboxMgr.GetInstance():ShowMsgBox(pg.MsgboxMgr.GetInstance().ShowMsgBox)
						end,
						onYes = function ()
							slot0:emit(SecondaryPasswordMediator.SET_PASSWORD, slot0, )
						end
					}

					pg.MsgboxMgr.GetInstance():ShowMsgBox(pg.MsgboxMgr.GetInstance().ShowMsgBox)
				end,
				onNo = function ()
					slot0:emit(slot1.ON_CLOSE)
				end,
				onPreShow = function ()
					slot0:Hide()
				end
			})
		end
	end)
	onButton(slot0, slot0.btnhide, function ()
		slot0.inputMode = not slot0.inputMode

		slot0:UpdateInputSlider()
		setActive(slot0.btnhide, not slot0.inputMode)
		setActive(slot0.btnshow, slot0.inputMode)
	end)
	onButton(slot0, slot0.btnshow, function ()
		slot0.inputMode = not slot0.inputMode

		slot0:UpdateInputSlider()
		setActive(slot0.btnhide, not slot0.inputMode)
		setActive(slot0.btnshow, slot0.inputMode)
	end)
	onButton(slot0, slot0.btnclose, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0._tf, function ()
		return
	end, SOUND_BACK)
end

slot1 = 69

function slot0.didEnter(slot0)
	if slot0.contextData.parent then
		setParent(slot0._tf, slot0.contextData.parent)
	else
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	end

	setActive(slot0.setView, slot0.contextData.mode == slot0.SetView)
	setActive(slot0.inputView, slot1 == slot0.InputView)

	slot0.mode = slot1
	slot0.type = slot0.contextData.type
	slot0.digitGroup = (slot1 == slot0.SetView and slot0.setDigitGroup) or slot0.inputDigitGroup
	slot0.textTitle.text = (slot1 == slot0.SetView and i18n("words_set_password")) or i18n("words_information")
	slot0.textTitleEn.text = (slot1 == slot0.SetView and "PASSWORD") or "INFORM"
	slot0.informBg.sizeDelta.x = slot0.textTitle.preferredWidth + slot0.textTitleEn.preferredWidth + slot1
	slot0.informBg.sizeDelta = slot0.informBg.sizeDelta
	slot0.inputs = ""

	slot0:SetInputPos(0)

	slot0.inputnone = true

	slot0:UpdateView()
	slot0:UpdateInputSlider()
end

function slot0.UpdateInputSlider(slot0)
	slot0:ClearInputTimers()

	slot1 = slot0.inputMode

	slot0:SetInputXian(slot0.inputPos + 1)

	for slot5 = 1, #slot0.digitGroup, 1 do
		setText(slot0.digitGroup[slot5]:Find("text"), (slot1 and ((slot5 <= #slot0.inputs and string.char(string.byte(slot0.inputs, slot5))) or nil)) or "")
		setActive(slot0.digitGroup[slot5]:Find("space"), not slot1 and ((slot5 <= #slot0.inputs and string.char(string.byte(slot0.inputs, slot5))) or nil) == nil)
		setActive(slot0.digitGroup[slot5]:Find("filled"), not slot1 and ((slot5 <= #slot0.inputs and string.char(string.byte(slot0.inputs, slot5))) or nil) ~= nil)
	end
end

function slot0.ClearInputTimers(slot0)
	for slot4 = 1, 12, 1 do
		if slot0.timers["input" .. slot4] then
			slot0.timers["input" .. slot4]:Stop()

			slot0.timers["input" .. slot4] = nil
		end
	end
end

function slot0.ClearAllTimers(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		if slot5 then
			slot5:Stop()
		end
	end

	slot0.timers = {}
end

function slot0.ClearInputs(slot0)
	slot0.inputs = ""

	slot0:SetInputPos(0)
	slot0:UpdateInputSlider()
end

function slot0.UpdateView(slot0)
	if slot0.mode == slot0.InputView then
		slot0:UpdateInputView()
	else
		slot0:UpdateSetView()
	end
end

slot2 = nil

function slot3(slot0)
	slot1 = pg.SecondaryPWDMgr.GetInstance()

	return slot0[slot0 or {
		[slot1.UNLOCK_SHIP] = function (slot0)
			slot3 = getProxy(BayProxy)
			slot4 = slot3:getData()

			if slot3:getShipById(slot0.contextData.info[1]) then
				return string.format(i18n("words_desc_unlock"), slot5:getName())
			end
		end,
		[slot1.UNLOCK_COMMANDER] = function (slot0)
			if getProxy(CommanderProxy):getCommanderById(slot0.contextData.info) then
				return string.format(i18n("words_desc_unlock"), slot3:getName())
			end
		end,
		[slot1.RESOLVE_EQUIPMENT] = function (slot0)
			if getProxy(EquipmentProxy):getEquipmentById(slot0.contextData.info) then
				slot4 = slot3.config.name

				if slot3.config.id % 20 > 0 then
					slot4 = slot4 .. "+" .. tostring(slot3.config.id % 20)
				end

				return string.format(i18n("words_desc_resolve_equip"), slot4)
			end
		end,
		[slot1.CREATE_INHERIT] = function ()
			return i18n("words_desc_create_inherit")
		end,
		[slot1.CLOSE_PASSWORD] = function ()
			return i18n("words_desc_close_password")
		end,
		[slot1.CHANGE_SETTING] = function ()
			return i18n("words_desc_change_settings")
		end
	}]
end

function slot0.UpdateInputView(slot0)
	setText(slot3, getProxy(SecondaryPWDProxy).getRawData(slot1).notice)
	setActive(slot3, not slot0.inputnone)
	setText(slot0.inputView:Find("line1/tip1"), (slot0(slot0.contextData.type) and slot5(slot0)) or "")
end

function slot0.UpdateConfirmButton(slot0)
	slot0.btnconfirm:GetComponent(typeof(Button)).interactable = #slot0.inputs == #slot0.digitGroup

	setActive(slot0.btnconfirm:Find("gray"), #slot0.inputs ~= #slot0.digitGroup)
end

function slot0.UpdateSetView(slot0)
	setActive(slot0.tipseterror, not slot0.inputnone)
end

function slot0.Clone2Full(slot0, slot1, slot2)
	slot3 = {}
	slot4 = slot1:GetChild(0)

	for slot9 = 0, slot1.childCount - 1, 1 do
		table.insert(slot3, slot1:GetChild(slot9))
	end

	for slot9 = slot5, slot2 - 1, 1 do
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
	end

	return slot3
end

function slot0.SetInputPos(slot0, slot1)
	slot0.inputPos = slot1

	slot0:SetInputXian(slot1 + 1)
	slot0:UpdateConfirmButton()
end

function slot0.Hide(slot0)
	slot0:willExit()
	setActive(slot0._tf, false)
end

function slot0.Resume(slot0)
	slot0:didEnter()
	setActive(slot0._tf, true)
end

function slot0.SetInputXian(slot0, slot1)
	if slot0.inputMode and slot1 > 0 and slot1 <= #slot0.digitGroup then
		setParent(slot0.selectFrame, slot0.digitGroup[slot1])
	else
		setParent(slot0.selectFrame, slot0.resources)
	end
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, pg.UIMgr.GetInstance().UIMain)
	slot0:ClearAllTimers()
end

return slot0
