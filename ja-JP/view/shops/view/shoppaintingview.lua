slot0 = class
slot1 = "ShopPaintingView"
slot0 = slot0(slot1)

function slot1(slot0, slot1)
	slot0._painting = slot1
	slot2 = slot0._painting
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "paint_touch"
	slot2 = slot2(slot3, slot4)
	slot0.touch = slot2
	slot2 = slot0._painting
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "chat"
	slot2 = slot2(slot3, slot4)
	slot0.chat = slot2
	slot2 = slot0.chat
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "Text"
	slot2 = slot2(slot3, slot4)
	slot0.chatText = slot2
	slot2 = nil
	slot0.name = slot2
	slot2 = false
	slot0.chatting = slot2
end

slot0.Ctor = slot1

function slot1(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.UnLoad

	slot2(slot3)

	slot0.name = slot1
	slot3 = slot0
	slot2 = slot0.Load

	slot2(slot3)
end

slot0.Init = slot1

function slot1(slot0)
	slot1 = slot0.name
	slot2 = setPaintingPrefabAsync
	slot3 = slot0._painting
	slot4 = slot1
	slot5 = "chuanwu"

	slot2(slot3, slot4, slot5)
end

slot0.Load = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = slot0.chatting

	if not slot4 or slot3 then
		slot5 = slot0
		slot4 = slot0.StopChat

		slot4(slot5)

		if slot2 then
			slot5 = slot0
			slot4 = slot0.PlayCV
			slot6 = slot2

			function slot7()
				slot0 = slot0

				if slot0 then
					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.ShowShipWord
					slot2 = slot0

					slot0(slot1, slot2)
				end
			end

			slot4(slot5, slot6, slot7)
		end
	end
end

slot0.Chat = slot1

function slot1(slot0, slot1)
	slot2 = true
	slot0.chatting = slot2
	slot2 = LeanTween
	slot2 = slot2.isTweening
	slot3 = go
	slot4 = slot0.chat
	slot2 = slot2(slot3(slot4))

	if slot2 then
		slot2 = LeanTween
		slot2 = slot2.cancel
		slot3 = go
		slot4 = slot0.chat

		slot2(slot3(slot4))
	end

	slot2 = 0.3
	slot3 = 3
	slot4 = slot0._cueInfo

	if slot4 then
		slot4 = long2int
		slot5 = slot0._cueInfo
		slot5 = slot5.length
		slot4 = slot4(slot5)
		slot4 = slot4 / 1000

		if slot3 < slot4 then
			slot3 = slot4
		end
	end

	slot4 = setActive
	slot5 = slot0.chat
	slot6 = true

	slot4(slot5, slot6)

	slot4 = setText
	slot5 = slot0.chatText
	slot6 = slot1

	slot4(slot5, slot6)

	slot4 = LeanTween
	slot4 = slot4.scale
	slot5 = slot0.chat
	slot5 = slot5.gameObject
	slot6 = Vector3
	slot6 = slot6.New
	slot7 = 1
	slot8 = 1
	slot9 = 1
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = slot2
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot4
	slot4 = slot4.setFrom
	slot6 = Vector3
	slot6 = slot6.New
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot4 = slot4(slot5, slot6(slot7, slot8, slot9))
	slot5 = slot4
	slot4 = slot4.setEase
	slot6 = LeanTweenType
	slot6 = slot6.easeOutBack
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.setOnComplete
	slot6 = System
	slot6 = slot6.Action

	function slot7()
		slot0 = IsNil
		slot1 = slot0
		slot1 = slot1.chat
		slot0 = slot0(slot1)

		if slot0 then
			return
		end

		slot0 = LeanTween
		slot0 = slot0.scale
		slot1 = slot0
		slot1 = slot1.chat
		slot1 = slot1.gameObject
		slot2 = Vector3
		slot2 = slot2.New
		slot3 = 0
		slot4 = 0
		slot5 = 1
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = slot1
		slot0 = slot0(slot1, slot2, slot3)
		slot1 = slot0
		slot0 = slot0.setFrom
		slot2 = Vector3
		slot2 = slot2.New
		slot3 = 1
		slot4 = 1
		slot5 = 1
		slot0 = slot0(slot1, slot2(slot3, slot4, slot5))
		slot1 = slot0
		slot0 = slot0.setEase
		slot2 = LeanTweenType
		slot2 = slot2.easeInBack
		slot0 = slot0(slot1, slot2)
		slot1 = slot0
		slot0 = slot0.setDelay
		slot2 = slot2
		slot0 = slot0(slot1, slot2)
		slot1 = slot0
		slot0 = slot0.setOnComplete
		slot2 = System
		slot2 = slot2.Action

		function slot3()
			slot0 = IsNil
			slot1 = slot0
			slot1 = slot1.chat
			slot0 = slot0(slot1)

			if slot0 then
				return
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.StopChat

			slot0(slot1)
		end

		slot0(slot1, slot2(slot3))
	end

	slot4(slot5, slot6(slot7))
end

slot0.ShowShipWord = slot1

function slot1(slot0)
	slot1 = nil
	slot0.chatting = slot1
	slot1 = LeanTween
	slot1 = slot1.isTweening
	slot2 = go
	slot3 = slot0.chat
	slot1 = slot1(slot2(slot3))

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = go
		slot3 = slot0.chat

		slot1(slot2(slot3))
	end

	slot1 = setActive
	slot2 = slot0.chat
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.StopCV

	slot1(slot2)
end

slot0.StopChat = slot1

function slot1(slot0, slot1, slot2)
	slot3 = "event:/cv/shop/"
	slot4 = slot1
	slot3 = slot3 .. slot4

	if slot3 then
		function slot4()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.StopCV

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot2 = playSoundEffect
			slot3 = slot1
			slot2, slot3 = slot2(slot3)
			slot1._cueInfo = slot3
			slot0._currentVoice = slot2
			slot0 = slot2

			slot0()
		end

		slot5 = slot0.loadedCVBankName

		if slot5 then
			slot5 = slot4

			slot5()
		else
			slot5 = "shop"

			function slot6()
				slot0 = pg
				slot0 = slot0.CriMgr
				slot0 = slot0.GetCVBankName
				slot1 = slot0
				slot0 = slot0(slot1)
				slot1 = slot1
				slot1 = slot1.exited

				if slot1 then
					slot1 = pg
					slot1 = slot1.CriMgr
					slot1 = slot1.UnloadCVBank
					slot2 = slot0

					slot1(slot2)
				else
					slot1 = slot2

					slot1()

					slot1 = slot1
					slot1 = slot1._currentVoice

					if slot1 then
						slot1 = slot1
						slot1.loadedCVBankName = slot0
					end
				end
			end

			slot7 = pg
			slot7 = slot7.CriMgr
			slot8 = slot7
			slot7 = slot7.LoadCV
			slot9 = slot5
			slot10 = slot6

			slot7(slot8, slot9, slot10)
		end
	end
end

slot0.PlayCV = slot1

function slot1(slot0)
	slot1 = slot0._currentVoice

	if slot1 then
		slot1 = slot0._currentVoice
		slot2 = slot1
		slot1 = slot1.Stop
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = nil
	slot0._currentVoice = slot1
end

slot0.StopCV = slot1

function slot1(slot0)
	slot1 = slot0.name

	if slot1 then
		slot2 = retPaintingPrefab
		slot3 = slot0._painting
		slot4 = slot1

		slot2(slot3, slot4)

		slot2 = nil
		slot0.name = slot2
	end
end

slot0.UnLoad = slot1

function slot1(slot0)
	slot2 = slot0
	slot1 = slot0.UnLoad

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.StopCV

	slot1(slot2)
end

slot0.Dispose = slot1

return slot0
