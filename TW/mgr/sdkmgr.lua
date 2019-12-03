pg = pg or {}
pg.SDKMgr = singletonClass("SDKMgr")
slot2 = nil

pg.SDKMgr.Init = function (slot0, slot1)
	print("initializing sdk manager...")

	slot0 = BilibiliSdkMgr.inst

	if CHANNEL_NAME == "txwy_kr" then
		TxwySdkMgr.inst:queryWithProduct()
	elseif CHANNEL_NAME == "komoe_cht" or CHANNEL_NAME == "komoe_cht_mycard" or CHANNEL_NAME == "komoe_cht_gp" then
		slot0 = KomoeSdkMgr.inst
	end

	slot1()
end

pg.SDKMgr.GetChannelUID = function (slot0)
	if CHANNEL_NAME == "komoe_cht" then
		return PLATFORM_CHT_IOS
	elseif CHANNEL_NAME == "komoe_cht_mycard" then
		return PLATFORM_CHT_MYCARD
	elseif CHANNEL_NAME == "komoe_cht_gp" then
		return PLATFORM_CHT_GO
	else
		return slot0.channelUID
	end
end

pg.SDKMgr.isPlatform = function (slot0)
	return slot0.isPlatform
end

pg.SDKMgr.isTenc = function (slot0)
	return slot0.isTenc
end

pg.SDKMgr.isAiriJP = function (slot0)
	return slot0.isAiriJP
end

pg.SDKMgr.localLogin = function (slot0)
	slot0:localLogin()
end

pg.SDKMgr.login = function (slot0, slot1)
	slot0:login(slot1)
end

pg.SDKMgr.localLogout = function (slot0)
	slot0:localLogout()
end

pg.SDKMgr.tryTencLogin = function (slot0)
	slot0:tryTencLogin()
end

pg.SDKMgr.getDeviceModel = function (slot0)
	if CHANNEL_NAME == "txwy_kr" then
		return slot0:getDeviceModel()
	end
end

pg.SDKMgr.createRole = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0:createRole(id, slot2, slot3, slot4, slot5, slot6)
end

pg.SDKMgr.enterServer = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot0:enterServer(tostring(slot1), slot2, playerId, slot4, slot5, slot6, slot7, slot8)
end

pg.SDKMgr.chooseServer = function (slot0, slot1, slot2)
	slot0:chooseServer(tostring(slot1), slot2)
end

pg.SDKMgr.levelUp = function (slot0, slot1)
	slot5 = getProxy(ServerProxy).getLastServer(slot4, getProxy(UserProxy).getData(slot2).uid)

	if CHANNEL_NAME == "txwy_kr" then
		slot0:levelUp(slot1, slot5.id)
	elseif CHANNEL_NAME == "komoe_cht" then
		slot0:levelUp(slot1)
	end
end

pg.SDKMgr.completedTutorial = function (slot0)
	if CHANNEL_NAME == "txwy_kr" then
		slot0:completedTutorial()
	end
end

pg.SDKMgr.unlockAchievement = function (slot0)
	if CHANNEL_NAME == "txwy_kr" then
		slot0:unlockAchievement()
	end
end

pg.SDKMgr.queryWithProduct = function (slot0)
	slot0:queryWithProduct(slot0:GetProductCode(), function (slot0)
		for slot5, slot6 in ipairs(slot1) do
			slot0:CheckProductPrice(string.split(slot6, "|")[1], string.split(slot6, "|")[2])
		end
	end)
end

pg.SDKMgr.GetProductCode = function (slot0)
	slot1 = ""

	for slot5, slot6 in ipairs(slot0.pay_data_display.all) do
		slot1 = slot1 .. slot0.pay_data_display[slot6].id_str .. ";"
	end

	return slot1
end

pg.SDKMgr.CheckProductPrice = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.pay_data_display.all) do
		if slot0.pay_data_display[slot7].id_str == slot1 and slot8.money ~= slot2 then
			print(string.format("<color=#ff0000>%s的商品价格和本地的价格不同</color> 本地价格：%s, 服务器价格：%s", slot8.name, slot8.money, slot2))
		end
	end
end

pg.SDKMgr.payKR = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if CHANNEL_NAME == "txwy_kr" then
		slot0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		slot0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	end
end

pg.SDKMgr.pay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	slot0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

pg.SDKMgr.GetSdkServerID = function (slot0)
	return slot0:getServerID()
end

pg.SDKMgr.callSdkApi = function (slot0, slot1, slot2)
	slot0:callSdkApi(slot1, slot2)
end

pg.SDKMgr.onBackPressed = function (slot0)
	slot0:onBackPressed()
end

pg.SDKMgr.userCenter = function (slot0)
	if CHANNEL_NAME == "txwy_kr" then
		slot2 = "未登入"

		if getProxy(PlayerProxy) then
			slot2 = slot1:getData().name
		end

		slot3 = UpdateMgr.Inst.currentVersion:ToString()

		if CSharpVersion > 7 then
			slot0:userCenter(slot2, slot3, "1")
		else
			slot0:userCenter(slot2, slot3)
		end
	end
end

pg.SDKMgr.bugReport = function (slot0)
	slot4 = getProxy(ServerProxy).getLastServer(slot3, getProxy(UserProxy).getData(slot1).uid)

	if CHANNEL_NAME == "txwy_kr" then
		slot6 = ""

		if getProxy(PlayerProxy) then
			slot6 = slot5:getData().name
		end

		slot7 = UpdateMgr.Inst.currentVersion:ToString()

		if CSharpVersion > 7 then
			slot0:bugReport(slot6, slot7, slot4.id)
		else
			slot0:bugReport(slot6, slot7)
		end
	end
end

pg.SDKMgr.storeReview = function (slot0)
	if CHANNEL_NAME == "txwy_kr" then
		slot0:storeReview()
	end
end

pg.SDKMgr.shareImg = function (slot0, slot1, slot2)
	if CHANNEL_NAME == "txwy_kr" then
		slot0:shareImg(slot1, slot2)
	end
end

pg.SDKMgr.SetIsLogin = function (slot0, slot1)
	slot0.isLoging = slot1
end

return
