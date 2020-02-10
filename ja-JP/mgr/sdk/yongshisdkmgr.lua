slot1 = YongshiSdkMgr.inst

function slot0.InitSDK()
	uv0:Init()
end

function slot0.GoSDkLoginScene()
	uv0:GoLoginScene()
end

function slot0.LoginSdk(slot0)
	uv0:Login(0)
end

function slot0.TryLoginSdk()
	uv0:TryLogin()
end

function slot0.SdkGateWayLogined()
	uv0:OnGatewayLogined()
end

function slot0.SdkLoginGetaWayFailed()
	uv0:OnLoginGatewayFailed()
end

function slot0.SdkPay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot14 = getProxy(ServerProxy):getLastServer(getProxy(UserProxy):getData().uid)
	slot15 = slot14.id
	slot17 = getProxy(PlayerProxy):getRawData()

	uv0:Pay(slot0, slot2, slot5, slot1, "1", slot3, "1", slot15, slot14.name, slot15, slot17.id, slot17.name, slot17.level, slot8, "1", slot4, slot6)
end

function slot0.LogoutSDK()
	uv0:LocalLogout()
end

function slot0.BindCPU()
	uv0:callSdkApi("bindCpu", nil)
end

function slot0.OnAndoridBackPress()
	PressBack()
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
end

return {}
