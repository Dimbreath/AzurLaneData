slot0 = class("LoginScene", import("..base.BaseUI"))
slot1 = 1

function slot0.getUIName(slot0)
	return "LoginUI2"
end

function slot0.preload(slot0, slot1)
	slot0.iconSpries = {}

	ResourceMgr.Inst:loadAssetBundleAsync("ui/LoginUI2_atlas", function (slot0)
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_green", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_gray", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_red", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_org", typeof(Sprite), true, false))

		if table.insert then
			slot1()
		end
	end)
end

function slot0.init(slot0)
	slot0.version = slot0:findTF("version")
	slot0.version:GetComponent("Text").text = "ver " .. UpdateMgr.Inst.currentVersion:ToString()
	slot0.bgLay = slot0:findTF("bg_lay")
	slot0.accountBtn = slot0:findTF("bg_lay/buttons/account_button")
	slot0.repairBtn = slot0:findTF("repair_button")
	slot0.chInfo = slot0:findTF("background/info")

	setActive(slot0.chInfo, PLATFORM_CODE == PLATFORM_CH)

	slot0.pressToLogin = GetOrAddComponent(slot0:findTF("background/press_to_login"), "CanvasGroup")

	LeanTween.alphaCanvas(slot0.pressToLogin, 0.25, slot0):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

	slot0.currentServer = slot0:findTF("current_server")
	slot0.serviceBtn = slot0:findTF("bg_lay/buttons/service_button")
	slot0.filingBtn = slot0:findTF("filingBtn")

	setActive(slot0.filingBtn, PLATFORM_CODE == PLATFORM_CH)

	slot0.serversPanel = slot0:findTF("servers")
	slot0.servers = slot0:findTF("panel/servers/content/server_list", slot0.serversPanel)
	slot0.serverTpl = slot0:getTpl("server_tpl")
	slot0.recentTF = slot0:findTF("panel/servers/content/advice_panel/recent", slot0.serversPanel)
	slot0.adviceTF = slot0:findTF("panel/servers/content/advice_panel/advice", slot0.serversPanel)
	slot0.userAgreenTF = slot0:findTF("UserAgreement")
	slot0.userAgreenMainTF = slot0:findTF("UserAgreement/window")
	slot0.closeUserAgreenTF = slot0.userAgreenTF:Find("window/close_btn")
	slot0.userAgreenConfirmTF = slot0:findTF("UserAgreement/window/accept_btn")
	slot0.userDisagreeConfirmTF = slot0:findTF("UserAgreement/window/disagree_btn")

	setActive(slot0.userAgreenTF, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)

	slot0.opBtn = slot0:findTF("bg_lay/buttons/opBtn")

	if slot0.opBtn then
		setActive(slot0.opBtn, PLAY_OPENING)
	end

	slot0.airiUidTxt = slot0:findTF("airi_uid")
	slot0.shareData = {}
	slot0.subViewList = {}
	slot0.loginPanelView = LoginPanelView.New(slot0._tf, slot0.event, slot0.contextData)

	slot0.loginPanelView:SetShareData(slot0.shareData)

	slot0.registerPanelView = RegisterPanelView.New(slot0._tf, slot0.event, slot0.contextData)

	slot0.loginPanelView:SetShareData(slot0.shareData)

	slot0.tencentLoginPanelView = TencentLoginPanelView.New(slot0._tf, slot0.event, slot0.contextData)

	slot0.loginPanelView:SetShareData(slot0.shareData)

	slot0.airiLoginPanelView = AiriLoginPanelView.New(slot0._tf, slot0.event, slot0.contextData)

	slot0.loginPanelView:SetShareData(slot0.shareData)

	slot0.transcodeAlertView = TranscodeAlertView.New(slot0._tf, slot0.event, slot0.contextData)

	slot0.loginPanelView:SetShareData(slot0.shareData)

	slot0.yostarAlertView = YostarAlertView.New(slot0._tf, slot0.event, slot0.contextData)

	slot0.loginPanelView:SetShareData(slot0.shareData)

	slot0.subViewList[LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW] = slot0.loginPanelView
	slot0.subViewList[LoginSceneConst.DEFINE.REGISTER_PANEL_VIEW] = slot0.registerPanelView
	slot0.subViewList[LoginSceneConst.DEFINE.TENCENT_LOGIN_VIEW] = slot0.tencentLoginPanelView
	slot0.subViewList[LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW] = slot0.airiLoginPanelView
	slot0.subViewList[LoginSceneConst.DEFINE.TRANSCODE_ALERT_VIEW] = slot0.transcodeAlertView
	slot0.subViewList[LoginSceneConst.DEFINE.YOSTAR_ALERT_VIEW] = slot0.yostarAlertView
	slot0.subViewList[LoginSceneConst.DEFINE.PRESS_TO_LOGIN] = slot0.pressToLogin
	slot0.subViewList[LoginSceneConst.DEFINE.BG_LAY] = slot0.bgLay
	slot0.subViewList[LoginSceneConst.DEFINE.SERVER_PANEL] = slot0.serversPanel
	slot0.subViewList[LoginSceneConst.DEFINE.ACCOUNT_BTN] = slot0.accountBtn
	slot0.subViewList[LoginSceneConst.DEFINE.CURRENT_SERVER] = slot0.currentServer
	slot0.bgImg = slot0:findTF("background/bg"):GetComponent(typeof(Image))

	slot0:setBg()

	if CRI_BG_FLAG then
		slot0:setCriBg()
	end

	setText(findTF(slot0.currentServer, "server_name"), "")
	slot0:switchToServer()
	slot0:initEvents()
