ys = ys or {}
slot1 = ys.Battle.BattleAttr
slot2 = class("BattleUnitDetailView")
ys.Battle.BattleUnitDetailView = slot2
slot2.__name = "BattleUnitDetailView"
slot2.PrimalAttr = {
	"cannonPower",
	"torpedoPower",
	"airPower",
	"antiAirPower",
	"antiSubPower",
	"loadSpeed",
	"dodgeRate"
}
slot2.BaseEnhancement = {
	damageRatioByBulletTorpedo = "damage/damageRatioByBulletTorpedo",
	injureRatioByBulletTorpedo = "injure/injureRatioByBulletTorpedo",
	damageRatioByCannon = "damage/damageRatioByCannon",
	injureRatioByCannon = "injure/injureRatioByCannon",
	damageRatioBullet = "damage/damageRatioBullet",
	injureRatio = "injure/injureRatio",
	injureRatioByAir = "injure/injureRatioByAir",
	damageRatioByAir = "damage/damageRatioByAir"
}
slot2.SecondaryAttrListener = {}

function slot2.Ctor(slot0)
	return
end

function slot2.SetUnit(slot0, slot1)
	slot0._unit = slot1

	setImageSprite(slot0._icon, slot3)

	for slot7 = 1, slot0._unit:GetTemplate().star, 1 do
		setActive(cloneTplTo(slot0._starTpl, slot0._stars), true)
	end

	setText(slot0._templateID, slot0._unit:GetTemplate().id)
	setText(slot0._name, slot0._unit:GetTemplate().name)
	setText(slot0._lv, slot0._unit:GetAttrByName("level"))

	slot0._preAttrList = {}

	for slot7, slot8 in ipairs(slot1.PrimalAttr) do
		setText(slot0._attrView:Find(slot8 .. "/base"), slot2.GetBase(slot0._unit, slot8))

		slot0._preAttrList[slot8] = slot2.GetBase(slot0._unit, slot8)
	end

	slot0._baseEhcList = {}

	for slot7, slot8 in pairs(slot1.BaseEnhancement) do
		slot0._baseEhcList[slot7] = 0
	end

	slot0._secondaryAttrList = {}
	slot0._buffList = {}
end

function slot2.Update(slot0)
	for slot4, slot5 in ipairs(slot0.PrimalAttr) do
		slot0:updatePrimalAttr(slot5)
	end

	for slot4, slot5 in pairs(slot0.BaseEnhancement) do
		slot0:updateBaseEnhancement(slot4, slot5)
	end

	for slot5, slot6 in pairs(slot1) do
		if string.find(slot5, "DMG_TAG_EHC_") or string.find(slot5, "DMG_FROM_TAG_") or table.contains(slot0.SecondaryAttrListener, slot5) then
			slot0:updateSecondaryAttr(slot5, slot6)
		end
	end

	slot0:updateBuffList()
end

function slot2.UpdatePos(slot0, slot1)
	return
end

function slot2.ConfigSkin(slot0, slot1)
	slot0._go = slot1
	slot0._tf = slot1.transform
	slot0._iconView = slot1.transform.Find(slot2, "icon")
	slot0._icon = slot0._iconView:Find("icon")
	slot0._stars = slot0._iconView:Find("stars")
	slot0._starTpl = slot0._stars:Find("star_tpl")
	slot0._templateView = slot1.transform.Find(slot2, "template")
	slot0._templateID = slot0._templateView:Find("template/text")
	slot0._name = slot0._templateView:Find("name/text")
	slot0._lv = slot0._templateView:Find("level/text")
	slot0._attrView = slot1.transform.Find(slot2, "attr_panels/primal_attr")
	slot0._baseEnhanceView = slot1.transform.Find(slot2, "attr_panels/basic_ehc")
	slot0._secondaryAttrView = slot1.transform.Find(slot2, "attr_panels/tag_ehc")
	slot0._secondaryAttrContainer = slot0._secondaryAttrView:Find("tag_container")
	slot0._secondaryAttrTpl = slot0._secondaryAttrView:Find("tag_attr_tpl")
	slot0._buffView = slot1.transform.Find(slot2, "attr_panels/buff")
	slot0._buffContainer = slot0._buffView:Find("buff_container")
	slot0._buffTpl = slot0._buffView:Find("buff_tpl")

	SetActive(slot0._go, true)
end

function slot2.updatePrimalAttr(slot0, slot1)
	setText(slot0._attrView:Find(slot1 .. "/current"), slot0._unit:GetAttrByName(slot1))

	if slot0._unit.GetAttrByName(slot1) - slot0._preAttrList[slot1] ~= 0 then
		setText(slot0._attrView:Find(slot1 .. "/change"), slot3)

		slot0._preAttrList[slot1] = slot2
		slot4:GetComponent(typeof(Text)).color = (slot3 > 0 and Color.green) or Color.red
	end
end

function slot2.updateBaseEnhancement(slot0, slot1, slot2)
	setText(slot0._baseEnhanceView:Find(slot2).Find(slot3, "current"), slot0._unit:GetAttrByName(slot1))

	if slot0._unit.GetAttrByName(slot1) - slot0._baseEhcList[slot1] ~= 0 then
		slot6 = slot3:Find("change")

		setText(slot6, slot5)

		slot6:GetComponent(typeof(Text)).color = (slot5 > 0 and Color.green) or Color.red
	end
end

function slot2.updateSecondaryAttr(slot0, slot1, slot2)
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
	slot4 = slot0._unit:GetAttrByName(slot1)

	if slot0._secondaryAttrList[slot1].value ~= slot2 then
		setText(slot3:Find("current"), slot2)

		slot7 = slot3:Find("delta")

		setText(slot7, slot6)

		slot7:GetComponent(typeof(Text)).color = (slot4 - slot5 > 0 and Color.green) or Color.red
	end
end

function slot2.updateBuffList(slot0)
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

function slot2.addBuff(slot0, slot1)
	slot2 = cloneTplTo(slot0._buffTpl, slot0._buffContainer)

	setText(slot2:Find("buff_id"), "buff_" .. slot1)
	setActive(slot2, true)

	slot0._buffList[slot1] = slot2
end

function slot2.Dispose(slot0)
	slot0._unit = nil

	GameObject.Destroy(slot0._go)
end

return
