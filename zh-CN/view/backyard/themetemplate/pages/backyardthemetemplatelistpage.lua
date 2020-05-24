slot0 = class("BackYardThemeTemplateListPage", import("...Shop.pages.BackYardThemePage"))

function slot0.LoadDetail(slot0)
	setActive(slot0:findTF("adpter/descript"), false)
end

function slot0.OnInit(slot0)
	uv0.super.OnInit(slot0)

	slot0.tipBg = slot0:findTF("tip")
	slot0.tips = {
		slot0:findTF("tip1"),
		slot0:findTF("tip2"),
		slot0:findTF("tip3")
	}
	slot0.goBtn = slot0:findTF("go_btn")
	slot0.rawImage = slot0:findTF("preview_raw"):GetComponent(typeof(RawImage))
	slot0.listRect = slot0:findTF("adpter/list")
	slot0.refreshBtn = slot0:findTF("adpter/list/refresh_btn")

	setActive(slot0.refreshBtn, true)
	onButton(slot0, slot0.refreshBtn, function ()
		uv0:emit(NewBackYardThemeTemplateMediator.ON_REFRESH)
	end, SFX_PANEL)
	onButton(slot0, slot0.goBtn, function ()
		uv0:emit(NewBackYardThemeTemplateMediator.GO_DECORATION)
	end, SFX_PANEL)

	function slot1()
		if uv0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
			uv0:emit(NewBackYardThemeTemplateMediator.ON_GET_SPCAIL_TYPE_TEMPLATE, BackYardConst.ThemeSortIndex2ServerIndex(uv0.sortIndex, uv0.asc))
		else
			uv0:SetTotalCount()
		end
	end

	slot0.descPages = BackYardThemeTemplateDescPage.New(slot0._tf, slot0._event, slot0.contextData)

	function slot0.descPages.OnSortChange(slot0)
		uv0.asc = slot0

		uv1()
	end

	slot0.contextData.sortPage = BackYardThemeTemplateSortPanel.New(slot0._parentTf, slot0._event, slot0.contextData)

	function slot0.contextData.sortPage.OnConfirm()
		uv0.sortIndex = uv0.contextData.sortPage.index

		uv1()
	end

	slot0.contextData.infoPage = BackYardThemeTemplateInfoPage.New(slot0._parentTf, slot0.event, slot0.contextData)
	slot0.contextData.furnitureMsgBox = BackYardFurnitureMsgBoxPage.New(slot0._parentTf, slot0.event, slot0.contextData)
	slot0.contextData.themeMsgBox = BackYardThemeTemplatePurchaseMsgbox.New(slot0._parentTf, slot0.event, slot0.contextData)
end

function slot0.UpdateDorm(slot0, slot1)
	slot0.dorm = slot1

	if slot0.contextData.infoPage:GetLoaded() and slot0.contextData.infoPage:isShowing() then
		slot0.contextData.infoPage:ExecuteAction("DormUpdated", slot1)
	end

	if slot0.descPages:GetLoaded() then
		slot0.descPages:ExecuteAction("UpdateDorm", slot1)
	end
end

function slot0.PlayerUpdated(slot0, slot1)
	slot0.player = slot1

	if slot0.contextData.infoPage:GetLoaded() and slot0.contextData.infoPage:isShowing() then
		slot0.contextData.infoPage:ExecuteAction("OnPlayerUpdated", slot1)
	end

	if slot0.descPages:GetLoaded() then
		slot0.descPages:ExecuteAction("PlayerUpdated", slot1)
	end
end

function slot0.FurnituresUpdated(slot0, slot1)
	if slot0.contextData.infoPage:GetLoaded() and slot0.contextData.infoPage:isShowing() then
		slot0.contextData.infoPage:ExecuteAction("FurnituresUpdated", slot1)
	end
end

function slot0.ThemeTemplateUpdate(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.list) do
		if slot6.id == slot1.id then
			slot0.list[slot5] = slot1

			break
		end
	end

	for slot5, slot6 in pairs(slot0.cards) do
		if slot6.template.id == slot1.id then
			slot6:Update(slot1)
		end
	end

	if slot0.descPages:GetLoaded() then
		slot0.descPages:ThemeTemplateUpdate(slot1)
	end
end

function slot0.ThemeTemplatesUpdate(slot0, slot1)
	slot0:Flush(slot1)
end

function slot0.SearchKeyChange(slot0, slot1)
	slot0.searchKey = slot1

	slot0:InitThemeList()
end

function slot0.ShopSearchKeyChange(slot0, slot1)
	slot0.searchTemplate = slot1

	slot0:InitThemeList()

	for slot5, slot6 in pairs(slot0.cards) do
		if slot6.themeVO.id == slot1.id then
			triggerButton(slot6._tf)

			break
		end
	end
end

function slot0.ClearShopSearchKey(slot0)
	slot0.searchTemplate = nil

	slot0:InitThemeList()
	slot0:ForceActiveFirstCard()
end

function slot0.DeleteCustomThemeTemplate(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.list) do
		if slot6.id == slot1 then
			table.remove(slot0.list, slot5)

			break
		end
	end

	slot0:InitThemeList()
	slot0:ForceActiveFirstCard()
