slot0 = class("GuildMemberLayer", import("..base.BaseUI"))

function slot0.setGuildVO(slot0, slot1)
	slot0.guildVO = slot1

	slot0:setMemberVOs(slot1:getSortMember())
end

function slot0.setMemberVOs(slot0, slot1)
	slot0.memberVOs = slot1
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.getUIName(slot0)
	return "GuildMemberUI"
end

function slot0.init(slot0)
	slot0.Timer = {}
	slot0.rightPanel = slot0:findTF("right_panel")
	slot0.rightPanelBlurBg = slot0:findTF("blur_bg", slot0.rightPanel)
	slot0.rectView = slot0:findTF("right_panel/scroll")
	slot0.paintingTF = slot0:findTF("painting")
	slot0.buttonsPanel = slot0:findTF("buttons_panel")
	slot0.toggleGroup = slot0:findTF("buttons_panel"):GetComponent(typeof(ToggleGroup))
	slot0.infoBtn = slot0:findTF("buttons_panel/info_btn")
	slot0.dutyBtn = slot0:findTF("buttons_panel/duty_btn")
	slot0.fireBtn = slot0:findTF("buttons_panel/fire_btn")
	slot0.impeachBtn = slot0:findTF("buttons_panel/impeach_btn")
	slot0.appiontPanel = slot0:findTF("appoint_panel")

	setActive(slot0.appiontPanel, false)

	slot0.dutyContainer = slot0:findTF("appoint_panel/frame/duty")
	slot0.print = slot0:findTF("appoint_panel/frame/prints/print"):GetComponent(typeof(Image))
	slot0.confirmBtn = slot0:findTF("appoint_panel/frame/confirm_btn")
	slot0.nameTF = slot0:findTF("frame/info/name/Text", slot0.appiontPanel):GetComponent(typeof(Text))
	slot0.iconTF = slot0:findTF("frame/info/shipicon/icon", slot0.appiontPanel):GetComponent(typeof(Image))
	slot0.starsTF = slot0:findTF("frame/info/shipicon/stars", slot0.appiontPanel)
	slot0.starTF = slot0:findTF("frame/info/shipicon/stars/star", slot0.appiontPanel)
	slot0.levelTF = slot0:findTF("frame/info/level/Text", slot0.appiontPanel):GetComponent(typeof(Text))
	slot0.appiontCircle = slot0:findTF("frame/info/shipicon/frame", slot0.appiontPanel)
	slot0.firePanel = slot0:findTF("expel_panel")

	setActive(slot0.firePanel, false)

	slot0.fireconfirmBtn = slot0:findTF("expel_panel/frame/confirm_btn")
	slot0.firecancelBtn = slot0:findTF("expel_panel/frame/cancel_btn")
	slot0.firenameTF = slot0:findTF("frame/info/name/Text", slot0.firePanel):GetComponent(typeof(Text))
	slot0.fireiconTF = slot0:findTF("frame/info/shipicon/icon", slot0.firePanel):GetComponent(typeof(Image))
	slot0.fireduty = slot0:findTF("expel_panel/frame/duty"):GetComponent(typeof(Image))
	slot0.firestarsTF = slot0:findTF("frame/info/shipicon/stars", slot0.firePanel)
	slot0.firestarTF = slot0:findTF("frame/info/shipicon/stars/star", slot0.firePanel)
	slot0.firelevelTF = slot0:findTF("frame/info/level/Text", slot0.firePanel):GetComponent(typeof(Text))
	slot0.fireframeCircle = slot0:findTF("frame/info/shipicon/frame", slot0.firePanel)
	slot0.impeachPanel = slot0:findTF("impeach_panel")

	setActive(slot0.impeachPanel, false)

	slot0.impeachconfirmBtn = slot0:findTF("impeach_panel/frame/confirm_btn")
	slot0.impeachcancelBtn = slot0:findTF("impeach_panel/frame/cancel_btn")
	slot0.impeachnameTF = slot0:findTF("frame/info/name/Text", slot0.impeachPanel):GetComponent(typeof(Text))
	slot0.impeachiconTF = slot0:findTF("frame/info/shipicon/icon", slot0.impeachPanel):GetComponent(typeof(Image))
	slot0.impeachduty = slot0:findTF("impeach_panel/frame/duty"):GetComponent(typeof(Image))
	slot0.impeachstarsTF = slot0:findTF("frame/info/shipicon/stars", slot0.impeachPanel)
	slot0.impeachstarTF = slot0:findTF("frame/info/shipicon/stars/star", slot0.impeachPanel)
	slot0.impeachlevelTF = slot0:findTF("frame/info/level/Text", slot0.impeachPanel):GetComponent(typeof(Text))
	slot0.impeachCirCle = slot0:findTF("frame/info/shipicon/frame", slot0.impeachPanel)
	slot0.infoPanel = slot0:findTF("info_panel")

	setActive(slot0.infoPanel, false)

	slot0.infonameTF = slot0:findTF("frame/info/name/Text", slot0.infoPanel):GetComponent(typeof(Text))
	slot0.infoiconTF = slot0:findTF("frame/info/shipicon/icon", slot0.infoPanel):GetComponent(typeof(Image))
	slot0.infoduty = slot0:findTF("info_panel/frame/duty"):GetComponent(typeof(Image))
	slot0.infostarsTF = slot0:findTF("frame/info/shipicon/stars", slot0.infoPanel)
	slot0.infostarTF = slot0:findTF("frame/info/shipicon/stars/star", slot0.infoPanel)
	slot0.infolevelTF = slot0:findTF("frame/info/level/Text", slot0.infoPanel):GetComponent(typeof(Text))
	slot0.infoCircle = slot0:findTF("frame/info/shipicon/frame", slot0.infoPanel)
	slot0.resumeInfo = slot0:findTF("frame/content", slot0.infoPanel)
	slot0.chatPanel = slot0:findTF("chat")

	setActive(slot0.chatPanel, false)
	setActive(slot0.buttonsPanel, false)
	pg.UIMgr.GetInstance():OverlayPanelPB(slot0.rightPanel, {
		pbList = {
			slot0.rightPanelBlurBg
		},
		overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
	})
