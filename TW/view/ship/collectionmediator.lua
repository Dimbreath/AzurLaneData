slot0 = class("CollectionMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0.collectionProxy = getProxy(CollectionProxy)

	slot0.viewComponent:setShipGroups(slot0.collectionProxy:getGroups())
	slot0.viewComponent:setAwards(slot0.collectionProxy:getAwards())
	slot0.viewComponent:setCollectionRate(slot0.collectionProxy:getCollectionRate())
	slot0.viewComponent:setLinkCollectionCount(slot0.collectionProxy:getLinkCollectionCount())
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getRawData(slot1))
	slot0.viewComponent:setProposeList(getProxy(BayProxy).getProposeGroupList(slot2))
	slot0:bind(CollectionScene.GET_AWARD, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.COLLECT_GET_AWARD, {
			id = slot1,
			index = slot2
		})
	end)
	slot0:bind(CollectionScene.SHOW_DETAIL, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.SHIP_PROFILE, {
			showTrans = slot1,
			groupId = slot2
		})
	end)
	slot0:bind(CollectionScene.ACTIVITY_OP, function (slot0, slot1)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
	slot0:bind(CollectionScene.BEGIN_STAGE, function (slot0, slot1)
		slot0:sendNotification(GAME.BEGIN_STAGE, slot1)
	end)
	slot0:bind(CollectionScene.ON_INDEX, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = IndexMediator,
			viewComponent = IndexLayer,
			data = slot1
		}))
	end)
	slot0:bind(CollectionScene.GO_LEVEL, function (slot0, slot1)
		if getProxy(ChapterProxy).getMaps(slot2)[Chapter.New({
			id = slot1
		}):getConfig("map")] and slot5:getChapter(slot1) and slot5:getChapter(slot1):isUnlock() then
			if slot2:getActiveChapter() and slot6.id ~= slot1 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("collect_chapter_is_activation"),
					onYes = function ()
						slot0.chapterId = slot1

						slot0:sendNotification(GAME.CHAPTER_OP, {
							type = ChapterConst.OpRetreat
						})
					end
				})
			else
				slot0:GoLevelScene(slot1)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("acquisitionmode_is_not_open"))
		end
	end)
	slot0:bind(CollectionScene.GO_SCENE, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.GO_SCENE, slot1, slot2)
	end)
	slot0.viewComponent:updateCollectNotices(slot0.collectionProxy:hasFinish())
end

function slot0.GoLevelScene(slot0, slot1)
	if getProxy(ChapterProxy):getChapterById(slot1) then
		slot4 = {
			mapIdx = slot3:getConfig("map")
		}

		if slot3.active then
			slot4.chapterId = slot3.id
		else
			slot4.openChapterId = slot1
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot4)
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		CollectionProxy.AWARDS_UPDATE,
		GAME.COLLECT_GET_AWARD_DONE,
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_DONE,
		GAME.CHAPTER_OP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == CollectionProxy.AWARDS_UPDATE then
		slot0.viewComponent:setAwards(slot3)
	elseif slot2 == GAME.COLLECT_GET_AWARD_DONE then
		slot0.viewComponent:sortDisplay()
		slot0.viewComponent:updateCollectNotices(slot0.collectionProxy:hasFinish())
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.items)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == GAME.CHAPTER_OP_DONE and slot0.chapterId then
		slot0:GoLevelScene(slot0.chapterId)

		slot0.chapterId = nil
	end
end

return slot0
