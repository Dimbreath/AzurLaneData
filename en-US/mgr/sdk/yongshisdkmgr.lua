slot1 = YongshiSdkMgr.inst
slot2 = "com.hkmanjuu.azurlane.gp.mc"
slot3 = "com.hkmanjuu.azurlane.gp"
slot4 = "com.hkmanjuu.azurlane.ios1"

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

	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = User.New({
			type = 1,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot2,
			arg4 = slot3
		})
	})
end

function SDKLogouted(slot0)
	if not pg.m02 then
		print("game is not start")

		return
	end

	pg.m02:sendNotification(GAME.LOGOUT, {
		code = slot0
	})
end

function PaySuccess(slot0, slot1)
	if not pg.m02 then
		print("game is not start")

		return
	end

	getProxy(ShopsProxy):removeWaitTimer()
	pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
		payId = slot0,
		bsId = slot1
	})
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

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = slot0,
		code = slot1
	})
end

return {
	CheckPretest = function ()
		return NetConst.GATEWAY_HOST == "ts-all-login.azurlane.tw" and (NetConst.GATEWAY_PORT == 11001 or NetConst.GATEWAY_PORT == 11101) or Application.isEditor
	end,
	InitSDK = function ()
		uv0:Init()
	end,
	GoSDkLoginScene = function ()
		uv0:GoLoginScene()
	end,
	LoginSdk = function (slot0)
		uv0:Login(0)
	end,
	TryLoginSdk = function ()
		uv0:TryLogin()
	end,
	SdkGateWayLogined = function ()
		uv0:OnGatewayLogined()
	end,
	SdkLoginGetaWayFailed = function ()
		uv0:OnLoginGatewayFailed()
	end,
	SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
		slot14 = getProxy(ServerProxy):getLastServer(getProxy(UserProxy):getData().uid)
		slot15 = slot14.id
		slot17 = getProxy(PlayerProxy):getRawData()

		uv0:Pay(slot0, slot2, slot5, slot1, "1", slot3, "1", slot15, slot14.name, slot15, slot17.id, slot17.name, slot17.level, slot8, "1", slot4, slot6)
	end,
	LogoutSDK = function ()
		uv0:LocalLogout()
	end,
	BindCPU = function ()
		uv0:callSdkApi("bindCpu", nil)
	end,
	OnAndoridBackPress = function ()
		PressBack()
	end,
	GetBiliServerId = function ()
		slot0 = uv0.serverId

		print("serverId : " .. slot0)

		return slot0
	end,
	GetChannelUID = function ()
		slot0 = uv0.channelUID

		print("channelUID : " .. slot0)

		return slot0
	end,
	GetLoginType = function ()
		return uv0.loginType
	end,
	GetIsPlatform = function ()
		return uv0.isPlatform
	end,
	GetPackageCode = function (slot0)
		if slot0 == uv0 then
			return "2"
		elseif slot0 == uv1 then
			return "1"
		elseif slot0 == uv2 then
			return "3"
		end
	end
}
