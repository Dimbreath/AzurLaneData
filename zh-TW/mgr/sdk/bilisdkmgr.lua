slot1 = BilibiliSdkMgr.inst
slot2 = "BLHXSESAUH180704"
slot3 = "FTBLHX20190524WW"

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
	--- BLOCK #2 22-33, warpins: 2 ---
	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = slot0,
		code = slot1
	})

	if slot1 == -5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-46, warpins: 1 ---
		pg.TipsMgr.GetInstance():ShowTips(i18n1("订单签名异常" .. slot1))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-49, warpins: 1 ---
		if slot1 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 50-52, warpins: 1 ---
			if slot1 > 1000 and slot1 < 2000 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-68, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n1("数据格式验证错误" .. slot1))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 69-71, warpins: 2 ---
				if slot1 >= 2000 and slot1 < 3000 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 75-87, warpins: 1 ---
					pg.TipsMgr.GetInstance():ShowTips(i18n1("服务器返回异常" .. slot1))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 88-90, warpins: 2 ---
					if slot1 >= 3000 and slot1 < 4000 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 94-106, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n1("未登录或者会话已超时" .. slot1))
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 107-108, warpins: 2 ---
						if slot1 == 4000 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 109-121, warpins: 1 ---
							pg.TipsMgr.GetInstance():ShowTips(i18n1("系统错误" .. slot1))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 122-123, warpins: 1 ---
							if slot1 == 6001 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 124-136, warpins: 1 ---
								pg.TipsMgr.GetInstance():ShowTips(i18n1("用户中途取消" .. slot1))
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 137-138, warpins: 1 ---
								if slot1 == 7005 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 139-151, warpins: 1 ---
									pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 152-153, warpins: 1 ---
									if slot1 == 7004 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 154-166, warpins: 1 ---
										pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 167-168, warpins: 1 ---
			if slot1 == -201 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 169-181, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n1("生成订单失败" .. slot1))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 182-183, warpins: 1 ---
				if slot1 == -202 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 184-196, warpins: 1 ---
					pg.TipsMgr.GetInstance():ShowTips(i18n1("支付取消" .. slot1))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 197-198, warpins: 1 ---
					if slot1 == -203 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 199-210, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n1("支付失败" .. slot1))
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 211-211, warpins: 13 ---
	return
	--- END OF BLOCK #3 ---



end

function OnSDKInitFailed(slot0)

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
	--- BLOCK #1 9-21, warpins: 2 ---
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = slot0,
		onYes = slot0.InitSDK
	})

	return
	--- END OF BLOCK #1 ---



end

function ShowMsgBox(slot0)

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
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = slot0
	})

	return
	--- END OF BLOCK #1 ---



end

return {
	InitSDK = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if PLATFORM_CHT == PLATFORM_CODE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-8, warpins: 1 ---
			slot0.sandboxKey = slot1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot0.sandboxKey = slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-16, warpins: 2 ---
		slot0:Init()

		return
		--- END OF BLOCK #1 ---



	end,
	GoSDkLoginScene = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:GoLoginScene()

		return
		--- END OF BLOCK #0 ---



	end,
	LoginQQ = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:Login(1)

		return
		--- END OF BLOCK #0 ---



	end,
	LoginWX = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:Login(2)

		return
		--- END OF BLOCK #0 ---



	end,
	LoginSdk = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-6, warpins: 1 ---
			slot0.LoginQQ()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-8, warpins: 1 ---
			if slot0 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-12, warpins: 1 ---
				slot0.LoginWX()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-17, warpins: 1 ---
				slot1:Login(0)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end,
	TryLoginSdk = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:TryLogin()

		return
		--- END OF BLOCK #0 ---



	end,
	CreateRole = function (slot0, slot1, slot2, slot3, slot4)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0:CreateRole(slot0, slot1, slot2, 1000 * slot3, "vip0", slot4)

		return
		--- END OF BLOCK #0 ---



	end,
	EnterServer = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:EnterServer(slot0, slot1, slot2, slot3, slot4 * 1000, slot5, "vip0", slot6)

		return
		--- END OF BLOCK #0 ---



	end,
	ChooseServer = function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:ChooseServer(slot0, slot1)

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
	SdkLevelUp = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:LevelUp()

		return
		--- END OF BLOCK #0 ---



	end,
	SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0:Pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)

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
		--- BLOCK #0 1-1, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end,
	OnAndoridBackPress = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:onBackPressed()

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
