ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleAttr
slot2 = slot0.Battle.BattleDataFunction
slot3 = slot0.Battle.BattleConst
slot4 = slot0.Battle.BattleConst.EquipmentType
slot5 = class("BattleUnitDetailView")
slot0.Battle.BattleUnitDetailView = slot5
slot5.__name = "BattleUnitDetailView"
slot5.DefaultActive = {}
slot5.PrimalAttr = {
	"cannonPower",
	"torpedoPower",
	"airPower",
	"antiAirPower",
	"antiSubPower",
	"loadSpeed",
	"dodgeRate",
	"attackRating",
	"velocity"
}
slot5.BaseEnhancement = {
	damageRatioByBulletTorpedo = "damage/damageRatioByBulletTorpedo",
	injureRatioByBulletTorpedo = "injure/injureRatioByBulletTorpedo",
	damageRatioByCannon = "damage/damageRatioByCannon",
	injureRatioByCannon = "injure/injureRatioByCannon",
	damageRatioBullet = "damage/damageRatioBullet",
	injureRatio = "injure/injureRatio",
	injureRatioByAir = "injure/injureRatioByAir",
	damageRatioByAir = "damage/damageRatioByAir"
}
slot5.SecondaryAttrListener = {}

function slot5.Ctor(slot0)
	pg.DelegateInfo.New(slot0)
end

function slot5.SetUnit(slot0, slot1)
	slot0._unit = slot1

	setImageSprite(slot0._icon, uv0.Battle.BattleResourceManager.GetInstance():GetCharacterQIcon(slot0._unit:GetTemplate().painting))

	for slot7 = 1, slot0._unit:GetTemplate().star do
		setActive(cloneTplTo(slot0._starTpl, slot0._stars), true)
	end

	setText(slot0._templateID, slot0._unit:GetTemplate().id)
	setText(slot0._name, slot0._unit:GetTemplate().name)

	slot6 = slot0._unit
	slot7 = slot6
	slot8 = "level"

	setText(slot0._lv, slot6.GetAttrByName(slot7, slot8))

	slot0._preAttrList = {}

	for slot7, slot8 in ipairs(uv1.PrimalAttr) do
		slot9 = uv2.GetBase(slot0._unit, slot8)

		setText(slot0._attrView:Find(slot8 .. "/base"), slot9)

		slot0._preAttrList[slot8] = slot9
	end

	slot0._baseEhcList = {}

	for slot7, slot8 in pairs(uv1.BaseEnhancement) do
		slot0._baseEhcList[slot7] = 0
	end

	slot0._secondaryAttrList = {}
	slot0._buffList = {}
	slot0._weaponList = {}

	slot0:updateWeaponList()
end

function slot5.Update(slot0)
	for slot4, slot5 in ipairs(uv0.PrimalAttr) do
		slot0:updatePrimalAttr(slot5)
	end

	for slot4, slot5 in pairs(uv0.BaseEnhancement) do
		slot0:updateBaseEnhancement(slot4, slot5)
	end

	for slot5, slot6 in pairs(slot0._unit:GetAttr()) do
		if string.find(slot5, "DMG_TAG_EHC_") or string.find(slot5, "DMG_FROM_TAG_") or table.contains(uv0.SecondaryAttrListener, slot5) then
			slot0:updateSecondaryAttr(slot5, slot6)
		end
	end

	slot0:updateHP()
	slot0:updateBuffList()
	slot0:updateWeaponProgress()
end

function slot5.ConfigSkin(slot0, slot1)
	slot0._go = slot1
	slot2 = slot1.transform
	slot0._tf = slot2
	slot0._iconView = slot2:Find("icon")
	slot0._icon = slot0._iconView:Find("icon")
	slot0._stars = slot0._iconView:Find("stars")
	slot0._starTpl = slot0._stars:Find("star_tpl")
	slot0._templateView = slot2:Find("template")
	slot0._templateID = slot0._templateView:Find("template/text")
	slot0._name = slot0._templateView:Find("name/text")
	slot0._lv = slot0._templateView:Find("level/text")
	slot0._totalHP = slot0._templateView:Find("totalHP/text")
	slot0._currentHP = slot0._templateView:Find("currentHP/text")
	slot0._HPRate = slot0._templateView:Find("HPRate/text")
	slot0._attrView = slot2:Find("attr_panels/primal_attr")
	slot0._baseEnhanceView = slot2:Find("attr_panels/basic_ehc")
	slot0._secondaryAttrView = slot2:Find("attr_panels/tag_ehc")
	slot0._secondaryAttrContainer = slot0._secondaryAttrView:Find("tag_container")
	slot0._secondaryAttrTpl = slot0._secondaryAttrView:Find("tag_attr_tpl")
	slot0._buffView = slot2:Find("attr_panels/buff")
	slot0._buffContainer = slot0._buffView:Find("buff_container")
	slot0._buffTpl = slot0._buffView:Find("buff_tpl")
	slot0._weaponView = slot2:Find("weapon_panels")
	slot0._weaponContainer = slot0._weaponView:Find("container/weapon_container")
	slot0._weaponTpl = slot0._weaponView:Find("container/weapon_tpl")

	SetActive(slot0._go, true)

	for slot6, slot7 in ipairs(uv0.DefaultActive) do
		SetActive(slot2:Find(slot7), true)
	end
end

function slot5.updateHP(slot0)
	slot1, slot2 = slot0._unit:GetHP()

	setText(slot0._totalHP, slot2)
	setText(slot0._currentHP, slot1)
	setText(slot0._HPRate, string.format("%.3f", slot0._unit:GetHPRate()))
