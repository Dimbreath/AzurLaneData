ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
ys.Battle.BattleDebugConsole = class("BattleDebugConsole")
ys.Battle.BattleDebugConsole.__name = "BattleDebugConsole"
ys.Battle.BattleDebugConsole.ProxyUpdateNormal = ys.Battle.BattleDataProxy.Update
ys.Battle.BattleDebugConsole.ProxyUpdateAutoComponentNormal = ys.Battle.BattleDataProxy.UpdateAutoComponent
ys.Battle.BattleDebugConsole.UPDATE_PLAYER_WEAPON = "updatePlayerWeapon"
ys.Battle.BattleDebugConsole.UPDATE_MONSTER_WEAPON = "updateMonsterWeapon"
ys.Battle.BattleDebugConsole.UPDATE_MONSTER_AI = "updateMonsterAI"

function ys.Battle.BattleDebugConsole.Ctor(slot0, slot1, slot2)
	slot0._go = slot1
	slot0._state = slot2
	slot0._dataProxy = slot0._state:GetProxyByName(slot0.Battle.BattleDataProxy.__name)

	slot0:initComponent()

	if slot0._dataProxy:GetInitData().battleType == SYSTEM_DEBUG then
		slot0:initData()
		slot0:initDebug()
	else
		SetActive(slot0._debug, false)
	end
end

