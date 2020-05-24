slot0 = class("JoinGuildLayer", import("..base.BaseUI"))
slot2 = i18n("guild_search_list_max_count", 30)

function slot0.getUIName(slot0)
	return "JoinGuildUI"
end

function slot0.setGuildVOs(slot0, slot1)
	slot0.guildVOs = slot1
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.init(slot0)
	slot0.guildViewRect = slot0:findTF("add_panel/view")
	slot0.refreshBtn = slot0:findTF("add_panel/center/refresh")
	slot0.searchBtn = slot0:findTF("add_panel/center/search")
	slot0.searchBar = slot0:findTF("add_panel/center/search_bar"):GetComponent(typeof(InputField))
	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back")
	slot0.sortBtn = slot0:findTF("add_panel/center/sort_button")
	slot0.sortBtnContainer = slot0:findTF("add_panel/sort_panel/mask/content")
	slot0.sortBtnTpl = slot0:getTpl("add_panel/sort_panel/mask/content/tpl")
	slot0.sortPanel = slot0:findTF("add_panel/sort_panel")
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_joinguildui"))
	setText(slot0:findTF("tip"), uv0)
	slot0:initGuildList()
end

function slot0.getTheme(slot0)
	if slot0 == Guild.FACTION_TYPE_BLHX then
		return "blue"
	elseif slot0 == Guild.FACTION_TYPE_CSZZ then
		return "red"
	end
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.refreshBtn, function ()
		uv0:emit(JoinGuildMediator.REFRESH)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0.searchBtn, function ()
		uv0:emit(JoinGuildMediator.SEARCH, uv0.searchBar.text)
	end, SFX_PANEL)
	onButton(slot0, slot0.sortBtn, function ()
		if go(uv0.sortPanel).activeSelf then
			uv0:closeSortPanel()
		else
			uv0:openSortPanel()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.sortPanel, function ()
		uv0:closeSortPanel()
	end, SFX_PANEL)
end

function slot0.openSortPanel(slot0)
	slot0.isOpenSortPanel = true

	setActive(slot0.sortPanel, true)

	if not slot0.isInitSort then
		slot0.isInitSort = true

		slot0:initSort()
	end
end

slot3 = {
	{
		"index_all"
	},
	{
		"index_blhx",
		{
			"faction",
			Guild.FACTION_TYPE_BLHX
		}
	},
	{
		"index_cszz",
		{
			"faction",
			Guild.FACTION_TYPE_CSZZ
		}
	},
	{
		"index_power",
		{
			"policy",
			Guild.POLICY_TYPE_POWER
		}
	},
	{
		"index_relax",
		{
			"policy",
			Guild.POLICY_TYPE_RELAXATION
		}
	}
}
slot4 = {}

function slot0.initSort(slot0)
	for slot4, slot5 in ipairs(uv0) do
		slot6 = cloneTplTo(slot0.sortBtnTpl, slot0.sortBtnContainer)

		setImageSprite(slot6:Find("Image"), GetSpriteFromAtlas("ui/joinguildui_atlas", slot5[1]), true)
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				uv0:filter(uv1)
				setActive(uv0.sortPanel, false)
			end
		end)
	end

	for slot4, slot5 in ipairs(uv1) do
		slot6 = cloneTplTo(slot0.sortBtnTpl, slot0.sortBtnContainer)

		setText(slot6:Find("Text"), slot5[2])
		onToggle(slot0, slot6, function (slot0)
			if slot0 then
				uv0:sortGuilds(uv1[1])
			end
		end)
	end
end

function slot0.closeSortPanel(slot0)
	slot0.isOpenSortPanel = nil

	setActive(slot0.sortPanel, false)
end

