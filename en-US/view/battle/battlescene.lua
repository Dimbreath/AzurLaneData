slot0 = class("BattleScene", import("..base.BaseUI"))
slot0.IN_VIEW_FRIEND_SKILL_OFFSET = Vector3(-5, 0, 6)
slot0.IN_VIEW_FOE_SKILL_OFFSET = Vector3(-15, 0, 6)
slot0.FOE_SIDE_X_OFFSET = 250
slot0.SKILL_FLOAT_SCALE = Vector3(1.5, 1.5, 0)
slot0.SIDE_ALIGNMENT = {
	{
		-120,
		-7.5,
		-232.5
	},
	{
		105,
		217.5,
		330
	},
	{
		-345,
		-457.5,
		-570
	}
}
slot1 = nil

function slot0.getUIName(slot0)
	return "CombatUI"
end

function slot0.getBGM(slot0)
	return (pg.expedition_data_template[slot0.contextData.stageId].bgm ~= "" and slot1.bgm) or slot0.super.getBGM(slot0)
end

function slot0.init(slot0)
	slot1 = GameObject.Find("MainCamera")
	ys.Battle.BattleVariable.uiCanvas = findTF(slot2, "Canvas/UIMain")
	ys.Battle.BattleVariable.skillTips = ys.Battle.BattleVariable.findTF(slot0, "Skill_Activation")
	ys.Battle.BattleVariable.skillRoot = ys.Battle.BattleVariable.findTF(slot0, "Skill_Activation/Root")
	ys.Battle.BattleVariable.skillTpl = ys.Battle.BattleVariable.findTF(slot0, "Skill_Activation/mask").gameObject
	ys.Battle.BattleVariable._skillFloatPool = pg.Pool.New(ys.Battle.BattleVariable.skillRoot, ys.Battle.BattleVariable.skillTpl, 15, 10, true, false):InitSize()
	ys.Battle.BattleVariable.skillCMDRoot = ys.Battle.BattleVariable.findTF(slot0, "Skill_Activation/Root_cmd")
	ys.Battle.BattleVariable.skillCMDTpl = ys.Battle.BattleVariable.findTF(slot0, "Skill_Activation/mask_cmd").gameObject
	ys.Battle.BattleVariable._skillFloatCMDPool = pg.Pool.New(ys.Battle.BattleVariable.skillCMDRoot, ys.Battle.BattleVariable.skillCMDTpl, 2, 4, true, false):InitSize()
	ys.Battle.BattleVariable.popupTpl = ys.Battle.BattleVariable.getTpl(slot0, "popup")

	SetActive(ys.Battle.BattleVariable._go, false)

	ys.Battle.BattleVariable._skillPaintings = {}
	ys.Battle.BattleVariable._skillFloat = true
	ys.Battle.BattleVariable._cacheSkill = {}
	ys.Battle.BattleVariable._commanderSkillList = {}
	ys.Battle.BattleVariable._sideSkillFloatStateList = {
		[ys.Battle.BattleConfig.FRIENDLY_CODE] = {
			{},
			{},
			{}
		},
		[ys.Battle.BattleConfig.FOE_CODE] = {
			{},
			{},
			{}
		}
	}

	ys.Battle.BattleVariable:initPainting()
end

function slot0.initPainting(slot0)
	slot2 = ys.Battle.BattleResourceManager.GetInstance().InstSkillPaintingUI(slot1)

	setParent(slot2, slot0.uiCanvas, false)

	slot0._paintingUI = slot2
	slot0._paintingAnimator = slot2:GetComponent(typeof(Animator))
	slot0._paintingAnimator.enabled = false
	slot0._paintingParticleContainer = findTF(slot2, "particleContainer")
	slot0._paintingParticles = findTF(slot0._paintingParticleContainer, "effect")
	slot0._paintingParticleSystem = slot0._paintingParticles:GetComponent(typeof(ParticleSystem))

	slot0._paintingParticleSystem:Stop(true)

	slot0._paintingFitter = findTF(slot2, "hero/fitter")

	removeAllChildren(slot0._paintingFitter)

	GetOrAddComponent(slot0._paintingFitter, "PaintingScaler").FrameName = "lihuisha"
	GetOrAddComponent(slot0._paintingFitter, "PaintingScaler").Tween = 1

	slot2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		setActive(slot0._currentPainting, false)

		slot0._currentPainting = nil
	end)
end