end

function slot0.initEvents(slot0)
	slot0:bind(LoginSceneConst.SWITCH_SUB_VIEW, function (slot0, slot1)
		slot0:switchSubView(slot1)
	end)
	slot0:bind(LoginSceneConst.CLEAR_REGISTER_VIEW, function (slot0)
		slot0.registerPanelView:ActionInvoke("Clear")
	end)
end

function slot0.switchSubView(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.subViewList) do
		if isa(slot6, BaseSubView) then
			if table.contains(slot1, slot5) then
				slot6:AddLoadedCallback(function ()
					slot0.repairBtn:SetAsLastSibling()
				end)
				slot6:Load()
				slot6:ActionInvoke("Show")
			elseif slot6:GetLoaded() and slot6:isShowing() then
				slot6:Hide()
			end
		else
			setActive(slot6, table.contains(slot1, slot5))
		end
	end

	if not table.contains(slot1, LoginSceneConst.DEFINE.SERVER_PANEL) then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	end

	if table.contains(slot1, LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW) then
		setActive(slot0.airiUidTxt, false)
	end

	slot0.userAgreenTF:SetAsLastSibling()
	slot0.repairBtn:SetAsLastSibling()
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.serversPanel) then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
		setActive(slot0.serversPanel, false)

		return
	end

	if isActive(slot0.userAgreenTF) then
		setActive(slot0.userAgreenTF, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
end

function slot0.setUserData(slot0, slot1)
	setActive(slot0.airiUidTxt, true)
	setText(slot0.airiUidTxt, "uid: " .. slot1.arg2)
end

function slot0.showUserAgreement(slot0, slot1)
	slot2 = nil

	if PLATFORM_CODE == PLATFORM_CH then
		slot0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(0.7843137254901961, 0.7843137254901961, 0.7843137254901961, 0.5019607843137255)
	else
		slot2 = true
	end

	setActive(slot0.userAgreenTF, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.userAgreenTF, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	setText(slot0.userAgreenTF:Find("window/container/scrollrect/content/Text"), require("ShareCfg.UserAgreement").content)
	onButton(slot0, slot0.userAgreenConfirmTF, function ()
		if slot0 then
			setActive(slot1.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot1.userAgreenTF, slot1._tf)

			if slot1.userAgreenTF then
				slot2()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("read_the_user_agreement"))
		end
	end)
	onScroll(slot0, slot0.userAgreenTF:Find("window/container/scrollrect"), function (slot0)
		if slot0.y <= 0.01 and not slot0 then
			slot0 = true

			if PLATFORM_CODE == PLATFORM_CH then
				slot1.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
			end
		end
	end)
end

function slot0.setBg(slot0)
	slot1 = "login"
	slot2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y%m%d")

	for slot6, slot7 in ipairs(SPECIAL_DATE) do
		if slot7[1] == slot2 then
			slot1 = slot7[2]
		end
	end

	setImageSprite(slot0.bgImg, LoadSprite("loadingbg/" .. slot1))
end

function slot0.setCriBg(slot0)
	LoadAndInstantiateAsync("effect", "loginbg", function (slot0)
		if slot0 then
			slot0.transform.SetParent(slot1, slot0.bgImg.transform, false)
			slot0.transform:SetAsFirstSibling()
		end
	end)
end

function slot0.setLastLogin(slot0, slot1)
	slot0.shareData.lastLoginUser = slot1
end

function slot0.setAutoLogin(slot0)
	slot0.shareData.autoLoginEnabled = true
end

function slot0.setLastLoginServer(slot0, slot1)
	if not slot1 then
		return
	end

	setText(findTF(slot0.currentServer, "server_name"), slot1.name)

	slot0.shareData.lastLoginServer = slot1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.closeUserAgreenTF, function ()
		if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
			setActive(slot0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)
		else
			setActive(slot0.userAgreenMainTF, false)
			onNextTick(function ()
				setActive(slot0.userAgreenMainTF, true)
			end)
		end
	end, SFX_CANCEL)

	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		onButton(slot0, slot0.userDisagreeConfirmTF, function ()
			setActive(slot0.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)
		end)
	end

	setActive(slot0.serviceBtn, PLATFORM_CODE == PLATFORM_KR)
	onButton(slot0, slot0.serviceBtn, function ()
		if PLATFORM_CODE == PLATFORM_KR then
			pg.SdkMgr.GetInstance():UserCenter()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
		end
	end, SFX_MAIN)
	onButton(slot0, slot0.accountBtn, function ()
		if not (pg.SdkMgr.GetInstance():GetLoginType() ~= LoginType.PLATFORM_INNER) then
			slot0:switchToLogin()
		elseif slot1 and PLATFORM_KR == PLATFORM_CODE then
			pg.SdkMgr.GetInstance():SwitchAccount()
		end
	end, SFX_MAIN)

	if CSharpVersion >= 35 then
		onButton(slot0, slot0.repairBtn, function ()
			showRepairMsgbox()
		end)
	else
		setActive(slot0.repairBtn, PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") and PLATFORM_CODE ~= PLATFORM_JP)

		if isActive(slot0.repairBtn) then
			onButton(slot0, slot0.repairBtn, function ()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("resource_verify_warn"),
					onYes = function ()
						resourceVerify()
					end
				})
			end)
		end
	end

	function slot1()
		if pg.SdkMgr.GetInstance():GetLoginType() == LoginType.PLATFORM then
			pg.SdkMgr.GetInstance():LoginSdk()
		elseif slot0 == LoginType.PLATFORM_TENCENT then
			slot0:switchToTencentLogin()
		elseif slot0 == LoginType.PLATFORM_INNER then
			slot0:switchToLogin()
		end
	end

	onButton(slot0, slot0.filingBtn, function ()
		Application.OpenURL("http://sq.ccm.gov.cn:80/ccnt/sczr/service/business/emark/gameNetTag/4028c08b58bd467b0158bd8bd80d062a")
	end, SFX_PANEL)
	onButton(slot0, slot0.currentServer, function ()
		if slot0(slot0.serverList or {}) == 0 then
			slot1()
		else
			pg.UIMgr.GetInstance():BlurPanel(slot0.serversPanel)
			setActive(slot0.serversPanel, true)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.serversPanel, function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
		setActive(slot0.serversPanel, false)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("background"), function ()
		if slot0.onPlayingOP then
			return
		end

		if not slot0.initFinished then
			return
		end

		if not getProxy(SettingsProxy):getUserAgreement() and PLATFORM_KR ~= PLATFORM_CODE then
			slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)

			return
		end

		if go(slot0.pressToLogin).activeSelf then
			if table.getCount(slot0.serverList or {}) == 0 then
				slot1()

				return
			end

			if not slot0.shareData.lastLoginServer then
				pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_choiseServer"))

				return
			end

			if slot0.shareData.lastLoginServer.status == Server.STATUS.VINDICATE or slot0.shareData.lastLoginServer.status == Server.STATUS.FULL then
				slot1 = 0
				slot2 = 1

				GetServerState(function (slot0)
					if slot0 == slot0 then
						pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_disabled"))
					elseif slot0 == slot1 then
						slot2.event:emit(LoginMediator.ON_SERVER, slot2.shareData.lastLoginServer)
						playSoundEffect(SFX_CONFIRM)
					end
				end)

				return
			end

			slot0.event:emit(LoginMediator.ON_SERVER, slot0.shareData.lastLoginServer)
			playSoundEffect(SFX_CONFIRM)
		end
	end)
	slot0:checkVersion()

	if PLAY_OPENING then
		onButton(slot0, slot0.opBtn, function ()
			if slot0.initFinished and not slot0.onPlayingOP then
				slot0:playOpening(true)
			end
		end)

		if PLATFORM_CODE ~= PLATFORM_JP and PlayerPrefs.GetString("op_ver", "") ~= OP_VERSION then
			slot0:playOpening(true, function ()
				PlayerPrefs.SetString("op_ver", OP_VERSION)
				PlayerPrefs.SetString:playExtraVoice()

				PlayerPrefs.SetString.playExtraVoice.initFinished = true
			end)

			return
		end
	end

	slot0:playExtraVoice()

	slot0.initFinished = true
