slot0 = class("ShipBreakResultLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "ShipBreakResultUI"
end

function slot0.init(slot0)
	slot0.frame = slot0:findTF("frame")
	slot0.attrPanel = slot0:findTF("right_panel/top/attrs")
	slot0.rarePanel = slot0:findTF("right_panel/top/rare")
	slot0.paintContain = slot0:findTF("paint")
	slot0.qCharaContain = slot0:findTF("right_panel/top/q_chara")
	slot0._chat = slot0:findTF("chat", slot0.paintContain)
	slot0.OverlayUIMain = pg.UIMgr.GetInstance().OverlayMain
	slot0.UIMain = pg.UIMgr.GetInstance().UIMain

	setParent(slot0._tf, slot0.OverlayUIMain)

	slot0._shake = slot0:findTF("shake_panel")
	slot0._bg = slot0:findTF("bg", slot0._shake)
	slot0._paintingShadowTF = slot0:findTF("shadow")
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
end

slot1 = {
	"durability",
	"cannon",
	"torpedo",
	"antiaircraft",
	"air"
}

function slot0.updateStatistics(slot0)
	slot3 = intProperties(slot0.contextData.newShip.getShipProperties(slot1))
	slot4 = intProperties(slot0.contextData.oldShip.getShipProperties(slot2))
	slot5 = slot0.attrPanel

	for slot9, slot10 in ipairs(slot0) do
		slot11 = slot5:GetChild(slot9 - 1)

		setText(slot11:Find("name"), AttributeType.Type2Name(slot10))
		setText(slot11:Find("value"), slot4[slot10])
		setText(slot11:Find("value1"), slot3[slot10])

		slot12 = slot11:Find("addition")

		if slot3[slot10] - slot4[slot10] == 0 then
			setActive(slot12, false)
		else
			setText(slot12, "+" .. slot13)
		end
	end

	slot6 = slot5:GetChild(5)

	setText(slot6:Find("name"), AttributeType.Type2Name(AttributeType.Expend))
	setText(slot6:Find("value"), slot7)
	setText(slot6:Find("value1"), slot8)

	slot9 = slot6:Find("addition")

	if math.abs(slot1:getBattleTotalExpend() - slot2:getBattleTotalExpend()) == 0 then
		setActive(slot9, false)
	else
		setText(slot9, "+" .. slot10)
	end

	slot11 = slot1:getStar()
	slot13 = slot0.rarePanel:Find("stars_from")
	slot14 = slot0.rarePanel:Find("stars_to")

	for slot18 = 1, slot2:getStar(), 1 do
		setActive(slot13:GetChild(slot18 - 1), true)
	end

	for slot18 = 1, slot11, 1 do
		setActive(slot14:GetChild(slot18 - 1), true)
	end

	setPaintingPrefabAsync(slot0.paintContain, slot1:getPainting(), "chuanwu")
	setPaintingPrefabAsync(slot0._paintingShadowTF, slot1:getPainting(), "chuanwu", function ()
		findTF(slot0._paintingShadowTF, "fitter"):GetChild(0):GetComponent("Image").color = Color.New(0, 0, 0)
	end)
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(slot15, true, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		slot0.shipPrefab = slot0
		slot0.shipModel = slot0
		tf(slot0).localScale = Vector3(1, 1, 1)

		slot0:GetComponent("SpineAnimUI"):SetAction("stand", 0)
		setParent(slot0, slot0.qCharaContain)
	end)
	GetSpriteFromAtlasAsync("newshipbg/bg_" .. slot1:rarity2bgPrintForGet(), "", function (slot0)
		setImageSprite(slot0._tf, slot0, false)
	end)

	slot17, slot18, slot22 = ShipWordHelper.GetWordAndCV(slot1.skinId, ShipWordHelper.WORD_TYPE_UPGRADE, nil, nil, slot16)

	setWidgetText(slot0._chat, slot19)

	slot20.alignment = (CHAT_POP_STR_LEN < #slot0:findTF("Text", slot0._chat):GetComponent(typeof(Text)).text and TextAnchor.MiddleLeft) or TextAnchor.MiddleCenter
	slot0._chat.transform.localScale = Vector3(0, 0, 1)
	slot0.delayTId = LeanTween.delayedCall(0.6, System.Action(function ()
		SetActive(slot0._chat, true)
		LeanTween.scale(rtf(slot0._chat), Vector3.New(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack)
		LeanTween.scale(rtf(slot0._chat), Vector3.New(1, 1, 1), 0.3).setEase:voice(LeanTween.scale(rtf(slot0._chat), Vector3.New(1, 1, 1), 0.3).setEase)
	end)).id

	GetSpriteFromAtlasAsync("newshipbg/bg_" .. slot1.rarity2bgPrintForGet(slot22), "", function (slot0)
		setImageSprite(slot0._bg, slot0)
	end)

	if slot1.isBluePrintShip(slot22) then
		if slot0.designBg and slot0.designName ~= "raritydesign" .. slot22:getRarity() then
			PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)

			slot0.designBg = nil
		end

		if not slot0.designBg then
			PoolMgr.GetInstance():GetUI("raritydesign" .. slot22:getRarity(), true, function (slot0)
				slot0.designBg = slot0
				slot0.designName = "raritydesign" .. slot1:getRarity()

				slot0.transform:SetParent(slot0._shake, false)

				slot0.transform.localPosition = Vector3(1, 1, 1)
				slot0.transform.localScale = Vector3(1, 1, 1)

				slot0.transform:SetSiblingIndex(1)
				setActive(slot0, true)
			end)
		else
			setActive(slot0.designBg, true)
		end
	elseif slot0.designBg then
		setActive(slot0.designBg, false)
	end

	PoolMgr.GetInstance():GetUI("tupo_" .. slot22:getRarity(), true, function (slot0)
		slot0.transform:SetParent(slot0._tf, false)

		slot0.transform.localPosition = Vector3(1, 1, 1)
		slot0.transform.localScale = Vector3(1, 1, 1)

		slot0.transform:SetSiblingIndex(4)
		setActive(slot0, true)
	end)
	PoolMgr.GetInstance():GetUI("tupo", true, function (slot0)
		slot0.transform:SetParent(slot0._tf, false)

		slot0.transform.localPosition = Vector3(1, 1, 1)
		slot0.transform.localScale = Vector3(1, 1, 1)

		slot0.transform:SetAsLastSibling()
		setActive(slot0, true)
	end)
end

function slot0.voice(slot0, slot1)
	if not slot1 then
		return
	end

	function slot2()
		if slot0._currentVoice then
			slot0._currentVoice:Stop(true)
		end

		slot0._currentVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedCVBankName then
		slot2()
	else
		pg.CriMgr:LoadCV(ShipWordHelper.RawGetCVKey(slot0.contextData.newShip.skinId), function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot1.loadedCVBankName = slot0

				slot2()
			end

			slot1.loadedCVBankName = slot0

			slot2()
		end)
	end
end

function slot0.recycleSpineChar(slot0)
	if slot0.shipPrefab and slot0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipPrefab, slot0.shipModel)

		slot0.shipPrefab = nil
		slot0.shipModel = nil
	end
end

function slot0.willExit(slot0)
	if slot0.delayTId then
		LeanTween.cancel(slot0.delayTId)
	end

	slot0:recycleSpineChar()

	if slot0.designBg then
		PoolMgr.GetInstance():ReturnUI(slot0.designName, slot0.designBg)
	end

	if slot0.inAnimating then
		LeanTween:cancelAll()
	end

	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	setParent(slot0._tf, slot0.UIMain)
end

return slot0
