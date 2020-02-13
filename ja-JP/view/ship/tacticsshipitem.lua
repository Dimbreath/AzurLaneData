slot0 = class("TacticsShipItem", import(".DockyardShipItem"))

function slot0.updateBlackBlock(slot0)
	if slot0.maskStatusOb then
		setActive(slot0.maskStatusOb, false)
	end
end

function slot0.UpdateExpBuff(slot0)
	return
end

return slot0
