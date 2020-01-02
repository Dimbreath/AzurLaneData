ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleMainFleetCharacter", ys.Battle.BattlePlayerCharacter)
ys.Battle.BattleMainFleetCharacter = slot3
slot3.__name = "BattleMainFleetCharacter"

function slot3.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot3.Update(slot0)
	slot0.super.Update(slot0)
	slot0:UpdateArrowBarPostition()
end

function slot3.AddArrowBar(slot0, slot1)
	slot0.super.AddArrowBar(slot0, slot1)
	setImageSprite(findTF(slot0._arrowBar, "icon"), LoadSprite("qicon/" .. slot0._unitData:GetTemplate().painting) or LoadSprite("heroicon/unknown"))
end

function slot3.UpdateHPBarPostition(slot0)
	if not slot0._inViewArea then
		slot0.super.UpdateHPBarPostition(slot0)
	end
end

function slot3.GetReferenceVector(slot0, slot1)
	if not slot0._inViewArea then
		return slot0.super.GetReferenceVector(slot0, slot1)
	else
		return slot0._arrowVector
	end
end

return
