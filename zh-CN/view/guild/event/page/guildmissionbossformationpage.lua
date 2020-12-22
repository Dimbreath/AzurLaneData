slot0 = class("GuildMissionBossFormationPage", import(".GuildEventBasePage"))

function slot0.getUIName(slot0)
	return "GuildBossFormationPage"
end

function slot0.OnLoaded(slot0)
	slot0.closeBtn = slot0:findTF("frame/close")
	slot0.descTxt = slot0:findTF("frame/bottom/target/scrollrect/Text"):GetComponent(typeof(Text))
	slot0.awardList = UIItemList.New(slot0:findTF("frame/bottom/award/list"), slot0:findTF("frame/bottom/award/list/item"))
	slot0.titleTxt = slot0:findTF("frame/title"):GetComponent(typeof(Text))
	slot0.goBtn = slot0:findTF("frame/bottom/go")
	slot0.consumeTxt = slot0:findTF("oil/Text", slot0.goBtn):GetComponent(typeof(Text))
	slot0.recomBtn = slot0:findTF("frame/recom")
	slot0.clearBtn = slot0:findTF("frame/clear")
	slot0.grids = slot0:findTF("frame/double")
	slot0.subGrids = slot0:findTF("frame/single")
	slot0.nextBtn = slot0:findTF("frame/next")
	slot0.prevBtn = slot0:findTF("frame/prev")
	slot0.commanderTF = slot0:findTF("frame/commander")
	slot0.pos1 = slot0:findTF("commander1", slot0.commanderTF)
	slot0.pos2 = slot0:findTF("commander2", slot0.commanderTF)

	setText(slot0:findTF("oil/label", slot0.goBtn), i18n("text_consume"))

	slot0.shipGos = {}
end

function slot0.OnInit(slot0)
	onButton(slot0, slot0.nextBtn, function ()
		uv0:UpdateFleet(GuildBossMission.SUB_FLEET_ID)
	end, SFX_PANEL)
	onButton(slot0, slot0.prevBtn, function ()
		uv0:UpdateFleet(GuildBossMission.MAIN_FLEET_ID)
	end, SFX_PANEL)
	onButton(slot0, slot0.closeBtn, function ()
		if uv0.contextData.editBossFleet then
			uv0:emit(GuildEventMediator.ON_SAVE_FORMATION, function ()
				uv0:Hide()
			end)
		else
			uv0:Hide()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.goBtn, function ()
		uv0:emit(GuildEventMediator.ON_UPDATE_BOSS_FLEET)
	end, SFX_PANEL)
	onButton(slot0, slot0.recomBtn, function ()
		uv0:emit(GuildEventMediator.ON_RECOMM_BOSS_BATTLE_SHIPS, uv0.fleet.id)
	end, SFX_PANEL)
	onButton(slot0, slot0.clearBtn, function ()
		uv0.contextData.editBossFleet = {}
		slot0 = uv0.contextData.bossFormationIndex or GuildBossMission.MAIN_FLEET_ID
		slot1 = Clone(uv0.fleet)

		slot1:RemoveAll()

		uv0.contextData.editBossFleet[slot0] = slot1

		uv0:UpdateFleet(slot0)
	end, SFX_PANEL)
end

function slot0.UpdateMission(slot0, slot1, slot2)
	slot0.bossMission = slot1

	if slot2 then
		slot0:UpdateFleet(slot0.contextData.bossFormationIndex or GuildBossMission.MAIN_FLEET_ID)
	end
end

function slot0.OnShow(slot0)
	slot0.guild = slot0.guild

	slot0:UpdateMission(slot0.extraData.mission, true)
	slot0:UpdateDesc()
	slot0:CheckCommanderPanel()

	slot0.consumeTxt.text = string.format("<color=%s>%d</color>/%d", pg.guildset.use_oil.key_value <= getProxy(PlayerProxy):getRawData():getResource(2) and COLOR_GREEN or COLOR_RED, slot3, slot2)
end