end

function slot0.didEnter(slot0)
	slot0:initMembers()
	onButton(slot0, slot0.appiontPanel, function ()
		uv0:closeButtons()
		uv0:closeAppointPanel()
	end, SFX_PANEL)
end

slot1 = {
	{
		{
			"preOnLineTime"
		},
		"sort_time"
	},
	{
		{
			"level"
		},
		"sort_lv"
	},
	{
		{
			"duty"
		},
		"sort_duty"
	}
}

function slot0.initMembers(slot0)
	pg.UIMgr.GetInstance():LoadingOn()

	slot0.rectRect = slot0.rectView:GetComponent("LScrollRect")

	function slot0.rectRect.onInitItem(slot0)
		uv0:onInitItem(slot0)
	end

	function slot0.rectRect.onUpdateItem(slot0, slot1)
		uv0:onUpdateItem(slot0, slot1)
	end

	function slot0.rectRect.onStart()
		pg.UIMgr.GetInstance():LoadingOff()
		uv0:reloadPainting()
	end

	slot0.items = {}

	slot0:sortMembers()
end

function slot0.reloadPainting(slot0)
	for slot4, slot5 in pairs(slot0.items) do
		if slot5.memberVO.id == slot0.memberVOs[1].id then
			triggerButton(slot5.tf)

			break
		end
	end
end

