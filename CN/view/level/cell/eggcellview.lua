slot0 = class("EggCellView")

slot0.Ctor = function (slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot0.go.transform
	slot0.tf.anchorMin = Vector2(0.5, 0.5)
	slot0.tf.anchorMax = Vector2(0.5, 0.5)
	slot0.tf.pivot = Vector2(0.5, 0.5)
	slot0.tfShip = slot0.tf:Find("ship")
	slot0.validate = true
	slot0.tfFighting = slot0.tf:Find("fighting")
	slot0.tfEffectFound = slot0.tf:Find("effect_found")
	slot0.tfDamageCount = slot0.tf:Find("damage_count")
	slot0.tfBufficons = slot0.tf:Find("random_buff_container")
	slot0.tfEffectFound.transform.localPosition = Vector2(0, -12)
	slot0.level = 0
	slot0.enemyType = 1
end

slot0.getOrder = function (slot0)
	return 2
end

slot0.SetActive = function (slot0, slot1)
	slot0.go:SetActive(slot1)
end

slot0.getLine = function (slot0)
	return slot0.line
end

slot0.setLine = function (slot0, slot1)
	slot0.line = {
		row = slot1.row,
		column = slot1.column
	}
end

slot0.getPrefab = function (slot0)
	return slot0.prefab
end

slot0.setPrefab = function (slot0, slot1)
	slot0.prefab = slot1
end

slot0.setLevel = function (slot0, slot1)
	if not slot1 or slot1 <= 0 then
		return
	end

	slot0.level = slot1
end

slot0.setEnemyType = function (slot0, slot1)
	if not slot1 or slot1 <= 0 then
		return
	end

	slot0.enemyType = slot1
end

slot0.getAction = function (slot0)
	return
end

slot0.setAction = function (slot0)
	return
end

slot0.getModel = function (slot0)
	return slot0.model
end

slot0.setModel = function (slot0, slot1)
	slot1.transform.GetComponent(slot2, "Image").raycastTarget = false

	pg.ViewUtils.SetLayer(slot1.transform, Layer.UI)

	slot0.model = slot1
end

slot0.loadSpine = function (slot0, slot1)
	if slot0.lastPrefab == slot0:getPrefab() then
		if slot1 then
			slot1()
		end

		return
	end

	GetImageSpriteFromAtlasAsync("enemies/" .. slot2, "", slot4)
	setText(findTF(slot3, "lv/Text"), slot0.level)
	setActive(findTF(slot3, "titleContain/bg_s"), ChapterConst.EnemySize[slot0.enemyType] == 1)
	setActive(findTF(slot3, "titleContain/bg_m"), ChapterConst.EnemySize[slot0.enemyType] == 2)
	setActive(findTF(slot3, "titleContain/bg_h"), ChapterConst.EnemySize[slot0.enemyType] == 3)
	setActive(findTF(slot3, "titleContain/bg_boss"), ChapterConst.EnemySize[slot0.enemyType] == 99)
	slot0:setModel(slot4)

	slot0.lastPrefab = slot2

	if slot1 then
		slot1()
	end
end

slot0.clear = function (slot0)
	slot0.tf.anchorMin = Vector2(0.5, 0)
	slot0.tf.anchorMax = Vector2(0.5, 0)
	slot0.tf.pivot = Vector2(0.5, 0)
	slot0.tfEffectFound.transform.localPosition = Vector2(0, 38)
	slot0.prefab = nil
	slot0.anim = nil
	slot0.validate = nil
end

return slot0
