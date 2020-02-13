slot0 = class("FavoriteCard")

function slot0.Ctor(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.tr = tf(slot1)
	slot0.charTpl = slot2
	slot0.charContainer = slot0.tr:Find("char_list")
	slot0.isInitChar = false
	slot0.maxStar = 0
	slot0.nameTF = slot0.tr:Find("bonus/name_bg/Text"):GetComponent(typeof(Text))
	slot0.unfinish = slot0.tr:Find("bonus/item_tpl/unfinish")
	slot0.get = slot0.tr:Find("bonus/item_tpl/get")
	slot0.got = slot0.tr:Find("bonus/item_tpl/got")
	slot0.lock = slot0.tr:Find("bonus/item_tpl/lock")
	slot0.tip = slot0.tr:Find("bonus/item_tpl/tip")
	slot0.starCount = slot0.tr:Find("bonus/process"):GetComponent(typeof(Text))
	slot0.awardTF = slot0.tr:Find("bonus/item_tpl")
	slot0.iconTF = slot0.awardTF:Find("icon_bg")
	slot0.box = slot0.tr:Find("box")
end

function slot1(slot0)
	return {
		go = slot0,
		tr = tf(slot0),
		icon = ()["tr"]:Find("icon"),
		iconImg = ()["icon"]:GetComponent(typeof(Image)),
		stars = findTF(()["tr"], "stars"),
		starTpl = findTF(()["stars"], "star"),
		name = findTF(()["tr"], "name"):GetComponent(typeof(Text)),
		unkonwn = findTF(()["tr"], "unkonwn"),
		update = function (slot0, slot1, slot2)
			slot0.name.text = slot1:getConfig("name")

			LoadSpriteAsync("shipmodels/" .. Ship.getPaintingName(slot1.configId), function (slot0)
				if slot0 then
					rtf(slot0.icon).pivot = getSpritePivot(slot0)
					rtf(slot0.icon).iconImg.sprite = slot0

					rtf(slot0.icon).iconImg.iconImg:SetNativeSize()

					slot0.icon.localPosition = Vector3(0, -85, 0)

					setActive(slot1.iconImg, true)
				end
			end)
			setActive(slot0.stars, slot2)

			if slot2 then
				setImageColor(slot0.icon, Color.New(1, 1, 1, 1))

				for slot7 = slot0.stars.childCount + 1, slot1:getMaxStar(), 1 do
					cloneTplTo(slot0.starTpl, slot0.stars)
				end

				slot4 = {
					[4] = {
						1,
						2,
						3,
						4
					},
					[5] = {
						1,
						2,
						5,
						3,
						4
					},
					[6] = {
						1,
						2,
						5,
						6,
						3,
						4
					}
				}

				for slot8 = 1, 6, 1 do
					setActive(findTF(slot0.stars, "star_" .. slot8), slot8 <= slot3)
					setActive(slot9:Find("startpl"), false)
				end

				slot5 = slot4[slot3]

				for slot9 = 1, slot3, 1 do
					setActive(findTF(slot0.stars, "star_" .. slot5[slot9]).Find(slot10, "startpl"), slot9 <= slot2.star)
				end
			else
				setImageColor(slot0.icon, Color.New(0, 0, 0, 0.7))
			end

			setActive(slot0.unkonwn, not slot2)
		end
	}
end

function slot0.update(slot0, slot1, slot2, slot3)
	slot0.favoriteVO = slot1
	slot0.shipGroups = slot2
	slot0.awards = slot3
	slot4 = {}

	for slot9 = slot0.charContainer.childCount, #slot1:getConfig("char_list") - 1, 1 do
		cloneTplTo(slot0.charTpl, slot0.charContainer)
	end

	for slot9 = 0, slot0.charContainer.childCount - 1, 1 do
		setActive(slot0.charContainer:GetChild(slot9), slot9 < #slot5)

		slot11 = slot5[slot9 + 1]

		if slot9 < #slot5 then
			slot4[slot11] = slot0(slot10)
		end
	end

	slot6 = 0
	slot7 = 0

	for slot11, slot12 in pairs(slot4) do
		slot12:update(Ship.New({
			configId = slot11 * 10 + 1
		}), slot2[slot11])

		slot6 = slot6 + ((slot2[slot11] and slot2[slot11].star) or 0)
		slot7 = slot7 + slot14:getMaxStar()
	end

	slot0.nameTF.text = slot1:getConfig("name")

	slot0:updateBound()
end

function slot0.updateBound(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-25, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-36, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 40-47, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 51-58, warpins: 2 ---
	slot0.state = slot0.favoriteVO:getState(slot0.shipGroups, slot0.awards)
	slot1 = setActive
	slot2 = slot0.unfinish

	if slot0.state ~= Favorite.STATE_WAIT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.get

	if slot0.state ~= Favorite.STATE_AWARD then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-27, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.got

	if slot0.state ~= Favorite.STATE_FETCHED then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-38, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-39, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.lock

	if slot0.state ~= Favorite.STATE_LOCK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-49, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-50, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.tip
	slot3 = slot0.state == Favorite.STATE_AWARD

	setActive(slot2, slot3)
	updateDrop(slot0.awardTF, {
		type = (slot0.favoriteVO:getConfig("award_display")[slot0.favoriteVO:getNextAwardIndex(slot0.awards)] and slot2[setActive]) or slot2[#slot2][1],
		id = (slot0.favoriteVO.getConfig("award_display")[slot0.favoriteVO.getNextAwardIndex(slot0.awards)] and slot2[setActive]) or slot2[#slot2][2],
		count = (slot0.favoriteVO.getConfig("award_display")[slot0.favoriteVO.getNextAwardIndex(slot0.awards)] and slot2[setActive]) or slot2[#slot2][3]
	})

	slot0.starCount.text = slot0.favoriteVO:getStarCount(slot0.shipGroups) .. "/" .. (slot0.favoriteVO:getConfig("level")[slot1] or slot4[#slot4])

	return

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 59-60, warpins: 1 ---
	slot3 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-61, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 62-75, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 76-78, warpins: 1 ---
	if not slot2[setActive] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-80, warpins: 2 ---
		slot3 = slot2[#slot2]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 81-106, warpins: 2 ---
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #9 107-108, warpins: 1 ---
	slot9 = slot4[#slot4]
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 109-111, warpins: 2 ---
	--- END OF BLOCK #10 ---



end

return slot0
