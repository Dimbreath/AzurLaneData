slot1 = TxwyKrSdkMgr.inst

function slot0.GoSDkLoginScene()
	uv0:GoLoginScene()
end

function slot0.LoginSdk(slot0)
	uv0:Login(0)
end

function slot0.SdkGateWayLogined()
	uv0:OnGatewayLogined()
end

function slot0.SdkLoginGetaWayFailed()
	uv0:OnLoginGatewayFailed()
end

function slot0.LogoutSDK()
	uv0:LocalLogout()
end

function slot0.EnterServer(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	uv0:EnterServer(slot0, slot1, slot2, slot3, slot4 * 1000, slot5, "vip0", slot6)
end

function slot0.SdkLevelUp(slot0, slot1)
	uv0:LevelUp(slot1, slot0)
end

function slot0.UserCenter()
	slot1 = "未登入"

	if getProxy(PlayerProxy) then
		slot1 = slot0:getData().name
	end

	uv0:UserCenter(slot1, UpdateMgr.Inst.currentVersion:ToString(), "1")
end

function slot0.BugReport()
	slot3 = getProxy(ServerProxy):getLastServer(getProxy(UserProxy):getData().uid)
	slot5 = ""

	if getProxy(PlayerProxy) then
		slot5 = slot4:getData().name
	end

	uv0:BugReport(slot5, UpdateMgr.Inst.currentVersion:ToString(), slot3.id)
end

function slot0.StoreReview()
	uv0:StoreReview()
end

function slot0.ShareImg(slot0, slot1)
	uv0:ShareImg(slot0, slot1)
end

function slot0.CompletedTutorial()
	uv0:CompletedTutorial()
end

function slot0.UnlockAchievement()
	uv0:UnlockAchievement()
end

function slot0.QueryWithProduct()
	function slot1(slot0, slot1)
		for slot5, slot6 in ipairs(pg.pay_data_display.all) do
			if pg.pay_data_display[slot6].id_str == slot0 and slot7.money ~= slot1 then
				print(string.format("<color=#ff0000>%s的商品价格和本地的价格不同</color> 本地价格：%s, 服务器价格：%s", slot7.name, slot7.money, slot1))
			end
		end
	end

	uv0:QueryWithProduct(function ()
		for slot4, slot5 in ipairs(pg.pay_data_display.all) do
			slot0 = "" .. pg.pay_data_display[slot5].id_str .. ";"
		end

		return slot0
	end(), function (slot0)
		for slot5, slot6 in ipairs(string.split(slot0, ";")) do
			slot7 = string.split(slot6, "|")

			uv0(slot7[1], slot7[2])
		end
	end)
end

function slot0.SdkPay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	uv0:Pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, getProxy(PlayerProxy):getRawData().level)
end

function slot0.BindCPU()
	uv0:callSdkApi("bindCpu", nil)
end

function slot0.SwitchAccount()
	uv0:SwitchAccount()
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

function slot0.GetDeviceModel()
	return uv0:GetDeviceModel()
end

function slot0.OnAndoridBackPress()
	PressBack()
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
end

function PayFailed(slot0, slot1)
	getProxy(ShopsProxy):removeWaitTimer()

	if not tonumber(slot1) then
		return
	end

	slot5.payId = slot0
	slot5.code = slot1

	pg.m02:sendNotification(GAME.CHARGE_FAILED, {})

	if slot1 == -202 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("pay_cancel") .. slot1)
	end
end

return {}
