pg = pg or {}
pg.Packer = singletonClass("Packer")
pg.Packer.ps = nil

function pg.Packer.Ctor(slot0)
	slot0._protocols = {}
	slot0.ps = PackStream.New()
end

function pg.Packer.Pack(slot0, slot1, slot2, slot3)
	slot4 = slot3:SerializeToString()
	slot5 = ""

	if slot0.ps.Length ~= 0 then
		print("### pack string error !!!!!!!!!!!")
	end

	if #slot4 == 0 then
		slot6:WriteUint16(6)
	else
		slot6:WriteUint16(5 + #slot4)
	end

	slot6:WriteUint8(0)
	slot6:WriteUint16(slot2)
	slot6:WriteUint16(slot1)
	slot6:WriteBuffer(slot4)

	return slot6:ToArray()
end

function pg.Packer.Unpack(slot0, slot1, slot2)
	if slot0.GetInstance():GetProtocolWithName("sc_" .. slot1) ~= nil then
		slot4 = slot3._object[slot3._name]()

		slot4:ParseFromString(slot2)

		return slot4
	end
end

function pg.Packer.GetProtocolWithName(slot0, slot1)
	if slot0._protocols[slot1] ~= nil then
		return slot0._protocols[slot1]
	end

	slot3 = "Net/Protocol/"
	slot4 = "p" .. string.sub(slot2, 1, 2) .. "_pb"

	pcall(function ()
		slot0 = require(slot1 .. slot2)
	end)

	if nil then
		slot0._protocols[slot1] = slot0.Protocol.New(slot2, slot1, package.loaded[slot4])

		return slot0.Protocol.New(slot2, slot1, package.loaded[slot4])
	else
		return nil
	end
end

return
