class("WakabaChrisSkinPage", import(".TemplatePage.SkinTemplatePage")).OnUpdateFlush = function (slot0)
	slot0.nday = slot0.activity.data3
	slot1 = {}
	slot2 = slot0.activity:getConfig("config_client").story
	slot3 = pg.StoryMgr.GetInstance()

	for slot7 = 1, slot0.nday, 1 do
		if checkExist(slot2, {
			slot7
		}, {
			1
		}) and not slot3:IsPlayed(slot2[slot7][1]) then
			table.insert(slot1, function (slot0)
				slot0:Play(slot1[slot2][1], slot0)
			end)
		end
	end

	seriesAsync(slot1, function ()
		print("story play number", #slot0)
	end)
	setText(slot0.dayTF, slot0.nday .. "/" .. #slot0.taskGroup)
	slot0.uilist:align(#slot0.taskGroup[slot0.nday])
end

return class("WakabaChrisSkinPage", import(".TemplatePage.SkinTemplatePage"))
