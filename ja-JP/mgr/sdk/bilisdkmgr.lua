slot1 = BilibiliSdkMgr.inst
slot2 = "BLHXSESAUH180704"
slot3 = "FTBLHX20190524WW"

function slot0.InitSDK()
	if PLATFORM_CHT == PLATFORM_CODE then
		uv0.sandboxKey = uv1
	else
		uv0.sandboxKey = uv2
	end

	uv0:Init()
end

function slot0.GoSDkLoginScene()
	uv0:GoLoginScene()
end

function slot0.LoginQQ()
	uv0:Login(1)
end

function slot0.LoginWX()
	uv0:Login(2)
end

function slot0.LoginSdk(slot0)
	if slot0 == 1 then
		uv0.LoginQQ()
	elseif slot0 == 2 then
		uv0.LoginWX()
	else
		uv1:Login(0)
	end
end

function slot0.TryLoginSdk()
	uv0:TryLogin()
end

function slot0.CreateRole(slot0, slot1, slot2, slot3, slot4)
	uv0:CreateRole(slot0, slot1, slot2, 1000 * slot3, "vip0", slot4)
end

function slot0.EnterServer(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	uv0:EnterServer(slot0, slot1, slot2, slot3, slot4 * 1000, slot5, "vip0", slot6)
end

function slot0.ChooseServer(slot0, slot1)
	uv0:ChooseServer(slot0, slot1)
end

function slot0.SdkGateWayLogined()
	uv0:OnGatewayLogined()
end

function slot0.SdkLoginGetaWayFailed()
	uv0:OnLoginGatewayFailed()
end

function slot0.SdkLevelUp()
	uv0:LevelUp()
end

function slot0.SdkPay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	uv0:Pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
end

function slot0.LogoutSDK()
	uv0:LocalLogout()
end

function slot0.BindCPU()
end

function slot0.OnAndoridBackPress()
	uv0:onBackPressed()
end

function slot0.GetBiliServerId()
	slot0 = uv0.serverId

	print("serverId : " .. slot0)

	return slot0
end

function slot0.GetChannelUID()
	slot0 = uv0.channelUID

	print("channelUID : " .. slot0)

	return slot0
end

function slot0.GetLoginType()
	return uv0.loginType
end

function slot0.GetIsPlatform()
	return uv0.isPlatform
end

function StartSdkLogin()
	Timer.New(function ()
		uv0:OnLoginTimeOut()
	end, 30, 1):Start()
end

function GoLoginScene()
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN)
	gcAll()
end

function SDKLogined(slot0, slot1, slot2, slot3)
	if not pg.m02 then
		print("game is not start")

		return
	end

	slot5.arg1 = slot0
	slot5.arg2 = slot1
	slot5.arg3 = slot2
	slot5.arg4 = slot3
	slot8.user = User.New({
		type = 1
	})

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {})
end

function SDKLogouted(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	slot4.code = slot0

	pg.m02:sendNotification(GAME.LOGOUT, {})
end

function PaySuccess(slot0, slot1)
	if not pg.m02 then
		print("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()

	slot5.payId = slot0
	slot5.bsId = slot1

	pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {})
end

function PayFailed(slot0, slot1)
	if not pg.m02 then
		print("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()

	if not tonumber(slot1) then
		return
	end

	slot5.payId = slot0
	slot5.code = slot1

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {})

	if slot1 == -5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("订单签名异常" .. slot1))
	elseif slot1 > 0 then
		if slot1 > 1000 and slot1 < 2000 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("数据格式验证错误" .. slot1))
		elseif slot1 >= 2000 and slot1 < 3000 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("服务器返回异常" .. slot1))
		elseif slot1 >= 3000 and slot1 < 4000 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("未登录或者会话已超时" .. slot1))
		elseif slot1 == 4000 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("系统错误" .. slot1))
		elseif slot1 == 6001 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("用户中途取消" .. slot1))
		elseif slot1 == 7005 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
		elseif slot1 == 7004 then
			pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
		end
	elseif slot1 == -201 then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("生成订单失败" .. slot1))
	elseif slot1 == -202 then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("支付取消" .. slot1))
	elseif slot1 == -203 then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
	end
end

function OnSDKInitFailed(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	slot3.content = slot0
	slot3.onYes = uv0.InitSDK

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true
	})
end

function ShowMsgBox(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	slot3.content = slot0

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true
	})
end

return {}
