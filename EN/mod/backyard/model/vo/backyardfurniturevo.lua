slot0 = class("BackyardFurnitureVO")
slot0.FLOOR = 1
slot0.WALL_DIR_ALL = 2
slot0.WALL_DIR_RIGHT = 4
slot0.WALL_DIR_LEFT = 3
slot0.INTERACTION_LOOP_TYPE_ALL = 1
slot0.INTERACTION_LOOP_TYPE_LAST_ONE = 2

slot0.getWallDir = function (slot0)
	if slot0.y - slot0.x >= 1 then
		return BackYardConst.BACKYARD_WALL_DIR_LEFT
	else
		return BackYardConst.BACKYARD_WALL_DIR_RIGHT
	end
end

slot0.getCloneId = function (slot0, slot1)
	return slot0.configId * 10000000 + slot1
end

slot0.isRightWall = function (slot0)
	return slot0:getWallDir() == BackYardConst.BACKYARD_WALL_DIR_RIGHT
end

slot0.Ctor = function (slot0, slot1)
	slot0.id = tonumber(slot1.id)
	slot0.configId = slot1.configId or tonumber(slot1.id)
	slot0.position = slot1.position
	slot0.dir = slot1.dir or 1
	slot0.parent = slot1.parent or 0
	slot0.preGrids = {}
	slot0.bottomGrids = {}
	slot0.child = slot1.child or {}
	slot0.shipIds = slot1.ships or {}
	slot0.date = slot1.date or 0
	slot0.floor = slot1.floor
	slot0.spineId = nil
	slot0.spineExtra = {}
	slot0.stageShips = {}
end

slot0.hasChild = function (slot0)
	return table.getCount(slot0.child) > 0
end

slot0.existVoice = function (slot0)
	if slot0:isShowDesc() then
		return slot0:getConfig("can_trigger")[2] ~= nil
	end
end

slot0.getVoice = function (slot0)
	if slot0:existVoice() then
		return slot0:getConfig("can_trigger")[2]
	end
end

slot0.GetVoiceAnim = function (slot0)
	if slot0:isSpine() and slot0:existVoice() then
		return "normal", slot0:getConfig("can_trigger")[3], slot0.getConfig("can_trigger")[4]
	end
end

slot0.getShipExtra = function (slot0)
	return slot0.spineExtra
end

slot0.isTransPort = function (slot0)
	return slot0:getConfig("type") == Furniture.TYPE_TRANSPORT
end

slot0.getTransportPoint = function (slot0)
	if slot0:isTransPort() then
		slot1 = slot0:getConfig("spine")[3][1]

		if slot0.dir == 1 then
			return Vector2(slot0.position.x + slot1[1], slot0.position.y + slot1[2])
		elseif slot0.dir == 2 then
			return Vector2(slot0.position.x + slot1[2], slot0.position.y + slot1[1])
		end
	end
end

slot0.getTransportAnims = function (slot0, slot1)
	if slot0:isTransPort() then
		return slot0:getConfig("spine")[3][2][slot1]
	end
end

slot0.canInterActionSpineExtra = function (slot0)
	return slot0:getCurrSpineCnt() < slot0:getSpineMaxCnt()
end

slot0.getSpineMaxCnt = function (slot0)
	if slot0:isTransPort() then
		return 2
	end

	slot1 = 0

	if slot0:isSpine() then
		slot1 = slot1 + 1

		if slot0:getConfig("spine_extra") and type(slot2) == "table" then
			slot1 = slot1 + table.getCount(slot2)
		end
	end

	return slot1
end

slot0.getCurrSpineCnt = function (slot0)
	slot1 = 0

	if slot0.spineId then
		slot1 = slot1 + 1
	end

	return slot1 + table.getCount(slot0.spineExtra)
end

slot0.addSpineExtra = function (slot0, slot1)
	slot3 = -1

	for slot7 = 1, slot0:getSpineMaxCnt(), 1 do
		if not slot0.spineExtra[slot7] then
			slot3 = slot7

			break
		end
	end

	slot0.spineExtra[slot3] = slot1

	return slot3
