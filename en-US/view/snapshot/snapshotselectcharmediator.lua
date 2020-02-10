slot0 = class("SnapshotSelectCharMediator", import("..base.ContextMediator"))
slot0.SELECT_CHAR = "SnapshotSelectCharMediator.SELECT_CHAR"

function slot0.register(slot0)
	slot0.viewComponent:setShipGroups(getProxy(CollectionProxy):getGroups())
	slot0.viewComponent:setProposeList(getProxy(BayProxy):getProposeGroupList())
	slot0:bind(SnapshotSelectCharLayer.ON_INDEX, function (slot0, slot1)
		slot5.mediator = IndexMediator
		slot5.viewComponent = IndexLayer
		slot5.data = slot1

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(SnapshotSelectCharLayer.SELECT_CHAR, function (slot0, slot1)
		uv0:sendNotification(uv1.SELECT_CHAR, slot1)
	end)
end

return slot0
