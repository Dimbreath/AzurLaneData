slot0 = class("TeamType")
slot0.Vanguard = "vanguard"
slot0.Main = "main"
slot0.Submarine = "submarine"
slot1[1] = ShipType.QuZhu
slot1[2] = ShipType.QingXun
slot1[3] = ShipType.ZhongXun
slot1[4] = ShipType.HangXun
slot1[5] = ShipType.LeiXun
slot1[6] = ShipType.ChaoXun
slot0.VanguardShipType = {}
slot1[1] = ShipType.ZhanXun
slot1[2] = ShipType.ZhanLie
slot1[3] = ShipType.QingHang
slot1[4] = ShipType.ZhengHang
slot1[5] = ShipType.HangZhan
slot1[6] = ShipType.WeiXiu
slot1[7] = ShipType.ZhongPao
slot0.MainShipType = {}
slot1[1] = ShipType.QianTing
slot1[2] = ShipType.QianMu
slot0.SubShipType = {}
slot0.VanguardMax = 3
slot0.MainMax = 3
slot0.SubmarineMax = 3
slot0.TeamPos = {
	FLAG_SHIP = "FlagShip",
	LEADER = "Leader",
	REAR = "Rear",
	CONSORT = "Consort",
	SUB_LEADER = "SubLeader",
	SUB_CONSORT = "SubConsort"
}

function slot0.TeamToTypeList(slot0)
	if slot0 == uv0.Vanguard then
		return uv0.VanguardShipType
	elseif slot0 == uv0.Main then
		return uv0.MainShipType
	elseif slot0 == uv0.Submarine then
		return uv0.SubShipType
	end
end

return slot0