end

slot0.getUniqueShipAction = function (slot0, slot1, slot2)
	if slot0:getConfig("spine_action_replace") == "" or #slot3 == 0 then
		return
	end

	if _.detect(slot3, function (slot0)
		return _.any(slot0[2], function (slot0)
			return slot0 == slot0
		end) and slot1 == slot0[1]
	end) then
		return slot4[3]
	end
end

slot0.getSpineExtraConfig = function (slot0, slot1)
	if slot0:isSpine() then
		return slot0:getConfig("spine_extra")[slot1]
	end
end

slot0.removeSpineExtra = function (slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.spineExtra) do
		if slot7 == slot1 then
			slot0.spineExtra[slot6] = nil
			slot2 = slot6
		end
	end

	return slot2
end

slot0.hasSpineExtra = function (slot0)
	return table.getCount(slot0.spineExtra) ~= 0
end

slot0.clearInterActions = function (slot0)
	slot0.spineId = nil
	slot0.stageShips = {}
	slot0.shipIds = {}
	slot0.spineExtra = {}
end

slot0.canInterActionShipGroup = function (slot0, slot1)
	if #slot0:interActionGroup() == 0 then
		return true
	end

	return table.contains(slot2, slot1)
end

slot0.getBgm = function (slot0)
	if slot0:getConfig("interaction_bgm") and slot1 ~= "" then
		return slot1
	end
end

slot0.interActionGroup = function (slot0)
	slot1 = {}

	if slot0:getConfig("interAction_group") and type(slot2) == "table" then
		slot1 = slot2
	end

	return slot1
end

slot0.setStageShip = function (slot0, slot1)
	if not table.contains(slot0.stageShips, slot1) then
		table.insert(slot0.stageShips, slot1)
	end
end

slot0.clearStageShip = function (slot0, slot1)
	if table.indexof(slot0.stageShips, slot1) then
		table.remove(slot0.stageShips, slot2)
	end
end

slot0.getStageShip = function (slot0)
	return slot0.stageShips
end

slot0.hasStageShip = function (slot0)
	return #slot0.stageShips > 0
end

slot0.isLock = function (slot0)
	return slot0.spineId ~= nil
end

slot0.setSpineId = function (slot0, slot1)
	slot0.spineId = slot1
end

slot0.getSpineId = function (slot0)
	return slot0.spineId
end

slot0.isSpine = function (slot0)
	return slot0:getConfig("spine") ~= nil
end

slot0.getInterActionSpineCfg = function (slot0)
	if slot0:isSpine() then
		return slot0:getConfig("spine")[3]
	end
end

slot0.isInterActionSpine = function (slot0)
	if slot0:isTransPort() then
		return true
	end

	return slot0:getInterActionSpineCfg() ~= nil and #slot1 > 0
end

slot0.canInterActionSpine = function (slot0)
	return slot0:isInterActionSpine() and not slot0.spineId
end

slot0.getSpineAnims = function (slot0)
	if slot0:isInterActionSpine() then
		return slot0:getInterActionSpineCfg()[2]
	end
end

slot0.canRotate = function (slot0)
	return slot0:getConfig("can_rotate") == 0
end

slot0.getBreakAnim = function (slot0)
	if slot0:isSpine() then
		return slot0:getInterActionSpineCfg()[3][1]
	end
end

slot0.isFollowFurnitrueAnim = function (slot0)
	if slot0:isSpine() then
		return slot0:getInterActionSpineCfg()[3][2]
	end
end

slot0.getPreheatAnim = function (slot0)
	if slot0:isSpine() then
		return slot0:getInterActionSpineCfg()[3][3]
	end
end

slot0.hasTailAction = function (slot0)
	return slot0:getTailAction() ~= nil
end

slot0.getTailAction = function (slot0)
	if slot0:isSpine() then
		return slot0:getInterActionSpineCfg()[3][4]
	end
end

