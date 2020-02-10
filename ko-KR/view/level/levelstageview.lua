slot0 = class("LevelStageView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "LevelStageView"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
	slot0:AddListener()

	chapter_skip_battle = PlayerPrefs.GetInt("chapter_skip_battle") or 0

	if Application.isEditor then
		function switch_chapter_skip_battle()
			chapter_skip_battle = 1 - chapter_skip_battle

			PlayerPrefs.SetInt("chapter_skip_battle", chapter_skip_battle)
			PlayerPrefs.Save()

			slot0 = pg.TipsMgr.GetInstance()

			slot0.ShowTips(slot0, chapter_skip_battle == 1 and "已开启战斗跳略" or "已关闭战斗跳略")
		end
	end

	slot0.loader = AutoLoader.New()
	slot0.isFrozen = nil

	setActive(slot0._tf, true)
end

function slot0.OnDestroy(slot0)
	if slot0.stageTimer then
		slot1 = slot0.stageTimer

		slot1:Stop()

		slot0.stageTimer = nil
	end

	if slot0.resPanel1 then
		slot1 = slot0.resPanel1

		slot1:exit()

		slot0.resPanel1 = nil
	end

	if not IsNil(slot0.winCondPanel) then
		slot1 = slot0.winCondPanel

		slot1:Destroy()

		slot0.winCondPanel = nil
	end

	if not IsNil(slot0.combomsg) then
		Destroy(slot0.combomsg)

		slot0.combomsg = nil

		if slot0.comboAnimId then
			LeanTween.cancel(slot0.comboAnimId)

			slot0.comboAnimId = nil
		end
	end

	slot0:ClearSubViews()

	slot1 = slot0.loader

	slot1:Clear()
end

slot1 = -300

function slot0.InitUI(slot0)
	slot0.topStage = slot0:findTF("top_stage", slot0._tf)
	slot0.resStage = slot0:findTF("resources", slot0.topStage)
	slot0.resPanel1 = PlayerResource.New()
	slot1 = slot0.resPanel1

	slot1:setParent(slot0.resStage, false)
	setActive(slot0.topStage, true)

	slot0.bottomStage = slot0:findTF("bottom_stage", slot0._tf)
	slot0.normalRole = findTF(slot0.bottomStage, "normal")
	slot0.funcBtn = slot0:findTF("func_button", slot0.normalRole)
	slot0.retreatBtn = slot0:findTF("retreat_button", slot0.normalRole)
	slot0.switchBtn = slot0:findTF("switch_button", slot0.normalRole)
	slot0.resetBtn = slot0:findTF("reset_button", slot0.normalRole)
	slot0.helpBtn = slot0:findTF("help_button", slot0.normalRole)
	slot0.shengfuBtn = slot0:findTF("shengfu/shengfu_button", slot0.normalRole)
	slot0.teleportSubRole = findTF(slot0.bottomStage, "teleportSub")
	slot0.deployBtn = slot0:findTF("confirm_button", slot0.teleportSubRole)
	slot0.undeployBtn = slot0:findTF("cancel_button", slot0.teleportSubRole)

	setActive(slot0.bottomStage, true)
	setAnchoredPosition(slot0.normalRole, {
		x = 0,
		y = 0
	})

	slot3.y = uv0

	setAnchoredPosition(slot0.teleportSubRole, {
		x = 0
	})
	setActive(slot0.teleportSubRole, false)

	slot0.leftStage = slot0:findTF("left_stage", slot0._tf)

	setActive(slot0.leftStage, true)

	slot0.rightStage = slot0:findTF("right_stage", slot0._tf)
	slot1 = slot0.rightStage
	slot0.bombPanel = slot1:Find("bomb_panel")
	slot0.panelBarrier = slot0:findTF("panel_barrier", slot0.rightStage)
	slot0.shamShopBtn = slot0:findTF("btn_sham_shop", slot0.rightStage)
	slot0.autoBattleBtn = slot0:findTF("event/collapse/lock_fleet", slot0.rightStage)
	slot0.showDetailBtn = slot0:findTF("event/detail/show_detail", slot0.rightStage)

	setActive(slot0.panelBarrier, false)
	setActive(slot0.rightStage, true)

	slot0.airSupremacy = slot0:findTF("msg_panel/air_supremacy", slot0.topStage)
	slot3.y = slot0.topStage.rect.height

	setAnchoredPosition(slot0.topStage, {})

	slot3.x = -slot0.leftStage.rect.width - 200

	setAnchoredPosition(slot0.leftStage, {})

	slot3.x = slot0.rightStage.rect.width + 200

	setAnchoredPosition(slot0.rightStage, {})

	slot3.y = -slot0.bottomStage.rect.height

	setAnchoredPosition(slot0.bottomStage, {})

	slot0.attachSubViews = {}
end

function slot0.AddListener(slot0)
	onButton(slot0, slot0:findTF("option", slot0.topStage), function ()
		slot0 = uv0

		slot0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("back_button", slot0.topStage), function ()
		if uv0.contextData.chapterVO and slot0:getDataType() == ChapterConst.TypeGuild then
			slot2 = uv0

			slot2:emit(uv1.ON_BACK)

			return
		end

		slot1 = uv0

		slot1:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(slot0, slot0.retreatBtn, function ()
		slot0 = uv0.contextData.chapterVO
		slot1 = uv0.contextData.map
		slot2 = "levelScene_whether_to_retreat"
		slot3 = nil

		if slot0:existOni() then
			slot2 = "levelScene_oni_retreat"
			slot3 = true
		elseif slot0:isPlayingWithBombEnemy() then
			slot2 = "levelScene_bomb_retreat"
			slot3 = true
		elseif slot0:getPlayType() == ChapterConst.TypeTransport and not slot1:isSkirmish() then
			slot2 = "levelScene_escort_retreat"
		end

		slot4 = uv0
		slot6.content = i18n(slot2)

		function slot6.onYes()
			slot0 = uv0
			slot3.type = ChapterConst.OpRetreat
			slot3.win = uv1

			slot0:emit(LevelMediator2.ON_OP, {})
		end

		slot4:HandleShowMsgBox({})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(slot0, slot0.switchBtn, function ()
		slot0 = uv0.contextData.chapterVO

		if slot0:getDataType() == ChapterConst.TypeSham then
			slot2 = uv0

			slot2:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
		elseif slot1 == ChapterConst.TypeNone then
			if slot0:getNextValidIndex() > 0 then
				slot3 = uv0
				slot6.type = ChapterConst.OpSwitch
				slot6.id = slot0.fleets[slot2].id

				slot3:emit(LevelMediator2.ON_OP, {})
			else
				slot3 = pg.TipsMgr.GetInstance()

				slot3:ShowTips(i18n("formation_switch_failed"))
			end
		elseif slot1 == ChapterConst.TypeGuild then
			slot2 = uv0

			slot2:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.resetBtn, function ()
		slot0 = uv0.contextData.chapterVO

		if slot0:getDataType() == ChapterConst.TypeSham then
			if ChapterConst.ShamResetCountLimit <= uv0.contextData.chapterVO.shamResetCount then
				slot1 = pg.TipsMgr.GetInstance()

				slot1:ShowTips(i18n("sham_reset_err_limit"))

				return
			end

			if uv0.contextData.chapterVO.active then
				slot1 = uv0
				slot3.content = i18n("sham_reset_confirm")

				function slot3.onYes()
					slot0 = uv0
					slot3.type = ChapterConst.OpRetreat

					slot0:emit(LevelMediator2.ON_OP, {})
				end

				slot1:HandleShowMsgBox({
					modal = true
				})
			else
				slot1 = uv0
				slot4.type = ChapterConst.OpRetreat

				slot1:emit(LevelMediator2.ON_OP, {})
			end
		elseif slot0 == ChapterConst.TypeGuild and uv0.contextData.chapterVO.active then
			slot1 = uv0
			slot3.content = i18n("sham_reset_confirm")

			function slot3.onYes()
				slot0 = uv0
				slot3.type = ChapterConst.OpRetreat

				slot0:emit(LevelMediator2.ON_OP, {})
			end

			slot1:HandleShowMsgBox({
				modal = true
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shamShopBtn, function ()
		slot0 = uv0

		slot0:emit(LevelUIConst.IS_FROZEN)

		if uv0.isFrozen then
			return
		end

		slot0 = uv0

		slot0:emit(LevelMediator2.ON_OPEN_SHAM_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0.autoBattleBtn, function ()
		slot0 = uv0

		slot0:emit(LevelUIConst.IS_FROZEN)

		if uv0.isFrozen then
			return
		end

		slot0 = getProxy(ChapterProxy)

		slot0:UpdateSkipPrecombat(not slot0:GetSkipPrecombat())

		slot2 = uv0

		slot2:UpdateSkipPreCombatMark()
	end, SFX_PANEL)
	onButton(slot0, slot0.showDetailBtn, function ()
		uv0._showStrategyDetail = not uv0._showStrategyDetail and true

		uv0:updateStageStrategy()
	end, SFX_PANEL)
	onButton(slot0, slot0.funcBtn, function ()
		slot0 = uv0.contextData.chapterVO
		slot1 = slot0:getDataType()

		if not slot0:inWartime() then
			slot2 = pg.TipsMgr.GetInstance()

			slot2:ShowTips(i18n("levelScene_time_out"))

			return
		end

		slot3 = slot0.fleet.line
		slot4 = slot0:getChapterCell(slot3.row, slot3.column)
		slot5 = false

		if slot0:existChampion(slot3.row, slot3.column) then
			slot5 = true

			if chapter_skip_battle == 1 then
				slot6 = uv0
				slot9.type = ChapterConst.OpSkipBattle
				slot9.id = slot2.id

				slot6:emit(LevelMediator2.ON_OP, {})
			elseif slot0:IsSkipPrecombat() then
				slot6 = uv0

				slot6:emit(LevelMediator2.ON_START)
			else
				slot6 = uv0

				slot6:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachAmbush and slot4.flag == 2 then
			slot6 = nil

			coroutine.wrap(function ()
				slot0 = uv0

				slot0:emit(LevelUIConst.DO_AMBUSH_WARNING, uv1)
				coroutine.yield()

				slot0 = uv0

				slot0:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, uv1)
				coroutine.yield()
			end)()

			slot5 = true
		elseif slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachBoss then
			if slot4.flag == 0 then
				slot5 = true

				if chapter_skip_battle == 1 then
					slot6 = uv0
					slot9.type = ChapterConst.OpSkipBattle
					slot9.id = slot2.id

					slot6:emit(LevelMediator2.ON_OP, {})
				elseif slot0:IsSkipPrecombat() then
					slot6 = uv0

					slot6:emit(LevelMediator2.ON_START)
				else
					slot6 = uv0

					slot6:emit(LevelMediator2.ON_STAGE)
				end
			end
		elseif slot4.attachment == ChapterConst.AttachBox then
			if slot4.flag == 0 then
				slot5 = true
				slot6 = uv0
				slot9.type = ChapterConst.OpBox
				slot9.id = slot2.id

				slot6:emit(LevelMediator2.ON_OP, {})
			end
		elseif slot4.attachment == ChapterConst.AttachSupply and slot4.attachmentId > 0 then
			slot5 = true
			slot6, slot7 = slot0:getFleetAmmo(slot0.fleet)

			if slot7 < slot6 then
				slot8 = uv0
				slot11.type = ChapterConst.OpSupply
				slot11.id = slot2.id

				slot8:emit(LevelMediator2.ON_OP, {})
			else
				slot8 = pg.TipsMgr.GetInstance()

				slot8:ShowTips(i18n("level_ammo_enough"))
			end
		elseif slot4.attachment == ChapterConst.AttachStory then
			slot5 = true
			slot6 = pg.StoryMgr.GetInstance()
			slot6 = slot6:GetStoryByName("index")
			slot8 = pg.map_event_template[slot4.attachmentId].gametip

			if pg.map_event_template[slot4.attachmentId].memory == 0 then
				return
			end

			slot10 = pg.ConnectionMgr.GetInstance()
			slot13.story_id = slot7

			slot10:Send(11017, {}, 11018, function (slot0)
			end)

			slot10 = pg.StoryMgr.GetInstance()

			slot10:Play(slot6[slot7], function ()
				slot0 = pg.StoryMgr.GetInstance()
				slot1 = slot0:getSelectedOptions() and (slot0[1] or 1) or 1

				if uv0.flag == 0 then
					slot2 = uv1
					slot5.type = ChapterConst.OpStory
					slot5.id = uv2.id
					slot5.arg1 = slot1

					slot2:emit(LevelMediator2.ON_OP, {})
				end

				if uv3 ~= "" then
					slot2 = nil

					for slot6, slot7 in pairs(pg.memory_template) do
						if slot7.story == uv4 then
							slot2 = slot7.title
						end
					end

					slot3 = pg.TipsMgr.GetInstance()

					slot3:ShowTips(i18n(uv3, slot2))
				end
			end)
		elseif slot4.attachment == ChapterConst.AttachRival then
			if slot4.flag == 0 then
				slot5 = true

				if slot2:isValid() then
					slot6 = uv0

					slot6:emit(LevelMediator2.ON_PVP, slot4.rival)
				else
					slot7 = uv0
					slot9.content = i18n("formation_reform_tip")

					function slot9.onYes()
						slot0 = uv0

						slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
					end

					slot7:HandleShowMsgBox({
						modal = true
					})
				end
			end
		elseif slot4.attachment == ChapterConst.AttachAreaBoss and slot4.flag == 0 then
			slot5 = true
			slot6 = uv0

			slot6:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end

		if not slot5 then
			if slot0:getRound() == ChapterConst.RoundEnemy then
				slot6 = uv0
				slot9.type = ChapterConst.OpEnemyRound

				slot6:emit(LevelMediator2.ON_OP, {})
			else
				slot6 = pg.TipsMgr.GetInstance()

				slot6:ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		if uv0.contextData.chapterVO then
			if slot0:getDataType() == ChapterConst.TypeSham then
				slot2 = uv0
				slot4.type = MSGBOX_TYPE_HELP
				slot4.helps = i18n("sham_battle_help_tip")

				slot2:HandleShowMsgBox({})
			elseif slot1 == ChapterConst.TypeGuild then
				slot2 = uv0
				slot4.type = MSGBOX_TYPE_HELP
				slot4.helps = i18n("guild_battle_help_tip")

				slot2:HandleShowMsgBox({})
			elseif slot1 == ChapterConst.TypeNone then
				if slot0:existOni() then
					slot2 = uv0
					slot4.type = MSGBOX_TYPE_HELP
					slot4.helps = i18n("levelScene_sphunt_help_tip")

					slot2:HandleShowMsgBox({})
				elseif slot0:isTypeDefence() then
					slot2 = uv0
					slot4.type = MSGBOX_TYPE_HELP
					slot4.helps = i18n("help_battle_defense")

					slot2:HandleShowMsgBox({})
				elseif slot0:isPlayingWithBombEnemy() then
					slot2 = uv0
					slot4.type = MSGBOX_TYPE_HELP
					slot4.helps = i18n("levelScene_bomb_help_tip")

					slot2:HandleShowMsgBox({})
				elseif pg.map_event_list[slot0.id] and pg.map_event_list[slot0.id].help_pictures and next(pg.map_event_list[slot0.id].help_pictures) ~= nil then
					slot2 = {
						disableScroll = true,
						pageMode = true,
						defaultpage = 1,
						ImageMode = true,
						windowSize = {
							x = 1263,
							y = 873
						},
						windowPos = {
							y = -70
						},
						helpSize = {
							x = 1176,
							y = 1024
						}
					}

					for slot6, slot7 in pairs(pg.map_event_list[slot0.id].help_pictures) do
						slot11.atlas = slot7
						slot10.icon = {
							path = ""
						}

						table.insert(slot2, {})
					end

					slot3 = uv0
					slot5.type = MSGBOX_TYPE_HELP
					slot5.helps = slot2

					slot3:HandleShowMsgBox({})
				else
					slot2 = uv0
					slot4.type = MSGBOX_TYPE_HELP
					slot4.helps = pg.gametip.help_level_ui.tip

					slot2:HandleShowMsgBox({})
				end
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.airSupremacy, function ()
		slot0 = pg.MsgboxMgr.GetInstance()
		slot2.type = MSGBOX_TYPE_HELP
		slot2.helps = i18n("help_battle_ac")

		slot0:ShowMsgBox({})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.deployBtn, function ()
		slot0 = uv0.contextData.chapterVO
		slot1, slot2 = slot0:GetSubmarineFleet()
		slot3 = slot1.startPos

		if not uv0.grid.subTeleportTargetLine then
			return
		end

		slot5, slot6 = slot0:findPath(nil, slot3, slot4)
		slot7 = uv0.grid
		slot8 = uv0.grid
		slot10 = pg.MsgboxMgr.GetInstance()
		slot12.content = i18n("tips_confirm_teleport_sub", slot7:TransformLine2PlanePos(slot3), slot8:TransformLine2PlanePos(slot4), slot5, math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #slot1:getShips(false) * slot5 - 1e-05))

		function slot12.onYes()
			slot0 = uv0
			slot3.type = ChapterConst.OpSubTeleport
			slot3.id = uv1.id
			slot3.arg1 = uv2.row
			slot3.arg2 = uv2.column

			slot0:emit(LevelMediator2.ON_OP, {})
		end

		slot10:ShowMsgBox({})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.undeployBtn, function ()
		slot0 = uv0

		slot0:SwitchBottomStage(false)

		slot0 = uv0.grid

		slot0:TurnOffSubTeleport()

		slot0 = uv0.grid

		slot0:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.shengfuBtn, function ()
		slot0 = uv0

		slot0:DisplayWinConditionPanel()
	end)
end

function slot0.SetSeriesOperation(slot0, slot1)
	slot0.seriesOperation = slot1
end

function slot0.SetGrid(slot0, slot1)
	slot0.grid = slot1
end

function slot0.SetPlayer(slot0, slot1)
	slot2 = slot0.resPanel1

	slot2:setResources(slot1)
end

function slot0.SwitchToChapter(slot0, slot1)
	slot2 = slot1:getDataType()
	slot5 = findTF(slot0.rightStage, "target")
	slot6 = findTF(slot0.rightStage, "skip_events")

	setActive(findTF(slot0.topStage, "msg_panel/ambush"), slot1:existAmbush())
	setActive(slot0.airSupremacy, OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0)
	setActive(findTF(slot0.topStage, "msg_panel/sham_progress"), slot2 == ChapterConst.TypeSham)
	setActive(slot0.shamShopBtn, slot2 == ChapterConst.TypeSham)

	if slot2 == ChapterConst.TypeSham then
		setActive(slot0.shamShopBtn, getProxy(ShopsProxy):getShamShop() ~= nil)
	end

	setActive(slot0.resetBtn, slot2 == ChapterConst.TypeSham or slot2 == ChapterConst.TypeGuild)
	setImageColor(slot0.resetBtn, slot2 == ChapterConst.TypeSham and ChapterConst.ShamResetCountLimit <= slot1.shamResetCount and Color(1, 1, 10, 0.5882352941176471) or Color(1, 1, 1, 1))

	slot7 = slot1:isLoop()

	setActive(slot0.autoBattleBtn, slot7)

	if slot7 then
		slot0:UpdateSkipPreCombatMark()
	end

	slot0.achieveOriginalY = -240

	setText(slot6:Find("Label"), i18n("map_event_skip"))

	if slot1:getConfig("event_skip") == 1 then
		if slot1.progress > 0 or slot1.defeatCount > 0 or slot1.passCount > 0 then
			setActive(slot6, true)

			slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY - 40)
			GetComponent(slot6, typeof(Toggle)).isOn = PlayerPrefs.GetInt("skip_events_on_" .. slot1.id, 1) == 1

			onToggle(slot0, slot6, function (slot0)
				PlayerPrefs.SetInt(uv0, slot0 and 1 or 0)
			end)
		else
			setActive(slot6, false)

			if not PlayerPrefs.HasKey(key) then
				PlayerPrefs.SetInt(key, 0)
			end
		end
	else
		setActive(slot6, false)

		slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY)
	end

	setActive(slot5, slot1:existAchieve())
	setActive(slot0.retreatBtn, slot2 == ChapterConst.TypeNone)
	slot0.seriesOperation()
end

function slot0.UpdateSkipPreCombatMark(slot0)
	slot0.loader:GetOffSpriteRequest(slot0.autoBattleBtn)
	slot0.loader:GetSprite("ui/levelstageview_atlas", getProxy(ChapterProxy):GetSkipPrecombat() and "auto_battle_on" or "auto_battle_off", slot0.autoBattleBtn, true)
end

function slot0.updateStageInfo(slot0)
	slot1 = slot0.contextData.chapterVO
	slot2 = slot1:getDataType()
	slot4 = findTF(slot0.topStage, "unlimit")

	setWidgetText(findTF(slot0.topStage, "timer"), "--:--:--")

	if slot0.stageTimer then
		slot5 = slot0.stageTimer

		slot5:Stop()
	end

	if slot1:getConfig("time") < slot1:getRemainTime() or slot1:getConfig("time") >= 8640000 then
		setActive(slot3, false)
		setActive(slot4, true)
	else
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.stageTimer = Timer.New(function ()
			if IsNil(uv0) then
				return
			end

			slot0 = uv1
			slot3 = pg.TimeMgr.GetInstance()

			setWidgetText(uv0, slot3:DescCDTime(slot0:getRemainTime()))
		end, 1, -1)
		slot5 = slot0.stageTimer

		slot5:Start()
		slot0.stageTimer.func()
	end
end

function slot0.updateAmbushRate(slot0, slot1, slot2)
	slot3 = slot0.contextData.chapterVO

	if not slot3:existAmbush() then
		return
	end

	slot4 = slot3.fleet
	slot5 = slot4:getInvestSums()
	slot6 = slot3:getAmbushRate(slot4, slot1)
	slot7 = ChapterConst.GetAmbushDisplay
	slot8 = (not slot2 or not slot3:existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column)) and slot6
	slot15, slot15 = slot7(slot8)
	slot12 = findTF(slot0.topStage, "msg_panel/ambush/value2")

	setText(findTF(slot0.topStage, "msg_panel/ambush/label1"), i18n("level_scene_title_word_1"))
	setText(findTF(slot0.topStage, "msg_panel/ambush/label2"), i18n("level_scene_title_word_2"))
	setText(findTF(slot0.topStage, "msg_panel/ambush/value1"), math.floor(slot5))
	setText(slot12, slot7)
	setTextColor(slot12, slot8)
end

function slot0.updateStageAchieve(slot0)
	slot1 = slot0.contextData.chapterVO

	if not slot1:existAchieve() then
		return
	end

	slot3 = findTF(slot0.rightStage, "target")

	setActive(slot3, true)

	slot4 = findTF(slot3, "detail")
	slot7 = findTF(slot4, "click")
	slot8 = findTF(slot3, "collapse")

	setActive(findTF(slot4, "achieve"), false)
	setActive(findTF(slot8, "star"), false)
	removeAllChildren(findTF(slot4, "achieves"))
	removeAllChildren(findTF(slot8, "stars"))

	for slot14, slot15 in ipairs(slot1.achieves) do
		slot16 = cloneTplTo(slot5, slot6)
		slot17 = ChapterConst.IsAchieved(slot15)

		setActive(findTF(slot16, "star"), slot17)

		slot18 = findTF(slot16, "desc")

		setText(slot18, ChapterConst.GetAchieveDesc(slot15.type, slot1))

		slot19 = setTextColor
		slot20 = slot18

		if not slot17 or not Color.yellow then
			slot21 = Color.white
		end

		slot19(slot20, slot21)

		slot19 = cloneTplTo(slot9, slot10)
		slot19:GetComponent(typeof(Image)).enabled = slot17
	end

	onButton(slot0, slot7, function ()
		shiftPanel(uv0, uv0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(slot0, slot8, function ()
		shiftPanel(uv0, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, uv1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)

	if not slot0.isAchieveFirstInit then
		slot0.isAchieveFirstInit = true

		triggerButton(slot7)
	end
end

function slot0.updateStageBarrier(slot0)
	slot1 = slot0.contextData.chapterVO

	setActive(slot0.panelBarrier, slot1:existOni())

	if slot1:existOni() then
		slot2 = slot0.panelBarrier
		slot2 = slot2:Find("btn_barrier")

		setText(slot2:Find("nums"), slot1.modelCount)
		onButton(slot0, slot2, function ()
			slot0 = uv0

			slot0:emit(LevelUIConst.IS_FROZEN)

			if uv0.isFrozen then
				return
			end

			if uv0.grid.quadState == ChapterConst.QuadStateStrategy then
				slot0 = uv0.grid

				slot0:updateQuadCells(ChapterConst.QuadStateNormal)

				return
			end

			slot0 = uv0.contextData.chapterVO
			slot1 = uv0

			slot1:selectSquareBarrieredCell(1, function (slot0, slot1)
				slot2 = uv0

				if not slot2:existBarrier(slot0, slot1) and uv0.modelCount <= 0 then
					return
				end

				slot2 = uv1
				slot5.type = ChapterConst.OpBarrier
				slot5.id = uv0.fleet.id
				slot5.arg1 = slot0
				slot5.arg2 = slot1

				slot2:emit(LevelMediator2.ON_OP, {})
			end)
		end, SFX_PANEL)
	end
end

function slot0.updateBombPanel(slot0, slot1)
	slot2 = slot0.contextData.chapterVO

	setActive(slot0.bombPanel, slot2:isPlayingWithBombEnemy())

	if slot2:isPlayingWithBombEnemy() then
		slot4 = slot0.bombPanel

		setText(slot4:Find("tx_step"), slot2:getBombChapterInfo().action_times - math.floor(slot2.roundIndex / 2))

		slot3 = slot0.bombPanel
		slot3 = slot3:Find("tx_score")
		slot4 = tonumber(getText(slot3))
		slot5 = slot2.modelCount

		LeanTween.cancel(go(slot3))

		if slot1 and slot4 ~= slot5 then
			LeanTween.scale(go(slot3), Vector3(1.5, 1.5, 1), 0.2)

			slot6 = (slot5 - slot4) * 0.1
			slot7 = LeanTween.value(go(slot3), slot4, slot5, slot6)
			slot7 = slot7:setOnUpdate(System.Action_float(function (slot0)
				setText(uv0, math.floor(slot0))
			end))
			slot7 = slot7:setOnComplete(System.Action(function ()
				setText(uv0, uv1)
			end))
			slot7 = slot7:setEase(LeanTweenType.easeInOutSine)

			slot7:setDelay(0.2)

			slot7 = LeanTween.scale(go(slot3), Vector3.one, 0.3)

			slot7:setDelay(1 + slot6)
		else
			slot3.localScale = Vector3.one

			setText(slot3, slot5)
		end
	end
end

function slot0.selectSquareBarrieredCell(slot0, slot1, slot2)
	slot3 = slot0.contextData.chapterVO
	slot5 = slot3.fleet.line
	slot7 = slot0.grid

	slot7:updateQuadCells(ChapterConst.QuadStateStrategy, slot3:calcSquareBarrierCells(slot5.row, slot5.column, slot1), function (slot0)
		if slot0 and _.any(uv0, function (slot0)
			if slot0.row ~= uv0.row or slot0.column ~= uv0.column then
				slot1 = false
			else
				slot1 = true
			end

			return slot1
		end) then
			uv1(slot0.row, slot0.column)
		else
			slot1 = uv2.grid

			slot1:updateQuadCells(ChapterConst.QuadStateNormal)
		end
	end)
end

function slot0.updateFleetBuff(slot0)
	slot1 = slot0.contextData.chapterVO
	slot3 = Clone(slot1:getFleetStgIds(slot1.fleet))

	for slot7, slot8 in ipairs(slot1:getExtraFlags()) do
		if pg.strategy_data_template[ChapterConst.Status2StgBuff[slot8]].buff_id == 0 then
			table.insert(slot3, slot9)
		end
	end

	slot4 = #slot3

	while slot4 > 0 do
		if pg.strategy_data_template[slot3[slot4]].icon == "" then
			table.remove(slot3, slot4)
		end

		slot4 = slot4 - 1
	end

	slot5 = {}

	if slot1:GetSubmarineFleet() and _.filter(slot6:getStrategies(), function (slot0)
		if pg.strategy_data_template[slot0.id].type ~= ChapterConst.StgTypePassive or slot0.count <= 0 then
			slot2 = false
		else
			slot2 = true
		end

		return slot2
	end) and #slot7 > 0 then
		_.each(slot7, function (slot0)
			slot3.id = slot0.id
			slot3.count = slot0.count

			table.insert(uv0, {})
		end)
	end

	slot7 = nil
	slot8 = 0

	if slot1:ExistDivingChampion() then
		slot7 = {
			icon = "submarine_approach"
		}
		slot8 = 1
	end

	slot11 = findTF(slot0.topStage, "buff_tpl")

	setActive(slot11, false)

	slot12 = UIItemList.New(findTF(slot0.topStage, "fleet_buffs"), slot11)

	slot12:make(function (slot0, slot1, slot2)
		setActive(findTF(slot2, "frame"), false)
		setActive(findTF(slot2, "Text"), false)
		setActive(findTF(slot2, "times"), false)

		if slot0 == UIItemList.EventUpdate then
			if slot1 + 1 <= #uv0 then
				GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[uv0[slot1 + 1]].icon, "", slot2)
				onButton(uv1, slot2, function ()
					slot0 = uv0
					slot2.type = MSGBOX_TYPE_SINGLE_ITEM
					slot3.type = DROP_TYPE_STRATEGY
					slot3.id = uv1.id
					slot3.cfg = uv1
					slot2.drop = {}

					slot0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = ""
					})
				end, SFX_PANEL)

				return
			end

			if slot1 + 1 <= #uv0 + #uv2 then
				slot3 = uv2[slot1 + 1 - #uv0]

				GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot3.id].icon, "", slot2)
				setActive(findTF(slot2, "times"), true)
				setText(findTF(slot2, "times"), slot3.count)
				onButton(uv1, slot2, function ()
					slot0 = uv0
					slot2.type = MSGBOX_TYPE_SINGLE_ITEM
					slot3.type = DROP_TYPE_STRATEGY
					slot3.id = uv1.id
					slot3.cfg = uv1
					slot2.drop = {}
					slot2.extendDesc = string.format(i18n("word_rest_times"), uv2.count)

					slot0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = ""
					})
				end, SFX_PANEL)
			elseif slot1 + 1 <= #uv0 + #uv2 + uv3 then
				GetImageSpriteFromAtlasAsync("strategyicon/" .. uv4.icon, "", slot2)

				slot3 = slot2:GetComponent(typeof(Image))

				onButton(uv1, slot2, function ()
					slot0 = uv0
					slot2.type = MSGBOX_TYPE_DROP_ITEM
					slot2.name = i18n("submarine_approach")
					slot2.content = i18n("submarine_approach_desc")
					slot2.sprite = uv1.sprite

					slot0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true
					})
				end, SFX_PANEL)
			else
				slot3 = uv5[slot1 + 1 - #uv0 - #uv2 - uv3]

				GetImageSpriteFromAtlasAsync("commanderskillicon/" .. slot3:getConfig("icon"), "", slot2)
				setText(findTF(slot2, "Text"), "Lv." .. slot3:getConfig("lv"))
				setActive(findTF(slot2, "Text"), true)
				setActive(findTF(slot2, "frame"), true)
				onButton(uv1, slot2, function ()
					slot0 = uv0

					slot0:emit(LevelMediator2.ON_COMMANDER_SKILL, uv1)
				end, SFX_PANEL)
			end
		end
	end)
	slot12:align(#slot3 + #slot5 + slot8 + #_.map(_.values(slot2:getCommanders()), function (slot0)
		return slot0:getSkills()[1]
	end))

	if OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0 then
		slot0:updateAirDominance()
	end

	slot0:updateChapterBuff()
