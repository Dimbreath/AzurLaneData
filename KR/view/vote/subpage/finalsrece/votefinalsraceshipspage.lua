slot0 = class("VoteFinalsRaceShipsPage", import("....base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "FinalsRaceShips"
end

slot0.OnLoaded = function (slot0)
	slot0.num1TF = slot0:findTF("content/head/num1")
	slot0.num2TF = slot0:findTF("content/head/num2")
	slot0.num3TF = slot0:findTF("content/head/num3")
	slot0.UIlist = UIItemList.New(slot0:findTF("content/ships"), slot0:findTF("content/ships/ship_tpl"))

	setActive(slot0._tf, true)
end

slot0.OnInit = function (slot0)
	return
end

slot0.SetCallBack = function (slot0, slot1)
	slot0.CallBack = slot1
end

slot0.Update = function (slot0, slot1, slot2, slot3)
	slot0.voteGroup = slot1
	slot0.filters = slot2
	slot0.displays = {}
	slot0.topThree = slot1:GetDialayGroupForFinals()

	for slot7, slot8 in ipairs(slot2) do
		if not slot0:contains(slot0.topThree, slot8) then
			table.insert(slot0.displays, slot8)
		end
	end

	slot0.count = slot3
	slot0.phase = slot1:GetStage()

	slot0:UpdateTopThree()
	slot0:UpdateShips()
end

slot0.contains = function (slot0, slot1, slot2)
	return _.any(slot1, function (slot0)
		return slot0.group == slot0.group
	end)
end

slot0.UpdateTopThree = function (slot0)
	slot0:UpdateVoteShip(slot0.num1TF, slot0.topThree[1])
	slot0:UpdateVoteShip(slot0.num2TF, slot0.topThree[2])
	slot0:UpdateVoteShip(slot0.num3TF, slot0.topThree[3])
end

slot0.UpdateVoteShip = function (slot0, slot1, slot2)
	if slot2 then
		setText(slot1:Find("name"), shortenString(slot2:getShipName(), 5))
		LoadSpriteAsync("VoteShips/" .. slot3, function (slot0)
			setImageSprite(slot0:Find("mask/icon"), slot0, false)
		end)
		onButton(slot0, slot1, function ()
			if slot0.CallBack then
				if slot0.phase == VoteGroup.DISPLAY_STAGE then
					slot0.CallBack({
						voteShip = slot1
					}, slot1.totalVotes)
				else
					slot0.CallBack({
						voteShip = slot1
					}, slot1.votes)
				end
			end
		end, SFX_PANEL)
	else
		setText(slot1:Find("name"), "")
		LoadSpriteAsync("VoteShips/unkown", function (slot0)
			setImageSprite(slot0:Find("mask/icon"), slot0, false)
		end)
		removeOnButton(slot1)
	end

	setActive(slot1, not slot2 or slot0:contains(slot0.filters, slot2))
end

slot0.UpdateShips = function (slot0)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = VoteShipItem.New(slot2)

			slot4:update(slot3)
			onButton(slot0, slot4.go, function ()
				if slot0.CallBack then
					if slot0.phase == VoteGroup.DISPLAY_STAGE then
						slot0.CallBack(slot1, slot1.voteShip.totalVotes)
					else
						slot0.CallBack(slot1, slot1.voteShip.votes)
					end
				end
			end, SFX_PANEL)
		end
	end)
	slot0.UIlist:align(math.max(#slot0.displays, 0))
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
