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
		slot0:closeButtons()
		slot0.closeButtons:closeAppointPanel()
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
		slot0:onInitItem(slot0)
	end

	function slot0.rectRect.onUpdateItem(slot0, slot1)
		slot0:onUpdateItem(slot0, slot1)
	end

	function slot0.rectRect.onStart()
		pg.UIMgr.GetInstance():LoadingOff()
		pg.UIMgr.GetInstance().LoadingOff:reloadPainting()
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
	function slot3(slot0, slot1)
		if slot0.Timer[slot0] then
			slot0.Timer[slot0]:Stop()

			slot0.Timer[slot0] = nil
		end

		slot0.Timer[slot0] = Timer.New(slot1, 1, -1)

		slot0.Timer[slot0]:Start()
		slot0.Timer[slot0].func()
	end

	return {
		go = slot1,
		tf = tf(slot1),
		iconTF = ()["tf"]:Find("shipicon/icon"):GetComponent(typeof(Image)),
		starsTF = ()["tf"]:Find("shipicon/stars"),
		starTF = ()["tf"]:Find("shipicon/stars/star"),
		levelTF = ()["tf"]:Find("level/Text"):GetComponent(typeof(Text)),
		nameTF = ()["tf"]:Find("name_bg/Text"):GetComponent(typeof(Text)),
		dutyTF = ()["tf"]:Find("duty"):GetComponent(typeof(Image)),
		livenessTF = ()["tf"]:Find("liveness/Text"):GetComponent(typeof(Text)),
		onLine = ()["tf"]:Find("online_tag"),
		offLine = ()["tf"]:Find("last_time"),
		onLineLabel = ()["tf"]:Find("online"),
		offLineLabel = ()["tf"]:Find("offline"),
		offLineText = ()["tf"]:Find("last_time/Text"):GetComponent(typeof(Text)),
		maskTF = ()["tf"]:Find("mask"),
		timerTF = ()["tf"]:Find("mask/Text"):GetComponent(typeof(Text)),
		borderTF = ()["tf"]:Find("selected"),
		bg = ()["tf"]:Find("bg"),
		circle = ()["tf"]:Find("shipicon/frame"),
		clear = function (slot0)
			if slot0.circle.childCount > 0 then
				PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot2, slot0.circle:GetChild(0).gameObject.name, slot0.circle.GetChild(0).gameObject)
			end
		end,
		dispose = function (slot0)
			slot0:clear()
		end,
		update = function (slot0, slot1, slot2, slot3)
			slot0:clear()
			setActive(slot0.borderTF, slot3)
			setActive(slot0.bg, not slot3)

			slot0.memberVO = slot1

			LoadSpriteAsync("qicon/" .. Ship.New({
				configId = slot1.icon,
				skin_id = slot1.skinId,
				propose = slot1.proposeTime
			}).getPainting(slot5), function (slot0)
				if not IsNil(slot0.iconTF) then
					slot0.iconTF.sprite = slot0
				end
			end)
			PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot6, slot6, true, function (slot0)
				if slot0.circle then
					slot0.name = slot1
					findTF(slot0.transform, "icon").GetComponent(slot1, typeof(Image)).raycastTarget = false

					setParent(slot0, slot0.circle, false)
				else
					PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)
				end
			end)

			slot0.dutyTF.sprite = GetSpriteFromAtlas("dutyicon", slot1.duty)

			for slot12 = slot0.starsTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1, 1 do
				cloneTplTo(slot0.starTF, slot0.starsTF)
			end

			for slot12 = 1, slot8, 1 do
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
				slot0.offLineText.text = getOfflineTimeStamp(slot1.preOnLineTime)
			end

			setActive(slot0.maskTF, slot1.duty == GuildMember.DUTY_COMMANDER and slot2:inKickTime())

			if slot1.duty == GuildMember.DUTY_COMMANDER and slot2.inKickTime() then
				slot1(slot1.id, function ()
					if slot0:getKickLeftTime() > 0 then
						slot1.timerTF.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
					else
						slot1.timerTF.text = ""

						setActive(slot1.maskTF, false)
					end
				end)
			end
		end
	}
end

