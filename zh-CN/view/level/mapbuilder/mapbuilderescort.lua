slot1 = class("MapBuilderEscort", import(".MapBuilder"))

function slot1.Ctor(slot0, ...)
	uv0.super.Ctor(slot0, ...)

	slot0.itemList = nil
end

function slot1.GetType(slot0)
	return uv0.TYPEESCORT
end

function slot1.OnInit(slot0)
	slot0.tpl = slot0.tf:Find("level_tpl")
	slot0.itemHolder = slot0.tf:Find("items")
end

function slot1.Update(slot0)
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.pivot = Vector2(0.5, 0.5)
	slot3 = 1

	if slot0.map.rect.width / slot0.map.rect.height < slot0.tfParent.rect.width / slot0.tfParent.rect.height then
		slot3 = slot0.tfParent.rect.width / 1280
		slot0.tf.localScale = Vector3(slot3, slot3, 1)
	else
		slot3 = slot0.tfParent.rect.height / 720
		slot0.tf.localScale = Vector3(slot3, slot3, 1)
	end
end

function slot1.UpdateEscortInfo(slot0)
	slot1 = slot0.data
	slot2 = getProxy(ChapterProxy)
	slot3 = slot2:getMaxEscortChallengeTimes()

	setText(slot0.sceneParent.escortBar:Find("times/text"), slot3 - slot2.escortChallengeTimes .. "/" .. slot3)
	onButton(slot0.sceneParent, slot0.sceneParent.mapHelpBtn, function ()
		uv0:InvokeParent("HandleShowMsgBox", {
			type = MSGBOX_TYPE_HELP,
			helps = i18n("levelScene_escort_help_tip")
		})
	end, SFX_PANEL)
end

function slot1.UpdateMapItems(slot0)
	uv0.super.UpdateMapItems(slot0)
	slot0:UpdateEscortInfo()
	setActive(slot0.sceneParent.escortBar, true)
	setActive(slot0.sceneParent.mapHelpBtn, true)

	slot3 = _.detect(getProxy(ChapterProxy).escortMaps, function (slot0)
		return slot0.id == map.id
	end).chapters

	if not slot0.itemList then
		slot4 = UIItemList.New(slot0.itemHolder, slot0.tpl)

		slot4:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot3 = uv0[slot1 + 1]

				uv1:UpdateEscortItem(slot2, slot3.escortId, slot3.chapter)
			end
		end)

		slot0.itemList = slot4
	end

	slot4:align(#slot3)
end

function slot1.UpdateEscortItem(slot0, slot1, slot2, slot3)
	slot4 = pg.escort_template[slot2]
	slot1.name = "chapter_" .. slot3.id
	slot7 = GetComponent(slot0.map, "Image")
	slot1.anchoredPosition = Vector2(slot7.preferredWidth * (tonumber(slot4.pos_x) - 0.5), slot7.preferredHeight * (tonumber(slot4.pos_y) - 0.5))
	slot9 = getProxy(ChapterProxy):getActiveChapter() and slot6.id == slot3.id

	setActive(slot1:Find("fighting"), slot9)
	slot0:DeleteTween("fighting" .. slot3.id)

	if slot9 then
		setImageAlpha(slot8, 1)
		slot0:RecordTween("fighting" .. slot3.id, LeanTween.alpha(slot8, 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	GetImageSpriteFromAtlasAsync("levelmap/mapquad/" .. slot4.pic, "", slot1, true)

	for slot18 = 0, slot1:Find("anim"):GetComponentsInChildren(typeof(Image)).Length - 1, 1 do
		slot14[slot18].color = ({
			Color.green,
			Color.yellow,
			Color.red
		})[table.indexof(pg.gameset.gardroad_count.description[1], slot2) or 1]
	end

	setImageColor(slot1, slot13)
	onButton(slot0.sceneParent, slot1, function ()
		uv0:InvokeParent("TrySwitchChapter", uv1)
	end, SFX_PANEL)
end

function slot1.OnHide(slot0)
	setActive(slot0.sceneParent.escortBar, false)
	setActive(slot0.sceneParent.mapHelpBtn, false)
end

function slot1.OnDestroy(slot0)
	slot0.itemList = nil
end

return slot1
