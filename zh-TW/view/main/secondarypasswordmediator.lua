slot0 = class("SecondaryPasswordMediator", import("view.base.ContextMediator"))
slot0.CONFIRM_PASSWORD = "SecondaryPasswordMediator:CONFIRM_PASSWORD"
slot0.SET_PASSWORD = "SecondaryPasswordMediator:SET_PASSWORD"

function slot0.register(slot0)
	slot0:bind(uv0.CONFIRM_PASSWORD, function (slot0, slot1)
		if uv0.contextData.type == pg.SecondaryPWDMgr.CHANGE_SETTING or uv0.contextData.type == pg.SecondaryPWDMgr.CLOSE_PASSWORD then
			slot5.pwd = slot1
			slot5.settings = uv0.contextData.settings

			uv0:sendNotification(GAME.SET_PASSWORD_SETTINGS, {})
		else
			slot5.pwd = slot1

			uv0:sendNotification(GAME.CONFIRM_PASSWORD, {})
		end
	end)
	slot0:bind(uv0.SET_PASSWORD, function (slot0, slot1, slot2)
		slot6.pwd = slot1
		slot6.tip = uv0.ClipUnicodeStr(slot2, 20)
		slot6.settings = uv1.contextData.settings

		uv1:sendNotification(GAME.SET_PASSWORD, {})
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.CONFIRM_PASSWORD_DONE
	slot1[2] = GAME.SET_PASSWORD_SETTINGS_DONE
	slot1[3] = GAME.FETCH_PASSWORD_STATE_DONE
	slot1[4] = GAME.SET_PASSWORD_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()
	slot4 = getProxy(SecondaryPWDProxy)
	slot5 = slot4:getRawData()

	if slot1:getName() == GAME.FETCH_PASSWORD_STATE_DONE then
		if not slot4:GetPermissionState() then
			slot6.type = MSGBOX_TYPE_SECONDPWD

			function slot6.onPreShow()
				uv0.viewComponent:emit(BaseUI.ON_CLOSE)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				title = "warning",
				mode = "showresttime",
				hideNo = true
			})
		end
	elseif slot2 == GAME.CONFIRM_PASSWORD_DONE or slot2 == GAME.SET_PASSWORD_SETTINGS_DONE then
		if slot3.result > 0 then
			if slot6 == 9 then
				slot5.fail_count = slot5.fail_count + 1

				if slot5.fail_count >= 5 then
					slot0:sendNotification(GAME.FETCH_PASSWORD_STATE)
				else
					pg.TipsMgr.GetInstance():ShowTips(string.format(i18n("secondarypassword_incorrectpwd_error"), 5 - slot5.fail_count))
				end
			elseif slot6 == 40 or slot6 == 1 then
				slot0:sendNotification(GAME.FETCH_PASSWORD_STATE)
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot6))
			end

			slot0.viewComponent:UpdateView()
			slot0.viewComponent:ClearInputs()
		else
			slot0:CloseAndCallback()
		end
	elseif slot2 == GAME.SET_PASSWORD_DONE then
		if slot3.result > 0 then
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", slot6))
			slot0:sendNotification(GAME.FETCH_PASSWORD_STATE)
		else
			slot0:CloseAndCallback()
		end
	end
end

function slot0.CloseAndCallback(slot0)
	slot0.viewComponent:emit(BaseUI.ON_CLOSE)

	if slot0.contextData.callback then
		slot1()
	end
end

function slot0.ClipUnicodeStr(slot0, slot1)
	slot2, slot3 = utf8_to_unicode(slot0)

	if slot1 < slot3 then
		slot5, slot6 = utf8_to_unicode(unicode_to_utf8(string.sub(slot2, 1, -7)))

		while slot1 < slot6 - 1 do
			slot5, slot6 = utf8_to_unicode(unicode_to_utf8(string.sub(slot4, 1, -7)))
		end

		return string.sub(unicode_to_utf8(slot4), 1, -2)
	end

	return slot0
end

return slot0
