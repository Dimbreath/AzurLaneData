return {
	{
		Tip = "tip_1920",
		Image = "event_all",
		ButtonName = "activityButton",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, true)
			onButton(slot0, slot1, function ()
				slot0:emit(MainUIMediator.GO_SCENE, {
					SCENE.ACTIVITY
				})
			end, SFX_PANEL)
		end
	},
	{
		Image = "event_map",
		ButtonName = "activity_map_btn",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2.isEnd() then
				onButton(slot0, slot1, function ()
					slot0:emit(MainUIMediator.ON_ACTIVITY_MAP, slot1.id)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_newyear",
		Tip = "tip_1920",
		CtorButton = function (slot0, slot1)
			if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd() and getProxy(MiniGameProxy):GetMiniGameData(3) and not slot3:GetRuntimeData("isInited") then
				slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
					3,
					1
				})
			end
		end,
		UpdateButton = function (slot0, slot1)
			if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) then
				slot3 = not slot2:isEnd()
			end

			setActive(slot1, slot3)

			if slot3 then
				slot6 = getProxy(MiniGameProxy).GetHubByHubId(slot5, slot4)
				slot7 = slot6.count

				if slot6:getConfig("reward_need") > slot6.usedtime or slot6.ultimate ~= 0 then
					slot8 = false
				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 45-45, warpins: 1 ---
					slot8 = true

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 46-50, warpins: 2 ---
					if not slot9() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 51-53, warpins: 1 ---
						slot10 = CygnetBathrobePage.IsTip()

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 54-56, warpins: 2 ---
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #2 57-58, warpins: 1 ---
						if not slot8 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 59-60, warpins: 1 ---
							slot11 = slot10

							if slot10 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 61-62, warpins: 0 ---
								slot11 = false

								if false then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 63-63, warpins: 1 ---
									slot11 = true
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #2 ---



					end
					--- END OF BLOCK #1 ---



				end

				slot10 = slot9() or CygnetBathrobePage.IsTip()

				setActive(slot1:Find("Tip"), slot7 > 0 or slot8 or slot9() or CygnetBathrobePage.IsTip())

				if slot7 > 0 or slot8 or slot9() or CygnetBathrobePage.IsTip() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 73-79, warpins: 1 ---
					slot12 = slot1:Find("Tip/Text")
					slot13 = nil

					if slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 80-81, warpins: 1 ---
						slot13 = "!"
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 82-84, warpins: 1 ---
						if slot7 > 0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 85-86, warpins: 1 ---
							slot13 = slot7
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 87-88, warpins: 1 ---
							if slot10 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 89-89, warpins: 1 ---
								slot13 = "!"
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 90-93, warpins: 4 ---
					setText(slot12, slot13 or "")

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #2 94-94, warpins: 1 ---
					slot16 = ""
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 95-95, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end

				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NEWYEAR_SQUARE)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_escort",
		ButtonName = "activity_escort",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			setActive(slot1, OPEN_ESCORT)
			onButton(slot0, slot1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0:emit(MainUIMediator.OPEN_ESCORT)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)

			return
			--- END OF BLOCK #0 ---



		end
	},
	{
		Tip = "tip",
		Image = "event_boss",
		ButtonName = "activity_boss",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-31, warpins: 1 ---
				slot4 = false
				slot5 = false

				if pg.activity_event_worldboss[slot2:getConfig("config_id")] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 32-34, warpins: 1 ---
					if slot7.time ~= "stop" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 35-44, warpins: 1 ---
						slot8 = pg.TimeMgr.GetInstance():parseTimeFromConfig(slot7.time[2])
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-46, warpins: 1 ---
						slot8 = false

						if false then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 47-47, warpins: 0 ---
							slot8 = true
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 48-49, warpins: 3 ---
					if slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 50-58, warpins: 1 ---
						if slot8 > pg.TimeMgr.GetInstance():GetServerTime() then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 59-60, warpins: 1 ---
							slot5 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 61-61, warpins: 1 ---
							slot5 = true
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 62-63, warpins: 4 ---
				if not slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 64-66, warpins: 1 ---
					if slot2.data2 == 1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 67-68, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 69-69, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 70-70, warpins: 2 ---
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 71-80, warpins: 1 ---
					if getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 81-88, warpins: 1 ---
						slot4 = ActivityBossPtData.New(slot8):CanGetAward()
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 89-101, warpins: 3 ---
				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					slot0:emit(MainUIMediator.GO_SCENE, {
						SCENE.ACT_BOSS_SPF
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 102-103, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	{
		ButtonName = "activity_ins",
		CtorButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			GetOrAddComponent(LayoutElement).ignoreLayout = true
			slot1.anchoredPosition = Vector2(104, -752.5)

			return
			--- END OF BLOCK #0 ---



		end,
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-50, warpins: 1 ---
				slot1:Find("icon"):GetComponent(typeof(Animator)).enabled = getProxy(InstagramProxy):ShouldShowTip()

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					slot0:emit(MainUIMediator.OPEN_INS)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 51-52, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	{
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_springfestival",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-36, warpins: 1 ---
				slot6 = getProxy(MiniGameProxy)
				slot7 = nil
				slot7 = getProxy(ActivityProxy):getActivityById(ActivityConst.BEAT_MONSTER_NIAN_2020)

				if not false and slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-42, warpins: 1 ---
					slot4 = slot7:readyToAchieve()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 43-50, warpins: 3 ---
				slot7 = slot5:getActivityById(ActivityConst.MONOPOLY_2020)

				if not slot4 and slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-56, warpins: 1 ---
					slot4 = slot7:readyToAchieve()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 57-58, warpins: 3 ---
				if not slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 59-65, warpins: 1 ---
					slot4 = getProxy(ColoringProxy):CheckTodayTip()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 66-67, warpins: 2 ---
				if not slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 68-71, warpins: 1 ---
					slot4 = RedPacketLayer.isShowRedPoint()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 72-80, warpins: 2 ---
				slot8 = slot6:GetHubByHubId(slot2:getConfig("config_id"))

				if not slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 81-84, warpins: 1 ---
					if slot8.count <= 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 85-86, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 87-87, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #5



				-- Decompilation error in this vicinity:
				--- BLOCK #5 88-100, warpins: 3 ---
				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SPRING_TOWN)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #5 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 101-101, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	{
		Tip = "tip",
		Image = "event_LanternFestival",
		ButtonName = "activity_LanternFestival",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityById(ActivityConst.LANTERNFESTIVAL) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-34, warpins: 1 ---
				if getProxy(MiniGameProxy).GetHubByHubId(slot4, slot2:getConfig("config_id")).count <= 0 or slot5.usedtime >= 7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-40, warpins: 2 ---
					slot6 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 41-41, warpins: 1 ---
					slot6 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 42-54, warpins: 2 ---
				setActive(slot1:Find("Tip"), slot6)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					pg.m02:sendNotification(GAME.GO_MINI_GAME, 10)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 55-55, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	{
		Tip = "tip",
		Image = "event_minigame",
		ButtonName = "activity_musicfestival",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-41, warpins: 1 ---
				slot5 = IdolMedalCollectionView.isHaveActivableMedal()
				slot6 = getProxy(ActivityProxy)

				function slot7()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					return getProxy(InstagramProxy):ShouldShowTip()
					--- END OF BLOCK #0 ---



				end

				function slot8()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-8, warpins: 1 ---
					if slot0:getActivityById(ActivityConst.MUSIC_FESTIVAL_ID) and not slot0:isEnd() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 14-16, warpins: 1 ---
						return slot0:readyToAchieve()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 17-17, warpins: 3 ---
					return
					--- END OF BLOCK #1 ---



				end

				function slot9()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-8, warpins: 1 ---
					if slot0:getActivityById(ActivityConst.MUSIC_CHUIXUE7DAY_ID) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-13, warpins: 1 ---
						if not slot0:isEnd() then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 14-17, warpins: 1 ---
							slot1 = slot0:readyToAchieve()
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 18-19, warpins: 1 ---
							slot1 = false

							if false then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 20-20, warpins: 0 ---
								slot1 = true
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 21-21, warpins: 4 ---
					return slot1
					--- END OF BLOCK #1 ---



				end

				function slot10()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					if getProxy(MiniGameProxy).GetHubByHubId(slot0, 2).count <= 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 12-13, warpins: 1 ---
						slot2 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 14-14, warpins: 1 ---
						slot2 = true
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 15-15, warpins: 2 ---
					return slot2
					--- END OF BLOCK #1 ---



				end

				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.MUSIC_FESTIVAL)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)

				if not IdolPTPage.NeedTip() and not slot5 and not slot7() and not slot8() and not slot9() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 56-57, warpins: 1 ---
					slot11 = slot10()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 58-65, warpins: 6 ---
				setActive(slot1:Find("Tip"), slot11)

				return
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 66-75, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityById(ActivityConst.IDOL_MEDAL_COLLECTION) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-79, warpins: 1 ---
				slot5 = not slot4:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 80-85, warpins: 2 ---
			setActive(slot1, slot5)

			if slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 86-101, warpins: 1 ---
				setActive(slot1:Find("Tip"), slot6)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.IDOL_MEDAL_COLLECTION_SCENE)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 102-102, warpins: 3 ---
			--- END OF BLOCK #4 ---



		end
	},
	{
		Tip = "tip",
		Image = "event_LanternFestival",
		ButtonName = "activity_actpool",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-46, warpins: 1 ---
				slot4 = slot2:getAwardInfos()

				setActive(slot1:Find("Tip"), slot6)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					slot0:emit(MainUIMediator.ON_LOTTERY, slot1.id)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 47-48, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	{
		Tip = "tip",
		Image = "main_decodegame",
		ButtonName = "activity_decode",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, false)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-35, warpins: 1 ---
				slot6 = setActive
				slot7 = slot1

				if getProxy(MiniGameProxy).GetHubByHubId(slot4, slot2:getConfig("config_id")).id ~= 7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-37, warpins: 1 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-38, warpins: 1 ---
					slot8 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 39-43, warpins: 2 ---
				slot6(slot7, slot8)

				if slot5.count <= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 44-45, warpins: 1 ---
					slot6 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 46-46, warpins: 1 ---
					slot6 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 47-59, warpins: 2 ---
				setActive(slot1:Find("Tip"), slot6)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-14, warpins: 1 ---
					pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
						type = MiniGameRequestCommand.REQUEST_HUB_DATA,
						callback = function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-9, warpins: 1 ---
							pg.m02:sendNotification(GAME.GO_MINI_GAME, 11)

							return
							--- END OF BLOCK #0 ---



						end
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 60-60, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	LayoutProperty = {
		CellSize = Vector2(208, 215)
	},
	CurrentEntrancesList = {
		1,
		2,
		8,
		6,
		11
	}
}