end

function slot5.updatePrimalAttr(slot0, slot1)
	slot2 = slot0._unit:GetAttrByName(slot1)

	setText(slot0._attrView:Find(slot1 .. "/current"), slot2)

	if slot2 - slot0._preAttrList[slot1] ~= 0 then
		uv0.setDeltaText(slot0._attrView:Find(slot1 .. "/change"), slot3)

		slot0._preAttrList[slot1] = slot2
	end

	if slot2 - uv1.GetBase(slot0._unit, slot1) ~= 0 then
		uv0.setDeltaText(slot0._attrView:Find(slot1 .. "/delta"), slot5)
	end
end

function slot5.updateBaseEnhancement(slot0, slot1, slot2)
	slot4 = slot0._unit:GetAttrByName(slot1)

	setText(slot0._baseEnhanceView:Find(slot2):Find("current"), slot4)

	if slot4 - slot0._baseEhcList[slot1] ~= 0 then
		uv0.setDeltaText(slot3:Find("change"), slot5)
	end
end

function slot5.updateSecondaryAttr(slot0, slot1, slot2)
	if not slot0._secondaryAttrList[slot1] then
		slot3 = cloneTplTo(slot0._secondaryAttrTpl, slot0._secondaryAttrContainer)

		setText(slot3:Find("tag_name"), slot1)
		setActive(slot3, true)

		slot0._secondaryAttrList[slot1] = {
			value = 0,
			tf = slot3
		}
	end

	slot3 = slot0._secondaryAttrList[slot1].tf

	if slot0._secondaryAttrList[slot1].value ~= slot2 then
		setText(slot3:Find("current"), slot2)
		uv0.setDeltaText(slot3:Find("delta"), slot0._unit:GetAttrByName(slot1) - slot5)
	end
end

function slot5.updateBuffList(slot0)
	slot1 = slot0._unit:GetBuffList()

	for slot5, slot6 in pairs(slot0._buffList) do
		if not slot1[slot5] then
			GameObject.Destroy(slot6.gameObject)

			slot0._buffList[slot5] = nil
		end
	end

	for slot5, slot6 in pairs(slot1) do
		if not slot0._buffList[slot5] then
			slot0:addBuff(slot5)
		end
	end
end

function slot5.updateWeaponList(slot0)
	for slot5, slot6 in ipairs(slot0._unit:GetAllWeapon()) do
		if slot6:GetType() ~= uv0.PASSIVE_SCOUT and slot7 ~= uv0.FLEET_ANTI_AIR then
			slot8 = cloneTplTo(slot0._weaponTpl, slot0._weaponContainer)

			setText(slot8:Find("common/index"), slot6:GetEquipmentIndex())
			setText(slot8:Find("common/templateID"), slot6:GetTemplateData().id)

			if slot6:GetSrcEquipmentID() then
				GetImageSpriteFromAtlasAsync("equips/" .. uv1.GetWeaponDataFromID(slot9).icon, "", slot8:Find("common/icon"))
			else
				setActive(slot10, false)
			end

			slot0._weaponList[slot6] = slot8

			onToggle(slot0, slot8:Find("common/sector"), function (slot0)
				uv0._unit:ActiveWeaponSectorView(uv1, slot0)
			end)
			slot0:updateBulletAttrBuff(slot6)
		end
	end
end

function slot5.updateWeaponProgress(slot0)
	for slot4, slot5 in pairs(slot0._weaponList) do
		slot6 = slot4:GetReloadRate()
		slot5:Find("common/reload_progress/blood"):GetComponent(typeof(Image)).fillAmount = 1 - slot6

		if slot6 == 0 then
			slot7.color = Color.green
		else
			slot7.color = Color.red
		end

		setText(slot5:Find("sum/damageSum"), slot4:GetDamageSUM())
		setText(slot5:Find("sum/CTRate"), string.format("%.2f", slot4:GetCTRate() * 100) .. "%")
		setText(slot5:Find("sum/ACCRate"), string.format("%.2f", slot4:GetACCRate() * 100) .. "%")
	end
end

function slot5.updateBulletAttrBuff(slot0, slot1)
	slot2 = slot0._weaponList[slot1]
	slot3 = slot2:Find("weapon_attr_tpl")
	slot4 = slot2:Find("weapon_attr_container")

	for slot8, slot9 in pairs(slot0._unit:GetBuffList()) do
		for slot13, slot14 in ipairs(slot9:GetEffectList()) do
			if slot14.__name == uv0.Battle.BattleBuffAddBulletAttr.__name and slot14:equipIndexRequire(slot1:GetEquipmentIndex()) then
				slot16 = cloneTplTo(slot3, slot4)

				setText(slot16:Find("tag_name"), slot14._attr)
				setText(slot16:Find("current"), slot14._number)
			end
		end
	end
end

function slot5.addBuff(slot0, slot1)
	slot2 = cloneTplTo(slot0._buffTpl, slot0._buffContainer)

	setText(slot2:Find("buff_id"), "buff_" .. slot1)
	setActive(slot2, true)

	slot0._buffList[slot1] = slot2
end

function slot5.Dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)

	slot0._unit = nil
	slot0._secondaryAttrList = nil
	slot0._buffList = nil
	slot0._weaponList = nil

	GameObject.Destroy(slot0._go)
end

function slot5.setDeltaText(slot0, slot1)
	setText(slot0, slot1)

	slot0:GetComponent(typeof(Text)).color = slot1 > 0 and Color.green or Color.red
end
