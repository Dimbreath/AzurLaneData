pg = pg or {}
slot1 = {}
pg.AssistantInfo = slot1
slot2 = false
slot3.idleRandom1 = {
	action = "main_1",
	dialog = "main_1"
}
slot3.idleRandom2 = {
	action = "main_2",
	dialog = "main_2"
}
slot3.idleRandom3 = {
	action = "main_3",
	dialog = "main_3"
}
slot3.idleRandom4 = {
	action = "idle_1",
	dialog = "main_4"
}
slot3.idleRandom5 = {
	action = "idle_2",
	dialog = "main_5"
}
slot3.idleRandom6 = {
	action = "idle_3",
	dialog = "main_6"
}
slot3.event_complete = {
	action = "complete",
	dialog = "expedition"
}
slot3.event_login = {
	action = "login",
	dialog = "login"
}
slot3.home = {
	action = "home",
	dialog = "home"
}
slot3.mail = {
	action = "mail",
	dialog = "mail"
}
slot3.mission = {
	action = "mission",
	dialog = "mission"
}
slot3.mission_complete = {
	action = "mission_complete",
	dialog = "mission_complete"
}
slot3.event_wedding = {
	action = "wedding",
	dialog = "propose"
}
slot3.TouchHead = {
	action = "touch_head",
	dialog = "headtouch"
}
slot3.TouchBody = {
	action = "touch_body",
	dialog = "touch"
}
slot3.TouchSpecial = {
	action = "touch_special",
	dialog = "touch2"
}
slot1.assistantEvents = {}
slot1.assistantTouchParts = {
	"TouchSpecial",
	"TouchHead",
	"TouchBody"
}
slot3[1] = {
	"TouchSpecial"
}
slot3[2] = {
	"TouchHead"
}
slot3[3] = {
	"TouchBody",
	"idleRandom1",
	"idleRandom2",
	"idleRandom3",
	"idleRandom4",
	"idleRandom5",
	"idleRandom6"
}
slot1.assistantTouchEvents = {}
slot1.action2Id = {
	touch_body = 13,
	wedding = 11,
	idle = 1,
	main_1 = 2,
	gold = 15,
	touch_special = 14,
	home = 7,
	mission = 9,
	main_2 = 3,
	oil = 16,
	mail = 8,
	main_3 = 4,
	complete = 5,
	mission_complete = 10,
	diamond = 17,
	login = 6,
	touch_head = 12
}
slot1.action2Words = {
	"main1",
	"main2",
	"main3",
	"mission",
	"mission_complete",
	"expedition",
	"login",
	"home",
	"mail",
	"touch",
	"touch2",
	"headtouch"
}
slot3[1] = slot1.action2Id.idle
slot1.idleActions = {}
slot1.IdleEvents = {
	"idleRandom1",
	"idleRandom2",
	"idleRandom3",
	"idleRandom4",
	"idleRandom5",
	"idleRandom6"
}
slot1.PaintingTouchEvents = {
	"TouchBody",
	"idleRandom1",
	"idleRandom2",
	"idleRandom3",
	"idleRandom4",
	"idleRandom5",
	"idleRandom6"
}
slot1.PaintingTouchParts = {
	3 = "TouchHead",
	1 = "TouchSpecial",
	2 = "TouchBody"
}

function slot1.enable()
	return uv0
end

function slot1.getAssistantTouchEvents(slot0)
	if uv0.enable() and uv0.assistantTouchParts[slot0] == "TouchSpecial" then
		slot0 = 1
	end

	return uv0.assistantTouchEvents[slot0]
end

function slot1.getPaintingTouchEvents(slot0)
	if uv0.enable() and uv0.PaintingTouchParts[slot0] == "TouchSpecial" then
		slot0 = "1"
	end

	return uv0.PaintingTouchParts[slot0]
end

function slot1.isDisableSpecialClick(slot0)
	if uv0.enable() and slot0 == "touch2" then
		return true
	end

	return false
end

function slot1.filterAssistantEvents(slot0, slot1)
	for slot7, slot8 in ipairs(slot0) do
		if string.split(uv0.assistantEvents[slot8].dialog, "_")[1] == "main" then
			if tonumber(slot11[2]) <= ShipWordHelper.GetMainSceneWordCnt(slot1) then
				table.insert({}, slot8)
			end
		else
			table.insert(slot2, slot8)
		end
	end

	return slot2
end

