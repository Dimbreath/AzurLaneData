slot0 = class("GuildFacilityLayer", import("..base.BaseUI"))
slot1 = 0.3

function slot0.getUIName(slot0)
	if getProxy(GuildProxy):getData() then
		return slot1:getFacilityUIName()
	end
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1

	slot0.resPanel:setResources(slot1)
end

function slot0.getPlayerJurisdiction(slot0)
	return slot0.guildVO:getDutyByMemberId(slot0.playerVO.id) == GuildMember.DUTY_COMMANDER or slot1 == GuildMember.DUTY_DEPUTY_COMMANDE
end

function slot0.setGuildVO(slot0, slot1)
	slot0.guildVO = slot1

	slot0:updateGuildResources()
	slot0:setFacilityVOs(slot1.facilitys or {})
	slot0:setFacilityLogs(slot1.facilityLogs or {})
end

function slot0.setFacilityLogs(slot0, slot1)
	slot0.facilityLogs = slot1
end

function slot0.addFacilityLogs(slot0, slot1)
	_.each(slot1, function (slot0)
		table.insert(uv0.facilityLogs, slot0)
	end)
end

function slot0.setFacilityVOs(slot0, slot1)
	slot0.facilityVOs = slot1 or {}
end

function slot0.getContributeProjectConfig(slot0)
	return pg.guild_contribution_template
end

function slot0.init(slot0)
	slot0.projectToggles = {}
	slot0.oilTotalTxt = slot0:findTF("top_panel/res/Text"):GetComponent(typeof(Text))
	slot0._playerResOb = slot0:findTF("res")
	slot0.resPanel = PlayerResource.New()

	tf(slot0.resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0.overlayer = pg.UIMgr.GetInstance().OverlayMain

	SetParent(slot0._tf, slot0.overlayer)

	slot0.facilitysContainer = slot0:findTF("main_panel/scrollrect/content")
	slot0.facilityTpl = slot0:getTpl("facility_tpl", slot0.facilitysContainer)
	slot0.contributeBtn = slot0:findTF("top_panel/contribute_btn")
	slot0.contributionPanel = slot0:findTF("contribution_panel")

	setActive(slot0.contributionPanel, false)

	slot0.contributeLogBtn = slot0:findTF("top_panel/contribute_log_btn")
	slot0.contributtionLogPanel = slot0:findTF("contribution_log_panel")
	slot0.contributtionLogFrame = slot0:findTF("contribution_log_panel/frame")
	slot0.logPanelHeight = slot0.contributtionLogFrame.rect.height
	slot0.contributtionLogFrame.anchoredPosition = Vector2(0, 0)

	setActive(slot0.contributtionLogPanel, false)

	slot0.contributionConfig = slot0:getContributeProjectConfig()
end

function slot0.didEnter(slot0)
	slot0.isCommander = slot0:getPlayerJurisdiction()

	slot0:initFacilitys()
	onButton(slot0, slot0.contributeBtn, function ()
		if uv0.guildVO:inJoinColdTime() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_facility_new_member_limit"))

			return
		end

		uv0:openContributeProject()
	end, SFX_PANEL)
	onButton(slot0, slot0.contributeLogBtn, function ()
		uv0:openContributionLog()
	end, SFX_PANEL)
	onButton(slot0, slot0.contributtionLogPanel, function ()
		uv0:closeContributionLog()
	end, SFX_PANEL)
end

function slot0.initFacilitys(slot0)
	slot0.facilityTFs = {}

	for slot4, slot5 in pairs(slot0.facilityVOs) do
		slot0.facilityTFs[slot5.id] = cloneTplTo(slot0.facilityTpl, slot0.facilitysContainer)
	end

	slot0:updateFacilitys()
end

function slot0.updateFacilitys(slot0)
	for slot4, slot5 in pairs(slot0.facilityVOs) do
		slot0:updateFacilityTF(slot5)
	end
end

function slot0.updateFacilityTF(slot0, slot1)
	if slot0.facilityTFs[slot1.id] then
		slot0:updateFacility(slot2, slot1)
	end
end

function slot0.updateFacility(slot0, slot1, slot2)
	setText(slot0:findTF("name_container/name", slot1), slot2:getConfig("name"))
	setText(slot0:findTF("name_container/Text", slot1), "Lv." .. slot2.level)
	setText(slot0:findTF("desc", slot1, slot1), slot2:getAdditionDesc())
	LoadImageSpriteAsync(slot2:getConfig("icon"), slot0:findTF("icon", slot1), true)

	slot3 = ""
	slot4 = "MAX"
	slot5 = 1

	if not slot2:isMaxLevel() then
		slot3 = i18n("guild_facility_next_level", GuildFacility.New({
			id = slot2.id,
			level = slot2.level + 1
		}):getAdditionDesc())
		slot6 = nil
		slot8 = slot2:getUpgradeConsume()
		slot4 = slot8
		slot5 = slot0.guildVO.resource / slot8
	end

	setText(slot0:findTF("next_desc", slot1, slot1), slot3)
	setText(slot0:findTF("store/advance", slot1), slot4)
	setText(slot0:findTF("store/current", slot1), slot0.guildVO.resource)
	setSlider(slot0:findTF("store/value", slot1), 0, 1, slot5)
	setActive(slot0:findTF("upgrade_btn", slot1), slot0.isCommander)

	if slot0.isCommander then
		onButton(slot0, slot0:findTF("upgrade_btn", slot1), function ()
			slot0, slot1 = uv0:canUpgrade(uv1.guildVO.resource, uv1.guildVO.level)

			if not slot0 then
				pg.TipsMgr.GetInstance():ShowTips(slot1)

				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_facility_upgrade_confirm", uv0:getUpgradeConsume()),
				onYes = function ()
					uv0:emit(GuildFacilityMediator.ON_UPGRADE, uv1.id)
				end
			})
		end, SFX_PANEL)
	end
