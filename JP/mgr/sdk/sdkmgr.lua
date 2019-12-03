pg = pg or {}
pg.SdkMgr = singletonClass("SdkMgr")

pg.SdkMgr.Ctor = function (slot0)
	if PLATFORM_CODE == PLATFORM_CH then
		slot0.instance = require("Mgr.Sdk.BiliSDKMgr")
	elseif PLATFORM_CODE == PLATFORM_JP then
		slot0.instance = require("Mgr.Sdk.AiriSDKJPMgr")
	elseif PLATFORM_CODE == PLATFORM_KR then
		slot0.instance = require("Mgr.Sdk.TxwyKrSDKMgr")
	elseif PLATFORM_CODE == PLATFORM_US then
		slot0.instance = require("Mgr.Sdk.AiriSDKUSMgr")
	elseif PLATFORM_CODE == PLATFORM_CHT then
		slot0.instance = require("Mgr.Sdk.YongshiSdkMgr")
	end
end

pg.SdkMgr.Call = function (slot0, slot1, ...)
	if slot0.instance[slot1] then
		slot0.instance[slot1](unpack({
			...
		}))
	end
end

pg.SdkMgr.Get = function (slot0, slot1, ...)
	return slot0.instance[slot1](unpack({
		...
	}))
end

function EnterMultiWindow(slot0)
	print(".......EnterMultiWindow")
end

function ExitMultiWindow(slot0)
	print(".......ExitMultiWindow")
end

pg.SdkMgr.InitSDK = function (slot0)
	slot0:Call("InitSDK")
end

pg.SdkMgr.GoSDkLoginScene = function (slot0)
	slot0:Call("GoSDkLoginScene")
end

pg.SdkMgr.LoginSdk = function (slot0, slot1)
	slot0:Call("LoginSdk", slot1)
end

pg.SdkMgr.TryLoginSdk = function (slot0)
	slot0:Call("TryLoginSdk")
end

pg.SdkMgr.CreateRole = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:Call("CreateRole", slot1, slot2, slot3, slot4, slot5)
end

pg.SdkMgr.EnterServer = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0:Call("EnterServer", slot1, slot2, slot3, slot4, slot5, slot6, slot7)
end

pg.SdkMgr.ChooseServer = function (slot0, slot1, slot2)
	slot0:Call("ChooseServer", slot1, slot2)
end

pg.SdkMgr.SdkGateWayLogined = function (slot0)
	slot0:Call("SdkGateWayLogined")
end

pg.SdkMgr.SdkLoginGetaWayFailed = function (slot0)
	slot0:Call("SdkLoginGetaWayFailed")
end

pg.SdkMgr.SdkLevelUp = function (slot0)
	slot0:Call("SdkLevelUp")
end

