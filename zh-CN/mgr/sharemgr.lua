pg = pg or {}
slot0 = pg
slot0.ShareMgr = singletonClass("ShareMgr")
slot1 = slot0.ShareMgr
slot1.TypeAdmira = 1
slot1.TypeShipProfile = 2
slot1.TypeNewShip = 3
slot1.TypeBackyard = 4
slot1.TypeNewSkin = 5
slot1.TypeSummary = 6
slot1.TypePhoto = 7
slot1.TypeReflux = 8
slot1.TypeCommander = 9
slot1.TypeColoring = 10
slot1.TypeChallenge = 11
slot1.TypeInstagram = 12
slot1.TypePizzahut = 13
slot1.TypeSecondSummary = 14
slot1.PANEL_TYPE_BLACK = 1
slot1.PANEL_TYPE_PINK = 2
slot1.ANCHORS_TYPE = {
	{
		0,
		0,
		0,
		0
	},
	{
		1,
		0,
		1,
		0
	},
	{
		0,
		1,
		0,
		1
	},
	{
		1,
		1,
		1,
		1
	}
}

function slot1.Init(slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		uv0.go = slot0

		uv0.go:SetActive(false)

		uv0.tr = slot0.transform
		uv0.panelBlack = uv0.tr:Find("panel")
		uv0.panelPink = uv0.tr:Find("panel_pink")
		uv0.deckTF = uv0.tr:Find("deck")

		setActive(uv0.panelBlack, false)
		setActive(uv0.panelPink, false)
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

function slot1.Share(slot0, slot1, slot2)
	if PLATFORM_CODE ~= PLATFORM_JP and PLATFORM_CODE ~= PLATFORM_US and PLATFORM_CODE ~= PLATFORM_KR and not WBManager.IsSupportShare() then
		uv0.TipsMgr.GetInstance():ShowTips("指挥官，当前平台暂不支持分享功能哦")

		return
	end

	if IsNil(slot0.go) then
		slot0:Init()
	end

	if (slot2 or uv1.PANEL_TYPE_BLACK) == uv1.PANEL_TYPE_BLACK then
		slot0.panel = slot0.panelBlack
	elseif slot2 == uv1.PANEL_TYPE_PINK then
		slot0.panel = slot0.panelPink
	end

	setActive(slot0.panelBlack, slot2 == uv1.PANEL_TYPE_BLACK)
	setActive(slot0.panelPink, slot2 == uv1.PANEL_TYPE_PINK)

	slot3 = uv0.share_template[slot1]
	slot4 = getProxy(PlayerProxy):getRawData()
	slot6 = getProxy(ServerProxy):getRawData()[getProxy(UserProxy):getRawData() and slot5.server or 0]
	slot9 = slot0.deckTF
	slot10 = slot0.ANCHORS_TYPE[slot3.deck] or {
		0.5,
		0.5,
		0.5,
		0.5
	}
	slot9.anchorMin = Vector2(slot10[1], slot10[2])
	slot9.anchorMax = Vector2(slot10[3], slot10[4])

	setText(slot9:Find("name/value"), slot4 and slot4.name or "")
	setText(slot9:Find("server/value"), slot6 and slot6.name or "")
	setText(slot9:Find("lv/value"), slot4.level)

	slot9.anchoredPosition3D = Vector3(slot3.qrcode_location[1], slot3.qrcode_location[2], -100)
	slot9.anchoredPosition = Vector2(slot3.qrcode_location[1], slot3.qrcode_location[2])

	_.each(slot3.hidden_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then
			table.insert(uv0.cacheComps, slot1)
			slot1:SetActive(false)
		end
	end)
	_.each(slot3.show_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then
			table.insert(uv0.cacheShowComps, slot1)
			slot1:SetActive(true)
		end
	end)
	_.each(slot3.move_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0.path)) then
			table.insert(uv0.cacheMoveComps, {
				slot1,
				slot1.transform.anchoredPosition.x,
				slot1.transform.anchoredPosition.y
			})
			setAnchoredPosition(slot1, {
				x = slot0.x,
				y = slot0.y
			})
		end
	end)
	SetParent(slot9, GameObject.Find(slot3.camera):GetComponent(typeof(Camera)).transform:GetChild(0), false)
	slot9:SetAsLastSibling()

	slot13 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32)

	if (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US) and uv0.SdkMgr.GetInstance():GetIsPlatform() then
		uv0.SdkMgr.GetInstance():GameShare(slot3.description, slot13:EncodeToJPG(slot13:TakePhoto(slot11)))
		uv0.UIMgr.GetInstance():LoadingOn()
		onDelayTick(function ()
			uv0.UIMgr.GetInstance():LoadingOff()
		end, 2)
	elseif slot13:Take(slot11, slot0.screenshot) then
		print("截图位置: " .. slot0.screenshot)
		slot0:Show(slot3)
	else
		uv0.TipsMgr.GetInstance():ShowTips("截图失败")
	end

	SetParent(slot9, slot0.tr, false)
	_.each(slot0.cacheComps, function (slot0)
		slot0:SetActive(true)
	end)

	slot0.cacheComps = {}

	_.each(slot0.cacheShowComps, function (slot0)
		slot0:SetActive(false)
	end)

	slot0.cacheShowComps = {}

	_.each(slot0.cacheMoveComps, function (slot0)
		setAnchoredPosition(slot0[1], {
			x = slot0[2],
			y = slot0[3]
		})
	end)

	slot0.cacheMoveComps = {}
end

function slot1.Show(slot0, slot1)
	slot0.go:SetActive(true)
	uv0.UIMgr.GetInstance():BlurPanel(slot0.panel)
	slot0.panel:SetAsLastSibling()
	uv0.DelegateInfo.New(slot0)
	onButton(slot0, slot0.panel:Find("main/top/btnBack"), function ()
		uv0.go:SetActive(false)
		uv1.UIMgr.GetInstance():UnblurPanel(uv0.panel, uv0.tr)
		PoolMgr.GetInstance():ReturnUI("ShareUI", uv0.go)
		uv1.DelegateInfo.Dispose(uv0)

		uv0.go = nil
		uv0.tr = nil
		uv0.panel = nil
	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weibo"), function ()
		WBManager.Inst:Share(uv0.description, uv1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				uv0.TipsMgr.GetInstance():ShowTips("分享成功")
			end
		end)
		uv3()
	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weixin"), function ()
		WXManager.Inst:Share(uv0.description, uv1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				uv0.TipsMgr.GetInstance():ShowTips("分享成功")
			elseif slot1 == 99 then
				uv0.TipsMgr.GetInstance():ShowTips("指挥官，你没有安装微信客户端哦")
			end
		end)
		uv3()
	end)

	if PLATFORM_CODE == PLATFORM_KR then
		onButton(slot0, slot0.panel:Find("main/buttons/facebook"), function ()
			uv0.SdkMgr.GetInstance():ShareImg(uv1.screenshot, function (slot0, slot1)
				if slot0 and slot1 == 0 then
					uv0.TipsMgr.GetInstance():ShowTips(i18n("share_success"))
				end
			end)
			uv2()
		end)
	end
end
