slot0 = class("BattleFailTipLayer", import("..base.BaseUI"))
slot0.PowerUpBtn = {
	EquipLevelUp = 2,
	SkillLevelUp = 3,
	ShipBreakUp = 4,
	ShipLevelUp = 1
}

function slot0.getUIName(slot0)
	return "BattleFailTipUI"
end

function slot0.init(slot0)
	slot0:initData()
	slot0:findUI()
	slot0:addListener()
end

function slot0.initData(slot0)
	slot0.battleSystem = slot0.contextData.battleSystem
end

function slot0.findUI(slot0)
	slot0.powerUpTipPanel = slot0:findTF("Main")
	slot0.shipLevelUpBtn = slot0:findTF("ShipLevelUpBtn", slot0.powerUpTipPanel)
	slot0.equipLevelUpBtn = slot0:findTF("EquipLevelUpBtn", slot0.powerUpTipPanel)
	slot0.skillLevelUpBtn = slot0:findTF("SkillLevelUpBtn", slot0.powerUpTipPanel)
	slot0.shipBreakUpBtn = slot0:findTF("ShipBreakUpBtn", slot0.powerUpTipPanel)
	slot0.closeBtn = slot0:findTF("CloseBtn", slot0.powerUpTipPanel)
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.closeBtn, function ()
		slot0:closeView()
	end, SFX_CANCEL)
	onButton(slot0, slot0.shipLevelUpBtn, function ()
		if slot0.battleSystem == SYSTEM_SCENARIO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("fightfail_up"),
				onYes = function ()
					if slot0.contextData.battleSystem == SYSTEM_SCENARIO then
						slot0.lastClickBtn = slot1.PowerUpBtn.ShipLevelUp

						slot0:emit(BattleFailTipMediator.CHAPTER_RETREAT)
					else
						slot0:emit(BattleFailTipMediator.GO_HIGEST_CHAPTER)
					end
				end
			})
		else
			slot0:emit(BattleFailTipMediator.GO_HIGEST_CHAPTER)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.equipLevelUpBtn, function ()
		if slot0.battleSystem == SYSTEM_SCENARIO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("fightfail_equip"),
				onYes = function ()
					if slot0.contextData.battleSystem == SYSTEM_SCENARIO then
						slot0.lastClickBtn = slot1.PowerUpBtn.EquipLevelUp

						slot0:emit(BattleFailTipMediator.CHAPTER_RETREAT)
					else
						slot0:emit(BattleFailTipMediator.GO_DOCKYARD_EQUIP)
					end
				end
			})
		else
			slot0:emit(BattleFailTipMediator.GO_DOCKYARD_EQUIP)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.skillLevelUpBtn, function ()
		slot0:emit(BattleFailTipMediator.GO_NAVALTACTICS)
	end, SFX_PANEL)
	onButton(slot0, slot0.shipBreakUpBtn, function ()
		if slot0.battleSystem == SYSTEM_SCENARIO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("fight_strengthen"),
				onYes = function ()
					if slot0.contextData.battleSystem == SYSTEM_SCENARIO then
						slot0.lastClickBtn = slot1.PowerUpBtn.ShipBreakUp

						slot0:emit(BattleFailTipMediator.CHAPTER_RETREAT)
					else
						slot0:emit(BattleFailTipMediator.GO_DOCKYARD_SHIP)
					end
				end
			})
		else
			slot0:emit(BattleFailTipMediator.GO_DOCKYARD_SHIP)
		end
	end, SFX_PANEL)
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:aniBeforeEnter()
end

function slot0.onBackPressed(slot0)
	slot0:closeView()
end

function slot0.willExit(slot0)
	LeanTween.cancel(go(slot0._tf))
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

function slot0.aniBeforeEnter(slot0)
	slot1 = GetComponent(slot0._tf, "CanvasGroup")

	LeanTween.value(go(slot0._tf), 0, 1, 0.6):setOnUpdate(System.Action_float(function (slot0)
		slot0.alpha = slot0
	end))
end

return slot0
