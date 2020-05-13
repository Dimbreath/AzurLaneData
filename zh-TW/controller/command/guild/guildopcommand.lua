slot0 = class("GuildOpCommand", import("..stage.ChapterOpRoutine"))

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = getProxy(GuildProxy)

	if not slot3:getData() or not slot3:getGuildEvent() then
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
			uv0:initData(uv1, slot0, getProxy(ChapterProxy):getGuildChapter())
			uv0:doDropUpdate()

			if uv0.chapter and uv0.chapter:inWartime() then
				uv0:doMapUpdate()
				uv0:doShipUpdate()

				if uv1.type == ChapterConst.OpRetreat then
					uv0:doRetreat()
				elseif uv1.type == ChapterConst.OpMove then
					uv0:doMove()
				elseif uv1.type == ChapterConst.OpBox then
					uv0:doOpenBox()
				elseif uv1.type == ChapterConst.OpAmbush then
					uv0:doAmbush()
				elseif uv1.type == ChapterConst.OpStrategy then
					uv0:doStrategy()
				elseif uv1.type == ChapterConst.OpRepair then
					uv0:doRepair()
				elseif uv1.type == ChapterConst.OpSupply then
					uv0:doSupply()
				elseif uv1.type == ChapterConst.OpRequest then
					uv0:doRequest()
				elseif uv1.type == ChapterConst.OpSkipBattle then
					uv0:doSkipBattle()
				end

				slot1:updateGuildChapter(uv0.chapter, uv0.flag)
				uv0:sendNotification(GAME.GUILD_OP_DONE, {
					type = uv1.type,
					id = uv1.id,
					path = slot0.move_path,
					fullpath = uv0.fullpath,
					items = uv0.items,
					extraFlag = uv0.extraFlag or 0
				})
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_op_error", slot0.result))

			if uv1.type ~= ChapterConst.OpRequest and uv1.type ~= ChapterConst.OpRetreat then
				uv0:sendNotification(GAME.GUILD_OP, {
					type = ChapterConst.OpRequest,
					id = uv1.id
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
	slot1 = slot0.chapter
	slot1.repairTimes = slot1.repairTimes + 1
	slot2, slot3, slot4 = ChapterConst.GetShamRepairParams()

	if slot2 < slot1.repairTimes then
		slot5 = getProxy(PlayerProxy)
		slot6 = slot5:getData()

		slot6:consume({
			gem = slot4
		})
		slot5:updatePlayer(slot6)
	end
end

return slot0
