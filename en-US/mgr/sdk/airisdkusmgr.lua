slot1 = AiriUSSdkMgr.inst
slot2 = AiriUSSdkMgr.AiriSDKInst
slot3 = AiriUSSdkMgr.AiriSdkDataInst
AIRI_PLATFORM_FACEBOOK = "facebook"
AIRI_PLATFORM_TWITTER = "twitter"
AIRI_PLATFORM_YOSTAR = "yostar"
AIRI_SDK_INITED = false
slot0.OnAiriBuying = -1
slot0.BuyingLimit = 60

function slot0.CheckAudit()
	return NetConst.GATEWAY_PORT == 20001 and NetConst.GATEWAY_HOST == "audit.us.yo-star.com"
end

function slot0.CheckPreAudit()
	return NetConst.GATEWAY_PORT == 30001 and NetConst.GATEWAY_HOST == "audit.us.yo-star.com"
end

function slot0.CheckPretest()
	return false
end

function slot0.GoSDkLoginScene()
	uv0:GoLoginScene()
	uv1.AiriInit()
end

function slot0.AiriInit(slot0)
	pg.UIMgr.GetInstance():LoadingOn()
	uv0:InitSdk()
	print("CSharpVersion:" .. tostring(CSharpVersion))
end

function slot0.AiriLogin()
	pg.UIMgr.GetInstance():LoadingOn()
	uv0:Login()
end

function slot0.LoginWithSocial(slot0, slot1, slot2)
	pg.UIMgr.GetInstance():LoadingOn()

	if slot0 == AIRI_PLATFORM_FACEBOOK then
		uv0:LoginWithFB()
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		uv0:LoginWithTW()
	elseif slot0 == AIRI_PLATFORM_YOSTAR then
		uv0:LoginWithSDKAccount(slot1, slot2)
	end
end

