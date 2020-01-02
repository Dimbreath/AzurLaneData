slot0 = require("protobuf")
slot1 = require("common_pb")

module("p16_pb")

CS_16001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
SC_16002 = slot0.Descriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
CS_16100 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
SC_16101 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
CS_16102 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
SC_16103 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
CS_16104 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
SC_16105 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
CS_16106 = slot0.Descriptor()
slot20 = slot0.FieldDescriptor()
SC_16107 = slot0.Descriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
CS_16108 = slot0.Descriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
SC_16109 = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
SC_16200 = slot0.Descriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
CS_16201 = slot0.Descriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
slot31 = slot0.FieldDescriptor()
SC_16202 = slot0.Descriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
SHOPINFO = slot0.Descriptor()
slot34 = slot0.FieldDescriptor()
slot35 = slot0.FieldDescriptor()
slot2.name = "id"
slot2.full_name = ".p16.cs_16001.id"
slot2.number = 1
slot2.index = 0
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "number"
slot3.full_name = ".p16.cs_16001.number"
slot3.number = 2
slot3.index = 1
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
CS_16001.name = "cs_16001"
CS_16001.full_name = ".p16.cs_16001"
CS_16001.nested_types = {}
CS_16001.enum_types = {}
CS_16001.fields = {
	slot2,
	slot3
}
CS_16001.is_extendable = false
CS_16001.extensions = {}
slot4.name = "result"
slot4.full_name = ".p16.sc_16002.result"
slot4.number = 1
slot4.index = 0
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "drop_list"
slot5.full_name = ".p16.sc_16002.drop_list"
slot5.number = 2
slot5.index = 1
slot5.label = 3
slot5.has_default_value = false
slot5.default_value = {}
slot5.message_type = slot1.DROPINFO
slot5.type = 11
slot5.cpp_type = 10
SC_16002.name = "sc_16002"
SC_16002.full_name = ".p16.sc_16002"
SC_16002.nested_types = {}
SC_16002.enum_types = {}
SC_16002.fields = {
	slot4,
	slot5
}
SC_16002.is_extendable = false
SC_16002.extensions = {}
slot6.name = "time"
slot6.full_name = ".p16.cs_16100.time"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
CS_16100.name = "cs_16100"
CS_16100.full_name = ".p16.cs_16100"
CS_16100.nested_types = {}
CS_16100.enum_types = {}
CS_16100.fields = {
	slot6
}
CS_16100.is_extendable = false
CS_16100.extensions = {}
slot7.name = "ship_id_list"
slot7.full_name = ".p16.sc_16101.ship_id_list"
slot7.number = 1
slot7.index = 0
slot7.label = 3
slot7.has_default_value = false
slot7.default_value = {}
slot7.type = 13
slot7.cpp_type = 3
slot8.name = "fetched_index_list"
slot8.full_name = ".p16.sc_16101.fetched_index_list"
slot8.number = 2
slot8.index = 1
slot8.label = 3
slot8.has_default_value = false
slot8.default_value = {}
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "flash_time"
slot9.full_name = ".p16.sc_16101.flash_time"
slot9.number = 3
slot9.index = 2
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "flag_ship_flash_time"
slot10.full_name = ".p16.sc_16101.flag_ship_flash_time"
slot10.number = 4
slot10.index = 3
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
SC_16101.name = "sc_16101"
SC_16101.full_name = ".p16.sc_16101"
SC_16101.nested_types = {}
SC_16101.enum_types = {}
SC_16101.fields = {
	slot7,
	slot8,
	slot9,
	slot10
}
SC_16101.is_extendable = false
SC_16101.extensions = {}
slot11.name = "index"
slot11.full_name = ".p16.cs_16102.index"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "flash_time"
slot12.full_name = ".p16.cs_16102.flash_time"
slot12.number = 2
slot12.index = 1
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
CS_16102.name = "cs_16102"
CS_16102.full_name = ".p16.cs_16102"
CS_16102.nested_types = {}
CS_16102.enum_types = {}
CS_16102.fields = {
	slot11,
	slot12
}
CS_16102.is_extendable = false
CS_16102.extensions = {}
slot13.name = "result"
slot13.full_name = ".p16.sc_16103.result"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "ship_info"
slot14.full_name = ".p16.sc_16103.ship_info"
slot14.number = 2
slot14.index = 1
slot14.label = 1
slot14.has_default_value = false
slot14.default_value = nil
slot14.message_type = slot1.SHIPINFO
slot14.type = 11
slot14.cpp_type = 10
SC_16103.name = "sc_16103"
SC_16103.full_name = ".p16.sc_16103"
SC_16103.nested_types = {}
SC_16103.enum_types = {}
SC_16103.fields = {
	slot13,
	slot14
}
SC_16103.is_extendable = false
SC_16103.extensions = {}
slot15.name = "type"
slot15.full_name = ".p16.cs_16104.type"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
CS_16104.name = "cs_16104"
CS_16104.full_name = ".p16.cs_16104"
CS_16104.nested_types = {}
CS_16104.enum_types = {}
CS_16104.fields = {
	slot15
}
CS_16104.is_extendable = false
CS_16104.extensions = {}
slot16.name = "first_pay_list"
slot16.full_name = ".p16.sc_16105.first_pay_list"
slot16.number = 1
slot16.index = 0
slot16.label = 3
slot16.has_default_value = false
slot16.default_value = {}
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "pay_list"
slot17.full_name = ".p16.sc_16105.pay_list"
slot17.number = 2
slot17.index = 1
slot17.label = 3
slot17.has_default_value = false
slot17.default_value = {}
slot17.message_type = SHOPINFO
slot17.type = 11
slot17.cpp_type = 10
slot18.name = "normal_list"
slot18.full_name = ".p16.sc_16105.normal_list"
slot18.number = 3
slot18.index = 2
slot18.label = 3
slot18.has_default_value = false
slot18.default_value = {}
slot18.message_type = SHOPINFO
slot18.type = 11
slot18.cpp_type = 10
slot19.name = "normal_group_list"
slot19.full_name = ".p16.sc_16105.normal_group_list"
slot19.number = 4
slot19.index = 3
slot19.label = 3
slot19.has_default_value = false
slot19.default_value = {}
slot19.message_type = SHOPINFO
slot19.type = 11
slot19.cpp_type = 10
SC_16105.name = "sc_16105"
SC_16105.full_name = ".p16.sc_16105"
SC_16105.nested_types = {}
SC_16105.enum_types = {}
SC_16105.fields = {
	slot16,
	slot17,
	slot18,
	slot19
}
SC_16105.is_extendable = false
SC_16105.extensions = {}
slot20.name = "type"
slot20.full_name = ".p16.cs_16106.type"
slot20.number = 1
slot20.index = 0
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
CS_16106.name = "cs_16106"
CS_16106.full_name = ".p16.cs_16106"
CS_16106.nested_types = {}
CS_16106.enum_types = {}
CS_16106.fields = {
	slot20
}
CS_16106.is_extendable = false
CS_16106.extensions = {}
slot21.name = "item_flash_time"
slot21.full_name = ".p16.sc_16107.item_flash_time"
slot21.number = 1
slot21.index = 0
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "item_shop_id_list"
slot22.full_name = ".p16.sc_16107.item_shop_id_list"
slot22.number = 2
slot22.index = 1
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.type = 13
slot22.cpp_type = 3
slot23.name = "item_fetch_list"
slot23.full_name = ".p16.sc_16107.item_fetch_list"
slot23.number = 3
slot23.index = 2
slot23.label = 3
slot23.has_default_value = false
slot23.default_value = {}
slot23.type = 13
slot23.cpp_type = 3
SC_16107.name = "sc_16107"
SC_16107.full_name = ".p16.sc_16107"
SC_16107.nested_types = {}
SC_16107.enum_types = {}
SC_16107.fields = {
	slot21,
	slot22,
	slot23
}
SC_16107.is_extendable = false
SC_16107.extensions = {}
slot24.name = "shop_id"
slot24.full_name = ".p16.cs_16108.shop_id"
slot24.number = 1
slot24.index = 0
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
slot25.name = "flash_time"
slot25.full_name = ".p16.cs_16108.flash_time"
slot25.number = 2
slot25.index = 1
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
CS_16108.name = "cs_16108"
CS_16108.full_name = ".p16.cs_16108"
CS_16108.nested_types = {}
CS_16108.enum_types = {}
CS_16108.fields = {
	slot24,
	slot25
}
CS_16108.is_extendable = false
CS_16108.extensions = {}
slot26.name = "result"
slot26.full_name = ".p16.sc_16109.result"
slot26.number = 1
slot26.index = 0
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
SC_16109.name = "sc_16109"
SC_16109.full_name = ".p16.sc_16109"
SC_16109.nested_types = {}
SC_16109.enum_types = {}
SC_16109.fields = {
	slot26
}
SC_16109.is_extendable = false
SC_16109.extensions = {}
slot27.name = "core_shop_list"
slot27.full_name = ".p16.sc_16200.core_shop_list"
slot27.number = 1
slot27.index = 0
slot27.label = 3
slot27.has_default_value = false
slot27.default_value = {}
slot27.message_type = SHOPINFO
slot27.type = 11
slot27.cpp_type = 10
slot28.name = "blue_shop_list"
slot28.full_name = ".p16.sc_16200.blue_shop_list"
slot28.number = 2
slot28.index = 1
slot28.label = 3
slot28.has_default_value = false
slot28.default_value = {}
slot28.message_type = SHOPINFO
slot28.type = 11
slot28.cpp_type = 10
SC_16200.name = "sc_16200"
SC_16200.full_name = ".p16.sc_16200"
SC_16200.nested_types = {}
SC_16200.enum_types = {}
SC_16200.fields = {
	slot27,
	slot28
}
SC_16200.is_extendable = false
SC_16200.extensions = {}
slot29.name = "type"
slot29.full_name = ".p16.cs_16201.type"
slot29.number = 1
slot29.index = 0
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
slot30.name = "id"
slot30.full_name = ".p16.cs_16201.id"
slot30.number = 2
slot30.index = 1
slot30.label = 2
slot30.has_default_value = false
slot30.default_value = 0
slot30.type = 13
slot30.cpp_type = 3
slot31.name = "count"
slot31.full_name = ".p16.cs_16201.count"
slot31.number = 3
slot31.index = 2
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
CS_16201.name = "cs_16201"
CS_16201.full_name = ".p16.cs_16201"
CS_16201.nested_types = {}
CS_16201.enum_types = {}
CS_16201.fields = {
	slot29,
	slot30,
	slot31
}
CS_16201.is_extendable = false
CS_16201.extensions = {}
slot32.name = "result"
slot32.full_name = ".p16.sc_16202.result"
slot32.number = 1
slot32.index = 0
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "drop_list"
slot33.full_name = ".p16.sc_16202.drop_list"
slot33.number = 2
slot33.index = 1
slot33.label = 3
slot33.has_default_value = false
slot33.default_value = {}
slot33.message_type = slot1.DROPINFO
slot33.type = 11
slot33.cpp_type = 10
SC_16202.name = "sc_16202"
SC_16202.full_name = ".p16.sc_16202"
SC_16202.nested_types = {}
SC_16202.enum_types = {}
SC_16202.fields = {
	slot32,
	slot33
}
SC_16202.is_extendable = false
SC_16202.extensions = {}
slot34.name = "shop_id"
slot34.full_name = ".p16.shopinfo.shop_id"
slot34.number = 1
slot34.index = 0
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = 0
slot34.type = 13
slot34.cpp_type = 3
slot35.name = "pay_count"
slot35.full_name = ".p16.shopinfo.pay_count"
slot35.number = 2
slot35.index = 1
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
SHOPINFO.name = "shopinfo"
SHOPINFO.full_name = ".p16.shopinfo"
SHOPINFO.nested_types = {}
SHOPINFO.enum_types = {}
SHOPINFO.fields = {
	slot34,
	slot35
}
SHOPINFO.is_extendable = false
SHOPINFO.extensions = {}
cs_16001 = slot0.Message(CS_16001)
cs_16100 = slot0.Message(CS_16100)
cs_16102 = slot0.Message(CS_16102)
cs_16104 = slot0.Message(CS_16104)
cs_16106 = slot0.Message(CS_16106)
cs_16108 = slot0.Message(CS_16108)
cs_16201 = slot0.Message(CS_16201)
sc_16002 = slot0.Message(SC_16002)
sc_16101 = slot0.Message(SC_16101)
sc_16103 = slot0.Message(SC_16103)
sc_16105 = slot0.Message(SC_16105)
sc_16107 = slot0.Message(SC_16107)
sc_16109 = slot0.Message(SC_16109)
sc_16200 = slot0.Message(SC_16200)
sc_16202 = slot0.Message(SC_16202)
shopinfo = slot0.Message(SHOPINFO)

return