end

function slot0.checkVersion(slot0)
	if PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "version.txt") and PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "hashes.csv") and System.Version.New(PathMgr.ReadAllText(PathMgr.getStreamingAsset("version.txt"))).CompareTo(slot1, UpdateMgr.Inst.serverVersion) < 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = "当前游戏不是最新版本，请重启游戏进行更新",
			onYes = function ()
				Application.Quit()
			end
		})
	end
end

function slot0.playExtraVoice(slot0)
	if pg.gameset.login_extra_voice.description and #slot1 > 0 then
		pg.CriMgr.GetInstance():LoadCueSheet("cv-" .. slot3, function ()
			if slot0.exited then
				slot1:UnloadCueSheet(slot2)

				return
			end

			slot0.loginCueSheet = slot2

			slot2:PlayCV(slot2, "extra")
		end)
	end
end

function slot0.unloadExtraVoice(slot0)
	if slot0.loginCueSheet then
		pg.CriMgr.GetInstance():UnloadCueSheet(slot0.loginCueSheet)

		slot0.loginCueSheet = nil
	end
end

function slot0.autoLogin(slot0)
	if slot0.shareData.lastLoginUser then
		if slot0.shareData.autoLoginEnabled then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.shareData.lastLoginUser)
		end

		if slot0.loginPanelView:GetLoaded() then
			if slot0.shareData.lastLoginUser.type == 1 then
				slot0.loginPanelView:SetContent(slot0.shareData.lastLoginUser.arg2, slot0.shareData.lastLoginUser.arg3)
			elseif slot0.shareData.lastLoginUser.type == 2 then
				slot0.loginPanelView:SetContent(slot0.shareData.lastLoginUser.arg1, slot0.shareData.lastLoginUser.arg2)
			end
		end
	end