function slot0.CheckCommanderPanel(slot0)
	setActive(slot0.commanderTF, pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator") and not LOCK_COMMANDER)
end

function slot0.UpdateDesc(slot0)
	slot1 = slot0.bossMission
	slot0.descTxt.text = i18n("guild_boss_fleet_desc")

	slot0.awardList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			updateDrop(slot2, {
				type = slot3[1],
				id = slot3[2],
				count = slot3[3]
			})
			onButton(uv1, slot2, function ()
				uv0:emit(BaseUI.ON_DROP, uv1)
			end, SFX_PANEL)
		end
	end)
	slot0.awardList:align(#slot1:GetAwards())

	slot0.titleTxt.text = slot1:GetName()
end

function slot0.UpdateFleet(slot0, slot1)
	slot3 = nil
	slot3 = (not slot0.contextData.editBossFleet or not slot0.contextData.editBossFleet[slot1] or slot0.contextData.editBossFleet[slot1]) and slot0.bossMission:GetFleetByIndex(slot1)
	slot0.fleet = slot3

	slot0:UpdateShips(slot3)
	slot0:UpdateCommanders(slot3)

	slot0.contextData.bossFormationIndex = slot1

	setActive(slot0.nextBtn, slot1 == GuildBossMission.MAIN_FLEET_ID)
	setActive(slot0.prevBtn, slot1 == GuildBossMission.SUB_FLEET_ID)
end

function slot0.UpdateCommanders(slot0, slot1)
	for slot6 = 1, CommanderConst.MAX_FORMATION_POS do
		slot0:updateCommander(slot0["pos" .. slot6], slot6, slot1:getCommanders()[slot6])
	end
end

function slot0.updateCommander(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("add")
	slot5 = slot1:Find("info")

	if slot3 then
		slot7 = slot1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot3:getPainting(), "", slot1:Find("info/mask/icon"))

		if slot1:Find("info/name") then
			setText(slot8, slot3:getName())
		end

		setImageSprite(slot7, GetSpriteFromAtlas("weaponframes", "commander_" .. Commander.rarity2Frame(slot3:getRarity())))
	end

	onButton(slot0, slot5, function ()
		uv0:emit(GuildEventMediator.ON_SELECT_COMMANDER, uv0.fleet.id, uv1, uv2)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		uv0:emit(GuildEventMediator.ON_SELECT_COMMANDER, uv0.fleet.id, uv1, uv2)
	end, SFX_PANEL)
	setActive(slot4, not slot3)
	setActive(slot5, slot3)
end

function slot0.UpdateShips(slot0, slot1)
	slot0:ClearShips()

	slot3 = {}
	slot5 = {}

	for slot9, slot10 in ipairs(slot1:GetShips()) do
		if slot10 and slot10.ship then
			if slot10.ship:getTeamType() == TeamType.Vanguard then
				table.insert({}, slot10)
			elseif slot11 == TeamType.Main then
				table.insert(slot3, slot10)
			elseif slot11 == TeamType.Submarine then
				table.insert(slot5, slot10)
			end
		end
	end

	if slot1:IsMainFleet() then
		slot0:UpdateMainFleetShips(slot3, slot4)
	else
		slot0:UpdateSubFleetShips(slot5)
	end

	setActive(slot0.grids, slot6)
	setActive(slot0.subGrids, not slot6)
end

function slot0.UpdateMainFleetShips(slot0, slot1, slot2)
	for slot6 = 1, 3 do
		slot0:UpdateShip(slot0.grids:Find(slot6), TeamType.Main, slot1[slot6])
	end

	for slot6 = 4, 6 do
		slot0:UpdateShip(slot0.grids:Find(slot6), TeamType.Vanguard, slot2[slot6 - 3])
	end
end

function slot0.UpdateSubFleetShips(slot0, slot1)
	for slot5 = 1, 3 do
		slot0:UpdateShip(slot0.subGrids:Find(slot5), TeamType.Submarine, slot1[slot5])
	end
end

function slot0.UpdateShip(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("Image")

	if slot3 then
		PoolMgr.GetInstance():GetSpineChar(slot3.ship:getPrefab(), true, function (slot0)
			slot0.name = uv0
			tf(slot0).pivot = Vector2(0.5, 0)
			tf(slot0).sizeDelta = Vector2(200, 300)

			SetParent(slot0, uv1)

			tf(slot0).localPosition = Vector3(0, 0, 0)
			tf(slot0).localScale = Vector3(0.6, 0.6, 0.6)

			SetAction(slot0, "stand")
			GetOrAddComponent(slot0, "EventTriggerListener"):AddPointClickFunc(function (slot0, slot1)
				uv0:emit(GuildEventMediator.ON_SELECT_BOSS_SHIP, uv1, uv0.fleet.id, uv2)
			end)
			table.insert(uv2.shipGos, slot0)
		end)
	else
		onButton(slot0, slot4, function ()
			uv0:emit(GuildEventMediator.ON_SELECT_BOSS_SHIP, uv1, uv0.fleet.id)
		end, SFX_PANEL)
	end

	setActive(slot4, not slot3)
end

function slot0.ClearShips(slot0)
	for slot4, slot5 in ipairs(slot0.shipGos) do
		PoolMgr.GetInstance():ReturnSpineChar(slot5.name, slot5)
	end

	slot0.shipGos = {}
end

function slot0.OnDestroy(slot0)
	uv0.super.OnDestroy(slot0)
	slot0:ClearShips()
end

return slot0
