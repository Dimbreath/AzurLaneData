slot0 = class("GoBackCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot1:getType() or 1

	if getProxy(ContextProxy):getContextCount() > 1 then
		slot5 = slot4:popContext()
		slot6 = nil

		for slot10 = 1, slot3 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-27, warpins: 3 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #0



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-33, warpins: 1 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #2 34-38, warpins: 1 ---

			-- Decompilation error in this vicinity:
			slot6 = slot4:popContext()

			--- END OF BLOCK #2 ---

			UNCONDITIONAL JUMP; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #3 39-42, warpins: 1 ---
			print("could not pop more context")

			break
			--- END OF BLOCK #3 ---




			-- Decompilation error in this vicinity:
			--- BLOCK #4 43-45, warpins: 1 ---
			--- END OF BLOCK #4 ---

			slot11 = if not slot6.ignoreBack then
			JUMP TO BLOCK #5
			else
			JUMP TO BLOCK #0
			end



			-- Decompilation error in this vicinity:
			--- BLOCK #5 46-46, warpins: 2 ---
			--- END OF BLOCK #5 ---



		end

		slot6:extendData(slot2)
		slot0:sendNotification(GAME.LOAD_SCENE, {
			prevContext = slot5,
			context = slot6
		})
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #4 60-62, warpins: 1 ---
		print("no more context in the stack")
		--- END OF BLOCK #4 ---



	end
end

return slot0