function slot0.onInitItem(slot0, slot1)
	onButton(slot0, slot0:createMemberCard(slot1).tf, function ()
		setActive(slot0.borderTF, true)

		if slot1.curItemId and slot1.curItemId ~= slot0.memberVO.id and slot1:getItemById(slot1.curItemId) then
			setActive(slot0.borderTF, false)
		end

		slot1:loadPainting(slot0.memberVO)

		slot1.curItemId = slot0.memberVO.id
	end, SFX_PANEL)

	slot0.items[slot1] = slot0.createMemberCard(slot1)
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
	}).getPainting(slot4), "chuanwu", function ()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
	onToggle(slot0, slot0.infoBtn, function (slot0)
		if slot0 then
			slot0.contextData.memberVO = slot0.contextData

			slot0:emit(GuildMemberMediator.OPEN_DESC_INFO, slot0.emit)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.dutyBtn, function (slot0)
		if slot0 then
			if slot0.id == slot1.playerVO.id then
				return
			end

			slot1:showAppointPanel(slot0)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.fireBtn, function (slot0)
		if slot0 then
			slot0:showFirePanel(slot0.showFirePanel)
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0.impeachBtn, function (slot0)
		if slot0 then
			slot0:showImpeachPanel(slot0.showImpeachPanel)
		end
	end, SFX_PANEL)
	setActive(slot0.impeachBtn, slot3 == GuildMember.DUTY_DEPUTY_COMMANDER and slot2 == GuildMember.DUTY_COMMANDER and slot1:isLongOffLine())
	setToggleEnabled(slot0.dutyBtn, (slot3 == GuildMember.DUTY_DEPUTY_COMMANDER or slot3 == GuildMember.DUTY_COMMANDER) and slot3 < slot2)
	setGray(slot0.dutyBtn, not ((slot3 == GuildMember.DUTY_DEPUTY_COMMANDER or slot3 == GuildMember.DUTY_COMMANDER) and slot3 < slot2), true)
	setToggleEnabled(slot0.fireBtn, (slot3 == GuildMember.DUTY_DEPUTY_COMMANDER or slot3 == GuildMember.DUTY_COMMANDER) and slot3 < slot2)
	setGray(slot0.fireBtn, not ((slot3 == GuildMember.DUTY_DEPUTY_COMMANDER or slot3 == GuildMember.DUTY_COMMANDER) and slot3 < slot2), true)
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

	slot3 = slot0.guildVO:getEnableDuty(slot2, slot1.duty)
	slot4 = nil

	for slot8, slot9 in ipairs(slot0) do
		slot11 = slot0.dutyContainer:Find(slot9).Find(slot10, "Text")

		if slot1.duty == slot8 then
			setText(slot11, i18n("guild_duty_tip_1"))
		elseif not table.contains(slot3, slot8) then
			setText(slot11, i18n("guild_duty_tip_2"))
		end

		setActive(slot11, not table.contains(slot3, slot8))
		setToggleEnabled(slot10, table.contains(slot3, slot8))
		onToggle(slot0, slot10, function (slot0)
			if slot0 then
				slot0 = slot1
				slot2.selectedToggle = slot3
			end
		end, SFX_PANEL)
	end

	if slot0.guildVO:getFaction() == Guild.FACTION_TYPE_BLHX then
		slot0.print.color = Color.New(0.4235294117647059, 0.6313725490196078, 0.9568627450980393)
	elseif slot5 == Guild.FACTION_TYPE_CSZZ then
		slot0.print.color = Color.New(0.9568627450980393, 0.44313725490196076, 0.42745098039215684)
	end

	slot0.nameTF.text = slot1.name

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot6, slot6, true, function (slot0)
		if IsNil(slot0._tf) then
			return
		end

		if slot0.appiontCircle then
			slot0.name = slot1
			findTF(slot0.transform, "icon").GetComponent(slot1, typeof(Image)).raycastTarget = false

			setParent(slot0, slot0.appiontCircle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}).getPainting(slot8), function (slot0)
		if not IsNil(slot0.iconTF) then
			slot0.iconTF.sprite = slot0
		end
	end)

	for slot13 = slot0.starsTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1, 1 do
		cloneTplTo(slot0.starTF, slot0.starsTF)
	end

	for slot13 = 1, slot9, 1 do
		setActive(slot0.starsTF:GetChild(slot13 - 1), slot13 <= slot7.star)
	end

	slot0.levelTF.text = "Lv." .. slot1.level

	onButton(slot0, slot0.confirmBtn, function ()
		slot0:setDuty(slot1.id, )
	end, SFX_CONFIRM)
end

