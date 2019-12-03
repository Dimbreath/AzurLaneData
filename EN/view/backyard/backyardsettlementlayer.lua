slot0 = class("BackYardSettlementLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "BackYardStatisticsUI"
end

function slot0.setShipVOs(slot0, slot1, slot2)
	slot0.oldShipVOs = slot1
	slot0.newShipVOs = slot2
end

function slot0.setDormVO(slot0, slot1)
	slot0.dormVO = slot1
end

function slot0.init(slot0)
	slot0.UIMgr = pg.UIMgr.GetInstance()

	slot0.UIMgr:BlurPanel(slot0._tf)

	slot0.frame = slot0:findTF("frame")
	slot0.painting = slot0:findTF("painting")
	slot0.confirmBtn = slot0:findTF("painting/confirm_btn")
end

function slot0.didEnter(slot0)
	slot0.tweens = {}

	onButton(slot0, slot0.confirmBtn, function ()
		if slot0.dormVO.food == 0 then
			slot0:emit(BackYardSettlementMediator.OPEN_NOFOOD)
		end

		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	slot0:initPainting()
	slot0:initAddExpInfo()
end

function slot0.initPainting(slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.newShipVOs) do
		slot1 = slot6

		break
	end

	setPaintingPrefabAsync(slot0.painting, slot1:getPainting(), "jiesuan")
end

function slot0.initAddExpInfo(slot0)
	setActive(slot0:findTF("ship_word/text_contain1"), slot0.dormVO.food ~= 0)
	setActive(slot0:findTF("ship_word/text_contain2"), slot0.dormVO.food ~= 0)
	setActive(slot0:findTF("ship_word/Text"), slot0.dormVO.food == 0)

	slot5 = slot0:getTpl("ship_tpl", setActive)
	slot0.shipDescTF = {}
	slot6 = table.getCount(slot0.newShipVOs)

	for slot10, slot11 in pairs(slot0.newShipVOs) do
		slot0.shipDescTF[slot11.id] = cloneTplTo(slot5, slot4)

		slot0:updateShip(slot11)

		if slot11.level == slot11:getMaxLevel() then
			slot6 = slot6 - 1
		end
	end

	slot7 = slot6 * slot0.dormVO.load_exp

	if slot0.dormVO.food == 0 then
		setText(slot3, i18n("backyard_backyardGranaryLayer_noFood"))
	else
		slot10 = string.split(slot9, "||")
		slot11 = slot0:findTF("ship_word/text_contain1")
		slot12 = 0

		while slot12 < slot11.childCount do
			setText(slot11:GetChild(slot12), slot10[slot12 + 1])

			slot12 = slot12 + 1
		end

		slot13 = slot0:findTF("ship_word/text_contain2")
		slot14 = 0

		while slot14 < slot13.childCount do
			setText(slot13:GetChild(slot14), slot10[slot12 + 1])

			slot12 = slot12 + 1
			slot14 = slot14 + 1
		end
	end
end

slot1 = 0.3

function slot0.updateShip(slot0, slot1)
	slot5 = findTF(slot2, "exp/level"):GetComponent(typeof(Text))
	slot6 = findTF(slot2, "addition_bg/Text").GetComponent(slot4, typeof(Text))
	slot7 = slot0.dormVO.load_exp

	if slot0.oldShipVOs[slot1.id].level == slot0.oldShipVOs[slot1.id]:getMaxLevel() then
		slot7 = 0
	end

	slot5.text = "LEVEL" .. slot3.level
	slot8 = math.max(slot1:getLevelExpConfig().exp, 0.001)
	slot9 = findTF(slot2, "exp/value"):GetComponent(typeof(Slider))

	TweenValue(slot4, 0, slot7, slot0 * (slot1.level - slot3.level + 1), 0, function (slot0)
		slot0.text = "EXP+" .. math.floor(slot0)
	end)
	table.insert(slot0.tweens, slot4)

	if slot1.level - slot3.level > 0 then
		TweenValue(slot9, slot3.exp, math.max(slot3:getLevelExpConfig().exp, 0.001), slot0, 0, function (slot0)
			slot0:setSliderValue(slot0.setSliderValue, slot0 / slot2)
		end, function ()
			playSoundEffect(SFX_BOAT_LEVEL_UP)

			slot0 = playSoundEffect - 1
			SFX_BOAT_LEVEL_UP.text = "LEVEL" .. slot2.level - SFX_BOAT_LEVEL_UP

			if SFX_BOAT_LEVEL_UP > 0 then
				TweenValue(slot3, 0, 1, slot4, 0, function (slot0)
					slot0:setSliderValue(slot0.setSliderValue, slot0)
				end, function ()
					playSoundEffect(SFX_BOAT_LEVEL_UP)

					slot0 = playSoundEffect - 1
					SFX_BOAT_LEVEL_UP.text = "LEVEL" .. slot2.level - SFX_BOAT_LEVEL_UP

					if SFX_BOAT_LEVEL_UP == 0 then
						TweenValue(slot3, 0, slot2.exp / slot4, slot5, 0, function (slot0)
							slot0:setSliderValue(slot0.setSliderValue, slot0)
						end)
					end
				end, TweenValue)
			else
				TweenValue(slot3, 0, slot2.exp / slot6, slot6, 0, function (slot0)
					slot0:setSliderValue(slot0.setSliderValue, slot0)
				end)
			end
		end)
	else
		TweenValue(slot9, slot3.exp, slot1.exp, slot0, 0, function (slot0)
			slot0:setSliderValue(slot0.setSliderValue, slot0 / slot2)
		end)
	end

	table.insert(slot0.tweens, slot9)

	slot0:findTF("icon", slot2).GetComponent(slot11, typeof(Image)).sprite = LoadSprite("HeroHrzIcon/" .. slot1:getPainting())

	setText(slot0:findTF("name_bg/Text", slot2), slot1:getName())
end

function slot0.setSliderValue(slot0, slot1, slot2)
	if slot2 ~= 0 and slot2 < 0.03 then
		slot2 = 0.03
	end

	slot1.value = slot2
end

function slot0.willExit(slot0)
	slot0.UIMgr:UnblurPanel(slot0._tf, slot0.UIMgr.UIMain)

	slot1 = ipairs
	slot2 = slot0.tweens or {}

	for slot4, slot5 in slot1(slot2) do
		if LeanTween.isTweening(go(slot5)) then
			LeanTween.cancel(go(slot5))
		end
	end
end

return slot0
