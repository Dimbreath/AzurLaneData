slot0 = class("ShipProfileCvBtn")

function slot0.Ctor(slot0, slot1)
	slot0._tf = slot1
	slot0._go = go(slot1)
	slot2 = slot0._tf
	slot2 = slot2:Find("Text")
	slot0.nameTxt = slot2:GetComponent(typeof(Text))
	slot3 = slot0._tf

	setActive(slot3:Find("tag_common"), true)

	slot2 = slot0._tf
	slot0.tagDiff = slot2:Find("tag_diff")
end

function slot0.Init(slot0, slot1, slot2, slot3, slot4)
	slot0.shipGroup = slot1
	slot0.isLive2d = slot3
	slot0.skin = slot2
	slot0.voice = slot4
	slot0.words = pg.ship_skin_words[slot0.skin.id]
	slot5, slot6, slot7, slot8, slot9, slot10 = nil

	if string.find(slot4.key, ShipWordHelper.WORD_TYPE_MAIN) then
		slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(slot0.skin.id, ShipWordHelper.WORD_TYPE_MAIN, tonumber(string.split(slot11, ShipWordHelper.WORD_TYPE_MAIN)[1]))

		if slot0.isLive2d then
			slot9 = ShipWordHelper.GetL2dCvCalibrate(slot0.skin.id, ShipWordHelper.WORD_TYPE_MAIN, slot8)
			slot10 = ShipWordHelper.GetL2dSoundEffect(slot0.skin.id, ShipWordHelper.WORD_TYPE_MAIN, slot8)
		end
	else
		slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(slot0.skin.id, slot11)

		if slot0.isLive2d then
			slot9 = ShipWordHelper.GetL2dCvCalibrate(slot0.skin.id, slot11)
			slot10 = ShipWordHelper.GetL2dSoundEffect(slot0.skin.id, slot11)
		end
	end

	slot0.wordData = {
		cvKey = slot5,
		cvPath = slot6,
		textContent = slot7,
		mainIndex = slot8,
		voiceCalibrate = slot9,
		se = slot10
	}
end

function slot0.Update(slot0)
	slot2 = slot0.voice.unlock_condition[1] < 0
	slot3 = slot0.wordData.textContent == nil or slot0.wordData.textContent == "nil" or slot0.wordData.textContent == ""
	slot2 = not slot0.isLive2d and (slot2 or slot3) or slot2 or slot3 and slot1.l2d_action:match("^main_")

	setActive(slot0._tf, not slot2)

	if not slot2 then
		slot0:UpdateCvBtn()
	end
end

function slot0.UpdateCvBtn(slot0)
	slot3, slot4 = slot0.shipGroup:VoiceReplayCodition(slot0.voice)
	slot0.nameTxt.text = slot3 and slot1.voice_name or "???"

	setActive(slot0.tagDiff, ShipWordHelper.ExistDifferentWord(slot0.skin.id, slot1.key, slot0.wordData.mainIndex))

	if not slot3 then
		onButton(nil, slot0._tf, function ()
			slot0 = pg.TipsMgr.GetInstance()

			slot0:ShowTips(uv0)
		end, SFX_PANEL)
	end
end

function slot0.Destroy(slot0)
	Destroy(slot0._go)
	removeOnButton(slot0._tf)
end

return slot0
