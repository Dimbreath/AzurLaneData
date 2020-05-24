slot0 = class("AllocateItemPanel")
slot0.MAX_QUOTA = 6
slot0.TeamNum = {
	"FIRST",
	"SECOND",
	"THIRD",
	"FOURTH",
	"FIFTH",
	"SIXTH"
}

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.selectedVO = nil
	slot0.count = 1
	slot0.view = slot2
	slot0._selectedShipList = {}
	slot0._shipTFList = {}
	slot0._shipVOList = {}
	slot0.tplList = {}

	slot0:init()
end

function slot0.findTF(slot0, slot1)
	return findTF(slot0._tf, slot1)
end

function slot0.getTpl(slot0, slot1)
	slot2 = slot0:findTF(slot1)
	slot0.tplList[slot2] = slot2.parent

	slot2:SetParent(slot0._tf, false)
	SetActive(slot2, false)

	return slot2
end

function slot0.returnAllTpl(slot0)
	for slot4, slot5 in pairs(slot0.tplList) do
		slot4:SetParent(slot5, false)
	end

	slot0.tplList = nil
end

function slot0.isActive(slot0)
	return slot0._tf.gameObject.activeSelf
end

function slot0.init(slot0)
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
	slot0.descLabel = slot0:findTF("fleet_info/top/Text")
	slot0.countLabel = slot0:findTF("count")
	slot0.quotaTxt = slot0:findTF("count/value")
	slot0.btnFleet = slot0:findTF("fleets/selected")
	slot0.fleetToggleMask = slot0:findTF("fleets/list_mask")
	slot0.fleetToggleList = slot0.fleetToggleMask:Find("list")

	onButton(slot0, slot0.cancelBtn, function ()
		uv0._cancelCallback()
	end, SFX_PANEL)
	onButton(slot0, slot0.confirmBtn, function ()
		if #uv0._selectedShipList > 0 then
			slot0 = {}
			uv0._preSelectedList = {}

			for slot4, slot5 in ipairs(uv0._selectedShipList) do
				slot0[#slot0 + 1] = slot5.id
				uv0._preSelectedList[slot5.id] = true
			end

			uv0._confirmCallback(uv0.itemVO.configId, slot0)
		end
	end, SFX_PANEL)
end

function slot0.updateValue(slot0)
	setText(slot0.valueText, slot0.count)

	for slot5 = 1, slot0.itemContainer.childCount do
		setText(slot0.itemContainer:GetChild(slot5 - 1):Find("bottom/item/bg/icon_bg/count"), slot0.count)
	end
end

function slot0.update(slot0, slot1)
	slot0.itemVO = slot1

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

	onButton(slot0, slot0.fleetToggleMask, function ()
		setActive(uv0.fleetToggleMask, false)
		uv0:tweenTabArrow(true)
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnFleet, function ()
		setActive(uv0.fleetToggleMask, true)
		uv0:tweenTabArrow(false)
	end, SFX_PANEL)
	slot0:updateToggleList(slot0.fleetList, slot2 or 1)
end

function slot0.updateToggleList(slot0, slot1, slot2)
	setActive(slot0.fleetToggleMask, true)

	for slot7 = 1, slot0.fleetToggleList.childCount do
		slot8 = slot0.fleetToggleList:GetChild(slot0.fleetToggleList.childCount - slot7)

		setActive(slot8, slot1[slot7])

		if isActive(slot8) then
			setActive(slot8:Find("lock"), false)
			onToggle(slot0, slot8, function (slot0)
				if slot0 then
					triggerButton(uv0.fleetToggleMask)
					uv0:setFleet(uv1[uv2].id)
					uv0:updateQuota()
				end
			end, SFX_UI_TAG)

			slot3 = nil or slot1[slot7].id == slot2 and slot8
		end
	end

	triggerToggle(slot3, true)
end

function slot0.updateFleetButton(slot0, slot1)
	setText(slot0.btnFleet:Find("fleet/enFleet"), uv0.TeamNum[slot1] .. " FLEET")
	setText(slot0.btnFleet:Find("fleet/num"), slot1)
	setText(slot0.btnFleet:Find("fleet/CnFleet"), Fleet.DEFAULT_NAME[slot1])
end

function slot0.tweenTabArrow(slot0, slot1)
	setActive(slot0.btnFleet:Find("arr"), slot1)

	if slot1 then
		LeanTween.moveLocalY(go(slot2), slot2.localPosition.y + 8, 0.8):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(-1)
	else
		LeanTween.cancel(go(slot2))

		slot3 = slot2.localPosition
		slot3.y = 80
		slot2.localPosition = slot3
	end
end

function slot0.setFleet(slot0, slot1)
	slot0:updateFleetButton(slot1)

	slot2 = slot0.itemVO:getWorldItemType()

	function slot3(slot0, slot1, slot2, slot3)
		slot4 = cloneTplTo(uv0.shipTpl, slot2)
		uv0._shipTFList[slot0.id] = slot4
		uv0._shipVOList[slot0.id] = slot1

		updateShip(slot4, slot1, {
			initStar = true
		})

		if uv1 == WorldItem.UsageBuff then
			uv0:initBuff(slot4, slot0, slot3)
		elseif uv1 == WorldItem.UsageHPRegenerate then
			uv0:initHP(slot4, slot0, slot3)
		end
	end

	for slot7, slot8 in pairs(slot0._shipTFList) do
		if not IsNil(slot8:Find("buff/bg/levelup(Clone)")) then
			PoolMgr.GetInstance():ReturnUI("levelup", slot9)
		end
	end

	removeAllChildren(slot0.mainContainer)
	removeAllChildren(slot0.vanguardContainer)

	slot0.currentFleetIndex = slot1
	slot0._selectedShipList = {}
	slot0._shipTFList = {}
	slot4 = slot0.fleetList[slot0.currentFleetIndex]
	slot7 = slot4:GetTeamShipVOs(TeamType.Vanguard, false)
	slot8 = slot4:GetTeamShips(TeamType.Vanguard, false)

	for slot13 = 1, 3 do
		if slot4:GetTeamShipVOs(TeamType.Main, false)[slot13] then
			slot3(slot4:GetTeamShips(TeamType.Main, false)[slot13], slot14, slot0.mainContainer, slot0.quota >= #slot4:GetShips(false))
		else
			slot16 = cloneTplTo(slot0.emptyTpl, slot0.mainContainer)
		end
	end

	for slot13 = 1, 3 do
		if slot7[slot13] then
			slot3(slot8[slot13], slot14, slot0.vanguardContainer, slot9)
		else
			slot16 = cloneTplTo(slot0.emptyTpl, slot0.vanguardContainer)
		end
	end
end

function slot0.OnUpdateShipBuff(slot0)
	slot2 = WorldItem.getItemBuffID(slot0.itemVO.id)

	for slot6, slot7 in pairs(slot0._shipTFList) do
		if slot0._preSelectedList[slot6] then
			slot11 = WorldBuff.GetTemplate(slot2)
			slot12 = slot11.buff_attr[1]

			setText(slot7:Find("buff/value"), slot0.fleetList[slot0.currentFleetIndex]:GetShip(slot6):GetBuff(slot2).floor < slot11.buff_maxfloor and "Lv." .. slot10 or "Lv.MAX")

			if slot13 <= slot10 then
				triggerButton(slot7)
			end

			setButtonEnabled(slot7, slot10 < slot13)

			if IsNil(slot7:Find("buff/bg/levelup(Clone)")) then
				PoolMgr.GetInstance():GetUI("levelup", true, function (slot0)
					if IsNil(uv0._tf) then
						PoolMgr.GetInstance():ReturnUI("levelup", slot0)
					else
						setParent(slot0, uv1:Find("buff/bg"))
						setActive(slot0, false)
						setActive(slot0, true)
					end
				end)
			else
				setActive(slot14, false)
				setActive(slot14, true)
			end
		end
	end

	slot0._preSelectedList = nil
end

function slot0.OnUpdateShipHP(slot0)
	slot2 = WorldItem.getItemBuffID(slot0.itemVO.id)

	for slot6, slot7 in pairs(slot0._shipTFList) do
		if slot0._preSelectedList[slot6] then
			slot9 = slot7:Find("hp")
			slot10 = slot9:Find("hp_normal")
			slot12 = nil

			if slot0.fleetList[slot0.currentFleetIndex]:GetShip(slot6):IsHpSafe() then
				slot12 = slot10

				SetActive(slot10, true)
				SetActive(slot9:Find("hp_emergency"), false)
			else
				slot12 = slot11

				SetActive(slot10, false)
				SetActive(slot11, true)
			end

			slot12:GetComponent(typeof(Image)).fillAmount = slot8.hpRant / 10000

			if slot8:IsHpFull() then
				triggerButton(slot7)
			end

			setButtonEnabled(slot7, not slot8:IsHpFull())
		end
	end

	slot0._preSelectedList = nil
end

function slot0.initHP(slot0, slot1, slot2, slot3)
	slot5 = slot1:Find("hp")
	slot6 = slot5:Find("hp_normal")

	setActive(slot5, true)
	setActive(slot1:Find("buff"), false)
	setActive(slot1:Find("selected"), false)

	slot9 = nil

	if slot2:IsHpSafe() then
		slot9 = slot6

		SetActive(slot6, true)
		SetActive(slot5:Find("hp_emergency"), false)
	else
		slot9 = slot7

		SetActive(slot6, false)
		SetActive(slot7, true)
	end

	slot9:GetComponent(typeof(Image)).fillAmount = slot2.hpRant / 10000

	onButton(slot0, slot1, function ()
		if table.contains(uv0._selectedShipList, uv1) then
			if #uv0._selectedShipList <= 0 then
				return
			end

			setActive(uv2, false)

			for slot4, slot5 in ipairs(uv0._selectedShipList) do
				if slot5 == uv1 then
					table.remove(uv0._selectedShipList, slot4)

					break
				end
			end
		else
			while uv0.quota <= #uv0._selectedShipList do
				setActive(uv0._shipTFList[uv0._selectedShipList[1].id]:Find("selected"), false)
				table.remove(uv0._selectedShipList, 1)
			end

			setActive(uv2, true)
			table.insert(uv0._selectedShipList, uv1)
		end

		uv0:updateQuota()
	end)
	setButtonEnabled(slot1, not slot2:IsHpFull())

	if slot3 and not slot2:IsHpFull() then
		triggerButton(slot1)
	end
end

function slot0.initBuff(slot0, slot1, slot2, slot3)
	slot6 = slot1:Find("buff")

	setActive(slot1:Find("hp"), false)
	setActive(slot6, true)
	setActive(slot1:Find("selected"), false)

	slot9 = WorldItem.getItemBuffID(slot0.itemVO.id)

	GetImageSpriteFromAtlasAsync("attricon", WorldBuff.GetTemplate(slot9).buff_attr[1], slot6:Find("icon"))

	slot13 = slot2:GetBuff(slot9) and slot12.floor or 0
	slot14 = slot0._shipVOList[slot2.id]:getBaseProperties()[slot11] > 0
	slot15 = slot10.buff_maxfloor

	setText(slot6:Find("value"), not slot14 and "Lv.-" or slot13 < slot15 and "Lv." .. slot13 or "Lv.MAX")
	onButton(slot0, slot1, function ()
		if table.contains(uv0._selectedShipList, uv1) then
			if #uv0._selectedShipList <= 0 then
				return
			end

			for slot4, slot5 in ipairs(uv0._selectedShipList) do
				if slot5 == uv1 then
					table.remove(uv0._selectedShipList, slot4)

					break
				end
			end

			setActive(uv2, false)
		else
			if uv0.quota <= #uv0._selectedShipList then
				return
			end

			setActive(uv2, true)
			table.insert(uv0._selectedShipList, uv1)
		end

		uv0:updateQuota()
	end)
	setButtonEnabled(slot1, slot14 and slot13 < slot15)

	if slot3 and slot13 < slot15 then
		triggerButton(slot1)
	end
end

function slot0.flush(slot0, slot1)
	if slot1.id ~= slot0.itemVO.id then
		return
	end

	slot0:update(slot1)

	if slot0.itemVO:getWorldItemType() == WorldItem.UsageBuff then
		slot0:OnUpdateShipBuff()
	elseif slot2 == WorldItem.UsageHPRegenerate then
		slot0:OnUpdateShipHP()
	end
end

function slot0.configCallback(slot0, slot1, slot2)
	slot0._confirmCallback = slot1
	slot0._cancelCallback = slot2
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)
	slot0:tweenTabArrow(false)
	slot0:returnAllTpl()
end

return slot0
