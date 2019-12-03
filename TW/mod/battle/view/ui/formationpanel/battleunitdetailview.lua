ys = ys or {}
slot1 = class("BattleUnitDetailView")
ys.Battle.BattleUnitDetailView = slot1
slot1.__name = "BattleUnitDetailView"

function slot1.Ctor(slot0)
	return
end

function slot1.SetUnit(slot0, slot1)
	slot0._unit = slot1
	slot0._UIDTxt.text = slot0._unit:GetUniqueID()
	slot0._TIDTxt.text = slot0._unit:GetTemplateID()
	slot0._LVTxt.text = slot0._unit:GetAttrByName("level")
end

function slot1.Update(slot0)
	slot0._HPTxt.text = slot0._unit._currentHP .. "/" .. slot0._unit:GetMaxHP()
	slot0._SLDTxt.text = 0
	slot0._CPTxt.text = slot0._unit.GetAttrByName(slot1, "cannonPower")
	slot0._TPTxt.text = slot0._unit.GetAttrByName(slot1, "torpedoPower")
	slot0._AAPTxt.text = slot0._unit.GetAttrByName(slot1, "antiAirPower")
	slot0._APTxt.text = slot0._unit.GetAttrByName(slot1, "airPower")
	slot0._ARTxt.text = slot0._unit.GetAttrByName(slot1, "attackRating")
	slot0._LSTxt.text = slot0._unit.GetAttrByName(slot1, "loadSpeed")
	slot0._ARMTxt.text = 0
	slot0._DRTxt.text = slot0._unit.GetAttrByName(slot1, "dodgeRate")
	slot0._LCKTxt.text = slot0._unit.GetAttrByName(slot1, "luck")
	slot0._VLCTxt.text = slot0._unit:GetAttrByName("velocity")
end

function slot1.UpdatePos(slot0, slot1)
	slot0._tf.position = slot1
end

function slot1.ConfigSkin(slot0, slot1)
	slot0._go = slot1
	slot0._tf = slot1.transform
	slot0._UIDTxt = slot1.transform.Find(slot2, "uniqueIDText"):GetComponent(typeof(Text))
	slot0._TIDTxt = slot1.transform.Find(slot2, "templateIDText"):GetComponent(typeof(Text))
	slot0._LVTxt = slot1.transform.Find(slot2, "LVText"):GetComponent(typeof(Text))
	slot0._HPTxt = slot1.transform.Find(slot2, "HPText"):GetComponent(typeof(Text))
	slot0._SLDTxt = slot1.transform.Find(slot2, "shieldText"):GetComponent(typeof(Text))
	slot0._CPTxt = slot1.transform.Find(slot2, "cannonText"):GetComponent(typeof(Text))
	slot0._TPTxt = slot1.transform.Find(slot2, "torpedoText"):GetComponent(typeof(Text))
	slot0._AAPTxt = slot1.transform.Find(slot2, "aaText"):GetComponent(typeof(Text))
	slot0._APTxt = slot1.transform.Find(slot2, "airText"):GetComponent(typeof(Text))
	slot0._ARTxt = slot1.transform.Find(slot2, "atkRateText"):GetComponent(typeof(Text))
	slot0._LSTxt = slot1.transform.Find(slot2, "loadSpeedText"):GetComponent(typeof(Text))
	slot0._ARMTxt = slot1.transform.Find(slot2, "armorText"):GetComponent(typeof(Text))
	slot0._DRTxt = slot1.transform.Find(slot2, "dodgeText"):GetComponent(typeof(Text))
	slot0._LCKTxt = slot1.transform.Find(slot2, "luckText"):GetComponent(typeof(Text))
	slot0._VLCTxt = slot1.transform.Find(slot2, "velocityText"):GetComponent(typeof(Text))

	SetActive(slot0._go, true)
end

function slot1.Dispose(slot0)
	slot0._unit = nil

	GameObject.Destroy(slot0._go)
end

return
