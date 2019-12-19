slot1 = AiriJPSdkMgr.inst
slot2 = AiriJPSdkMgr.AiriSDKInst
slot3 = AiriJPSdkMgr.AiriSdkDataInst
AIRI_PLATFORM_FACEBOOK = "facebook"
AIRI_PLATFORM_TWITTER = "twitter"
AIRI_PLATFORM_YOSTAR = "yostar"
AIRI_SDK_INITED = false

function GoLoginScene()
	print("JP do nothing")
end

function AiriInitResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		AIRI_SDK_INITED = true

		OnAppPauseForSDK(false)
		AiriGoLogin()
	end
end

function AiriGoLogin(slot0)
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LOGIN, {
		loginPlatform = slot0
	})
	gcAll()
end

function AiriLogin(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		slot1()

		slot0.isCache = true
	else
		print("AiriLogin failed")
	end
end

function AiriTranscodeResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_GET_TRANSCODE, {
			transcode = slot0.MIGRATIONCODE
		})
	end
end

function AiriBuyResult(slot0)
	slot0.OnAiriBuying = -1

	pg.UIMgr.GetInstance():LoadingOff()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		getProxy(ShopsProxy):removeWaitTimer()
		pg.m02:sendNotification(GAME.CHARGE_CONFIRM, {
			payId = slot0.EXTRADATA,
			bsId = slot0.ORDERID
		})
	else
		getProxy(ShopsProxy):removeWaitTimer()
		pg.m02:sendNotification(GAME.CHARGE_FAILED, {
			payId = slot0.EXTRADATA
		})
	end
end

function SetBirthResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("set_birth_success"))
	end
end

function LinkSocialResult(slot0)
	slot0.EndAiriTimeout()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_LINKED)
	end
end

function UnlinkSocialResult(slot0)
	slot0.EndAiriTimeout()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.m02:sendNotification(GAME.ON_SOCIAL_UNLINKED)
	end
end

function VerificationCodeResult(slot0)
	pg.UIMgr.GetInstance():LoadingOff()

	if slot0.AiriResultCodeHandler(slot0.R_CODE) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("verification_code_req_tip2")
		})
	end
end

function OnAppPauseForSDK(slot0)
	if not AIRI_SDK_INITED then
		return
	end

	if slot0 then
		slot0:OnPause()
	else
		slot0:OnResume()
	end
end