function slot0.showFirePanel(slot0, slot1)
	slot0:openButtons(slot0.firePanel)

	slot0.isShowFire = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.firePanel)
	setActive(slot0.firePanel, true)

	slot0.firenameTF.text = slot1.name

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot2, slot2, true, function (slot0)
		if IsNil(slot0._tf) then
			return
		end

		if slot0.fireframeCircle then
			slot0.name = slot1
			findTF(slot0.transform, "icon").GetComponent(slot1, typeof(Image)).raycastTarget = false

			setParent(slot0, slot0.fireframeCircle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}).getPainting(slot4), function (slot0)
		if not IsNil(slot0.fireiconTF) then
			slot0.fireiconTF.sprite = slot0
		end
	end)

	slot0.fireduty.sprite = GetSpriteFromAtlas("dutyicon", "icon_" .. slot1.duty)

	for slot10 = slot0.firestarsTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1, 1 do
		cloneTplTo(slot0.firestarTF, slot0.firestarsTF)
	end

	for slot10 = 1, slot6, 1 do
		setActive(slot0.firestarsTF:GetChild(slot10 - 1), slot10 <= slot3.star)
	end

	slot0.firelevelTF.text = "Lv." .. slot1.level

	onButton(slot0, slot0.fireconfirmBtn, function ()
		if slot0.id == slot1.playerVO.id then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_fire_tip"),
			onYes = function ()
				slot0:emit(GuildMemberMediator.FIRE, slot1.id)
				slot0.emit:closeButtons()
				slot0.emit.closeButtons:closeFirePanel()
			end
		})
	end, SFX_CONFIRM)
	onButton(slot0, slot0.firecancelBtn, function ()
		slot0:closeButtons()
		slot0.closeButtons:closeFirePanel()
	end, SFX_CONFIRM)
	onButton(slot0, slot0.firePanel, function ()
		slot0:closeButtons()
		slot0.closeButtons:closeFirePanel()
	end, SFX_CONFIRM)
end

function slot0.showImpeachPanel(slot0, slot1)
	slot0:openButtons(slot0.impeachPanel)

	slot0.isShowImpeach = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.impeachPanel)
	setActive(slot0.impeachPanel, true)

	slot0.impeachnameTF.text = slot1.name

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot2, slot2, true, function (slot0)
		if IsNil(slot0._tf) then
			return
		end

		if slot0.impeachCirCle then
			slot0.name = slot1
			findTF(slot0.transform, "icon").GetComponent(slot1, typeof(Image)).raycastTarget = false

			setParent(slot0, slot0.impeachCirCle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot1.icon,
		skin_id = slot1.skinId
	}).getPainting(slot4), function (slot0)
		if not IsNil(slot0.impeachiconTF) then
			slot0.impeachiconTF.sprite = slot0
		end
	end)

	slot0.impeachduty.sprite = GetSpriteFromAtlas("dutyicon", "icon_" .. slot1.duty)

	for slot10 = slot0.impeachstarTF.childCount, pg.ship_data_statistics[slot1.icon].star - 1, 1 do
		cloneTplTo(slot0.impeachstarTF, slot0.impeachstarsTF)
	end

	for slot10 = 1, slot6, 1 do
		setActive(slot0.impeachstarsTF:GetChild(slot10 - 1), slot10 <= slot3.star)
	end

	slot0.impeachlevelTF.text = "Lv." .. slot1.level

	onButton(slot0, slot0.impeachconfirmBtn, function ()
		if slot0.id == slot1.playerVO.id then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_impeach_tip"),
			onYes = function ()
				slot0:emit(GuildMemberMediator.IMPEACH, slot1.id)
				slot0.emit:closeButtons()
				slot0.emit.closeButtons:closeimpeachPanel()
			end
		})
	end, SFX_CONFIRM)
	onButton(slot0, slot0.impeachcancelBtn, function ()
		slot0:closeButtons()
		slot0.closeButtons:closeimpeachPanel()
	end, SFX_CONFIRM)
	onButton(slot0, slot0.impeachPanel, function ()
		slot0:closeButtons()
		slot0.closeButtons:closeimpeachPanel()
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

	slot0.isShowinfo = true

	pg.UIMgr.GetInstance():BlurPanel(slot0.infoPanel)
	setActive(slot0.infoPanel, true)

	slot0.infonameTF.text = slot0.contextData.memberVO.name

	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot3, slot3, true, function (slot0)
		if IsNil(slot0._tf) then
			return
		end

		if slot0.infoCircle then
			slot0.name = slot1
			findTF(slot0.transform, "icon").GetComponent(slot1, typeof(Image)).raycastTarget = false

			setParent(slot0, slot0.infoCircle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)
		end
	end)
	LoadSpriteAsync("qicon/" .. Ship.New({
		configId = slot0.contextData.memberVO.icon,
		skin_id = slot0.contextData.memberVO.skinId
	}).getPainting(slot5), function (slot0)
		if not IsNil(slot0.infoiconTF) then
			slot0.infoiconTF.sprite = slot0
		end
	end)

	slot0.infoduty.sprite = GetSpriteFromAtlas("dutyicon", "icon_" .. slot0.contextData.memberVO.duty)

	for slot11 = slot0.infostarsTF.childCount, pg.ship_data_statistics[slot0.contextData.memberVO.icon].star - 1, 1 do
		cloneTplTo(slot0.infostarTF, slot0.infostarsTF)
	end

	for slot11 = 1, slot7, 1 do
		setActive(slot0.infostarsTF:GetChild(slot11 - 1), slot11 <= slot4.star)
	end

	slot0.infolevelTF.text = "Lv." .. slot2.level

	for slot11, slot12 in ipairs(slot0) do
		slot13 = slot0.resumeInfo:GetChild(slot11 - 1)

		setText(slot13:Find("tag"), slot12.tag)

		slot14 = slot13:Find("tag (1)")

		if slot12.type == 1 then
			setText(slot14, slot1[slot12.value])
		elseif slot12.type == 2 then
			setText(slot14, string.format("%0.2f", math.max(slot1[slot12.value[2]], 0) / math.max(slot1[slot12.value[1]], 1) * 100) .. "%")
		elseif slot12.type == 3 then
			setText(slot14, string.format("%0.2f", (slot1[slot12.value[1]] or 1) / getProxy(CollectionProxy):getCollectionTotal() * 100) .. "%")
		end
	end

	onButton(slot0, slot0.infoPanel, function ()
		slot0:closeButtons()
		slot0.closeButtons:closeInfoPanel()
	end, SFX_CONFIRM)
