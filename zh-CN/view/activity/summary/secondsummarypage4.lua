slot0 = class("SecondSummaryPage4", import(".SummaryAnimationPage"))
slot0.furnitureIdPage = {
	{
		106,
		112,
		117,
		118,
		119,
		124
	},
	{
		129,
		138,
		140,
		141,
		145,
		148
	},
	{
		151,
		155,
		157,
		160,
		167,
		173
	}
}

function slot0.OnInit(slot0)
	slot2 = UIItemList.New(slot0._tf:Find("scroll_rect/content"), slot0._tf:Find("scroll_rect/content/item_tpl"))

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = uv0[slot1 + 1]
			slot5 = uv1.summaryInfoVO.furnitures[slot4]
			slot6 = pg.furniture_data_template[slot4]

			GetImageSpriteFromAtlasAsync("furnitureicon/" .. slot6.icon, "", slot2:Find("icon"), true)
			setGray(slot2:Find("icon"), not slot5)
			setText(slot2:Find("name/Text"), HXSet.hxLan(slot6.name))
			setGray(slot2:Find("name"), not slot5)
			setText(slot2:Find("from/Text"), slot6.gain_by)
			setText(slot2:Find("date/Text"), slot5 and slot5:getDate() or i18n("summary_page_un_rearch"))
		end
	end)
	slot2:align(#uv0.furnitureIdPage[slot0.summaryInfoVO.furniturePage])
end

return slot0