function slot0.createMemberCard(slot0, slot1)
	slot2 = {
		go = slot1,
		tf = tf(slot1)
	}
	slot2.iconTF = slot2.tf:Find("shipicon/icon"):GetComponent(typeof(Image))
	slot2.starsTF = slot2.tf:Find("shipicon/stars")
	slot2.starTF = slot2.tf:Find("shipicon/stars/star")
	slot2.levelTF = slot2.tf:Find("level/Text"):GetComponent(typeof(Text))
	slot2.nameTF = slot2.tf:Find("name_bg/Text"):GetComponent(typeof(Text))
	slot2.dutyTF = slot2.tf:Find("duty"):GetComponent(typeof(Image))
	slot2.livenessTF = slot2.tf:Find("liveness/Text"):GetComponent(typeof(Text))
	slot2.onLine = slot2.tf:Find("online_tag")
	slot2.offLine = slot2.tf:Find("last_time")
	slot2.onLineLabel = slot2.tf:Find("online")
	slot2.offLineLabel = slot2.tf:Find("offline")
	slot2.offLineText = slot2.tf:Find("last_time/Text"):GetComponent(typeof(Text))
	slot2.maskTF = slot2.tf:Find("mask")
	slot2.timerTF = slot2.tf:Find("mask/Text"):GetComponent(typeof(Text))
	slot2.borderTF = slot2.tf:Find("selected")
	slot2.bg = slot2.tf:Find("bg")
	slot2.circle = slot2.tf:Find("shipicon/frame")

	function slot3(slot0, slot1)
		if uv0.Timer[slot0] then
			uv0.Timer[slot0]:Stop()

			uv0.Timer[slot0] = nil
		end

		uv0.Timer[slot0] = Timer.New(slot1, 1, -1)

		uv0.Timer[slot0]:Start()
		uv0.Timer[slot0].func()
	end

	function slot2.clear(slot0)
		if slot0.circle.childCount > 0 then
			slot1 = slot0.circle:GetChild(0)
			slot2 = slot1.gameObject.name

			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot2, slot2, slot1.gameObject)
		end
	end

	function slot2.dispose(slot0)
		slot0:clear()
	end

	function slot2.update(slot0, slot1, slot2, slot3)
		slot0:clear()
		setActive(uv0.borderTF, slot3)
		setActive(uv0.bg, not slot3)

		slot0.memberVO = slot1

		LoadSpriteAsync("qicon/" .. Ship.New({
			configId = slot1.icon,
			skin_id = slot1.skinId,
			propose = slot1.proposeTime
		}):getPainting(), function (slot0)
			if not IsNil(uv0.iconTF) then
				uv0.iconTF.sprite = slot0
			end
		end)

		slot6 = AttireFrame.attireFrameRes(slot1, false, AttireConst.TYPE_ICON_FRAME, slot1.propose)

		function slot12(slot0)
			if uv0.circle then
				slot0.name = uv1
				findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

				setParent(slot0, uv0.circle, false)
			else
				PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
			end
		end

		PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot6, slot6, true, slot12)

		uv0.dutyTF.sprite = GetSpriteFromAtlas("dutyicon", slot1.duty)

		for slot12 = slot0.starsTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1 do
			cloneTplTo(slot0.starTF, slot0.starsTF)
		end

		for slot12 = 1, slot8 do
			setActive(slot0.starsTF:GetChild(slot12 - 1), slot12 <= slot4.star)
		end

		slot0.levelTF.text = slot1.level
		slot0.nameTF.text = slot1.name
		slot0.livenessTF.text = slot1.liveness

		setActive(slot0.onLine, slot1:isOnline())
		setActive(slot0.offLine, not slot1:isOnline())
		setActive(slot0.onLineLabel, slot1:isOnline())
		setActive(slot0.offLineLabel, not slot1:isOnline())

		if not slot1:isOnline() then
			uv0.offLineText.text = getOfflineTimeStamp(slot1.preOnLineTime)
		end

		slot9 = slot1.duty == GuildMember.DUTY_COMMANDER and slot2:inKickTime()

		setActive(uv0.maskTF, slot9)

		if slot9 then
			uv1(slot1.id, function ()
				if uv0:getKickLeftTime() > 0 then
					uv1.timerTF.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
				else
					uv1.timerTF.text = ""

					setActive(uv1.maskTF, false)
				end
			end)
		end
	end

	return slot2
end

function slot0.onInitItem(slot0, slot1)
	slot2 = slot0:createMemberCard(slot1)

	onButton(slot0, slot2.tf, function ()
		setActive(uv0.borderTF, true)

		if uv1.curItemId and uv1.curItemId ~= uv0.memberVO.id and uv1:getItemById(uv1.curItemId) then
			setActive(slot0.borderTF, false)
		end

		uv1:loadPainting(uv0.memberVO)

		uv1.curItemId = uv0.memberVO.id
	end, SFX_PANEL)

	slot0.items[slot1] = slot2
end

function slot0.getItemById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.items) do
		if slot6.memberVO.id == slot1 then
			return slot6
		end
	end
