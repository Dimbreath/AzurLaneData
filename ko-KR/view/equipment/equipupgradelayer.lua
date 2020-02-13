slot0 = class("EquipUpgradeLayer", import("..base.BaseUI"))
slot0.CHAT_DURATION_TIME = 0.3

function slot0.getUIName(slot0)
	return "EquipUpgradeUI"
end

function slot0.setItems(slot0, slot1)
	slot0.itemVOs = slot1
end

function slot0.init(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	slot0.mainPanel = slot0:findTF("main")
	slot0.finishPanel = slot0:findTF("finish_panel")

	setActive(slot0.mainPanel, true)
	setActive(slot0.finishPanel, false)

	slot0.equipmentList = slot0:findTF("panel/equipment_list", slot0.mainPanel)
	slot0.equipmentContain = slot0:findTF("equipments", slot0.equipmentList)
	slot0.equipmentTpl = slot0:getTpl("equiptpl", slot0.equipmentContain)

	setActive(slot0.equipmentList, false)

	slot0.equipmentPanel = slot0:findTF("panel/equipment_panel", slot0.mainPanel)
	slot0.materialPanel = slot0:findTF("panel/material_panel", slot0.mainPanel)
	slot0.startBtn = slot0:findTF("start_btn", slot0.materialPanel)
	slot0.overLimit = slot0:findTF("materials/limit", slot0.materialPanel)

	setText(slot0:findTF("text", slot0.overLimit), i18n("equipment_upgrade_overlimit"))

	slot0.materialsContain = slot0:findTF("materials/materials", slot0.materialPanel)
	slot0.uiMain = pg.UIMgr.GetInstance().UIMain
	slot0.Overlay = pg.UIMgr.GetInstance().OverlayMain
end

function slot0.updateRes(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_CANCEL)
	slot0:updateAll()
end

function slot0.updateAll(slot0)
	setActive(slot0.equipmentList, slot0.contextData.shipVO)

	if slot0.contextData.shipVO then
		slot0:displayEquipments()
		triggerButton(slot0.equipmentTFs[slot0.contextData.pos])
	else
		slot0:updateEquipment()
		slot0:updateMaterials()
	end
end

function slot0.displayEquipments(slot0)
	slot0.equipmentTFs = {}

	removeAllChildren(slot0.equipmentContain)

	for slot5, slot6 in ipairs(slot0.contextData.shipVO.equipments) do
		if slot6 then
			slot7 = cloneTplTo(slot0.equipmentTpl, slot0.equipmentContain)

			updateEquipment(slot7, slot6)
			setActive(slot8, false)

			if slot0:isMaterialEnough(slot6) and slot6.config.next ~= 0 then
				setActive(slot8, true)
				blinkAni(slot8, 0.5)
			end

			onButton(slot0, slot7, function ()
				setActive(slot0.equipmentTFs[slot0.contextData.pos]:Find("selected"), false)
				slot1(slot0.equipmentTFs[slot0.contextData.pos]:Find("tip"), slot0:isMaterialEnough(slot1:getEquip(slot0.contextData.pos)) and slot1:getEquip(slot0).config.next ~= 0)

				slot0.contextData.pos = slot0.equipmentTFs[slot0.contextData.pos].Find("tip")
				slot0.contextData.equipmentId = slot0.isMaterialEnough(slot1.getEquip(slot0.contextData.pos)) and slot1.getEquip(slot0).config.next ~= 0.id
				slot0.contextData.equipmentVO = slot0.isMaterialEnough(slot1.getEquip(slot0.contextData.pos)) and slot1.getEquip(slot0).config.next ~= 0

				setActive(slot0.equipmentTFs[slot0.contextData.pos]:Find("selected"), true)
				setActive(slot0.equipmentTFs[slot0.contextData.pos]:Find("tip"), false)
				slot0:updateEquipment()
				slot0:updateMaterials()
			end, SFX_PANEL)

			slot0.equipmentTFs[slot5] = slot7
		end
	end
end

function slot0.isMaterialEnough(slot0, slot1)
	slot2 = true

	if not slot1.config.trans_use_item then
		return false
	end

	for slot7 = 1, #slot3, 1 do
		if defaultValue(slot0.itemVOs[slot3[slot7][1]], {
			count = 0
		}).count < slot3[slot7][2] then
			slot2 = false
		end
	end

	return slot2
end

function slot0.updateEquipment(slot0)
	slot0.contextData.equipmentId = slot0.contextData.equipmentVO.id

	slot0:updateAttrs(slot0:findTF("attrs", slot0.equipmentPanel), slot2, (slot0.contextData.equipmentVO.config.next > 0 and slot2:MigrateTo(slot2.config.next)) or nil)
	setText(findTF(slot0.equipmentPanel, "name_container"), slot2.config.name)
	setActive(findTF(slot0.equipmentPanel, "unique"), slot2:isUnique())
	updateEquipment(slot0:findTF("equiptpl", slot0.equipmentPanel), slot2)
end

function slot0.updateAttrs(slot0, slot1, slot2, slot3)
	slot4 = slot2:GetProperties()
	slot5 = (slot3 and slot3:GetProperties()) or nil
	slot6 = 0

	function slot7(slot0)
		setActive(findTF(findTF, "attr_" .. slot1), slot1 + 1)

		if slot1 + 1 then
			slot4 = findTF(slot2, "from")
			slot5 = findTF(slot2, ">")
			slot6 = findTF(slot2, "to")

			setActive(slot7, false)

			slot8 = nil

			if not EquipType.isDevice(slot3.configId) and slot1.type == AttributeType.Reload then
				slot9 = nil

				if slot4.contextData.shipVO then
					setText(slot3, AttributeType.Type2Name(AttributeType.CD))

					slot9 = slot4.contextData.shipVO:calcWeaponCD(slot3)
					slot8 = (slot5 and slot4.contextData.shipVO:calcWeaponCD(slot5)) or nil
				else
					setText(slot3, i18n("cd_normal"))

					slot9 = slot3:getWeaponCD()
					slot8 = (slot5 and slot5:getWeaponCD()) or nil
					slot10 = 0
				end

				if slot8 then
					setActive(slot7, true)

					slot10 = slot8 - slot9
				end

				slot11 = (math.abs(slot10) < 0.01 and math.abs(slot10) ~= 0 and "%.3f") or "%.2f"

				setText(slot4, slot12 .. "s" .. i18n("word_secondseach"))

				if slot8 then
					setText(slot6, slot13 .. "s" .. i18n("word_secondseach"))
					setText(slot7, string.format(slot11, slot12 - string.format(slot11, slot8)))
				else
					setText(slot6, "")
					setText(slot7, "")
				end
			else
				setText(slot4, slot1.value)
				setText(slot3, AttributeType.Type2Name(slot1.type))

				if (slot6 and slot6[slot0]) or nil then
					if type(slot1.value) == "number" and slot8.value ~= slot1.value then
						setActive(slot7, true)
						setText(slot7, slot8.value - slot1.value)
					elseif string.match(slot1.value, "%d+") ~= string.match(slot8.value, "%d+") then
						setActive(slot7, true)
						setText(slot7, slot10 - slot9)
					end

					setText(slot6, slot8.value)
				end
			end

			setActive(slot6, slot8)
			setActive(slot5, slot8)
		end
	end

	if EquipType.isDevice(slot2.configId) then
		for slot11, slot12 in ipairs({
			1,
			2
		}) do
			slot7(slot12)
		end
	else
		for slot11, slot12 in ipairs({
			1,
			4
		}) do
			slot7(slot12)
		end
	end
end

function slot0.updateMaterials(slot0)
	slot1 = true
	slot4 = slot0.contextData.equipmentVO.config.trans_use_gold
	slot3 = defaultValue(slot0.contextData.equipmentVO.config.trans_use_item, {})

	for slot8 = 1, 3, 1 do
		setActive(findTF(slot9, "off"), not slot3[slot8])
		setActive(findTF(slot9, "equiptpl"), slot3[slot8])

		if slot3[slot8] then
			updateItem(slot11, Item.New({
				id = slot3[slot8][1]
			}))
			onButton(slot0, slot11, function ()
				slot0:emit(EquipUpgradeMediator.ON_ITEM, slot0)
			end, SFX_PANEL)

			slot13 = defaultValue(slot0.itemVOs[slot3[slot8][1]], {
				count = 0
			}).count .. "/" .. slot3[slot8][2]

			if defaultValue(slot0.itemVOs[slot3[slot8][1]], ).count < slot3[slot8][2] then
				slot13 = setColorStr(slot12.count, COLOR_RED) .. "/" .. slot3[slot8][2]
				slot1 = false
			end

			setActive(slot14, true)
			setText(findTF(slot11, "icon_bg/count"), slot13)
		end
	end

	setText(slot0:findTF("cost/consume", slot0.materialPanel), slot4)
	setActive(slot0.startBtn, slot3)

	slot5 = Equipment.canUpgrade(slot2.configId)

	setActive(slot0.materialsContain, slot5)
	setActive(slot0.overLimit, not slot5)
	onButton(slot0, slot0.startBtn, function ()
		if not slot0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_shipUpgradeLayer2_noMaterail"))

			return
		end

		if slot1.playerVO.gold < slot2 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					slot2 - slot1.playerVO.gold,
					ChargeScene.TYPE_ITEM
				}
			})

			return
		end

		slot1:emit(EquipUpgradeMediator.EQUIPMENT_UPGRDE)
	end, SFX_UI_DOCKYARD_REINFORCE)
	setButtonEnabled(slot0.startBtn, slot5)
end

function slot0.upgradeFinish(slot0, slot1, slot2)
	setActive(slot0.mainPanel, false)
	setActive(slot0.finishPanel, true)
	onButton(slot0, slot0.finishPanel, function ()
		setActive(slot0.mainPanel, true)
		setActive(slot0.finishPanel, false)
	end, SFX_CANCEL)
	setText(findTF(slot0.finishPanel, "frame/equipment_panel/name_container"), slot2.config.name)
	setActive(findTF(slot0.finishPanel, "frame/equipment_panel/unique"), slot2:isUnique())
	updateEquipment(slot3, slot2)
	slot0:updateAttrs(slot0:findTF("frame/equipment_panel/attrs", slot0.finishPanel), slot1, slot2)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

return slot0
