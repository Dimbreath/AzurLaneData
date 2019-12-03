slot0 = class("LoadReferenceRequestPackage", import("view.util.RequestPackage"))

function slot0.__call(slot0)
	if slot0.stopped then
		return
	end

	ResourceMgr.Inst:getAssetAsync(slot0.path, slot0.name, typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if slot0.stopped then
			return
		end

		if slot0.onLoaded then
			slot0:onLoaded()
		end
	end), true, false)

	return slot0
end

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.path = slot1
	slot0.name = slot2
	slot0.onLoaded = slot3
end

return slot0