end

function slot0.loadPainting(slot0, slot1)
	slot2 = slot1.duty
	slot3 = slot0.guildVO:getDutyByMemberId(slot0.playerVO.id)

	setActive(slot0.buttonsPanel, true)

	if not slot1.manifesto or slot1.manifesto == "" then
		setActive(slot0.chatPanel, false)
	else
		setActive(slot0.chatPanel, true)
		setText(slot0:findTF("Text", slot0.chatPanel), slot1.manifesto)
	end

	pg.UIMgr.GetInstance():LoadingOn()
	setPaintingPrefabAsync(slot0.paintingTF, Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}):getPainting(), "chuanwu", function ()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
	onToggle(slot0, slot0.infoBtn, function (slot0)
		if slot0 then
			uv0.contextData.memberVO = uv1

			uv0:emit(GuildMemberMediator.OPEN_DESC_INFO, uv1)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.dutyBtn, function (slot0)
		if slot0 then
			if uv0.id == uv1.playerVO.id then
				return
			end

			uv1:showAppointPanel(uv0)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.fireBtn, function (slot0)
		if slot0 then
			uv0:showFirePanel(uv1)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.impeachBtn, function (slot0)
		if slot0 then
			uv0:showImpeachPanel(uv1)
		end
	end, SFX_PANEL)
	setActive(slot0.impeachBtn, slot3 == GuildMember.DUTY_DEPUTY_COMMANDER and slot2 == GuildMember.DUTY_COMMANDER and slot1:isLongOffLine())

	slot5 = (slot3 == GuildMember.DUTY_DEPUTY_COMMANDER or slot3 == GuildMember.DUTY_COMMANDER) and slot3 < slot2

	setToggleEnabled(slot0.dutyBtn, slot5)
	setGray(slot0.dutyBtn, not slot5, true)

	slot6 = (slot3 == GuildMember.DUTY_DEPUTY_COMMANDER or slot3 == GuildMember.DUTY_COMMANDER) and slot3 < slot2

	setToggleEnabled(slot0.fireBtn, slot6)
	setGray(slot0.fireBtn, not slot6, true)
end

slot2 = {
	"commander",
	"deputyCommander",
	"picked",
	"normal"
}

function slot0.showAppointPanel(slot0, slot1)
	slot0:openButtons(slot0.appiontPanel)

	slot0.isShowAppoint = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.appiontPanel)
	setActive(slot0.appiontPanel, true)

	if slot0.selectedToggle then
		setActive(slot0.selectedToggle:Find("Image3"), false)
	end

	slot3 = slot0.guildVO:getEnableDuty(slot0.guildVO:getDutyByMemberId(slot0.playerVO.id), slot1.duty)
	slot4 = nil

	for slot8, slot9 in ipairs(uv0) do
		if slot1.duty == slot8 then
			setText(slot0.dutyContainer:Find(slot9):Find("Text"), i18n("guild_duty_tip_1"))
		elseif not table.contains(slot3, slot8) then
			setText(slot11, i18n("guild_duty_tip_2"))
		end

		setActive(slot11, not table.contains(slot3, slot8))
		setToggleEnabled(slot10, table.contains(slot3, slot8))
		onToggle(slot0, slot10, function (slot0)
			if slot0 then
				uv0 = uv1
				uv2.selectedToggle = uv3
			end
		end, SFX_PANEL)
	end

	if slot0.guildVO:getFaction() == Guild.FACTION_TYPE_BLHX then
		slot0.print.color = Color.New(0.4235294117647059, 0.6313725490196078, 0.9568627450980393)
	elseif slot5 == Guild.FACTION_TYPE_CSZZ then
		slot0.print.color = Color.New(0.9568627450980393, 0.44313725490196076, 0.42745098039215684)
	end

	slot0.nameTF.text = slot1.name
	slot6 = AttireFrame.attireFrameRes(slot1, isSelf, AttireConst.TYPE_ICON_FRAME, slot1.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot6, slot6, true, function (slot0)
		if IsNil(uv0._tf) then
			return
		end

		if uv0.appiontCircle then
			slot0.name = uv1
			findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(slot0, uv0.appiontCircle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}):getPainting(), function (slot0)
		if not IsNil(uv0.iconTF) then
			uv0.iconTF.sprite = slot0
		end
	end)

	for slot13 = slot0.starsTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1 do
		cloneTplTo(slot0.starTF, slot0.starsTF)
	end

	for slot13 = 1, slot9 do
		setActive(slot0.starsTF:GetChild(slot13 - 1), slot13 <= slot7.star)
	end

	slot0.levelTF.text = "Lv." .. slot1.level

	onButton(slot0, slot0.confirmBtn, function ()
		uv0:setDuty(uv1.id, uv2)
	end, SFX_CONFIRM)
