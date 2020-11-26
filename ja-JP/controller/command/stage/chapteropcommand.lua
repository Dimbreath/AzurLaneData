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
		slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
			type = slot2.type
		})
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
			slot3:RecordLastDefeatedEnemy(slot4.id, {
				score = ys.Battle.BattleConst.BattleScore.S,
				line = {
					row = slot5.line.row,
					column = slot5.line.column
				},
				type = slot7
			})
		end
	end

	pg.ConnectionMgr.GetInstance():Send(13103, {
		act = slot2.type,
		group_id = defaultValue(slot2.id, 0),
		act_arg_1 = slot2.arg1,
		act_arg_2 = slot2.arg2
	}, 13104, function (slot0)
		if slot0.result == 0 then
			slot1 = false

			uv0:initData(uv1, slot0, getProxy(ChapterProxy):getActiveChapter())
			uv0:doDropUpdate()

			if uv0.chapter then
				uv0:doMapUpdate()
				uv0:doAIUpdate()
				uv0:doShipUpdate()
				uv0:doBuffUpdate()
				uv0:doCellFlagUpdate()
				uv0:doExtraFlagUpdate()

				if uv1.type == ChapterConst.OpRetreat then
					if not uv1.id then
						uv1.win = uv0.chapter:CheckChapterWillWin()

						if uv1.win then
							uv0.chapter:UpdateProgressOnRetreat()
						end

						slot4 = pg.TimeMgr.GetInstance()

						if uv1.win and slot2:getMapById(slot3:getConfig("map")):getMapType() == Map.ELITE and slot4:IsSameDay(slot3:getStartTime(), slot4:GetServerTime()) then
							getProxy(DailyLevelProxy):EliteCountPlus()
						end

						if slot3:getPlayType() == ChapterConst.TypeMainSub and (uv1.win or not slot3:isValid()) then
							slot3:retreat(uv1.win)
							slot3:clearSubChapter()
							slot2:updateChapter(slot3)
							uv0:sendNotification(GAME.CHAPTER_OP_DONE, {
								type = uv1.type,
								win = uv1.win
							})

							return
						end
					end

					uv0:doRetreat()
				elseif uv1.type == ChapterConst.OpMove then
					uv0:doCollectAI()
					uv0:doMove()
					uv0:doTeleportByPortal()
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
					uv0:doTeleportByPortal()
				end

				if uv1.type ~= ChapterConst.OpEnemyRound and uv1.type ~= ChapterConst.OpMove then
					uv0.flag = bit.bor(uv0.flag, uv0.extraFlag)
				end

				slot2:updateChapter(uv0.chapter, uv0.flag)
				uv0:sendNotification(GAME.CHAPTER_OP_DONE, {
					type = uv1.type,
					id = uv1.id,
					arg1 = uv1.arg1,
					arg2 = uv1.arg2,
					path = slot0.move_path,
					fullpath = uv0.fullpath,
					items = uv0.items,
					exittype = uv1.exittype or 0,
					aiActs = uv0.aiActs,
					extraFlag = uv0.extraFlag or 0,
					oldLine = uv1.ordLine,
					extraFlagRemoveList = slot0.del_flag_list,
					extraFlagAddList = slot0.add_flag_list,
					win = uv1.win,
					teleportPaths = uv0.teleportPaths
				})
			end
		else
			warning(string.format("SLG操作%d 请求失效，重新拉取信息", uv1.type))
			pg.TipsMgr.GetInstance():ShowTips(errorTip("levelScene_operation", slot0.result))

			if uv1.type ~= ChapterConst.OpRequest and uv1.type ~= ChapterConst.OpRetreat and uv1.type ~= ChapterConst.OpSubTeleport then
				uv0:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest,
					id = uv1.id
				})
			end
		end
	end)
end

function slot0.PrepareChapterRetreat(slot0)
	seriesAsync({
		function (slot0)
			if getProxy(ChapterProxy):getActiveChapter():CheckChapterWillWin() then
				slot1:UpdateProgressOnRetreat()

				slot3 = slot1:getConfig("defeat_story")

				table.eachAsync(slot1:getConfig("defeat_story_count"), function (slot0, slot1, slot2)
					if uv0.defeatCount < slot1 then
						slot2()

						return
					end

					if uv1[slot0] and type(slot3) == "number" and not pg.NewStoryMgr.GetInstance():IsPlayed(tostring(slot3)) then
						pg.m02:sendNotification(GAME.STORY_UPDATE, {
							storyId = tostring(slot3)
						})
						pg.m02:sendNotification(GAME.BEGIN_STAGE, {
							system = SYSTEM_PERFORM,
							stageId = slot3,
							exitCallback = slot2
						})
					elseif slot3 and type(slot3) == "string" then
						pg.NewStoryMgr.GetInstance():Play(slot3, slot2)
					else
						slot2()
					end
				end, slot0)

				return
			end

			slot0()
		end,
		function (slot0)
			pg.m02:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
			slot0()
		end,
		slot0
	})
end

return slot0
