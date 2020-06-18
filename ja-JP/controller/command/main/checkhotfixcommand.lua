slot0 = class("CheckHotfixCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if PLATFORM_CODE == PLATFORM_US and VersionMgr.Inst:OnProxyUsing() then
		return
	end

	if UpdateMgr.Inst.currentVersion.Major > 0 and (not uv0.lastRequestVersionTime or Time.realtimeSinceStartup - uv0.lastRequestVersionTime > 1800) then
		uv0.lastRequestVersionTime = Time.realtimeSinceStartup

		pg.UIMgr.GetInstance():LoadingOn()

		slot2 = true

		VersionMgr.Inst:FetchVersion(function (slot0)
			pg.UIMgr.GetInstance():LoadingOff()

			uv0 = false

			if UpdateMgr.Inst.currentVersion.Build < slot0.Build then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("new_version_tip"),
					weight = LayerWeightConst.TOP_LAYER,
					onYes = function ()
						Application.Quit()
					end
				})
			end
		end)
		LeanTween.delayedCall(3, System.Action(function ()
			if uv0 then
				pg.UIMgr.GetInstance():LoadingOff()
			end
		end))
	end
end

return slot0
