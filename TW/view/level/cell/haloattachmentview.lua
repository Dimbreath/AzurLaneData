slot0 = class("HaloAttachmentView")

slot0.Ctor = function (slot0, slot1, slot2, slot3)
	slot0.tf = slot1
	slot0.line = {
		row = slot2,
		column = slot3
	}
end

slot0.getLine = function (slot0)
	return slot0.line
end

slot0.getOrder = function (slot0)
	return 4
end

return slot0