end

function slot0.updateChapterBuff(slot0)
	slot1 = slot0.contextData.chapterVO
	slot3 = slot1:hasMitigation()

	SetActive(findTF(slot0.topStage, "chapter_buff"), slot3)

	if slot3 then
		GetImageSpriteFromAtlasAsync("passstate", slot1:getRiskLevel() .. "_icon", slot2)
		onButton(slot0, slot2, function ()
			slot0 = uv0

			if not slot0:hasMitigation() then
				return
			end

			slot0 = uv1
			slot2.type = MSGBOX_TYPE_DROP_ITEM
			slot3 = uv0
			slot2.name = slot3:getChapterState()
			slot2.sprite = getImageSprite(uv2)
			slot5 = uv0
			slot6 = uv0
			slot2.content = i18n("level_risk_level_mitigation_rate", slot5:getRemainPassCount(), slot6:getMitigationRate())

			slot0:HandleShowMsgBox({
				hideNo = true
			})
		end, SFX_PANEL)
	end
end

function slot0.updateAirDominance(slot0)
	slot1 = slot0.contextData.chapterVO
	slot1, slot2, slot3 = slot1:getAirDominanceValue()

	if not slot3 or slot3 ~= slot2 then
		slot4 = slot0.contextData.chapterVO

		slot4:setAirDominanceStatus(slot2)

		slot4 = getProxy(ChapterProxy)

		slot4:updateChapter(slot0.contextData.chapterVO)
	end

	if slot3 then
		if slot2 == 0 then
			slot4 = 3
		else
			slot4 = slot2
		end

		if slot3 == 0 then
			slot5 = 3
		else
			slot5 = slot3
		end

		slot4 = slot4 - slot5
	end

	slot0.isChange = slot4
	slot5 = slot0
	slot4 = slot0.updateAirDominanceTitle
	slot6 = slot1
	slot7 = slot2

	if not slot0.isChange then
		slot8 = 0
	end

	slot4(slot5, slot6, slot7, slot8)