end

function slot0.showFirePanel(slot0, slot1)
	slot0:openButtons(slot0.firePanel)

	slot0.isShowFire = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.firePanel)
	setActive(slot0.firePanel, true)

	slot0.firenameTF.text = slot1.name
	slot2 = AttireFrame.attireFrameRes(slot1, isSelf, AttireConst.TYPE_ICON_FRAME, slot1.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot2, slot2, true, function (slot0)
		if IsNil(uv0._tf) then
			return
		end

		if uv0.fireframeCircle then
			slot0.name = uv1
			findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(slot0, uv0.fireframeCircle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}):getPainting(), function (slot0)
		if not IsNil(uv0.fireiconTF) then
			uv0.fireiconTF.sprite = slot0
		end
	end)

	slot0.fireduty.sprite = GetSpriteFromAtlas("dutyicon", "icon_" .. slot1.duty)

	for slot10 = slot0.firestarsTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1 do
		cloneTplTo(slot0.firestarTF, slot0.firestarsTF)
	end

	for slot10 = 1, slot6 do
		setActive(slot0.firestarsTF:GetChild(slot10 - 1), slot10 <= slot3.star)
	end

	slot0.firelevelTF.text = "Lv." .. slot1.level

	onButton(slot0, slot0.fireconfirmBtn, function ()
		if uv0.id == uv1.playerVO.id then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_fire_tip"),
			onYes = function ()
				uv0:emit(GuildMemberMediator.FIRE, uv1.id)
				uv0:closeButtons()
				uv0:closeFirePanel()
			end
		})
	end, SFX_CONFIRM)
	onButton(slot0, slot0.firecancelBtn, function ()
		uv0:closeButtons()
		uv0:closeFirePanel()
	end, SFX_CONFIRM)
	onButton(slot0, slot0.firePanel, function ()
		uv0:closeButtons()
		uv0:closeFirePanel()
	end, SFX_CONFIRM)
end

function slot0.showImpeachPanel(slot0, slot1)
	slot0:openButtons(slot0.impeachPanel)

	slot0.isShowImpeach = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.impeachPanel)
	setActive(slot0.impeachPanel, true)

	slot0.impeachnameTF.text = slot1.name
	slot2 = AttireFrame.attireFrameRes(slot1, isSelf, AttireConst.TYPE_ICON_FRAME, slot1.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot2, slot2, true, function (slot0)
		if IsNil(uv0._tf) then
			return
		end

		if uv0.impeachCirCle then
			slot0.name = uv1
			findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(slot0, uv0.impeachCirCle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}):getPainting(), function (slot0)
		if not IsNil(uv0.impeachiconTF) then
			uv0.impeachiconTF.sprite = slot0
		end
	end)

	slot0.impeachduty.sprite = GetSpriteFromAtlas("dutyicon", "icon_" .. slot1.duty)

	for slot10 = slot0.impeachstarTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1 do
		cloneTplTo(slot0.impeachstarTF, slot0.impeachstarsTF)
	end

	for slot10 = 1, slot6 do
		setActive(slot0.impeachstarsTF:GetChild(slot10 - 1), slot10 <= slot3.star)
	end

	slot0.impeachlevelTF.text = "Lv." .. slot1.level

	onButton(slot0, slot0.impeachconfirmBtn, function ()
		if uv0.id == uv1.playerVO.id then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_impeach_tip"),
			onYes = function ()
				uv0:emit(GuildMemberMediator.IMPEACH, uv1.id)
				uv0:closeButtons()
				uv0:closeimpeachPanel()
			end
		})
	end, SFX_CONFIRM)
	onButton(slot0, slot0.impeachcancelBtn, function ()
		uv0:closeButtons()
		uv0:closeimpeachPanel()
	end, SFX_CONFIRM)
	onButton(slot0, slot0.impeachPanel, function ()
		uv0:closeButtons()
		uv0:closeimpeachPanel()
	end, SFX_CONFIRM)
