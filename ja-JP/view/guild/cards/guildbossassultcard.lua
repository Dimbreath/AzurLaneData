slot0 = class("GuildBossAssultCard")

function slot0.Ctor(slot0, slot1)
	slot0._tr = tf(slot1)
	slot0._go = slot1
	slot0.mask = findTF(slot0._tr, "mask"):GetComponent(typeof(Image))
	slot0.icon = findTF(slot0._tr, "icon/icon"):GetComponent(typeof(Image))
	slot0.shipNameTxt = findTF(slot0._tr, "info/shipname"):GetComponent(typeof(Text))
	slot0.userNameTxt = findTF(slot0._tr, "info/username"):GetComponent(typeof(Text))
	slot0.levelTxt = findTF(slot0._tr, "info/lv/Text"):GetComponent(typeof(Text))
	slot0.startList = UIItemList.New(findTF(slot0._tr, "info/stars"), findTF(slot0._tr, "info/stars/star_tpl"))
end

function slot0.Flush(slot0, slot1, slot2)
	slot0.shipNameTxt.text = slot2.name
	slot0.levelTxt.text = slot2.level
	slot4 = slot2:getStar()

	slot0.startList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setActive(slot2:Find("star_tpl"), slot1 <= uv0)
		end
	end)
	slot0.startList:align(slot2:getMaxStar())

	slot0.userNameTxt.text = i18n("guild_ship_from") .. slot1.name

	LoadSpriteAsync("shipYardIcon/" .. slot2:getPainting(), function (slot0)
		if uv0._tr then
			uv0.icon.sprite = slot0
		end
	end)

	if slot2:rarity2bgPrint() == "04" then
		slot5 = 4
	elseif slot5 == "05" then
		slot5 = 5
	end

	slot0.mask.sprite = GetSpriteFromAtlas("ui/GuildBossAssultUI_atlas", slot5)
end

function slot0.Dispose(slot0)
end

return slot0