function slot0.LoginWithTranscode(slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()
	uv0:LoginWithTranscode(slot0, slot1)
end

function slot0.TranscodeRequest()
	pg.UIMgr.GetInstance():LoadingOn()
	uv0:TranscodeRequest()
end

function slot0.AiriBuy(slot0, slot1, slot2)
	uv0.OnAiriBuying = Time.realtimeSinceStartup

	if slot1 == "audit" then
		uv1:NewBuy(slot0, Airisdk.BuyServerTag.audit, slot2)
	elseif slot1 == "preAudit" then
		uv1:NewBuy(slot0, Airisdk.BuyServerTag.preAudit, slot2)
	elseif slot1 == "production" then
		uv1:NewBuy(slot0, Airisdk.BuyServerTag.production, slot2)
	end
end

function slot0.LinkSocial(slot0, slot1, slot2)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		uv0:LinkSocial(Airisdk.LoginPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		uv0:LinkSocial(Airisdk.LoginPlatform.TWITTER)
	elseif slot0 == AIRI_PLATFORM_YOSTAR then
		uv0:LinkSocial(Airisdk.LoginPlatform.YOSTAR, slot1, slot2)
	end
end

function slot0.UnlinkSocial(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		uv0:UnlinkSocial(Airisdk.LoginPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		uv0:UnlinkSocial(Airisdk.LoginPlatform.TWITTER)
	end
end

function slot0.IsSocialLink(slot0)
	if not uv0.GetIsPlatform() then
		return false
	end

	if slot0 == AIRI_PLATFORM_FACEBOOK then
		return uv1:CheckPlatformLink(Airisdk.LoginPlatform.FACEBOOK)
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		return uv1:CheckPlatformLink(Airisdk.LoginPlatform.TWITTER)
	elseif slot0 == AIRI_PLATFORM_YOSTAR then
		return uv1:CheckPlatformLink(Airisdk.LoginPlatform.YOSTAR)
	end

	return false
end

function slot0.GetSocialName(slot0)
	if slot0 == AIRI_PLATFORM_FACEBOOK then
		return uv0.loginRet.FACEBOOK_NAME
	elseif slot0 == AIRI_PLATFORM_TWITTER then
		return uv0.loginRet.TWITTER_NAME
	elseif slot0 == AIRI_PLATFORM_YOSTAR then
		return uv0.loginRet.SDK_NAME
	end

	return ""
end

function slot0.SetBirth(slot0)
	pg.UIMgr.GetInstance():LoadingOn()
	uv0:SetBirth(slot0)
end

function slot0.GetIsBirthSet()
	return uv0:IsBirthSet()
end

function slot0.ClearAccountCache()
	uv0:ClearAccountCache()
end

function slot0.GameShare(slot0, slot1)
	uv0:SystemShare(slot0, slot1)
end

function slot0.VerificationCodeReq(slot0)
	uv0:VerificationCodeReq(slot0)

	AIRI_LAST_GEN_TIME = Time.realtimeSinceStartup
end

function slot0.OpenYostarHelp()
	slot1 = getProxy(PlayerProxy):getData()
	slot5 = getProxy(ServerProxy):getLastServer(getProxy(UserProxy):getData().uid)
	slot6 = pg.TimeMgr.GetInstance():STimeDescS(slot1.registerTime, "%Y-%m-%d %H:%M:%S")
	slot7 = math.modf(slot1.rmb / 100)

	print("uid:" .. slot1.id .. ",name:" .. slot1.name .. ",level" .. slot1.level .. ",serverId:" .. slot5.id .. " - " .. slot5.name .. ",rmb:" .. slot7 .. ",createTime:" .. slot6)
	uv0:OpenHelp(tostring(slot1.id), slot1.name, tostring(slot1.level), tostring(slot5.id .. " - " .. slot5.name), tostring(slot7), slot6)
end

function slot0.GetYostarUid()
	return uv0.loginRet.UID
end

function slot0.GetDeviceId()
	return uv0:GetDeviceID()
end

function slot0.GetLoginType()
	return uv0.loginType
end

function slot0.GetIsPlatform()
	return uv0.isPlatform
end

function slot0.GetChannelUID()
	slot0 = uv0.channelUID

	print("channelUID : " .. slot0)

	return slot0
end

function slot0.UserEventUpload(slot0)
	if uv0.GetIsPlatform() then
		uv1:UserEventUpload(slot0)
	end
end

function slot0.OnAndoridBackPress()
	PressBack()
end

function slot0.BindCPU()
end

function slot0.CheckAiriCanBuy()
	if uv0.OnAiriBuying == -1 or uv0.BuyingLimit < Time.realtimeSinceStartup - uv0.OnAiriBuying then
		return true
	else
		return false
	end
end

function GoLoginScene()
	print("US do nothing")
end

function AiriInitResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		AIRI_SDK_INITED = true

		OnAppPauseForSDK(false)
		AiriGoLogin()
	end
end

function AiriGoLogin(slot0)
	slot5.loginPlatform = slot0

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN, {})
	gcAll()
end

function AiriLogin(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		function ()
			slot1.arg1 = PLATFORM_AIRIUS
			slot1.arg2 = uv0.UID
			slot1.arg3 = uv0.ACCESS_TOKEN
			slot4.user = User.New({
				type = 1
			})

			pg.m02:sendNotification(GAME.PLATFORM_LOGIN_DONE, {})
		end()
	else
		print("AiriLogin failed")
		print(debug.traceback())
	end
end

function AiriTranscodeResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		slot4.transcode = slot0.MIGRATIONCODE

		pg.m02:sendNotification(GAME.ON_GET_TRANSCODE, {})
	end
end

function AiriBuyResult(slot0)
	uv0.OnAiriBuying = -1

	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		getProxy(ShopsProxy):removeWaitTimer()

		slot4.payId = slot0.EXTRADATA
		slot4.bsId = slot0.ORDERID

		pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {})
	else
		getProxy(ShopsProxy):removeWaitTimer()

		slot4.payId = slot0.EXTRADATA

		pg.m02:sendNotification(GAME.CHARGE_FAILED, {})
	end
end

function SetBirthResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("set_birth_success"))
	end
end

function LinkSocialResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_LINKED)
	end
end

function UnlinkSocialResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_UNLINKED)
	end
end

function VerificationCodeResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if uv0.AiriResultCodeHandler(slot0.R_CODE) then
		slot3.content = i18n("verification_code_req_tip2")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true
		})
	end
end

function OnAppPauseForSDK(slot0)
	if not AIRI_SDK_INITED then
		return
	end

	if slot0 then
		uv0:OnPause()
	else
		uv0:OnResume()
	end
end

function slot0.AiriResultCodeHandler(slot0)
	slot1 = slot0:ToInt()
	slot2 = ":" .. slot1

	if slot1 == 0 then
		return true
	else
		if slot1 == 100110 then
			uv0.ClearAccountCache()
		end

		print("SDK Error Code:" .. slot1)

		if string.find(i18n("new_airi_error_code_" .. slot1), "UndefinedLanguage") then
			pg.TipsMgr.GetInstance():ShowTips(i18n("new_airi_error_code_other") .. slot2)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot3 .. slot2)
		end
	end

	return false
end

return {}