end

slot3 = {
	{
		value = "shipCount",
		type = 1,
		tag = i18n("friend_resume_ship_count")
	},
	{
		type = 3,
		tag = i18n("friend_resume_collection_rate"),
		value = {
			"collectionCount"
		}
	},
	{
		value = "attackCount",
		type = 1,
		tag = i18n("friend_resume_attack_count")
	},
	{
		type = 2,
		tag = i18n("friend_resume_attack_win_rate"),
		value = {
			"attackCount",
			"winCount"
		}
	},
	{
		value = "pvp_attack_count",
		type = 1,
		tag = i18n("friend_resume_manoeuvre_count")
	},
	{
		type = 2,
		tag = i18n("friend_resume_manoeuvre_win_rate"),
		value = {
			"pvp_attack_count",
			"pvp_win_count"
		}
	},
	{
		value = "collect_attack_count",
		type = 1,
		tag = i18n("friend_event_count")
	}
}

function slot0.showInfoPanel(slot0, slot1)
	slot0:openButtons(slot0.infoPanel)

	slot2 = slot0.contextData.memberVO
	slot0.isShowinfo = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.infoPanel)
	setActive(slot0.infoPanel, true)

	slot0.infonameTF.text = slot2.name
	slot3 = AttireFrame.attireFrameRes(slot2, isSelf, AttireConst.TYPE_ICON_FRAME, slot2.propose)

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot3, slot3, true, function (slot0)
		if IsNil(uv0._tf) then
			return
		end

		if uv0.infoCircle then
			slot0.name = uv1
			findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

			setParent(slot0, uv0.infoCircle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot2.icon,
		skin_id = slot2.skinId
	}):getPainting(), function (slot0)
		if not IsNil(uv0.infoiconTF) then
			uv0.infoiconTF.sprite = slot0
		end
	end)

	slot0.infoduty.sprite = GetSpriteFromAtlas("dutyicon", "icon_" .. slot2.duty)

	for slot11 = slot0.infostarsTF.childCount, pg.ship_data_statistics[slot2.icon].star - 1 do
		cloneTplTo(slot0.infostarTF, slot0.infostarsTF)
	end

	for slot11 = 1, slot7 do
		setActive(slot0.infostarsTF:GetChild(slot11 - 1), slot11 <= slot4.star)
	end

	slot0.infolevelTF.text = "Lv." .. slot2.level

	for slot11, slot12 in ipairs(uv0) do
		slot13 = slot0.resumeInfo:GetChild(slot11 - 1)

		setText(slot13:Find("tag"), slot12.tag)

		if slot12.type == 1 then
			setText(slot13:Find("tag (1)"), slot1[slot12.value])
		elseif slot12.type == 2 then
			setText(slot14, string.format("%0.2f", math.max(slot1[slot12.value[2]], 0) / math.max(slot1[slot12.value[1]], 1) * 100) .. "%")
		elseif slot12.type == 3 then
			setText(slot14, string.format("%0.2f", (slot1[slot12.value[1]] or 1) / getProxy(CollectionProxy):getCollectionTotal() * 100) .. "%")
		end
	end

	onButton(slot0, slot0.infoPanel, function ()
		uv0:closeButtons()
		uv0:closeInfoPanel()
	end, SFX_CONFIRM)
end

function slot0.closeInfoPanel(slot0)
	slot0.isShowinfo = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.infoPanel, slot0._tf)
	setActive(slot0.infoPanel, false)

	if slot0.infoCircle.childCount > 0 then
		slot1 = slot0.infoCircle:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1.name, slot1.name, slot1)
	end
end

function slot0.closeimpeachPanel(slot0)
	slot0.isShowImpeach = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.impeachPanel, slot0._tf)
	setActive(slot0.impeachPanel, false)

	if slot0.impeachCirCle.childCount > 0 then
		slot1 = slot0.impeachCirCle:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1.name, slot1.name, slot1)
	end
