slot0 = class("MiniGameDataCreator")
slot0.ShrineGameID = 3
slot0.FireWorkGameID = 4

function slot0.DataCreateFunc(slot0, slot1, slot2)
	if slot0 == MiniGameOPCommand.CMD_SPECIAL_GAME then
		slot3 = slot1[1]
		slot6 = getProxy(MiniGameProxy):GetMiniGameData(slot3)

		if slot3 == uv0.ShrineGameID then
			if slot1[2] == 1 then
				-- Nothing
			elseif slot4 == 2 then
				slot7.count = slot6:GetRuntimeData("count") - 1
				slot7.serverGold = slot2[1]
			elseif slot4 == 3 then
				slot7.serverGold = slot2[1]
			end
		end

		if slot6:getConfig("type") == MiniGameConst.MG_TYPE_2 and slot4 == 1 then
			for slot13 = 1, #slot2 do
			end

			slot7.elements = {
				[slot13] = slot2[slot13]
			}
		end

		for slot12, slot13 in pairs({
			count = slot2[1],
			serverGold = slot2[2],
			isInited = true
		}) do
			slot6:SetRuntimeData(slot12, slot13)
		end
	end
end

return slot0