pg.SdkMgr.SdkPay = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	slot0:Call("SdkPay", slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

pg.SdkMgr.LogoutSDK = function (slot0)
	slot0:Call("LogoutSDK")
end

pg.SdkMgr.BindCPU = function (slot0)
	slot0:Call("BindCPU")
end

pg.SdkMgr.OnAndoridBackPress = function (slot0)
	slot0:Call("OnAndoridBackPress")
end

pg.SdkMgr.GetChannelUID = function (slot0)
	return slot0:Get("GetChannelUID")
end

pg.SdkMgr.GetLoginType = function (slot0)
	return slot0:Get("GetLoginType")
end

pg.SdkMgr.GetIsPlatform = function (slot0)
	return slot0:Get("GetIsPlatform")
end

pg.SdkMgr.GetYostarUid = function (slot0)
	return slot0:Get("GetYostarUid")
end

pg.SdkMgr.CheckAudit = function (slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("CheckAudit")
	else
		return false
	end
end

pg.SdkMgr.CheckPreAudit = function (slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("CheckPreAudit")
	else
		return false
	end
end

pg.SdkMgr.CheckPretest = function (slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("CheckPretest")
	else
		return false
	end
end

pg.SdkMgr.AiriLoginSDK = function (slot0)
	slot0:Call("AiriLogin")
end

pg.SdkMgr.TranscodeRequest = function (slot0)
	slot0:Call("TranscodeRequest")
end

pg.SdkMgr.LoginWithTranscode = function (slot0, slot1, slot2)
	slot0:Call("LoginWithTranscode", slot1, slot2)
end

pg.SdkMgr.LoginWithSocial = function (slot0, slot1, slot2, slot3)
	slot0:Call("LoginWithSocial", slot1, slot2, slot3)
end

pg.SdkMgr.LoginWithDevice = function (slot0)
	slot0:Call("LoginWithDevice")
end

pg.SdkMgr.AiriBuy = function (slot0, slot1, slot2, slot3)
	slot0:Call("AiriBuy", slot1, slot2, slot3)
end

pg.SdkMgr.LinkSocial = function (slot0, slot1, slot2, slot3)
	slot0:Call("LinkSocial", slot1, slot2, slot3)
end

pg.SdkMgr.UnlinkSocial = function (slot0, slot1)
	slot0:Call("UnlinkSocial", slot1)
end

pg.SdkMgr.IsSocialLink = function (slot0, slot1)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("IsSocialLink", slot1)
	else
		return false
	end
end

pg.SdkMgr.GetSocialName = function (slot0, slot1)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("GetSocialName", slot1)
	else
		return "none"
	end
end

pg.SdkMgr.GetIsBirthSet = function (slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("GetIsBirthSet")
	end

	return true
end

pg.SdkMgr.SetBirth = function (slot0, slot1)
	slot0:Call("SetBirth", slot1)
end

pg.SdkMgr.ClearAccountCache = function (slot0)
	slot0:Call("ClearAccountCache")
end

pg.SdkMgr.GameShare = function (slot0, slot1, slot2)
	slot0:Call("GameShare", slot1, slot2)
end

pg.SdkMgr.VerificationCodeReq = function (slot0, slot1)
	slot0:Call("VerificationCodeReq", slot1)
end

pg.SdkMgr.OpenYostarHelp = function (slot0)
	slot0:Call("OpenYostarHelp")
end

pg.SdkMgr.OnAppPauseForSDK = function (slot0, slot1)
	slot0:Call("OnAppPauseForSDK", slot1)
end

pg.SdkMgr.UserEventUpload = function (slot0, slot1)
	slot0:Call("UserEventUpload", slot1)
end

pg.SdkMgr.CheckAiriCanBuy = function (slot0)
	if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
		return slot0:Get("CheckAiriCanBuy")
	else
		return true
	end
end

pg.SdkMgr.CheckHadAccountCache = function (slot0)
	if PLATFORM_CODE == PLATFORM_JP then
		return slot0:Get("CheckHadAccountCache")
	else
		return true
	end
end

AIRI_LAST_GEN_TIME = 0
AIRI_GEN_LIMIT_TIME = 30

function GetAiriGenCodeTimeRemain()
	if AIRI_GEN_LIMIT_TIME < Time.realtimeSinceStartup - AIRI_LAST_GEN_TIME or AIRI_LAST_GEN_TIME == 0 then
		return 0
	else
		return math.floor(AIRI_GEN_LIMIT_TIME - slot0)
	end
end

pg.SdkMgr.UserCenter = function (slot0)
	slot0:Call("UserCenter")
end

pg.SdkMgr.BugReport = function (slot0)
	slot0:Call("BugReport")
end

pg.SdkMgr.StoreReview = function (slot0)
	slot0:Call("StoreReview")
end

pg.SdkMgr.QueryWithProduct = function (slot0)
	slot0:Call("QueryWithProduct")
end

pg.SdkMgr.ShareImg = function (slot0, slot1, slot2)
	slot0:Call("ShareImg", slot1, slot2)
end

pg.SdkMgr.SwitchAccount = function (slot0)
	slot0:Call("SwitchAccount")
end

pg.SdkMgr.CompletedTutorial = function (slot0)
	slot0:Call("CompletedTutorial")
end

pg.SdkMgr.UnlockAchievement = function (slot0)
	slot0:Call("UnlockAchievement")
end

pg.SdkMgr.GetDeviceId = function (slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("GetDeviceId")
	elseif PLATFORM_CODE == PLATFORM_KR then
		return slot0:Get("GetDeviceModel")
	else
		return ""
	end
end

function InLoginScene()
	if getProxy(ContextProxy):getCurrentContext() and slot0.mediator == LoginMediator then
		return true
	end

	return false
end

return
