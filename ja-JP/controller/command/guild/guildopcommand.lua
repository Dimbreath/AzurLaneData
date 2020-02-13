slot0 = class("GuildOpCommand", import("..stage.ChapterOpRoutine"))

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = getProxy(GuildProxy)
	slot5 = slot3:getGuildEvent()

	if not slot3:getData() or not slot5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(61004, {
		act = slot2.type,
		group_id = defaultValue(slot2.id, 0),
		act_arg_1 = slot2.arg1,
		act_arg_2 = slot2.arg2
	}, 61005, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(ChapterProxy)

			slot0:initData(slot1, slot0, slot1:getGuildChapter())
			slot0:doDropUpdate()

			if slot0.chapter and slot0.chapter:inWartime() then
				slot0:doMapUpdate()
				slot0:doShipUpdate()

				if slot1.type == ChapterConst.OpRetreat then
					slot0:doRetreat()
				elseif slot1.type == ChapterConst.OpMove then
					slot0:doMove()
				elseif slot1.type == ChapterConst.OpBox then
					slot0:doOpenBox()
				elseif slot1.type == ChapterConst.OpAmbush then
					slot0:doAmbush()
				elseif slot1.type == ChapterConst.OpStrategy then
					slot0:doStrategy()
				elseif slot1.type == ChapterConst.OpRepair then
					slot0:doRepair()
				elseif slot1.type == ChapterConst.OpSupply then
					slot0:doSupply()
				elseif slot1.type == ChapterConst.OpRequest then
					slot0:doRequest()
				elseif slot1.type == ChapterConst.OpSkipBattle then
					slot0:doSkipBattle()
				end

				slot1:updateGuildChapter(slot0.chapter, slot0.flag)
				slot0:sendNotification(GAME.GUILD_OP_DONE, {
					type = slot1.type,
					id = slot1.id,
					path = slot0.move_path,
					fullpath = slot0.fullpath,
					items = slot0.items,
					extraFlag = slot0.extraFlag or 0
				})
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_op_error", slot0.result))

			if pg.TipsMgr.GetInstance().ShowTips.type ~= ChapterConst.OpRequest and slot1.type ~= ChapterConst.OpRetreat then
				slot0:sendNotification(GAME.GUILD_OP, {
					type = ChapterConst.OpRequest,
					id = slot1.id
				})
			end
		end
	end)
end

function slot0.doRetreat(slot0)
	slot0.chapter:retreat()

	slot0.flag = 0
end

function slot0.doStrategy(slot0)
	slot1 = slot0.flag
	slot4 = slot0.chapter.fleet

	if pg.strategy_data_template[slot0.op.arg1].type == ChapterConst.StgTypeForm then
		for slot9, slot10 in ipairs(slot4.stgIds) do
			if pg.strategy_data_template[slot10].type == ChapterConst.StgTypeForm then
				slot4.stgIds[slot9] = slot5.id
			end
		end

		pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_change", slot5.name))
	elseif slot5.type == ChapterConst.StgTypeConsume then
		slot6, slot7, slot8 = slot3:getStgConsume(slot5.id)

		if slot6 and slot8 < slot7 then
			slot3:updateShipStg(slot6, slot5.id, slot8 + 1)
			pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_use", slot5.name))
		end
	end

	slot0.flag = bit.bor(slot1, ChapterConst.DirtyStrategy)
end

function slot0.doRepair(slot0)
	slot0.chapter.repairTimes = slot0.chapter.repairTimes + 1
	slot2, slot3, slot4 = ChapterConst.GetShamRepairParams()

	if slot2 < slot0.chapter.repairTimes then
		slot5 = getProxy(PlayerProxy)
		slot6 = slot5:getData()

		slot6:consume({
			gem = slot4
		})
		slot5:updatePlayer(slot6)
	end
end

return slot0