function slot0.EnableSkillFloat(slot0, slot1)
	if slot1 == slot0._skillFloat then
		return
	end

	slot0._skillFloat = slot1

	if slot0._skillFloat then
		for slot5, slot6 in ipairs(slot0._cacheSkill) do
			slot0:appendSkill(slot6.skillName, slot6.caster, slot6.commander, slot6.hrzIcon)
		end

		slot0._cacheSkill = {}
	else
		slot0._skillFloatPool:AllRecycle()
		slot0._skillFloatCMDPool:AllRecycle()

		slot0._preCommanderSkillTF = nil
		slot0._preSkillTF = nil
	end

	SetActive(slot0.skillTips, slot1)
end

function slot0.appendSkill(slot0, slot1, slot2, slot3, slot4)
	if not slot0._skillFloat then
		table.insert(slot0._cacheSkill, {
			skillName = slot1,
			caster = slot2,
			commander = slot3,
			hrzIcon = slot4
		})

		return
	end

	slot5 = ys.Battle.BattleResourceManager.GetInstance()
	slot6, slot7 = nil

	if slot3 then
		if slot0._commanderSkillList[slot3] and slot0._commanderSkillList[slot3][slot1] then
			return
		end

		slot6 = slot0._skillFloatCMDPool
		slot7 = slot5:GetCommanderHrzIcon(slot3)
	else
		slot6 = slot0._skillFloatPool

		if slot2:GetUnitType() == ys.Battle.BattleConst.UnitType.PLAYER_UNIT then
			slot7 = slot5:GetCharacterIcon(slot4 or slot2:GetTemplate().painting)
		else
			slot7 = slot5:GetCharacterIcon(pg.enemy_data_statistics[slot2:GetTemplateID()].icon)
		end
	end

	slot6:GetObject().transform.localScale = slot0.SKILL_FLOAT_SCALE

	setText(findTF(slot9, "skill/skill_name/Text"), HXSet.hxLan(slot1))

	findTF(slot9, "skill/icon").GetComponent(slot10, typeof(Image)).sprite = slot7
	slot12, slot13 = slot2:GetIFF()
	findTF(slot9, "skill/skill_name"):GetComponent(typeof(Image)).color = (slot2:GetIFF() ~= ys.Battle.BattleConfig.FRIENDLY_CODE or Color.New(1, 1, 1, 1)) and Color.New(1, 0.33, 0.33, 1)
	findTF(slot9, "skill"):GetComponent(typeof(Image)).color = (slot2.GetIFF() ~= ys.Battle.BattleConfig.FRIENDLY_CODE or Color.New(1, 1, 1, 1)) and Color.New(1, 0.33, 0.33, 1)

	if slot3 then
		slot0:commanderSkillFloat(slot3, slot1, slot8)
	else
		slot16 = table.contains(TeamType.SubShipType, slot2:GetTemplate().type)
		slot17 = slot2:GetMainUnitIndex()

		if ys.Battle.BattleCameraUtil.GetInstance():GetCharacterArrowBarPosition(slot14) == nil or (slot15 == nil and slot16 and not slot2:IsMainFleetUnit()) then
			slot9.position = Vector3((slot12 ~= ys.Battle.BattleConfig.FRIENDLY_CODE or slot1.CameraPosToUICamera(slot2:GetPosition():Clone():Add(slot0.IN_VIEW_FRIEND_SKILL_OFFSET))) and slot1.CameraPosToUICamera(slot2:GetPosition():Clone():Add(slot0.IN_VIEW_FOE_SKILL_OFFSET)).x, (slot12 ~= ys.Battle.BattleConfig.FRIENDLY_CODE or slot1.CameraPosToUICamera(slot2.GetPosition().Clone().Add(slot0.IN_VIEW_FRIEND_SKILL_OFFSET))) and slot1.CameraPosToUICamera(slot2.GetPosition().Clone().Add(slot0.IN_VIEW_FOE_SKILL_OFFSET)).y, -2)

			if slot0._preSkillTF then
				slot0.handleSkillFloatCld(slot0._preSkillTF, slot9)
			end

			slot0._preSkillTF = slot9

			slot9:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
				slot0._preSkillTF = nil

				slot0:Recycle(slot0)
			end)
		else
			slot18 = nil
			slot19 = slot0.SIDE_ALIGNMENT[slot17]

			for slot24 = 1, #slot0._sideSkillFloatStateList[slot12][slot17], 1 do
				if slot20[slot24] then
					slot18 = slot24

					break
				end
			end

			if slot18 == nil then
				slot18 = #slot20 + 1
			end

			slot20[slot18] = false
			slot9.position = slot15
			slot9.anchoredPosition.y = slot19[slot18]

			if slot12 == ys.Battle.BattleConfig.FOE_CODE then
				slot21.x = slot0.FOE_SIDE_X_OFFSET
			end

			slot9.anchoredPosition = slot21

			slot9:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
				slot0[] = true

				slot0:Recycle(true)
			end)
		end
	end