end

slot2 = {
	{
		0.403921568627451,
		1,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		0.6078431372549019,
		0.6078431372549019,
		0.6078431372549019,
		0.6274509803921569
	},
	{
		1,
		0.3607843137254902,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		1,
		0.6588235294117647,
		0.2196078431372549,
		0.6274509803921569
	}
}

function slot0.updateServerTF(slot0, slot1, slot2)
	setText(findTF(slot1, "name"), "-  " .. slot2.name .. "  -")
	setImageSprite(findTF(slot1, "statu"), slot0.iconSpries[slot2.status + 1], true)

	findTF(slot1, "statu_1"):GetComponent("Image").color = Color.New(slot0[slot2.status + 1][1], slot0[slot2.status + 1][2], slot0[slot2.status + 1][3], slot0[slot2.status + 1][4])

	setActive(findTF(slot1, "mark"), slot2.isLogined)
	setActive(slot0:findTF("tag_new", slot1), slot2.isNew)
	setActive(slot0:findTF("tag_hot", slot1), slot2.isHot)
	onButton(slot0, slot1, function ()
		if slot0.status == Server.STATUS.VINDICATE then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_vindicate"))

			return
		end

		if slot0.status == Server.STATUS.FULL then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_loginScene_server_full"))

			return
		end

		slot1:setLastLoginServer(slot1.setLastLoginServer)
		pg.UIMgr.GetInstance():UnblurPanel(slot1.serversPanel, slot1._tf)
		setActive(pg.UIMgr.GetInstance().serversPanel, false)
	end, SFX_CONFIRM)
end

function slot0.updateAdviceServer(slot0)
	if not slot0.recentTF or not slot0.adviceTF then
		return
	end

	setActive(slot0.recentTF, slot0.shareData.lastLoginServer)

	if slot0.shareData.lastLoginServer then
		slot0:updateServerTF(findTF(slot0.recentTF, "server"), slot0.shareData.lastLoginServer)
	end

	setActive(slot0.adviceTF, getProxy(ServerProxy).firstServer)

	if getProxy(ServerProxy).firstServer then
		slot0:updateServerTF(findTF(slot0.adviceTF, "server"), slot1)
	end
end

function slot0.updateServerList(slot0, slot1)
	slot0.serverList = slot1

	removeAllChildren(slot0.servers)

	for slot6, slot7 in pairs(slot2) do
		slot0:updateServerTF(cloneTplTo(slot0.serverTpl, slot0.servers), slot7)
	end
end

function slot0.switchToTencentLogin(slot0)
	slot0:switchSubView({
		LoginSceneConst.DEFINE.TENCENT_LOGIN_VIEW
	})
end

function slot0.switchToAiriLogin(slot0)
	slot0:switchSubView({
		LoginSceneConst.DEFINE.AIRI_LOGIN_PANEL_VIEW,
		LoginSceneConst.DEFINE.PRESS_TO_LOGIN
	})
