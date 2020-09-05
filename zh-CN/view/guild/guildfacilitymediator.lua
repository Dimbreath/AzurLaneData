slot0 = class("GuildFacilityMediator", import("..base.ContextMediator"))
slot0.ON_UPGRADE = "GuildFacilityMediator:ON_UPGRADE"
slot0.ON_CONTRIBUTE = "GuildFacilityMediator:ON_CONTRIBUTE"

function slot0.register(slot0)
	slot0:bind(uv0.ON_UPGRADE, function (slot0, slot1)
		uv0:sendNotification(GAME.GUILD_FACILITY_UPGRADE, slot1)
	end)
	slot0:bind(uv0.ON_CONTRIBUTE, function (slot0, slot1)
		uv0:sendNotification(GAME.GUILD_CONTRIBUTE_RES, {
			id = slot1
		})
	end)
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy):getData())
	slot0.viewComponent:setGuildVO(getProxy(GuildProxy):getData())
end

function slot0.listNotificationInterests(slot0)
	return {
		GuildProxy.GUILD_UPDATED,
		PlayerProxy.UPDATED,
		GuildProxy.UPDATE_FACILITYLOG,
		GAME.GUILD_CONTRIBUTE_RES_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	if GuildProxy.GUILD_UPDATED == slot1:getName() then
		slot0.viewComponent:setGuildVO(slot1:getBody())
		slot0.viewComponent:updateFacilitys()
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayerVO(slot3)
	elseif slot2 == GuildProxy.UPDATE_FACILITYLOG then
		slot0.viewComponent:addFacilityLogs(slot3)
		slot0.viewComponent:filterLogs()
	elseif slot2 == GAME.GUILD_CONTRIBUTE_RES_DONE then
		if #slot3 > 0 then
			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot4)
		end

		slot0.viewComponent:closeContributeProject()
	end
end

return slot0
