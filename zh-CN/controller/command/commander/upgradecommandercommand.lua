slot0 = class("UpgradeCommanderCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.materialIds
	slot5 = slot2.skillId

	if not getProxy(CommanderProxy):getCommanderById(slot2.id) then
		return
	end

	if not slot7:getSkill(slot5) then
		return
	end

	if slot7:isMaxLevel() and slot8:isMaxLevel() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_be_upgrade"))

		return
	end

	slot10 = getProxy(FleetProxy).getCommandersInFleet(slot9)

	if _.any(slot4, function (slot0)
		return table.contains(slot0, slot0)
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_anyone_is_in_fleet"))

		return
	end

	if getProxy(ChapterProxy):getActiveChapter() then
		_.each(slot11.fleets, function (slot0)
			if _.any(_.values(slot1), function (slot0)
				return slot0.id == slot0
			end) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_battle"))

				return
			end
		end)
	end

	slot12 = 0
	slot13 = 0
	slot14 = 0

	for slot18, slot19 in ipairs(slot4) do
		if not slot6:getCommanderById(slot19) or slot3 == slot19 then
			return
		end

		slot12 = slot12 + slot20:getUpgradeConsume()
		slot13 = slot13 + slot20:getDestoryedSkillExp(slot7.groupId)
		slot14 = slot14 + slot20:getDestoryedExp(slot7.groupId)
	end

	slot14 = math.floor(slot14)
	slot13 = math.floor(slot13)

	if getProxy(PlayerProxy).getData(slot15).gold < slot12 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(25008, {
		targetid = slot3,
		materialid = slot4
	}, 25009, function (slot0)
		if slot0.result == 0 then
			slot0:addExp(slot1)
			slot0.addExp:addExp(slot0.addExp)
			slot4:consume({
				gold = slot5
			})
			slot6:updatePlayer()
			slot7:updateCommander(slot0)
			slot8:sendNotification(GAME.COMMANDER_UPGRADE_DONE, {
				commander = slot0,
				oldCommander = Clone(slot0)
			})

			for slot5, slot6 in ipairs(slot9) do
				slot7:removeCommanderById(slot6)
				slot7:clearHardChapterCommanders(slot6)
				slot7:clearActivityCommanders(slot6)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("commander_play_erro", slot0.result))
		end
	end)
end

function slot0.clearHardChapterCommanders(slot0, slot1)
	for slot7, slot8 in pairs(slot3) do
		for slot13, slot14 in pairs(slot9) do
			for slot18, slot19 in pairs(slot14) do
				if slot19 == slot1 then
					slot8:updateCommander(slot13, slot18, nil)
					slot2:updateChapter(slot8)
				end
			end
		end
	end
end

function slot0.clearActivityCommanders(slot0, slot1)
	getProxy(FleetProxy):removeActivityFleetCommander(slot1)
end

return slot0
