slot0 = class("EnemyEggCellView", import("view.level.cell.StaticCellView"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.config = nil
	slot0.chapter = nil
	slot0._live2death = nil
	slot0._loadedSpineName = nil
end

slot0.SetTpl = function (slot0, slot1, slot2)
	slot0._aliveTpl = slot1
	slot0._deadTpl = slot2
end

slot0.Update = function (slot0)
	slot2 = slot0.config
	slot3 = slot0.info.row
	slot4 = slot0.info.column

	if slot0.info.attachment == ChapterConst.AttachAmbush and slot1.flag == 2 then
	elseif slot1.flag == 0 then
		if slot0:UpdateGO(slot0._aliveTpl) then
			slot0.tf.anchoredPosition = Vector2(0, 0)

			slot0:LoadSprite("enemies/" .. slot2.icon, nil, slot0.tf:Find("icon"))
			setText(findTF(slot0.tf, "lv/Text"), slot2.level)
			setActive(findTF(slot0.tf, "titleContain/bg_s"), ChapterConst.EnemySize[slot2.type] == 1 or not ChapterConst.EnemySize[slot2.type])
			setActive(findTF(slot0.tf, "titleContain/bg_m"), ChapterConst.EnemySize[slot2.type] == 2)
			setActive(findTF(slot0.tf, "titleContain/bg_h"), ChapterConst.EnemySize[slot2.type] == 3)
			setActive(findTF(slot0.tf, "titleContain/bg_boss"), ChapterConst.EnemySize[slot2.type] == 99)
			slot0:ExtraUpdate(slot2)
		end

		setActive(findTF(slot0.tf, (slot1.attachment == ChapterConst.AttachBoss and "effect_found_boss") or "effect_found"), slot1.trait == ChapterConst.TraitVirgin)

		if slot1.trait == ChapterConst.TraitVirgin then
			playSoundEffect(SFX_UI_WEIGHANCHOR_ENEMY)
		end

		setActive(findTF(slot0.tf, "fighting"), slot0.chapter:existFleet(FleetType.Normal, slot3, slot4))

		slot0.tf:GetComponent("Animator").enabled = slot1.data > 0

		setActive(findTF(slot0.tf, "damage_count"), slot1.data > 0)
	elseif slot1.flag == 1 and slot0:UpdateGO(slot0._deadTpl) and slot1.attachment ~= ChapterConst.AttachAmbush then
		if slot2.icon_type == 1 then
			slot0.tf.anchoredPosition = Vector2(0, 10)

			slot0:LoadSprite("enemies/" .. slot2.icon .. "_d_" .. slot6, "", slot0.tf:Find("icon"))
			setActive(slot0.tf:Find("effect_not_open"), false)
			setActive(slot0.tf:Find("effect_open"), false)
		end

		setActive(slot0.tf:Find("huoqiubaozha"), slot0._live2death)

		slot0._live2death = nil
	end
end

slot0.UpdateGO = function (slot0, slot1)
	if slot1 and slot0._currentTpl ~= slot1 then
		if slot0._currentTpl == slot0._aliveTpl and slot1 == slot0._deadTpl then
			slot0._live2death = true
		end

		slot0:DestroyGO()

		slot0._currentTpl = slot1

		if slot1 == slot0._deadTpl and (slot0.info.attachment == ChapterConst.AttachAmbush or slot0.info.icon_type == 2) then
			return true
		end

		slot0.go = Instantiate(slot1)
		slot0.go.name = "enemy_" .. slot0.info.attachmentId

		setActive(slot0.go, true)
		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform

		return true
	end

	return false
end

slot0.buffheight = 100

slot0.ExtraUpdate = function (slot0, slot1)
	if slot1.effect_prefab and #slot2 > 0 then
		slot0:LoadPrefab("effect/" .. slot2, slot2, function (slot0)
			slot0.transform:SetParent(slot0.tf, false)

			slot0.transform.localScale = slot0.transform.localScale
		end)
	end

	if findTF(slot0.tf, "random_buff_container") and slot1 and #slot1.bufficon > 0 then
		setActive(slot3, true)
		slot0:AlignListContainer(slot3, #slot1.bufficon)

		slot3.sizeDelta = Vector2(100, slot0.buffheight)
		slot4 = 1

		for slot8, slot9 in ipairs(slot1.bufficon) do
			if #slot9 > 0 then
				GetImageSpriteFromAtlasAsync("ui/levelmainscene_atlas", slot9, slot3:GetChild(slot4 - 1))

				slot4 = slot4 + 1
			end
		end
	elseif slot3 then
		setActive(slot3, false)
	end
end

slot0.AlignListContainer = function (slot0, slot1, slot2)
	for slot7 = slot2, slot1.childCount - 1, 1 do
		setActive(slot1:GetChild(slot7), false)
	end

	for slot7 = slot3, slot2 - 1, 1 do
		slot8 = cloneTplTo(slot1:GetChild(0), slot1)
	end

	for slot7 = 0, slot2 - 1, 1 do
		setActive(slot1:GetChild(slot7), true)
	end
end

slot0.Clear = function (slot0)
	slot0._aliveTpl = nil
	slot0._deadTpl = nil
	slot0._live2death = nil
	slot0.chapter = nil

	slot0.super.Clear(slot0)
end

return slot0
