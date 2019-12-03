slot0 = class("VoteGroupRaceShipPage", import("..PreRace.VotePreRaceShipPage"))

slot0.getUIName = function (slot0)
	return "GroupRaceShips"
end

slot0.onInitItem = function (slot0, slot1)
	slot0.super.onInitItem(slot0, slot1)
	onButton(slot0, slot0.voteItems[slot1].go, function ()
		if slot0.CallBack then
			if slot0.phase == VoteGroup.DISPLAY_STAGE then
				slot0.CallBack(slot1, slot1.voteShip.totalVotes)
			else
				slot0.CallBack(slot1, slot1.voteShip.votes)
			end
		end
	end, SFX_PANEL)
end

slot0.UpdateShip = function (slot0, slot1, slot2, slot3)
	slot2:update(slot3, slot0.voteGroup:GetRank(slot3))

	if slot0.voteGroup.GetRank(slot3) > 3 then
		slot2.rank.text = ""
	end
end

slot0.UpdateShips = function (slot0, slot1, slot2)
	slot0.scrollRect:SetTotalCount(#slot0.displays)
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
