slot0 = class("ShipStatus")

function slot0.ShipStatu2Bg(slot0)
	if slot0.inChapter or slot0.inElite or slot0.shamInFleet or slot0.inSham or slot0.inFleet or slot0.inWorld or slot0.inActivity or slot0.inChallenge then
		return "red"
	elseif slot0.inEvent then
		return "green"
	elseif slot0.inTactics or slot0.inClass then
		return "blue"
	elseif slot0.inBackyard then
		return "purple"
	elseif slot0.inAdmiral then
		return "light_green"
	end
end

function slot0.ShipStatu2Name(slot0)
	slot1 = ""

	if slot0.inChapter then
		slot1 = i18n("word_status_inFight")
	elseif slot0.inElite then
		slot1 = i18n("word_status_inFight")
	elseif slot0.inActivity then
		slot1 = i18n("word_status_challenge")
	elseif slot0.inChallenge then
		slot1 = i18n("word_status_challenge")
	elseif slot0.shamInFleet or slot0.inSham then
		slot1 = i18n("word_status_inFight")
	elseif slot0.inFleet then
		slot1 = (slot0:getFleetId() == FleetProxy.PVP_FLEET_ID and i18n("word_status_inPVP")) or i18n("word_status_inFight")
	elseif slot0.inEvent then
		slot1 = i18n("word_status_inEvent")
	elseif slot0.inEventFinished then
		slot1 = i18n("word_status_inEventFinished")
	elseif slot0.inTactics then
		slot1 = i18n("word_status_inTactics")
	elseif slot0.inClass then
		slot1 = i18n("word_status_inClass")
	elseif slot0.inBackyard then
		if slot0.state == Ship.STATE_REST then
			slot1 = i18n("word_status_rest")
		elseif slot0.state == Ship.STATE_TRAIN then
			slot1 = i18n("word_status_train")
		end
	elseif slot0.inAdmiral then
		slot1 = i18n("common_flag_ship")
	end

	return slot1
end

slot0.FILTER_SHIPS_FLAGS_1 = {
	inExercise = false,
	inChapter = true,
	inPvp = false,
	inFleet = false,
	inClass = true,
	inChallenge = true,
	inTactics = false,
	inElite = true,
	inSham = true,
	inEvent = true,
	inBackyard = false,
	isActivityNpc = true,
	isActivity = true,
	inAdmiral = true
}
slot0.FILTER_SHIPS_FLAGS_2 = {
	inExercise = true,
	inChapter = true,
	inPvp = true,
	inFleet = true,
	inClass = true,
	inChallenge = true,
	inTactics = true,
	inElite = true,
	inSham = true,
	inEvent = true,
	inBackyard = true,
	isActivityNpc = true,
	inAdmiral = true
}
slot0.FILTER_SHIPS_FLAGS_3 = {
	inExercise = false,
	inChapter = true,
	inPvp = false,
	inFleet = false,
	inClass = true,
	inChallenge = true,
	inTactics = false,
	inElite = true,
	inSham = true,
	inEvent = true,
	inBackyard = false,
	isActivityNpc = true,
	isActivity = true,
	inAdmiral = false
}

return slot0
