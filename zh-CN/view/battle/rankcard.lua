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
	slot0.rankVO = slot1
	slot0.nameTF.text = slot1.name
	slot2 = slot1.rank
	slot0.numberTF.text = slot2
	slot0.levelTxt.text = "Lv." .. slot1.lv

	setActive(slot0.NumImgTF, math.min(slot2 > 0 and slot2 or 4, 4) < 4)
	setImageSprite(slot0.frameTF, GetSpriteFromAtlas("billboardframe", "bg" .. slot3))
	setImageSprite(slot0.NumImgTF, GetSpriteFromAtlas("billboardframe", "bgn" .. slot3), true)

	slot4 = uv0[slot3]
	slot0.frameBgTF.color = Color.New(slot4[1], slot4[2], slot4[3])

	if slot0._type == uv1.TYPE_OTHER then
		setActive(slot0.numberTF, slot3 >= 4)

		slot0.scoreTF.text = setColorStr(slot1:getPowerTxt(), uv2[slot3])
	elseif slot0._type == uv1.TYPE_SELF then
		setActive(slot0.numberTF, slot2 ~= 0 and slot3 >= 4)
		setActive(slot0.notonlistTF, slot2 == 0)

		slot0.scoreTF.text = slot1:getPowerTxt()
	end

	slot5 = PowerRank:getScoreIcon(slot1.type)

	setActive(slot0.scoreIconTF, slot5)

	if slot5 then
		setImageSprite(slot0.scoreIconTF, GetSpriteFromAtlas(slot5[1], slot5[2]), true)
	end

	LoadImageSpriteAsync("emblem/" .. slot1.arenaRank, slot0.emblemTF)

	if not go(slot0.emblemTF).activeSelf then
		setActive(slot0.emblemTF, true)
	end

	updateDrop(slot0.iconTF, {
		type = DROP_TYPE_SHIP,
		id = slot1.icon,
		skinId = slot1.skinId,
		remoulded = slot1.remoulded,
		propose = slot1.proposeTime
	})

	if not go(slot0.iconTF).activeSelf then
		setActive(slot0.iconTF, true)
	end

	if not go(slot0._tf).activeSelf then
		setActive(slot0._tf, true)
	end

	TweenItemAlphaAndWhite(slot0._go)
end

function slot0.clear(slot0)
	setActive(slot0.notonlistTF, false)

	slot0.scoreTF.text = 0
	slot0.numberTF.text = 0
end

function slot0.dispose(slot0, ...)
end

return slot0