slot0.hasEndAnimName = function (slot0)
	return slot0:getEndAnimName() ~= nil
end

slot0.getEndAnimName = function (slot0)
	if slot0:isSpine() then
		return slot0:getInterActionSpineCfg()[3][5]
	end
end

slot0.hasAnimatorMask = function (slot0)
	return slot0:getConfig("animator") and slot1[3]
end

slot0.getAnimatorMaskConfig = function (slot0)
	if slot0:hasAnimatorMask() then
		return slot0:getConfig("animator")[3]
	end
end

slot0.getSpineName = function (slot0)
	if slot0:isSpine() then
		return slot0:getConfig("spine")[1][1], slot0.getConfig("spine")[1][2]
	end
end

slot0.getSpineMaskName = function (slot0)
	if slot0:hasSpineMask() then
		return slot0:getConfig("spine")[2][1], slot0.getConfig("spine")[2][2]
	end
end

slot0.hasSpineMask = function (slot0)
	if slot0:isSpine() then
		return slot0:getConfig("spine")[2] ~= nil and #slot1 > 0
	end
end

slot0.hasSpineShipBodyMask = function (slot0)
	if slot0:isSpine() then
		return slot0:getConfig("spine")[4] ~= nil and #slot1 > 0
	end
end

slot0.getSpineShipBodyMask = function (slot0)
	if slot0:hasSpineShipBodyMask() then
		return slot0:getConfig("spine")[4]
	end
end

slot0.getSpineExtraBodyMask = function (slot0, slot1)
	if slot0:hasSpineExtra() then
		return slot0:getConfig("spine_extra")[slot1][1]
	end
end

slot0.getSpineAinTriggerPos = function (slot0)
	if slot0:isInterActionSpine() then
		slot1 = slot0:getInterActionSpineCfg()[1]

		if slot0.dir == 1 then
			return Vector2(slot0.position.x + slot1[1], slot0.position.y + slot1[2])
		elseif slot0.dir == 2 then
			return Vector2(slot0.position.x + slot1[2], slot0.position.y + slot1[1])
		end
	end
end

slot0.getSpineAniPos = function (slot0)
	if slot0:isInterActionSpine() then
		if slot0:getConfig("spine")[5] and #slot1 > 0 then
			return Vector3(slot1[1], slot1[2], 0)
		end

		return nil
	end
end

slot0.getSpineAniScale = function (slot0)
	if slot0:isInterActionSpine() and slot0:getConfig("spine")[6] and #slot1 > 0 then
		return slot1[1]
	end

	return 1
end

slot0.getSpineSpeed = function (slot0)
	if slot0:isInterActionSpine() then
		return slot0:getConfig("spine")[7] or 1
	end

	return 1
end

slot0.isLoopSpineInterAction = function (slot0)
	if slot0:isInterActionSpine() then
		return slot0:getInterActionSpineCfg()[4][1] > 0, slot1
	end
end

slot0.hasInterActionMask = function (slot0)
	return table.getCount(slot0:getInterActionMaskNames()) > 0
end

slot0.getInterActionMaskNames = function (slot0)
	slot2 = {}

	if slot0:getConfig("interAction") then
		for slot6, slot7 in ipairs(slot1) do
			if slot7 ~= nil and slot7 ~= "" then
				slot2[slot6] = slot7[4]
			end
		end
	end

	return slot2
end

slot0.getIntetActionMaskName = function (slot0)
	if slot0:hasInterActionMask() then
		return slot0:getConfig("interAction")[1][4]
	end
end

slot0.hasInterActionData = function (slot0)
	return slot0:getConfig("interAction") ~= nil
end

slot0.getInterActionData = function (slot0, slot1)
	if slot0:hasInterActionData() then
		return slot0:getConfig("interAction")[slot1][1], slot0.getConfig("interAction")[slot1][2], slot0.getConfig("interAction")[slot1][3], slot0.getConfig("interAction")[slot1][4], slot0.getConfig("interAction")[slot1][5], slot0.getConfig("interAction")[slot1][6]
	end
