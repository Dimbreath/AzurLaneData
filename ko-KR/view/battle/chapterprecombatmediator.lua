slot0 = class("ChapterPreCombatMediator", import("..base.ContextMediator"))
slot0.ON_START = "ChapterPreCombatMediator:ON_START"
slot0.ON_SWITCH_SHIP = "ChapterPreCombatMediator:ON_SWITCH_SHIP"
slot0.ON_SWITCH_FLEET = "ChapterPreCombatMediator:ON_SWITCH_FLEET"
slot0.ON_OP = "ChapterPreCombatMediator:ON_OP"
slot0.ON_AUTO = "ChapterPreCombatMediator:ON_AUTO"
slot0.ON_SUB_AUTO = "ChapterPreCombatMediator:ON_SUB_AUTO"

function slot0.register(slot0)
	slot0:bind(uv0.ON_SWITCH_SHIP, function (slot0, slot1, slot2)
		slot3 = getProxy(ChapterProxy)
		slot4 = slot3:getActiveChapter()

		slot4.fleet:switchShip(slot1, slot2)
		slot3:updateChapter(slot4, ChapterConst.DirtyFleet)
	end)
	slot0:bind(uv0.ON_AUTO, function (slot0, slot1)
		uv0:onAutoBtn(slot1)
	end)
	slot0:bind(uv0.ON_SUB_AUTO, function (slot0, slot1)
		uv0:onAutoSubBtn(slot1)
	end)
	slot0:bind(uv0.ON_START, function (slot0)
		slot1 = getProxy(ChapterProxy):getActiveChapter()
		slot2 = slot1.fleet
		slot3 = slot1:getStageId(slot2.line.row, slot2.line.column)

		slot5[1] = function (slot0)
			for slot5, slot6 in pairs(uv0.ships) do
				table.insert({}, slot6)
			end

			if Fleet.EnergyCheck(slot1, uv0.name, slot0) then
				slot0()
			end
		end

		slot5[2] = function (slot0)
			if getProxy(PlayerProxy):getRawData():GoldMax(1) then
				slot5.content = i18n("gold_max_tip_title") .. i18n("resource_max_tip_battle")
				slot5.onYes = slot0
				slot5.weight = LayerWeightConst.SECOND_LAYER

				pg.MsgboxMgr.GetInstance():ShowMsgBox({})
			else
				slot0()
			end
		end

		slot5[3] = function (slot0)
			slot4.system = SYSTEM_SCENARIO
			slot4.stageId = uv1

			uv0:sendNotification(GAME.BEGIN_STAGE, {})
		end

		seriesAsync({})
	end)
	slot0:bind(uv0.ON_OP, function (slot0, slot1)
		uv0:sendNotification(GAME.CHAPTER_OP, slot1)
	end)

	slot1 = getProxy(ChapterProxy)

	slot0.viewComponent:setSubFlag(slot1.getSubAidFlag(slot1:getActiveChapter()))
	slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
	slot0:display()
end

function slot0.onAutoBtn(slot0, slot1)
	slot7.isActiveBot = slot1.isOn
	slot7.toggle = slot1.toggle

	slot0:sendNotification(GAME.AUTO_BOT, {})
end

function slot0.onAutoSubBtn(slot0, slot1)
	slot7.isActiveSub = slot1.isOn
	slot7.toggle = slot1.toggle

	slot0:sendNotification(GAME.AUTO_SUB, {})
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = PlayerProxy.UPDATED
	slot1[2] = GAME.BEGIN_STAGE_ERRO
	slot1[3] = GAME.CHAPTER_OP_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
	elseif slot2 == GAME.BEGIN_STAGE_ERRO then
		setActive(slot0.viewComponent._startBtn, true)

		if slot3 == 3 then
			slot6.content = i18n("battle_preCombatMediator_timeout")

			function slot6.onYes()
				uv0.viewComponent:emit(BaseUI.ON_CLOSE)
			end

			slot6.weight = LayerWeightConst.SECOND_LAYER

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true
			})
		end
	elseif slot2 == GAME.CHAPTER_OP_DONE and (slot3.type == ChapterConst.OpStrategy or slot3.type == ChapterConst.OpRepair or slot3.type == ChapterConst.OpRequest) then
		slot0:display()
	end
end

function slot0.display(slot0)
	slot0.viewComponent:updateChapter(getProxy(ChapterProxy):getActiveChapter())
end

return slot0
