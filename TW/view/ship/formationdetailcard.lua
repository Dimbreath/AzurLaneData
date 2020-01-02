slot0 = class("FormationDetailCard")
slot1 = 0
slot2 = 1
slot3 = 2

function slot0.Ctor(slot0, slot1)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.lockTF = slot0.tr:Find("lock")
	slot0.addTF = slot0.tr:Find("add")
	slot0.content = slot0.tr:Find("content")
	slot0.bgImage = slot0.content:Find("bg"):GetComponent(typeof(Image))
	slot0.paintingTr = slot0.content:Find("ship_icon/painting")
	slot0.detailTF = slot0.content:Find("detail")
	slot0.lvTxtTF = slot0.detailTF:Find("top/level")
	slot0.lvTxt = slot0.lvTxtTF:GetComponent(typeof(Text))
	slot0.shipType = slot0.detailTF:Find("top/type")
	slot0.propsTr = slot0.detailTF:Find("info")
	slot0.propsTr1 = slot0.detailTF:Find("info1")
	slot0.nameTxt = ScrollTxt.New(findTF(slot0.detailTF, "name_mask"), findTF(slot0.detailTF, "name_mask/name"))
	slot0.frame = slot0.content:Find("front/frame")
	slot0.UIlist = UIItemList.New(slot0.content:Find("front/stars"), slot0.content:Find("front/stars/star_tpl"))
	slot0.shipState = slot0.content:Find("front/flag")
	slot0.otherBg = slot0.content:Find("front/bg_other")

	setActive(slot0.propsTr1, false)
	setActive(slot0.shipState, false)
end

function slot0.update(slot0, slot1, slot2)
	slot0.shipVO = slot1
	slot0.isLocked = slot2

	slot0:flush()
end

function slot0.getState(slot0)
	if slot0.isLocked then
		return slot0
	elseif slot0.shipVO then
		return slot1
	elseif not slot0.isLocked and not slot0.shipVO then
		return slot2
	end
end

function slot0.flush(slot0)
	slot1 = slot0:getState()

	if slot0.otherBg then
		eachChild(slot0.otherBg, function (slot0)
			setActive(slot0, false)
		end)
	end

	if slot1 == slot0 then
	elseif slot1 == slot1 then
		setAnchoredPosition(slot0.lvTxtTF, {
			x = (slot0.shipVO:isBluePrintShip() and -18) or -7.5
		})

		slot0.lvTxt.text = "Lv." .. slot2.level
		slot4 = slot2:getStar()

		slot0.UIlist:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				setActive(slot2:Find("star"), slot1 < slot0)
			end
		end)
		slot0.UIlist:align(setAnchoredPosition)
		slot0.nameTxt:setText(slot2:getName())
		slot0:updateProps({})
		setPaintingPrefabAsync(slot0.paintingTr, slot2:getPainting(), "biandui")
		setRectShipCardFrame(slot0.frame, slot0.shipVO:rarity2bgPrint(), (slot2.propose and "prop" .. ((slot2:isBluePrintShip() and ) or "")) or nil)
		GetSpriteFromAtlasAsync("bg/star_level_card_" .. , "", function (slot0)
			slot0.bgImage.sprite = slot0
		end)
		setImageSprite(slot0.shipType, GetSpriteFromAtlas("shiptype", shipType2print(slot0.shipVO:getShipType())))

		slot7 = nil
		slot8 = false

		if slot2.propose then
			slot7 = "duang_6_jiehun" .. ((slot2:isBluePrintShip() and "_tuzhi") or "") .. "_1"
		elseif slot2:getRarity() == 6 then
			slot7 = "duang_6_1"
		end

		if slot7 then
			eachChild(slot0.otherBg, function (slot0)
				setActive(slot0, slot0.name == slot0 .. "(Clone)")

				slot1 = setActive or slot0.name == slot0 .. "(Clone)"
				slot1 = slot1
			end)

			if not slot8 then
				PoolMgr.GetInstance():GetPrefab("effect/" .. slot7, "", true, function (slot0)
					setParent(slot0, slot0.otherBg)
				end)
			end
		end

		setActive(slot0.otherBg, slot7)
	elseif slot1 == slot2 then
	end

	setActive(slot0.lockTF, slot1 == slot0)
	setActive(slot0.addTF, slot1 == setActive)
	setActive(slot0.content, slot1 == slot1)
end

function slot0.updateProps(slot0, slot1)
	for slot5 = 0, 2, 1 do
		slot6 = slot0.propsTr:GetChild(slot5)

		if slot5 < #slot1 then
			slot6.gameObject:SetActive(true)

			slot6:GetChild(0):GetComponent("Text").text = slot1[slot5 + 1][1]
			slot6:GetChild(1):GetComponent("Text").text = slot1[slot5 + 1][2]
		else
			slot6.gameObject:SetActive(false)
		end
	end
end

function slot0.clear(slot0)
	if slot0.shipVO then
		retPaintingPrefab(slot0.paintingTr, slot1:getPainting())
	end

	if slot0.nameTxt then
		slot0.nameTxt:destroy()

		slot0.nameTxt = nil
	end
end

return slot0
