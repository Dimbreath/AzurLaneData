slot0 = class("ItemCard")

slot0.Ctor = function (slot0, slot1)
	slot0.go = slot1
	slot0.bg = findTF(slot1, "bg")
	slot0.countTF = findTF(slot1, "bg/icon_bg/count"):GetComponent(typeof(Text))
	slot0.nameTF = findTF(slot1, "bg/name"):GetComponent(typeof(Text))
end

slot0.update = function (slot0, slot1)
	slot0.itemVO = slot1

	updateItem(rtf(slot0.bg), slot1)
	TweenItemAlphaAndWhite(slot0.go)

	slot0.countTF.text = (slot1.count > 0 and slot1.count) or ""
	slot0.nameTF.text = shortenString(HXSet.hxLan(slot1:getConfig("name")), 5)
end

slot0.dispose = function (slot0)
	return
end

return slot0
