slot0 = class("NewGuildScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "NewGuildUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	slot0._resPanel:setResources(slot1)
end

function slot0.init(slot0)
	slot0.createPanel = slot0:findTF("create_panel")
	slot0.factionPanel = slot0:findTF("faction_panel")
	slot0.createBtn = slot0:findTF("create_panel/frame/create_btn")
	slot0.joinBtn = slot0:findTF("create_panel/frame/join_btn")
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0._playerResOb = slot0:findTF("playerRes", slot0.topPanel)
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0.backBtn = slot0:findTF("back", slot0.topPanel)

	setActive(slot0.factionPanel, false)

	slot0.mask = slot0:findTF("mask")

	SetActive(slot0.mask, false)
end

function slot0.didEnter(slot0)
	slot0:select()
end

function slot0.startCreate(slot0)
	setActive(slot0.createPanel, true)
end

function slot0.select(slot0)
	slot0:startCreate()
	onButton(slot0, slot0.createBtn, function ()
		slot0:createGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.joinBtn, function ()
		slot0:joinGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.createPanel, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.backBtn, function ()
		if go(slot0.createPanel).activeSelf then
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
end

function slot0.createGuild(slot0)
	setActive(slot0.createPanel, false)
	setActive(slot0.factionPanel, false)

	slot0.createProcess = coroutine.wrap(function ()
		setActive(slot0.createPanel, false)

		slot0 = Guild.New({})

		slot0:selectFaction(slot0, slot0.createProcess)
		coroutine.yield()
		slot0:setDescInfo(slot0:getUIName(), slot0)
	end)

	slot0.createProcess()
end

function slot0.selectFaction(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		slot0.isPlaying = true
		slot2 = slot0:Find("bg")

		setActive(slot2, true)

		slot3 = slot2:GetComponent("CanvasGroup")

		LeanTween.value(go(slot2), 1, 3, 0.5):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
			slot0.alpha = 1 - slot0 / 3
		end)):setOnComplete(System.Action(function ()
			setActive(setActive, false)

			setActive.localScale = Vector3(
			-- Decompilation error in this vicinity:
			1, 1, 1)
			Vector3(
			-- Decompilation error in this vicinity:
			1, 1, 1).isPlaying = false


			-- Decompilation error in this vicinity:
			1()
		end))
	end

	setActive(slot0.factionPanel, true)

	slot5 = slot0.factionPanel.Find(slot4, "panel")
	slot6 = slot5:Find("blhx")
	slot7 = slot5:Find("cszz")
	slot8 = slot5:Find("bg")

	function slot9()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-46, warpins: 1 ---
		setImageSprite(setImageSprite, GetSpriteFromAtlas("commonbg/camp_bg", ""))
		setImageSprite(setImageSprite:Find("bg"), GetSpriteFromAtlas("clutter/blhx_icon", ""))
		setImageSprite(GetSpriteFromAtlas:Find("bg"), GetSpriteFromAtlas("clutter/cszz_icon", ""))
		setActive(GetSpriteFromAtlas.Find("bg"):Find("bg"), false)
		setActive(false:Find("bg"), false)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.isInitFaction then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot9()

		slot0.isInitFaction = true
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.isPlaying then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-14, warpins: 1 ---
		slot1:setFaction(Guild.FACTION_TYPE_BLHX)

		if Guild.FACTION_TYPE_BLHX then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-23, warpins: 1 ---
		slot3(slot4, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			slot0 = nil

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 24-24, warpins: 2 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 25-25, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end, SFX_PANEL)
	onButton(slot0, slot7, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.isPlaying then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-14, warpins: 1 ---
		slot1:setFaction(Guild.FACTION_TYPE_CSZZ)

		if Guild.FACTION_TYPE_CSZZ then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-18, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-23, warpins: 1 ---
		slot3(slot4, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			slot0 = nil

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 24-24, warpins: 2 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 25-25, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end)
	onButton(slot0, slot0.backBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.isPlaying then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-26, warpins: 1 ---
		slot0.createProcess = nil

		setActive(slot0.createPanel, true)
		setActive(slot0.factionPanel, false)
		onButton(onButton, slot0.backBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0:emit(slot1.ON_BACK)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)

		return
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-27, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end, SFX_CANCEL)
	setActive(slot0.topPanel, true)
end

function slot0.setDescInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-171, warpins: 1 ---
		setActive(slot0._playerResOb, true)

		slot0.name = setActive
		slot0.infoGameobject = slot0
		slot1 = tf(slot0)

		setParent(slot1, slot0._tf)
		setActive(slot1, true)
		setActive(slot0.topPanel, true)
		slot0.topPanel:SetAsLastSibling()

		findTF(slot1, "bg/frame/confirm_btn/print_container/Text"):GetComponent(typeof(Text)).text = pg.gameset.create_guild_cost.key_value

		onInputChanged(slot0, slot2, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot1, slot2 = wordVer(slot0, {
				isReplace = true
			})

			if slot1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				setInputText(slot0, slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		onInputChanged(slot0, slot3, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot1, slot2 = wordVer(slot0, {
				isReplace = true
			})

			if slot1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				setInputText(slot0, slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			slot1:setName(slot0)

			slot2 = wordVer(slot1)

			slot1:setManifesto(slot2.text)

			return
			--- END OF BLOCK #0 ---



		end

		onToggle(slot0, slot4, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-9, warpins: 1 ---
				slot0:setPolicy(Guild.POLICY_TYPE_RELAXATION)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-10, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end, SFX_PANEL)
		onToggle(slot0, slot5, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-9, warpins: 1 ---
				slot0:setPolicy(Guild.POLICY_TYPE_POWER)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-10, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end, SFX_PANEL)
		triggerToggle(slot4, true)
		onButton(slot0, slot6, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			slot0.createProcess = nil

			slot0:createGuild()
			PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance(), slot0.infoGameobject)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot0, slot0.backBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.isPlaying then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-22, warpins: 2 ---
			slot0.createProcess = nil

			slot0:createGuild()
			PoolMgr.GetInstance():ReturnUI(PoolMgr.GetInstance(), slot0.infoGameobject)

			return
			--- END OF BLOCK #1 ---



		end, SFX_CANCEL)
		onButton(slot0, slot7, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0 = slot0()

			if not slot1:getName() or slot1 == "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-21, warpins: 2 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_noname"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 22-29, warpins: 1 ---
			if not nameValidityCheck(slot1, 0, 20, {
				"spece_illegal_tip",
				"login_newPlayerScene_name_tooShort",
				"login_newPlayerScene_name_tooLong",
				"err_name_existOtherChar"
			}) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-30, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 31-36, warpins: 1 ---
			if not slot1:getFaction() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-47, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nofaction"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 48-53, warpins: 1 ---
			if not slot1:getPolicy() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-64, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nopolicy"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 65-70, warpins: 1 ---
			if not slot1:getManifesto() or slot2 == "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 73-83, warpins: 2 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 84-99, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_create_confirm", slot2),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-8, warpins: 1 ---
					if slot0.playerVO:getTotalGem() < slot0.playerVO then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-19, warpins: 1 ---
						GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 20-26, warpins: 1 ---
						slot0:emit(NewGuildMediator.CREATE, )
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 27-27, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end
			})

			return
			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 100-100, warpins: 2 ---
			--- END OF BLOCK #6 ---

			FLOW; TARGET BLOCK #7



			-- Decompilation error in this vicinity:
			--- BLOCK #7 101-101, warpins: 2 ---
			--- END OF BLOCK #7 ---

			FLOW; TARGET BLOCK #8



			-- Decompilation error in this vicinity:
			--- BLOCK #8 102-102, warpins: 2 ---
			--- END OF BLOCK #8 ---

			FLOW; TARGET BLOCK #9



			-- Decompilation error in this vicinity:
			--- BLOCK #9 103-103, warpins: 2 ---
			--- END OF BLOCK #9 ---

			FLOW; TARGET BLOCK #10



			-- Decompilation error in this vicinity:
			--- BLOCK #10 104-104, warpins: 2 ---
			--- END OF BLOCK #10 ---



		end, SFX_CONFIRM)
		pg.UIMgr.GetInstance():LoadingOff()

		GetOrAddComponent(slot1, "CanvasGroup").alpha = 0
		slot0.isPlaying = true

		LeanTween.value(slot0, 0, 1, 0.6):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0.isPlaying = false

			setActive(slot0.factionPanel, false)

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(0.5)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeInfoPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	PoolMgr.GetInstance():ReturnUI(uiName, slot0.infoGameobject)

	return
	--- END OF BLOCK #0 ---



end

function slot0.joinGuild(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:emit(NewGuildMediator.OPEN_GUILD_LIST)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.createProcess ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		triggerButton(slot0.backBtn)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		triggerButton(slot0.createPanel)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0._resPanel:exit()

		slot0._resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
