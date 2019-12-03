slot0 = class("VoteFinalsRaceRankPage", import("..GroupRace.VoteGroupRaceRankPage"))

slot0.getUIName = function (slot0)
	return "FinalsRaceRank"
end

slot0.UpdateList = function (slot0)
	slot0.topThree, slot0.list = slot0.voteGroup:GetDialayGroupForFinals()
	slot0.index = 0
	slot0.count = 0

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = nil

			if slot1 + 1 <= 3 then
				slot4 = slot0.topThree[slot3]
			else
				slot0.index = slot0.index + 1
				slot4 = slot0.list[slot0.index]
			end

			slot0:UpdateVoteShipItem(slot2, slot4)
		end
	end)
	slot0.uilist:align(#slot0.list + #slot0.topThree)
end

slot0.UpdateVoteShipItem = function (slot0, slot1, slot2)
	if slot2 then
		slot0.count = slot0.count + 1

		setText(slot1:Find("number"), slot0.count)
		setText(slot1:Find("name"), shortenString(slot2:getShipName(), 6))
		setText(slot1:Find("Text"), slot0.voteGroup:GetVotes(slot2))
	else
		setText(slot1:Find("number"), "-")
		setText(slot1:Find("name"), "-")
		setText(slot1:Find("Text"), "-")
	end
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
