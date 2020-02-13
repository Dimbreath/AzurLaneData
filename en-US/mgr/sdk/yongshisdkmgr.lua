slot1 = YongshiSdkMgr.inst

function StartSdkLogin()
	Timer.New(function ()
		slot0:OnLoginTimeOut()
	end, 30, 1):Start()
end

function GoLoginScene()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not pg.m02 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		print("game is not start")

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-20, warpins: 2 ---
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN)
	gcAll()

	return
	--- END OF BLOCK #1 ---



end

function SDKLogined(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not pg.m02 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		print("game is not start")

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-26, warpins: 2 ---
	pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {
		user = User.New({
			type = 1,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot2,
			arg4 = slot3
		})
	})

	return
	--- END OF BLOCK #1 ---



end

function SDKLogouted(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not pg.m02 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		print("game is not start")

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-18, warpins: 2 ---
	pg.m02:sendNotification(GAME.LOGOUT, {
		code = slot0
	})

	return
	--- END OF BLOCK #1 ---



end

function PaySuccess(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not pg.m02 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		print("game is not start")

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-25, warpins: 2 ---
	getProxy(ShopsProxy):removeWaitTimer()
	pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
		payId = slot0,
		bsId = slot1
	})

	return
	--- END OF BLOCK #1 ---



end

function PayFailed(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not pg.m02 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		print("game is not start")

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-20, warpins: 2 ---
	getProxy(ShopsProxy):removeWaitTimer()

	if not tonumber(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-21, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-32, warpins: 2 ---
	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = slot0,
		code = slot1
	})

	return
	--- END OF BLOCK #2 ---



end

return {
	InitSDK = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:Init()

		return
		--- END OF BLOCK #0 ---



	end,
	GoSDkLoginScene = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:GoLoginScene()

		return
		--- END OF BLOCK #0 ---



	end,
	LoginSdk = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:Login(0)

		return
		--- END OF BLOCK #0 ---



	end,
	TryLoginSdk = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:TryLogin()

		return
		--- END OF BLOCK #0 ---



	end,
	SdkGateWayLogined = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:OnGatewayLogined()

		return
		--- END OF BLOCK #0 ---



	end,
	SdkLoginGetaWayFailed = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:OnLoginGatewayFailed()

		return
		--- END OF BLOCK #0 ---



	end,
	SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-47, warpins: 1 ---
		slot17 = getProxy(PlayerProxy):getRawData()

		slot0:Pay(slot0, slot2, slot5, slot1, "1", slot3, "1", getProxy(ServerProxy).getLastServer(slot13, slot12).id, getProxy(ServerProxy).getLastServer(slot13, slot12).name, , slot17.id, slot17.name, slot17.level, slot8, "1", slot4, slot6)

		return
		--- END OF BLOCK #0 ---



	end,
	LogoutSDK = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:LocalLogout()

		return
		--- END OF BLOCK #0 ---



	end,
	BindCPU = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:callSdkApi("bindCpu", nil)

		return
		--- END OF BLOCK #0 ---



	end,
	OnAndoridBackPress = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		PressBack()

		return
		--- END OF BLOCK #0 ---



	end,
	GetBiliServerId = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		print("serverId : " .. slot0.serverId)

		return slot0.serverId
		--- END OF BLOCK #0 ---



	end,
	GetChannelUID = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		print("channelUID : " .. slot0.channelUID)

		return slot0.channelUID
		--- END OF BLOCK #0 ---



	end,
	GetLoginType = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return slot0.loginType
		--- END OF BLOCK #0 ---



	end,
	GetIsPlatform = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return slot0.isPlatform
		--- END OF BLOCK #0 ---



	end
}
