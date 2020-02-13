slot0 = class("LoadingPanel", import("..base.BaseUI"))

function slot0.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0)
	PoolMgr.GetInstance():GetUI("Loading", true, function (slot0)
		slot0.transform:SetParent(
		-- Decompilation error in this vicinity:
		GameObject.Find("Overlay/UIOverlay").transform, false)
		slot0:SetActive(false)
		slot0:onUILoaded(slot0)

		-- Decompilation error in this vicinity:
		GameObject.Find("Overlay/UIOverlay")()
	end)
end

function slot0.init(slot0)
	slot0.infos = slot0:findTF("infos")
	slot0.infoTpl = slot0:getTpl("infos/info_tpl")
	slot0.indicator = slot0:findTF("load")
	slot0.bg = slot0:findTF("BG")
	slot0.logo = slot0:findTF("logo")

	slot0:displayBG(true)
end

function slot0.appendInfo(slot0, slot1)
	setText(slot2, slot1)

	slot4 = LeanTween.alphaCanvas(slot3, 0, 0.3)

	slot4:setDelay(1.5)
	slot4:setOnComplete(System.Action(function ()
		destroy(destroy)
	end))
end

function slot0.onLoading(slot0)
	return slot0._go.activeInHierarchy
end

slot1 = 0

function slot0.on(slot0, slot1)
	setImageAlpha(slot0._tf, (defaultValue(slot1, true) and 0.01) or 0)

	if slot1 then
		pg.TimeMgr.GetInstance():RemoveTimer(slot0.delayTimer)

		slot0.delayTimer = pg.TimeMgr.GetInstance():AddTimer("loading", 1, 0, function ()
			setImageAlpha(slot0._tf, 0.2)
			setActive(slot0.indicator, true)

			setActive.delayTimer = nil
		end)
	else
		setActive(slot0.indicator, false)
	end

	if slot0 + 1 > 0 then
		setActive(slot0._go, true)
		slot0._go.transform:SetAsLastSibling()
	end
end

function slot0.off(slot0)
	if slot0 > 0 and slot0 - 1 == 0 then
		setActive(slot0._go, false)
		setActive(slot0.indicator, false)
		pg.TimeMgr.GetInstance():RemoveTimer(slot0.delayTimer)

		slot0.delayTimer = nil
	end
end

function slot0.displayBG(slot0, slot1)
	setActive(slot0.bg, slot1)
	setActive(slot0.logo, slot1)

	slot2 = GetComponent(slot0.bg, "Image")

	if slot1 then
		if IsNil(slot2.sprite) then
			slot3 = "login"
			slot4 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y%m%d")

			for slot8, slot9 in ipairs(SPECIAL_DATE) do
				if slot9[1] == slot4 then
					slot3 = slot9[2]
				end
			end

			slot2.sprite = LoadSprite("loadingbg/" .. slot3)
		end
	else
		slot2.sprite = nil
	end
end

function slot0.getRetainCount(slot0)
	return slot0
end

return slot0
