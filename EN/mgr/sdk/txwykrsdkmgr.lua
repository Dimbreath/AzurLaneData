slot1 = TxwyKrSdkMgr.inst

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
end

function PayFailed(slot0, slot1)
	getProxy(ShopsProxy):removeWaitTimer()

	if not tonumber(slot1) then
		return
	end

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {
		payId = slot0,
		code = slot1
	})

	if slot1 == -202 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("pay_cancel") .. slot1)
	end
end

return {
	GoSDkLoginScene = function ()
		slot0:GoLoginScene()
	end,
	LoginSdk = function (slot0)
		slot0:Login(0)
	end,
	SdkGateWayLogined = function ()
		slot0:OnGatewayLogined()
	end,
	SdkLoginGetaWayFailed = function ()
		slot0:OnLoginGatewayFailed()
	end,
	LogoutSDK = function ()
		slot0:LocalLogout()
	end,
	EnterServer = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot0:EnterServer(slot0, slot1, slot2, slot3, slot4 * 1000, slot5, "vip0", slot6)
	end,
	SdkLevelUp = function (slot0, slot1)
		slot0:LevelUp(slot1, slot0)
	end,
	UserCenter = function ()
		slot1 = "未登入"

		if getProxy(PlayerProxy) then
			slot1 = slot0:getData().name
		end

		slot0:UserCenter(slot1, UpdateMgr.Inst.currentVersion:ToString(), "1")
	end,
	BugReport = function ()
		slot3 = getProxy(ServerProxy).getLastServer(slot2, getProxy(UserProxy).getData(slot0).uid)
		slot5 = ""

		if getProxy(PlayerProxy) then
			slot5 = slot4:getData().name
		end

		slot0:BugReport(slot5, UpdateMgr.Inst.currentVersion:ToString(), slot3.id)
	end,
	StoreReview = function ()
		slot0:StoreReview()
	end,
	ShareImg = function (slot0, slot1)
		slot0:ShareImg(slot0, slot1)
	end,
	CompletedTutorial = function ()
		slot0:CompletedTutorial()
	end,
	UnlockAchievement = function ()
		slot0:UnlockAchievement()
	end,
	QueryWithProduct = function ()
		function slot1(slot0, slot1)
			for slot5, slot6 in ipairs(pg.pay_data_display.all) do
				if pg.pay_data_display[slot6].id_str == slot0 and slot7.money ~= slot1 then
					print(string.format("<color=#ff0000>%s的商品价格和本地的价格不同</color> 本地价格：%s, 服务器价格：%s", slot7.name, slot7.money, slot1))
				end
			end
		end

		slot0:QueryWithProduct(slot0(), function (slot0)
			for slot5, slot6 in ipairs(slot1) do
				slot0(string.split(slot6, "|")[1], string.split(slot6, "|")[2])
			end
		end)
	end,
	SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
		slot0:Pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, getProxy(PlayerProxy):getRawData().level)
	end,
	BindCPU = function ()
		slot0:callSdkApi("bindCpu", nil)
	end,
	SwitchAccount = function ()
		slot0:SwitchAccount()
	end,
	GetBiliServerId = function ()
		print("serverId : " .. slot0.serverId)

		return slot0.serverId
	end,
	GetChannelUID = function ()
		print("channelUID : " .. slot0.channelUID)

		return slot0.channelUID
	end,
	GetLoginType = function ()
		return slot0.loginType
	end,
	GetIsPlatform = function ()
		return slot0.isPlatform
	end,
	GetDeviceModel = function ()
		return slot0:GetDeviceModel()
	end,
	OnAndoridBackPress = function ()
		PressBack()
	end
}
