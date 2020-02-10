slot0 = class("NewPlayerMediator", import("..base.ContextMediator"))
slot0.ON_CREATE = "NewPlayerMediator:ON_CREATE"
slot0.ON_SKILLINFO = "NewPlayerMediator:ON_SKILLINFO"

function slot0.register(slot0)
	slot0:bind(uv0.ON_CREATE, function (slot0, slot1, slot2)
		slot6.nickname = slot1
		slot6.shipId = slot2

		uv0:sendNotification(GAME.CREATE_NEW_PLAYER, {})
	end)
	slot0:bind(uv0.ON_SKILLINFO, function (slot0, slot1)
		slot5.mediator = SkillInfoMediator
		slot5.viewComponent = SkillInfoLayer
		slot6.skillId = slot1
		slot5.data = {
			fromNewShip = 1
		}

		uv0:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.CREATE_NEW_PLAYER_DONE
	slot1[2] = GAME.LOAD_PLAYER_DATA_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.CREATE_NEW_PLAYER_DONE then
		slot7.id = slot1:getBody()

		slot0.facade:sendNotification(GAME.LOAD_PLAYER_DATA, {
			isNewPlayer = true
		})
	elseif slot2 == GAME.LOAD_PLAYER_DATA_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI)
	end
end

return slot0
