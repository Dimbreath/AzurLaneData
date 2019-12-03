slot0 = class("GuildRankLayer", import("..base.BaseUI"))

slot0.getUIName = function (slot0)
	return "GuildRankUI"
end

slot0.setGuildEvet = function (slot0, slot1)
	slot0.guildEvent = slot1
end

slot0.setSelfGuild = function (slot0, slot1)
	slot0.selfGuildVO = slot1
end

slot0.init = function (slot0)
	slot0.mainLayer = pg.UIMgr.GetInstance().UIMain
	slot0.topPanel = slot0:findTF("bg/top")
	slot0.awardBtn = slot0:findTF("bg/guild_panel/award_btn")
	slot0.guildTpl = slot0:getTpl("bg/guild_panel/main/content/request_tpl")
	slot0.guildContainer = slot0:findTF("bg/guild_panel/main/content")
	slot0.awardPanel = slot0:findTF("bg/award_panel")

	setActive(slot0.awardPanel, false)

	slot0.guildPanel = slot0:findTF("bg/guild_panel")

	setActive(slot0.guildPanel, true)

	slot0.awardTpl = slot0:getTpl("main/content/awardtpl", slot0.awardPanel)
	slot0.awardContainer = slot0:findTF("main/content", slot0.awardPanel)
	slot0.itemTpl = slot0:getTpl("awards/equipmenttpl", slot0.awardTpl)
	slot0.awardRank = slot0:findTF("bg/award_panel/rank_container/Text")
end

slot0.didEnter = function (slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	onButton(slot0, slot0:findTF("btnBack", slot0.topPanel), function (slot0)
		if slot0.inAwardPage then
			slot0:closeAwards()
		else
			slot0:emit(slot1.ON_CLOSE)
		end
	end, SOUND_BACK)
	onButton(slot0, slot0._tf, function ()
		if slot0.inAwardPage then
			slot0:closeAwards()
		else
			slot0:emit(slot1.ON_CLOSE)
		end
	end, SOUND_BACK)
	onButton(slot0, slot0.awardBtn, function ()
		slot0:showAwards()
	end, SOUND_BACK)
	slot0:disPlayerRank()
end

slot0.disPlayerRank = function (slot0)
	slot0.guildTFs = {}

	if slot0.guildEvent and not slot0.guildEvent:isEnd() then
		if not slot0.guildEvent:getRankList() or table.getCount(slot1) <= 0 then
			slot0:emit(GuildRankMediator.GET_RANK)
		else
			if not slot0.guildEvent:inGuildRank(slot0.selfGuildVO.id) then
				table.insert(slot1, slot0.selfGuildVO)
			end

			for slot6, slot7 in ipairs(slot1) do
				slot0.guildTFs[slot7.id] = cloneTplTo(slot0.guildTpl, slot0.guildContainer)

				slot0:updateGuild(slot7, slot6)
			end
		end
	end
end

slot0.updateGuild = function (slot0, slot1, slot2)
	setText(findTF(slot4, "name"), slot1.name)
	setText(findTF(slot4, "container/name"), slot1.playerName)
	setText(findTF(slot4, "container/policy"), slot1.totalDamage)
	setText(findTF(slot4, "count_container/count"), slot1:getFinishTime())
	setText(findTF(slot0.guildTFs[slot1.id], "value"), (slot0.selfGuildVO.id == slot1.id and slot0.guildEvent:getRank()) or slot2)
	setText(findTF(slot4, "lv/Text"), slot1.level)

	slot5 = JoinGuildLayer.getTheme(slot1:getFaction())
	slot4:Find("icon_frame"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", slot5 .. "_icon_frame")
	slot4:Find("icon_frame/icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", slot5 .. "_icon")
	slot4:GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/JoinGuildUI_atlas", slot5 .. "_frame")

	setActive(slot4:Find("check_mark"), slot0.selfGuildVO.id == slot1.id)
end

slot0.showAwards = function (slot0)
	slot0.inAwardPage = true

	setActive(slot0.awardPanel, true)
	setActive(slot0.guildPanel, false)

	if not slot0.isInitAwards then
		slot0.isInitAwards = true

		for slot5, slot6 in ipairs(pg.guild_boss_rank_awards.all) do
			slot0:updateAward(cloneTplTo(slot0.awardTpl, slot0.awardContainer), slot1[slot6])
		end
	end

	setText(slot0.awardRank, slot0.guildEvent:getRank())
end

slot0.updateAward = function (slot0, slot1, slot2)
	setText(slot1:Find("Text"), slot2.desc)

	for slot6, slot7 in ipairs(slot2.award_display) do
		updateDrop(cloneTplTo(slot0.itemTpl, slot1:Find("awards")), {
			type = slot7[1],
			id = slot7[2],
			count = slot7[3]
		})
	end
end

slot0.closeAwards = function (slot0)
	slot0.inAwardPage = nil

	setActive(slot0.awardPanel, false)
	setActive(slot0.guildPanel, true)
end

slot0.willExit = function (slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.mainLayer)
end

return slot0
