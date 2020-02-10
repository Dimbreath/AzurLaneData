slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S001",
	12003
}
slot1.segment = {}
slot0[1] = {
	index = 1
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S002",
	12009
}
slot2[2] = {
	"S002_1",
	12026
}
slot1.segment = {}

function slot1.getSegment()
	return getProxy(BuildShipProxy):getFinishCount() > 0 and 2 or 1
end

slot0[2] = {
	index = 2,
	end_segment = "S003"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S004",
	12103
}
slot1.segment = {}
slot0[3] = {
	index = 3
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S005",
	13102
}
slot1.segment = {}
slot0[4] = {
	index = 4
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S006",
	13104
}
slot1.segment = {}
slot0[5] = {
	index = 5
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S007",
	13104
}
slot1.segment = {}
slot0[6] = {
	index = 6
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S008",
	40002
}
slot1.segment = {}
slot0[7] = {
	index = 7,
	interrupt = true
}
slot1.view = {
	"MainUI",
	"LevelScene"
}
slot2.arg = {
	1,
	40004
}

function slot2.func(slot0, slot1)
	if slot0 == "MainUI" then
		return pg.SeriesGuideMgr.CODES.MAINUI, 7
	elseif slot0 == "LevelScene" then
		if not slot1 then
			return pg.SeriesGuideMgr.CODES.CONDITION, 7
		elseif slot1 then
			if slot1.score > 1 then
				return pg.SeriesGuideMgr.CODES.CONDITION, 9
			elseif slot1.total_time >= 180 then
				return pg.SeriesGuideMgr.CODES.CONDITION, 7
			else
				return pg.SeriesGuideMgr.CODES.CONDITION, 4
			end
		end
	end
end

slot1.condition = {}
slot0[8] = {
	index = 8
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S009",
	13104
}
slot1.segment = {}
slot0[9] = {
	index = 9,
	end_segment = "S010"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S011",
	20006
}
slot1.segment = {}
slot0[10] = {
	index = 10,
	end_segment = "S012"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S013",
	15003
}
slot1.segment = {}
slot0[11] = {
	index = 11,
	end_segment = "S014"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S015",
	14007
}
slot1.segment = {}
slot0[12] = {
	index = 12,
	end_segment = "S016"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S011",
	20006
}
slot1.segment = {}
slot0[13] = {
	index = 13,
	end_segment = "S012"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S017",
	12007
}
slot1.segment = {}
slot0[14] = {
	index = 14
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S018",
	14003
}
slot1.segment = {}
slot0[15] = {
	index = 15,
	end_segment = "S019"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S011",
	20006
}
slot1.segment = {}
slot0[16] = {
	index = 16,
	end_segment = "S012"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S020",
	12003
}
slot2[2] = {
	"S020_1",
	12003
}
slot1.segment = {}

function slot1.getSegment()
	return (not BuildShipScene.projectName or BuildShipScene.projectName == BuildShipScene.PROJECTS.HEAVY) and 2 or 1
end

slot0[17] = {
	index = 17
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S002",
	12009
}
slot2[2] = {
	"S002_1",
	12026
}
slot1.segment = {}

function slot1.getSegment()
	return getProxy(BuildShipProxy):getFinishCount() > 0 and 2 or 1
end

slot0[18] = {
	index = 18,
	end_segment = "S003"
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S021",
	12103
}
slot1.segment = {}
slot0[19] = {
	index = 19
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S022",
	13102
}
slot1.segment = {}
slot0[20] = {
	index = 20
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S023",
	13104
}
slot1.segment = {}
slot0[21] = {
	index = 21
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S024",
	13104
}
slot1.segment = {}
slot0[22] = {
	index = 22
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S025",
	13104
}
slot1.segment = {}
slot0[23] = {
	index = 23
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S026",
	40002
}
slot1.segment = {}
slot0[24] = {
	index = 24,
	interrupt = true
}
slot1.view = {
	"MainUI",
	"LevelScene"
}
slot2.arg = {
	1,
	40004
}

function slot2.func(slot0, slot1)
	if slot0 == "MainUI" then
		return pg.SeriesGuideMgr.CODES.MAINUI, 24
	elseif slot0 == "LevelScene" then
		if not slot1 then
			return pg.SeriesGuideMgr.CODES.CONDITION, 24
		elseif slot1 then
			if slot1.score > 1 then
				return pg.SeriesGuideMgr.CODES.CONDITION, 26
			elseif slot1.total_time >= 180 then
				return pg.SeriesGuideMgr.CODES.CONDITION, 24
			else
				return pg.SeriesGuideMgr.CODES.CONDITION, 20
			end
		end
	end
end

slot1.condition = {}
slot0[25] = {
	index = 25
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S027",
	13104
}
slot1.segment = {}
slot0[26] = {
	index = 26
}
slot1.view = {
	"MainUI"
}
slot2[1] = {
	"S028",
	40002
}
slot1.segment = {}
slot0[27] = {
	index = 27,
	interrupt = true
}
slot1.view = {
	"MainUI",
	"LevelScene"
}
slot2.arg = {
	1,
	40004
}

function slot2.func(slot0, slot1)
	if slot0 == "MainUI" then
		return pg.SeriesGuideMgr.CODES.MAINUI, 27
	elseif slot0 == "LevelScene" then
		if not slot1 then
			return pg.SeriesGuideMgr.CODES.CONDITION, 27
		elseif slot1 then
			if slot1.score > 1 then
				return pg.SeriesGuideMgr.CODES.CONDITION, 29
			elseif slot1.total_time >= 180 then
				return pg.SeriesGuideMgr.CODES.CONDITION, 27
			else
				return pg.SeriesGuideMgr.CODES.CONDITION, 20
			end
		end
	end
end

slot1.condition = {}
slot0[28] = {
	index = 28,
	end_segment = "S029"
}

return {}
