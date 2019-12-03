ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = class("BattleAOEData")
ys.Battle.BattleAOEData = slot2
slot2.__name = "BattleAOEData"
slot2.ALIGNMENT_LEFT = "left"
slot2.ALIGNMENT_RIGHT = "right"
slot2.ALIGNMENT_MIDDLE = "middle"

slot2.Ctor = function (slot0, slot1, slot2, slot3, slot4)
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

slot2.StartTimer = function (slot0)
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

slot2.GetTimeRationExemptKey = function (slot0)
	return slot0._timeExemptKey
end

slot2.RemoveTimer = function (slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._lifeTimer)

	slot0._lifeTimer = nil
	slot0._flag = false
end

slot2.ClearCLDList = function (slot0)
	slot0._cldObjList = {}
end

slot2.AppendCldObj = function (slot0, slot1)
	slot0._cldObjList[#slot0._cldObjList + 1] = slot1
end

slot2.Settle = function (slot0)
	slot0.SortCldObjList(slot0._cldObjList)
	slot0._cldComponent:GetCldData().func(slot0._cldObjList)
end

slot2.SettleFinale = function (slot0)
	if slot0._endFunc then
		slot0.SortCldObjList(slot0._cldObjList)
		slot0._endFunc(slot0._cldObjList)
	end
end

slot2.SortCldObjList = function (slot0)
	table.sort(slot0, slot0._Fun_SortCldObjList)
end

slot2._Fun_SortCldObjList = function (slot0, slot1)
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

slot2.SetOpponentAffected = function (slot0, slot1)
	slot0._opponentAffected = slot1
end

slot2.OpponentAffected = function (slot0)
	return slot0._opponentAffected
end

slot2.GetActiveFlag = function (slot0)
	return slot0._flag
end

slot2.SetActiveFlag = function (slot0, slot1)
	slot0._flag = slot1
end

slot2.Dispose = function (slot0)
	slot0:RemoveTimer()

	slot0._cldObjList = nil
end

slot2.GetUniqueID = function (slot0)
	return slot0._areaUniqueID
end

slot2.GetIFF = function (slot0)
	return slot0._IFF
end

slot2.GetAreaType = function (slot0)
	return slot0._areaType
end

slot2.GetPosition = function (slot0)
	return slot0._pos
end

slot2.GetTickness = function (slot0)
	return slot0._tickness
end

slot2.GetLifeTime = function (slot0)
	return slot0._lifeTime
end

slot2.GetFieldType = function (slot0)
	return slot0._fieldType
end

slot2.GetCldFunc = function (slot0)
	return slot0._areaCldFunc
end

slot2.GetHeight = function (slot0)
	return slot0._height
end

slot2.GetWidth = function (slot0)
	return slot0._width
end

slot2.GetAngle = function (slot0)
	return slot0._angle
end

slot2.GetRange = function (slot0)
	return slot0._range
end

slot2.SetAreaType = function (slot0, slot1)
	slot0._areaType = slot1

	slot0:InitCldComponent()
end

slot2.SetPosition = function (slot0, slot1)
	slot0._pos = slot1
end

slot2.SetTickness = function (slot0, slot1)
	slot0._tickness = slot1
end

slot2.SetFieldType = function (slot0, slot1)
	slot0._fieldType = slot1
end

slot2.SetLifeTime = function (slot0, slot1)
	slot0._lifeTime = slot1
end

slot2.SetHeight = function (slot0, slot1)
	slot0._height = slot1
end

slot2.SetWidth = function (slot0, slot1)
	slot0._width = slot1
end

slot2.SetAngle = function (slot0, slot1)
	slot0._angle = slot1
end

slot2.SetRange = function (slot0, slot1)
	slot0._range = slot1
end

slot2.SetAnchorPointAlignment = function (slot0, slot1)
	if slot1 == slot0.ALIGNMENT_LEFT then
		slot0._alignment = Vector3(slot0._width * 0.5, 0, 0)
	elseif slot1 == slot0.ALIGNMENT_RIGHT then
		slot0._alignment = Vector3(slot0._width * -0.5, 0, 0)
	end
end

slot2.InitCldComponent = function (slot0)
	if slot0._areaType == slot0.AreaType.CUBE then
		slot0._cldComponent = slot1.Battle.BattleCubeCldComponent.New(slot0._width, slot0._tickness, slot0._height, 0, 0)
	elseif slot0._areaType == slot0.AreaType.COLUMN then
		slot0._cldComponent = slot1.Battle.BattleColumnCldComponent.New(slot0._range, slot0._tickness)
	end

	slot0._cldComponent:SetCldData(slot1)
	slot0._cldComponent:SetActive(true)
end

slot2.DeactiveCldBox = function (slot0)
	slot0._cldComponent:SetActive(false)
end

slot2.GetCldBox = function (slot0)
	return slot0._cldComponent:GetCldBox(slot0:GetPosition() + slot0._alignment)
end

slot2.GetCldData = function (slot0)
	return slot0._cldComponent:GetCldData()
end

return