function slot0.createGuildCard(slot0, slot1)
	slot2 = {
		go = slot1,
		tf = tf(slot1)
	}
	slot2.nameTF = slot2.tf:Find("bg/name_bg/Text"):GetComponent(typeof(Text))
	slot2.lvTF = slot2.tf:Find("bg/level/Text"):GetComponent(typeof(Text))
	slot2.lvLabelTF = slot2.tf:Find("bg/level"):GetComponent(typeof(Text))
	slot2.countTF = slot2.tf:Find("bg/count/Text"):GetComponent(typeof(Text))
	slot2.applyBtn = slot2.tf:Find("bg/apply_btn")
	slot2.flagName = slot2.tf:Find("bg/info/name"):GetComponent(typeof(Text))
	slot2.flagLabel = slot2.tf:Find("bg/info/label1"):GetComponent(typeof(Text))
	slot2.policy = slot2.tf:Find("bg/info/policy"):GetComponent(typeof(Text))
	slot2.policyLabel = slot2.tf:Find("bg/info/label2"):GetComponent(typeof(Text))
	slot2.iconTF = slot2.tf:Find("bg/icon"):GetComponent(typeof(Image))
	slot2.nameBG = slot2.tf:Find("bg/name_bg"):GetComponent(typeof(Image))
	slot2.print = slot2.tf:Find("bg/print"):GetComponent(typeof(Image))
	slot2.bg = slot2.tf:Find("bg"):GetComponent(typeof(Image))
	slot2.applyBg = slot2.applyBtn:GetComponent(typeof(Image))
	slot2.colorRed = Color(0.7529411764705882, 0.4392156862745098, 0.4627450980392157)
	slot2.colorBlue = Color(0.6274509803921569, 0.7058823529411765, 0.9764705882352941)

	function slot2.update(slot0, slot1)
		if not slot1 then
			return
		end

		slot2 = JoinGuildLayer.getTheme(slot1:getFaction())
		uv0.bg.sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", "bar_" .. slot2)
		uv0.applyBg.sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", "apply_" .. slot2)
		uv0.iconTF.sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", "icon_" .. slot2)
		uv0.nameBG.sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", "name_" .. slot2)
		uv0.print.sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", "bar_bg_" .. slot2)
		slot3 = slot2 == "red" and slot0.colorRed or slot0.colorBlue
		slot0.lvTF.color = slot3
		uv0.lvLabelTF.color = slot3
		uv0.flagLabel.color = slot3
		uv0.policyLabel.color = slot3
		slot0.guildVO = slot1
		slot0.nameTF.text = slot1:getName()
		slot0.lvTF.text = slot1.level < 9 and "0" .. slot1.level or slot1.level
		slot0.countTF.text = slot1.memberCount .. "/" .. slot1:getMaxMember()
		uv0.flagName.text = slot1:getCommader().name
		uv0.policy.text = slot1:getPolicyName()
	end

	return slot2
end

function slot0.initGuildList(slot0)
	slot0.viewRect = slot0.guildViewRect:GetComponent("LScrollRect")

	function slot0.viewRect.onInitItem(slot0)
		uv0:onInitItem(slot0)
	end

	function slot0.viewRect.onUpdateItem(slot0, slot1)
		uv0:onUpdateItem(slot0, slot1)
	end

	slot0.items = {}
end

function slot0.onInitItem(slot0, slot1)
	slot0.items[slot1] = slot0:createGuildCard(slot1)

	onButton(slot0, slot0.items[slot1].applyBtn, function ()
		if uv0.playerVO:inGuildCDTime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_leave_cd_time"))

			return
		end

		uv0:showApply(uv0.items[uv1].guildVO)
	end, SFX_PANEL)
end

