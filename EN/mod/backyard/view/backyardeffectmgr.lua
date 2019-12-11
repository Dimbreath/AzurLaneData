slot0 = class("BackyardEffectMgr")

function slot0.Ctor(slot0, slot1)
	slot0.effectContains = slot1
	slot0.effects = {}
	slot0.counts = {}
end

function slot0.applyEffect(slot0, slot1)
	if slot0.effects[slot1] then
		slot0.counts[slot1] = (slot0.counts[slot1] or 0) + 1

		return
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. slot1, slot1, true, function (slot0)
		if not slot0.effects or slot0.effects[] then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)

			return
		end

		slot0.name = slot1

		setParent(slot0, slot0.effectContains)
		setActive(slot0, true)

		slot0.effects[] = slot0
		slot1[slot0.counts] = (slot0.counts[slot0.counts] or 0) + 1
	end)
end

function slot0.disableEffect(slot0, slot1)
	if not slot0.effects[slot1] then
		return
	end

	slot0.counts[slot1] = (slot0.counts[slot1] or 0) - 1

	if slot0.counts[slot1] <= 0 and findTF(slot0.effectContains, slot1) then
		PoolMgr.GetInstance():ReturnPrefab("ui/" .. slot1, slot1, slot2.gameObject)

		slot0.effects[slot1] = nil
	end
end

function slot0.Destroy(slot0)
	for slot4, slot5 in pairs(slot0.effects) do
		PoolMgr.GetInstance():ReturnPrefab("ui/" .. slot4, slot4, slot5)
	end

	slot0.effects = nil
	slot0.counts = nil
end

return slot0
