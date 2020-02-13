slot0 = class("MemoryBookLayer", import("...base.BaseUI"))
slot1 = 1
slot2 = 2
slot3 = 3
slot0.PAGE_ONE = 1
slot0.PAGE_TWO = 2
slot4 = 12
slot5 = {
	{
		-503,
		83
	},
	{
		-371.4,
		72.6
	},
	{
		-464,
		-211
	},
	{
		-234.3,
		-176
	},
	{
		-74.5,
		30.1
	},
	{
		80,
		121.5
	},
	{
		80,
		25.4
	},
	{
		80,
		-89
	},
	{
		291,
		25.4
	},
	{
		483,
		-33
	},
	{
		334,
		-246
	},
	{
		483,
		-217.5
	},
	{
		-478.4,
		84.5
	},
	{
		-290,
		44.5
	},
	{
		-137,
		12.5
	},
	{
		100.5,
		92.5
	},
	{
		-364.3,
		-179.6
	},
	{
		-137,
		-176.9
	},
	{
		78,
		-176.9
	},
	{
		247,
		-242
	},
	{
		383,
		33
	},
	{
		548,
		69
	},
	{
		456,
		-184
	},
	{
		573,
		-106
	}
}

function slot6(slot0)

	-- Decompilation error in this vicinity:
	function (slot0)
		slot0.root = slot0
		slot0.list = {}
	end({
		Get = function (slot0)
			slot1 = nil

			if #slot0.list == 0 then
				GameObject("Image"):AddComponent(typeof(Image))
			else
				slot1 = table.remove(slot0.list, #slot0.list)
			end

			setActive(slot1, true)

			return slot1
		end,
		Return = function (slot0, slot1)
			slot0:Clear(slot1)
			setParent(slot1, slot0.root)
			table.insert(slot0.list, slot1)
		end,
		Clear = function (slot0, slot1)
			slot1:GetComponent(typeof(Image)).sprite = nil

			setActive(slot1, false)
		end,
		Dispose = function (slot0)
			_.each(slot0.list, function (slot0)
				Destroy(slot0)
			end)

			slot0.list = nil
		end
	})

	return 
end

function slot0.getUIName(slot0)
	return "MemoryBookUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
	slot0.targetItems = slot0.activity:getConfig("config_data")
	slot0.fetchItems = slot0.activity.data1_list
	slot0.unlockItems = slot0.activity.data2_list
	slot0.awardVO = slot0.activity:getConfig("config_client")[1]
end

function slot0.getMemoryState(slot0, slot1)
	return (table.contains(slot0.unlockItems, slot1) and slot0) or (table.contains(slot0.fetchItems, slot1) and slot1) or table.contains(slot0.fetchItems, slot1)
end

function slot0.updateMemorys(slot0)
	slot0.memorys = {}

	for slot4, slot5 in ipairs(slot0.targetItems) do
		table.insert(slot0.memorys, {
			id = slot5,
			index = (slot4 % slot0 == 0 and slot0) or slot7,
			pos = slot1[slot4],
			state = slot0:getMemoryState(slot5)
		})
	end

	slot0:updateMemoryBook(slot0.contextData.page or 1, true)
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("back_btn")
	slot0.page1 = slot0:findTF("page1")
	slot0.page2 = slot0:findTF("page2")
	slot1 = slot0:findTF("get")

	setActive(slot1, false)

	slot0.getSprite = slot1:GetComponent(typeof(Image)).sprite
	slot0.slider = slot0:findTF("slider"):GetComponent(typeof(Slider))
	slot0.totalTxt = slot0:findTF("progress"):GetComponent(typeof(Text))
	slot0.currValueTxt = slot0:findTF("progress/value"):GetComponent(typeof(Text))
	slot0.awardIcon = slot0:findTF("award_bg/icon")
	slot0.awardLabel = slot0:findTF("award_bg/label")
	slot0.awardLabelGot = slot0:findTF("award_bg/label_got")
	slot0.helpBtn = slot0:findTF("help")
	slot0.pool = slot0(slot0._tf)
end

function slot0.didEnter(slot0)
	slot0:addRingDragListenter()
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.memorybook_notice.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.page1:Find("switch"), function ()
		slot0:updateMemoryBook(slot1.PAGE_TWO)
	end, SFX_PANEL)
	onButton(slot0, slot0.page2:Find("switch"), function ()
		slot0:updateMemoryBook(slot1.PAGE_ONE)
	end, SFX_PANEL)

	slot0.sprites = {}
	slot0.gameObjects = {}

	slot0:updateMemorys()
	slot0:updateProgress()
end

function slot0.getStartAndEndIndex(slot0, slot1)
	return (slot1 - 1) * slot0 + 1, ((slot1 - 1) * slot0 + 1 + slot0) - 1
end