end

function slot0.updateGuildResources(slot0)
	if slot0.guildVO then
		slot0.oilTotalTxt.text = slot0.guildVO.resource
	end
end

function slot0.openContributeProject(slot0)
	setActive(slot0.contributionPanel, true)

	if not slot0.isinitContributeProject then
		slot0.isinitContributeProject = true

		slot0:initContributeProject()
	else
		slot0:filterContributeProject(2)
	end
end

function slot0.closeContributeProject(slot0)
	setActive(slot0.contributionPanel, false)

	if slot0.selectedProjectId then
		triggerToggle(slot0.projectToggles[slot0.selectedProjectId], false)
	end
end

function slot0.initContributeProject(slot0)
	slot0.contributeResContainer = slot0:findTF("frame/res_container/content", slot0.contributionPanel)
	slot0.resTpl = slot0:getTpl("item", slot0.contributeResContainer)
	slot0.projectContainer = slot0:findTF("frame/main/content", slot0.contributionPanel)
	slot0.projectTpl = slot0:findTF("project", slot0.projectContainer)
	slot0.contributeConfirmBtn = slot0:findTF("frame/confirm_btn", slot0.contributionPanel)

	onButton(slot0, slot0.contributeConfirmBtn, function ()
		if not uv0.selectedProjectId then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_facility_selecte_res_project_tip"))

			return
		end

		uv0:emit(GuildFacilityMediator.ON_CONTRIBUTE, uv0.selectedProjectId)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("frame/cancel_btn", slot0.contributionPanel), function ()
		uv0:closeContributeProject()
	end, SFX_PANEL)
	onButton(slot0, slot0.contributionPanel, function ()
		uv0:closeContributeProject()
	end, SFX_PANEL)
	slot0:initContributeResType()
end

function slot0.initContributeResType(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.contributionConfig.all) do
		if not table.contains(slot1, slot0.contributionConfig[slot6].resource_type) then
			table.insert(slot1, slot7)
		end
	end

	slot0.contributeResTFs = {}

	_.each(slot1, function (slot0)
		slot1 = cloneTplTo(uv0.resTpl, uv0.contributeResContainer)

		table.insert(uv0.contributeResTFs, slot1)
		LoadImageSpriteAsync(Item.New({
			id = id2ItemId(slot0)
		}):getConfig("icon"), slot1:Find("icon_bg/icon"))
		onToggle(uv0, slot1, function (slot0)
			if slot0 then
				uv0:filterContributeProject(uv1)

				if uv0.selectedProjectTF then
					triggerToggle(uv0.selectedProjectTF, false)
				end
			end
		end, SFX_PANEL)
	end)
	triggerToggle(slot0.contributeResTFs[2], true)
end

function slot0.filterContributeProject(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.contributionConfig.all) do
		if not slot1 or slot1 and slot1 == slot0.contributionConfig[slot7].resource_type then
			table.insert(slot2, slot7)
		end
	end

	slot0:updateContributeProjects(slot2)
end

