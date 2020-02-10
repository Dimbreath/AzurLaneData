slot0 = class("ActivityBuff", import(".BaseVO"))

function slot0.bindConfigTable(slot0)
	return pg.benefit_buff_template
end

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.activityId = slot1
	slot0.id = slot2
	slot0.configId = slot0.id
	slot0.timestamp = slot3
end

function slot0.isActivate(slot0)
	slot1 = false

	if getProxy(ActivityProxy):getActivityById(slot0.activityId) and not slot3:isEnd() then
		if slot0:getConfig("benefit_condition")[1] == "lv" then
			slot1 = loadstring("return " .. getProxy(PlayerProxy):getRawData().level .. slot4[2] .. slot4[3])()
		end

		if slot4 == "" then
			slot1 = true
		end
	end

	return slot1
end

return slot0
