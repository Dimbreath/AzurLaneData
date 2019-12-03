slot0 = class("GuildEventLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	if GuildEventLayer.UI_TYPE == Guild.FACTION_TYPE_BLHX then
		return "GuildEventBlueUI"
	elseif GuildEventLayer.UI_TYPE == Guild.FACTION_TYPE_CSZZ then
		return "GuildEventRedUI"
	end
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setEvent(slot0, slot1)
	slot0.guildEvent = slot1
end

function slot0.init(slot0)
	slot0.mainPanel = slot0:findTF("main")
	slot0.leftPanel = slot0:findTF("left", slot0.mainPanel)
	slot0.paintTF = slot0:findTF("painting", slot0.leftPanel)
	slot0.bossInfo = slot0:findTF("boss_info", slot0.leftPanel)
	slot0.shiptypeImg = slot0:findTF("ship_type/Image", slot0.bossInfo):GetComponent(typeof(Image))
	slot0.levelTxt = slot0:findTF("level_container/Text", slot0.bossInfo):GetComponent(typeof(Text))
	slot0.nameTxt = slot0:findTF("name", slot0.bossInfo):GetComponent(typeof(Text))
	slot0.hpRate = slot0:findTF("hp/Text", slot0.bossInfo):GetComponent(typeof(Text))
	slot0.hpBarImg = slot0:findTF("hp/bar", slot0.bossInfo):GetComponent(typeof(Image))
	slot0.buffTxt = slot0:findTF("buff/Text", slot0.bossInfo):GetComponent(typeof(Text))
	slot0.awardPanel = slot0:findTF("award_info", slot0.leftPanel)
	slot0.awardBtn = slot0:findTF("bg/award_btn", slot0.awardPanel)
	slot0.additionBtn = slot0:findTF("bg/addition_btn", slot0.awardPanel)
	slot0.combatBtn = slot0:findTF("bg/combat_btn", slot0.awardPanel)
	slot0.combatCountTxt = slot0:findTF("count_container/Text", slot0.combatBtn):GetComponent(typeof(Text))
	slot0.rightPanel = slot0:findTF("right", slot0.mainPanel)
	slot0.introTxt = slot0:findTF("intro/content/Text", slot0.rightPanel):GetComponent(typeof(Text))
	slot0.rankPanel = slot0:findTF("rank", slot0.rightPanel)
	slot0.myRankTxt = slot0:findTF("mine/Text", slot0.rankPanel):GetComponent(typeof(Text))
	slot0.rankContainer = slot0:findTF("list/container", slot0.rankPanel)
	slot0.rankTpl = slot0:getTpl("ranktpl", slot0.rankContainer)
	slot0.guildRankBtn = slot0:findTF("guild_rank", slot0.rightPanel)
	slot0.rightTopPanel = slot0:findTF("right_top", slot0.mainPanel)
	slot0.timeTxt = slot0:findTF("time_container/Text", slot0.rightTopPanel):GetComponent(typeof(Text))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.awardBtn, function ()
		slot0:emit(GuildEventMediator.OPEN_TASK)
	end, SFX_PANEL)
	onButton(slot0, slot0.additionBtn, function ()
		slot0:showAdditions()
	end, SFX_PANEL)
	onButton(slot0, slot0.combatBtn, function ()
		if slot0.guildEvent.count <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("less_count_to_combat"))

			return
		end

		slot0:emit(GuildEventMediator.ON_PRE_COMBAT)
	end, SFX_PANEL)
	onButton(slot0, slot0.guildRankBtn, function ()
		slot0:emit(GuildEventMediator.OPEN_RANK)
	end, SFX_PANEL)
	slot0:updateEvent()
	slot0:updateRankList()
end

function slot0.getBossMaxHp(slot0, slot1, slot2)
	return slot2.durability + slot2.durability_growth * (slot1 - 1) / 1000
end

function slot0.updateEvent(slot0)
	if slot0.guildEvent then
		slot0.levelTxt.text = slot0.guildEvent.bossLevel
		slot0.shiptypeImg.sprite = GetSpriteFromAtlas("shiptype", pg.enemy_data_statistics[pg.guild_boss_template[slot0.guildEvent.bossId].enemy_id].type)
		slot0.nameTxt.text = pg.enemy_data_statistics[pg.guild_boss_template[slot0.guildEvent.bossId].enemy_id].name
		slot0.hpRate.text = math.floor(slot0.guildEvent.bossHp / slot0:getBossMaxHp(slot0.guildEvent.bossLevel, slot2) * 100) .. "%"
		slot0.hpBarImg.fillAmount = slot0.guildEvent.bossHp / slot0.getBossMaxHp(slot0.guildEvent.bossLevel, slot2)
		slot6 = ""

		for slot10, slot11 in pairs(pg.guild_boss_template[slot0.guildEvent.bossId].display_buff_list) do
			slot6 = slot6 .. getSkillName(slot11) .. "\n"
		end

		slot0.buffTxt.text = slot6
		slot0.timeTxt.text = slot7 .. " - " .. slot8
		slot0.introTxt.text = i18n("guild_event_desc")
		slot0.combatCountTxt.text = slot0.guildEvent.count
	end
end

function slot0.updateRankList(slot0)
	if slot0.guildEvent and not slot0.guildEvent:isEnd() then
		if not slot0.guildEvent:getMemberRankList() or #slot1 <= 0 then
			slot0:emit(GuildEventMediator.GET_RANK_LIST)
		else
			for slot6 = slot0.rankContainer.childCount, #slot1 - 1, 1 do
				cloneTplTo(slot0.rankTpl, slot0.rankContainer)
			end

			for slot6 = 1, slot0.rankContainer.childCount, 1 do
				setActive(slot0.rankContainer:GetChild(slot6 - 1), slot6 <= #slot1)

				if slot6 <= #slot1 then
					slot0:updateRank(slot7, slot6)
				end
			end

			slot0.myRankTxt.text = "No." .. slot0.guildEvent:getMemberRank()
		end
	end
end

function slot0.updateRank(slot0, slot1, slot2)
	setText(slot1:Find("rank"), "No." .. slot2)
	setText(slot1:Find("name"), slot0.guildEvent:getMemberRankList()[slot2].name)
	setText(slot1:Find("value"), slot0.guildEvent.getMemberRankList()[slot2].getDamage(slot4))
	setActive(slot1:Find("arr"), slot0.guildEvent:getMemberRankList()[slot2].id == slot0.playerVO.id)
end

function slot0.showAdditions(slot0)
	return
end

function slot0.willExit(slot0)
	return
end

return slot0