end

function slot0.updateAirDominanceTitle(slot0, slot1, slot2, slot3)
	slot7 = findTF(slot0.airSupremacy, "value2")

	setText(findTF(slot0.airSupremacy, "label1"), i18n("level_scene_title_word_3"))
	setText(findTF(slot0.airSupremacy, "label2"), i18n("level_scene_title_word_4"))
	setText(findTF(slot0.airSupremacy, "value1"), math.floor(slot1))
	setActive(findTF(slot0.airSupremacy, "up"), false)
	setActive(findTF(slot0.airSupremacy, "down"), false)

	if slot3 ~= 0 then
		if LeanTween.isTweening(go(slot7)) then
			LeanTween.cancel(go(slot7))
		end

		slot10 = LeanTween.value(go(slot7), 1, 0, 0.5)
		slot10 = slot10:setOnUpdate(System.Action_float(function (slot0)
			setTextAlpha(uv0, slot0)
		end))

		slot10:setOnComplete(System.Action(function ()
			setText(uv0, ChapterConst.AirDominance[uv1].name)
			setTextColor(uv0, ChapterConst.AirDominance[uv1].color)

			slot0 = LeanTween.value(go(uv0), 0, 1, 0.5)

			slot0:setOnUpdate(System.Action_float(function (slot0)
				setTextAlpha(uv0, slot0)
			end))
		end))

		function slot10(slot0)
			setActive(slot0, false)
		end

		slot11 = slot8:GetComponent(typeof(DftAniEvent))

		slot11:SetEndEvent(slot10)

		slot11 = slot9:GetComponent(typeof(DftAniEvent))

		slot11:SetEndEvent(slot10)

		slot11 = setActive
		slot12 = slot8

		if slot3 <= 0 then
			slot13 = false
		else
			slot13 = true
		end

		slot11(slot12, slot13)

		slot11 = setActive
		slot12 = slot9

		if slot3 >= 0 then
			slot13 = false
		else
			slot13 = true
		end

		slot11(slot12, slot13)
	else
		setText(slot7, ChapterConst.AirDominance[slot2].name)
		setTextColor(slot7, ChapterConst.AirDominance[slot2].color)
	end
