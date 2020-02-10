pg = pg or {}
slot0 = pg
slot0.SecondaryPWDMgr = singletonClass("SecondaryPWDMgr")
slot1 = slot0.SecondaryPWDMgr
slot1.UNLOCK_SHIP = 1
slot1.UNLOCK_COMMANDER = 2
slot1.RESOLVE_EQUIPMENT = 3
slot1.CREATE_INHERIT = 4
slot1.CLOSE_PASSWORD = 98
slot1.SET_PASSWORD = 99
slot1.CHANGE_SETTING = 100

function slot2()
	if not PLATFORM_CODE then
		return
	end

	slot0[1] = uv0.UNLOCK_SHIP
	slot0[2] = uv0.RESOLVE_EQUIPMENT

	if PLATFORM_CODE == PLATFORM_JP then
		table.insert({}, uv0.CREATE_INHERIT)
	end

	return slot0
end

function slot1.Init(slot0, slot1)
	uv0.LIMITED_OPERATION = uv1()

	if slot1 then
		slot1()
	end
end

function slot1.LimitedOperation(slot0, slot1, slot2, slot3)
	if not table.contains(getProxy(SecondaryPWDProxy):getRawData().system_list, slot1) then
		if slot3 then
			slot3()
		end

		return
	end

	if slot5.state == 0 then
		if slot3 then
			slot3()
		end

		return
	end

	slot6, slot7 = slot4:GetPermissionState()

	if not slot6 then
		slot0:ShowWarningWindow()

		return
	end

	if slot5.state == 2 then
		if slot3 then
			slot3()
		end

		return
	end

	slot9.mediator = SecondaryPasswordMediator
	slot9.viewComponent = SecondaryPasswordLayer
	slot10.mode = SecondaryPasswordLayer.InputView
	slot10.type = slot1
	slot10.info = slot2
	slot10.callback = slot3
	slot9.data = {}

	slot0:LoadLayer(Context.New({}))
end

function slot1.ChangeSetting(slot0, slot1, slot2)
	if table.equal(slot1, getProxy(SecondaryPWDProxy):getRawData().system_list) then
		return
	end

	slot5, slot6 = slot3:GetPermissionState()

	if not slot5 then
		slot0:ShowWarningWindow()

		return
	end

	slot8.mediator = SecondaryPasswordMediator
	slot8.viewComponent = SecondaryPasswordLayer
	slot9.mode = SecondaryPasswordLayer.InputView
	slot9.type = #slot1 == 0 and uv0.CLOSE_PASSWORD or uv0.CHANGE_SETTING
	slot9.settings = slot1
	slot9.callback = slot2
	slot8.data = {}

	slot0:LoadLayer(Context.New({}))
end

function slot1.SetPassword(slot0, slot1)
	if getProxy(SecondaryPWDProxy):getRawData().state > 0 then
		return
	end

	slot5.mediator = SecondaryPasswordMediator
	slot5.viewComponent = SecondaryPasswordLayer
	slot6.mode = SecondaryPasswordLayer.SetView
	slot6.type = uv0.SET_PASSWORD
	slot6.settings = uv0.LIMITED_OPERATION
	slot6.callback = slot1
	slot5.data = {}

	slot0:LoadLayer(Context.New({}))
end

function slot1.LoadLayer(slot0, slot1)
	slot3 = getProxy(ContextProxy):getCurrentContext()

	while slot3:getContextByMediator(slot3.mediator).parent do
		slot3 = slot3.parent
	end

	slot7.parentContext = slot3
	slot7.context = slot1

	uv0.m02:sendNotification(GAME.LOAD_LAYERS, {})
end

function slot1.ShowWarningWindow(slot0)
	slot1.type = MSGBOX_TYPE_SECONDPWD

	uv0.MsgboxMgr.GetInstance():ShowMsgBox({
		mode = "showresttime",
		title = "warning",
		hideNo = true
	})
end

function slot1.FetchData(slot0)
	uv0.m02:sendNotification(GAME.FETCH_PASSWORD_STATE)
end

function slot1.IsNormalOp(slot0, slot1)
	if not slot1 then
		return false
	end

	return table.contains(uv0.LIMITED_OPERATION, slot1)
end

function slot1.Dispose(slot0)
end

return slot1
