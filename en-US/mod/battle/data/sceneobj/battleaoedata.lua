ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = class("BattleAOEData")
ys.Battle.BattleAOEData = slot2
slot2.__name = "BattleAOEData"
slot2.ALIGNMENT_LEFT = "left"
slot2.ALIGNMENT_RIGHT = "right"
slot2.ALIGNMENT_MIDDLE = "middle"

function slot2.Ctor(slot0, slot1, slot2, slot3, slot4)
	slot0._areaUniqueID = slot1
	slot0._areaCldFunc = slot3
	slot0._endFunc = slot4
	slot0._IFF = slot2
	slot0._cldObjList = {}

	slot0:SetTickness(10)

	slot0._alignment = Vector3.zero
	slot0._angle = 0
	slot0._timeExemptKey = "aoe_" .. slot0._areaUniqueID
end

function slot2.StartTimer(slot0)
	if slot0._lifeTime == -1 then
		slot0._flag = false

		return
	end

	slot0._flag = true

	if slot0._lifeTime > 0 then
		slot0._lifeTimer = pg.TimeMgr.GetInstance():AddBattleTimer("areaTimer", 0, slot0._lifeTime, function ()
			slot0:RemoveTimer()
		end, true)
	end
end

function slot2.GetTimeRationExemptKey(slot0)
	return slot0._timeExemptKey
end

function slot2.RemoveTimer(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._lifeTimer)

	slot0._lifeTimer = nil
	slot0._flag = false
end

function slot2.ClearCLDList(slot0)
	slot0._cldObjList = {}
end

function slot2.AppendCldObj(slot0, slot1)
	slot0._cldObjList[#slot0._cldObjList + 1] = slot1
end

function slot2.Settle(slot0)
	slot0.SortCldObjList(slot0._cldObjList)
	slot0._cldComponent:GetCldData().func(slot0._cldObjList)
end

function slot2.SettleFinale(slot0)
	if slot0._endFunc then
		slot0.SortCldObjList(slot0._cldObjList)
		slot0._endFunc(slot0._cldObjList)
	end
end

function slot2.SortCldObjList(slot0)
	table.sort(slot0, slot0._Fun_SortCldObjList)
end

function slot2._Fun_SortCldObjList(slot0, slot1)
	if slot0.IsBoss ~= slot1.IsBoss then
		if slot1.IsBoss then
			return true
		else
			return false
		end
	else
		return slot0.UID < slot1.UID
	end
end

function slot2.SetOpponentAffected(slot0, slot1)
	slot0._opponentAffected = slot1
end

function slot2.OpponentAffected(slot0)
	return slot0._opponentAffected
end

function slot2.GetActiveFlag(slot0)
	return slot0._flag
end

function slot2.SetActiveFlag(slot0, slot1)
	slot0._flag = slot1
end

function slot2.Dispose(slot0)
	slot0:RemoveTimer()

	slot0._cldObjList = nil
end

function slot2.GetUniqueID(slot0)
	return slot0._areaUniqueID
end

function slot2.GetIFF(slot0)
	return slot0._IFF
end

function slot2.GetAreaType(slot0)
	return slot0._areaType
end

function slot2.GetPosition(slot0)
	return slot0._pos
end

function slot2.GetTickness(slot0)
	return slot0._tickness
end

function slot2.GetLifeTime(slot0)
	return slot0._lifeTime
end

function slot2.GetFieldType(slot0)
	return slot0._fieldType
end

function slot2.GetCldFunc(slot0)
	return slot0._areaCldFunc
end

function slot2.GetHeight(slot0)
	return slot0._height
end

function slot2.GetWidth(slot0)
	return slot0._width
end

function slot2.GetAngle(slot0)
	return slot0._angle
end

function slot2.GetRange(slot0)
	return slot0._range
end

function slot2.SetAreaType(slot0, slot1)
	slot0._areaType = slot1

	slot0:InitCldComponent()
end

function slot2.SetPosition(slot0, slot1)
	slot0._pos = slot1
end

function slot2.SetTickness(slot0, slot1)
	slot0._tickness = slot1
end

function slot2.SetFieldType(slot0, slot1)
	slot0._fieldType = slot1
end

function slot2.SetLifeTime(slot0, slot1)
	slot0._lifeTime = slot1
end

function slot2.SetHeight(slot0, slot1)
	slot0._height = slot1
end

function slot2.SetWidth(slot0, slot1)
	slot0._width = slot1
end

function slot2.SetAngle(slot0, slot1)
	slot0._angle = slot1
end

function slot2.SetRange(slot0, slot1)
	slot0._range = slot1
end

function slot2.SetAnchorPointAlignment(slot0, slot1)
	if slot1 == slot0.ALIGNMENT_LEFT then
		slot0._alignment = Vector3(slot0._width * 0.5, 0, 0)
	elseif slot1 == slot0.ALIGNMENT_RIGHT then
		slot0._alignment = Vector3(slot0._width * -0.5, 0, 0)
	end
end

function slot2.GetFXStatic(slot0)
	return slot0._fxStatic
end

function slot2.SetFXStatic(slot0, slot1)
	slot0._fxStatic = slot1
end

function slot2.InitCldComponent(slot0)
	if slot0._areaType == slot0.AreaType.CUBE then
		slot0._cldComponent = slot1.Battle.BattleCubeCldComponent.New(slot0._width, slot0._tickness, slot0._height, 0, 0)
	elseif slot0._areaType == slot0.AreaType.COLUMN then
		slot0._cldComponent = slot1.Battle.BattleColumnCldComponent.New(slot0._range, slot0._tickness)
	end

	slot0._cldComponent:SetCldData(slot1)
	slot0._cldComponent:SetActive(true)
end

function slot2.DeactiveCldBox(slot0)
	slot0._cldComponent:SetActive(false)
end

function slot2.GetCldBox(slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition() + slot0._alignment)
end

function slot2.GetCldData(slot0)
	return slot0._cldComponent:GetCldData()
end

return
