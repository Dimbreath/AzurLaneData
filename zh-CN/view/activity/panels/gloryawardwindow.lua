function slot1(slot0)
	slot2 = getProxy(TaskProxy)

	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = slot1:getTaskVO(slot3)

			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setText(slot2:Find("target/title"), slot4:getConfig("desc"))
			setText(slot2:Find("target/Text"), "")
			updateDrop(slot2:Find("award"), slot6)
			onButton(slot2.binder, slot2:Find("award"), function ()
				slot0.binder:emit(BaseUI.ON_DROP, slot0.binder)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), slot4:isReceive())
		end
	end)
	slot0.UIlist:align(#slot0.taskList)
end

class("GloryAwardWindow", import(".PtAwardWindow")).Show = function (slot0, slot1)
	slot0.taskList = slot1.taskList
	slot0.taskVO = slot1.taskVO

	slot0(slot0)

	slot0.totalTxt.text = slot0.taskVO:getProgress()
	slot0.totalTitleTxt.text = i18n("pt_total_count", i18n("pass_times"))

	setActive(slot0._tf, true)
end

return class("GloryAwardWindow", import(".PtAwardWindow"))
