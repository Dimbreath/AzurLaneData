slot0 = class("BackYardShopFilterPanel", import("..base.BasePanel"))
slot0.SORT_MODE = {
	BY_FUNC = 2,
	BY_CONFIG = 3,
	BY_DEFAULT = 1
}
slot0.SORT_TAG = {
	{
		{
			1,
			"default"
		},
		i18n("backyard_sort_tag_default")
	},
	{
		{
			2,
			"sortPriceFunc"
		},
		i18n("backyard_sort_tag_price")
	},
	{
		{
			3,
			"comfortable"
		},
		i18n("backyard_sort_tag_comfortable")
	},
	{
		{
			2,
			"sortSizeFunc"
		},
		i18n("backyard_sort_tag_size")
	}
}
slot0.ORDER_MODE_ASC = 1
slot0.ORDER_MODE_DASC = 2
slot0.TYPE_SHOP = "SortForShop"
slot0.TYPE_DECORATION = "SortForDecorate"

function slot0.getBackyardThemeConfig(slot0)
	return pg.backyard_theme_template
end

function slot0.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1)

	slot0.type = slot2
end

function slot0.init(slot0)
	slot1 = slot0._go
	slot0.sortTpl = slot0:findTF("bg/sort_tpl")
	slot0.filterTpl = slot0:findTF("bg/filter_tpl")
	slot0.sortContainer = slot0:findTF("bg/frame/sorts/sort_container")
	slot0.filterContainer = slot0:findTF("bg/frame/filters/rect_view/conent/theme_panel")
	slot0.selectedAllBtn = slot0:findTF("bg/frame/filters/rect_view/conent/all_panel/sort_tpl")
	slot0.orderMode = slot0.ORDER_MODE_ASC
	slot0.filterConfig = slot0:getBackyardThemeConfig()
	slot0.furnitures = {}
	slot0.sortData = slot0.SORT_TAG[1]
	slot0.sortTxt = slot0.SORT_TAG[1][2]
	slot0.filterData = _.select(slot0.filterConfig.all, function (slot0)
		return slot0.filterConfig[slot0].is_view == 1
	end)
	slot0.confirmFunc = nil
	slot0.onHideFunc = nil
end

function slot0.setFilterData(slot0, slot1)
	slot0.furnitures = slot1 or {}
end

function slot0.updateOrderMode(slot0, slot1)
	slot0.orderMode = slot1
end

function slot0.attach(slot0, slot1)
	slot0.super.attach(slot0, slot1)
	onButton(slot0, slot0:findTF("bg/frame/confirm_btn"), function ()
		slot0:filter()
		slot0.filter:hide()

		if slot0.filter.hide.confirmFunc then
			slot0.confirmFunc()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0._go, function ()
		slot0:hide()
	end, SFX_PANEL)
	slot0:initSortPanel()
	slot0:initFilterPanel()
	triggerToggle(slot0.selectedAllBtn, true)
	triggerToggle(slot0.sortBtns[1], true)
end

function slot0.initSortPanel(slot0)
	slot0.sortBtns = {}

	for slot4, slot5 in pairs(slot0.SORT_TAG) do
		slot6 = cloneTplTo(slot0.sortTpl, slot0.sortContainer)

		setText(slot6:Find("Text"), slot5[2])

		slot0.sortBtns[slot4] = slot6

		slot0:onSwitch(slot6, function (slot0)
			if slot0 then
				slot0.sortData = slot1[1]
				slot0.sortTxt = slot1[2]
			end
		end)
	end
end

function slot0.onSwitch(slot0, slot1, slot2)
	onToggle(slot0, slot1, function (slot0)
		setActive(slot0:Find("mark"), not slot0)
		setActive(slot0)
	end, SFX_PANEL)
end

