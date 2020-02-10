slot0 = class("AiriJPTracker")

function slot0.Ctor(slot0)
	slot1[TRACKING_ROLE_CREATE] = "role_create"
	slot1[TRACKING_ROLE_LOGIN] = "role_login"
	slot1[TRACKING_TUTORIAL_COMPLETE_1] = "tutorial_complete_1"
	slot1[TRACKING_TUTORIAL_COMPLETE_2] = "tutorial_complete_2"
	slot1[TRACKING_TUTORIAL_COMPLETE_3] = "tutorial_complete_3"
	slot1[TRACKING_TUTORIAL_COMPLETE_4] = "tutorial_complete_4"
	slot1[TRACKING_USER_LEVELUP] = "user_levelup"
	slot1[TRACKING_ROLE_LOGOUT] = "role_logout"
	slot1[TRACKING_PURCHASE_FIRST] = "purchase_first"
	slot1[TRACKING_PURCHASE_CLICK] = "purchase_click"
	slot1[TRACKING_PURCHASE_CLICK_MONTHLYCARD] = "purchase_click_monthlycard"
	slot1[TRACKING_PURCHASE_CLICK_GIFTBAG] = "purchase_click_giftbag"
	slot1[TRACKING_PURCHASE_CLICK_DIAMOND] = "purchase_click_diamond"
	slot1[TRACKING_2D_RETENTION] = "2d_retention"
	slot1[TRACKING_7D_RETENTION] = "7d_retention"
	slot1[TRACKING_BUILD_SHIP] = "construct"
	slot1[TRACKING_SHIP_INTENSIFY] = "strengthen"
	slot1[TRACKING_SHIP_LEVEL_UP] = "levelup"
	slot1[TRACKING_SHIP_HIGHEST_LEVEL] = "character_Max_level"
	slot1[TRACKING_CUBE_ADD] = "cube_acquisition"
	slot1[TRACKING_CUBE_CONSUME] = "cube_Consumption"
	slot1[TRACKING_USER_LEVEL_THIRTY] = "level_30"
	slot1[TRACKING_USER_LEVEL_FORTY] = "level_40"
	slot1[TRACKING_PROPOSE_SHIP] = "married"
	slot1[TRACKING_REMOULD_SHIP] = "remodeled"
	slot1[TRACKING_HARD_CHAPTER] = "hard_clear"
	slot1[TRACKING_KILL_BOSS] = "stage_laps"
	slot1[TRACKING_HIGHEST_CHAPTER] = "stage"
	slot1[TRACKING_FIRST_PASS_12_4] = "12-4_clear"
	slot1[TRACKING_FIRST_PASS_13_1] = "13-1_clear"
	slot1[TRACKING_FIRST_PASS_13_2] = "13-2_clear"
	slot1[TRACKING_FIRST_PASS_13_3] = "13-3_clear"
	slot1[TRACKING_FIRST_PASS_13_4] = "13-4_clear"
	slot1[TRACKING_CLASS_LEVEL_UP_8] = "auditoriumLV_8"
	slot1[TRACKING_CLASS_LEVEL_UP_9] = "auditoriumLV_9"
	slot1[TRACKING_CLASS_LEVEL_UP_10] = "auditoriumLV_10"
	slot0.mapping = {}
end

function slot0.Tracking(slot0, slot1, slot2, slot3)
	if slot0.mapping[slot1] == nil then
		return
	end

	if slot1 == TRACKING_USER_LEVELUP then
		print("tracking lvl:" .. slot3)

		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("lvl", slot3)
		slot5:AddParam("user_id", slot2)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_PURCHASE_CLICK then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_PURCHASE_FIRST then
		print("order id : " .. slot3)

		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("order_id", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_2D_RETENTION or slot1 == TRACKING_7D_RETENTION then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_BUILD_SHIP then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Cons_Num", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_SHIP_INTENSIFY then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Cost_Num", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_SHIP_LEVEL_UP then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Lvup_Num", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_SHIP_HIGHEST_LEVEL then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Ship_Max_level", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_CUBE_ADD then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Aqui_Num", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_CUBE_CONSUME then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Consum_Num", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_PROPOSE_SHIP then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Married_Id", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_REMOULD_SHIP then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Remodel_Id", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_HARD_CHAPTER then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Clear_Stage_Id", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	elseif slot1 == TRACKING_HIGHEST_CHAPTER then
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		slot5:AddParam("Clear_Stage_Id", slot3)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	else
		slot5 = AiriUserEvent.New(slot4)

		slot5:AddParam("user_id", slot2)
		pg.SdkMgr.GetInstance():UserEventUpload(slot5)
	end
end

return slot0