function slot0.updateContributeProjects(slot0, slot1)
	for slot6 = slot0.projectContainer.childCount, #slot1 - 1 do
		cloneTplTo(slot0.projectTpl, slot0.projectContainer)
	end

	for slot6 = 1, slot0.projectContainer.childCount do
		setActive(slot0.projectContainer:GetChild(slot6 - 1), slot6 <= #slot1)

		if slot6 <= #slot1 then
			slot0:updateContributeProject(slot7, slot1[slot6])
		end
	end
end

function slot0.updateContributeProject(slot0, slot1, slot2)
	slot0.projectToggles[slot2] = slot1
	slot3 = slot0.contributionConfig[slot2]

	setText(slot0:findTF("title", slot1), slot3.name)
	setText(slot0:findTF("content/desc_1", slot1), i18n("guild_facility_contribute_desc1", Item.New({
		id = id2ItemId(slot3.resource_type)
	}):getConfig("name"), slot3.consume))
	setText(slot0:findTF("content/desc_2", slot1), i18n("guild_facility_contribute_desc2", slot3.conversion))
	setText(slot0:findTF("content/desc_3", slot1), i18n("guild_facility_contribute_desc3", slot3.get_guild_coin))
	setActive(slot1:Find("mark"), false)
	setGray(slot0.contributeConfirmBtn, not slot0.selectedProjectId)
	onToggle(slot0, slot1, function (slot0)
		setGray(uv0.contributeConfirmBtn, not slot0, true)
		setActive(uv1, slot0)

		if slot0 then
			if uv2.consume <= uv0.playerVO:getResById(uv2.resource_type) then
				uv0.selectedProjectId = uv3
				uv0.selectedProjectTF = uv4
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_facility_selected_project_failed"))
			end
		else
			uv0.selectedProjectId = nil
			uv0.selectedProjectTF = nil
		end
	end)
end

function slot0.openContributionLog(slot0)
	setActive(slot0.contributtionLogPanel, true)
	slot0:tweeningLogPanel(slot0.logPanelHeight, function ()
	end)

	if not slot0.isInitLogPanel then
		slot0.isInitLogPanel = true

		slot0:initLogPanel()
	else
		slot0:filterLogs()
	end
end

slot0.LOG_PAGE = {
	RECENT = 1,
	CONTRIBUTION = 2,
	USAGE = 3
}

function slot0.initLogPanel(slot0)
	slot5 = slot0.contributtionLogPanel
	slot0.filterToggles = {
		slot0:findTF("frame/filter/recent", slot0.contributtionLogPanel),
		slot0:findTF("frame/filter/contribution", slot0.contributtionLogPanel),
		slot0:findTF("frame/filter/usage", slot5)
	}
	slot0.logContainer = slot0:findTF("frame/main/content", slot0.contributtionLogPanel)
	slot4 = slot0.logContainer
	slot0.logTPl = slot0:getTpl("log_tpl", slot4)

	for slot4, slot5 in ipairs(slot0.filterToggles) do
		onToggle(slot0, slot5, function (slot0)
			setActive(uv0:findTF("mask", uv1), not slot0)

			if slot0 then
				uv0:filterLogs(uv2)
			end
		end)
	end

	triggerToggle(slot0.filterToggles[1], true)
end

slot2 = 50

function slot0.filterLogs(slot0, slot1)
	slot1 = slot1 or slot0.contextData.page or uv0.LOG_PAGE.RECENT
	slot0.contextData.page = slot1
	slot2 = {}

	if slot1 == uv0.LOG_PAGE.RECENT then
		_(Clone(slot0.facilityLogs)):chain():sort(function (slot0, slot1)
			return slot1.time < slot0.time
		end):slice(1, uv1)
	elseif slot1 == uv0.LOG_PAGE.CONTRIBUTION then
		_.each(slot0.facilityLogs, function (slot0)
			if slot0.cmd == GuildLogInfo.CMD_TYPE_FACILITY_CONTRIBUTION then
				table.insert(uv0, slot0)
			end
		end)
		_.slice(slot2, 1, uv1)
	elseif slot1 == uv0.LOG_PAGE.USAGE then
		_.each(slot0.facilityLogs, function (slot0)
			if slot0.cmd == GuildLogInfo.CMD_TYPE_FACILITY_CONSUME then
				table.insert(uv0, slot0)
			end
		end)
		_.slice(slot2, 1, uv1)
	end

	slot0:updateLogsPanel(slot2)
end

function slot0.closeContributionLog(slot0)
	slot0:tweeningLogPanel(0, function ()
		setActive(uv0.contributtionLogPanel, false)
	end)
end

function slot0.tweeningLogPanel(slot0, slot1, slot2)
	if LeanTween.isTweening(go(slot0.contributtionLogFrame)) then
		LeanTween.cancel(go(slot0.contributtionLogFrame))
	end

	LeanTween.moveY(slot0.contributtionLogFrame, slot1, uv0):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end
	end))
end

function slot0.updateLogsPanel(slot0, slot1)
	if not slot0.logContainer then
		return
	end

	for slot6 = slot0.logContainer.childCount, #slot1 - 1 do
		cloneTplTo(slot0.logTPl, slot0.logContainer)
	end

	for slot6 = 1, slot0.logContainer.childCount do
		slot8 = slot6 <= #slot1

		setActive(slot0.logContainer:GetChild(slot6 - 1), slot8)

		if slot8 then
			slot0:updateLogTF(slot7, slot1[slot6])
		end
	end
end

function slot0.updateLogTF(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6, slot7 = slot2:getConent()

	setText(slot0:findTF("date", slot1), slot4)
	setScrollText(slot0:findTF("name/Text", slot1), slot3)
	setText(slot0:findTF("opera", slot1), slot5)
	setText(slot0:findTF("count", slot1), slot6)
	setScrollText(slot0:findTF("get/name", slot1), slot7)
end

function slot0.willExit(slot0)
	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end
end

return slot0
