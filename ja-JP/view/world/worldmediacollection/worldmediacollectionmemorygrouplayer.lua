slot0 = class("WorldMediaCollectionMemoryGroupLayer", import(".WorldMediaCollectionSubLayer"))

function slot0.getUIName(slot0)
	return "WorldMediaCollectionMemoryGroupUI"
end

function slot0.OnInit(slot0)
	uv0.super.OnInit(slot0)

	slot0.memoryGroups = _.map(pg.memory_group.all, function (slot0)
		return pg.memory_group[slot0]
	end)
	slot0.memoryGroupList = slot0:findTF("GroupRect"):GetComponent("LScrollRect")

	function slot0.memoryGroupList.onInitItem(slot0)
		uv0:onInitMemoryGroup(slot0)
	end

	function slot0.memoryGroupList.onUpdateItem(slot0, slot1)
		uv0:onUpdateMemoryGroup(slot0 + 1, slot1)
	end

	slot0.memoryGroupInfos = {}

	setActive(slot0:findTF("GroupItem", slot0.memoryGroupList), false)

	slot0.memoryGroupViewport = slot0:findTF("Viewport", slot0.memoryGroupList)
	slot0.memoryGroupsGrid = slot0:findTF("Viewport/Content", slot0.memoryGroupList):GetComponent(typeof(GridLayoutGroup))
	slot0.memoryTogGroup = slot0:findTF("Toggles", slot0._tf)

	setActive(slot0.memoryTogGroup, true)

	slot0.memoryToggles = {
		slot0:findTF("0", slot0.memoryTogGroup),
		slot0:findTF("1", slot0.memoryTogGroup),
		slot0:findTF("2", slot0.memoryTogGroup),
		slot0:findTF("3", slot0.memoryTogGroup)
	}
	slot0.memoryFilterIndex = {
		true,
		true,
		true
	}
	slot0.contextData.toggle = slot0.contextData.toggle or 1
	slot2 = slot0.contextData.toggle

	triggerToggle(slot0.memoryToggles[slot2], true)
	slot0:SwitchMemoryFilter(slot2)

	for slot6, slot7 in ipairs(slot0.memoryToggles) do
		onToggle(slot0, slot7, function (slot0)
			if not slot0 then
				return
			end

			uv0:SwitchMemoryFilter(uv1)
			uv0:MemoryFilter()
		end, SFX_UI_TAG)
	end

	slot0.viewParent:Add2TopContainer(slot0.memoryTogGroup)

	slot0.loader = WorldMediaCollectionLoader.New()

	slot0:MemoryFilter()

	slot0.rectAnchorX = slot0:findTF("GroupRect").anchoredPosition.x

	slot0:UpdateView()
end

function slot0.Show(slot0)
	uv0.super.Show(slot0)
	setActive(slot0.memoryTogGroup, true)
end

function slot0.Hide(slot0)
	setActive(slot0.memoryTogGroup, false)
	uv0.super.Hide(slot0)
end

function slot0.SwitchMemoryFilter(slot0, slot1)
	if slot1 == 1 then
		slot0.memoryFilterIndex = {
			true,
			true,
			true
		}
	else
		for slot5 in ipairs(slot0.memoryFilterIndex) do
			slot0.memoryFilterIndex[slot5] = slot1 - 1 == slot5
		end
	end
end

function slot0.MemoryFilter(slot0)
	table.clear(slot0.memoryGroups)

	for slot4, slot5 in pairs(pg.memory_group) do
		if slot0.memoryFilterIndex[slot5.type] then
			table.insert(slot0.memoryGroups, slot5)
		end
	end

	table.sort(slot0.memoryGroups, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.memoryGroupList:SetTotalCount(#slot0.memoryGroups, 0)
end

function slot0.onInitMemoryGroup(slot0, slot1)
	if slot0.exited then
		return
	end

	onButton(slot0, slot1, function ()
		if uv0.memoryGroupInfos[uv1] then
			uv0.viewParent:ShowSubMemories(slot0)
		end
	end, SOUND_BACK)
end

function slot0.onUpdateMemoryGroup(slot0, slot1, slot2)
	if slot0.exited then
		return
	end

	slot3 = slot0.memoryGroups[slot1]
	slot0.memoryGroupInfos[slot2] = slot3

	setText(tf(slot2):Find("title"), HXSet.hxLan(slot3.title))
	slot0.loader:GetSprite("memoryicon/" .. slot3.icon, "", tf(slot2):Find("BG"))
	setText(tf(slot2):Find("count"), _.reduce(slot3.memories, 0, function (slot0, slot1)
		if pg.memory_template[slot1].is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(slot2.story, true) then
			slot0 = slot0 + 1
		end

		return slot0
	end) .. "/" .. #slot3.memories)
end

function slot0.Return2MemoryGroup(slot0)
	if not slot0.contextData.memoryGroup then
		return
	end

	slot2 = 0
	slot3 = 0

	for slot7, slot8 in ipairs(slot0.memoryGroups) do
		if slot8.id == slot1 then
			slot3 = slot7

			break
		end
	end

	if slot3 > 0 then
		slot5 = slot0.memoryGroupsGrid.cellSize.y + slot0.memoryGroupsGrid.spacing.y
		slot6 = slot0.memoryGroupsGrid.constraintCount
		slot2 = Mathf.Clamp01((slot5 * math.floor((slot3 - 1) / slot6) + slot0.memoryGroupList.paddingFront) / (slot5 * math.ceil(#slot0.memoryGroups / slot6) - slot0.memoryGroupViewport.rect.height))
	end

	slot0.memoryGroupList:SetTotalCount(#slot0.memoryGroups, slot2)
end

function slot0.UpdateView(slot0)
	setAnchoredPosition(slot0:findTF("GroupRect"), {
		x = WorldMediaCollectionScene.WorldRecordLock() and 0 or slot0.rectAnchorX
	})
end

return slot0
