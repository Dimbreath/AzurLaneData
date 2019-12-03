pg = pg or {}
pg.YongshiDeepLinkingMgr = singletonClass("YongshiDeepLinkingMgr")
slot2 = true

function slot3(slot0)
	if slot0 then
		print(slot0)
	end
end

pg.YongshiDeepLinkingMgr.SetData = function (slot0, slot1)
	slot0("SetData......")

	slot0.deepLinking = slot1

	slot0:SwitchScene()
end

pg.YongshiDeepLinkingMgr.ShouldSwitchScene = function (slot0)
	if slot0.deepLinking == nil or slot0.deepLinking:IsEmpty() then
		slot0("deepLinking is empty")

		return false
	end

	if not slot1.m02 then
		slot0("game is not start")

		return false
	end

	if not getProxy(ContextProxy):getCurrentContext() then
		slot0("game is not start")

		return false
	end

	if slot2.mediator == LoginMediator then
		slot0("player is not created")

		return false
	end

	if slot2.mediator == CombatLoadMediator or slot2.mediator == BattleMediator then
		slot0("game is in battle")
		slot0:Clear()

		return false
	end

	return true
end

function slot4(slot0, slot1)
	slot0("Switch......" .. slot0 .. "-" .. slot1)

	if slot0 == "1" then
		slot1.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD)
	end
end

pg.YongshiDeepLinkingMgr.SwitchScene = function (slot0)
	slot0("SwitchScene......")

	if slot0:ShouldSwitchScene() then
		slot1(slot1, slot0.deepLinking.arg)
		slot0:Clear()
	end
end

pg.YongshiDeepLinkingMgr.Clear = function (slot0)
	slot0("Clear......")
	slot0.deepLinking:Clear()

	slot0.deepLinking = nil
end

return