function slot0.initFilterPanel(slot0)
	slot0.filterBtns = {}

	for slot4, slot5 in ipairs(slot0.filterConfig.all) do
		if slot0.filterConfig[slot5].is_view == 1 then
			slot7 = cloneTplTo(slot0.filterTpl, slot0.filterContainer)

			setText(slot7:Find("Text"), slot6.name)

			slot0.filterBtns[slot5] = slot7

			slot0:onSwitch(slot7, function (slot0)
				if slot0 then
					table.insert(slot0.filterData, table.insert)
					triggerToggle(slot0.selectedAllBtn, slot0:isSelectedAll())
				else
					slot0.filterData = _.reject(slot0.filterData, function (slot0)
						return slot0 == slot0
					end)

					if slot0:isSelectedNone() then
						triggerToggle(slot0.selectedAllBtn, true)
						setActive(slot0.selectedAllBtn:Find("mark"), false)
					end
				end
			end)
		end
	end

	slot0.otherTF = cloneTplTo(slot0.filterTpl, slot0.filterContainer)

	setText(slot0.otherTF:Find("Text"), i18n("backyard_filter_tag_other"))

	slot0.otherTFToggle = slot0.otherTF:GetComponent(typeof(Toggle))
	slot0.selectedOther = false

	slot0:onSwitch(slot0.otherTF, function (slot0)
		slot0.selectedOther = slot0

		if slot0 then
			triggerToggle(slot0.selectedAllBtn, slot0:isSelectedAll())
		elseif slot0:isSelectedNone() then
			triggerToggle(slot0.selectedAllBtn, true)
			setActive(slot0.selectedAllBtn:Find("mark"), false)
		end
	end)
	onToggle(slot0, slot0.selectedAllBtn, function (slot0)
		if slot0:isSelectedNone() then
			return
		end

		if slot0 then
			_.each(slot0.filterData, function (slot0)
				triggerToggle(slot0.filterBtns[slot0], false)
			end)

			slot0.filterData = {}

			triggerToggle(slot0.otherTF, false)

			slot0.selectedOther = false
		end

		setActive(slot0.selectedAllBtn:Find("mark"), not slot0)
	end, SFX_PANEL)
end

function slot0.isSelectedAll(slot0)
	return (_.all(_.select(slot0.filterConfig.all, function (slot0)
		return slot0.filterConfig[slot0].is_view == 1
	end), function (slot0)
		return table.contains(slot0.filterData, slot0)
	end) and slot0.otherTFToggle.isOn == true) or slot0:isSelectedNone()
end

function slot0.isSelectedNone(slot0)
	return #slot0.filterData == 0 and slot0.otherTFToggle.isOn == false
end

function slot0.getFurnituresByThemeId(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in ipairs(pg.furniture_data_template.all) do
		if Furniture.New({
			id = slot8
		}):getConfig("themeId") == slot1 then
			table.insert(slot3, slot8)
		end
	end

	return slot3
end

function slot0.filter(slot0)
	if table.getCount(slot0.furnitures) == 0 then
		return
	end

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.filterData) do
		for slot11, slot12 in ipairs(slot7) do
			table.insert(slot1, slot12)
		end
	end

	function slot2(slot0)
		slot1 = slot0.id
		slot2 = slot0.selectedOther and slot0:getConfig("themeId") == 0

		if slot2 then
			return false
		end

		return not table.contains(slot1, slot1)
	end

	if #slot1 ~= 0 or not not slot0.selectedOther then
		for slot6 = #slot0.furnitures, 1, -1 do
			slot7 = slot0.furnitures[slot6].id

			if slot2(slot0.furnitures[slot6]) then
				table.remove(slot0.furnitures, slot6)
			end
		end
	end

	slot0:sort(slot0.furnitures)
end

function slot0.SORT_BY_FUNC(slot0, slot1, slot2, slot3, slot4)
	if slot0[slot2](slot0) == slot1[slot2](slot1) then
		return slot4()
	elseif slot3 == slot0.ORDER_MODE_ASC then
		return slot0[slot2](slot0) < slot1[slot2](slot1)
	else
		return slot1[slot2](slot1) < slot0[slot2](slot0)
	end
