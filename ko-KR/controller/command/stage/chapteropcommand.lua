slot0 = class("ChapterOpCommand", import(".ChapterOpRoutine"))

function slot0.execute(slot0, slot1)
	if slot1:getBody().type == ChapterConst.OpSwitch then
		for slot8, slot9 in ipairs(getProxy(ChapterProxy):getActiveChapter().fleets) do
			if slot9.id == slot2.id then
				slot4.findex = slot8

				break
			end
		end

		slot3:updateChapter(slot4, bit.bor(ChapterConst.DirtyStrategy, ChapterConst.DirtyFleet))

		slot8.type = slot2.type

		slot0:sendNotification(GAME.CHAPTER_OP_DONE, {})
		pg.TipsMgr.GetInstance():ShowTips(i18n("formation_switch_success", slot4.fleet.name))

		return
	elseif slot2.type == ChapterConst.OpSkipBattle then
		slot4 = getProxy(ChapterProxy):getActiveChapter()
		slot6 = slot4.fleet.line
		slot7 = nil

		if slot4:existChampion(slot6.row, slot6.column) then
			slot8 = slot4:getChampion(slot6.row, slot6.column)

			slot8:Iter()

			slot7 = slot8.attachment

			if slot8.flag == 1 and slot5 then
				slot5.defeatEnemies = slot5.defeatEnemies + 1
				slot4.defeatEnemies = slot4.defeatEnemies + 1

				slot4:RemoveChampion(slot8)
			end
		else
			slot8 = slot4:getChapterCell(slot6.row, slot6.column)
			slot8.flag = 1

			slot4:updateChapterCell(slot8)

			slot7 = slot8.attachment

			if slot5 then
				slot5.defeatEnemies = slot5.defeatEnemies + 1
				slot4.defeatEnemies = slot4.defeatEnemies + 1
			end
		end

		if slot7 ~= ChapterConst.AttachAmbush and _.detect(slot4.achieves, function (slot0)
			return slot0.type == ChapterConst.AchieveType2
		end) then
			slot8.count = slot8.count + 1
		end

		slot5.restAmmo = math.max(slot5.restAmmo - 1, 0)

		slot3:updateChapter(slot4)

		if slot7 ~= ChapterConst.AttachBoss then
			slot11.score = ys.Battle.BattleConst.BattleScore.S
			slot12.row = slot5.line.row
			slot12.column = slot5.line.column
			slot11.line = {}
			slot11.type = slot7

			slot3:RecordLastDefeatedEnemy(slot4.id, {})
		end
	end

	slot6.act = slot2.type
	slot6.group_id = defaultValue(slot2.id, 0)
	slot6.act_arg_1 = slot2.arg1
	slot6.act_arg_2 = slot2.arg2

	pg.ConnectionMgr.GetInstance():Send(13103, {}, 13104, function (slot0)
		if slot0.result == 0 then
			slot1 = false
			slot2 = getProxy(ChapterProxy)

			uv0:initData(uv1, slot0, slot2:getActiveChapter())
			uv0:doDropUpdate()

			if uv0.chapter then
				uv0:doMapUpdate()
				uv0:doAIUpdate()
				uv0:doShipUpdate()
				uv0:doBuffUpdate()
				uv0:doCellFlagUpdate()
				uv0:doExtraFlagUpdate()

				if uv1.type == ChapterConst.OpRetreat then
					if slot3:getPlayType() == ChapterConst.TypeMainSub and (uv1.win or not slot3:isValid()) then
						slot3:retreat(uv1.win)
						slot3:clearSubChapter()
						slot2:updateChapter(slot3)

						slot7.type = uv1.type
						slot7.win = uv1.win

						uv0:sendNotification(GAME.CHAPTER_OP_DONE, {})

						return
					end

					uv0:doRetreat()
				elseif uv1.type == ChapterConst.OpMove then
					uv0:doCollectAI()
					uv0:doMove()
				elseif uv1.type == ChapterConst.OpBox then
					uv0:doCollectAI()
					uv0:doOpenBox()
				elseif uv1.type == ChapterConst.OpStory then
					uv0:doCollectAI()
					uv0:doPlayStory()
				elseif uv1.type == ChapterConst.OpAmbush then
					uv0:doAmbush()
				elseif uv1.type == ChapterConst.OpStrategy then
					uv0:doCollectAI()
					uv0:doStrategy()
				elseif uv1.type == ChapterConst.OpRepair then
					uv0:doRepair()
				elseif uv1.type == ChapterConst.OpSupply then
					uv0:doSupply()
				elseif uv1.type == ChapterConst.OpEnemyRound then
					uv0:doCollectAI()
					uv0:doEnemyRound()
				elseif uv1.type == ChapterConst.OpSubState then
					uv0:doSubState()
				elseif uv1.type == ChapterConst.OpBarrier then
					uv0:doBarrier()
				elseif uv1.type == ChapterConst.OpRequest then
					uv0:doRequest()
				elseif uv1.type == ChapterConst.OpSkipBattle then
					uv0:doSkipBattle()
				elseif uv1.type == ChapterConst.OpSubTeleport then
					uv0:doTeleportSub()
				end

				if uv1.type ~= ChapterConst.OpEnemyRound and uv1.type ~= ChapterConst.OpMove then
					uv0.flag = bit.bor(uv0.flag, uv0.extraFlag)
				end

				slot2:updateChapter(uv0.chapter, uv0.flag)

				slot4 = uv0
				slot7.type = uv1.type
				slot7.id = uv1.id
				slot7.arg1 = uv1.arg1
				slot7.arg2 = uv1.arg2
				slot7.path = slot0.move_path
				slot7.fullpath = uv0.fullpath
				slot7.items = uv0.items
				slot7.exittype = uv1.exittype or 0
				slot7.aiActs = uv0.aiActs
				slot7.extraFlag = uv0.extraFlag or 0
				slot7.oldLine = uv1.ordLine
				slot7.extraFlagRemoveList = slot0.del_flag_list
				slot7.extraFlagAddList = slot0.add_flag_list
				slot7.win = uv1.win

				slot4.sendNotification(slot4, GAME.CHAPTER_OP_DONE, {})
			end
		else
			warning(string.format("SLG操作%d 请求失效，重新拉取信息", uv1.type))
			pg.TipsMgr.GetInstance():ShowTips(errorTip("levelScene_operation", slot0.result))

			if uv1.type ~= ChapterConst.OpRequest and uv1.type ~= ChapterConst.OpRetreat and uv1.type ~= ChapterConst.OpSubTeleport then
				slot4.type = ChapterConst.OpRequest
				slot4.id = uv1.id

				uv0:sendNotification(GAME.CHAPTER_OP, {})
			end
		end
	end)
end

return slot0
