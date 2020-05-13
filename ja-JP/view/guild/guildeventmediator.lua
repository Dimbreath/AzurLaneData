slot0 = class("GuildEventMediator", import("..base.ContextMediator"))
slot0.GET_RANK_LIST = "GuildEventMediator:GET_RANK_LIST"
slot0.OPEN_TASK = "GuildEventMediator:OPEN_TASK"
slot0.OPEN_RANK = "GuildEventMediator:OPEN_RANK"
slot0.ON_PRE_COMBAT = "GuildEventMediator:ON_PRE_COMBAT"

function slot0.register(slot0)
	slot1 = getProxy(GuildProxy)
	slot1.eventTip = nil

	slot0.viewComponent:setEvent(slot1:getGuildEvent())
	slot0.viewComponent:setPlayerVO(getProxy(PlayerProxy):getData())
	slot0:bind(uv0.GET_RANK_LIST, function (slot0)
		uv0:sendNotification(GAME.GET_GUILD_MEMBER_RANK)
	end)
	slot0:bind(uv0.OPEN_TASK, function (slot0)
		uv0:addSubLayers(Context.New({
			viewComponent = GuildTaskLayer,
			mediator = GuildTaskMediator
		}))
	end)
	slot0:bind(uv0.OPEN_RANK, function (slot0)
		uv0:addSubLayers(Context.New({
			viewComponent = GuildRankLayer,
			mediator = GuildRankMediator
		}))
	end)
	slot0:bind(uv0.ON_PRE_COMBAT, function (slot0)
		if not getProxy(ChapterProxy):getGuildChapter() then
			return
		end

		if slot2.active then
			uv0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = slot2 and slot2.id,
				mapIdx = slot2 and slot2:getConfig("map"),
				chapterVO = slot2
			})
		else
			uv0:addSubLayers(Context.New({
				mediator = GuildPreCombatMediator,
				viewComponent = GuildPreCombatLayer,
				data = {
					guildChapter = slot2
				}
			}))
		end
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GuildProxy.UPDATED_EVENT
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GuildProxy.UPDATED_EVENT then
		slot0.viewComponent:setEvent(slot3)

		if table.getCount(slot3:getMemberRankList()) > 0 then
			slot0.viewComponent:updateRankList()
		end
	end
end

return slot0