end

function slot0.switchToLogin(slot0)
	slot0:switchSubView({
		LoginSceneConst.DEFINE.LOGIN_PANEL_VIEW
	})
end

function slot0.switchToRegister(slot0)
	slot0:switchSubView({
		LoginSceneConst.DEFINE.REGISTER_PANEL_VIEW
	})
end

function slot0.switchToServer(slot0)
	slot0:updateAdviceServer()

	if pg.SdkMgr.GetInstance():GetLoginType() ~= LoginType.PLATFORM_INNER and PLATFORM_CODE ~= PLATFORM_KR then
		slot0:switchSubView({
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN,
			LoginSceneConst.DEFINE.CURRENT_SERVER,
			LoginSceneConst.DEFINE.BG_LAY
		})
	else
		slot0:switchSubView({
			LoginSceneConst.DEFINE.ACCOUNT_BTN,
			LoginSceneConst.DEFINE.PRESS_TO_LOGIN,
			LoginSceneConst.DEFINE.CURRENT_SERVER,
			LoginSceneConst.DEFINE.BG_LAY
		})
	end
end

function slot0.SwitchToWaitPanel(slot0, slot1)
	slot3 = slot0:findTF("window/content", slot2)
	slot0.waitTimer = nil
	slot4 = 0
	slot5 = slot1
	slot0.waitTimer = Timer.New(function ()
		setText(setText, i18n("login_wait_tip", setText))

		slot2 = slot2 - 1

		if math.random(0, 1) == 1 then
			slot1 = slot2
		end

		if slot2 <= 0 then
			triggerButton(slot3:findTF("background"))
			slot3.waitTimer:Stop()

			"background".waitTimer = nil
		end
	end, 1, -1)

	slot0.waitTimer:Start()
	slot0.waitTimer.func()
	setActive(slot0:findTF("Msgbox"), true)
end

function slot0.willExit(slot0)
	if slot0.waitTimer then
		slot0.waitTimer:Stop()

		slot0.waitTimer = nil
	end

	if slot0.openingTF then
		SetParent(slot0.openingTF, slot0._tf)
	end

	slot0.loginPanelView:Destroy()
	slot0.registerPanelView:Destroy()
	slot0.tencentLoginPanelView:Destroy()
	slot0.airiLoginPanelView:Destroy()
	slot0.transcodeAlertView:Destroy()
	slot0.yostarAlertView:Destroy()
end

function slot0.playOpening(slot0, slot1, slot2, slot3)
	slot0.onPlayingOP = true

	function slot4()
		if not slot0.openingTF then
			return
		end

		setActive(slot0.openingTF, false)

		setActive.openingAni.enabled = false

		if setActive.openingAni.criAni then
			slot0.criAni:Stop()
		end

		if slot0.openingTF then
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.openingTF.transform, slot0._tf)
			Destroy(slot0.openingTF)

			Destroy.openingTF = nil
		end

		if slot1 then
			slot1()
		end

		slot0.cg.alpha = 1

		pg.CriMgr.GetInstance():resumeNormalBGM()

		pg.CriMgr.GetInstance().resumeNormalBGM.onPlayingOP = false
	end

	function slot5()
		if not slot0.cg then
			slot0.cg = GetOrAddComponent(slot0._tf, "CanvasGroup")
		end

		slot0.cg.alpha = 0
		slot0.cg.openingAni.enabled = true

		onButton(onButton, slot0.openingTF, function ()
			if slot0 then
				slot1()
			end
		end)

		slot0 = onButton.openingTF:GetComponent("DftAniEvent")

		slot0:SetStartEvent(function (slot0)
			if slot0.criAni then
				slot0.criAni.player:SetVolume(PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME))
				slot0.criAni:Play()
			end
		end)
		slot0:SetEndEvent(function (slot0)
			slot0()
		end)
		setActive(slot0.openingTF, true)
		pg.CriMgr.GetInstance():stopBGM()
	end

	if IsNil(slot0.openingTF) then
		LoadAndInstantiateAsync("ui", "opening", function (slot0)
			slot0:SetActive(false)

			slot0.openingTF = slot0

			pg.UIMgr.GetInstance():OverlayPanel(slot0.openingTF.transform)

			slot0.criAni = tf(slot0.openingTF):Find("usm"):GetComponent("CriManaEffectUI")

			setActive(slot0.openingTF, false)

			slot0.openingAni = slot0.openingTF:GetComponent("Animator")

			slot0()
		end)
	else
		slot5()
	end
end

return slot0
