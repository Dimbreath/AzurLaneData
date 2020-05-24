slot0 = class("BackYardSystemTheme", import("..BaseVO"))

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
end

function slot0.bindConfigTable(slot0)
	return pg.backyard_theme_template
end

function slot0.IsOverTime(slot0)
	return _.all(slot0:getConfig("ids"), function (slot0)
		return not Furniture.New({
			id = slot0
		}):IsShopType() or not slot1:inTime()
	end)
end

function slot0.GetFurnitures(slot0)
	return slot0:getConfig("ids")
end

function slot0.HasDiscount(slot0)
	return _.any(slot0:GetFurnitures(), function (slot0)
		slot1 = Furniture.New({
			id = slot0
		})

		return slot1:getPrice(PlayerConst.ResDormMoney) < slot1:getConfig("dorm_icon_price")
	end)
end

function slot0.GetDiscount(slot0)
	slot2 = _.map(slot0:GetFurnitures(), function (slot0)
		return Furniture.New({
			id = slot0
		})
	end)
	slot4 = _.reduce(slot2, 0, function (slot0, slot1)
		return slot0 + slot1:getConfig("dorm_icon_price")
	end)

	return (slot4 - _.reduce(slot2, 0, function (slot0, slot1)
		return slot0 + slot1:getPrice(PlayerConst.ResDormMoney)
	end)) / slot4 * 100
end

return slot0
