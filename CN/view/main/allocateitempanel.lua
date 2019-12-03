slot0 = class("AllocateItemPanel")
slot0.MAX_QUOTA = 6
slot0.Listeners = {
	UpdateShipBuff = "UpdateShipBuff"
}

function slot0.Ctor(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.Listeners) do
		slot0[slot6] = function (...)
			slot0[slot1](slot2, ...)
		end
	end

	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.isInited = false
	slot0.selectedVO = nil
	slot0.count = 1
	slot0.view = slot2
	slot0.scrollTxts = {}
	slot0._selectedShipList = {}
	slot0._shipTFList = {}
end

function slot0.findTF(slot0, slot1)
	return findTF(slot0._tf, slot1)
end

function slot0.getTpl(slot0, slot1)
	slot2 = slot0:findTF(slot1)

	slot2:SetParent(slot0._tf, false)
	SetActive(slot2, false)

	return slot2
end

function slot0.show(slot0)
	setActive(slot0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
end

function slot0.hide(slot0)
	setActive(slot0._tf, false)

	slot0.selectedVO = nil
	slot0.itemVO = nil
	slot0.count = 1

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0.view._tf)
end

function slot0.isActive(slot0)
	return slot0._tf.gameObject.activeSelf
end

function slot0.init(slot0)
	slot0.isInited = true
	slot0.cancelBtn = slot0:findTF("actions/cancel_button")
	slot0.confirmBtn = slot0:findTF("actions/compose_button")
	slot0.itemTF = slot0:findTF("item")
	slot0.nameTF = slot0:findTF("item/name_container/name")
	slot0.descTF = slot0:findTF("item/desc")
	slot0.fleetInfo = slot0:findTF("fleet_info")
	slot0.shipTpl = slot0:getTpl("fleet_info/shiptpl")
	slot0.emptyTpl = slot0:getTpl("fleet_info/emptytpl")
	slot0.mainContainer = slot0:findTF("fleet_info/main")
	slot0.vanguardContainer = slot0:findTF("fleet_info/vanguard")
	slot0.countLabel = slot0:findTF("count")
	slot0.quotaTxt = slot0:findTF("count/value")
	slot0.fleetsToggle = slot0:findTF("fleets/toggles")

	onButton(slot0, slot0.cancelBtn, function ()
		slot0:hide()
	end, SFX_PANEL)
	onButton(slot0, slot0.confirmBtn, function ()
		if #slot0._selectedShipList > 0 then
			slot0._preSelectedList = {}

			for slot4, slot5 in ipairs(slot0._selectedShipList) do
				slot0[#slot0 + 1] = slot5.id
				slot0._preSelectedList[slot5.id] = true
			end

			slot0._confirmCallback(slot0.itemVO.configId, slot0)
		end
	end, SFX_PANEL)
end

function slot0.updateValue(slot0)
	setText(slot0.valueText, slot0.count)

	for slot5 = 1, slot0.itemContainer.childCount, 1 do
		setText(slot0.itemContainer:GetChild(slot5 - 1).Find(slot6, "bottom/item/bg/icon_bg/count"), slot0.count)
	end
end

function slot0.update(slot0, slot1)
	slot0.itemVO = slot1

	if not slot0.isInited then
		slot0:init()
	end

	updateDrop(slot0.itemTF, {
		type = DROP_TYPE_WORLD_ITEM,
		id = slot1.id,
		count = slot1.count
	})
	setText(slot0.nameTF, slot1:getConfig("name"))
	setText(slot0.descTF, slot1:getConfig("display"))

	slot0.quota = WorldItem.getItemBuffQuota(slot0.itemVO.id)

	slot0:updateQuota()
end

function slot0.updateQuota(slot0)
	setText(slot0.quotaTxt, #slot0._selectedShipList .. "/" .. slot0.quota)
	setActive(slot0.countLabel, true)
end

function slot0.setFleets(slot0, slot1, slot2)
	slot0.fleetList = slot1

	print(slot0.fleetList)
	print(slot0)

	slot0.currentFleetIndex = slot2 or 1

	for slot6 = 1, 4, 1 do
		slot7 = slot0.fleetsToggle:Find("fleet_" .. slot6)

		if slot1[slot6] then
			onToggle(slot0, slot7, function (slot0)
				if slot0 then
					slot0:setFleet(slot0.setFleet)
					slot0:updateQuota()
				end
			end, SFX_PANEL)
		else
			setActive(slot7, false)
		end
	end

	triggerToggle(slot0.fleetsToggle:Find("fleet_" .. slot0.currentFleetIndex), true)
end

function slot0.setFleet(slot0, slot1)
	slot0.currentFleetIndex = slot1
	slot2 = slot0.itemVO:getWorldItemType()

	function slot3(slot0, slot1, slot2, slot3)
		slot0._shipTFList[slot1.id] = cloneTplTo(slot0.shipTpl, slot2)
		slot5 = slot1.configId
		slot6 = slot1.skinId
		slot7 = slot1.level

		updateShip(slot4, slot1, {
			initStar = true
		})

		if slot1 == WorldItem.UsageBuff then
			slot0:initBuff(slot4, slot0, slot3)
			slot0:AddListener(WorldMapShip.EventAddBuff, slot0.UpdateShipBuff)
		elseif slot1 == WorldItem.UsageHPRegenerate then
			slot0:initHP(slot4, slot0, slot3)
			slot0:AddListener(WorldMapShip.EventHpRantChange, slot0.UpdateShipHP)
		end
	end

	slot0._selectedShipList = {}
	slot0._shipTFList = {}

	removeAllChildren(slot0.mainContainer)
	removeAllChildren(slot0.vanguardContainer)

	slot5 = slot0.fleetList[slot0.currentFleetIndex].GetTeamShipVOs(slot4, TeamType.Main, false)
	slot6 = slot0.fleetList[slot0.currentFleetIndex].GetTeamShips(slot4, TeamType.Main, false)
	slot7 = slot0.fleetList[slot0.currentFleetIndex].GetTeamShipVOs(slot4, TeamType.Vanguard, false)
	slot8 = slot0.fleetList[slot0.currentFleetIndex].GetTeamShips(slot4, TeamType.Vanguard, false)
	slot9 = slot0.quota >= #slot0.fleetList[slot0.currentFleetIndex]:GetShips(false)

	for slot13 = 1, 3, 1 do
		slot15 = slot6[slot13]

		if slot5[slot13] then
			slot3(slot15, slot14, slot0.mainContainer, slot9)
		else
			slot16 = cloneTplTo(slot0.emptyTpl, slot0.mainContainer)
		end
	end

	for slot13 = 1, 3, 1 do
		slot15 = slot8[slot13]

		if slot7[slot13] then
			slot3(slot15, slot14, slot0.vanguardContainer, slot9)
		else
			slot16 = cloneTplTo(slot0.emptyTpl, slot0.vanguardContainer)
		end
	end
end

function slot0.UpdateShipBuff(slot0, slot1, slot2)
	slot5 = slot0.fleetList[slot0.currentFleetIndex].GetTeamShips(slot3, TeamType.Vanguard, false)
	slot8 = WorldBuff.GetTemplate(slot6).buff_maxfloor

	function slot9(slot0)
		slot4 = nil

		setText(slot1:Find("buff/value"), (slot2 < ((slot0:GetBuff(slot0._shipTFList[slot0.id]) and slot2.level) or 0) and "MAX") or "Lv." .. ((slot0.GetBuff(slot0._shipTFList[slot0.id]) and slot2.level) or 0))
		setActive(slot1:Find("selected"), false)
	end

	for slot13, slot14 in ipairs(slot4) do
		slot9(slot14)
	end

	for slot13, slot14 in ipairs(slot5) do
		slot9(slot14)
	end
end

function slot0.UpdateShipHP(slot0, slot1, slot2)
	slot5 = slot0.fleetList[slot0.currentFleetIndex].GetTeamShips(slot3, TeamType.Vanguard, false)
	slot8 = WorldBuff.GetTemplate(slot6).buff_maxfloor

	function slot9(slot0)
		slot2 = slot0._shipTFList[slot0.id].Find(slot1, "hp")
		slot3 = slot2:Find("hp_normal")
		slot4 = slot2:Find("hp_emergency")

		SetActive(slot3, slot0:IsHpSafe())
		SetActive(slot4, not slot0:IsHpSafe())

		slot3:GetComponent(typeof(Image)).fillAmount = slot0.hpRant / 10000
		slot4:GetComponent(typeof(Image)).fillAmount = slot0.hpRant / 10000

		setActive(slot0._shipTFList[slot0.id].Find(slot1, "selected"), false)
	end

	for slot13, slot14 in ipairs(slot4) do
		slot9(slot14)
	end

	for slot13, slot14 in ipairs(slot5) do
		slot9(slot14)
	end
end

function slot0.initHP(slot0, slot1, slot2)
	slot3 = slot1:Find("hp")
	slot4 = slot3:Find("hp_normal")
	slot5 = slot3:Find("hp_emergency")
	slot6 = slot1:Find("selected")

	setActive(slot3, true)

	slot7 = nil

	if slot2:IsHpSafe() then
		slot7 = slot4

		SetActive(slot4, true)
		SetActive(slot5, false)
	else
		slot7 = slot5

		SetActive(slot4, false)
		SetActive(slot5, true)
	end

	slot7:GetComponent(typeof(Image)).fillAmount = slot2.hpRant / 10000

	if slot2:IsHpFull() then
		setActive(slot6, false)
	else
		onButton(slot0, slot1, function ()
			if table.contains(slot0._selectedShipList, ) then
				if #slot0._selectedShipList <= 0 then
					return
				end

				setActive(slot2, false)

				for slot4, slot5 in ipairs(slot0._selectedShipList) do
					if slot5 == slot1 then
						table.remove(slot0._selectedShipList, slot4)

						break
					end
				end
			else
				if slot0.quota <= #slot0._selectedShipList then
					return
				end

				setActive(slot2, true)
				table.insert(slot0._selectedShipList, table.insert)
			end

			slot0:updateQuota()
		end)

		if defaultSelect then
			triggerButton(slot1)
		end
	end
end

function slot0.initBuff(slot0, slot1, slot2, slot3)
	slot4 = slot1:Find("selected")
	slot5 = slot1:Find("buff")
	slot7 = slot5:Find("value")

	setActive(slot5, true)
	setImageSprite(slot6, slot10, true)

	slot11 = nil
	slot11 = (not slot2:GetBuff(WorldItem.getItemBuffID(slot0.itemVO.id)) or slot2:GetBuff(slot8).level) and 0

	if slot9.buff_maxfloor <= slot11 then
		setText(slot7, "MAX")
		setActive(slot4, false)
	else
		setText(slot7, "Lv." .. slot11)
		onButton(slot0, slot1, function ()
			if table.contains(slot0._selectedShipList, ) then
				if #slot0._selectedShipList <= 0 then
					return
				end

				for slot4, slot5 in ipairs(slot0._selectedShipList) do
					if slot5 == slot1 then
						table.remove(slot0._selectedShipList, slot4)

						break
					end
				end

				setActive(slot2, false)
			else
				if slot0.quota <= #slot0._selectedShipList then
					return
				end

				setActive(slot2, true)
				table.insert(slot0._selectedShipList, table.insert)
			end

			slot0:updateQuota()
		end)

		if slot3 then
			triggerButton(slot1)
		end
	end
end

function slot0.flush(slot0, slot1)
	if slot1.id ~= slot0.itemVO.id then
		return
	end

	slot0._selectedShipList = {}

	slot0:update(slot1)
end

function slot0.updateFleetBuff(slot0)
	slot1 = slot0.fleetList[slot0.currentFleetIndex]
	slot2 = WorldItem.getItemBuffID(slot0.itemVO.id)

	for slot6, slot7 in pairs(slot0._shipTFList) do
		setActive(slot7:Find("selected"), false)

		if slot0._preSelectedList[slot6] then
			slot8 = slot7:Find("buff/icon/value")
			slot9 = slot7:Find("buff/levelup")

			if WorldBuff.GetTemplate(slot2).buff_maxfloor <= slot1:GetShip(slot6).GetBuff(slot10, slot2).level then
				setText(slot8, "MAX")

				slot7:GetComponent(typeof(Button)).enabled = false
			else
				setText(slot8, "Lv." .. slot11)
			end

			setActive(slot9, false)
			setActive(slot9, true)
		end
	end

	slot0._preSelectedList = nil
end

function slot0.updateFleetHP(slot0)
	slot1 = slot0.fleetList[slot0.currentFleetIndex]
	slot2 = WorldItem.getItemBuffID(slot0.itemVO.id)

	for slot6, slot7 in pairs(slot0._shipTFList) do
		setActive(slot7:Find("selected"), false)

		if slot0._preSelectedList[slot6] then
			slot9 = slot7:Find("hp")
			slot10 = slot9:Find("hp_normal")
			slot11 = slot9:Find("hp_emergency")
			slot12 = nil

			if slot1:GetShip(slot6):IsHpSafe() then
				slot12 = slot10

				SetActive(slot10, true)
				SetActive(slot11, false)
			else
				slot12 = slot11

				SetActive(slot10, false)
				SetActive(slot11, true)
			end

			slot12:GetComponent(typeof(Image)).fillAmount = slot8.hpRant / 10000

			if slot8:IsHpFull() then
				slot7:GetComponent(typeof(Button)).enabled = false
			end
		end
	end

	slot0._preSelectedList = nil
end

function slot0.configCallback(slot0, slot1)
	slot0._confirmCallback = slot1
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)

	if slot0.scrollTxts and #slot0.scrollTxts > 0 then
		for slot4, slot5 in pairs(slot0.scrollTxts) do
			slot5:destroy()
		end
	end
end

return slot0
