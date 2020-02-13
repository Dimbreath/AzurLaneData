pg = pg or {}
pg.TrackerMgr = singletonClass("TrackerMgr")
TRACKING_ROLE_CREATE = "role_create"
TRACKING_ROLE_LOGIN = "role_login"
TRACKING_TUTORIAL_COMPLETE_1 = "tutorial_complete_1"
TRACKING_TUTORIAL_COMPLETE_2 = "tutorial_complete_2"
TRACKING_TUTORIAL_COMPLETE_3 = "tutorial_complete_3"
TRACKING_TUTORIAL_COMPLETE_4 = "tutorial_complete_4"
TRACKING_USER_LEVELUP = "user_levelup"
TRACKING_ROLE_LOGOUT = "role_logout"
TRACKING_PURCHASE_FIRST = "purchase_first"
TRACKING_PURCHASE_CLICK = "purchase_click"
TRACKING_PURCHASE_CLICK_MONTHLYCARD = "purchase_click_monthlycard"
TRACKING_PURCHASE_CLICK_GIFTBAG = "purchase_click_giftbag"
TRACKING_PURCHASE_CLICK_DIAMOND = "purchase_click_diamond"
TRACKING_PURCHASE = "purchase"
TRACKING_2D_RETENTION = "2d_retention"
TRACKING_7D_RETENTION = "7d_retention"
TRACKING_BUILD_SHIP = "build_ship"
TRACKING_SHIP_INTENSIFY = "ship_intensify"
TRACKING_SHIP_LEVEL_UP = "ship_level_up"
TRACKING_SHIP_HIGHEST_LEVEL = "ship_highest_level"
TRACKING_CUBE_ADD = "cube_add"
TRACKING_CUBE_CONSUME = "cube_consume"
TRACKING_USER_LEVEL_THIRTY = "user_level_thirty"
TRACKING_USER_LEVEL_FORTY = "user_level_forty"
TRACKING_PROPOSE_SHIP = "propose_ship"
TRACKING_REMOULD_SHIP = "remould_ship"
TRACKING_HARD_CHAPTER = "hard_chapter"
TRACKING_KILL_BOSS = "kill_boss"
TRACKING_HIGHEST_CHAPTER = "highest_chapter"
TRACKING_FIRST_PASS_12_4 = "first_pass_12_4"
TRACKING_FIRST_PASS_13_1 = "first_pass_13_1"
TRACKING_FIRST_PASS_13_2 = "first_pass_13_2"
TRACKING_FIRST_PASS_13_3 = "first_pass_13_3"
TRACKING_FIRST_PASS_13_4 = "first_pass_13_4"
TRACKING_CLASS_LEVEL_UP_8 = "class_level_up_8"
TRACKING_CLASS_LEVEL_UP_9 = "class_level_up_9"
TRACKING_CLASS_LEVEL_UP_10 = "class_level_up_10"

function pg.TrackerMgr.Ctor(slot0)
	slot1 = nil

	if PLATFORM_CODE == PLATFORM_CH then
		slot1 = require("Mgr.Tracker.BiliTracker")
	elseif PLATFORM_CODE == PLATFORM_JP then
		slot1 = require("Mgr.Tracker.AiriJPTracker")
	elseif PLATFORM_CODE == PLATFORM_US then
		slot1 = require("Mgr.Tracker.AiriUSTracker")
	elseif PLATFORM_CODE == PLATFORM_KR then
		slot1 = require("Mgr.Tracker.KwxyKrTracker")
	end

	if slot1 then
		slot0.instance = slot1.New()
	end
end

function pg.TrackerMgr.Call(slot0, slot1, ...)
	if slot0.instance and slot0.instance[slot1] then
		slot0.instance[slot1](slot0.instance, unpack({
			...
		}))
	end
end

function pg.TrackerMgr.Tracking(slot0, slot1, slot2, slot3)
	if getProxy(UserProxy) == nil or not slot4:getData() then
		slot5 = nil
	end

	if slot5 == nil or not slot5.uid then
		slot6 = nil
	end

	if slot6 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-20, warpins: 1 ---
		return

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-25, warpins: 2 ---
		if getProxy(PlayerProxy) == nil or not slot7:getData() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-31, warpins: 2 ---
			slot8 = nil

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #1 32-33, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #2 34-36, warpins: 1 ---
			if not (getProxy(PlayerProxy) ~= nil and slot7.getData()) or nil.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-37, warpins: 2 ---
				slot9 = nil

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #1 38-39, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #2 40-41, warpins: 1 ---
				if not slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 42-42, warpins: 2 ---
					slot9 = slot3
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	slot8 = (getProxy(PlayerProxy) ~= nil and slot7.getData()) or nil

	if ((((((getProxy(PlayerProxy) ~= nil and slot7.getData()) or nil) ~= nil and (getProxy(PlayerProxy) ~= nil and slot7.getData()) or nil.id) or nil) ~= nil and ((((getProxy(PlayerProxy) ~= nil and slot7.getData()) or nil) ~= nil and (getProxy(PlayerProxy) ~= nil and slot7.getData()) or nil.id) or nil)) or slot3) == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-45, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot12 = getProxy(ServerProxy).getLastServer(slot10, slot6).id

	if slot1 == TRACKING_2D_RETENTION or slot1 == TRACKING_7D_RETENTION then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-70, warpins: 2 ---
		if PlayerPrefs.GetInt(slot13, 0) <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 71-93, warpins: 1 ---
			print("tracking type : " .. slot1 .. "   user_id:" .. slot9)
			PlayerPrefs.SetInt(slot13, 1)
			PlayerPrefs.Save()
			slot0:Call("Tracking", slot1, slot9, slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 94-101, warpins: 1 ---
		print("tracking type : " .. slot1 .. ",   user_id:" .. slot9 .. ",   data:" .. (slot2 or "nil"))
		slot0:Call("Tracking", slot1, slot9, slot2, slot12)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 102-102, warpins: 1 ---
		slot19 = "nil"
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 103-112, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	if slot1 == TRACKING_PURCHASE_CLICK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-117, warpins: 1 ---
		if slot2 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-132, warpins: 1 ---
			print("tracking type : " .. TRACKING_PURCHASE_CLICK_MONTHLYCARD .. "   user_id:" .. slot9)
			slot0:Call("Tracking", TRACKING_PURCHASE_CLICK_MONTHLYCARD, slot9, slot2)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 133-134, warpins: 1 ---
			if slot2 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 135-149, warpins: 1 ---
				print("tracking type : " .. TRACKING_PURCHASE_CLICK_GIFTBAG .. "   user_id:" .. slot9)
				slot0:Call("Tracking", TRACKING_PURCHASE_CLICK_GIFTBAG, slot9, slot2)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 150-163, warpins: 1 ---
				print("tracking type : " .. TRACKING_PURCHASE_CLICK_DIAMOND .. "   user_id:" .. slot9)
				slot0:Call("Tracking", TRACKING_PURCHASE_CLICK_DIAMOND, slot9, slot2)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
end

return