end

slot0.getDate = function (slot0)
	if slot0.date > 0 then
		return pg.TimeMgr.GetInstance():STimeDescS(slot0.date, "%Y/%m/%d")
	end
end

slot0.hasInterActionShipId = function (slot0)
	return table.getCount(slot0.shipIds) ~= 0
end

slot0.getInterActionCount = function (slot0)
	return table.getCount(slot0.shipIds or {})
end

slot0.getInterActionShipIds = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.shipIds) do
		table.insert(slot1, slot6)
	end

	return slot1
end

slot0.setInterActionShipId = function (slot0, slot1, slot2)
	if not table.contains(slot0.shipIds, slot1) then
		slot0.shipIds[slot2] = slot1
	end
end

slot0.getInterActionOrder = function (slot0)
	for slot5 = 1, table.getCount(slot0:getConfig("interAction")), 1 do
		if not slot0.shipIds[slot5] then
			return slot5
		end
	end
end

slot0.getOrderByShipId = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.shipIds) do
		if slot6 == slot1 then
			return slot5
		end
	end
end

slot0.clearInterAction = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.shipIds) do
		if slot1 == slot6 then
			slot0.shipIds[slot5] = nil

			break
		end
	end
end

slot0.GetPicture = function (slot0)
	return slot0:getConfig("picture")
end

slot0.setPosition = function (slot0, slot1)
	slot0.position = slot1
end

slot0.getPosition = function (slot0)
	return slot0.position
end

slot0.setDir = function (slot0, slot1)
	slot0.dir = slot1
end

slot0.isSameDir = function (slot0, slot1)
	return slot0.dir == slot1
end

slot0.getConfig = function (slot0, slot1)
	return pg.furniture_data_template[slot0.configId][slot1]
end

slot0.updatePosition = function (slot0, slot1)
	slot0.position = slot1
end

slot0.setPreGrids = function (slot0, slot1)
	slot0.preGrids = slot1
end

slot0.getPerGrids = function (slot0)
	return slot0.preGrids
end

slot0.updateDir = function (slot0)
	if slot0.dir == 1 then
		slot0.dir = 2
	elseif slot0.dir == 2 then
		slot0.dir = 1
	end
end

slot0.getReverseDir = function (slot0)
	return (slot0.dir == 1 and 2) or 1
end

slot0.clearPosition = function (slot0)
	slot0.position = nil
	slot0.dir = 1
	slot0.child = {}
	slot0.parent = 0
end

slot0.getOccupyGrid = function (slot0, slot1)
	slot2 = {}
	slot3, slot4 = slot0:getSize()

	if slot0:isFloor() then
		for slot8 = slot1.x, (slot1.x + slot3) - 1, 1 do
			for slot12 = slot1.y, (slot1.y + slot4) - 1, 1 do
				table.insert(slot2, Vector2(slot8, slot12))
			end
		end
	elseif slot1.y - slot1.x >= 1 then
		for slot8 = slot1.x, (slot1.x + slot3) - 1, 2 do
			table.insert(slot2, Vector2(slot8, slot1.y))
		end
	else
		for slot8 = slot1.y, (slot1.y + slot3) - 1, 2 do
			table.insert(slot2, Vector2(slot1.x, slot8))
		end
	end

	return slot2
end

slot0.getOccupyGridForShip = function (slot0, slot1)
	slot2 = slot0:getOccupyGrid(slot1)

	if slot0:isArch() then
		slot3 = slot0:getCanPutOnGrid(slot1)

		for slot7 = #slot2, 1, -1 do
			slot8 = slot2[slot7]

			for slot12, slot13 in ipairs(slot3) do
				if slot8.x == slot13.x and slot8.y == slot13.y then
					table.remove(slot2, slot7)
				end
			end
		end
	end

	return slot2
end

