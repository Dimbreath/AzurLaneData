slot0 = class("BackYardFurniturePage", import(".BackYardShopBasePage"))
slot1 = {
	{},
	{
		Furniture.TYPE_WALLPAPER
	},
	{
		Furniture.TYPE_FLOORPAPER
	},
	{
		Furniture.TYPE_FURNITURE,
		Furniture.TYPE_MAT,
		Furniture.TYPE_COLLECTION,
		Furniture.TYPE_STAGE,
		Furniture.TYPE_ARCH,
		Furniture.TYPE_MOVEABLE,
		Furniture.TYPE_TRANSPORT
	},
	{
		Furniture.TYPE_DECORATE
	},
	{
		Furniture.TYPE_WALL,
		Furniture.TYPE_WALL_MAT
	}
}

function slot2(slot0)
	return uv0[slot0]
end

function slot0.getUIName(slot0)
	return "BackYardFurniturePage"
end

function slot0.OnLoaded(slot0)
	slot0.scrollRect = slot0:findTF("frame/bg"):GetComponent("LScrollRect")
end

function slot0.OnInit(slot0)
	slot0.cards = {}

	function slot0.scrollRect.onInitItem(slot0)
		uv0:OnInitItem(slot0)
	end

	function slot0.scrollRect.onUpdateItem(slot0, slot1)
		uv0:OnUpdateItem(slot0, slot1)
	end
end

function slot0.OnDisplayUpdated(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.displays) do
		if slot6.id == slot1.id then
			slot0.displays[slot5] = slot1

			break
		end
	end
end

function slot0.OnCardUpdated(slot0, slot1)
	for slot5, slot6 in pairs(slot0.cards) do
		if slot6.furniture.id == slot1.id then
			slot6:Update(slot1)

			break
		end
	end
end

function slot0.OnSetUp(slot0)
	slot0:InitFurnitureList()
end

function slot0.InitFurnitureList(slot0)
	slot0.displays = {}

	for slot5, slot6 in ipairs(slot0:GetData()) do
		table.insert(slot0.displays, slot6)
	end

	function slot2(slot0)
		if slot0:canPurchase() then
			if slot0:canPurchaseByGem() and not slot0:canPurchaseByDormMoeny() then
				return 1
			elseif slot0:canPurchaseByGem() and slot0:canPurchaseByDormMoeny() then
				return 2
			elseif slot0:canPurchaseByDormMoeny() then
				return 3
			else
				return 4
			end
		else
			return 5
		end
	end

	table.sort(slot0.displays, function (slot0, slot1)
		if uv0(slot0) == uv0(slot1) then
			return slot3 < slot2
		else
			return slot2 < slot3
		end
	end)
	slot0.scrollRect:SetTotalCount(#slot0.displays)
end

function slot0.GetData(slot0)
	slot1 = {}

	for slot9, slot10 in ipairs(pg.furniture_shop_template.all) do
		if function (slot0)
			return not slot0:isNotForSale() and (not slot0:isForActivity() or uv0[slot0.id]) and not not slot0:inTime()
		end(slot0.dorm:GetAllFurniture()[slot10] or Furniture.New({
			id = slot10
		})) and function (slot0, slot1)
			return table.contains(slot1, slot0:getConfig("type"))
		end(slot11, uv0(slot0.pageType)) then
			table.insert(slot1, slot11)
		end
	end

	return slot1
end

function slot0.OnInitItem(slot0, slot1)
	slot2 = BackYardFurnitureCard.New(slot1)

	onButton(slot0, slot2._go, function ()
		if uv0.furniture:canPurchase() then
			uv1.contextData.furnitureMsgBox:ExecuteAction("SetUp", uv0.furniture, uv1.dorm, uv1.player)
		end
	end, SFX_PANEL)

	slot0.cards[slot1] = slot2
end

function slot0.OnUpdateItem(slot0, slot1, slot2)
	if not slot0.cards[slot2] then
		slot0:OnInitItem(slot2)

		slot3 = slot0.cards[slot2]
	end

	slot3:Update(slot0.displays[slot1 + 1])
end

function slot0.OnDestroy(slot0)
	for slot4, slot5 in pairs(slot0.cards) do
		slot5:Clear()
	end
end

return slot0