end

function slot0.SORT_BY_CONFIG(slot0, slot1, slot2, slot3, slot4)
	if slot0:getConfig(slot2) == slot1:getConfig(slot2) then
		return slot4()
	elseif slot3 == slot0.ORDER_MODE_ASC then
		return slot0:getConfig(slot2) < slot1:getConfig(slot2)
	else
		return slot1:getConfig(slot2) < slot0:getConfig(slot2)
	end
end

function slot0.SortForShop(slot0, slot1, slot2)
	slot3 = slot2[1]
	slot4 = slot2[2]
	slot6 = slot2[4]
	slot7 = slot2[3].playerVO.level
	slot8 = (slot0:canPurchase() and 1) or 0
	slot9 = (slot1:canPurchase() and 1) or 0

	if slot3 == slot0.SORT_MODE.BY_DEFAULT then
		return BackYardShopLayer.SORT_FURNITURE_FUNC(slot0, slot1, slot7, slot6)
	elseif slot3 == slot0.SORT_MODE.BY_FUNC then
		if slot8 == slot9 then
			return slot0:SORT_BY_FUNC(slot1, slot4, slot6, function ()
				return BackYardShopLayer.SORT_FURNITURE_FUNC(BackYardShopLayer.SORT_FURNITURE_FUNC, , , )
			end)
		else
			return slot9 < slot8
		end
	elseif slot3 == slot0.SORT_MODE.BY_CONFIG then
		if slot8 == slot9 then
			return slot0:SORT_BY_CONFIG(slot1, slot4, slot6, function ()
				return BackYardShopLayer.SORT_FURNITURE_FUNC(BackYardShopLayer.SORT_FURNITURE_FUNC, , , )
			end)
		else
			return slot9 < slot8
		end
	end
end

function slot0.SortForDecorate(slot0, slot1, slot2)
	slot3 = slot2[1]
	slot4 = slot2[2]
	slot6 = slot2[4]
	slot8 = (slot2[3].furnitruesPackage.getSameConfigIdCount(slot7, slot0.configId) == slot0.count and 1) or 0
	slot9 = (slot7:getSameConfigIdCount(slot1.configId) == slot1.count and 1) or 0

	if slot3 == slot0.SORT_MODE.BY_DEFAULT then
		return BackYardGarnitureLayer.SORT_FUNC(slot0, slot1, slot5.furnitruesPackage, slot6)
	elseif slot3 == slot0.SORT_MODE.BY_FUNC then
		if slot8 == slot9 then
			return slot0:SORT_BY_FUNC(slot1, slot4, slot6, function ()
				return BackYardGarnitureLayer.SORT_FUNC(BackYardGarnitureLayer.SORT_FUNC, , slot2.furnitruesPackage, )
			end)
		else
			return slot8 < slot9
		end
	elseif slot3 == slot0.SORT_MODE.BY_CONFIG then
		if slot8 == slot9 then
			return slot0:SORT_BY_CONFIG(slot1, slot4, slot6, function ()
				return BackYardGarnitureLayer.SORT_FUNC(BackYardGarnitureLayer.SORT_FUNC, , slot2.furnitruesPackage, )
			end)
		else
			return slot8 < slot9
		end
	end
end

function slot0.sort(slot0, slot1)
	table.sort(slot1, function (slot0, slot1)
		return slot0[slot1.type](slot0, slot1, {
			slot1.sortData[1],
			slot1.sortData[2],
			slot1.parent,
			slot1.orderMode
		})
	end)

	slot0.furnitures = slot1
end

function slot0.filterFurnitures(slot0, slot1, slot2)
	if slot2 then
		slot0:updateOrderMode(slot2)
	end

	slot0:setFilterData(slot1)
	slot0:filter()
end

function slot0.show(slot0)
	setActive(slot0._go, true)
end

function slot0.hide(slot0)
	setActive(slot0._go, false)

	if slot0.onHideFunc then
		slot0.onHideFunc()
	end
end

return slot0
