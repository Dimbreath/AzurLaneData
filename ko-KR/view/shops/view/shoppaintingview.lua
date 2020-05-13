slot0 = class("ShopPaintingView")

function slot0.Ctor(slot0, slot1)
	slot0._painting = slot1
	slot0.touch = slot0._painting:Find("paint_touch")
	slot0.chat = slot0._painting:Find("chat")
	slot0.chatText = slot0.chat:Find("Text")
	slot0.name = nil
	slot0.chatting = false
end

function slot0.Init(slot0, slot1)
	slot0:UnLoad()

	slot0.name = slot1

	slot0:Load()
end

function slot0.Load(slot0)
	setPaintingPrefabAsync(slot0._painting, slot0.name, "chuanwu")
end

function slot0.Chat(slot0, slot1, slot2, slot3)
	if not slot0.chatting or slot3 then
		slot0:StopChat()

		if slot2 then
			slot0:PlayCV(slot2)
		end

		if slot1 then
			slot0:ShowShipWord(slot1)
		end
	end
end

function slot0.ShowShipWord(slot0, slot1)
	slot0.chatting = true

	if LeanTween.isTweening(go(slot0.chat)) then
		LeanTween.cancel(go(slot0.chat))
	end

	slot3 = 3

	setActive(slot0.chat, true)
	setText(slot0.chatText, slot1)
	LeanTween.scale(slot0.chat.gameObject, Vector3.New(1, 1, 1), 0.3):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()
		if IsNil(uv0.chat) then
			return
		end

		LeanTween.scale(uv0.chat.gameObject, Vector3.New(0, 0, 1), uv1):setFrom(Vector3.New(1, 1, 1)):setEase(LeanTweenType.easeInBack):setDelay(uv2):setOnComplete(System.Action(function ()
			if IsNil(uv0.chat) then
				return
			end

			uv0:StopChat()
		end))
	end))
end

function slot0.StopChat(slot0)
	slot0.chatting = nil

	if LeanTween.isTweening(go(slot0.chat)) then
		LeanTween.cancel(go(slot0.chat))
	end

	setActive(slot0.chat, false)
	slot0:StopCV()
end

function slot0.PlayCV(slot0, slot1)
	if "event:/cv/shop/" .. slot1 then
		if slot0.loadedCVBankName then
			function ()
				uv0:StopCV()

				uv0._currentVoice = playSoundEffect(uv1)
			end()
		else
			pg.CriMgr:LoadCV("shop", function ()
				if uv1.exited then
					pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(uv0))
				else
					uv2()

					if uv1._currentVoice then
						uv1.loadedCVBankName = slot0
					end
				end
			end)
		end
	end
end

function slot0.StopCV(slot0)
	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil
end

function slot0.UnLoad(slot0)
	if slot0.name then
		retPaintingPrefab(slot0._painting, slot1)

		slot0.name = nil
	end
end

function slot0.Dispose(slot0)
	slot0:UnLoad()
	slot0:StopCV()
end

return slot0
