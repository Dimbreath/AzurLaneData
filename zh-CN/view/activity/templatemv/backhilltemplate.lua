slot0 = class("BackHillTemplate", import("view.base.BaseUI"))

function slot0.getUIName(slot0)
end

function slot0.Init(slot0)
end

function slot0.didEnter(slot0)
end

function slot0.willExit(slot0)
end

function slot0.InitFacility(slot0, slot1, slot2, slot3)
	onButton(nil, slot0:Find(slot2), slot3)
	onButton(nil, slot1:Find(slot2), slot3)
end

function slot0.getStudents(slot0, slot1, slot2)
	if not getProxy(ActivityProxy):getActivityById(slot0) then
		return {}
	end

	if slot5:getConfig("config_client") and slot6.ships then
		slot8 = #Clone(slot6)

		if 0 < slot1 * slot2 then
			while 0 < slot1 * slot2 and slot8 > 0 do
				slot9 = math.random(1, slot8)

				table.insert(slot3, slot6[slot9])

				slot6[slot9] = slot6[slot8]
				slot8 = slot8 - 1
				slot7 = slot7 + math.random(slot1, slot2)
			end
		end
	end

	return slot3
end

function slot0.InitStudents(slot0, slot1, slot2, slot3)
	slot4 = uv0.getStudents(slot1, slot2, slot3)

	for slot9, slot10 in pairs(slot0.graphPath.points) do
		table.insert({}, slot10)
	end

	slot0.academyStudents = {}

	for slot10, slot11 in pairs(slot4) do
		if not slot0.academyStudents[slot10] then
			slot12 = cloneTplTo(slot0._shipTpl, slot0._map)
			slot12.gameObject.name = slot10
			slot14 = SummerFeastNavigationAgent.New(slot12.gameObject)

			slot14:attach()
			slot14:setPathFinder(slot0.graphPath)
			slot14.setCurrentIndex(slot14, slot0.ChooseRandomPos(slot5, #slot5 - 1) and slot13.id)
			slot14:SetOnTransEdge(function (slot0, slot1, slot2)
				slot4 = uv0.edge2area[math.min(slot1, slot2) .. "_" .. math.max(slot1, slot2)] or uv0.edge2area.default
				slot4 = slot0._tf

				slot4:SetParent(uv0[slot4])
			end)
			slot14:updateStudent(slot11)

			slot0.academyStudents[slot10] = slot14
		end
	end

	if #slot4 > 0 then
		slot0.sortTimer = Timer.New(function ()
			uv0:sortStudents()
		end, 0.2, -1)

		slot0.sortTimer:Start()
		slot0.sortTimer.func()
	end
end

function slot0.ChooseRandomPos(slot0, slot1)
	if not math.random(1, slot1) then
		return nil
	end

	pg.Tool.Swap(slot0, slot2, slot1)

	return slot0[slot1]
end

function slot0.sortStudents(slot0)
	for slot5, slot6 in pairs(slot0.containers) do
		if slot6.childCount > 1 then
			for slot11 = 1, slot6.childCount, 1 do
				table.insert({}, {
					tf = slot6:GetChild(slot11 - 1),
					index = slot11
				})
			end

			table.sort(slot7, function (slot0, slot1)
				if math.abs(slot0.tf.anchoredPosition.y - slot1.tf.anchoredPosition.y) < 1 then
					return slot0.index < slot1.index
				else
					return slot2 > 0
				end
			end)

			for slot11, slot12 in ipairs(slot7) do
				slot12.tf:SetSiblingIndex(slot11 - 1)
			end
		end
	end
end

function slot0.clearStudents(slot0)
	if slot0.sortTimer then
		slot0.sortTimer:Stop()

		slot0.sortTimer = nil
	end

	for slot4, slot5 in pairs(slot0.academyStudents) do
		slot5:detach()
		Destroy(slot5._go)
	end

	table.clear(slot0.academyStudents)
end

function slot0.Clone2Full(slot0, slot1, slot2)
	slot4 = slot1:GetChild(0)

	for slot9 = 0, slot1.childCount - 1, 1 do
		table.insert({}, slot1:GetChild(slot9))
	end

	for slot9 = slot5, slot2 - 1, 1 do
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
	end

	return slot3
end

return slot0
