slot0 = class("CommamderCard")

slot0.Ctor = function (slot0, slot1)
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.infoTF = slot0._tf:Find("info")
	slot0.emptyTF = slot0._tf:Find("empty")
	slot0.quitTF = slot0._tf:Find("quit")
	slot0.nameTF = slot0.infoTF:Find("name_bg/Text"):GetComponent(typeof(Text))
	slot0.levelTF = slot0.infoTF:Find("level_bg/Text"):GetComponent(typeof(Text))
	slot0.iconTF = slot0.infoTF:Find("icon")
	slot0.mark2 = slot0.infoTF:Find("mark1")
	slot0.mark1 = slot0.infoTF:Find("mark2")

	setActive(slot0.mark1, false)
	setActive(slot0.mark2, false)

	slot0.expUp = slot0._tf:Find("up")

	setActive(slot0.expUp, false)

	slot0.anim = slot0._tf:GetComponent("Animator")
	slot0.aniEvent = slot0._tf:GetComponent(typeof(DftAniEvent))
	slot0.formationTF = slot0.infoTF:Find("formation")

	setActive(slot0.formationTF, false)

	slot0.inbattleTF = slot0.infoTF:Find("inbattle")

	setActive(slot0.inbattleTF, false)
end

slot0.clearSelected = function (slot0)
	setActive(slot0.mark1, false)
	setActive(slot0.mark2, false)
	setActive(slot0.expUp, false)
end

slot0.selectedAnim = function (slot0)
	if slot0.anim then
		slot0.aniEvent:SetEndEvent(function (slot0)
			slot0.anim.enabled = false
		end)

		slot0.anim.enabled = true
	end
end

slot0.update = function (slot0, slot1)
	if slot1 then
		slot0.commanderVO = slot1

		if slot1.id ~= 0 then
			slot0:updateCommander()
		end
	end

	setActive(slot0.infoTF, slot1 and slot1.id ~= 0)
	setActive(slot0.emptyTF, not slot1)
	setActive(slot0.quitTF, slot1 and slot1.id == 0)
end

slot0.updateCommander = function (slot0)
	slot0.nameTF.text = slot0.commanderVO.getName(slot1)
	slot0.levelTF.text = slot0.commanderVO.level

	GetImageSpriteFromAtlasAsync("commandericon/" .. slot0.commanderVO.getPainting(slot1), "", slot0.iconTF)
end

slot0.clear = function (slot0)
	return
end

return slot0
