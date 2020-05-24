pg = pg or {}
slot0 = pg
slot0.ViewUtils = class("ViewUtils")
slot2 = nil

function slot0.ViewUtils.SetLayer(slot0, slot1)
	slot0.gameObject.layer = slot1

	for slot6 = 0, slot0.childCount - 1 do
		slot7 = slot0:GetChild(slot6)
		slot7.gameObject.layer = slot1

		uv0.SetLayer(slot7, slot1)
	end
end