end

function slot0.closeFirePanel(slot0)
	slot0.isShowFire = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.firePanel, slot0._tf)
	setActive(slot0.firePanel, false)

	if slot0.fireframeCircle.childCount > 0 then
		slot1 = slot0.fireframeCircle:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1.name, slot1.name, slot1)
	end
end

function slot0.closeAppointPanel(slot0)
	slot0.isShowAppoint = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.appiontPanel, slot0._tf)
	setActive(slot0.appiontPanel, false)
	slot0:closeButtons()

	if slot0.appiontCircle.childCount > 0 then
		slot1 = slot0.appiontCircle:GetChild(0).gameObject

		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1.name, slot1.name, slot1)
	end
end

function slot0.openButtons(slot0, slot1)
	slot0:closePrevPanel()
	setParent(slot0.buttonsPanel, slot1)
	setAnchoredPosition(slot0.buttonsPanel, Vector2(775, 285))
end

function slot0.closeButtons(slot0)
	slot0.toggleGroup:SetAllTogglesOff()
	setParent(slot0.buttonsPanel, slot0._tf)
	setAnchoredPosition(slot0.buttonsPanel, Vector2(-641, -380))
end

function slot0.setDuty(slot0, slot1, slot2)
	slot0:emit(GuildMemberMediator.SET_DUTY, slot1, slot2)
end

function slot0.onUpdateItem(slot0, slot1, slot2)
	if not slot0.items[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.items[slot2]
	end

	slot4 = slot0.memberVOs[slot1 + 1]

	slot3:update(slot4, slot0.guildVO, slot4.id == slot0.curItemId)
end

function slot0.sortMembers(slot0)
	if not slot0.sortIndex then
		slot0.sortIndex = uv0[3]
	end

	slot1 = slot0.sortIndex[1]
	slot2 = slot0.sortIndex[2]

	if slot0.selectAsc then
		table.sort(slot0.memberVOs, function (slot0, slot1)
			if slot0[uv0[1]] == slot1[uv0[1]] then
				return slot1.duty < slot0.duty
			elseif uv0[1] == "duty" then
				return slot1[uv0[1]] < slot0[uv0[1]]
			else
				return slot0[uv0[1]] < slot1[uv0[1]]
			end
		end)
	else
		table.sort(slot0.memberVOs, function (slot0, slot1)
			if slot0[uv0[1]] == slot1[uv0[1]] then
				return slot0.duty < slot1.duty
			elseif uv0[1] == "duty" then
				return slot0[uv0[1]] < slot1[uv0[1]]
			else
				return slot1[uv0[1]] < slot0[uv0[1]]
			end
		end)
	end

	slot0.rectRect:SetTotalCount(#slot0.memberVOs, 0)
end

function slot0.showSortPanel(slot0)
	slot0.isShowSortPanel = true

	setActive(slot0.sortPanel, true)

	if not slot0.isInitSort then
		slot0.isInitSort = true
	end
end

function slot0.closeSortPanel(slot0)
	slot0.isShowSortPanel = nil

	setActive(slot0.sortPanel, false)
end

function slot0.onBackPressed(slot0)
	if not slot0:closePrevPanel() then
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		slot0:emit(uv0.ON_BACK)
	end
end

function slot0.closePrevPanel(slot0)
	if slot0.isShowAppoint then
		slot0:closeAppointPanel()
	elseif slot0.isShowFire then
		slot0:closeFirePanel()
	elseif slot0.isShowImpeach then
		slot0:closeimpeachPanel()
	elseif slot0.isShowinfo then
		slot0:closeInfoPanel()
	else
		return false
	end

	return true
end

function slot0.willExit(slot0)
	slot4 = slot0._tf

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.rightPanel, slot4)
	slot0:closeAppointPanel()
	slot0:closeFirePanel()
	slot0:closeimpeachPanel()
	slot0:closeInfoPanel()

	for slot4, slot5 in pairs(slot0.Timer) do
		slot5:Stop()
	end

	slot0.Timer = nil

	for slot4, slot5 in pairs(slot0.items) do
		slot5:dispose()
	end
end

return slot0
