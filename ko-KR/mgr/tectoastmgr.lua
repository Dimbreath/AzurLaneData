pg = pg or {}
pg.TecToastMgr = singletonClass("TecToastMgr")
pg.TecToastMgr.FADE_TIME = 0.4
pg.TecToastMgr.FADE_OUT_TIME = 1
pg.TecToastMgr.SHOW_TIME = 1.5
pg.TecToastMgr.DELAY_TIME = 0.3

function pg.TecToastMgr.Ctor(slot0)
	slot0._go = nil
end

function pg.TecToastMgr.Init(slot0, slot1)
	print("initializing tecToast manager...")
	PoolMgr.GetInstance():GetUI("TechnologyToast", true, function (slot0)
		slot0._go = slot0
		slot0._tf = slot0._go.transform

		slot0._go:SetActive(false)
		slot0._go.transform:SetParent(
		-- Decompilation error in this vicinity:
		GameObject.Find("Overlay/UIOverlay").transform, false)
		slot0:findUI()

		-- Decompilation error in this vicinity:
		GameObject.Find("Overlay/UIOverlay")()
	end)
end

function pg.TecToastMgr.findUI(slot0)
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

function pg.TecToastMgr.tryShow(slot0, slot1, slot2, slot3, slot4)
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

function pg.TecToastMgr.Show(slot0, slot1, slot2, slot3, slot4)
	slot0.itemList = {}

	setText(slot0.pointText.transform, "+" .. slot1)

	if slot2 then
		slot0.buffItemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventExcess then
				slot0.itemList[slot1 + 1] = nil

				Destroy(slot2)
			elseif slot0 == UIItemList.EventUpdate then
				setImageSprite(slot2.transform:Find("TypeImg").transform, slot7)
				setText(slot2.transform:Find("AttrText").transform, AttributeType.Type2Name(slot2.attribute_info_by_type[slot2.transform.Find("TypeImg")].name))
				setText(slot2.transform:Find("ValueText").transform, "+" .. slot4)

				slot0.itemList[slot1 + 1] = go(slot2)
			end
		end)
		slot0.buffItemList:align(#slot2)
	end

	setActive(slot0._go, true)
	setActive(slot0.pointItem, true)

	function slot7()
		LeanTween.moveX(rtf(slot0), 0, slot1.FADE_OUT_TIME)
		LeanTween.value(LeanTween.value, 1, 0, slot1.FADE_OUT_TIME):setOnUpdate(System.Action_float(System.Action_float)):setOnComplete(System.Action(function ()
			setActive(tf(slot0), false)

			if not tf(slot0) then
				slot2:onLast()
			end
		end))
	end

	LeanTween.value(slot5, 0, 1, slot1.FADE_TIME):setOnUpdate(System.Action_float(slot6)):setOnComplete(System.Action(function ()
		LeanTween.delayedCall(LeanTween.delayedCall, slot1.SHOW_TIME, System.Action(slot1.SHOW_TIME))
	end))

	for slot11, slot12 in ipairs(slot0.itemList) do
		LeanTween.delayedCall(slot5, slot11 * slot1.DELAY_TIME, System.Action(function ()
			if slot0 == #slot1.itemList then
				slot1:itemFunc(slot2, slot1.itemFunc, true)
			else
				slot1:itemFunc(slot2, slot1.itemFunc)
			end
		end))
	end
end

function pg.TecToastMgr.itemFunc(slot0, slot1, slot2, slot3)
	slot4 = GetComponent(slot1.transform, "CanvasGroup")

	function slot6()
		LeanTween.moveX(rtf(slot0), 0, slot1.FADE_OUT_TIME)
		LeanTween.value(LeanTween.value, 1, 0, slot1.FADE_OUT_TIME):setOnUpdate(System.Action_float(System.Action_float)):setOnComplete(System.Action(function ()
			setActive(setActive, false)

			if setActive then
				slot2:onLast()
			end
		end))
	end

	LeanTween.value(slot1, 0, 1, slot0.FADE_TIME):setOnUpdate(System.Action_float(slot5)):setOnComplete(System.Action(function ()
		LeanTween.delayedCall(LeanTween.delayedCall, slot1.SHOW_TIME + (slot1.FADE_OUT_TIME - slot1.DELAY_TIME) * slot1.SHOW_TIME, System.Action(System.Action))
	end))
end

function pg.TecToastMgr.onLast(slot0)
	setActive(slot0._go, false)

	slot0.count = slot0.count - 1

	table.remove(slot0.dataBufferList, 1)

	if slot0.count > 0 then
		slot0:Show(slot0.dataBufferList[1].point, slot0.dataBufferList[1].typeList, slot0.dataBufferList[1].attr, slot0.dataBufferList[1].value)
	end
end

return
