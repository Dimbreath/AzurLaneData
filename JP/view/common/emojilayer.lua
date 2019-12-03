slot0 = class("EmojiLayer", import("..base.BaseUI"))
slot0.PageEmojiNums = 8

function slot0.getUIName(slot0)
	return "EmojiUI"
end

function slot0.init(slot0)
	slot0.emojiGroup = slot0:findTF("frame/group")
	slot0.emojiType = slot0:findTF("type", slot0.emojiGroup)
	slot0.emojiSnap = slot0:findTF("frame/bg/mask/event"):GetComponent("HScrollSnap")

	slot0.emojiSnap:Init()

	slot0.emojiContent = slot0:findTF("content", slot0.emojiSnap)
	slot0.emojiItem = slot0:findTF("item", slot0.emojiSnap)
	slot0.emojiDots = slot0:findTF("frame/dots")
	slot0.emojiDot = slot0:findTF("dot", slot0.emojiSnap)

	setActive(slot0.emojiItem, false)
	setActive(slot0.emojiDot, false)

	slot0.resource = slot0:findTF("frame/resource")
	slot0.frame = slot0:findTF("frame")
	slot0.frame.position = slot0.contextData.pos or Vector3(0, 0, 0)
	slot0.frame.localPosition = Vector3(slot0.frame.localPosition.x, slot0.frame.localPosition.y, 0)
	slot0.newTag = slot0:findTF("newtag")
	slot0.emojiProxy = getProxy(EmojiProxy)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	slot0:display()
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		groupName = slot0:getGroupNameFromData()
	})
end

function slot0.display(slot0)
	slot1 = UIItemList.New(slot0.emojiGroup, slot0.emojiType)

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("Text"), i18n("emoji_type_" .. ChatConst.EmojiTypes[slot1 + 1]))

			if slot0.emojiProxy:fliteNewEmojiDataByType()[ChatConst.EmojiTypes[slot1 + 1]] then
				setActive(slot2:Find("point"), true)
			else
				setActive(slot2:Find("point"), false)
			end

			onToggle(slot0, slot2, function (slot0)
				if slot0 then
					slot0:filter(slot0.filter)
					slot0:align(#ChatConst.EmojiTypes)
				end
			end, SFX_PANEL)
		end
	end)
	slot1:align(#ChatConst.EmojiTypes)
	triggerToggle(slot0.emojiGroup:GetChild(0), true)
end

function slot0.filter(slot0, slot1)
	slot0.etype = slot1
	slot2 = _.map(pg.emoji_template.all, function (slot0)
		if pg.emoji_template[slot0].achieve == 0 then
			return pg.emoji_template[slot0]
		end
	end)
	slot3 = slot0.emojiProxy:getNewEmojiIDLIst()
	slot4 = slot0.emojiProxy:fliteNewEmojiDataByType()

	for slot9, slot10 in pairs(slot5) do
		table.insert(slot2, 1, slot10)
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.index == slot1.index then
			return slot0.id < slot1.id
		end

		return slot0.index < slot1.index
	end)

	if slot1 == ChatConst.EmojiCommon then
		slot8 = {}

		for slot12, slot13 in pairs(slot7) do
			table.insert(slot8, {
				id = slot12,
				count = slot13
			})
		end

		table.sort(slot8, function (slot0, slot1)
			if slot0.count == slot1.count then
				return slot0.id < slot1.id
			end

			return slot1.count < slot0.count
		end)

		slot2 = _.map(slot8, function (slot0)
			return pg.emoji_template[slot0.id]
		end)
	else
		slot2 = _.filter(slot2, function (slot0)
			return table.contains(slot0.type, slot0)
		end)
	end

	if slot4[slot1] then
		for slot9, slot10 in pairs(slot4[slot1]) do
			table.insert(slot2, 1, slot10)
		end
	end

	slot0.tplCaches = slot0.tplCaches or {}

	for slot10 = slot0.emojiContent.childCount - 1, math.ceil(#slot2 / slot0.PageEmojiNums), -1 do
		Destroy(slot0.emojiDots:GetChild(slot10))

		slot11 = slot0.emojiSnap:RemoveChild(slot10)
		slot11.transform.localScale = Vector3.one

		slot11.transform:SetParent(slot0._tf, false)
		setActive(slot11, false)
		slot0:clearItem(slot11)
		table.insert(slot0.tplCaches, slot11)
	end

	for slot10 = slot0.emojiContent.childCount + 1, slot6, 1 do
		slot11 = nil

		setActive((#slot0.tplCaches <= 0 or table.remove(slot0.tplCaches)) and Instantiate(slot0.emojiItem), true)
		slot0.emojiSnap:AddChild((#slot0.tplCaches <= 0 or table.remove(slot0.tplCaches)) and Instantiate(slot0.emojiItem))
		cloneTplTo(slot0.emojiDot, slot0.emojiDots)
	end

	for slot10 = 0, slot0.emojiContent.childCount - 1, 1 do
		slot11 = slot0.emojiContent:GetChild(slot10)

		slot0:clearItem(slot11)

		slot13 = UIItemList.New(slot11, slot11:Find("face"))

		slot13:make(function (slot0, slot1, slot2)
			slot3 = slot0[slot1 + 1]

			if slot0 == UIItemList.EventUpdate then
				PoolMgr.GetInstance():GetPrefab("emoji/" .. slot3.pic, slot3.pic, true, function (slot0)
					if slot0.etype ==  and slot2 then
						slot0.name = slot3.pic

						if slot0:GetComponent("Animator") then
							slot1.enabled = false
						end

						if slot0:GetComponent("CriManaEffectUI") then
							slot1:Pause(true)
						end

						setParent(slot0, setParent, false)

						if table.contains(setParent, slot3.id) then
							cloneTplTo(slot0.newTag, cloneTplTo, "newtag")
							slot0.emojiProxy:removeNewEmojiID(slot3.id)
						end
					else
						PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot3.pic, slot3.pic, slot0)
					end
				end)
				onButton(slot1, slot2, function ()
					slot0 = getProxy(ChatProxy)

					slot0:addUsedEmoji(slot0.id)
					slot0.addUsedEmoji.contextData.callback(slot0.id)
					triggerButton(slot1._tf)
				end, SFX_PANEL)
			end
		end)
		slot13:align(#_.slice(slot2, slot10 * slot0.PageEmojiNums + 1, slot0.PageEmojiNums))
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot0.clearItem(slot0, slot1)
	eachChild(slot1, function (slot0)
		if slot0.childCount > 0 then
			if slot0:Find("newtag") then
				Destroy(slot1)
			end

			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot0:GetChild(0).gameObject.name, slot0.GetChild(0).gameObject.name, slot0.GetChild(0).gameObject)
		end
	end)
end

function slot0.willExit(slot0)
	eachChild(slot0.emojiContent, function (slot0)
		slot0:clearItem(slot0)
	end)
	_.each(slot0.tplCaches, function (slot0)
		slot0:clearItem(slot0)
	end)

	slot0.etype = nil
end

return slot0
