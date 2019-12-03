slot0 = class("CardPairsCard")
slot0.CARD_STATE_BACK = 0
slot0.CARD_STATE_FRONT = 1
slot0.CARD_STATE_HIDE = 2
slot0.ANI_TIME = 0.5

slot0.Ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	pg.DelegateInfo.New(slot0)

	slot0.cardTf = slot1
	slot0.pics = slot2
	slot0.img = findTF(slot0.cardTf, "img")
	slot0.back = findTF(slot0.cardTf, "back")
	slot0.front = findTF(slot0.cardTf, "front")
	slot0.clearSign = findTF(slot0.cardTf, "gray")
	slot0.outline = GetComponent(slot0.front, typeof(Outline))

	slot0:setOutline(false)

	slot0.cardState = slot0.CARD_STATE_BACK
	slot0.canClick = true
	slot0.enable = true
	slot0.aniCallBack = slot6
	slot0.aniStartCallBak = slot5

	slot0:initCard(slot3)
	onButton(slot0, slot0.cardTf, function ()
		slot0(slot1)
	end)
end

slot0.getCardIndex = function (slot0)
	return slot0.cardIndex
end

slot0.setEnable = function (slot0, slot1)
	slot0.enable = slot1
end

slot0.setClear = function (slot0)
	setActive(slot0.clearSign, true)
	slot0:setOutline(false)

	slot0.canClick = false
end

slot0.setOutline = function (slot0, slot1)
	slot0.outline.enabled = slot1
end

slot0.initCard = function (slot0, slot1)
	slot0.cardIndex = slot1

	slot0:setSpriteTo(findTF(slot0.pics, "pic" .. slot1), slot0.img, false)
	setActive(slot0.clearSign, false)
	slot0:showBack()

	slot0.canClick = true
end

slot0.showBack = function (slot0)
	setActive(slot0.back, true)
	setActive(slot0.front, false)
	setActive(slot0.img, false)

	slot0.cardState = slot0.CARD_STATE_BACK

	slot0:setOutline(false)
end

slot0.showFront = function (slot0)
	setActive(slot0.back, false)
	setActive(slot0.front, true)
	setActive(slot0.img, true)

	slot0.cardState = slot0.CARD_STATE_FRONT
end

slot0.aniShowBack = function (slot0, slot1, slot2, slot3)
	slot0.canClick = false

	if slot1 then
		slot0:showBack()
	else
		slot0:showFront()
	end

	if not slot2 then
		slot0:aniStartCallBak(slot1)
	end

	slot0.cardTf.localScale = Vector3(1, 1, 1)

	LeanTween.scale(go(slot0.cardTf), Vector3(0, 1, 1), slot0.ANI_TIME):setDelay(defaultValue(slot3, 0)):setOnComplete(System.Action(function ()
		if slot0 then
			slot1:showFront()
		else
			slot1:showBack()
		end

		LeanTween.scale(go(slot1.cardTf), Vector3(1, 1, 1), slot1.ANI_TIME):setOnComplete(System.Action(function ()
			slot0.canClick = true

			if not true then
				slot0.aniCallBack(slot0.aniCallBack, slot2)
			end
		end))
	end))
end

slot0.setSpriteTo = function (slot0, slot1, slot2, slot3)
	slot2:GetComponent(typeof(Image)).sprite = slot1:GetComponent(typeof(Image)).sprite

	if slot3 then
		slot4:SetNativeSize()
	end
end

slot0.clear = function (slot0)
	LeanTween.cancel(go(slot0.cardTf))
end

slot0.destroy = function (slot0)
	pg.DelegateInfo.Dispose(slot0)
	LeanTween.cancel(go(slot0.cardTf))
end

return slot0