slot0.getCanPutOnGrid = function (slot0, slot1)
	slot2 = slot0:getConfig("canputonGrid")
	slot3 = {}

	if slot0.dir == 1 then
		for slot7, slot8 in ipairs(slot2) do
			table.insert(slot3, Vector2(slot8[1] + slot1.x, slot8[2] + slot1.y))
		end
	else
		for slot7, slot8 in ipairs(slot2) do
			table.insert(slot3, Vector2(slot8[2] + slot1.x, slot8[1] + slot1.y))
		end
	end

	return slot3
end

slot0.getChildPosById = function (slot0, slot1)
	slot2 = slot0.child[slot1]

	if slot0.dir == 1 then
		return Vector2(slot0.position.x + slot2.x, slot0.position.y + slot2.y)
	elseif slot0.dir == 2 then
		return Vector2(slot0.position.x + slot2.y, slot0.position.y + slot2.x)
	end
end

slot0.setFather = function (slot0, slot1)
	slot0.parent = slot1
end

slot0.getOccupyGridCount = function (slot0)
	if slot0:isArch() then
		return #slot0:getOccupyGrid(slot0.position)
	else
		return (slot0:getConfig("size")[1] or 0) * (slot1[2] or 0)
	end
end

slot0.isChild = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.child) do
		if slot1.id == slot5 then
			return true
		end
	end

	return false
end

slot0.hasParent = function (slot0)
	return slot0.parent ~= 0
end

slot0.isFloor = function (slot0)
	return slot0:getConfig("belong") == slot0.FLOOR
end

slot0.isAllWall = function (slot0)
	return slot0:getConfig("belong") == slot0.WALL_DIR_ALL
end

slot0.isRightType = function (slot0)
	return slot0:getConfig("belong") == slot0.WALL_DIR_RIGHT
end

slot0.isLeftType = function (slot0)
	return slot0:getConfig("belong") == slot0.WALL_DIR_LEFT
end

slot0.isFurniture = function (slot0)
	return slot0:getConfig("type") ~= 0
end

slot0.isMapItem = function (slot0)
	slot1 = slot0:getConfig("type")

	if slot0:isFloor() and slot1 ~= Furniture.TYPE_MAT then
		return true
	end

	return false
end

slot0.checkBoundItem = function (slot0)
	if slot0:isFloor() and not slot0:hasParent() and not slot0:isPaper() then
		return true
	end

	return false
end

slot0.getSize = function (slot0)
	slot1 = slot0:getConfig("size")

	if slot0.dir == 1 then
		return slot1[1], slot1[2]
	else
		return slot1[2], slot1[1]
	end
end

slot0.isOccupy = function (slot0, slot1, slot2)
	if not slot0.position then
		return
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot1 == slot8.x and slot2 == slot8.y then
			return true
		end
	end

	return false
end

slot0.isSameParent = function (slot0, slot1)
	if slot1:hasParent() and slot0:hasParent() and slot1.parent == slot0.parent then
		return true
	end

	return false
end

slot0.isWallMat = function (slot0)
	return slot0:getConfig("type") == Furniture.TYPE_WALL_MAT
end

slot0.isMat = function (slot0)
	return slot0:getConfig("type") == Furniture.TYPE_MAT
end

slot0.canputon = function (slot0)
	return slot0:getConfig("canputon") == 1
end

slot0.getMapSize = function (slot0)
	return 30, 30
end

slot0.isSelf = function (slot0, slot1)
	return slot0.id == slot1
end

slot0.isPaper = function (slot0)
	if slot0:getConfig("type") == Furniture.TYPE_WALLPAPER or slot1 == Furniture.TYPE_FLOORPAPER then
		return true
	end

	return false
end

slot0.isWallPaper = function (slot0)
	if slot0:getConfig("type") == Furniture.TYPE_WALLPAPER then
		return true
	end

	return false
end

slot0.canInterAction = function (slot0)
	if not slot0:getConfig("interAction") then
		return false
	end

	return table.getCount(slot0.shipIds) < table.getCount(slot1)
end

