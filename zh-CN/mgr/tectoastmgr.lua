pg = pg or {}
slot0 = pg
slot0.TecToastMgr = singletonClass("TecToastMgr")
slot1 = slot0.TecToastMgr
slot1.FADE_TIME = 0.4
slot1.FADE_OUT_TIME = 1
slot1.SHOW_TIME = 1.5
slot1.DELAY_TIME = 0.3

function slot1.Ctor(slot0)
	slot0._go = nil
end

function slot1.Init(slot0, slot1)
	print("initializing tecToast manager...")
	PoolMgr.GetInstance():GetUI("TechnologyToast", true, function (slot0)
		uv0._go = slot0
		uv0._tf = uv0._go.transform

		uv0._go:SetActive(false)
		uv0._go.transform:SetParent(GameObject.Find("Overlay/UIOverlay").transform, false)
		uv0:findUI()
		uv1()
	end)
end

function slot1.findUI(slot0)
	slot0.pointItem = slot0._go.transform:Find("PointItem")
	slot0.pointText = slot0.pointItem:Find("PointText")
	slot0.buffItemTpl = slot0._go.transform:Find("BuffItemTpl")
	slot0.container = slot0._go.transform:Find("Container")
	slot0.pointItemCGCom = GetComponent(slot0.pointItem, "CanvasGroup")
	slot0.itemList = {}
	slot0.count = 0
	slot0.dataBufferList = {}
	slot0.buffItemList = UIItemList.New(slot0.container, slot0.buffItemTpl)
end

function slot1.tryShow(slot0, slot1, slot2, slot3, slot4)
	slot0.count = slot0.count + 1
	slot0.dataBufferList[#slot0.dataBufferList + 1] = {
		point = slot1,
		typeList = slot2,
		attr = slot3,
		value = slot4
	}

	if slot0.count == 1 then
		slot0:Show(slot1, slot2, slot3, slot4)
	end
end

function slot1.Show(slot0, slot1, slot2, slot3, slot4)
	slot0.itemList = {}

	setText(slot0.pointText.transform, "+" .. slot1)

	if slot2 then
		slot0.buffItemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventExcess then
				uv0.itemList[slot1 + 1] = nil

				Destroy(slot2)
			elseif slot0 == UIItemList.EventUpdate then
				setImageSprite(slot2.transform:Find("TypeImg").transform, GetSpriteFromAtlas("ShipType", "buffitem_tec_" .. uv1[slot1 + 1]))
				setText(slot2.transform:Find("AttrText").transform, AttributeType.Type2Name(uv2.attribute_info_by_type[uv3].name))
				setText(slot2.transform:Find("ValueText").transform, "+" .. uv4)

				uv0.itemList[slot1 + 1] = go(slot2)
			end
		end)
		slot0.buffItemList:align(#slot2)
	end

	setActive(slot0._go, true)
	setActive(slot0.pointItem, true)

	function slot7()
		LeanTween.moveX(rtf(uv0), 0, uv1.FADE_OUT_TIME)
		LeanTween.value(uv0, 1, 0, uv1.FADE_OUT_TIME):setOnUpdate(System.Action_float(uv2)):setOnComplete(System.Action(function ()
			setActive(tf(uv0), false)

			if not uv1 then
				uv2:onLast()
			end
		end))
	end

	slot12 = uv1.FADE_TIME

	function slot11()
		LeanTween.delayedCall(uv0, uv1.SHOW_TIME, System.Action(uv2))
	end

	LeanTween.value(go(slot0.pointItem), 0, 1, slot12):setOnUpdate(System.Action_float(function (slot0)
		uv0.pointItemCGCom.alpha = slot0
	end)):setOnComplete(System.Action(slot11))

	for slot11, slot12 in ipairs(slot0.itemList) do
		LeanTween.delayedCall(slot5, slot11 * uv1.DELAY_TIME, System.Action(function ()
			if uv0 == #uv1.itemList then
				uv1:itemFunc(uv2, uv0, true)
			else
				uv1:itemFunc(uv2, uv0)
			end
		end))
	end
end

function slot1.itemFunc(slot0, slot1, slot2, slot3)
	slot4 = GetComponent(slot1.transform, "CanvasGroup")

	function slot6()
		LeanTween.moveX(rtf(uv0), 0, uv1.FADE_OUT_TIME)
		LeanTween.value(uv0, 1, 0, uv1.FADE_OUT_TIME):setOnUpdate(System.Action_float(uv2)):setOnComplete(System.Action(function ()
			setActive(uv0, false)

			if uv1 then
				uv2:onLast()
			end
		end))
	end

	LeanTween.value(slot1, 0, 1, uv0.FADE_TIME):setOnUpdate(System.Action_float(function (slot0)
		uv0.alpha = slot0
	end)):setOnComplete(System.Action(function ()
		LeanTween.delayedCall(uv0, uv1.SHOW_TIME + (uv1.FADE_OUT_TIME - uv1.DELAY_TIME) * uv2, System.Action(uv3))
	end))
end

function slot1.onLast(slot0)
	setActive(slot0._go, false)

	slot0.count = slot0.count - 1

	table.remove(slot0.dataBufferList, 1)

	if slot0.count > 0 then
		slot0:Show(slot0.dataBufferList[1].point, slot0.dataBufferList[1].typeList, slot0.dataBufferList[1].attr, slot0.dataBufferList[1].value)
	end
end
