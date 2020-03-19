pg = pg or {}
pg.ShareMgr = singletonClass("ShareMgr")
pg.ShareMgr.TypeAdmira = 1
pg.ShareMgr.TypeShipProfile = 2
pg.ShareMgr.TypeNewShip = 3
pg.ShareMgr.TypeBackyard = 4
pg.ShareMgr.TypeNewSkin = 5
pg.ShareMgr.TypeSummary = 6
pg.ShareMgr.TypePhoto = 7
pg.ShareMgr.TypeReflux = 8
pg.ShareMgr.TypeCommander = 9
pg.ShareMgr.TypeColoring = 10
pg.ShareMgr.TypeChallenge = 11
pg.ShareMgr.TypeInstagram = 12
pg.ShareMgr.TypeTWCelebrationShare = 5000
pg.ShareMgr.PANEL_TYPE_BLACK = 1
pg.ShareMgr.PANEL_TYPE_PINK = 2
pg.ShareMgr.ANCHORS_TYPE = {
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

function pg.ShareMgr.Init(slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		slot0.go = slot0

		slot0.go:SetActive(false)

		slot0.tr = slot0.transform
		slot0.panelBlack = slot0.tr:Find("panel")
		slot0.panelPink = slot0.tr:Find("panel_pink")
		slot0.deckTF = slot0.tr:Find("deck")

		setActive(slot0.panelBlack, false)
		setActive(slot0.panelPink, false)
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

function pg.ShareMgr.Share(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-25, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 53-57, warpins: 6 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 61-62, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 65-68, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 78-83, warpins: 3 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 87-93, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 97-120, warpins: 2 ---
	if not CheckPermissionGranted(ANDROID_WRITE_EXTERNAL_PERMISSION) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-21, warpins: 1 ---
		slot0.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n1("指揮官，碧藍航向需要存儲權限才能分享是否打開？"),
			onYes = function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				ApplyPermission({
					ANDROID_WRITE_EXTERNAL_PERMISSION
				})

				return
				--- END OF BLOCK #0 ---



			end
		})

		return
		--- END OF BLOCK #0 ---



	end

	if PLATFORM_CODE ~= PLATFORM_JP and PLATFORM_CODE ~= PLATFORM_US and PLATFORM_CODE ~= PLATFORM_KR and PLATFORM_CODE ~= PLATFORM_CHT and not WBManager.IsSupportShare() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-52, warpins: 1 ---
		slot0.TipsMgr.GetInstance():ShowTips("指挥官，当前平台暂不支持分享功能哦")

		return
		--- END OF BLOCK #0 ---



	end

	if IsNil(slot0.go) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-60, warpins: 1 ---
		slot0:Init()
		--- END OF BLOCK #0 ---



	end

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-64, warpins: 1 ---
		slot2 = slot1.PANEL_TYPE_BLACK
		--- END OF BLOCK #0 ---



	end

	if slot2 == slot1.PANEL_TYPE_BLACK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 69-71, warpins: 1 ---
		slot0.panel = slot0.panelBlack
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-75, warpins: 1 ---
		if slot2 == slot1.PANEL_TYPE_PINK then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-77, warpins: 1 ---
			slot0.panel = slot0.panelPink
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot3 = setActive
	slot4 = slot0.panelBlack

	if slot2 ~= slot1.PANEL_TYPE_BLACK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-85, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-86, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.panelPink

	if slot2 ~= slot1.PANEL_TYPE_PINK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 94-95, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 96-96, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	slot3(slot4, slot5)

	slot3 = slot0.share_template[slot1]
	slot4 = getProxy(PlayerProxy):getRawData()
	slot6 = getProxy(ServerProxy):getRawData()
	slot7 = (getProxy(UserProxy):getRawData() and slot5.server) or 0
	slot0.deckTF.anchorMin = Vector2(slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or {
		0.5,
		0.5,
		0.5,
		0.5
	}[1], slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or [2])
	slot0.deckTF.anchorMax = Vector2(slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or [3], slot0.ANCHORS_TYPE[slot0.share_template[slot1].deck] or [4])

	setText(slot0.deckTF:Find("name/value"), (slot4 and slot4.name) or "")
	setText(slot0.deckTF:Find("server/value"), (slot6[slot7] and slot6[slot7].name) or "")
	setText(slot0.deckTF:Find("lv/value"), slot4.level)

	slot0.deckTF.anchoredPosition3D = Vector3(slot3.qrcode_location[1], slot3.qrcode_location[2], -100)
	slot0.deckTF.anchoredPosition = Vector2(slot3.qrcode_location[1], slot3.qrcode_location[2])

	_.each(slot3.hidden_comps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-22, warpins: 1 ---
			table.insert(slot0.cacheComps, slot1)
			slot1:SetActive(false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	_.each(slot3.show_comps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-22, warpins: 1 ---
			table.insert(slot0.cacheShowComps, slot1)
			slot1:SetActive(true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	_.each(slot3.move_comps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if not IsNil(GameObject.Find(slot0.path)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-32, warpins: 1 ---
			table.insert(slot0.cacheMoveComps, {
				slot1,
				slot1.transform.anchoredPosition.x,
				slot1.transform.anchoredPosition.y
			})
			setAnchoredPosition(slot1, {
				x = slot0.x,
				y = slot0.y
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-33, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	SetParent(slot0.deckTF, slot12, false)
	slot0.deckTF:SetAsLastSibling()

	slot13 = ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32)

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #8 121-123, warpins: 1 ---
	if not slot5.server then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-124, warpins: 2 ---
		slot7 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 125-127, warpins: 2 ---
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #10 128-130, warpins: 1 ---
	if not slot4.name then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 131-131, warpins: 2 ---
		slot7 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 132-133, warpins: 2 ---
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #12 134-136, warpins: 1 ---
	if not slot6[slot7].name then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-137, warpins: 2 ---
		slot8 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 138-143, warpins: 2 ---
	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #14 144-144, warpins: 1 ---
	slot10 = 

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 145-241, warpins: 2 ---
	if (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US) and slot0.SdkMgr.GetInstance():GetIsPlatform() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 255-284, warpins: 1 ---
		slot0.SdkMgr.GetInstance():GameShare(slot3.description, slot13:EncodeToJPG(slot13:TakePhoto(slot11)))
		slot0.UIMgr.GetInstance():LoadingOn()
		onDelayTick(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0.UIMgr.GetInstance():LoadingOff()

			return
			--- END OF BLOCK #0 ---



		end, 2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 285-288, warpins: 2 ---
		if PLATFORM_CODE == PLATFORM_CHT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 289-303, warpins: 1 ---
			slot13:Take(slot11, slot0.screenshot)
			slot0.SdkMgr.GetInstance():ShareImg(slot0.screenshot, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-1, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 304-310, warpins: 1 ---
			if slot13:Take(slot11, slot0.screenshot) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 311-320, warpins: 1 ---
				print("截图位置: " .. slot0.screenshot)
				slot0:Show(slot3)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 321-328, warpins: 1 ---
				slot0.TipsMgr.GetInstance():ShowTips("截圖失敗")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 329-356, warpins: 4 ---
	SetParent(slot9, slot0.tr, false)
	_.each(slot0.cacheComps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:SetActive(true)

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.cacheComps = {}

	_.each(slot0.cacheShowComps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:SetActive(false)

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.cacheShowComps = {}

	_.each(slot0.cacheMoveComps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		setAnchoredPosition(slot0[1], {
			x = slot0[2],
			y = slot0[3]
		})

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.cacheMoveComps = {}

	return
	--- END OF BLOCK #16 ---



end

function pg.ShareMgr.Show(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-54, warpins: 1 ---
	slot0.go:SetActive(true)
	slot0.UIMgr.GetInstance():BlurPanel(slot0.panel)
	slot0.panel:SetAsLastSibling()
	slot0.DelegateInfo.New(slot0)
	onButton(slot0, slot0.panel:Find("main/top/btnBack"), slot2)
	onButton(slot0, slot0.panel:Find("main/buttons/weibo"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		WBManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 and slot1 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-12, warpins: 1 ---
				slot0.TipsMgr.GetInstance():ShowTips("分享成功")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-13, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1.screenshot()

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weixin"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		WXManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 and slot1 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-13, warpins: 1 ---
				slot0.TipsMgr.GetInstance():ShowTips("分享成功")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-15, warpins: 2 ---
				if slot1 == 99 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-23, warpins: 1 ---
					slot0.TipsMgr.GetInstance():ShowTips("指挥官，你没有安装微信客户端哦")
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-24, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1.screenshot()

		return
		--- END OF BLOCK #0 ---



	end)

	if PLATFORM_CODE == PLATFORM_KR then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-63, warpins: 1 ---
		onButton(slot0, slot0.panel:Find("main/buttons/facebook"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			slot0.SdkMgr.GetInstance():ShareImg(slot1.screenshot, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-2, warpins: 1 ---
				if slot0 and slot1 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-14, warpins: 1 ---
					slot0.TipsMgr.GetInstance():ShowTips(i18n("share_success"))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-15, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			slot1.screenshot()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 64-65, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return
