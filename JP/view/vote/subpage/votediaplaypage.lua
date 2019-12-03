slot0 = class("VoteDiaplayPage", import("...base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "VoteDisplay"
end

slot0.OnInit = function (slot0)
	slot0.paitingTF = findTF(slot0._tf, "painting")
	slot0.numberTxt = findTF(slot0._tf, "filter_bg/Text"):GetComponent(typeof(Text))
	slot0.nameTxt = findTF(slot0._tf, "frame/bg/name"):GetComponent(typeof(Text))
	slot0.enNameTxt = findTF(slot0._tf, "frame/bg/en_name"):GetComponent(typeof(Text))
	slot0.descTxt = findTF(slot0._tf, "frame/bg/scroll/desc"):GetComponent(typeof(Text))
	slot0.valueInput = findTF(slot0._tf, "frame/bg/InputField"):GetComponent(typeof(InputField))
	slot0.addBtn = findTF(slot0._tf, "frame/bg/add")
	slot0.miunsBtn = findTF(slot0._tf, "frame/bg/miuns")
	slot0.maxBtn = findTF(slot0._tf, "frame/bg/max")
	slot0.submitBtn = findTF(slot0._tf, "frame/bg/submit")
	slot0.rankTxt = findTF(slot0._tf, "frame/bg/rank"):GetComponent(typeof(Text))
	slot0.votesTxt = findTF(slot0._tf, "frame/bg/votes"):GetComponent(typeof(Text))
	slot0.shiptypeTxt = findTF(slot0._tf, "frame/bg/shiptype"):GetComponent(typeof(Text))
	slot0.nationImg = findTF(slot0._tf, "frame/bg/nation"):GetComponent(typeof(Image))
	slot0.bg1 = findTF(slot0._tf, "frame/bg/bg1")
	slot0.bg2 = findTF(slot0._tf, "frame/bg/bg2")
end

slot0.Open = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.callback = slot5
	slot0.maxValue = slot3
	slot0.rank = slot2
	slot0.value = 1

	setActive(slot0.bg1, not slot4)
	setActive(slot0.bg2, slot4)

	slot0.votes = slot4 or "-"

	setActive(slot0._tf, true)

	slot0.numberTxt.text = "X" .. slot3

	if slot1 ~= slot0.voteShip then
		slot0.voteShip = slot1

		slot0:Update(slot1)
	end

	onInputEndEdit(slot0, go(slot0.valueInput), function ()
		if tonumber(slot0) < 1 then
			slot0.value = 1
		elseif slot0.maxValue < slot1 then
			slot0.value = math.max(1, slot0.maxValue)
		else
			slot0.value = slot1
		end

		slot0:UpdateCnt()
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

slot0.UpdateCnt = function (slot0)
	slot0.valueInput.text = slot0.value
end

slot0.Update = function (slot0, slot1)
	slot0.nameTxt.text = slot1:getShipName()
	slot0.enNameTxt.text = slot1:getEnName()
	slot0.descTxt.text = slot1:GetDesc()
	slot0.votesTxt.text = slot0.votes
	slot0.rankTxt.text = slot0.rank
	slot0.shiptypeTxt.text = slot1:getShipType()
	slot0.nationImg.sprite = LoadSprite("prints/" .. nation2print(slot1:getNationality()) .. "_0")

	slot0:UpdateCnt()
	onButton(slot0, slot0._tf, function ()
		slot0:Close()
	end)
	onButton(slot0, slot0.addBtn, function ()
		if slot0.maxValue <= slot0.value then
			return
		end

		slot0.value = slot0.value + 1

		slot0:UpdateCnt()
	end, SFX_PANEL)
	onButton(slot0, slot0.miunsBtn, function ()
		if slot0.value == 1 then
			return
		end

		slot0.value = slot0.value - 1

		slot0:UpdateCnt()
	end, SFX_PANEL)
	onButton(slot0, slot0.maxBtn, function ()
		if slot0.maxValue == 0 then
			return
		end

		slot0.value = slot0.maxValue

		slot0:UpdateCnt()
	end, SFX_PANEL)
	onButton(slot0, slot0.submitBtn, function ()
		slot0.callback(slot0.value)
		slot0.callback:Close()
	end, SFX_PANEL)

	slot0.paintingName = slot1:getPainting()

	setPaintingPrefab(slot0.paitingTF, slot1:getPainting(), "jiesuan")
end

slot0.Close = function (slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parent)
	setActive(slot0._tf, false)
	retPaintingPrefab(slot0.paitingTF, slot0.paintingName)

	slot0.callback = nil
	slot0.maxValue = 0
	slot0.rank = 0
	slot0.value = 1
	slot0.voteShip = nil
end

slot0.OnDestroy = function (slot0)
	slot0:Close()
end

return slot0