function ys.Battle.BattleDebugConsole.initDebug(slot0)
	slot0._randomEngage = slot0._debug:Find("spawn_enemy")

	onButton(nil, slot0._randomEngage, function ()
		slot0 = math.random(#slot0._monsterArray)

		slot0:spawnEnemy(slot0._monsterArray[slot0], 15, 25, 25, 65)
	end, SFX_PANEL)

	slot0._summon = slot0._debug:Find("summon_enemy")
	slot0._summonID = slot0._debug:Find("model_id"):GetComponent("InputField")
	slot0._minX = slot0._debug:Find("x_min"):GetComponent("InputField")
	slot0._manX = slot0._debug:Find("x_max"):GetComponent("InputField")
	slot0._minZ = slot0._debug:Find("z_min"):GetComponent("InputField")
	slot0._manZ = slot0._debug:Find("z_max"):GetComponent("InputField")

	onButton(nil, slot0._summon, function ()
		slot0 = tonumber(slot0._summonID.text)

		slot0:spawnEnemy(slot0, tonumber(slot0._minX.text), tonumber(slot0._manX.text), tonumber(slot0._minZ.text), tonumber(slot0._manZ.text))
	end, SFX_PANEL)

	slot0._killAllEnemy = slot0._debug:Find("clear_enemy")

	onButton(nil, slot0._killAllEnemy, function ()
		slot0._dataProxy:KillAllEnemy()
	end, SFX_PANEL)

	slot0._summonStrike = slot0._debug:Find("spawn_strike")
	slot0._summonStrikeID = slot0._debug:Find("air_model_id"):GetComponent("InputField")
	slot0._summonStrikeTotal = slot0._debug:Find("total"):GetComponent("InputField")
	slot0._summonStrikeSingular = slot0._debug:Find("once"):GetComponent("InputField")
	slot0._summonStrikeInterval = slot0._debug:Find("interval"):GetComponent("InputField")

	onButton(nil, slot0._summonStrike, function ()
		slot0 = tonumber(slot0._summonStrikeID.text)

		slot0:spawnStrike(slot0, tonumber(slot0._summonStrikeTotal.text), tonumber(slot0._summonStrikeSingular.text), tonumber(slot0._summonStrikeInterval.text))
	end, SFX_PANEL)

	slot0._killAllStrike = slot0._debug:Find("clear_strike")

	onButton(nil, slot0._killAllStrike, function ()
		slot0._dataProxy:KillAllAirStrike()
	end, SFX_PANEL)

	slot0._blockCld = slot0._debug:Find("all_cld")
	slot0._blockPlayerWeapon = slot0._debug:Find("player_weapon")
	slot0._blockMonsterWeapon = slot0._debug:Find("monster_weapon")
	slot0._blockMonsterAI = slot0._debug:Find("monster_motion")

	onToggle(nil, slot0._blockCld, function (slot0)
		if slot0 then
			slot0._dataProxy.Update = slot1.ProxyUpdateNormal
		else
			slot0._dataProxy.Update = slot0._dataProxy.__debug__BlockCldUpdate__
		end
	end, SFX_PANEL)
	onToggle(nil, slot0._blockPlayerWeapon, function (slot0)
		if slot0 then
			slot0._autoComponentFuncList.updatePlayerWeapon = slot0._updatePlayerWeapon
		else
			slot0._autoComponentFuncList.updatePlayerWeapon = nil
		end
	end, SFX_PANEL)
	onToggle(nil, slot0._blockMonsterWeapon, function (slot0)
		if slot0 then
			slot0._autoComponentFuncList.updateMonsterWeapon = slot0._updateMonsterWeapon
		else
			slot0._autoComponentFuncList.updateMonsterWeapon = nil
		end
	end, SFX_PANEL)
	onToggle(nil, slot0._blockMonsterAI, function (slot0)
		if slot0 then
			slot0._autoComponentFuncList.updateMonsterAI = slot0._updateMonsterAI
		else
			slot0._autoComponentFuncList.updateMonsterAI = nil
		end
	end, SFX_PANEL)

	slot0._setDungeonLevel = slot0._debug:Find("dungeon_level")
	slot0._dungeonLevel = slot0._debug:Find("level_input"):GetComponent("InputField")

	onButton(nil, slot0._setDungeonLevel, function ()
		slot0._dataProxy:SetDungeonLevel(tonumber(slot0._dungeonLevel.text))
	end, SFX_PANEL)

	slot0._clsBullet = slot0._debug:Find("cls_bullet")

	onButton(nil, slot0._clsBullet, function ()
		slot0._dataProxy:CLSBullet(slot1.FRIENDLY_CODE)
		slot0._dataProxy.CLSBullet._dataProxy:CLSBullet(slot1.FOE_CODE)
	end, SFX_PANEL)
end

function ys.Battle.BattleDebugConsole.initData(slot0)
	slot0._fleetList = slot0._dataProxy:GetFleetList()
	slot0._freeShipList = slot0._dataProxy:GetFreeShipList()
	slot0._monsterArray = {}

	for slot4, slot5 in pairs(pg.enemy_data_statistics) do
		if type(slot4) == "number" and slot4 <= 10000000 then
			table.insert(slot0._monsterArray, slot4)
		end
	end

	function slot0._updatePlayerWeapon(slot0)
		for slot4, slot5 in pairs(slot0._fleetList) do
			slot5:UpdateAutoComponent(slot0)
		end
	end

	function slot0._updateMonsterWeapon(slot0)
		for slot4, slot5 in pairs(slot0._freeShipList) do
			slot5:UpdateWeapon(slot0)
		end
	end

	function slot0._updateMonsterAI(slot0)
		for slot4, slot5 in pairs(slot0._dataProxy._teamList) do
			if slot5:IsFatalDamage() then
				slot0._dataProxy:KillNPCTeam(slot4)
			else
				slot5:UpdateMotion()
			end
		end
	end

	slot0._autoComponentFuncList = {
		updatePlayerWeapon = slot0._updatePlayerWeapon,
		updateMonsterWeapon = slot0._updateMonsterWeapon,
		updateMonsterAI = slot0._updateMonsterAI
	}

	function slot0._dataProxy.UpdateAutoComponent(slot0, slot1)
		for slot5, slot6 in pairs(slot0._autoComponentFuncList) do
			slot6(slot1)
		end
	end
end

function ys.Battle.BattleDebugConsole.initComponent(slot0)
	slot0._base = slot0._go:Find("bg")
	slot0._common = slot0._base:Find("common")
	slot0._debug = slot0._base:Find("debug")
	slot0._exitBtn = slot0._common:Find("close")

	onButton(nil, slot0._exitBtn, function ()
		slot0:SetActive(false)
	end, SFX_PANEL)

	slot0._activeReference = slot0._common:Find("reference_switch")

	onButton(nil, slot0._activeReference, function ()
		slot0:activeReference()
	end, SFX_PANEL)

	slot0._lockCommonDMG = slot0._common:Find("common_damage")
	slot0._lockS2MDMG = slot0._common:Find("ship2main_damage")
	slot0._lockA2MDMG = slot0._common:Find("aircraft2main_damage")
	slot0._lockCrushDMG = slot0._common:Find("crush_damage")

	onToggle(nil, slot0._lockCommonDMG, function (slot0)
		slot0._dataProxy:SetupCalculateDamage((slot0 and slot0._dataProxy.SetupCalculateDamage.Battle.BattleFormulas.CalcDamageLock) or nil)
	end, SFX_PANEL)
	onToggle(nil, slot0._lockS2MDMG, function (slot0)
		slot0._dataProxy:SetupDamageKamikazeAir((slot0 and slot0._dataProxy.SetupDamageKamikazeAir.Battle.BattleFormulas.CalcDamageLockA2M) or nil)
	end, SFX_PANEL)
	onToggle(nil, slot0._lockA2MDMG, function (slot0)
		slot0._dataProxy:SetupDamageKamikazeShip((slot0 and slot0._dataProxy.SetupDamageKamikazeShip.Battle.BattleFormulas.CalcDamageLockS2M) or nil)
	end, SFX_PANEL)
	onToggle(nil, slot0._lockCrushDMG, function (slot0)
		slot0._dataProxy:SetupDamageCrush((slot0 and slot0._dataProxy.SetupDamageCrush.Battle.BattleFormulas.CalcDamageLockCrush) or nil)
	end, SFX_PANEL)

	slot0._triggerWave = slot0._common:Find("wave_trigger")
	slot0._waveIndex = slot0._common:Find("wave_input"):GetComponent("InputField")

	if slot0._dataProxy:GetInitData().battleType ~= SYSTEM_SCENARIO and slot0._dataProxy:GetInitData().battleType ~= SYSTEM_ROUTINE and slot0._dataProxy:GetInitData().battleType ~= SYSTEM_ACT_BOSS then
		SetActive(slot0._triggerWave, false)
		SetActive(slot0._waveIndex, false)
	else
		onButton(nil, slot0._triggerWave, function ()
			slot0:forceTrigger(tonumber(slot0._waveIndex.text))
		end)
	end

	slot0._white = slot0._base:Find("white_button")

	onButton(nil, slot0._white, function ()
		for slot3, slot4 in pairs(slot0._dataProxy._foeShipList) do
			slot4:UpdateHP(-1000, {})
		end
	end, SFX_PANEL)
	SetActive(slot0._white, true)
end

function ys.Battle.BattleDebugConsole.SetActive(slot0, slot1)
	SetActive(slot0._go, slot1)
end

function ys.Battle.BattleDebugConsole.spawnEnemy(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._dataProxy:SpawnMonster({
		monsterTemplateID = slot1,
		corrdinate = {
			math.random(slot2, slot3),
			0,
			math.random(slot4, slot5)
		},
		delay = 0,
		moveCast = true,
		score = 0,
		buffList = {
			8001
		}
	}, 1, slot0.UnitType.ENEMY_UNIT, slot1.FOE_CODE)
end

function ys.Battle.BattleDebugConsole.spawnStrike(slot0, slot1, slot2, slot3, slot4)
	slot0._dataProxy:SpawnAirFighter({
		templateID = slot1,
		weaponID = {},
		attr = {},
		totalNumber = slot2,
		onceNumber = slot3,
		formation = 10006,
		delay = 0,
		interval = slot4,
		score = 0
	})
end

function ys.Battle.BattleDebugConsole.activeReference(slot0)
	slot0._state:ActiveReference()
	slot0._state:AddMediator(slot0.Battle.BattleReferenceBoxMediator.New())
	pg.TipsMgr.GetInstance():ShowTips("┏━━━━━━━━━━━━━━━━━━━┓")
	pg.TipsMgr.GetInstance():ShowTips("┃ヽ(•̀ω•́ )ゝ战斗调试模块初始化成功！(ง •̀_•́)ง┃")
	pg.TipsMgr.GetInstance():ShowTips("┗━━━━━━━━━━━━━━━━━━━┛")

	slot0._activeReference.transform:GetComponent("Button").enabled = false
	slot0._activeReference:Find("text"):GetComponent(typeof(Text)).text = "(ﾉ･ω･)ﾉﾞ"
	slot0._referenceConsole = slot0._common:Find("reference_btns")

	SetActive(slot0._referenceConsole, true)

	slot0._speedUp = slot0._referenceConsole:Find("speed_up")
	slot0._speedDown = slot0._referenceConsole:Find("speed_down")
	slot0._speedLevel = slot0._referenceConsole:Find("speed")

	onButton(nil, slot0._speedUp, function ()
		if slot0.Battle.BattleConfig.BASIC_TIME_SCALE < 1 then
			slot0.Battle.BattleControllerCommand.removeSpeed(2)
		elseif slot0 >= 1 then
			slot0.Battle.BattleControllerCommand.addSpeed(2)
		end

		slot1._speedLevel:GetComponent(typeof(Text)).text = slot0.Battle.BattleConfig.BASIC_TIME_SCALE

		slot1._speedLevel.GetComponent(typeof(Text))._state:ScaleTimer()
	end, SFX_PANEL)
	onButton(nil, slot0._speedDown, function ()
		if slot0.Battle.BattleConfig.BASIC_TIME_SCALE > 1 then
			slot0.Battle.BattleControllerCommand.removeSpeed(0.5)
		elseif slot0 <= 1 then
			slot0.Battle.BattleControllerCommand.addSpeed(0.5)
		end

		slot1._speedLevel:GetComponent(typeof(Text)).text = slot0.Battle.BattleConfig.BASIC_TIME_SCALE

		slot1._speedLevel.GetComponent(typeof(Text))._state:ScaleTimer()
	end, SFX_PANEL)

	slot1 = slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name)
	slot0._shipBox = slot0._referenceConsole:Find("ship_box")
	slot0._bulletBox = slot0._referenceConsole:Find("bullet_box")
	slot0._pp = slot0._referenceConsole:Find("property_panel")

	onToggle(nil, slot0._shipBox, function (slot0)
		slot0:ActiveUnitBoxes(slot0)
	end, SFX_PANEL)
	onToggle(nil, slot0._bulletBox, function (slot0)
		slot0:ActiveBulletBoxes(slot0)
	end, SFX_PANEL)
	onToggle(nil, slot0._pp, function (slot0)
		slot0:ActiveUnitDetail(slot0)
	end, SFX_PANEL)
end

function ys.Battle.BattleDebugConsole.forceTrigger(slot0, slot1)
	if slot0._state:GetCommandByName("BattleSingleDungeonCommand")._waveUpdater._waveInfoList[slot1] == nil then
		pg.TipsMgr.GetInstance():ShowTips("查无次波")
	elseif slot3:GetState() ~= slot3.STATE_DEACTIVE then
		pg.TipsMgr.GetInstance():ShowTips("该触发器已经触发")
	else
		slot3:DoWave()
	end
end

return
