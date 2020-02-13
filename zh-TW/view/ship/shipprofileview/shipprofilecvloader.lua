slot0 = class("ShipProfileCVLoader")
slot1 = pg.ship_skin_words

function slot0.Ctor(slot0)
	slot0.loadedCVBankName = nil
	slot0.loadedCVBattleBankName = nil
	slot0.currentVoice = nil
	slot0.timers = {}
end

function slot0.Load(slot0, slot1)
	slot0:Unload()

	if ShipWordHelper.ExistVoiceKey(slot1) then
		slot0:SetUp(ShipWordHelper.RawGetCVKey(slot1))
	end
end

function slot0.SetUp(slot0, slot1)
	seriesAsync({
		function (slot0)
			pg.CriMgr:LoadCV(slot0, slot0)
		end,
		function (slot0)
			pg.CriMgr:LoadBattleCV(slot0, slot0)
		end
	}, function ()
		if slot1.exited then
			pg.CriMgr.UnloadCVBank(slot0)
			pg.CriMgr.UnloadCVBank(slot1)
		else
			slot1.loadedCVBankName = slot0
			slot1.loadedCVBattleBankName = slot1
		end
	end)
end

function slot0.PlaySound(slot0, slot1)
	slot0:StopSound()

	slot0.currentVoice, slot3 = playSoundEffect(slot1)

	return slot3
end

function slot0.DelayPlaySound(slot0, slot1, slot2, slot3)
	slot0:RemoveTimer(slot1)

	if slot2 > 0 then
		slot0.timers[slot1] = Timer.New(function ()
			slot0 = slot0:PlaySound(slot0)

			if slot0 then
				slot2(slot0)
			end
		end, slot2, 1)

		slot0.timers[slot1]:Start()
	else
		slot4 = slot0:PlaySound(slot1)

		if slot3 then
			slot3(slot4)
		end
	end
end

function slot0.RawPlaySound(slot0, slot1, slot2)
	slot0:RemoveTimer(slot1)

	if slot2 > 0 then
		slot0.timers[slot1] = Timer.New(function ()
			playSoundEffect(playSoundEffect)
		end, slot2, 1)

		slot0.timers[slot1]:Start()
	else
		playSoundEffect(slot1)
	end
end

function slot0.RemoveTimer(slot0, slot1)
	if slot0.timers[slot1] then
		slot0.timers[slot1]:Stop()

		slot0.timers[slot1] = nil
	end
end

function slot0.StopSound(slot0)
	if slot0.currentVoice then
		slot0.currentVoice:Stop(true)
	end
end

function slot0.Unload(slot0)
	if slot0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
	end

	if slot0.loadedCVBattleBankName then
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBattleBankName)

		slot0.loadedCVBattleBankName = nil
	end
end

function slot0.Dispose(slot0)
	slot0:StopSound()
	slot0:Unload()

	slot0.currentVoice = nil
	slot0.exited = true

	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil
end

return slot0