slot0.isSame = function (slot0, slot1)
	if slot0.position.x == slot1.position.x and slot0.position.y == slot1.position.y and slot0.dir == slot1.dir and slot0.parent == slot1.parent then
		return true
	end

	return false
end

slot0.isConflictPos = function (slot0, slot1)
	slot3 = slot1:getOccupyGrid(slot1.position)

	for slot7, slot8 in pairs(slot2) do
		for slot12, slot13 in pairs(slot3) do
			if slot8.x == slot13.x and slot8.y == slot13.y then
				return true
			end
		end
	end

	return false
end

slot0.isShowDesc = function (slot0)
	return #slot0:getConfig("can_trigger") > 0 and slot1[1] > 0
end

slot0.descVoiceType = function (slot0)
	return slot0:getConfig("can_trigger")[1]
end

slot0.isTouchSpine = function (slot0)
	if slot0:isSpine() then
		return slot0:getConfig("spine")[1][3] ~= nil
	end
end

slot0.isSpineCar = function (slot0)
	if slot0:isSpine() then
		return slot0:getConfig("spine")[1][4] == true
	end
end

slot0.getTouchSpineConfig = function (slot0)
	if slot0:isSpine() then
		slot4 = slot0:getConfig("spine")[1][3] or {}[1]

		if slot0.getConfig("spine")[1][3] or [3] then
			table.insert(slot3, slot2[1])

			slot4 = slot3[math.random(1, #slot3)]
		end

		return slot4, slot2[2], slot2[4]
	end
end

slot0.canBeTouch = function (slot0)
	return slot0:isShowDesc() or slot0:isTouchSpine()
end

slot0.FURNITURE_TYPE = {
	i18n("word_wallpaper"),
	i18n("word_furniture"),
	i18n("word_decorate"),
	i18n("word_floorpaper"),
	i18n("word_mat"),
	i18n("word_wall"),
	i18n("word_collection")
}

slot0.getChineseType = function (slot0)
	return slot0.FURNITURE_TYPE[slot0:getConfig("type")]
end

slot0.getGainby = function (slot0)
	return slot0:getConfig("gain_by")
end

slot0.isStageFurniture = function (slot0)
	return slot0:getConfig("type") == Furniture.TYPE_STAGE
end

slot0.hasAnimator = function (slot0)
	return slot0:getConfig("animator") ~= nil
end

slot0.getAnimatorData = function (slot0)
	if slot0:hasAnimator() then
		return slot0:getConfig("animator")[1]
	end
end

slot0.getAnimtorControlName = function (slot0, slot1)
	slot2 = {}

	if slot0:hasAnimator() then
		if type(slot0:getConfig("animator")[1][slot1] or slot3[1] or {}) == "string" then
			table.insert(slot2, slot4)
		else
			slot2 = slot4
		end
	end

	return slot2
end

slot0.getAnimtorControlGoName = function (slot0, slot1, slot2)
	return "Animator" .. slot1 .. slot2
end

slot0.isArch = function (slot0)
	return slot0:getConfig("type") == Furniture.TYPE_ARCH
end

slot0.getArchMask = function (slot0)
	return slot0:getConfig("picture") .. "_using"
end

slot0.isMoveable = function (slot0)
	return slot0:getConfig("type") == Furniture.TYPE_MOVEABLE
end

slot0.canTriggerInteraction = function (slot0, slot1)
	if not slot0:canInterActionShipGroup(slot1) then
		return false
	end

	return (slot0:isInterActionSpine() and slot0:canInterActionSpine()) or slot0:canInterAction() or slot0:isStageFurniture() or slot0:isArch() or slot0:isTransPort()
end

slot0.getSurroundGrid = function (slot0)
	slot1 = slot0:getPosition()

	table.insert(slot2, Vector2(slot1.x, slot1.y + 1))
	table.insert(slot2, Vector2(slot1.x, slot1.y - 1))
	table.insert(slot2, Vector2(slot1.x - 1, slot1.y))
	table.insert({}, Vector2(slot1.x + 1, slot1.y))

	return 
end

return slot0