slot4.faces = {
	mission_complete = "1",
	feeling3 = "1",
	feeling2 = "1",
	feeling4 = "2",
	expedition = "1",
	propose = "2",
	home = "1",
	mission = "1",
	touch2 = "1",
	login = "1",
	touch = "2",
	main_3 = "1",
	detail = "1"
}
slot3.dunkeerke = {}
slot4.faces = {
	login = "2",
	win_mvp = "1",
	mission_complete = "2",
	battle = "1"
}
slot3.masazhusai = {}
slot4.faces = {
	touch2 = "3",
	touch = "3",
	main_1 = "1",
	feeling5 = "1",
	main_2 = "1",
	win_mvp = "1",
	home = "3"
}
slot3.xixuegui_3 = {}
slot4.faces = {
	feeling4 = "4",
	feeling3 = "9",
	main_1 = "10",
	mail = "9",
	expedition = "3",
	lose = "14",
	home = "4",
	mission = "2",
	touch2 = "14",
	main_2 = "7",
	touch = "3",
	main_3 = "6",
	feeling5 = "2",
	profile = "9",
	mission_complete = "5",
	feeling2 = "4",
	detail = "13"
}
slot3.safuke = {}
slot4.faces = {
	touch2 = "1",
	feeling3 = "2",
	main_1 = "2",
	win_mvp = "2",
	main_2 = "1",
	lose = "1",
	mission_complete = "2",
	feeling4 = "2"
}
slot3.bushi = {}
slot4.faces = {
	login = "3",
	feeling3 = "4",
	main_1 = "2",
	feeling4 = "3",
	expedition = "3",
	touch2 = "4",
	main_2 = "4",
	feeling1 = "1",
	main_3 = "3",
	detail = "4"
}
slot3.banrenma = {}
slot4.faces = {
	touch = "1",
	feeling1 = "3",
	main_1 = "2",
	lose = "3",
	touch_2 = "1",
	detail = "2"
}
slot3.birui_2 = {}
slot4.faces = {
	touch2 = "2",
	mail = "1",
	mission = "3",
	feeling1 = "3",
	main_2 = "1",
	lose = "3",
	home = "1",
	detail = "1"
}
slot3.sanli_2 = {}
slot4.faces = {
	touch2 = "2",
	mission_complete = "1",
	main_1 = "3",
	touch = "2",
	login = "3",
	win_mvp = "1",
	main_3 = "1",
	feeling1 = "2"
}
slot3.bangfeng_2 = {}
slot4.faces = {
	feeling1 = "3",
	mail = "2",
	login = "2",
	expedition = "2",
	home = "1",
	feeling2 = "2",
	main_2 = "1",
	touch = "1",
	main_3 = "3",
	detail = "3"
}
slot3.chuixue_4 = {}
slot4.faces = {
	touch2 = "3",
	main_3 = "2",
	feeling1 = "3",
	feeling2 = "2",
	login = "1",
	touch = "3",
	home = "2",
	detail = "1"
}
slot3.zaoshen_2 = {}
slot4.faces = {
	touch2 = "1",
	main_3 = "1",
	main_1 = "3",
	main_2 = "2",
	login = "3",
	feeling1 = "1",
	home = "3",
	detail = "2"
}
slot3.luodeni_3 = {}
slot4.faces = {
	default = "0"
}
slot3.ajiakesi_2 = {}
slot4.faces = {
	touch2 = "3",
	main_3 = "2",
	feeling1 = "3",
	feeling2 = "2",
	login = "1",
	touch = "3",
	home = "2",
	detail = "1"
}
slot3.zaoshen_2 = {}
slot4.faces = {
	default = "0",
	feeling3 = "1",
	feeling5 = "3",
	main_1 = "3",
	main_2 = "1",
	upgrade = "1",
	mission_complete = "3",
	mail = "1",
	touch2 = "1",
	propose = "2",
	login = "3",
	touch = "2"
}
slot3.ajiakesi_2 = {}
slot4.faces = {
	login = "3",
	feeling1 = "1",
	feeling4 = "3",
	expedition = "2",
	home = "2",
	touch2 = "3",
	main_2 = "3",
	touch = "2",
	main_3 = "1",
	detail = "2"
}
slot3.daqinghuayu = {}
slot4.faces = {
	mission_complete = "1",
	login = "1",
	feeling1 = "1",
	feeling2 = "3",
	propose = "2",
	home = "3",
	touch2 = "1",
	main_2 = "2",
	touch = "2",
	main_3 = "3",
	detail = "3"
}
slot3.U81_2 = {}
slot4.faces = {
	touch2 = "3",
	feeling3 = "2",
	feeling5 = "3",
	feeling1 = "1",
	expedition = "2",
	touch = "2",
	main_3 = "2"
}
slot3.aisaikesi = {}
slot4.faces = {
	main_1 = "2",
	propose = "1",
	feeling5 = "1",
	lose = "2",
	win_mvp = "2",
	mission = "3",
	touch2 = "2",
	battle = "3",
	mail = "3",
	touch = "1",
	main_3 = "3"
}
slot3.chuixue_3 = {}
slot4.faces = {
	mail = "4",
	feeling1 = "2",
	main_1 = "3",
	propose = "1",
	hp_warning = "3",
	mission = "2",
	touch2 = "3",
	skill = "3",
	battle = "2",
	login = "4",
	touch = "4",
	main_3 = "2",
	detail = "1"
}
slot3.guanghui_3 = {}
slot4.faces = {
	mail = "2",
	login = "3",
	main_1 = "1",
	win_mvp = "1",
	lose = "2",
	upgrade = "1",
	mission = "3",
	touch2 = "2",
	battle = "2",
	main_2 = "3",
	touch = "1",
	main_3 = "1"
}
slot3.junzhu_2 = {}
slot4.faces = {
	feeling4 = "4",
	feeling1 = "1",
	main_1 = "3",
	touch = "10",
	propose = "5",
	win_mvp = "4",
	home = "7",
	mission = "12",
	touch2 = "7",
	hp_warning = "9",
	main_2 = "12",
	lose = "9",
	main_3 = "11",
	feeling5 = "8",
	upgrade = "3",
	mission_complete = "7",
	feeling2 = "8",
	battle = "1",
	detail = "2"
}
slot3.lumang = {}
slot4.faces = {
	mission_complete = "2",
	feeling3 = "1",
	main_1 = "1",
	main = "3",
	feeling2 = "3",
	upgrade = "1",
	home = "3",
	feeling1 = "4",
	touch2 = "2",
	win_mvp = "2",
	lose = "3",
	hp_warning = "4",
	touch = "3",
	main_3 = "2",
	detail = "4"
}
slot3.mingshi_3 = {}
slot4.faces = {
	feeling1 = "3",
	feeling3 = "3",
	feeling5 = "1",
	touch2 = "3",
	propose = "2",
	lose = "1",
	mission_complete = "3",
	mission = "3",
	feeling2 = "1",
	feeling4 = "2",
	touch = "2"
}
slot3.nvjiang_2 = {}
slot4.faces = {
	mission_complete = "3",
	feeling3 = "2",
	main_1 = "2",
	feeling2 = "3",
	main_2 = "4",
	feeling5 = "1",
	home = "1",
	propose = "4",
	touch2 = "2",
	skill = "3",
	login = "4",
	lose = "1",
	main_3 = "1",
	detail = "3"
}
slot3.ouruola_3 = {}
slot4.faces = {
	mail = "2",
	feeling3 = "2",
	main_1 = "2",
	mission_complete = "3",
	mission = "3",
	touch2 = "1",
	hp_warning = "1",
	login = "1",
	feeling1 = "1",
	main_3 = "1",
	detail = "3"
}
slot3.yilishabai_2 = {}
slot4.faces = {
	feeling1 = "3",
	home = "4",
	main_1 = "1",
	login = "4",
	feeling4 = "2",
	propose = "4",
	mission_complete = "1",
	lose = "1",
	hp_warning = "3",
	battle = "3",
	main_2 = "3",
	touch = "4",
	detail = "2"
}
slot3.nandaketa_2 = {}
slot4.faces = {
	touch = "1",
	feeling3 = "1",
	feeling1 = "2",
	main_2 = "1",
	expedition = "1",
	hp_warning = "5",
	battle = "5",
	mail = "3",
	lose = "4",
	main_3 = "5"
}
slot3.dafeng = {}
slot4.faces = {
	feeling1 = "1",
	feeling3 = "2",
	main_1 = "1",
	feeling5 = "3",
	mission_complete = "2",
	lose = "1",
	home = "1",
	mission = "2",
	hp_warning = "1",
	skill = "3",
	battle = "1",
	mail = "3",
	touch = "3",
	main_3 = "3",
	detail = "2"
}
slot3.dafeng_2 = {}
slot4.faces = {
	main_2 = "1",
	feeling1 = "2",
	upgrade = "3",
	win_mvp = "2",
	touch2 = "2",
	battle = "2",
	propose = "1",
	lose = "1",
	main_3 = "2"
}
slot3.huangchao = {}
slot4.faces = {
	feeling4 = "1",
	feeling1 = "2",
	feeling5 = "3",
	mission_complete = "3",
	propose = "1",
	win_mvp = "2",
	home = "3",
	lose = "2",
	touch2 = "1",
	main_2 = "1",
	touch = "2",
	main_3 = "3",
	detail = "3"
}
slot3.gaoxiong_h = {}
slot4.faces = {
	propose = "2",
	feeling3 = "3",
	main_1 = "1",
	feeling1 = "4",
	mission_complete = "1",
	upgrade = "1",
	home = "1",
	feeling5 = "1",
	touch2 = "2",
	win_mvp = "4",
	skill = "1",
	main_2 = "2",
	touch = "3",
	main_3 = "4",
	detail = "2"
}
slot3.jiahe_h = {}
slot4.faces = {
	propose = "2",
	feeling3 = "1",
	main_1 = "1",
	feeling1 = "1",
	hp_warning = "1",
	win_mvp = "5",
	home = "5",
	touch2 = "5",
	skill = "4",
	main_2 = "5",
	touch = "2",
	feeling5 = "5",
	mission_complete = "1",
	headtouch = "3",
	battle = "4",
	login = "3",
	detail = "2"
}
slot3.lingbo_h = {}
slot4.faces = {
	home = "1",
	login = "1",
	main_1 = "3",
	feeling1 = "4",
	propose = "1",
	upgrade = "3",
	mission_complete = "1",
	lose = "2",
	feeling2 = "2",
	touch2 = "1",
	battle = "1",
	main_2 = "2",
	touch = "3"
}
slot3.shancheng_4 = {}
slot4.faces = {
	lose = "2",
	propose = "1",
	main_1 = "3",
	feeling4 = "1",
	feeling1 = "2",
	hp_warning = "2",
	home = "3",
	mission = "2",
	touch2 = "1",
	skill = "2",
	main_2 = "2",
	touch = "3",
	main_3 = "1",
	feeling5 = "3",
	upgrade = "2",
	battle = "2",
	login = "3",
	detail = "1"
}
slot3.xili_h = {}
slot4.faces = {
	login = "3",
	feeling3 = "1",
	main_1 = "1",
	mission = "3",
	touch2 = "2",
	skill = "2",
	battle = "2",
	main_2 = "3",
	lose = "4",
	main_3 = "2"
}
slot3.xiao_2 = {}
slot4.faces = {
	feeling4 = "2",
	login = "4",
	propose = "3",
	win_mvp = "1",
	touch2 = "3",
	upgrade = "2",
	mission_complete = "3",
	feeling2 = "4",
	skill = "2",
	hp_warning = "3",
	main_2 = "4",
	feeling1 = "1",
	main_3 = "3",
	detail = "3"
}
slot3.shengdiyage_g = {}
slot4.faces = {
	mail = "2",
	feeling3 = "3",
	feeling5 = "1",
	main_1 = "3",
	login = "3",
	win_mvp = "3",
	mission_complete = "1",
	lose = "2",
	touch2 = "3",
	battle = "2",
	main_2 = "1",
	touch = "1"
}
slot3.shentong_2 = {}
slot4.faces = {
	home = "2",
	feeling4 = "1",
	propose = "1",
	win_mvp = "1",
	lose = "2",
	upgrade = "3",
	mission_complete = "3",
	headtouch = "3",
	feeling2 = "1",
	touch2 = "2",
	skill = "1",
	hp_warning = "2",
	login = "1",
	feeling1 = "2",
	main_3 = "1",
	detail = "1"
}
slot3.huobi = {}
slot4.faces = {
	lose = "3",
	feeling3 = "1",
	feeling4 = "1",
	propose = "1",
	win_mvp = "2",
	touch2 = "1",
	skill = "1",
	main_2 = "2",
	feeling1 = "3",
	main_3 = "1",
	feeling5 = "1",
	upgrade = "2",
	mission_complete = "3",
	headtouch = "1",
	hp_warning = "3",
	login = "1",
	detail = "1"
}
slot3.huobi_2 = {}
slot4.faces = {
	feeling4 = "2",
	login = "2",
	feeling5 = "3",
	propose = "2",
	win_mvp = "2",
	upgrade = "2",
	mission_complete = "2",
	touch2 = "3",
	feeling2 = "2",
	skill = "2",
	hp_warning = "3",
	main_2 = "2",
	feeling1 = "3",
	main_3 = "1",
	detail = "2"
}
slot3.keerke = {}
slot4.faces = {
	home = "2",
	feeling4 = "2",
	propose = "3",
	win_mvp = "3",
	expedition = "3",
	upgrade = "2",
	mission_complete = "3",
	mission = "3",
	feeling2 = "2",
	touch2 = "2",
	skill = "3",
	hp_warning = "3",
	login = "3",
	feeling1 = "1",
	main_3 = "2",
	detail = "2"
}
slot3.keerke_2 = {}
slot4.faces = {
	feeling4 = "2",
	login = "3",
	propose = "3",
	win_mvp = "3",
	lose = "1",
	upgrade = "2",
	mission_complete = "3",
	touch2 = "1",
	feeling2 = "3",
	skill = "3",
	hp_warning = "1",
	main_2 = "2",
	feeling1 = "1",
	main_3 = "1",
	detail = "3"
}
slot3.keluoladuo = {}
slot4.faces = {
	login = "3",
	mission_complete = "3",
	feeling4 = "2",
	win_mvp = "2",
	expedition = "3",
	upgrade = "2",
	home = "1",
	lose = "1",
	feeling2 = "3",
	touch2 = "3",
	skill = "3",
	hp_warning = "1",
	main_2 = "1",
	feeling1 = "1",
	main_3 = "3",
	detail = "3"
}
slot3.malilan = {}
slot4.faces = {
	lose = "2",
	propose = "3",
	feeling4 = "2",
	feeling1 = "1",
	hp_warning = "3",
	win_mvp = "1",
	home = "1",
	mission = "3",
	touch2 = "1",
	skill = "3",
	main_2 = "1",
	touch = "3",
	main_3 = "3",
	upgrade = "3",
	feeling2 = "3",
	battle = "3",
	login = "3",
	detail = "1"
}
slot3.mingniabolisi = {}
slot4.faces = {
	feeling4 = "2",
	feeling3 = "1",
	login = "2",
	propose = "3",
	win_mvp = "2",
	upgrade = "3",
	mission_complete = "1",
	lose = "1",
	touch2 = "3",
	hp_warning = "2",
	skill = "2",
	battle = "2",
	main_2 = "1",
	feeling1 = "2",
	main_3 = "1",
	detail = "1"
}
slot3.mingniabolisi_2 = {}
slot4.faces = {
	feeling4 = "1",
	login = "2",
	feeling5 = "1",
	propose = "1",
	win_mvp = "2",
	upgrade = "1",
	mission_complete = "1",
	lose = "3",
	feeling2 = "2",
	touch2 = "3",
	skill = "2",
	hp_warning = "3",
	main_2 = "3",
	feeling1 = "3",
	main_3 = "2",
	detail = "3"
}
slot3.xifujiniya = {}
slot4.faces = {
	feeling4 = "4",
	feeling3 = "1",
	main_1 = "4",
	feeling1 = "2",
	propose = "3",
	win_mvp = "4",
	home = "4",
	lose = "1",
	touch2 = "2",
	skill = "2",
	main_2 = "2",
	touch = "1",
	main_3 = "1",
	feeling5 = "3",
	upgrade = "3",
	mission_complete = "3",
	feeling2 = "4",
	battle = "2",
	login = "3",
	detail = "2"
}
slot3.mengfeisi = {}
slot4.faces = {
	login = "2",
	mail = "1",
	feeling5 = "1",
	feeling4 = "2",
	expedition = "1",
	upgrade = "1",
	mission_complete = "1",
	propose = "1",
	feeling2 = "2",
	win_mvp = "2",
	skill = "2",
	hp_warning = "1",
	main_2 = "1",
	feeling1 = "1",
	main_3 = "2",
	detail = "2"
}
slot3.beili_2 = {}
slot4.faces = {
	feeling4 = "3",
	login = "2",
	feeling5 = "3",
	propose = "2",
	win_mvp = "2",
	upgrade = "1",
	touch2 = "2",
	feeling2 = "2",
	skill = "2",
	main_2 = "3",
	touch = "3",
	main_3 = "2",
	detail = "1"
}
slot3.kongbu_2 = {}
slot4.faces = {
	feeling4 = "1",
	feeling3 = "3",
	feeling5 = "3",
	login = "2",
	propose = "2",
	upgrade = "3",
	home = "1",
	win_mvp = "2",
	skill = "2",
	hp_warning = "3",
	main_2 = "3",
	lose = "3",
	main_3 = "2",
	detail = "3"
}
slot3.naerxun_2 = {}
slot4.faces = {
	lose = "3",
	feeling3 = "5",
	feeling4 = "2",
	mail = "4",
	propose = "5",
	win_mvp = "5",
	feeling1 = "3",
	touch2 = "2",
	skill = "2",
	main_2 = "3",
	touch = "5",
	main_3 = "2",
	feeling5 = "4",
	upgrade = "1",
	mission_complete = "1",
	feeling2 = "2",
	hp_warning = "3",
	login = "2",
	detail = "1"
}
slot3.wushiling_2 = {}
slot4.faces = {
	upgrade = "1",
	propose = "1",
	feeling4 = "1",
	lose = "2",
	win_mvp = "1",
	mission_complete = "1",
	hp_warning = "2",
	main_2 = "1",
	feeling1 = "2",
	detail = "1"
}
slot3.heizewude = {}
slot4.faces = {
	lose = "6",
	feeling3 = "4",
	feeling4 = "2",
	mail = "4",
	propose = "2",
	win_mvp = "2",
	feeling1 = "5",
	touch2 = "6",
	skill = "4",
	main_2 = "3",
	touch = "5",
	main_3 = "2",
	feeling5 = "2",
	upgrade = "3",
	mission_complete = "1",
	feeling2 = "2",
	hp_warning = "5",
	login = "2",
	detail = "1"
}
slot3.kangkede = {}
slot4.faces = {
	feeling1 = "5",
	feeling3 = "2",
	feeling4 = "2",
	propose = "1",
	mail = "3",
	win_mvp = "2",
	lose = "4",
	mission = "2",
	touch2 = "1",
	hp_warning = "5",
	skill = "4",
	main_2 = "2",
	touch = "3",
	main_3 = "1",
	feeling5 = "2",
	upgrade = "3",
	mission_complete = "2",
	feeling2 = "1",
	battle = "1",
	login = "2",
	detail = "1"
}
slot3.kangkede_2 = {}
slot4.faces = {
	login = "1",
	feeling3 = "2",
	feeling5 = "2",
	win_mvp = "2",
	lose = "3",
	upgrade = "1",
	mission_complete = "1",
	skill = "3",
	hp_warning = "3",
	main_2 = "2",
	feeling1 = "3",
	main_3 = "1",
	detail = "2"
}
slot3.fumilulu = {}
slot4.faces = {
	mission_complete = "1",
	feeling3 = "2",
	main_2 = "2",
	mission = "2",
	expedition = "1",
	upgrade = "1",
	home = "1",
	headtouch = "3",
	touch2 = "2",
	win_mvp = "3",
	lose = "3",
	hp_warning = "3",
	login = "1",
	feeling1 = "3",
	main_3 = "3",
	feeling4 = "1"
}
slot3.jiuyuan = {}
slot4.faces = {
	lose = "3",
	propose = "2",
	main_1 = "1",
	feeling4 = "1",
	hp_warning = "2",
	win_mvp = "2",
	home = "1",
	touch2 = "2",
	skill = "2",
	main_2 = "2",
	feeling1 = "3",
	main_3 = "2",
	feeling5 = "2",
	upgrade = "1",
	mission_complete = "1",
	headtouch = "3",
	battle = "2",
	login = "2",
	detail = "2"
}
slot3.lulutiye = {}
slot4.faces = {
	home = "2",
	login = "2",
	headtouch = "3",
	feeling1 = "3",
	feeling4 = "1",
	upgrade = "1",
	mission_complete = "1",
	mission = "2",
	feeling2 = "2",
	propose = "2",
	lose = "3",
	hp_warning = "2",
	main_2 = "2",
	touch = "2",
	touch2 = "2",
	detail = "2"
}
slot3.maoyin = {}
slot4.faces = {
	lose = "1",
	feeling3 = "3",
	feeling4 = "3",
	win_mvp = "2",
	home = "3",
	touch2 = "1",
	skill = "2",
	main_2 = "2",
	feeling1 = "1",
	main_3 = "2",
	feeling5 = "3",
	upgrade = "1",
	mission_complete = "3",
	headtouch = "1",
	hp_warning = "2",
	login = "3",
	detail = "3"
}
slot3.salana = {}
slot4.faces = {
	lose = "3",
	feeling3 = "2",
	feeling4 = "2",
	propose = "2",
	win_mvp = "2",
	home = "1",
	touch2 = "1",
	skill = "1",
	main_2 = "2",
	feeling1 = "3",
	main_3 = "3",
	feeling5 = "2",
	upgrade = "1",
	mission_complete = "1",
	headtouch = "1",
	hp_warning = "1",
	login = "2",
	detail = "2"
}
slot3.wululu = {}
slot4.faces = {
	propose = "1",
	feeling4 = "4",
	main_1 = "4",
	feeling1 = "2",
	mail = "3",
	win_mvp = "1",
	lose = "2",
	mission = "2",
	touch2 = "4",
	hp_warning = "1",
	skill = "1",
	main_2 = "3",
	touch = "3",
	main_3 = "1",
	feeling5 = "1",
	upgrade = "1",
	mission_complete = "4",
	feeling2 = "1",
	battle = "1",
	login = "1",
	detail = "1"
}
slot3.longxiang = {}
slot4.faces = {
	propose = "1",
	feeling3 = "1",
	main_1 = "2",
	feeling4 = "3",
	expedition = "1",
	win_mvp = "2",
	home = "1",
	mission = "1",
	touch2 = "2",
	hp_warning = "1",
	skill = "1",
	mail = "2",
	main_2 = "2",
	main_3 = "3",
	feeling5 = "1",
	upgrade = "1",
	mission_complete = "3",
	headtouch = "1",
	feeling2 = "1",
	battle = "1",
	login = "2",
	detail = "1"
}
slot3.longxiang_2 = {}
slot4.faces = {
	feeling1 = "4",
	feeling3 = "1",
	main_1 = "2",
	main_2 = "6",
	touch = "1",
	win_mvp = "3",
	home = "5",
	mail = "7",
	touch2 = "1",
	upgrade = "3",
	hp_warning = "4",
	feeling4 = "7",
	lose = "4",
	main_3 = "5",
	profile = "4",
	battle = "3",
	login = "1"
}
slot3.yanzhan_2 = {}
slot4.faces = {
	lose = "4",
	main_2 = "1",
	main_1 = "3",
	feeling1 = "1",
	feeling2 = "3",
	win_mvp = "1",
	mission_complete = "1",
	mission = "3",
	touch2 = "1",
	feeling4 = "1",
	battle = "1",
	login = "3",
	touch = "2",
	detail = "1"
}
slot3.nigulasi_3 = {}
slot4.faces = {
	main_2 = "1",
	feeling3 = "2",
	main_1 = "2",
	feeling1 = "3",
	touch = "1",
	win_mvp = "1",
	home = "1",
	mission = "3",
	feeling4 = "1",
	hp_warning = "2",
	propose = "3",
	lose = "3",
	main_3 = "4",
	feeling5 = "4",
	upgrade = "3",
	feeling2 = "1",
	battle = "3"
}
slot3.pufeng_2 = {}
slot4.faces = {
	upgrade = "3",
	feeling3 = "4",
	feeling1 = "2",
	propose = "4",
	hp_warning = "3",
	win_mvp = "4",
	mission_complete = "4",
	touch2 = "1",
	battle = "3",
	feeling4 = "2",
	lose = "1",
	main_3 = "4",
	detail = "3"
}
slot3.dachao_2 = {}
slot4.faces = {
	feeling1 = "3",
	lose = "4",
	mail = "1",
	feeling2 = "2",
	mission_complete = "2",
	mission = "1",
	touch2 = "4",
	main_2 = "1",
	touch = "1"
}
slot3.yueke_g = {}
slot4.faces = {
	feeling1 = "3",
	lose = "4",
	mail = "1",
	feeling2 = "2",
	mission_complete = "2",
	mission = "1",
	touch2 = "4",
	main_2 = "1",
	touch = "1"
}
slot3.yueke_g = {}
slot4.faces = {
	feeling5 = "2",
	feeling3 = "1",
	main_1 = "3",
	propose = "2",
	hp_warning = "1",
	win_mvp = "3",
	mission = "1",
	touch2 = "3",
	skill = "3",
	battle = "1",
	feeling4 = "2",
	lose = "1",
	main_3 = "1",
	detail = "1"
}
slot3.canglong_g = {}
slot4.faces = {
	win_mvp = "1",
	feeling3 = "1",
	main_1 = "3",
	feeling2 = "3",
	mission_complete = "1",
	upgrade = "1",
	home = "1",
	feeling5 = "3",
	touch2 = "2",
	propose = "3",
	skill = "2",
	battle = "2",
	feeling4 = "3",
	feeling1 = "2",
	main_3 = "1",
	hp_warning = "2"
}
slot3.feilong_g = {}
slot4.faces = {
	mission_complete = "1",
	feeling3 = "1",
	feeling5 = "1",
	feeling2 = "2",
	upgrade = "1",
	win_mvp = "2",
	home = "2",
	feeling4 = "2",
	touch2 = "3",
	touch = "2",
	skill = "2",
	propose = "3",
	main_2 = "2",
	lose = "3",
	main_3 = "1",
	detail = "2"
}
slot3.tiancheng = {}
slot4.faces = {
	login = "1",
	feeling3 = "2",
	upgrade = "1",
	feeling1 = "3",
	feeling2 = "2",
	profile = "2",
	main_2 = "2",
	mission = "3",
	touch2 = "2",
	feeling4 = "1",
	mail = "3",
	lose = "2",
	detail = "2"
}
slot3.jiahezhanlie = {}
slot4.faces = {
	feeling1 = "4",
	feeling3 = "5",
	main_1 = "2",
	main_2 = "1",
	expedition = "1",
	win_mvp = "2",
	home = "1",
	mission = "5",
	touch2 = "4",
	feeling4 = "6",
	propose = "3",
	mail = "1",
	touch = "5",
	main_3 = "3",
	feeling5 = "5",
	upgrade = "1",
	mission_complete = "1",
	login = "1",
	detail = "5"
}
slot3.zubing = {}
slot4.faces = {
	upgrade = "1",
	feeling3 = "2",
	feeling5 = "2",
	mail = "2",
	feeling1 = "4",
	win_mvp = "2",
	home = "1",
	headtouch = "2",
	touch2 = "4",
	lose = "3",
	feeling4 = "3",
	hp_warning = "3",
	main_2 = "4",
	touch = "2",
	main_3 = "1",
	mission = "3"
}
slot3.juanbo = {}
slot4.faces = {
	default = "0",
	feeling1 = "1",
	feeling5 = "2",
	feeling4 = "3",
	feeling2 = "3",
	upgrade = "3",
	propose = "2",
	mission = "1",
	touch2 = "2",
	hp_warning = "2",
	battle = "1",
	login = "3",
	lose = "2",
	main_3 = "3"
}
slot3.qifeng = {}
slot4.faces = {
	touch = "3",
	feeling1 = "2",
	feeling5 = "3",
	feeling4 = "2",
	expedition = "1",
	win_mvp = "1",
	mission_complete = "1",
	touch2 = "2",
	main_2 = "1",
	lose = "2",
	detail = "1"
}
slot3.kelifulan_h = {}
slot4.faces = {
	touch = "2",
	feeling3 = "3",
	main_1 = "3",
	feeling2 = "1",
	feeling1 = "1",
	upgrade = "1",
	mission_complete = "2",
	feeling5 = "3",
	touch2 = "1",
	propose = "1",
	battle = "1",
	login = "2",
	lose = "1",
	detail = "3"
}
slot3.xiaotiane_5 = {}
slot4.faces = {
	mail = "2",
	feeling1 = "2",
	main_1 = "3",
	feeling5 = "4",
	hp_warning = "2",
	mission = "1",
	touch2 = "3",
	skill = "1",
	battle = "1",
	login = "3",
	lose = "2",
	main_3 = "3",
	detail = "2"
}
slot3.aierdeliqi_4 = {}
slot4.faces = {
	battle = "3",
	feeling3 = "1",
	main_1 = "4",
	feeling1 = "1",
	feeling4 = "6",
	win_mvp = "4",
	home = "6",
	propose = "2",
	touch2 = "6",
	skill = "3",
	mail = "2",
	lose = "5",
	main_3 = "1",
	feeling5 = "4",
	profile = "6",
	mission_complete = "3",
	hp_warning = "3"
}
slot3.yichui_2 = {}
slot4.faces = {
	main_2 = "3",
	feeling3 = "1",
	feeling5 = "3",
	feeling2 = "2",
	expedition = "2",
	win_mvp = "3",
	mission_complete = "2",
	propose = "2",
	touch2 = "2",
	battle = "2",
	login = "2",
	touch = "1",
	main_3 = "3",
	detail = "3"
}
slot3.chuyun_2 = {}
slot4.faces = {
	feeling1 = "4",
	feeling3 = "1",
	main_1 = "1",
	feeling2 = "2",
	expedition = "2",
	upgrade = "2",
	home = "3",
	mission = "4",
	touch2 = "3",
	feeling4 = "3",
	feeling5 = "3",
	battle = "4",
	login = "2",
	lose = "4",
	main_3 = "2",
	propose = "2"
}
slot3.weiershiqinwang_4 = {}
slot4.faces = {
	main_2 = "1",
	feeling3 = "4",
	main_1 = "3",
	feeling1 = "2",
	feeling2 = "1",
	upgrade = "2",
	home = "1",
	mission_complete = "3",
	touch2 = "5",
	feeling4 = "3",
	hp_warning = "3",
	login = "1",
	lose = "2"
}
slot3.shengluyisi_3 = {}
slot4.faces = {
	mail = "1",
	feeling3 = "2",
	main_2 = "3",
	feeling1 = "2",
	expedition = "2",
	win_mvp = "3",
	home = "2",
	mission = "3",
	touch2 = "4",
	feeling4 = "3",
	touch = "4",
	propose = "1",
	lose = "4",
	main_3 = "2",
	feeling5 = "1",
	hp_warning = "2",
	login = "1"
}
slot3.jifeng_2 = {}
slot4.faces = {
	mail = "1",
	feeling3 = "2",
	main_2 = "3",
	feeling1 = "2",
	expedition = "2",
	win_mvp = "3",
	home = "2",
	mission = "3",
	touch2 = "4",
	feeling4 = "3",
	touch = "4",
	propose = "1",
	lose = "4",
	main_3 = "2",
	feeling5 = "1",
	hp_warning = "2",
	login = "1"
}
slot3.hailunna_2 = {}
slot4.faces = {
	feeling4 = "3",
	feeling3 = "2",
	main_1 = "2",
	feeling5 = "2",
	expedition = "1",
	upgrade = "1",
	mission_complete = "3",
	mission = "2",
	touch2 = "1",
	propose = "2",
	battle = "3",
	login = "2",
	lose = "1",
	main_3 = "2"
}
slot3.hailunna_2 = {}
slot4.faces = {
	win_mvp = "4",
	feeling3 = "4",
	feeling5 = "2",
	feeling4 = "2",
	propose = "2",
	profile = "3",
	hp_warning = "3",
	touch2 = "1",
	skill = "3",
	battle = "3",
	main_2 = "2",
	touch = "1",
	main_3 = "4"
}
slot3.mengbiliai_2 = {}
slot4.faces = {
	mission_complete = "3",
	feeling3 = "4",
	main_1 = "4",
	feeling5 = "4",
	propose = "1",
	win_mvp = "3",
	home = "1",
	mission = "4",
	touch2 = "2",
	feeling4 = "2",
	feeling1 = "3",
	main_3 = "1"
}
slot3.zubing_2 = {}
slot4.faces = {
	feeling1 = "1",
	feeling3 = "2",
	main_1 = "2",
	feeling2 = "2",
	touch = "3",
	profile = "3",
	home = "3",
	feeling5 = "3",
	touch2 = "2",
	propose = "3",
	hp_warning = "2",
	feeling4 = "3",
	lose = "1",
	detail = "3"
}
slot3.nake = {}
slot4.faces = {
	main_2 = "2",
	feeling3 = "2",
	mail = "2",
	upgrade = "1",
	propose = "4",
	win_mvp = "3",
	mission = "1",
	touch2 = "3",
	battle = "4",
	login = "4",
	feeling1 = "1",
	main_3 = "3",
	detail = "4"
}
slot3.aidang_h = {}
slot4.faces = {
	upgrade = "3",
	feeling3 = "3",
	feeling5 = "2",
	feeling4 = "2",
	expedition = "3",
	win_mvp = "1",
	propose = "1",
	hp_warning = "3",
	touch2 = "3",
	skill = "3",
	battle = "3",
	main_2 = "3",
	lose = "2",
	main_3 = "1"
}
slot3.xili_3 = {}
slot4.faces = {
	touch = "1",
	feeling3 = "2",
	main_1 = "1",
	feeling1 = "2",
	expedition = "2",
	win_mvp = "1",
	propose = "3",
	mission = "1",
	touch2 = "3",
	feeling4 = "3",
	lose = "3",
	main_3 = "3",
	upgrade = "3",
	mission_complete = "3",
	feeling2 = "3",
	battle = "1",
	login = "3",
	detail = "2"
}
slot3.chuchun_2 = {}
slot4.faces = {
	win_mvp = "1",
	feeling1 = "3",
	main_1 = "1",
	feeling2 = "2",
	expedition = "2",
	upgrade = "2",
	feeling5 = "1",
	mission = "2",
	touch2 = "3",
	propose = "1",
	skill = "2",
	hp_warning = "2",
	mail = "2",
	lose = "3",
	main_3 = "2",
	detail = "1"
}
slot3.wensensi_2 = {}
slot4.faces = {
	main_2 = "2",
	feeling4 = "2",
	feeling5 = "2",
	propose = "3",
	hp_warning = "2",
	win_mvp = "1",
	home = "3",
	mission = "2",
	touch2 = "2",
	battle = "2",
	login = "2",
	feeling1 = "1",
	main_3 = "3",
	detail = "3"
}
slot3.shengli_2 = {}
slot4.faces = {
	main_2 = "2",
	feeling3 = "3",
	feeling5 = "3",
	feeling2 = "2",
	propose = "1",
	upgrade = "3",
	home = "3",
	mission = "2",
	touch2 = "1",
	skill = "2",
	hp_warning = "2",
	login = "3",
	lose = "2",
	main_3 = "3"
}
slot3.tianlangxing = {}
slot4.faces = {
	hp_warning = "5",
	feeling3 = "4",
	feeling4 = "2",
	feeling1 = "5",
	main_2 = "3",
	win_mvp = "6",
	mission = "3",
	touch2 = "4",
	skill = "2",
	propose = "2",
	lose = "5",
	main_3 = "1",
	feeling5 = "6",
	upgrade = "6",
	battle = "4",
	login = "3",
	detail = "1"
}
slot3.yamaijia_2 = {}
slot4.faces = {
	main_2 = "2",
	feeling3 = "2",
	feeling5 = "3",
	win_mvp = "3",
	feeling1 = "1",
	profile = "3",
	mission_complete = "3",
	mission = "2",
	touch2 = "2",
	hp_warning = "1",
	skill = "3",
	battle = "2",
	login = "2",
	lose = "1",
	main_3 = "3",
	detail = "3"
}
slot3.yuekegongjue_3 = {}
slot4.faces = {
	touch = "1",
	feeling1 = "2",
	main_1 = "3",
	feeling2 = "2",
	feeling5 = "1",
	profile = "3",
	home = "1",
	mission = "1",
	touch2 = "3",
	propose = "1",
	skill = "2",
	hp_warning = "2",
	login = "1",
	lose = "3",
	main_3 = "1",
	detail = "1"
}
slot3.tianlangxing_2 = {}
slot4.faces = {
	touch = "3",
	feeling3 = "2",
	feeling5 = "1",
	propose = "1",
	profile = "3",
	touch2 = "2",
	battle = "2",
	main_2 = "3",
	feeling1 = "3",
	main_3 = "2",
	detail = "3"
}
slot3.xiefeierde_2 = {}
slot4.faces = {
	mail = "3",
	feeling3 = "2",
	main_1 = "3",
	feeling5 = "3",
	propose = "3",
	win_mvp = "3",
	hp_warning = "1",
	mission = "3",
	touch2 = "1",
	skill = "3",
	battle = "1",
	main_2 = "2",
	lose = "1",
	touch1 = "3"
}
slot3.changyue = {}
slot4.faces = {
	feeling1 = "6",
	feeling3 = "7",
	main_1 = "6",
	propose = "3",
	expedition = "5",
	win_mvp = "6",
	home = "4",
	mission = "1",
	touch2 = "2",
	hp_warning = "7",
	feeling4 = "5",
	lose = "2",
	main_3 = "4",
	feeling5 = "3",
	mission_complete = "4",
	battle = "7",
	login = "1",
	detail = "5"
}
slot3.gelunweier = {}
slot4.faces = {
	propose = "2",
	login = "3",
	main_1 = "1",
	win_mvp = "4",
	lose = "7",
	upgrade = "5",
	home = "4",
	headtouch = "6",
	battle = "1",
	main_2 = "3",
	touch = "2",
	main_3 = "4"
}
slot3.sipeibojue_3 = {}
slot4.faces = {
	feeling1 = "5",
	feeling3 = "2",
	main_1 = "3",
	touch = "2",
	mail = "2",
	win_mvp = "3",
	feeling4 = "2",
	mission = "3",
	touch2 = "5",
	propose = "2",
	main_2 = "2",
	lose = "4",
	main_3 = "2",
	feeling5 = "2",
	profile = "2",
	mission_complete = "3",
	feeling2 = "3",
	battle = "3",
	login = "3"
}
slot3.huonululu_4 = {}
slot1.Expressions = {}

function slot1.GetCvList()
	for slot4, slot5 in ipairs(uv0.action2Words) do
		if uv1.character_voice[slot5] and not uv1.AssistantInfo.isDisableSpecialClick(slot5) and slot6.unlock_condition[1] >= 0 then
			table.insert({}, slot6)
		end
	end

	return slot0
end

function slot1.GetCVListForProfile()
	for slot4, slot5 in pairs(uv0.character_voice) do
		if not uv0.AssistantInfo.isDisableSpecialClick(slot4) and slot5.unlock_condition[1] >= 0 and slot5.l2d_action ~= "" then
			table.insert({}, slot5)
		end
	end

	return slot0
end
