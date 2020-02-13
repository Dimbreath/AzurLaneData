pg = pg or {}
pg.SdkMgr = singletonClass("SdkMgr")

function pg.SdkMgr.Ctor(slot0)
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

function pg.SdkMgr.Call(slot0, slot1, ...)
	if slot0.instance[slot1] then
		slot0.instance[slot1](unpack({
			...
		}))
	end
end

function pg.SdkMgr.Get(slot0, slot1, ...)
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

function pg.SdkMgr.InitSDK(slot0)
	slot0:Call("InitSDK")
end

function pg.SdkMgr.GoSDkLoginScene(slot0)
	slot0:Call("GoSDkLoginScene")
end

function pg.SdkMgr.LoginSdk(slot0, slot1)
	slot0:Call("LoginSdk", slot1)
end

function pg.SdkMgr.TryLoginSdk(slot0)
	slot0:Call("TryLoginSdk")
end

function pg.SdkMgr.CreateRole(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:Call("CreateRole", slot1, slot2, slot3, slot4, slot5)
end

function pg.SdkMgr.EnterServer(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0:Call("EnterServer", slot1, slot2, slot3, slot4, slot5, slot6, slot7)
end

function pg.SdkMgr.ChooseServer(slot0, slot1, slot2)
	slot0:Call("ChooseServer", slot1, slot2)
end

function pg.SdkMgr.SdkGateWayLogined(slot0)
	slot0:Call("SdkGateWayLogined")
end

function pg.SdkMgr.SdkLoginGetaWayFailed(slot0)
	slot0:Call("SdkLoginGetaWayFailed")
end

function pg.SdkMgr.SdkLevelUp(slot0)
	slot0:Call("SdkLevelUp")
end

function pg.SdkMgr.SdkPay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
	slot0:Call("SdkPay", slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10)
end

function pg.SdkMgr.LogoutSDK(slot0)
	slot0:Call("LogoutSDK")
end

function pg.SdkMgr.BindCPU(slot0)
	slot0:Call("BindCPU")
end

function pg.SdkMgr.OnAndoridBackPress(slot0)
	slot0:Call("OnAndoridBackPress")
end

function pg.SdkMgr.GetChannelUID(slot0)
	return slot0:Get("GetChannelUID")
end

function pg.SdkMgr.GetLoginType(slot0)
	return slot0:Get("GetLoginType")
end

function pg.SdkMgr.GetIsPlatform(slot0)
	return slot0:Get("GetIsPlatform")
end

function pg.SdkMgr.GetYostarUid(slot0)
	return slot0:Get("GetYostarUid")
end

function pg.SdkMgr.GetYostarTransCode(slot0)
	return slot0:Get("GetTransCode")
end

function pg.SdkMgr.CheckAudit(slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("CheckAudit")
	else
		return false
	end
end

function pg.SdkMgr.CheckPreAudit(slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("CheckPreAudit")
	else
		return false
	end
end

function pg.SdkMgr.CheckPretest(slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("CheckPretest")
	else
		return false
	end
end

function pg.SdkMgr.AiriLoginSDK(slot0)
	slot0:Call("AiriLogin")
end

function pg.SdkMgr.TranscodeRequest(slot0)
	slot0:Call("TranscodeRequest")
end

function pg.SdkMgr.LoginWithTranscode(slot0, slot1, slot2)
	slot0:Call("LoginWithTranscode", slot1, slot2)
end

function pg.SdkMgr.LoginWithSocial(slot0, slot1, slot2, slot3)
	slot0:Call("LoginWithSocial", slot1, slot2, slot3)
end

function pg.SdkMgr.LoginWithDevice(slot0)
	slot0:Call("LoginWithDevice")
end

function pg.SdkMgr.AiriBuy(slot0, slot1, slot2, slot3)
	slot0:Call("AiriBuy", slot1, slot2, slot3)
end

function pg.SdkMgr.LinkSocial(slot0, slot1, slot2, slot3)
	slot0:Call("LinkSocial", slot1, slot2, slot3)
end

function pg.SdkMgr.UnlinkSocial(slot0, slot1)
	slot0:Call("UnlinkSocial", slot1)
end

function pg.SdkMgr.IsSocialLink(slot0, slot1)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("IsSocialLink", slot1)
	else
		return false
	end
end

function pg.SdkMgr.GetSocialName(slot0, slot1)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("GetSocialName", slot1)
	else
		return "none"
	end
end

function pg.SdkMgr.GetIsBirthSet(slot0)
	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		return slot0:Get("GetIsBirthSet")
	end

	return true
end

function pg.SdkMgr.SetBirth(slot0, slot1)
	slot0:Call("SetBirth", slot1)
end

function pg.SdkMgr.ClearAccountCache(slot0)
	slot0:Call("ClearAccountCache")
end

function pg.SdkMgr.GameShare(slot0, slot1, slot2)
	slot0:Call("GameShare", slot1, slot2)
end

function pg.SdkMgr.VerificationCodeReq(slot0, slot1)
	slot0:Call("VerificationCodeReq", slot1)
end

function pg.SdkMgr.OpenYostarHelp(slot0)
	slot0:Call("OpenYostarHelp")
end

function pg.SdkMgr.OnAppPauseForSDK(slot0, slot1)
	slot0:Call("OnAppPauseForSDK", slot1)
end

function pg.SdkMgr.UserEventUpload(slot0, slot1)
	slot0:Call("UserEventUpload", slot1)
end

function pg.SdkMgr.CheckAiriCanBuy(slot0)
	if PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
		return slot0:Get("CheckAiriCanBuy")
	else
		return true
	end
end

function pg.SdkMgr.CheckHadAccountCache(slot0)
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

function pg.SdkMgr.UserCenter(slot0)
	slot0:Call("UserCenter")
end

function pg.SdkMgr.BugReport(slot0)
	slot0:Call("BugReport")
end

function pg.SdkMgr.StoreReview(slot0)
	slot0:Call("StoreReview")
end

function pg.SdkMgr.QueryWithProduct(slot0)
	slot0:Call("QueryWithProduct")
end

function pg.SdkMgr.ShareImg(slot0, slot1, slot2)
	slot0:Call("ShareImg", slot1, slot2)
end

function pg.SdkMgr.SwitchAccount(slot0)
	slot0:Call("SwitchAccount")
end

function pg.SdkMgr.CompletedTutorial(slot0)
	slot0:Call("CompletedTutorial")
end

function pg.SdkMgr.UnlockAchievement(slot0)
	slot0:Call("UnlockAchievement")
end

function pg.SdkMgr.GetDeviceId(slot0)
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