end

function slot0.updateShamProgress(slot0)
	setText(findTF(slot0.topStage, "msg_panel/sham_progress/value"), slot0.contextData.chapterVO.progress .. " / " .. ChapterConst.ShamEnemyLimit)
end

function slot0.UpdateDefenseStatus(slot0)
	slot1 = slot0.contextData.chapterVO

	if slot1:getPlayType() ~= ChapterConst.TypeDefence then
		slot2 = false
	else
		slot2 = true
	end

	setActive(findTF(slot0.bottomStage, "normal/shengfu"), slot2)

	if not slot2 then
		return
	end

	slot4 = findTF(slot3, "hp")
	slot4:GetComponent(typeof(Text)).text = i18n("desc_base_hp", "<color=#92FC63>" .. tostring(slot1.BaseHP) .. "</color>", pg.chapter_defense[slot1.id].port_hp)
end

function slot0.DisplayWinConditionPanel(slot0)
	if IsNil(slot0.winCondPanel) then
		slot0.winCondPanel = WinConditionDisplayPanel.New(slot0._tf.parent, slot0._event, slot0.contextData)
		slot0.winCondPanel.ParentView = slot0
		slot1 = slot0.winCondPanel

		slot1:Load()
	end

	slot1 = slot0.winCondPanel

	slot1:ActionInvoke("Enter", slot0.contextData.chapterVO)