function slot0.updateMemoryBook(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.gameObjects) do
		slot0.pool:Return(slot7)
	end

	slot0.gameObjects = {}
	slot3 = slot0["page" .. slot1]
	slot6, slot7 = slot0:getStartAndEndIndex(slot1)

	for slot9 = slot4, slot5, 1 do
		slot0:updateMemoryItem(slot1, slot0.memorys[slot9])
	end

	slot6 = false

	if slot1 == slot0.PAGE_ONE then
		slot6 = slot0:updatePageTip(slot0.PAGE_TWO)
	elseif slot1 == slot0.PAGE_TWO then
		slot6 = slot0:updatePageTip(slot0.PAGE_ONE)
	end

	setActive(slot3:Find("switch/tip"), slot6)

	slot0.page = slot1
	slot0.contextData.page = slot1

	if slot2 then
		if slot1 == slot0.PAGE_TWO then
			slot0.page2.localPosition = Vector3.New(0, 0)
			slot0.page1.localPosition = Vector3.New(-1280, 0)

			setActive(slot0.page2:Find("switch"), true)
		else
			slot0.page2.localPosition = Vector3.New(1280, 0)
			slot0.page1.localPosition = Vector3.New(0, 0)

			setActive(slot0.page1:Find("switch"), true)
		end
	else
		if slot1 == slot0.PAGE_TWO then
			setActive(slot7, false)

			slot0.page2.localPosition = Vector3.New(1280, 0)
			slot0.page1.localPosition = Vector3.New(0, 0)

			LeanTween.moveX(slot0.page2, 0, 0.5)
			LeanTween.moveX(slot0.page1, -1280, 0.5):setOnComplete(System.Action(function ()
				setActive(setActive, true)
			end))

			return
		end

		setActive(slot7, false)

		slot0.page2.localPosition = Vector3.New(0, 0)
		slot0.page1.localPosition = Vector3.New(-1280, 0)

		LeanTween.moveX(slot0.page2, 1280, 0.5)
		LeanTween.moveX(slot0.page1, 0, 0.5):setOnComplete(System.Action(function ()
			setActive(setActive, true)
		end))
	end
end

function slot0.addRingDragListenter(slot0)
	slot1 = GetOrAddComponent(slot0._tf, "EventTriggerListener")
	slot2 = 0
	slot3 = nil

	slot1:AddBeginDragFunc(function ()
		slot0 = 0
		slot1 = nil
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		slot2 = slot1.position

		if not slot0 then
			slot0 = slot2
		end

		slot1 = slot2.x - slot0.x
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if slot0 < -50 then
			if slot1.page == slot2.PAGE_ONE then
				slot1:updateMemoryBook(slot2.PAGE_TWO)
			end
		elseif slot0 > 50 and slot1.page == slot2.PAGE_TWO then
			slot1:updateMemoryBook(slot2.PAGE_ONE)
		end
	end)
end

function slot0.updatePageTip(slot0, slot1)
	slot7, slot3 = slot0:getStartAndEndIndex(slot1)

	return _.any(_.slice(slot0.memorys, slot2, slot0), function (slot0)
		return slot0.state == slot0
	end)
end

function slot0.updateMemoryItem(slot0, slot1, slot2)
	slot4 = slot0["page" .. slot1]

	function slot5()
		slot0 = slot0.pool:Get()

		setImageSprite(slot0, (slot0.pool == slot2 and slot0.getSprite) or slot0:GetMemorySprite(slot3, slot4.index), true)

		slot2.raycastTarget = ((slot0.pool == slot2 and slot0.getSprite) or slot0.GetMemorySprite(slot3, slot4.index)) == slot0:GetComponent(typeof(Image))

		setParent(slot0, slot5:Find("container"))

		tf(slot0).localPosition = Vector3(slot5.Find.pos[1], slot4.pos[2], 0)

		table.insert(slot0.gameObjects, slot0)

		return slot0
	end

	if slot2.state == slot1 then
	elseif slot3 == slot0 then
		onButton(slot0, slot5(), function ()
			slot0:emit(MemoryBookMediator.ON_UNLOCK, slot1.id, slot0.activity.id)
		end, SFX_PANEL)
	elseif slot3 == slot2 then
		slot5()
	end
end

function slot0.GetMemorySprite(slot0, slot1, slot2)
	if slot0.sprites[slot1 .. "_" .. slot2] then
		return slot0.sprites[slot3]
	else
		slot0.sprites[slot3] = GetSpriteFromAtlas("puzzla/bg_2", slot3)

		return GetSpriteFromAtlas("puzzla/bg_2", slot3)
	end
end

function slot0.updateProgress(slot0)
	slot0.slider.value = #slot0.unlockItems / #slot0.targetItems
	slot0.totalTxt.text = #slot0.targetItems
	slot0.currValueTxt.text = #slot0.unlockItems

	slot0:updateAward(#slot0.unlockItems == #slot0.targetItems)
end

function slot0.updateAward(slot0, slot1)
	if not slot0.isInitAward then
		slot0.isInitAward = true
		slot3 = slot0.awardVO[2]

		if slot0.awardVO[1] == DROP_TYPE_FURNITURE then
			GetSpriteFromAtlasAsync("furniture/" .. Furniture.New({
				id = slot3
			}).getConfig(slot4, "picture"), "", function (slot0)
				if slot0.exited then
					return
				end

				setImageSprite(slot0.awardIcon, slot0, true)
			end)
		end
	end

	setGray(slot0.awardIcon, not slot1, false)
	setActive(slot0.awardLabel, slot1 and not (slot0.activity.data1 == 1))
	setActive(slot0.awardLabelGot, slot0.activity.data1 == 1)

	if LeanTween.isTweening(go(slot0.awardLabel)) then
		LeanTween.cancel(go(slot0.awardLabel))
	end

	if slot1 and not slot2 then
		blinkAni(slot0.awardLabel, 0.8, nil, 0.5)
	end

	removeOnButton(slot0.awardIcon)

	if not slot2 then
		onButton(slot0, slot0.awardIcon, function ()
			if not slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("memorybook_get_award_tip"))
			else
				slot1:emit(MemoryBookMediator.EVENT_OPERATION, {
					cmd = 1,
					activity_id = slot1.activity.id
				})
			end
		end, SFX_PANEL)
	end
end

function slot0.willExit(slot0)
	slot0.pool:Dispose()

	slot0.sprites = nil
	slot0.getSprite = nil
end

return slot0
