pg = pg or {}
slot0 = pg
slot0.ViewUtils = class("ViewUtils")
slot1 = slot0.ViewUtils
slot2 = nil

function slot1.SetLayer(slot0, slot1)
	slot0.gameObject.layer = slot1

	for slot6 = 0, slot0.childCount - 1 do
		slot7 = slot0:GetChild(slot6)
		slot7.gameObject.layer = slot1

		uv0.SetLayer(slot7, slot1)
	end
end

function slot1.SetSortingOrder(slot0, slot1)
	for slot6 = 0, tf(slot0):GetComponents(typeof(Renderer)).Length - 1 do
		slot2[slot6].sortingOrder = slot1
	end

	if slot0:GetComponent(typeof(Canvas)) then
		slot3.sortingOrder = slot1
	end

	for slot7 = 0, slot0.childCount - 1 do
		uv0.SetSortingOrder(slot0:GetChild(slot7), slot1)
	end
end
