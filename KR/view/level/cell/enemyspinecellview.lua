slot0 = class("EnemySpineCellView", import("view.level.cell.EnemyEggCellView"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot0.buffheight = 220

slot0.Update = function (slot0)
	slot2 = slot0.config
	slot3 = slot0.info.row
	slot4 = slot0.info.column

	if slot0.info.attachment == ChapterConst.AttachAmbush and slot1.flag == 2 then
	elseif slot1.flag == 0 then
		if slot0:UpdateGO(slot0._aliveTpl) then
			slot0.tf.anchoredPosition = Vector2(0, 0)

			SetActive(findTF(slot0.tf, "icon"), false)

			findTF(slot0.tf, "titleContain/bg_boss").localScale = Vector3(0.5, 0.5, 1)
			findTF(slot0.tf, "titleContain/bg_boss").anchoredPosition = Vector2(61.1, -30.6)

			slot0:GetSpine(slot2.icon, function (slot0)
				slot0:ReturnSpine()

				slot0.transform.localScale = Vector3(0.4 * slot0.ReturnSpine.scale * 0.01, 0.4 * slot0.ReturnSpine.scale * 0.01, 1)

				slot0.transform:GetComponent("SpineAnimUI"):SetAction(ChapterConst.ShipIdleAction, 0)

				slot0.transform:GetComponent("SkeletonGraphic").raycastTarget = false

				slot0.transform:SetParent(slot0.tf, false)
				slot0.transform:SetAsFirstSibling()

				slot0._loadedSpineName = slot1.icon
			end)
			slot0:ExtraUpdate(slot2)
		end

		setActive(findTF(slot0.tf, (slot1.attachment == ChapterConst.AttachBoss and "effect_found_boss") or "effect_found"), slot1.trait == ChapterConst.TraitVirgin)

		if slot1.trait == ChapterConst.TraitVirgin then
			playSoundEffect(SFX_UI_WEIGHANCHOR_ENEMY)
		end

		setActive(findTF(slot0.tf, "fighting"), slot0.chapter:existFleet(FleetType.Normal, slot3, slot4))
		setActive(findTF(slot0.tf, "damage_count"), slot1.data > 0)
	elseif slot1.flag == 1 and slot0:UpdateGO(slot0._deadTpl) and slot1.attachment ~= ChapterConst.AttachAmbush then
		setActive(slot0.tf:Find("huoqiubaozha"), slot0._live2death)

		slot0._live2death = nil
	end
end

slot0.ReturnSpine = function (slot0)
	if slot0._loadedSpineName and slot0._returnRequest["spine/" .. slot0._loadedSpineName] then
		slot0._returnRequest["spine/" .. slot0._loadedSpineName]:Start()

		slot0._returnRequest["spine/" .. slot0._loadedSpineName] = nil
	end

	slot0._loadedSpineName = nil
end

slot0.DestroyGO = function (slot0)
	slot0:ReturnSpine()
	slot0.super.DestroyGO(slot0)
end

slot0.Clear = function (slot0)
	if not IsNil(findTF(slot0.tf, "titleContain/bg_boss")) then
		slot1.localScale = Vector3.one
		slot1.anchoredPosition = Vector2(39.5, -23.2)
	end

	slot0.super.Clear(slot0)
end

return slot0
