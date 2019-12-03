slot0 = class("TransportCellView", import(".SpineCellView"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.tfShadow = slot0.tf:Find("shadow")
	slot0.tfHp = slot0.tf:Find("hp")
	slot0.tfHpText = slot0.tf:Find("hp/text")
	slot0.tfIcon = slot0.tf:Find("ship/icon")
	slot0.tfFighting = slot0.tf:Find("fighting")
end

slot0.getOrder = function (slot0)
	return 1
end

slot0.getModel = function (slot0)
	return slot0.tfIcon.gameObject
end

slot0.setModel = function (slot0, slot1)
	return
end

slot0.setAttachment = function (slot0, slot1)
	slot0._attachmentInfo = slot1
end

slot0.loadSpine = function (slot0, slot1)
	if slot1 then
		slot1()
	end

	if slot0._attachmentInfo then
		for slot5, slot6 in pairs(slot0._attachmentInfo) do
			if slot6.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot7, slot7, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if loadingPrefab == slot0:getPrefab() then
						slot1 = Object.Instantiate(slot0)
						slot0._attachmentList[#slot0._attachmentList + 1] = slot1

						tf(slot1):SetParent(tf(model))

						tf(slot1).localPosition = BuildVector3(slot1.attachment_combat_ui[2])
					end
				end), true, true)
			end
		end
	end
end

slot0.unloadSpine = function (slot0)
	return
end

return slot0
