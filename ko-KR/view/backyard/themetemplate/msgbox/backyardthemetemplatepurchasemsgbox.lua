slot0 = class("BackYardThemeTemplatePurchaseMsgbox", import("...Shop.msgbox.BackYardThemeMsgBoxPage"))

function slot0.SetUp(slot0, slot1, slot2, slot3)
	slot0.dorm = slot2
	slot0.template = slot1
	slot0.player = slot3
	slot0.count = 1
	slot0.maxCount = 1

	slot0:UpdateMainInfo()
	slot0:UpdateRes()
	slot0:UpdateBtns()
	slot0:UpdatePrice()
	slot0:Show()
end

function slot0.UpdateMainInfo(slot0)
	slot0.nameTxt.text = slot0.template:GetName()
	slot0.descTxt.text = slot0.template:GetDesc()

	setActive(slot0.icon.gameObject, false)
	setActive(slot0.rawIcon.gameObject, false)
	BackYardThemeTempalteUtil.GetTexture(slot0.template:GetTextureIconName(), function (slot0)
		if slot0 then
			setActive(uv0.rawIcon.gameObject, true)

			uv0.rawIcon.texture = slot0
		end
	end)
end

function slot0.GetAddList(slot0)
	slot1 = {}

	for slot7, slot8 in pairs(slot0.template:GetFurnitureCnt()) do
		if pg.furniture_data_template[slot7] and (slot0.dorm:GetAllFurniture()[slot7] or Furniture.New({
			id = slot7
		})):canPurchase() and slot9:inTime() and slot9:canPurchaseByDormMoeny() then
			table.insert(slot1, slot9)
		end
	end

	return slot1
end

return slot0
