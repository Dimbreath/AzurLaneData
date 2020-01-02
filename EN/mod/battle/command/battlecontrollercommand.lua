ys = ys or {}
ys.Battle.BattleControllerCommand = class("BattleControllerCommand", ys.MVC.Command)
ys.Battle.BattleControllerCommand.__name = "BattleControllerCommand"

function ys.Battle.BattleControllerCommand.Ctor(slot0)
	slot0.Battle.BattleControllerCommand.super.Ctor(slot0)
end

function ys.Battle.BattleControllerCommand.Initialize(slot0)
	slot0.Battle.BattleControllerCommand.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(slot0.Battle.BattleDataProxy.__name)

	slot0:InitBattleEvent()
end

function ys.Battle.BattleControllerCommand.CheckDebugCombinedKey(slot0)
	if Input.GetKey(KeyCode.LeftControl) then
		if Input.GetKeyUp(KeyCode.Keypad0) then
			if slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name) == nil then
				slot0._state:AddMediator(slot0.Battle.BattleReferenceBoxMediator.New())
				pg.TipsMgr.GetInstance():ShowTips("┏━━━━━━━━━━━━━━━━━━━┓")
				pg.TipsMgr.GetInstance():ShowTips("┃ヽ(•̀ω•́ )ゝ战斗调试模块初始化成功！(ง •̀_•́)ง┃")
				pg.TipsMgr.GetInstance():ShowTips("┗━━━━━━━━━━━━━━━━━━━┛")
			else
				pg.TipsMgr.GetInstance():ShowTips("┏━━━━━━━━━━━━━━━━━━━┓")
				pg.TipsMgr.GetInstance():ShowTips("┃ヽ(･ω･｡)ﾉ 战斗调试模块已经存在！(ﾉ･ω･)ﾉﾞ┃")
				pg.TipsMgr.GetInstance():ShowTips("┗━━━━━━━━━━━━━━━━━━━┛")
			end
		elseif Input.GetKeyUp(KeyCode.Keypad1) then
			slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name):ActiveUnitBoxes(true)
		elseif Input.GetKeyUp(KeyCode.Keypad4) then
			slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name):ActiveUnitBoxes(false)
		elseif Input.GetKeyUp(KeyCode.Keypad2) then
			slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name):ActiveBulletBoxes(true)
		elseif Input.GetKeyUp(KeyCode.Keypad5) then
			slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name):ActiveBulletBoxes(false)
		elseif Input.GetKeyUp(KeyCode.Keypad3) then
			slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name):ActiveUnitDetail(true)
		elseif Input.GetKeyUp(KeyCode.Keypad6) then
			slot0._state:GetMediatorByName(slot0.Battle.BattleReferenceBoxMediator.__name):ActiveUnitDetail(false)
		elseif Input.GetKeyUp(KeyCode.KeypadPlus) then
			if slot0.Battle.BattleConfig.BASIC_TIME_SCALE < 1 then
				slot0.removeSpeed(2)
			elseif slot1 >= 1 then
				slot0.addSpeed(2)
			end

			slot0:scaleTime()
		elseif Input.GetKeyUp(KeyCode.KeypadMinus) then
			if slot0.Battle.BattleConfig.BASIC_TIME_SCALE > 1 then
				slot0.removeSpeed(0.5)
			elseif slot1 <= 1 then
				slot0.addSpeed(0.5)
			end

			slot0:scaleTime()
		end
	end
end

function ys.Battle.BattleControllerCommand.InitBattleEvent(slot0)
	return
end

function ys.Battle.BattleControllerCommand.addSpeed(slot0)
	slot0.Battle.BattleConfig.BASIC_TIME_SCALE = slot0.Battle.BattleConfig.BASIC_TIME_SCALE * slot0

	slot0.Battle.BattleVariable.AppendIFFFactor(slot0.Battle.BattleConfig.FOE_CODE, "cheat_speed_up_" .. slot0.Battle.BattleConfig.BASIC_TIME_SCALE, slot0)
	slot0.Battle.BattleVariable.AppendIFFFactor(slot0.Battle.BattleConfig.FRIENDLY_CODE, "cheat_speed_up_" .. slot0.Battle.BattleConfig.BASIC_TIME_SCALE, slot0)
end

function ys.Battle.BattleControllerCommand.removeSpeed(slot0)
	slot0.Battle.BattleVariable.RemoveIFFFactor(slot0.Battle.BattleConfig.FOE_CODE, "cheat_speed_up_" .. slot0.Battle.BattleConfig.BASIC_TIME_SCALE)
	slot0.Battle.BattleVariable.RemoveIFFFactor(slot0.Battle.BattleConfig.FRIENDLY_CODE, "cheat_speed_up_" .. slot0.Battle.BattleConfig.BASIC_TIME_SCALE)

	slot0.Battle.BattleConfig.BASIC_TIME_SCALE = slot0.Battle.BattleConfig.BASIC_TIME_SCALE * slot0
end

function ys.Battle.BattleControllerCommand.scaleTime(slot0)
	pg.TipsMgr.GetInstance():ShowTips("┏━━━━━━━━━━━━┓")
	pg.TipsMgr.GetInstance():ShowTips("┃ヽ(•̀ω•́ )ゝ嗑药 X" .. slot0.Battle.BattleConfig.BASIC_TIME_SCALE .. " ！(ง •̀_•́)ง┃")
	pg.TipsMgr.GetInstance():ShowTips("┗━━━━━━━━━━━━┛")
	slot0._state:ScaleTimer()
end

return