end

slot2 = Vector2(396, 128)
slot3 = Vector2(128, 128)

function slot0.updateStageStrategy(slot0)
	slot2 = slot0.contextData.chapterVO.fleet
	slot4 = findTF(findTF(slot0.rightStage, "event"), "detail")
	slot5 = findTF(slot4, "click")
	slot6 = findTF(slot4, "items")
	slot7 = slot6:GetComponent(typeof(GridLayoutGroup))

	if not slot0._showStrategyDetail or not uv0 then
		slot8 = uv1
	end

	slot7.cellSize = slot8
	slot9 = findTF(slot3, "collapse")

	setActive(findTF(slot6, "item"), false)

	slot11 = {}
	slot12 = {}

	_.each(slot1:getFleetStgs(slot2), function (slot0)
		if pg.strategy_data_template[slot0.id].type == ChapterConst.StgTypeForm then
			table.insert(uv0, slot0.id)
		else
			table.insert(uv1, slot0)
		end
	end)

	if _.any(slot1.fleets, function (slot0)
		if slot0:getFleetType() ~= FleetType.Submarine then
			slot1 = false
		else
			slot1 = true
		end

		return slot1
	end) then
		slot16.id = ChapterConst.StrategySubTeleport

		table.insert(slot12, 2, {})

		slot16.id = ChapterConst.StrategySubAutoAttack

		table.insert(slot12, 2, {})

		slot16.id = ChapterConst.StrategyHuntingRange

		table.insert(slot12, 2, {})
	end

	if #slot1.strategies > 0 then
		for slot16, slot17 in pairs(slot1.strategies) do
			slot20.id = slot16
			slot20.count = slot17

			table.insert(slot12, {})
		end
	end

	slot17.id = slot2:getFormationStg()

	table.insert(slot12, 1, {})

	slot14 = UIItemList.New(slot6, slot8)

	slot14:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setActive(slot2:Find("detail"), uv0._showStrategyDetail)

			slot4 = slot2:Find("icon")
			slot6, slot7 = nil

			if uv1[slot1 + 1].id == ChapterConst.StrategyHuntingRange then
				slot6 = 1

				if uv0.contextData.huntingRangeVisibility % 2 == 1 then
					slot7 = "range_invisible"
				else
					slot7 = "range_visible"
				end

				setText(slot3, i18n("help_sub_limits"))
			elseif slot5.id == ChapterConst.StrategySubAutoAttack then
				slot6 = 1

				if uv2.subAutoAttack == 0 then
					slot7 = "sub_dont_auto_attack"
				else
					slot7 = "sub_auto_attack"
				end

				setText(slot3, i18n("help_sub_display"))
			else
				slot8 = pg.strategy_data_template[slot5.id]
				slot6 = slot8.type
				slot7 = slot8.icon

				setText(slot3, slot8.desc)
			end

			GetImageSpriteFromAtlasAsync("strategyicon/" .. slot7, "", slot4:Find("icon"))
			onButton(uv0, slot4, function ()
				if uv0.grid.quadState == ChapterConst.QuadStateStrategy and uv0.grid.quadClickProxy then
					uv0.grid.quadClickProxy()

					return
				end

				if uv1.id == ChapterConst.StrategyHuntingRange then
					slot0 = uv0.grid

					slot0:toggleHuntingRange()
					uv2.callback(uv3, uv4, uv5)
				elseif uv1.id == ChapterConst.StrategySubAutoAttack then
					slot0 = pg.TipsMgr.GetInstance()

					slot0:ShowTips(i18n("ai_change_" .. 1 - uv6.subAutoAttack + 1))

					slot0 = uv0
					slot3.type = ChapterConst.OpSubState
					slot3.arg1 = 1 - uv6.subAutoAttack

					slot0:emit(LevelMediator2.ON_OP, {})
				else
					if uv1.id == ChapterConst.StrategyExchange then
						slot0 = uv6

						if slot0:getNextValidIndex(uv6.findex) > 0 and uv1.count > 0 then
							slot1 = uv0
							slot3.content = i18n("levelScene_who_to_exchange")

							function slot3.onYes()
								slot0 = uv0
								slot3.type = ChapterConst.OpStrategy
								slot3.id = uv1.id
								slot3.arg1 = ChapterConst.StrategyExchange
								slot3.arg2 = uv2.fleets[uv3].id

								slot0:emit(LevelMediator2.ON_OP, {})
							end

							slot1:HandleShowMsgBox({})
						end

						return
					end

					if uv1.id == ChapterConst.StrategySubTeleport then
						slot0 = uv0

						slot0:SwitchBottomStage(true)

						slot0 = uv0.grid

						slot0:ShowStaticHuntingRange()

						slot0 = uv0

						slot0:updateStageStrategy()

						slot0 = uv0.grid

						slot0:PrepareSubTeleport()

						slot0 = uv0.grid

						slot0:updateQuadCells(ChapterConst.QuadStateTeleportSub)
					elseif uv8 == ChapterConst.StgTypeForm then
						slot0 = uv7
						slot2 = uv0
						slot5.type = ChapterConst.OpStrategy
						slot5.id = slot0:getNextStgUser(uv1.id)
						slot5.arg1 = uv9[table.indexof(uv9, uv1.id) % #uv9 + 1]

						slot2:emit(LevelMediator2.ON_OP, {})
					else
						slot0 = uv0

						slot0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, uv1)
					end
				end
			end, SFX_PANEL)

			if slot6 == ChapterConst.StgTypeForm or slot6 == ChapterConst.StgTypeConst then
				setText(slot4:Find("nums"), "")
				setActive(slot4:Find("mask"), false)

				slot8 = setActive
				slot9 = slot4:Find("selected")

				if uv6 ~= slot5.id then
					slot10 = false
				else
					slot10 = true
				end

				slot8(slot9, slot10)
			else
				setText(slot4:Find("nums"), slot5.count)

				slot8 = setActive
				slot9 = slot4:Find("mask")

				if slot5.count ~= 0 then
					slot10 = false
				else
					slot10 = true
				end

				slot8(slot9, slot10)
				setActive(slot4:Find("selected"), false)
			end
		end
	end)
	slot14:align(#slot12)
	onButton(slot0, slot5, function ()
		shiftPanel(uv0, uv0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, -30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(slot0, slot9, function ()
		shiftPanel(uv0, 35, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, uv1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)

	if pg.chapter_pop_template[slot1.id] and slot15.combo_on then
		slot16, slot17 = slot0:GetSubView("LevelStageComboPanel")

		if slot17 then
			slot16:Load()

			slot18 = slot16.buffer

			slot18:AfterLoaded(function ()
				slot0 = uv0._tf

				slot0:SetParent(uv1.leftStage, false)
			end)
		end

		if getProxy(ChapterProxy).comboHistoryBuffer[slot1.id] then
			slot20 = slot16.buffer

			slot20:UpdateView(slot19)

			slot18.comboHistoryBuffer[slot1.id] = nil
		else
			slot20 = slot16.buffer

			slot20:UpdateView(slot1)
		end

		slot20 = slot16.buffer

		slot20:UpdateViewAnimated(slot1)
	end
end

function slot0.SwitchAnchorandShift(slot0, slot1, slot2, ...)
	rtf(slot1).anchorMin = slot2
	rtf(slot1).anchorMax = slot2

	shiftPanel(slot1, ...)
end

function slot0.GetSubView(slot0, slot1)
	if slot0.attachSubViews[slot1] then
		return slot0.attachSubViews[slot1]
	end

	slot2 = import("view.level." .. slot1).New(slot0)
	slot0.attachSubViews[slot1] = slot2

	return slot2, true
end

function slot0.RemoveSubView(slot0, slot1)
	if not slot0.attachSubViews[slot1] then
		return false
	end

	slot2 = slot0.attachSubViews[slot1]

	slot2:Destroy()

	slot0.attachSubViews[slot1] = nil

	return true
end

function slot0.ClearSubViews(slot0)
	for slot4, slot5 in pairs(slot0.attachSubViews) do
		slot5:Destroy()
	end

	table.clear(slot0.attachSubViews)
end

function slot0.updateStageFleet(slot0)
	slot1 = slot0.contextData.chapterVO
	slot2 = findTF(slot0.leftStage, "fleet")

	setActive(findTF(slot2, "shiptpl"), false)
	setText(slot0:findTF("msg_panel/fleet_info/number", slot0.topStage), slot1.fleet.id)

	function slot5(slot0, slot1)
		slot2 = UIItemList.New(slot0, uv0)

		slot2:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot3 = uv0[slot1 + 1]

				updateShip(slot2, slot3)

				slot4 = slot3.hpRant
				slot5 = slot3:getShipProperties()
				slot6 = math.floor

				if not slot3.hpChange then
					slot7 = 0
				end

				slot7 = findTF(slot2, "HP_POP")

				setActive(slot7, true)
				setActive(findTF(slot7, "heal"), false)
				setActive(findTF(slot7, "normal"), false)

				function slot8(slot0, slot1)
					setActive(slot0, true)
					setText(findTF(slot0, "text"), slot1)
					setTextAlpha(findTF(slot0, "text"), 0)
					LeanTween.moveY(slot0, 60, 1)
					LeanTween.textAlpha(findTF(slot0, "text"), 1, 0.3)

					slot2 = LeanTween.textAlpha(findTF(slot0, "text"), 0, 0.5)
					slot2 = slot2:setDelay(0.7)

					slot2:setOnComplete(System.Action(function ()
						uv0.localPosition = Vector3(0, 0, 0)
					end))
				end

				if slot6(slot7 / 10000 * slot5[AttributeType.Durability]) > 0 then
					slot8(findTF(slot7, "heal"), slot6)
				elseif slot6 < 0 then
					LeanTween.delayedCall(0.6, System.Action(function ()
						slot1 = LeanTween.moveX(uv0, uv0.transform.localPosition.x, 0.05)
						slot1 = slot1:setEase(LeanTweenType.easeInOutSine)

						slot1:setLoopPingPong(4)
						LeanTween.alpha(findTF(uv0, "red"), 0.5, 0.4)

						slot1 = LeanTween.alpha(findTF(uv0, "red"), 0, 0.4)

						slot1:setDelay(0.4)
						uv1(findTF(uv2, "normal"), uv3)
					end))
				end

				slot9 = findTF(slot2, "blood")
				slot10 = findTF(slot2, "blood/fillarea/green")
				slot11 = findTF(slot2, "blood/fillarea/red")

				if slot4 >= ChapterConst.HpGreen then
					slot12 = false
				else
					slot12 = true
				end

				setActive(slot10, not slot12)
				setActive(slot11, slot12)

				slot13 = slot9:GetComponent(typeof(Slider))

				if not slot12 or not slot11 then
					slot14 = slot10
				end

				slot13.fillRect = slot14

				setSlider(slot9, 0, 10000, slot4)
				setActive(findTF(slot2, "repairmask"), slot12)

				slot13 = findTF(slot2, "repairmask/icon").gameObject

				if not slot12 then
					LeanTween.cancel(slot13)
					setImageAlpha(slot13, 1)
				end

				if slot12 and not LeanTween.isTweening(slot13) then
					slot14 = LeanTween.alpha(rtf(slot13), 0, 2)

					slot14:setLoopPingPong()
				end

				onButton(uv1, slot2, function ()
					if uv0 then
						slot0 = uv1

						slot0:emit(LevelUIConst.DISPLAY_REPAIR_WINDOW, uv2)
					end
				end, SFX_PANEL)
			end
		end)
		slot2:align(#slot1)
	end

	slot8 = slot1.fleet

	slot5(slot2:Find("main"), slot8:getShipsByTeam(TeamType.Main, true))

	slot8 = slot1.fleet

	slot5(slot2:Find("vanguard"), slot8:getShipsByTeam(TeamType.Vanguard, true))

	slot6 = slot1.fleet

	slot6:clearShipHpChange()
end

function slot0.ShiftStagePanelIn(slot0, slot1)
	shiftPanel(slot0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine, slot1)
	shiftPanel(slot0.bottomStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function slot0.ShiftStagePanelOut(slot0, slot1)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine, slot1)
	shiftPanel(slot0.bottomStage, 0, -slot0.bottomStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, -slot0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, slot0.rightStage.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function slot0.SwitchBottomStage(slot0, slot1)
	setActive(slot0.teleportSubRole, true)
	setActive(slot0.normalRole, true)

	slot2 = shiftPanel
	slot3 = slot0.teleportSubRole
	slot4 = 0

	if slot1 then
		slot5 = 0
	else
		slot5 = uv0
	end

	slot2(slot3, slot4, slot5, 0.3, 0, true, true, nil, function ()
		setActive(uv0.teleportSubRole, uv1)
	end)

	slot2 = shiftPanel
	slot3 = slot0.normalRole
	slot4 = 0

	if not slot1 or not uv0 then
		slot5 = 0
	end

	slot2(slot3, slot4, slot5, 0.3, 0, true, true, nil, function ()
		setActive(uv0.normalRole, not uv1)
	end)

	slot2 = shiftPanel
	slot3 = slot0.leftStage

	if not slot1 or not (-slot0.leftStage.rect.width - 200) then
		slot4 = 0
	end

	slot2(slot3, slot4, 0, 0.3, 0, true)

	slot2 = shiftPanel
	slot3 = slot0.rightStage

	if not slot1 or not (slot0.rightStage.rect.width + 200) then
		slot4 = 0
	end

	slot2(slot3, slot4, 0, 0.3, 0, true)
end

function slot0.clickGridCell(slot0, slot1)
	slot2 = slot0.contextData.chapterVO
	slot3 = slot2:getDataType()
	slot4 = slot2.fleet
	slot5 = slot2:getChapterCell(slot4.line.row, slot4.line.column)

	if _.detect(slot2.fleets, function (slot0)
		if slot0:getFleetType() ~= FleetType.Normal or slot0.line.row ~= uv0.row or slot0.line.column ~= uv0.column then
			slot1 = false
		else
			slot1 = true
		end

		return slot1
	end) and slot3 == ChapterConst.TypeNone and slot6:isValid() and slot6.id ~= slot4.id then
		slot10.type = ChapterConst.OpSwitch
		slot10.id = slot6.id

		slot0:emit(LevelMediator2.ON_OP, {})

		return
	end

	if slot2:checkAnyInteractive() then
		triggerButton(slot0.funcBtn)
	elseif slot2:getRound() == ChapterConst.RoundEnemy then
		slot11.type = ChapterConst.OpEnemyRound

		slot0:emit(LevelMediator2.ON_OP, {})
	elseif slot6 and slot3 == ChapterConst.TypeSham then
		slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
	elseif slot1.row ~= slot4.line.row or slot1.column ~= slot4.line.column then
		if slot2:getChapterCell(slot1.row, slot1.column).attachment == ChapterConst.AttachStory and slot8.data == ChapterConst.StoryObstacle and slot8.flag == 3 then
			if slot2:getPlayType() ~= ChapterConst.TypeDefence then
				slot9 = pg.TipsMgr.GetInstance()

				slot9:ShowTips(i18n("map_event_stop_tip"))
			end

			return
		elseif not slot2:considerAsStayPoint(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then
			return
		elseif slot2:existMoveLimit() and not _.any(slot2:calcWalkableCells(ChapterConst.SubjectPlayer, slot4.line.row, slot4.line.column, slot4:getSpeed()), function (slot0)
			if slot0.row ~= uv0.row or slot0.column ~= uv0.column then
				slot1 = false
			else
				slot1 = true
			end

			return slot1
		end) then
			slot10 = pg.TipsMgr.GetInstance()

			slot10:ShowTips(i18n("destination_not_in_range"))

			return
		end

		slot13.row = slot1.row
		slot13.column = slot1.column

		if slot2:findPath(ChapterConst.SubjectPlayer, slot4.line, {}) < PathFinding.PrioObstacle then
			slot13.type = ChapterConst.OpMove
			slot13.id = slot4.id
			slot13.arg1 = slot1.row
			slot13.arg2 = slot1.column

			slot0:emit(LevelMediator2.ON_OP, {})
		elseif slot9 < PathFinding.PrioForbidden then
			slot10 = pg.TipsMgr.GetInstance()

			slot10:ShowTips(i18n("destination_can_not_reach"))
		else
			slot10 = pg.TipsMgr.GetInstance()

			slot10:ShowTips(i18n("destination_can_not_reach"))
		end
	end
end

function slot0.tryAutoAction(slot0, slot1)
	if not slot0.contextData.chapterVO then
		if slot1 then
			slot1()
		end

		return
	end

	if slot0:SafeCheck() then
		if slot1 then
			slot1()
		end

		return
	end

	slot4 = false
	slot5 = false

	for slot9, slot10 in pairs(slot2.cells) do
		if slot10.trait == ChapterConst.TraitLurk then
			slot4 = true

			break
		end
	end

	for slot9, slot10 in ipairs(slot2.champions) do
		if slot10.trait == ChapterConst.TraitLurk then
			slot4 = true

			if slot10.attachment == ChapterConst.AttachOni then
				slot5 = slot10

				break
			end
		end
	end

	slot6 = slot2:isPlayingWithBombEnemy()

	if slot4 then
		slot8[1] = function (slot0)
			slot1 = uv0

			slot1:emit(LevelUIConst.FROZEN)

			if uv1 or uv2 then
				slot1 = nil

				if uv1 then
					slot1 = "SpUnit"
				end

				if uv2 then
					slot1 = "SpBomb"
				end

				if slot1 then
					slot3 = uv0
					slot6.name = slot1

					function slot6.callback(slot0)
						setActive(slot0, false)
						uv0()
					end

					slot3:emit(LevelUIConst.DO_PLAY_ANIM, {})
				end
			else
				slot1 = uv0

				slot1:emit(LevelUIConst.DO_TRACKING, slot0)
			end
		end

		slot8[2] = function (slot0)
			if uv0 or uv1 then
				slot1 = uv2

				if slot1:getSpAppearStory() and #slot1 > 0 then
					slot2 = pg.StoryMgr.GetInstance()

					slot2:Play(slot1, function ()
						slot0 = uv0

						if slot0:getSpAppearGuide() and #slot0 > 0 then
							slot1 = pg.GuideMgr.GetInstance()

							slot1:play(slot0, nil, onNextTick(uv1))
						else
							onNextTick(uv1)
						end
					end)

					return
				end
			end

			slot0()
		end

		slot8[3] = function (slot0)
			slot1 = uv0.grid

			slot1:PlaySpotLigthsEffect()

			slot1 = uv0

			slot1:tryPlayChapterStory()

			slot1 = uv1

			if slot1:findChapterCell(ChapterConst.AttachBoss) and slot1.trait == ChapterConst.TraitLurk then
				slot2 = uv0.grid

				slot2:focusOnCell(slot1, slot0)

				return
			end

			slot0()
		end

		slot8[4] = function (slot0)
			slot1 = uv0

			slot1:updateTrait(ChapterConst.TraitVirgin)

			slot1 = uv0.grid

			slot1:updateAttachments()

			slot1 = uv0.grid

			slot1:updateChampions()

			slot1 = uv0

			slot1:updateTrait(ChapterConst.TraitNone)

			slot1 = uv0

			slot1:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)

			slot1 = Timer.New(slot0, 0.5, 1)

			slot1:Start()
		end

		slot8[5] = function (slot0)
			slot1 = uv0

			slot1:emit(LevelUIConst.UN_FROZEN)

			if uv1 then
				uv1()
			end
		end

		seriesAsync({})
	else
		slot7 = slot0.grid

		slot7:PlaySpotLigthsEffect()

		if slot1 then
			slot1()
		end
	end
end

function slot0.tryPlayChapterStory(slot0)
	slot1 = slot0.contextData.chapterVO

	if slot1:getDataType() == ChapterConst.TypeNone then
		slot4 = slot1:getWaveCount()

		function slot5()
			if PlayerPrefs.GetInt("help_displayed_on_" .. uv0.id, 0) == 0 then
				triggerButton(uv1.helpBtn)
				PlayerPrefs.SetInt("help_displayed_on_" .. uv0.id, 1)
			end
		end

		if slot1:getConfig("story_refresh") and slot3[slot4] and slot3[slot4] ~= "" then
			if slot4 == 1 and pg.map_event_list[slot1.id] and pg.map_event_list[slot1.id].help_open == 1 then
				slot6 = pg.StoryMgr.GetInstance()

				slot6:Play(slot3[slot4], slot5)
			else
				slot6 = pg.StoryMgr.GetInstance()

				slot6:Play(slot3[slot4])
			end
		elseif slot4 == 1 and pg.map_event_list[slot1.id] and pg.map_event_list[slot1.id].help_open == 1 then
			slot5()
		end

		if slot1:getConfig("story_refresh_boss") and slot6 ~= "" and slot1:bossRefreshed() then
			slot7 = pg.StoryMgr.GetInstance()

			slot7:Play(slot6)
		end
	end

	slot3 = pg.SystemGuideMgr.GetInstance()

	slot3:PlayChapter(slot1)
end

slot4 = {
	[ChapterConst.KizunaJammingDodge] = "kizunaOperationSafe",
	[ChapterConst.KizunaJammingEngage] = "kizunaOperationDanger",
	[ChapterConst.StatusDay] = "HololiveDayBar",
	[ChapterConst.StatusNight] = "HololiveNightBar"
}

function slot0.PopBar(slot0, slot1)
	if getProxy(ChapterProxy).extraFlagUpdate then
		slot2 = getProxy(ChapterProxy)

		slot2:extraFlagUpdated()

		if #slot1 < 1 then
			return
		end

		slot4, slot5 = slot0:GetSubView(uv0[slot1[1]])

		if slot5 then
			slot4:Load()
		end

		slot6 = slot4.buffer

		slot6:PlayAnim()
	end
end

function slot0.updateTrait(slot0, slot1)
	for slot6, slot7 in pairs(slot0.contextData.chapterVO.cells) do
		if slot7.trait ~= ChapterConst.TraitNone then
			slot7.trait = slot1
		end
	end

	for slot6, slot7 in ipairs(slot2.champions) do
		if slot7.trait ~= ChapterConst.TraitNone then
			slot7.trait = slot1
		end
	end
end

function slot0.CheckFleetChange(slot0)
	slot1 = slot0.contextData.chapterVO
	slot2 = slot1:getDataType()
	slot3 = slot1.fleet

	if _.detect(slot1.fleets, function (slot0)
		return not slot0:isValid()
	end) then
		slot8.type = ChapterConst.OpRetreat
		slot8.id = slot4.id

		slot0:emit(LevelMediator2.ON_OP, {})
	end

	if not slot3:isValid() and slot2 == ChapterConst.TypeNone then
		if slot1:getNextValidIndex() > 0 then
			function slot7()
				slot0 = uv0
				slot3.type = ChapterConst.OpSwitch
				slot3.id = uv1.id

				slot0:emit(LevelMediator2.ON_OP, {})
			end

			slot10.content = i18n("formation_switch_tip", slot1.fleets[slot5].name)
			slot10.onYes = slot7
			slot10.onNo = slot7

			slot0:HandleShowMsgBox({
				modal = true,
				hideNo = true
			})
		end

		return true
	end

	return false
end

function slot0.tryAutoTrigger(slot0)
	slot1 = slot0.contextData.chapterVO

	if slot0:DoBreakAction() then
		return true
	end

	if not slot0:CheckFleetChange() then
		if slot1:checkAnyInteractive() then
			triggerButton(slot0.funcBtn)
		elseif slot1:getRound() == ChapterConst.RoundEnemy then
			slot6.type = ChapterConst.OpEnemyRound

			slot0:emit(LevelMediator2.ON_OP, {})
		elseif slot1:getRound() == ChapterConst.RoundPlayer then
			slot3 = slot0.grid

			slot3:updateQuadCells(ChapterConst.QuadStateNormal)
		end
	end

	return slot2
end

function slot0.DoSafeCheckOnBegin(slot0)
	slot1 = slot0.contextData.chapterVO

	if slot0:DoBreakAction() then
		return
	end

	if not slot0:CheckFleetChange() then
		if slot1:getRound() == ChapterConst.RoundEnemy then
			slot6.type = ChapterConst.OpEnemyRound

			slot0:emit(LevelMediator2.ON_OP, {})
		elseif slot1:getRound() == ChapterConst.RoundPlayer then
			slot3 = slot0.grid

			slot3:updateQuadCells(ChapterConst.QuadStateNormal)
		end
	end
end

function slot0.DoBreakAction(slot0)
	slot1 = slot0.contextData.chapterVO
	slot2, slot3 = slot0:SafeCheck()

	if slot2 then
		slot4 = slot1.fleet

		function slot5(slot0)
			slot2 = uv0

			if slot2:getDefeatStory(uv0.defeatCount) and type(slot2) == "number" then
				slot3 = pg.StoryMgr.GetInstance()

				if not slot3:IsPlayed(slot2) then
					slot3 = pg.m02
					slot6.storyId = slot2

					slot3:sendNotification(GAME.STORY_UPDATE, {})

					slot3 = uv1

					slot3:emit(LevelMediator2.ON_PERFORM_COMBAT, slot2, slot0)

					return
				end
			elseif slot2 and type(slot2) == "string" then
				slot3 = pg.StoryMgr.GetInstance()

				slot3:Play(slot2, slot0)

				return
			end

			slot0()
		end

		function slot6(slot0)
			slot2[1] = function (slot0)
				if uv0 then
					uv1(slot0)
				else
					slot0()
				end
			end

			slot2[2] = function (slot0)
				slot1 = uv0
				slot4.type = ChapterConst.OpRetreat
				slot4.win = uv1

				slot1:emit(LevelMediator2.ON_OP, {})
				slot0()
			end

			seriesAsync({})
		end

		if slot3 == ChapterConst.ReasonVictory then
			slot8[1] = slot5

			slot8[2] = function (slot0)
				slot1 = uv0

				if slot1:getPlayType() == ChapterConst.TypeTransport then
					slot1 = pg.TipsMgr.GetInstance()

					slot1:ShowTips(i18n("levelScene_escort_win"))
				else
					slot1 = pg.TipsMgr.GetInstance()

					slot1:ShowTips(i18n("levelScene_chapter_win"))
				end

				uv1(true)
				slot0()
			end

			seriesAsync({})
		elseif slot3 == ChapterConst.ReasonDefeat then
			if slot1:getPlayType() == ChapterConst.TypeTransport then
				slot7 = pg.TipsMgr.GetInstance()

				slot7:ShowTips(i18n("levelScene_escort_lose"))
				slot6()
			else
				slot9.content = i18n("formation_invalide")
				slot9.onYes = slot6
				slot9.onClose = slot6

				slot0:HandleShowMsgBox({
					modal = true,
					hideNo = true
				})
			end
		elseif slot3 == ChapterConst.ReasonDefeatDefense then
			slot9.content = i18n("harbour_bomb_tip")
			slot9.onYes = slot6
			slot9.onClose = slot6

			slot0:HandleShowMsgBox({
				modal = true,
				hideNo = true
			})
		elseif slot3 == ChapterConst.ReasonVictoryOni then
			slot6(true)
		elseif slot3 == ChapterConst.ReasonDefeatOni then
			slot6()
		elseif slot3 == ChapterConst.ReasonDefeatBomb then
			slot6(true)
		elseif slot3 == ChapterConst.ReasonVictorySham then
			function slot7()
				slot0 = uv0

				slot0:emit(LevelUIConst.SWITCH_TO_MAP)
			end

			if slot1.shamResetCount < ChapterConst.ShamResetCountLimit then
				slot10.content = i18n("sham_count_reset")
				slot10.onYes = slot6
				slot10.onNo = slot7

				slot0:HandleShowMsgBox({
					modal = true
				})
			else
				slot10.content = i18n("sham_count_limit")
				slot10.onYes = slot7
				slot10.onNo = slot7

				slot0:HandleShowMsgBox({
					modal = true,
					hideNo = true
				})
			end
		elseif slot3 == ChapterConst.ReasonDefeatSham then
			slot7 = getProxy(ContextProxy)

			if slot7:getContextByMediator(LevelMediator2) then
				slot9 = slot8:getContextByMediator(ShamPreCombatMediator)
			end

			if not slot9 then
				slot13.content = i18n("formation_reform_tip")

				function slot13.onYes()
					slot0 = uv0

					slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
				end

				slot0:HandleShowMsgBox({
					modal = true
				})
			end
		elseif slot3 == ChapterConst.ReasonOutTime then
			slot0:emit(LevelMediator2.ON_TIME_UP)
		elseif slot3 == ChapterConst.ReasonActivityOutTime then
			slot6()
		end

		return true
	end

	return slot2
end

function slot0.SafeCheck(slot0)
	slot1 = slot0.contextData.chapterVO
	slot2 = slot1:getDataType()
	slot3 = slot1.fleet
	slot4 = slot1:CheckTransportState()
	slot6 = false

	for slot10, slot11 in pairs(slot1:GetWinConditions()) do
		if slot11.type == 1 then
			slot13 = 0

			_.each(slot1:findChapterCells(ChapterConst.AttachBoss), function (slot0)
				if slot0 and slot0.flag == 1 then
					uv0 = uv0 + 1
				end
			end)

			if not slot6 then
				if slot11.param > slot13 then
					slot6 = false
				else
					slot6 = true
				end
			end
		elseif slot11.type == 2 then
			if not slot6 then
				if slot11.param > slot1:GetDefeatCount() then
					slot6 = false
				else
					slot6 = true
				end
			end
		elseif slot11.type == 3 then
			if not slot6 then
				if slot4 ~= 1 then
					slot6 = false
				else
					slot6 = true
				end
			end
		elseif slot11.type == 4 then
			if not slot6 then
				if slot11.param >= slot1:getRoundNum() then
					slot6 = false
				else
					slot6 = true
				end
			end
		elseif slot11.type == 5 then
			slot12 = slot11.param

			if not _.any(slot1.champions, function (slot0)
				if slot0.attachmentId ~= uv0 then
					slot1 = false
				else
					slot1 = true
				end

				for slot5, slot6 in pairs(slot0.idList) do
					if not slot1 then
						if slot6 ~= uv0 then
							slot1 = false
						else
							slot1 = true
						end
					end
				end

				if slot1 then
					if slot0.flag == 1 then
						slot2 = false
					else
						slot2 = true
					end
				end

				return slot2
			end) then
				slot13 = _.any(slot1.cells, function (slot0)
					if slot0.attachmentId ~= uv0 then
						slot1 = false
					else
						slot1 = true
					end

					for slot5, slot6 in pairs(slot0.idList) do
						if not slot1 then
							if slot6 ~= uv0 then
								slot1 = false
							else
								slot1 = true
							end
						end
					end

					if slot1 then
						if slot0.flag == 1 then
							slot2 = false
						else
							slot2 = true
						end
					end

					return slot2
				end)
			end

			if not slot6 then
				slot6 = not slot13
			end
		end

		if slot6 then
			return true, ChapterConst.ReasonVictory
		end
	end

	slot7, slot8 = slot1:CheckChapterLose()

	if slot7 then
		return true, slot8
	end

	if slot1:existOni() then
		if slot1:checkOniState() == 1 then
			return true, ChapterConst.ReasonVictoryOni
		elseif slot9 == 2 then
			return true, ChapterConst.ReasonDefeatOni
		end
	elseif slot1:isPlayingWithBombEnemy() and slot1:getBombChapterInfo().action_times * 2 <= slot1.roundIndex then
		return true, ChapterConst.ReasonDefeatBomb
	end

	if slot2 == ChapterConst.TypeSham then
		if ChapterConst.ShamEnemyLimit <= slot1.progress then
			return true, ChapterConst.ReasonVictorySham
		elseif not slot3:isValid() then
			return true, ChapterConst.ReasonDefeatSham
		end
	end

	if not slot1:inWartime() then
		return true, ChapterConst.ReasonOutTime
	end

	slot9 = slot1:getConfig("act_id")
	slot10 = slot0.contextData.map

	if not slot10:isRemaster() and slot9 ~= 0 then
		slot10 = getProxy(ActivityProxy)

		if not slot10:getActivityById(slot9) or slot11:isEnd() then
			return true, ChapterConst.ReasonActivityOutTime
		end
	end

	return false
end

function slot0.HandleShowMsgBox(slot0, slot1)
	slot1.blurLevelCamera = true
	slot2 = pg.MsgboxMgr.GetInstance()

	slot2:ShowMsgBox(slot1)
end

return slot0
