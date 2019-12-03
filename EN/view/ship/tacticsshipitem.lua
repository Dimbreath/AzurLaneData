slot0 = class("TacticsShipItem", import(".DockyardShipItem"))

slot0.updateBlackBlock = function (slot0)
	if slot0.maskStatusOb then
		setActive(slot0.maskStatusOb, false)
	end
end

slot0.UpdateExpBuff = function (slot0)
	return
end

return slot0
