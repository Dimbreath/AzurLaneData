slot0 = class("GuildEventMediator", import("..base.ContextMediator"))
slot0.GET_RANK_LIST = "GuildEventMediator:GET_RANK_LIST"
slot0.OPEN_TASK = "GuildEventMediator:OPEN_TASK"
slot0.OPEN_RANK = "GuildEventMediator:OPEN_RANK"
slot0.ON_PRE_COMBAT = "GuildEventMediator:ON_PRE_COMBAT"

slot0.register = function (slot0)
	slot1 = getProxy(GuildProxy)
	slot1.eventTip = nil

	slot0.viewComponent:setEvent(slot2)
	slot0.viewComponent:setPlayerVO(slot4)
	slot0:bind(slot0.GET_RANK_LIST, function (slot0)
		slot0:sendNotification(GAME.GET_GUILD_MEMBER_RANK)
	end)
	slot0:bind(slot0.OPEN_TASK, function (slot0)
		slot0:addSubLayers(Context.New({
			viewComponent = GuildTaskLayer,
			mediator = GuildTaskMediator
		}))
	end)
	slot0:bind(slot0.OPEN_RANK, function (slot0)
		slot0:addSubLayers(Context.New({
			viewComponent = GuildRankLayer,
			mediator = GuildRankMediator
		}))
	end)
	slot0:bind(slot0.ON_PRE_COMBAT, function (slot0)
		if not getProxy(ChapterProxy):getGuildChapter() then
			return
		end

		if slot2.active then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = slot2 and slot2.id,
				mapIdx = slot2 and slot2:getConfig("map"),
				chapterVO = slot2
			})
		else
			slot0:addSubLayers(Context.New({
				mediator = GuildPreCombatMediator,
				viewComponent = GuildPreCombatLayer,
				data = {
					guildChapter = slot2
				}
			}))
		end
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {
		GuildProxy.UPDATED_EVENT
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GuildProxy.UPDATED_EVENT then
		slot0.viewComponent:setEvent(slot3)

		if table.getCount(slot3:getMemberRankList()) > 0 then
			slot0.viewComponent:updateRankList()
		end
	end
end

return slot0
