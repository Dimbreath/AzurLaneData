slot0 = class("ChatBubble")

function slot0.Ctor(slot0, slot1)
	slot0.tf = tf(slot1)
	slot0.isLoadChatBg = false

	slot0:init()
end

function slot0.init(slot0)
	slot0.nameTF = findTF(slot0.tf, "desc/name"):GetComponent("Text")
	slot0.face = findTF(slot0.tf, "face/content")
	slot0.circle = findTF(slot0.tf, "shipicon/frame")
	slot0.timeTF = findTF(slot0.tf, "time"):GetComponent("Text")
	slot0.headTF = findTF(slot0.tf, "shipicon/icon"):GetComponent("Image")
	slot0.stars = findTF(slot0.tf, "shipicon/stars")
	slot0.star = findTF(slot0.stars, "star")
	slot0.dutyTF = findTF(slot0.tf, "desc/duty")
	slot0.channel = findTF(slot0.tf, "desc/channel")
	slot0.chatBgWidth = 665
end

function slot0.update(slot0, slot1)
	if slot0.data == slot1 then
		return
	end

	slot0.data = slot1
	slot2 = slot1.isSelf

	if slot1.player.icon == 0 then
		slot3.icon = 101171
	end

	slot4 = pg.ship_data_statistics[slot3.icon]
	slot5 = false

	if not slot2 then
		slot5 = slot3.propose
	elseif slot3.character and getProxy(BayProxy):getShipById(slot6) then
		slot5 = slot7.propose
	end

	slot0.nameTF.text = slot3.name
	slot0.timeTF.text = getOfflineTimeStamp(slot6)

	if slot0.dutyTF then
		setActive(slot0.dutyTF, slot3.duty)

		if slot3.duty then
			setImageSprite(slot0.dutyTF, GetSpriteFromAtlas("dutyicon", slot3.duty), true)
		end
	end

	for slot14 = slot0.stars.childCount, Ship.New({
		configId = slot4.id
	}).getStar(slot8) - 1, 1 do
		cloneTplTo(slot0.star, slot0.stars)
	end

	for slot14 = 0, slot0.stars.childCount - 1, 1 do
		slot0.stars:GetChild(slot14).gameObject:SetActive(slot14 < slot4.star)
	end

	if slot0.channel then
		setImageSprite(slot0.channel, GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot1.type) .. "_1920"), true)
	end

	slot0.headTF.color = Color.New(1, 1, 1, 0)

	LoadSpriteAsync("qicon/" .. slot3:getPainting(), function (slot0)
		if not IsNil(slot0.headTF) then
			slot0.headTF.color = Color.white
			slot0.headTF.sprite = slot0 or LoadSprite("heroicon/unknown")
		end
	end)
	PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot11, AttireFrame.attireFrameRes(slot3, slot2, AttireConst.TYPE_ICON_FRAME, slot5), true, function (slot0)
		if IsNil(slot0.tf) then
			return
		end

		if slot0.circle and slot0.data then
			slot0.name = slot1
			findTF(slot0.transform, "icon").GetComponent(slot1, typeof(Image)).raycastTarget = false

			setParent(slot0, slot0.circle, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot1, PoolMgr.GetInstance().ReturnPrefab, slot0)
		end
	end)

	if slot1.emojiId then
		PoolMgr.GetInstance():GetPrefab("emoji/" .. pg.emoji_template[slot1.emojiId].pic, pg.emoji_template[slot1.emojiId].pic, true, function (slot0)
			if IsNil(slot0.tf) then
				return
			end

			if slot0.face and slot0.data then
				slot0.name = slot1.pic

				if slot0:GetComponent("Animator") then
					slot1.enabled = true
				end

				setParent(slot0, slot0.face, false)

				rtf(slot0).sizeDelta = Vector2.New(180, 180)
				slot2.localPosition = (rtf(slot0) and Vector3(-50, 0, 0)) or Vector3(50, 0, 0)
			else
				PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot1.pic, slot1.pic, slot0)
			end
		end)
	else
		PoolMgr.GetInstance():GetPrefab("ChatFrame/" .. slot12, AttireFrame.attireFrameRes(slot3, slot2, AttireConst.TYPE_CHAT_FRAME, slot5), true, function (slot0)
			if IsNil(slot0.tf) then
				return
			end

			if slot0.tf and slot0.data then
				tf(slot0):Find("Text"):GetComponent("RichText").supportRichText = false

				eachChild(tf(slot0):Find("Text"), function (slot0)
					Destroy(slot0)
				end)

				slot3 = false

				for slot7 in nil do
					if table.contains(pg.emoji_small_template.all, tonumber(slot7)) then
						slot3 = true

						slot1:AddSprite(slot7, LoadSprite("emoji/" .. pg.emoji_small_template[tonumber(slot7)].pic .. "_small", nil))
					end
				end

				slot4 = GetComponent(slot0, "VerticalLayoutGroup")

				if slot3 then
					slot4.padding.bottom = 30
				else
					slot4.padding.bottom = slot4.padding.top
				end

				slot1.text = string.gsub(slot1.content, ChatConst.EmojiIconCodeMatch, function (slot0)
					if table.contains(pg.emoji_small_template.all, tonumber(slot0)) then
						return string.format("<icon name=%s w=1 h=1/>", slot0)
					end
				end)
				slot0.isLoadChatBg = true
				slot0:GetComponent(typeof(LayoutElement)).preferredWidth = slot0.chatBgWidth
				slot0.name = slot2

				setParent(slot0, slot0.tf, false)
				tf(slot0):SetAsFirstSibling()
				Canvas.ForceUpdateCanvases()
			else
				PoolMgr.GetInstance():ReturnPrefab("ChatFrame/" .. slot2, PoolMgr.GetInstance(), slot0)
			end
		end)
	end

	setActive(slot0.face.parent, slot1.emojiId)
end

function slot0.dispose(slot0)
	if slot0.face.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot0.face:GetChild(0).gameObject.name, slot0.face.GetChild(0).gameObject.name, slot0.face.GetChild(0).gameObject)
	end

	if slot0.circle.childCount > 0 then
		PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot0.circle:GetChild(0).gameObject.name, slot0.circle.GetChild(0).gameObject.name, slot0.circle.GetChild(0).gameObject)
	end

	if slot0.isLoadChatBg then
		PoolMgr.GetInstance():ReturnPrefab("ChatFrame/" .. slot0.tf:GetChild(0).gameObject.name, slot0.tf.GetChild(0).gameObject.name, slot0.tf.GetChild(0).gameObject)

		slot0.isLoadChatBg = false
	end

	slot0.data = nil
end

return slot0