end

function slot0.appendSkillCover(slot0, slot1, slot2, slot3)
	slot0:appendSkill(slot1, slot2, nil, slot3)
end

function slot0.handleSkillFloatCld(slot0, slot1)
	if math.floor(math.abs(slot1.anchoredPosition.y - slot0.anchoredPosition.y)) <= 112.5 then
		slot2.y = slot3 + 112.5
		slot1.anchoredPosition = slot2
	end
end

function slot0.handleSkillSinkCld(slot0, slot1)
	return
end

function slot0.commanderSkillFloat(slot0, slot1, slot2, slot3)
	slot0._commanderSkillList[slot1] = slot0._commanderSkillList[slot1] or {}
	slot0._commanderSkillList[slot1][slot2] = true
	slot3.transform.anchoredPosition.x = 0
	slot3.transform.anchoredPosition.y = 0
	slot3.transform.anchoredPosition = slot3.transform.anchoredPosition

	if slot0._preCommanderSkillTF and math.floor(math.abs(slot5.y - slot0._preCommanderSkillTF.anchoredPosition.y)) <= 97.5 then
		slot5.y = slot6 - 97.5
	end

	slot4.anchoredPosition = slot5
	slot0._preCommanderSkillTF = slot4

	slot4:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		slot0._commanderSkillList[][slot0._commanderSkillList] = nil
		slot0._preCommanderSkillTF = nil

		slot0._skillFloatCMDPool:Recycle(nil)
	end)
end

function slot0.painting(slot0, slot1, slot2, slot3)
	if slot0._currentPainting then
		slot0._paintingAnimator.enabled = false

		setActive(slot0._currentPainting, false)
	end

	if slot0._skillPaintings[slot1.id] == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-25, warpins: 1 ---
		slot5 = ys.Battle.BattleResourceManager.GetInstance()
		slot4 = ys.Battle.BattleResourceManager.GetInstance().InstPainting
		slot6 = slot1.painting or slot1.prefab
		slot0._skillPaintings[slot1.id] = slot4(ys.Battle.BattleResourceManager.GetInstance(), slot6)

		setParent(slot4(ys.Battle.BattleResourceManager.GetInstance(), slot6), slot0._paintingFitter, false)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-26, warpins: 1 ---
		slot6 = slot1.prefab
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-35, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	slot0._currentPainting = slot0._skillPaintings[slot1.id]

	setActive(slot0._currentPainting, true)
	LuaHelper.SetParticleSpeed(slot0._paintingUI, slot2)

	slot0._paintingUI.transform.localScale = Vector3(slot3, 1, 1)
	slot0._paintingParticleContainer.transform.localScale = Vector3(slot3, 1, 1)
	slot0._paintingParticles.transform.localEulerAngles = Vector3(0, 90 * slot3, 0)

	slot0._paintingParticleSystem:Play(true)

	slot0._paintingAnimator.speed = slot2
	slot0._paintingAnimator.enabled = true

	slot0._paintingAnimator:Play("skill_painting", -1, 0)
