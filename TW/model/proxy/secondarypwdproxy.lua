slot0 = class("SecondaryPWDProxy", import(".NetProxy"))

function slot0.register(slot0)
	slot0.data = slot0.data or {}
	slot0.data.state = 0
	slot0.data.fail_count = 0
	slot0.data.fail_cd = nil
	slot0.data.notice = nil
	slot0.data.system_list = {}
end

function slot0.SetData(slot0, slot1)
	slot0.data = slot0.data or {}
	slot0.data.state = slot1.state
	slot0.data.fail_count = slot1.fail_count
	slot0.data.fail_cd = slot1.fail_cd
	slot0.data.notice = slot1.notice
	slot0.data.system_list = {}

	for slot6 = 1, #pg.SecondaryPWDMgr.LIMITED_OPERATION, 1 do
		table.insert(slot2.system_list, slot1.system_list[slot6])
	end
end

function slot0.OnFirstSet(slot0, slot1)
	slot0.data = slot0.data or {}
	slot0.data.state = 1
	slot0.data.system_list = Clone(slot1.settings)
	slot0.data.fail_count = 0
	slot0.data.fail_cd = nil
	slot0.data.notice = Clone(slot1.tip)
end

function slot0.OnSettingsChange(slot0, slot1)
	slot0.data = slot0.data or {}
	slot0.data.state = (#slot1.settings == 0 and 0) or 2
	slot0.data.system_list = Clone(slot1.settings)
	slot0.data.fail_cd = nil
	slot0.data.fail_count = 0
end

function slot0.GetPermissionState(slot0)
	if slot0.data.state == 0 then
		return true
	end

	slot3 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.data.fail_cd and slot3 < slot2 then
		return false, slot2 - slot3
	end

	return true
end

return slot0
