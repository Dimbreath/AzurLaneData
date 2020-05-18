slot0 = class("MusicUnlockCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.unlockCBFunc
	slot6 = getProxy(BagProxy)

	for slot12, slot13 in pairs(getProxy(AppreciateProxy):getMusicUnlockMaterialByID(slot2.musicID)) do
		if slot13.type == DROP_TYPE_RESOURCE then
			if getProxy(PlayerProxy):getData():getResById(slot13.id) < slot13.count then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

				return
			end
		elseif slot13.type == DROP_TYPE_ITEM and slot6:getItemCountById(slot13.id) < slot13.count then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end
	end

	pg.ConnectionMgr.GetInstance():Send(17503, {
		id = slot3
	}, 17504, function (slot0)
		if slot0.result == 0 then
			uv0:addMusicIDToUnlockList(uv1)

			if uv2 then
				uv2()
			end
		else
			print("UnLock Fail", tostring(slot0.result))
		end
	end)
end

return slot0
