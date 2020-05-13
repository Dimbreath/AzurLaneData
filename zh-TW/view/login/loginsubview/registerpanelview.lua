slot0 = class("RegisterPanelView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "RegisterPanelView"
end

function slot0.OnLoaded(slot0)
end

function slot0.SetShareData(slot0, slot1)
	slot0.shareData = slot1
end

function slot0.OnInit(slot0)
	slot0.registerPanel = slot0._tf
	slot0.registerUsername = slot0:findTF("username", slot0.registerPanel)
	slot0.registerPassword = slot0:findTF("password", slot0.registerPanel)
	slot0.registerPassword2 = slot0:findTF("password2", slot0.registerPanel)
	slot0.registerEmail = slot0:findTF("email", slot0.registerPanel)
	slot0.cancelButton = slot0:findTF("cancel_button", slot0.registerPanel)
	slot0.confirmButton = slot0:findTF("confirm_button", slot0.registerPanel)

	slot0:InitEvent()
end

function slot0.InitEvent(slot0)
	onButton(slot0, slot0.confirmButton, function ()
		if getInputText(uv0.registerUsername) == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(uv0.registerUsername)

			return
		end

		if getInputText(uv0.registerPassword) == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(uv0.registerPassword)

			return
		end

		if getInputText(uv0.registerPassword2) ~= slot1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_error_diffPassword"))
			ActivateInputField(uv0.registerPassword2)

			return
		end

		if getInputText(uv0.registerEmail) == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_error_noMailBox"))
			ActivateInputField(uv0.registerEmail)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot3
		}) then
			uv0.event:emit(LoginMediator.ON_REGISTER, slot4)
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.cancelButton, function ()
		uv0:emit(LoginSceneConst.SWITCH_SUB_VIEW, {
			LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW
		})
	end, SFX_CANCEL)
end

function slot0.Clear(slot0)
	setInputText(slot0.registerPassword, "")
	setInputText(slot0.registerPassword2, "")
end

function slot0.OnDestroy(slot0)
end

return slot0
