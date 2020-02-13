slot0 = class("RankCard")
slot0.TYPE_SELF = 1
slot0.TYPE_OTHER = 2
slot1 = {
	"#ffde5c",
	"#95b0f9",
	"#cfc1ba",
	"#797d81"
}
slot2 = {
	{
		1,
		0.8705882352941177,
		0.3607843137254902
	},
	{
		0.5843137254901961,
		0.6901960784313725,
		0.9764705882352941
	},
	{
		0.8117647058823529,
		0.7568627450980392,
		0.7294117647058823
	},
	{
		0.4745098039215686,
		0.49019607843137253,
		0.5058823529411764
	}
}

function slot0.Ctor(slot0, slot1, slot2)
	slot0._go = go(slot1)
	slot0._tf = slot1
	slot0._type = slot2
	slot0.frameTF = findTF(slot0._tf, "frame")
	slot0.frameBgTF = findTF(slot0._tf, "frame/bg"):GetComponent(typeof(Image))
	slot0.NumImgTF = findTF(slot0._tf, "frame/number_img")
	slot0.nameTF = findTF(slot0._tf, "frame/name"):GetComponent(typeof(Text))
	slot0.numberTF = findTF(slot0._tf, "frame/number"):GetComponent(typeof(Text))
	slot0.notonlistTF = findTF(slot0._tf, "frame/notonlist")
	slot0.scoreTF = findTF(slot0._tf, "frame/score"):GetComponent(typeof(Text))
	slot0.emblemTF = findTF(slot0._tf, "frame/emblem")
	slot0.scoreIconTF = findTF(slot0._tf, "frame/score_icon"):GetComponent(typeof(Image))
	slot0.iconTF = findTF(slot0._tf, "icon")
	slot0.levelTxt = findTF(slot0.iconTF, "level_bg/Text"):GetComponent(typeof(Text))
end

function slot0.update(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0.rankVO = slot1
	slot0.nameTF.text = slot1.name
	slot0.numberTF.text = slot1.rank
	slot3 = math.min
	slot4 = (slot1.rank > 0 and slot2) or 4
	slot0.levelTxt.text = "Lv." .. slot1.lv

	setActive(slot0.NumImgTF, math.min(setActive, 4) < 4)
	setImageSprite(slot0.frameTF, GetSpriteFromAtlas("billboardframe", "bg" .. math.min))
	setImageSprite(slot0.NumImgTF, GetSpriteFromAtlas("billboardframe", "bgn" .. math.min), true)

	slot0.frameBgTF.color = Color.New(slot0[math.min][1], slot0[math.min][2], slot0[math.min][3])

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-14, warpins: 1 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 2 ---
		slot4 = 4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-27, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-29, warpins: 1 ---
	slot6 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-30, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 31-65, warpins: 2 ---
	if slot0._type == slot1.TYPE_OTHER then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-70, warpins: 1 ---
		setActive(slot0.numberTF, slot3 >= 4)

		slot0.scoreTF.text = setColorStr(slot1:getPowerTxt(), slot2[slot3])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 71-72, warpins: 1 ---
		slot7 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-73, warpins: 1 ---
			slot7 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 74-84, warpins: 2 ---
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-89, warpins: 1 ---
		if slot0._type == slot1.TYPE_SELF then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 90-93, warpins: 1 ---
			setActive(slot0.numberTF, slot2 ~= 0 and slot3 >= 4)
			setActive(slot0.notonlistTF, slot2 == 0)

			slot0.scoreTF.text = slot1:getPowerTxt()

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #1 94-96, warpins: 1 ---
			if slot3 < 4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 97-98, warpins: 2 ---
				slot7 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 99-99, warpins: 1 ---
				slot7 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 100-104, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #3 105-106, warpins: 1 ---
			slot7 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 107-107, warpins: 1 ---
				slot7 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 108-113, warpins: 2 ---
			--- END OF BLOCK #4 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 114-124, warpins: 3 ---
	setActive(slot0.scoreIconTF, PowerRank:getScoreIcon(slot1.type))

	if PowerRank.getScoreIcon(slot1.type) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 125-132, warpins: 1 ---
		setImageSprite(slot0.scoreIconTF, GetSpriteFromAtlas(slot5[1], slot5[2]), true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 133-144, warpins: 2 ---
	LoadImageSpriteAsync("emblem/" .. slot1.arenaRank, slot0.emblemTF)

	if not go(slot0.emblemTF).activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 145-148, warpins: 1 ---
		setActive(slot0.emblemTF, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 149-168, warpins: 2 ---
	updateDrop(slot0.iconTF, {
		type = DROP_TYPE_SHIP,
		id = slot1.icon,
		skinId = slot1.skinId,
		remoulded = slot1.remoulded,
		propose = slot1.proposeTime
	})

	if not go(slot0.iconTF).activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 169-172, warpins: 1 ---
		setActive(slot0.iconTF, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 173-178, warpins: 2 ---
	if not go(slot0._tf).activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 179-182, warpins: 1 ---
		setActive(slot0._tf, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 183-186, warpins: 2 ---
	TweenItemAlphaAndWhite(slot0._go)

	return
	--- END OF BLOCK #9 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	setActive(slot0.notonlistTF, false)

	slot0.scoreTF.text = 0
	slot0.numberTF.text = 0

	return
	--- END OF BLOCK #0 ---



end

function slot0.dispose(slot0, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

return slot0