end

function slot0.DeleteCollectionThemeTemplate(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.list) do
		if slot6.id == slot1 then
			table.remove(slot0.list, slot5)

			break
		end
	end

	slot0:InitThemeList()
	slot0:ForceActiveFirstCard()
end

function slot0.AddCollectionThemeTemplate(slot0, slot1)
	table.insert(slot0.list, slot1)
	slot0:InitThemeList()
end

function slot0.DeleteShopThemeTemplate(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.list) do
		if slot6.id == slot1 then
			table.remove(slot0.list, slot5)

			break
		end
	end

	slot0:InitThemeList()
	slot0:ForceActiveFirstCard()
end

function slot0.GetData(slot0)
	slot1, slot2 = nil

	if slot0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM then
		slot1, slot2 = BackYardConst.ServerIndex2ThemeSortIndex(getProxy(DormProxy).TYPE)
	else
		slot1 = defaultValue(slot0.sortIndex, 1)
		slot2 = defaultValue(slot0.asc, true)
	end

	slot3 = BackYardThemeTemplateSortPanel.GetSortArr(slot1)

	table.sort(slot0.list, function (slot0, slot1)
		if uv0 then
			return slot0[uv1] < slot1[uv1]
		else
			return slot1[uv1] < slot0[uv1]
		end
	end)

	return slot0.list
end

function slot0.OnDormUpdated(slot0)
end

function slot0.OnPlayerUpdated(slot0)
end

function slot0.BlurView(slot0)
end

function slot0.UnBlurView(slot0)
end

function slot0.SetUp(slot0, slot1, slot2, slot3, slot4)
	slot0.searchTemplate = nil
	slot0.searchKey = ""
	slot0.pageType = slot1
	slot0.dorm = slot3
	slot0.player = slot4

	slot0:Flush(slot2)
	setActive(slot0.refreshBtn, slot0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP)
end

function slot0.Flush(slot0, slot1)
	slot0.list = slot1 or {}

	slot0:InitThemeList()
	slot0:Show()
	onNextTick(function ()
		uv0:ForceActiveFirstCard()
	end)
end

function slot0.InitThemeList(slot0)
	setActive(slot0.rawImage.gameObject, false)
	slot0:SetTotalCount()
end

function slot0.SetTotalCount(slot0)
	slot0.disPlays = {}
	slot1 = slot0:GetData()

	if slot0.searchTemplate then
		table.insert(slot0.disPlays, slot0.searchTemplate)
	else
		for slot5, slot6 in ipairs(slot1) do
			if slot6:MatchSearchKey(slot0.searchKey) then
				table.insert(slot0.disPlays, slot6)
			end
		end
	end

	slot0.scrollRect:SetTotalCount(#slot0.disPlays)
end

function slot0.ForceActiveFirstCard(slot0)
	setActive(slot0.tipBg, #slot0.disPlays == 0)
	setActive(slot0.listRect, #slot0.disPlays ~= 0)
	_.each(slot0.tips, function (slot0)
		setActive(slot0, slot0.gameObject.name == "tip" .. tostring(uv0.pageType) and #uv0.disPlays == 0)
	end)
	setActive(slot0.goBtn, slot0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM and #slot0.disPlays == 0)

	if #slot0.disPlays == 0 then
		slot0.descPages:ExecuteAction("Hide")

		return
	end

	for slot5, slot6 in pairs(slot0.cards) do
		if slot0.disPlays[1].id == slot6.template.id then
			triggerButton(slot6._tf)

			break
		end
	end
end

function slot0.NoSelected(slot0)
	return false
end

function slot0.CreateCard(slot0, slot1)
	return BackYardThemeTemplateCard.New(slot1)
end

function slot0.OnCardClick(slot0, slot1)
	if slot0.descPages:GetLoaded() then
		slot0.descPages:Hide()
	end

	setActive(slot0.rawImage.gameObject, false)

	function slot2(slot0)
		BackYardThemeTempalteUtil.GetTexture(slot0:GetTextureName(), function (slot0)
			if slot0 then
				uv0.rawImage.texture = slot0

				setActive(uv0.rawImage.gameObject, true)
			end
		end)
		uv0.descPages:ExecuteAction("SetUp", uv0.pageType, uv1.template, uv0.dorm, uv0.player)
	end

	if slot1.template:ShouldFetch() then
		slot0:emit(NewBackYardThemeTemplateMediator.ON_GET_THEMPLATE_DATA, slot1.template.id, function (slot0)
			uv0(uv1.template)
		end)
	else
		slot2(slot1.template)
	end
end

function slot0.OnDestroy(slot0)
	uv0.super.OnDestroy(slot0)

	slot0.descPages.OnSortChange = nil

	slot0.descPages:Destroy()

	slot0.contextData.sortPage.OnConfirm = nil

	slot0.contextData.sortPage:Destroy()
	slot0.contextData.infoPage:Destroy()
	slot0.contextData.furnitureMsgBox:Destroy()
	slot0.contextData.themeMsgBox:Destroy()
end

return slot0
