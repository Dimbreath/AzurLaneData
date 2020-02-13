pg = pg or {}
pg.SecondaryPWDMgr = singletonClass("SecondaryPWDMgr")
pg.SecondaryPWDMgr.UNLOCK_SHIP = 1
pg.SecondaryPWDMgr.UNLOCK_COMMANDER = 2
pg.SecondaryPWDMgr.RESOLVE_EQUIPMENT = 3
pg.SecondaryPWDMgr.CREATE_INHERIT = 4
pg.SecondaryPWDMgr.CLOSE_PASSWORD = 98
pg.SecondaryPWDMgr.SET_PASSWORD = 99
pg.SecondaryPWDMgr.CHANGE_SETTING = 100

function slot2()
	if not PLATFORM_CODE then
		return
	end

	if PLATFORM_CODE ~= PLATFORM_US then
		table.insert(slot0, 2, slot0.UNLOCK_COMMANDER)
	end

	if PLATFORM_CODE == PLATFORM_JP then
		table.insert(slot0, slot0.CREATE_INHERIT)
	end

	return slot0
end

function pg.SecondaryPWDMgr.Init(slot0, slot1)
	slot0.LIMITED_OPERATION = slot1()

	if slot1 then
		slot1()
	end
end

function pg.SecondaryPWDMgr.LimitedOperation(slot0, slot1, slot2, slot3)
	if not table.contains(getProxy(SecondaryPWDProxy).getRawData(slot4).system_list, slot1) then
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

	slot0:LoadLayer(Context.New({
		mediator = SecondaryPasswordMediator,
		viewComponent = SecondaryPasswordLayer,
		data = {
			mode = SecondaryPasswordLayer.InputView,
			type = slot1,
			info = slot2,
			callback = slot3
		}
	}))
end

function pg.SecondaryPWDMgr.ChangeSetting(slot0, slot1, slot2)
	if table.equal(slot1, getProxy(SecondaryPWDProxy).getRawData(slot3).system_list) then
		return
	end

	slot5, slot6 = slot3:GetPermissionState()

	if not slot5 then
		slot0:ShowWarningWindow()

		return
	end

	slot0:LoadLayer(Context.New({
		mediator = SecondaryPasswordMediator,
		viewComponent = SecondaryPasswordLayer,
		data = {
			mode = SecondaryPasswordLayer.InputView,
			type = (#slot1 == 0 and slot0.CLOSE_PASSWORD) or slot0.CHANGE_SETTING,
			settings = slot1,
			callback = slot2
		}
	}))
end

function pg.SecondaryPWDMgr.SetPassword(slot0, slot1)
	if getProxy(SecondaryPWDProxy).getRawData(slot2).state > 0 then
		return
	end

	slot0:LoadLayer(Context.New({
		mediator = SecondaryPasswordMediator,
		viewComponent = SecondaryPasswordLayer,
		data = {
			mode = SecondaryPasswordLayer.SetView,
			type = slot0.SET_PASSWORD,
			settings = slot0.LIMITED_OPERATION,
			callback = slot1
		}
	}))
end

function pg.SecondaryPWDMgr.LoadLayer(slot0, slot1)
	slot3 = getProxy(ContextProxy).getCurrentContext(slot2)
	slot3 = slot3:getContextByMediator(slot3.mediator)

	while slot3.parent do
		slot3 = slot3.parent
	end

	slot0.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = slot3,
		context = slot1
	})
end

function pg.SecondaryPWDMgr.ShowWarningWindow(slot0)
	slot0.MsgboxMgr.GetInstance():ShowMsgBox({
		mode = "showresttime",
		title = "warning",
		hideNo = true,
		type = MSGBOX_TYPE_SECONDPWD
	})
end

function pg.SecondaryPWDMgr.FetchData(slot0)
	slot0.m02:sendNotification(GAME.FETCH_PASSWORD_STATE)
end

function pg.SecondaryPWDMgr.IsNormalOp(slot0, slot1)
	if not slot1 then
		return false
	end

	return table.contains(slot0.LIMITED_OPERATION, slot1)
end

function pg.SecondaryPWDMgr.Dispose(slot0)
	return
end

return pg.SecondaryPWDMgr