return {
	OnAiriBuying = -1,
	BuyingLimit = 60,
	isCache = false,
	CheckAudit = function ()
		return NetConst.GATEWAY_PORT == 20001 and NetConst.GATEWAY_HOST == "blhxjpauditapi.azurlane.jp"
	end,
	CheckPreAudit = function ()
		return NetConst.GATEWAY_PORT == 30001 and NetConst.GATEWAY_HOST == "blhxjpauditapi.azurlane.jp"
	end,
	CheckPretest = function ()
		return false
	end,
	GoSDkLoginScene = function ()
		slot0:GoLoginScene()
		slot1.AiriInit()
	end,
	AiriInit = function (slot0)
		pg.UIMgr.GetInstance():LoadingOn()
		slot0:InitSdk()
		print("CSharpVersion:" .. tostring(CSharpVersion))
	end,
	AiriLogin = function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.UIMgr.GetInstance().LoadingOn:Login()
	end,
	LoginWithDevice = function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.UIMgr.GetInstance().LoadingOn:LoginWithDevice()
	end,
	LoginWithSocial = function (slot0, slot1, slot2)
		pg.UIMgr.GetInstance():LoadingOn()

		if slot0 == AIRI_PLATFORM_FACEBOOK then
			slot0:LoginWithFB()
		elseif slot0 == AIRI_PLATFORM_TWITTER then
			slot0:LoginWithTW()
		elseif slot0 == AIRI_PLATFORM_YOSTAR then
			slot0:LoginWithSDKAccount(slot1, slot2)
		end
	end,
	LoginWithTranscode = function (slot0, slot1)
		pg.UIMgr.GetInstance():LoadingOn()
		slot0:LoginWithTranscode(slot0, slot1)
	end,
	TranscodeRequest = function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.UIMgr.GetInstance().LoadingOn:TranscodeRequest()
	end,
	AiriBuy = function (slot0, slot1, slot2)
		slot0.OnAiriBuying = Time.realtimeSinceStartup

		if slot1 == "audit" then
			slot1:NewBuy(slot0, Airisdk.BuyServerTag.audit, slot2)
		elseif slot1 == "preAudit" then
			slot1:NewBuy(slot0, Airisdk.BuyServerTag.preAudit, slot2)
		elseif slot1 == "production" then
			slot1:NewBuy(slot0, Airisdk.BuyServerTag.production, slot2)
		end
	end,
	LinkSocial = function (slot0, slot1, slot2)
		slot0.SetAiriTimeout()

		if slot0 == AIRI_PLATFORM_FACEBOOK then
			slot1:LinkSocial(Airisdk.LoginPlatform.FACEBOOK)
		elseif slot0 == AIRI_PLATFORM_TWITTER then
			slot1:LinkSocial(Airisdk.LoginPlatform.TWITTER)
		elseif slot0 == AIRI_PLATFORM_YOSTAR then
			slot1:LinkSocial(Airisdk.LoginPlatform.YOSTAR, slot1, slot2)
		end
	end,
	UnlinkSocial = function (slot0)
		slot0.SetAiriTimeout()

		if slot0 == AIRI_PLATFORM_FACEBOOK then
			slot1:UnlinkSocial(Airisdk.LoginPlatform.FACEBOOK)
		elseif slot0 == AIRI_PLATFORM_TWITTER then
			slot1:UnlinkSocial(Airisdk.LoginPlatform.TWITTER)
		end
	end,
	IsSocialLink = function (slot0)
		if not slot0.GetIsPlatform() then
			return false
		end

		if slot0 == AIRI_PLATFORM_FACEBOOK then
			return slot1:CheckPlatformLink(Airisdk.LoginPlatform.FACEBOOK)
		elseif slot0 == AIRI_PLATFORM_TWITTER then
			return slot1:CheckPlatformLink(Airisdk.LoginPlatform.TWITTER)
		elseif slot0 == AIRI_PLATFORM_YOSTAR then
			return slot1:CheckPlatformLink(Airisdk.LoginPlatform.YOSTAR)
		end

		return false
	end,
	GetSocialName = function (slot0)
		if slot0 == AIRI_PLATFORM_FACEBOOK then
			return slot0.loginRet.FACEBOOK_NAME
		elseif slot0 == AIRI_PLATFORM_TWITTER then
			return slot0.loginRet.TWITTER_NAME
		elseif slot0 == AIRI_PLATFORM_YOSTAR then
			return slot0.loginRet.SDK_NAME
		end

		return ""
	end,
	SetBirth = function (slot0)
		pg.UIMgr.GetInstance():LoadingOn()
		slot0:SetBirth(slot0)
	end,
	GetIsBirthSet = function ()
		return slot0:IsBirthSet()
	end,
	ClearAccountCache = function ()
		slot0:ClearAccountCache()
	end,
	GameShare = function (slot0, slot1)
		slot0:SystemShare(slot0, slot1)
	end,
	VerificationCodeReq = function (slot0)
		slot0:VerificationCodeReq(slot0)

		AIRI_LAST_GEN_TIME = Time.realtimeSinceStartup
	end,
	OpenYostarHelp = function ()
		slot0:OpenHelpShift()
	end,
	GetYostarUid = function ()
		return slot0.loginRet.UID
	end,
	GetDeviceId = function ()
		return slot0:GetDeviceID()
	end,
	GetLoginType = function ()
		return slot0.loginType
	end,
	GetIsPlatform = function ()
		return slot0.isPlatform
	end,
	GetChannelUID = function ()
		print("channelUID : " .. slot0.channelUID)

		return slot0.channelUID
	end,
	GetTransCode = function ()
		if Application.isEditor then
			return "NULL"
		else
			return slot0.loginRet.MIGRATIONCODE
		end
	end,
	UserEventUpload = function (slot0)
		if slot0.GetIsPlatform() then
			slot1:UserEventUpload(slot0)
		end
	end,
	OnAndoridBackPress = function ()
		PressBack()
	end,
	BindCPU = function ()
		return
	end,
	CheckAiriCanBuy = function ()
		if slot0.OnAiriBuying == -1 or slot0.BuyingLimit < Time.realtimeSinceStartup - slot0.OnAiriBuying then
			return true
		else
			return false
		end
	end,
	CheckHadAccountCache = function ()
		if CSharpVersion >= 33 then
			if slot0.GetIsPlatform() then
				return slot1:CheckHadAccountCache() or slot0.isCache
			else
				return true
			end
		else
			return true
		end
	end,
	AiriResultCodeHandler = function (slot0)
		slot2 = ":" .. slot0:ToInt()

		if slot0.ToInt() == 0 then
			return true
		else
			print("SDK Error Code:" .. slot1)

			if string.find(i18n("new_airi_error_code_" .. slot1), "UndefinedLanguage") then
				pg.TipsMgr.GetInstance():ShowTips(i18n("new_airi_error_code_other") .. slot2)
			else
				pg.TipsMgr.GetInstance():ShowTips(slot3 .. slot2)
			end
		end

		return false
	end,
	ON_AIRI_LOADING = false,
	SetAiriTimeout = function ()
		pg.UIMgr.GetInstance():LoadingOn()

		pg.UIMgr.GetInstance().LoadingOn.ON_AIRI_LOADING = true

		onDelayTick(function ()
			if slot0.ON_AIRI_LOADING then
				pg.UIMgr.GetInstance():LoadingOff()

				pg.UIMgr.GetInstance().LoadingOff.ON_AIRI_LOADING = false
			end
		end, 15)
	end,
	EndAiriTimeout = function ()
		slot0.ON_AIRI_LOADING = false

		pg.UIMgr.GetInstance():LoadingOff()
	end
}