function slot0.onUpdateItem(slot0, slot1, slot2)
	if not slot0.items[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.items[slot2]
	end

	slot3:update(slot0.sortVOs[slot1 + 1])
end

function slot0.sortGuilds(slot0, slot1)
	slot0.sortVOs = Clone(slot0.guildVOs) or {}

	table.sort(slot0.sortVOs, function (slot0, slot1)
		if not uv0 then
			return slot0.id < slot1.id
		elseif slot0[uv0] == slot1[uv0] then
			return slot0.id < slot1.id
		else
			return slot1[uv0] < slot0[uv0]
		end
	end)
	slot0.viewRect:SetTotalCount(#slot0.sortVOs, 0)
	setActive(slot0.listEmptyTF, #slot0.sortVOs <= 0)
end

function slot0.filter(slot0, slot1)
	slot0.sortVOs = {}

	if not slot1 and not slot0.contextData.filterData or #slot2 < 2 then
		slot0.sortVOs = Clone(slot0.guildVOs) or {}

		setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/joinguildui_atlas", "index_all"), true)
	else
		for slot6, slot7 in ipairs(slot0.guildVOs) do
			if slot7[slot2[2][1]] == slot2[2][2] then
				table.insert(slot0.sortVOs, slot7)
			end
		end

		setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/joinguildui_atlas", slot2[1]), true)
	end

	slot3 = _.all(slot0.sortVOs, function (slot0)
		return slot0:getFaction() == Guild.FACTION_TYPE_CSZZ
	end)
	slot4 = _.all(slot0.sortVOs, function (slot0)
		return slot0:getFaction() == Guild.FACTION_TYPE_BLHX
	end)
	slot0.contextData.filterData = slot2

	slot0.viewRect:SetTotalCount(#slot0.sortVOs, 0)
	setActive(slot0.listEmptyTF, #slot0.sortVOs <= 0)
end

function slot0.showApply(slot0, slot1)
	if slot0.isShowApply then
		slot0:closeApply()
	end

	slot0.isShowApply = true
	slot0.appPanel = slot0:findTF(slot1:getApplyUIName())

	if IsNil(slot0.appPanel) then
		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)
			slot0.name = uv0
			uv1.appPanel = tf(slot0)

			setActive(uv1.appPanel, true)
			setParent(uv1.appPanel, uv1._tf)
			uv1:initApplyPanel()
			uv1:updateApplyPanel(uv2)
			uv1.UIMgr:BlurPanel(uv1.appPanel)
		end)
	else
		setActive(slot0.appPanel, true)

		if slot0.preUIName ~= slot2 then
			slot0:initApplyPanel()
		end

		slot0:updateApplyPanel(slot1)
		slot0.UIMgr:BlurPanel(slot0.appPanel)
	end

	slot0.preUIName = slot2
end

function slot0.initApplyPanel(slot0)
	slot0.iconTF = findTF(slot0.appPanel, "panel/frame/policy_container/input_frame/shipicon/icon"):GetComponent(typeof(Image))
	slot0.circle = findTF(slot0.appPanel, "panel/frame/policy_container/input_frame/shipicon/frame")
	slot0.manifesto = findTF(slot0.appPanel, "panel/frame/policy_container/input_frame/Text"):GetComponent(typeof(Text))
	slot0.starsTF = findTF(slot0.appPanel, "panel/frame/policy_container/input_frame/shipicon/stars")
	slot0.starTF = findTF(slot0.appPanel, "panel/frame/policy_container/input_frame/shipicon/stars/star")
	slot0.applyBtn = findTF(slot0.appPanel, "panel/frame/confirm_btn")
	slot0.cancelBtn = findTF(slot0.appPanel, "panel/frame/cancel_btn")
	slot0.nameTF = findTF(slot0.appPanel, "panel/frame/name"):GetComponent(typeof(Text))
	slot0.levelTF = findTF(slot0.appPanel, "panel/frame/info/level/Text"):GetComponent(typeof(Text))
	slot0.countTF = findTF(slot0.appPanel, "panel/frame/info/count/Text"):GetComponent(typeof(Text))
	slot0.flagName = findTF(slot0.appPanel, "panel/frame/policy_container/name/Text"):GetComponent(typeof(Text))
	slot0.policyTF = findTF(slot0.appPanel, "panel/frame/policy_container/policy/Text"):GetComponent(typeof(Text))
end

function slot0.updateApplyPanel(slot0, slot1)
	slot2 = Ship.New({
		configId = slot1:getCommader().icon
	})

	LoadSpriteAsync("QIcon/" .. slot2:getPainting(), function (slot0)
		uv0.iconTF.sprite = slot0
	end)

	slot0.manifesto.text = slot1.manifesto

	for slot8 = slot0.starsTF.childCount, pg.ship_data_statistics[slot2.configId].star - 1 do
		cloneTplTo(slot0.starTF, slot0.starsTF)
	end

	for slot8 = 1, slot4 do
		setActive(slot0.starsTF:GetChild(slot8 - 1), slot8 <= slot3.star)
	end

	slot0.nameTF.text = slot1.name
	slot0.levelTF.text = slot1.level < 9 and "0" .. slot1.level or slot1.level
	slot0.countTF.text = slot1.memberCount .. "/" .. slot1:getMaxMember()
	slot0.flagName.text = slot1:getCommader().name
	slot0.policyTF.text = slot1:getPolicyName()
	slot5 = slot1:getCommader()
	slot6 = AttireFrame.attireFrameRes(slot5, true, AttireConst.TYPE_ICON_FRAME, slot5.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot6, slot6, true, function (slot0)
		if IsNil(uv0._tf) then
			return
		end

		if uv0.circle then
			slot0.name = uv1
			findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(slot0, uv0.circle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
		end
	end)
	onButton(slot0, slot0.applyBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			onNo = true,
			yesText = "text_confirm",
			limit = 20,
			type = MSGBOX_TYPE_INPUT,
			placeholder = i18n("guild_request_msg_placeholder"),
			title = i18n("guild_request_msg_title"),
			onYes = function (slot0)
				uv0:emit(JoinGuildMediator.APPLY, uv1.id, slot0)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()
		uv0:closeApply()
	end, SFX_PANEL)
end

function slot0.closeApply(slot0)
	slot0.isShowApply = nil

	slot0.UIMgr:UnblurPanel(slot0.appPanel, slot0._tf)
	setActive(slot0.appPanel, false)

	if slot0.circle.childCount > 0 then
		slot1 = slot0.circle:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1.name, slot1.name, slot1)
	end
end

function slot0.onBackPressed(slot0)
	if slot0.isOpenSortPanel then
		slot0:closeSortPanel()
	elseif slot0.isShowApply then
		slot0:closeApply()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		slot0:emit(uv0.ON_CLOSE)
	end
end

function slot0.willExit(slot0)
	if not IsNil(slot0.appPanel) then
		slot0:closeApply()
	end

	for slot4, slot5 in ipairs({
		"GuildApplyBlueUI",
		"GuildApplyRedUI"
	}) do
		if not IsNil(slot0:findTF(slot5)) then
			PoolMgr.GetInstance():ReturnUI(slot5, slot6)
		end
	end

	PoolMgr.GetInstance():DestroySprite("ui/JoinGuildUI_atlas")
end

return slot0
