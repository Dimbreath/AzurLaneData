slot0 = class("CommanderBuildPoolPanel")
slot1 = 10

function slot0.Ctor(slot0, slot1, slot2)
	slot0._tf = slot1
	slot0.parent = slot2
	slot0.buildPoolList = UIItemList.New(slot0._tf:Find("frame/bg/content/list"), slot0._tf:Find("frame/bg/content/list/1"))
	slot0.posListTop = UIItemList.New(slot0._tf:Find("frame/bg/content/queue/list1"), slot3)
	slot0.posListBottom = UIItemList.New(slot0._tf:Find("frame/bg/content/queue/list2"), slot3)
	slot0.autoBtn = slot0._tf:Find("frame/bg/auto_btn")
	slot0.startBtn = slot0._tf:Find("frame/bg/start_btn")
	slot0.selectedTxt = slot0._tf:Find("statistics/Text"):GetComponent(typeof(Text))

	setActive(slot0._tf, false)
	onButton(slot0.parent, slot0._tf, function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0.parent, slot0._tf:Find("frame/bg/close_btn"), function ()
		slot0:Hide()
	end, SFX_PANEL)
	onButton(slot0.parent, slot0.autoBtn, function ()
		if slot1 <= #slot0.selected then
			return
		end

		slot0:AutoSelect()
		slot0.AutoSelect:UpdatePos()
	end, SFX_PANEL)
	onButton(slot0.parent, slot0.startBtn, function ()
		if #slot0.selected == 0 then
			return
		end

		slot0.parent:emit(CommandRoomMediator.SHOW_MSGBOX, {
			content = i18n("commander_select_box_tip", #slot0.selected),
			onYes = function ()
				slot0.parent:emit(CommandRoomMediator.ON_BATCH_BUILD, slot0.selected)
				slot0.parent.emit:Hide()
			end
		})
	end, SFX_PANEL)

	slot0.sprites = {
		slot0._tf:Find("frame/bg/content/list/1/icon/iconImg"):GetComponent(typeof(Image)).sprite,
		slot0._tf:Find("frame/bg/content/list/2/icon/iconImg"):GetComponent(typeof(Image)).sprite,
		slot0._tf:Find("frame/bg/content/list/3/icon/iconImg"):GetComponent(typeof(Image)).sprite
	}
end

function slot0.AutoSelect(slot0)
	slot1 = slot0.pools

	function slot2()
		for slot4, slot5 in pairs(slot0.counts) do
			if slot5 > 0 then
				slot0 = slot4
			end
		end

		return slot0
	end

	for slot7 = 1, slot0 - #slot0.selected, 1 do
		if slot2() then
			slot0:ReduceCount(slot8, -1)
		end
	end
end

function slot0.Show(slot0, slot1, slot2)
	slot2.selected = {}
	slot2.pools = slot1
	slot3 = slot2.pools
	slot2.counts = {}

	for slot7, slot8 in ipairs(slot2.pools) do
		slot0.counts[slot8.id] = slot8:getItemCount()
	end

	slot0.boxesTxt = {}

	table.sort(slot3, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.buildPoolList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			pressPersistTrigger(slot2:Find("icon"), 0.5, slot4, nil, true, true, 0.15, SFX_PANEL)
			setText(slot2:Find("name"), slot0[slot1 + 1].getName(slot3))

			slot1.boxesTxt[slot0[slot1 + 1].id] = slot2:Find("Text")

			slot1:ReduceCount(slot0[slot1 + 1].id, 0)
		end
	end)
	slot0.buildPoolList:align(#slot3)
	slot0:UpdatePos()
	setActive(slot0._tf, true)

	slot0.isShow = true
end

function slot0.ReduceCount(slot0, slot1, slot2, slot3)
	slot0.counts[slot1] = slot0.counts[slot1] + slot2

	setText(slot0.boxesTxt[slot1], slot0.counts[slot1] + slot2)

	if slot2 < 0 then
		table.insert(slot0.selected, slot1)
		slot0:UpdatePos()
	elseif slot2 > 0 then
		table.remove(slot0.selected, slot3)
		slot0:UpdatePos()
	end
end

function slot0.poolId2Sprite(slot0, slot1)
	return slot0.sprites[slot1]
end

function slot0.UpdatePos(slot0)
	function slot1(slot0, slot1)
		slot3 = slot1:Find("icon")

		if slot0.selected[slot0] then
			slot3:GetComponent(typeof(Image)).sprite = slot0:poolId2Sprite(slot2)

			onButton(slot0.parent, slot3, function ()
				slot0:ReduceCount(slot0, 1, )
			end, SFX_PANEL)
		else
			setText(slot1:Find("empty/Text"), slot0)
		end

		setActive(slot1:Find("empty"), not slot2)
		setActive(slot3, slot2)
	end

	slot0.posListTop:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0(slot1 + 1, slot2)
		end
	end)
	slot0.posListTop:align(math.min(5, slot0))
	slot0.posListBottom:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0(slot1 + 6, slot2)
		end
	end)
	slot0.posListBottom:align(math.max(0, math.min(5, slot0 - 5)))

	slot0.selectedTxt.text = #slot0.selected .. "/" .. slot0
end

function slot0.Hide(slot0)
	setActive(slot0._tf, false)

	slot0.isShow = false
end

return slot0
