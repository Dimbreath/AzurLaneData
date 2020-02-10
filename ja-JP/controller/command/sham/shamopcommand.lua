slot0 = class("ShamOpCommand", import("..stage.ChapterOpRoutine"))

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot6.act = slot2.type
	slot6.group_id = defaultValue(slot2.id, 0)
	slot6.act_arg_1 = slot2.arg1
	slot6.act_arg_2 = slot2.arg2

	pg.ConnectionMgr.GetInstance():Send(23004, {}, 23005, function (slot0)
		if slot0.result == 0 then
			uv0:initData(uv1, slot0, getProxy(ChapterProxy):getShamChapter())
			uv0:doDropUpdate()

			if uv0.chapter then
				if uv0.chapter:inWartime() then
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

					slot1:updateShamChapter(uv0.chapter, uv0.flag)

					slot3 = uv0
					slot6.type = uv1.type
					slot6.id = uv1.id
					slot6.path = slot0.move_path
					slot6.fullpath = uv0.fullpath
					slot6.items = uv0.items
					slot6.extraFlag = uv0.extraFlag or 0

					slot3.sendNotification(slot3, GAME.SHAM_OP_DONE, {})
				end
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("sham_op_error", slot0.result))

			if uv1.type ~= ChapterConst.OpRequest and uv1.type ~= ChapterConst.OpRetreat then
				slot4.type = ChapterConst.OpRequest
				slot4.id = uv1.id

				uv0:sendNotification(GAME.SHAM_OP, {})
			end
		end
	end)
end

function slot0.doRetreat(slot0)
	slot1 = slot0.chapter

	slot1:retreat()

	slot1.shamResetCount = slot1.shamResetCount + 1
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
		slot6, slot7, slot8 = slot4:getStgConsume(slot5.id)

		if slot6 then
			slot3:updateShipStg(slot6, slot5.id, slot8 + 1)
			pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_use", slot5.name))
		end
	end

	slot0.flag = bit.bor(slot1, ChapterConst.DirtyStrategy)
end

function slot0.doRepair(slot0)
	slot1 = slot0.chapter
	slot1.repairTimes = slot1.repairTimes + 1
	slot2, slot3, slot9.gem = ChapterConst.GetShamRepairParams()

	if slot2 < slot1.repairTimes then
		slot5 = getProxy(PlayerProxy)
		slot6 = slot5:getData()

		slot6:consume({})
		slot5:updatePlayer(slot6)
	end
end

return slot0
