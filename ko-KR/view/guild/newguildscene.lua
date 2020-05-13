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
		uv0:createGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.joinBtn, function ()
		uv0:joinGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.createPanel, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.backBtn, function ()
		if go(uv0.createPanel).activeSelf then
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)
end

function slot0.createGuild(slot0)
	setActive(slot0.createPanel, false)
	setActive(slot0.factionPanel, false)

	slot0.createProcess = coroutine.wrap(function ()
		setActive(uv0.createPanel, false)

		slot0 = Guild.New({})

		uv0:selectFaction(slot0, uv0.createProcess)
		coroutine.yield()
		uv0:setDescInfo(slot0:getUIName(), slot0)
	end)

	slot0.createProcess()
end

function slot0.selectFaction(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		uv0.isPlaying = true
		slot2 = slot0:Find("bg")

		setActive(slot2, true)

		slot3 = slot2:GetComponent("CanvasGroup")

		LeanTween.value(go(slot2), 1, 3, 0.5):setOnUpdate(System.Action_float(function (slot0)
			uv0.localScale = Vector3(slot0, slot0, 1)
			uv1.alpha = 1 - slot0 / 3
		end)):setOnComplete(System.Action(function ()
			setActive(uv0, false)

			uv0.localScale = Vector3(1, 1, 1)
			uv1.isPlaying = false

			uv2()
		end))
	end

	setActive(slot0.factionPanel, true)

	slot5 = slot0.factionPanel:Find("panel")
	slot6 = slot5:Find("blhx")
	slot7 = slot5:Find("cszz")
	slot8 = slot5:Find("bg")

	if not slot0.isInitFaction then
		function ()
			setImageSprite(uv0, GetSpriteFromAtlas("commonbg/camp_bg", ""))
			setImageSprite(uv1:Find("bg"), GetSpriteFromAtlas("clutter/blhx_icon", ""))
			setImageSprite(uv2:Find("bg"), GetSpriteFromAtlas("clutter/cszz_icon", ""))
			setActive(uv1:Find("bg"), false)
			setActive(uv2:Find("bg"), false)
		end()

		slot0.isInitFaction = true
	end

	onButton(slot0, slot6, function ()
		if uv0.isPlaying then
			return
		end

		uv1:setFaction(Guild.FACTION_TYPE_BLHX)

		if uv2 then
			uv2()
		else
			return
		end

		uv3(uv4, function ()
			uv0 = nil
		end)
	end, SFX_PANEL)
	onButton(slot0, slot7, function ()
		if uv0.isPlaying then
			return
		end

		uv1:setFaction(Guild.FACTION_TYPE_CSZZ)

		if uv2 then
			uv2()
		else
			return
		end

		uv3(uv4, function ()
			uv0 = nil
		end)
	end)
	onButton(slot0, slot0.backBtn, function ()
		if uv0.isPlaying then
			return
		end

		uv0.createProcess = nil

		setActive(uv0.createPanel, true)
		setActive(uv0.factionPanel, false)
		onButton(uv0, uv0.backBtn, function ()
			uv0:emit(uv1.ON_BACK)
		end, SFX_CANCEL)
	end, SFX_CANCEL)
	setActive(slot0.topPanel, true)
end

function slot0.setDescInfo(slot0, slot1, slot2)
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)
		setActive(uv0._playerResOb, true)

		slot0.name = uv1
		uv0.infoGameobject = slot0
		slot1 = tf(slot0)

		setParent(slot1, uv0._tf)
		setActive(slot1, true)
		setActive(uv0.topPanel, true)
		uv0.topPanel:SetAsLastSibling()

		slot4 = findTF(slot1, "bg/frame/policy_container/policy/relax")
		findTF(slot1, "bg/frame/confirm_btn/print_container/Text"):GetComponent(typeof(Text)).text = pg.gameset.create_guild_cost.key_value

		onInputChanged(uv0, findTF(slot1, "bg/frame/name_bg/input"):GetComponent(typeof(InputField)), function ()
			slot1, slot2 = wordVer(getInputText(uv0), {
				isReplace = true
			})

			if slot1 > 0 then
				setInputText(uv0, slot2)
			end
		end)
		onInputChanged(uv0, findTF(slot1, "bg/frame/policy_container/input_frame/input"):GetComponent(typeof(InputField)), function ()
			slot1, slot2 = wordVer(getInputText(uv0), {
				isReplace = true
			})

			if slot1 > 0 then
				setInputText(uv0, slot2)
			end
		end)

		function slot10()
			uv1:setName(uv0.text)

			slot1 = uv2.text
			slot2 = wordVer(slot1)

			uv1:setManifesto(slot1)
		end

		onToggle(uv0, slot4, function (slot0)
			if slot0 then
				uv0:setPolicy(Guild.POLICY_TYPE_RELAXATION)
			end
		end, SFX_PANEL)
		onToggle(uv0, findTF(slot1, "bg/frame/policy_container/policy/power"), function (slot0)
			if slot0 then
				uv0:setPolicy(Guild.POLICY_TYPE_POWER)
			end
		end, SFX_PANEL)
		triggerToggle(slot4, true)
		onButton(uv0, findTF(slot1, "bg/frame/cancel_btn"), function ()
			uv0.createProcess = nil

			uv0:createGuild()
			PoolMgr.GetInstance():ReturnUI(uv1, uv0.infoGameobject)
		end, SFX_CANCEL)
		onButton(uv0, uv0.backBtn, function ()
			if uv0.isPlaying then
				return
			end

			uv0.createProcess = nil

			uv0:createGuild()
			PoolMgr.GetInstance():ReturnUI(uv1, uv0.infoGameobject)
		end, SFX_CANCEL)
		onButton(uv0, findTF(slot1, "bg/frame/confirm_btn"), function ()
			slot0 = uv0()

			if not uv1:getName() or slot1 == "" then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_noname"))

				return
			end

			if not nameValidityCheck(slot1, 0, 20, {
				"spece_illegal_tip",
				"login_newPlayerScene_name_tooShort",
				"login_newPlayerScene_name_tooLong",
				"err_name_existOtherChar"
			}) then
				return
			end

			if not uv1:getFaction() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nofaction"))

				return
			end

			if not uv1:getPolicy() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nopolicy"))

				return
			end

			if not uv1:getManifesto() or slot2 == "" then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_create_confirm", uv2),
				onYes = function ()
					if uv0.playerVO:getTotalGem() < uv1 then
						GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
					else
						uv0:emit(NewGuildMediator.CREATE, uv2)
					end
				end
			})
		end, SFX_CONFIRM)
		pg.UIMgr.GetInstance():LoadingOff()

		GetOrAddComponent(slot1, "CanvasGroup").alpha = 0
		uv0.isPlaying = true

		LeanTween.value(slot0, 0, 1, 0.6):setOnUpdate(System.Action_float(function (slot0)
			uv0.alpha = slot0
		end)):setOnComplete(System.Action(function ()
			uv0.isPlaying = false

			setActive(uv0.factionPanel, false)
		end)):setDelay(0.5)
	end)
end

function slot0.closeInfoPanel(slot0)
	PoolMgr.GetInstance():ReturnUI(uiName, slot0.infoGameobject)
end

function slot0.joinGuild(slot0)
	slot0:emit(NewGuildMediator.OPEN_GUILD_LIST)
end

function slot0.onBackPressed(slot0)
	if slot0.createProcess ~= nil then
		triggerButton(slot0.backBtn)
	else
		triggerButton(slot0.createPanel)
	end
end

function slot0.willExit(slot0)
	if slot0._resPanel then
		slot0._resPanel:exit()

		slot0._resPanel = nil
	end
end

return slot0
