pg = pg or {}
slot0 = pg
slot0.SDKMgr = singletonClass("SDKMgr")
slot1 = slot0.SDKMgr
slot2 = nil

function slot1.Init(slot0, slot1)
	print("initializing sdk manager...")

	uv0 = BilibiliSdkMgr.inst

	if CHANNEL_NAME == "txwy_kr" then
		uv0 = TxwySdkMgr.inst

		slot0:queryWithProduct()
	elseif CHANNEL_NAME == "komoe_cht" or CHANNEL_NAME == "komoe_cht_mycard" or CHANNEL_NAME == "komoe_cht_gp" then
		uv0 = KomoeSdkMgr.inst
	end

	slot1()
end

function slot1.GetChannelUID(slot0)
	if CHANNEL_NAME == "komoe_cht" then
		return PLATFORM_CHT_IOS
	elseif CHANNEL_NAME == "komoe_cht_mycard" then
		return PLATFORM_CHT_MYCARD
	elseif CHANNEL_NAME == "komoe_cht_gp" then
		return PLATFORM_CHT_GO
	else
		return uv0.channelUID
	end
end

function slot1.isPlatform(slot0)
	return uv0.isPlatform
end

function slot1.isTenc(slot0)
	return uv0.isTenc
end

function slot1.isAiriJP(slot0)
	return uv0.isAiriJP
end

function slot1.localLogin(slot0)
	uv0:localLogin()
end

function slot1.login(slot0, slot1)
	uv0:login(slot1)
end

function slot1.localLogout(slot0)
	uv0:localLogout()
end

function slot1.tryTencLogin(slot0)
	uv0:tryTencLogin()
end

function slot1.getDeviceModel(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		return uv0:getDeviceModel()
	end
end

function slot1.createRole(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	uv0:createRole(id, slot2, slot3, slot4, slot5, slot6)
end

function slot1.enterServer(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	uv0:enterServer(tostring(slot1), slot2, playerId, slot4, slot5, slot6, slot7, slot8)
end

function slot1.chooseServer(slot0, slot1, slot2)
	uv0:chooseServer(tostring(slot1), slot2)
end

function slot1.levelUp(slot0, slot1)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:levelUp(slot1, getProxy(ServerProxy):getLastServer(getProxy(UserProxy):getData().uid).id)
	elseif CHANNEL_NAME == "komoe_cht" then
		uv0:levelUp(slot1)
	end
end

function slot1.completedTutorial(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:completedTutorial()
	end
end

function slot1.unlockAchievement(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:unlockAchievement()
	end
end

function slot1.queryWithProduct(slot0)
	uv0:queryWithProduct(slot0:GetProductCode(), function (slot0)
		for slot5, slot6 in ipairs(string.split(slot0, ";")) do
			slot7 = string.split(slot6, "|")

			uv0:CheckProductPrice(slot7[1], slot7[2])
		end
	end)
end

function slot1.GetProductCode(slot0)
	for slot5, slot6 in ipairs(uv0.pay_data_display.all) do
		slot1 = "" .. uv0.pay_data_display[slot6].id_str .. ";"
	end

	return slot1
end

function slot1.CheckProductPrice(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(uv0.pay_data_display.all) do
		if uv0.pay_data_display[slot7].id_str == slot1 and slot8.money ~= slot2 then
			print(string.format("<color=#ff0000>%s的商品价格和本地的价格不同</color> 本地价格：%s, 服务器价格：%s", slot8.name, slot8.money, slot2))
		end
	end
end

function slot1.payKR(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		uv0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	end
end

function slot1.pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	uv0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

function slot1.GetSdkServerID(slot0)
	return uv0:getServerID()
end

function slot1.callSdkApi(slot0, slot1, slot2)
	uv0:callSdkApi(slot1, slot2)
end

function slot1.onBackPressed(slot0)
	uv0:onBackPressed()
end

function slot1.userCenter(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		slot2 = "未登入"

		if getProxy(PlayerProxy) then
			slot2 = slot1:getData().name
		end

		if CSharpVersion > 7 then
			uv0:userCenter(slot2, UpdateMgr.Inst.currentVersion:ToString(), "1")
		else
			uv0:userCenter(slot2, slot3)
		end
	end
end

function slot1.bugReport(slot0)
	slot4 = getProxy(ServerProxy):getLastServer(getProxy(UserProxy):getData().uid)

	if CHANNEL_NAME == "txwy_kr" then
		slot6 = ""

		if getProxy(PlayerProxy) then
			slot6 = slot5:getData().name
		end

		if CSharpVersion > 7 then
			uv0:bugReport(slot6, UpdateMgr.Inst.currentVersion:ToString(), slot4.id)
		else
			uv0:bugReport(slot6, slot7)
		end
	end
end

function slot1.storeReview(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:storeReview()
	end
end

function slot1.shareImg(slot0, slot1, slot2)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:shareImg(slot1, slot2)
	end
end

function slot1.SetIsLogin(slot0, slot1)
	uv0.isLoging = slot1
end