end

function slot0.closeInfoPanel(slot0)
	slot0.isShowinfo = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.infoPanel, slot0._tf)
	setActive(slot0.infoPanel, false)

	if slot0.infoCircle.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot0.infoCircle:GetChild(0).gameObject.name, slot0.infoCircle.GetChild(0).gameObject.name, slot0.infoCircle.GetChild(0).gameObject)
	end
end

function slot0.closeimpeachPanel(slot0)
	slot0.isShowImpeach = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.impeachPanel, slot0._tf)
	setActive(slot0.impeachPanel, false)

	if slot0.impeachCirCle.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot0.impeachCirCle:GetChild(0).gameObject.name, slot0.impeachCirCle.GetChild(0).gameObject.name, slot0.impeachCirCle.GetChild(0).gameObject)
	end
end

function slot0.closeFirePanel(slot0)
	slot0.isShowFire = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.firePanel, slot0._tf)
	setActive(slot0.firePanel, false)

	if slot0.fireframeCircle.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot0.fireframeCircle:GetChild(0).gameObject.name, slot0.fireframeCircle.GetChild(0).gameObject.name, slot0.fireframeCircle.GetChild(0).gameObject)
	end
end

function slot0.closeAppointPanel(slot0)
	slot0.isShowAppoint = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.appiontPanel, slot0._tf)
	setActive(slot0.appiontPanel, false)
	slot0:closeButtons()

	if slot0.appiontCircle.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot0.appiontCircle:GetChild(0).gameObject.name, slot0.appiontCircle.GetChild(0).gameObject.name, slot0.appiontCircle.GetChild(0).gameObject)
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

	slot3:update(slot0.memberVOs[slot1 + 1], slot0.guildVO, slot0.memberVOs[slot1 + 1].id == slot0.curItemId)
end

function slot0.sortMembers(slot0)
	if not slot0.sortIndex then
		slot0.sortIndex = slot0[3]
	end

	slot1 = slot0.sortIndex[1]
	slot2 = slot0.sortIndex[2]

	if slot0.selectAsc then
		table.sort(slot0.memberVOs, function (slot0, slot1)
			if slot0[slot0[1]] == slot1[slot0[1]] then
				return slot1.duty < slot0.duty
			elseif slot0[1] == "duty" then
				return slot1[slot0[1]] < slot0[slot0[1]]
			else
				return slot0[slot0[1]] < slot1[slot0[1]]
			end
		end)
	else
		table.sort(slot0.memberVOs, function (slot0, slot1)
			if slot0[slot0[1]] == slot1[slot0[1]] then
				return slot0.duty < slot1.duty
			elseif slot0[1] == "duty" then
				return slot0[slot0[1]] < slot1[slot0[1]]
			else
				return slot1[slot0[1]] < slot0[slot0[1]]
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
		playSoundEffect(SFX_CANCEL)
		slot0:emit(slot0.ON_BACK)
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
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.rightPanel, slot0._tf)
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
