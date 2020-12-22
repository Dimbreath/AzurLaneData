slot0 = class("WorldPreCombatMediator", import("..base.ContextMediator"))
slot0.OnSwitchShip = "WorldPreCombatMediator.OnSwitchShip"
slot0.OnMapOp = "WorldPreCombatMediator.OnMapOp"
slot0.OnAuto = "WorldPreCombatMediator.OnAuto"
slot0.OnSubAuto = "WorldPreCombatMediator.OnSubAuto"
slot0.OnStartBattle = "WorldPreCombatMediator.OnStartBattle"
slot0.OnOpenSublayer = "OpenSublayer"

function slot0.register(slot0)
	slot0:bind(uv0.OnSwitchShip, function (slot0, slot1, slot2, slot3)
		nowWorld:GetFleet(slot1):SwitchShip(slot2, slot3)
	end)
	slot0:bind(uv0.OnAuto, function (slot0, slot1)
		uv0:onAutoBtn(slot1)
	end)
	slot0:bind(uv0.OnSubAuto, function (slot0, slot1)
		uv0:onSubAuto(slot1)
	end)
	slot0:bind(uv0.OnMapOp, function (slot0, slot1)
		uv0:sendNotification(GAME.WORLD_MAP_OP, slot1)
	end)
	slot0:bind(uv0.OnStartBattle, function (slot0, slot1)
		seriesAsync({
			function (slot0)
				slot1 = uv0.viewComponent:getCurrentFleet()

				Fleet.EnergyCheck(slot1:GetShipVOs(true), slot1:GetDefaultName(), function (slot0)
					if slot0 then
						uv0()
					end
				end)
			end
		}, function ()
			uv0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_WORLD,
				stageId = uv1
			})
		end)
	end)
	slot0:bind(uv0.OnOpenSublayer, function (slot0, slot1, slot2, slot3)
		uv0:addSubLayers(slot1, slot2, slot3)
	end)
	slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
end

function slot0.onAutoBtn(slot0, slot1)
	slot0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = slot1.isOn,
		toggle = slot1.toggle,
		system = SYSTEM_WORLD
	})
end

function slot0.onSubAuto(slot0, slot1)
	slot4 = slot1.system

	slot0:sendNotification(GAME.AUTO_SUB, {
		isActiveSub = slot1.isOn,
		toggle = slot1.toggle,
		system = SYSTEM_WORLD
	})
end

function slot0.listNotificationInterests(slot0)
	return {
		PlayerProxy.UPDATED,
		GAME.WORLD_MAP_OP_DONE,
		GAME.BEGIN_STAGE_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerInfo(getProxy(PlayerProxy):getRawData())
	elseif slot2 == GAME.WORLD_MAP_OP_DONE then
		-- Nothing
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	end
end

return slot0