end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-119, warpins: 1 ---
	setActive(slot0._tf, false)

	GetComponent(slot0._tf, typeof(AspectRatioFitter)).enabled = true
	slot1 = ys.Battle.BattleState.GetInstance()

	slot1:SetBattleUI(slot0)
	onButton(slot0, slot0:findTF("PauseBtn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(BattleMediator.ON_PAUSE)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)
	onButton(slot0, slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		slot0:emit(BattleMediator.ON_CHAT, slot0:findTF("chatContainer"))
		setActive(slot0, false)

		return
		--- END OF BLOCK #0 ---



	end)
	onToggle(slot0, slot0:findTF("AutoBtn"), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		slot0:emit(BattleMediator.ON_AUTO, {
			isOn = not slot0,
			toggle = slot0:findTF("AutoBtn")
		})
		slot0.emit:ActiveBot(ys.Battle.BattleState.IsAutoBotActive())
		setActive(slot0.emit, slot1:ChatUseable())

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL, SFX_PANEL)
	slot1:ConfigBattleEndFunc(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		slot0:clear()
		slot0:emit(BattleMediator.ON_BATTLE_RESULT, slot0)

		return
		--- END OF BLOCK #0 ---



	end)

	slot4 = {
		ys.Battle.BattleConst.BuffEffectType.ON_START_GAME,
		ys.Battle.BattleConst.BuffEffectType.ON_FLAG_SHIP,
		ys.Battle.BattleConst.BuffEffectType.ON_CONSORT,
		ys.Battle.BattleConst.BuffEffectType.ON_LEADER,
		ys.Battle.BattleConst.BuffEffectType.ON_REAR,
		ys.Battle.BattleConst.BuffEffectType.ON_SUB_LEADER,
		ys.Battle.BattleConst.BuffEffectType.ON_SUB_CONSORT
	}
	slot0._skillFloatPool = pg.Pool.New(slot0.skillRoot, slot0.skillTpl, 0 + slot6(slot0.contextData.battleData.MainUnitList) + slot6(slot0.contextData.battleData.VanguardUnitList) + slot6(slot0.contextData.battleData.SubUnitList) + 2, 10, true, false):InitSize()

	slot0:emit(BattleMediator.ENTER)
	slot0:initPauseWindow()

	if slot0.contextData.prePause then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 120-125, warpins: 1 ---
		triggerButton(slot0:findTF("PauseBtn"))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 126-133, warpins: 2 ---
	setActive(slot2, slot1:ChatUseable())

	return
	--- END OF BLOCK #1 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if isActive(slot0.pauseWindow) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 1 ---
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.continueBtn)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.activeBotHelp(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = getProxy(PlayerProxy)

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		if slot0.autoBotHelp then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-15, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():hide()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-16, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-19, warpins: 1 ---
	if slot2.botHelp then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-20, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-48, warpins: 1 ---
	slot0.autoBotHelp = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		type = MSGBOX_TYPE_HELP,
		helps = i18n("help_battle_auto"),
		custom = {
			{
				text = "text_iknow",
				sound = SFX_CANCEL
			}
		},
		onClose = function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot0.autoBotHelp = false

			return
			--- END OF BLOCK #0 ---



		end
	})

	slot2.botHelp = true

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 49-49, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 50-50, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot0.exitBattle(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-8, warpins: 1 ---
		slot0:emit(BattleMediator.ON_BACK_PRE_SCENE)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		if slot1 == "kick" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-11, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.setChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._chapter = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.setFleet(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0._mainShipVOs = slot1
	slot0._vanShipVOs = slot2

	return
	--- END OF BLOCK #0 ---



end

function slot0.initPauseWindow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	slot0.pauseWindow = slot0:findTF("Msgbox")
	slot0.LeftTimeContainer = slot0:findTF("window/LeftTime", slot0.pauseWindow)
	slot0.LeftTime = slot0:findTF("window/LeftTime/Text", slot0.pauseWindow)
	slot0.mainTFs = {}
	slot0.vanTFs = {}

	function slot1(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-43, warpins: 0 ---
		for slot6 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-14, warpins: 2 ---
			slot8 = setActive
			slot9 = slot1:Find("ship_" .. slot6)

			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-17, warpins: 1 ---
				if slot6 > #slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-19, warpins: 1 ---
					slot10 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-20, warpins: 1 ---
					slot10 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-23, warpins: 3 ---
			slot8(slot9, slot10)

			if slot2 and slot6 <= #slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 27-30, warpins: 1 ---
				updateShip(slot7, slot2[slot6])
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 31-34, warpins: 3 ---
			slot8 = table.insert

			if not slot0 or not slot0.mainTFs then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-40, warpins: 2 ---
				slot9 = slot0.vanTFs
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 41-43, warpins: 2 ---
			slot8(slot9, slot7)
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 44-45, warpins: 1 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-50, warpins: 1 ---
			slot3 = 0

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 51-56, warpins: 0 ---
			for slot7, slot8 in ipairs(slot2) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-54, warpins: 1 ---
				slot3 = slot3 + slot8:getShipCombatPower()
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 55-56, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 57-66, warpins: 1 ---
			setText(slot1:Find("power/value"), math.floor(slot3))
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 67-67, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end

	if slot0._mainShipVOs then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-43, warpins: 1 ---
		slot1(true, slot0:findTF("window/main", slot0.pauseWindow), slot0._mainShipVOs)
		slot1(false, slot0:findTF("window/van", slot0.pauseWindow), slot0._vanShipVOs)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 44-62, warpins: 2 ---
	slot3 = findTF(slot0.pauseWindow, "window/Chapter")
	slot4 = findTF(slot0.pauseWindow, "window/Chapter/Text")

	if ys.Battle.BattleState.GetInstance().GetBattleType(slot2) == SYSTEM_SCENARIO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-80, warpins: 1 ---
		setText(slot3, slot0._chapter:getConfigTable().chapter_name)
		setText(slot4, string.split(slot0._chapter.getConfigTable().name, "|")[1])
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-83, warpins: 1 ---
		if slot5 == SYSTEM_SHAM then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 84-101, warpins: 1 ---
			setText(slot3, "SP")
			setText(slot4, string.split(slot0._chapter:getConfig("name"), "|")[1])
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 102-104, warpins: 1 ---
			if slot5 == SYSTEM_ROUTINE or slot5 == SYSTEM_DUEL or slot5 == SYSTEM_HP_SHARE_ACT_BOSS or slot5 == SYSTEM_BOSS_EXPERIMENT or slot5 == SYSTEM_ACT_BOSS then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 117-139, warpins: 5 ---
				setText(slot3, "SP")
				setText(slot4, pg.expedition_data_template[slot2:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().StageTmpId].name)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 140-142, warpins: 1 ---
				if slot5 == SYSTEM_DEBUG then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 143-151, warpins: 1 ---
					setText(slot3, "??")
					setText(slot4, "碧蓝梦境")
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 152-154, warpins: 1 ---
					if slot5 == SYSTEM_CHALLENGE then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 155-171, warpins: 1 ---
						setText(slot3, "SP")
						setText(slot4, slot0._chapter:getNextExpedition().chapter_name[2])
						setActive(slot0.LeftTimeContainer, true)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 172-220, warpins: 6 ---
	onButton(slot0, slot0:findTF("window/button_container/leave", slot0.pauseWindow), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:emit(BattleMediator.ON_LEAVE)

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.continueBtn = slot0:findTF("window/button_container/continue", slot0.pauseWindow)

	onButton(slot0, slot0.continueBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		setActive(slot0.pauseWindow, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)
		pg.UIMgr.GetInstance():Resume()

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0:findTF("help", slot0.pauseWindow), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if BATTLE_DEBUG and PLATFORM == 7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-31, warpins: 1 ---
			setActive(slot0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)
			pg.UIMgr.GetInstance():Resume()
			pg.UIMgr.GetInstance():OpenConsole()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-45, warpins: 2 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_battle_rule")
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-46, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	onButton(slot0, slot0:findTF("window/top/btnBack", slot0.pauseWindow), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(slot0.continueBtn)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.pauseWindow, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(slot0.continueBtn)

		return
		--- END OF BLOCK #0 ---



	end)
	setActive(slot0.pauseWindow, false)

	return
	--- END OF BLOCK #2 ---



end

function slot0.updatePauseWindow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.pauseWindow then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-67, warpins: 1 ---
	setActive(slot0.pauseWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.pauseWindow)

	slot3 = ys.Battle.BattleState.GetInstance().GetProxyByName(slot2, ys.Battle.BattleDataProxy.__name)
	slot4 = slot3:GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE)

	slot1(slot0._mainShipVOs, slot5, slot0.mainTFs)
	slot1(slot0._vanShipVOs, slot6, slot0.vanTFs)
	setText(slot0.LeftTime, ys.Battle.BattleTimerView.formatTime(math.floor(slot3:GetCountDown())))

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 68-68, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

function slot0.OnCloseChat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	setActive(slot0:findTF("chatBtn"), ys.Battle.BattleState.GetInstance():IsBotActive())

	return
	--- END OF BLOCK #0 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0._preSkillTF = nil
	slot0._preCommanderSkillTF = nil
	slot0._commanderSkillList = nil
	slot0._skillPaintings = nil
	slot0._currentPainting = nil

	Destroy(slot0._paintingUI)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot0._skillFloatPool:Dispose()
	slot0._skillFloatCMDPool:Dispose()
	ys.Battle.BattleState.GetInstance():ExitBattle()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

return slot0
