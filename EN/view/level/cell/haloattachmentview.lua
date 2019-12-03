slot0 = class("HaloAttachmentView")

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.tf = slot1
	slot0.line = {
		row = slot2,
		column = slot3
	}
end

function slot0.getLine(slot0)
	return slot0.line
end

function slot0.getOrder(slot0)
	return 4
end

return slot0
