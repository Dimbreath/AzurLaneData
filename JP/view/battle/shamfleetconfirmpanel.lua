slot0 = class("ShamFleetConfirmPanel", import("..base.BasePanel"))

function slot0.init(slot0)
	slot0.super.init(slot0)

	slot0.item = slot0:findTF("panel/item")
	slot0.mainShips = slot0:findTF("panel/main/ships")
	slot0.mainList = UIItemList.New(slot0.mainShips, slot0.item)

	slot0.mainList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0:updateShip(slot2, slot0.mains[slot1 + 1], TeamType.Main)
		end
	end)

	slot0.vanShips = slot0:findTF("panel/vanguard/ships")
	slot0.vanList = UIItemList.New(slot0.vanShips, slot0.item)

	slot0.vanList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot0:updateShip(slot2, slot0.vans[slot1 + 1], TeamType.Vanguard)
		end
	end)

	slot0.txNumbers = slot0:findTF("panel/text/number")
	slot0.btnStart = slot0:findTF("panel/start_button")
	slot0.btnClose = slot0:findTF("panel/bgs/btnBack")

	setActive(slot0.item, false)

	slot0.onConfirm = nil
	slot0.onCancel = nil
	slot0.onClickShip = nil
	slot0.onLongPressed = nil
end

function slot0.set(slot0, slot1)
	setText(slot0.txNumbers, #slot1 .. "/" .. ChapterConst.ShamShipLimit)

	slot0.mains = {}
	slot0.vans = {}

	_.each(slot1, function (slot0)
		if slot0:getTeamType() == TeamType.Vanguard then
			table.insert(slot0.vans, slot0)
		elseif slot1 == TeamType.Main then
			table.insert(slot0.mains, slot0)
		end
	end)

	if #slot1 < ChapterConst.ShamShipLimit then
		if #slot0.vans < 8 then
			for slot5 = #slot0.vans + 1, 8, 1 do
				table.insert(slot0.vans, false)
			end
		end

		if #slot0.mains < 8 then
			for slot5 = #slot0.mains + 1, 8, 1 do
				table.insert(slot0.mains, false)
			end
		end
	end

	slot0.mainList:align(#slot0.mains)
	slot0.vanList:align(#slot0.vans)
	onButton(slot0, slot0._tf, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnClose, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnStart, function ()
		if slot0.onConfirm then
			slot0.onConfirm()
		end
	end, SFX_CONFIRM)
end

function slot0.updateShip(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("ship")
	slot5 = slot1:Find("empty")
	slot6 = slot4:Find("bg")
	slot7 = slot5:Find("bg")

	setActive(slot4, slot2)
	setActive(slot5, not slot2)

	if slot2 then
		updateShip(slot4, slot2)

		slot8 = slot2.hpRant

		setActive(slot9, false)
		onButton(slot0, slot6, function ()
			slot0.onClickShip(slot1)
		end, SFX_UI_CLICK)

		GetOrAddComponent(slot6, "UILongPressTrigger").longPressThreshold = 1

		GetOrAddComponent(slot6, "UILongPressTrigger").onLongPressed:RemoveAllListeners()

		if onLongPressed then
			pg.DelegateInfo.Add(slot0, slot10.onLongPressed)
			slot10.onLongPressed:AddListener(function ()
				slot0.onLongPressed(slot1)
			end)
		end
	else
		onButton(slot0, slot7, function ()
			slot0.onClickShip(slot1)
		end, SFX_UI_CLICK)
	end
end

return slot0
