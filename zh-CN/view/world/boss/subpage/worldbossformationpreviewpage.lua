slot0 = class("WorldBossFormationPreViewPage", import("....base.BaseSubView"))

function slot0.getUIName(slot0)
	return "WorldBossFormationPreViewPage"
end

function slot0.OnLoaded(slot0)
	slot0.mainList = UIItemList.New(slot0:findTF("frame/scrollrect/content/main"), slot0:findTF("frame/scrollrect/content/main/tpl"))
	slot0.vanguardList = UIItemList.New(slot0:findTF("frame/scrollrect/content/vanguard"), slot0:findTF("frame/scrollrect/content/main/tpl"))
end

function slot0.OnInit(slot0)
	onButton(slot0, slot0._tf, function ()
		uv0:Hide()
	end, SFX_PANEL)
end

function slot0.Show(slot0, slot1)
	uv0.super.Show(slot0)
	slot0._tf:SetAsLastSibling()
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
	slot0:InitShips(slot1)
end

function slot0.Hide(slot0)
	uv0.super.Hide(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
end

function slot0.InitShips(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in ipairs(slot1) do
		if slot8:getTeamType() == TeamType.Vanguard then
			table.insert({}, slot8)
		elseif slot9 == TeamType.Main then
			table.insert(slot2, slot8)
		end
	end

	slot0.mainList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv1:UpdateShip(slot2, uv0[slot1 + 1])
		end
	end)
	slot0.mainList:align(3)
	slot0.vanguardList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv1:UpdateShip(slot2, uv0[slot1 + 1])
		end
	end)
	slot0.vanguardList:align(3)
end

function slot0.UpdateShip(slot0, slot1, slot2)
	setActive(slot1:Find("info"), slot2)
	setActive(slot1:Find("empty"), not slot2)

	if slot2 then
		slot3 = slot1:Find("info")
		slot6 = UIItemList.New(slot3:Find("stars"), slot3:Find("stars/star_tpl"))
		slot3:Find("shipname"):GetComponent(typeof(Text)).text = HXSet.hxLan(slot2:getName())
		slot3:Find("ship_type"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("shiptype", shipType2print(pg.ship_data_statistics[slot2.configId].type))
		slot10 = slot2:getStar()

		slot6:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				setActive(slot2:Find("star_tpl"), slot1 <= uv0)
			end
		end)
		slot6:align(slot2:getMaxStar())

		slot3:Find("lv/Text"):GetComponent(typeof(Text)).text = slot2.level
		slot3:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite("HeroHrzIcon/" .. slot2:getPainting())

		slot0:UpdateEquipments(slot3, slot2)
	end
end

function slot0.UpdateEquipments(slot0, slot1, slot2)
	slot3 = UIItemList.New(slot1:Find("equipemtns"), slot1:Find("equipemtns/equipment_tpl"))
	slot4 = slot2:getActiveEquipments()

	slot3:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = uv0[slot1 + 1]

			setActive(slot2:Find("info"), slot3)
			setActive(slot2:Find("empty"), not slot3)

			if slot3 then
				updateEquipment(slot2:Find("info"), slot3)
				setText(slot2:Find("info/name_bg/Text"), shortenString(HXSet.hxLan(slot3.config.name), 5))
				onButton(uv1, slot2, function ()
					uv0:emit(BaseUI.ON_EQUIPMENT, {
						type = EquipmentInfoMediator.TYPE_DISPLAY,
						equipment = uv1
					})
				end, SFX_PANEL)
			end
		end
	end)
	slot3:align(5)
end

function slot0.OnDestroy(slot0)
end

return slot0
