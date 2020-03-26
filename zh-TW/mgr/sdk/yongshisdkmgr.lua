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
	--- BLOCK #1 9-22, warpins: 2 ---
	pg.SdkMgr.GetInstance().airi_uid = slot1 or "test"

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

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-34, warpins: 2 ---
	--- END OF BLOCK #2 ---



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

function GetUserInfoSuccess()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function GetUserInfoFailed()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot2(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0 == YongshiSdkUserBindInfo.FACEBOOK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-16, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(slot1 .. "facebook" .. slot2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 1 ---
		if slot0 == YongshiSdkUserBindInfo.APPLE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-32, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(slot1 .. "Apple Id" .. slot2)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-36, warpins: 1 ---
			if slot0 == YongshiSdkUserBindInfo.GOOGLE then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-48, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(slot1 .. "google" .. slot2)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 49-52, warpins: 1 ---
				if slot0 == YongshiSdkUserBindInfo.PHONE then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-54, warpins: 1 ---
					if slot1 == "解綁" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 55-55, warpins: 1 ---
						slot1 = "换绑"
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 56-67, warpins: 2 ---
					pg.TipsMgr.GetInstance():ShowTips(slot1 .. "手機" .. slot2)
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 68-70, warpins: 1 ---
					print("this platform is not supported")
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 71-71, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

function BindSuccess(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0(slot0, "綁定", "成功")
	pg.m02:sendNotification(GAME.CHT_SOCIAL_LINK_STATE_CHANGE, slot0)

	return
	--- END OF BLOCK #0 ---



end

function BindFailed(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 and slot1 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-13, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 2 ---
		slot0(slot0, "綁定", "失敗")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function UnBindSuccess(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0(slot0, "解綁", "成功")
	pg.m02:sendNotification(GAME.CHT_SOCIAL_LINK_STATE_CHANGE)

	return
	--- END OF BLOCK #0 ---



end

function UnBindFailed(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 and slot1 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-13, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(slot1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 2 ---
		slot0(slot0, "解綁", "失敗")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function OnDeepLinking(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	pg.YongshiDeepLinkingMgr.GetInstance():SetData(slot0)

	return
	--- END OF BLOCK #0 ---



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
	IsBindApple = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0.bindInfo:IsBindApple()
		--- END OF BLOCK #0 ---



	end,
	IsBindFaceBook = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0.bindInfo:IsBindFaceBook()
		--- END OF BLOCK #0 ---



	end,
	IsBindGoogle = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0.bindInfo:IsBindGoogle()
		--- END OF BLOCK #0 ---



	end,
	IsBindPhone = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0.bindInfo:IsBindPhone()
		--- END OF BLOCK #0 ---



	end,
	BindApple = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:BindApple()

		return
		--- END OF BLOCK #0 ---



	end,
	BindFaceBook = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:BindFaceBook()

		return
		--- END OF BLOCK #0 ---



	end,
	BindGoogle = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:BindGoogle()

		return
		--- END OF BLOCK #0 ---



	end,
	BindPhone = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:BindPhone()

		return
		--- END OF BLOCK #0 ---



	end,
	UnBindPhone = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:UnBindPhone()

		return
		--- END OF BLOCK #0 ---



	end,
	UnBindApple = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:UnBindApple()

		return
		--- END OF BLOCK #0 ---



	end,
	UnBindFaceBook = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:UnBindFaceBook()

		return
		--- END OF BLOCK #0 ---



	end,
	UnBindGoogle = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:UnBindGoogle()

		return
		--- END OF BLOCK #0 ---



	end,
	CanTriggerDeepLinking = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		return slot0:CanTriggerDeepLinking()
		--- END OF BLOCK #0 ---



	end,
	TriggerDeepLinking = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:TriggerDeepLinking()

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
	UserEventUpload = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:UserEventUpload(slot0)

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
	ShareImg = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:Share(slot0)

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
