slot0 = require("protobuf")

module("p14_pb")

SC_14001 = slot0.Descriptor()
slot1 = slot0.FieldDescriptor()
slot2 = slot0.FieldDescriptor()
CS_14002 = slot0.Descriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
SC_14003 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
CS_14004 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
SC_14005 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
CS_14006 = slot0.Descriptor()
slot9 = slot0.FieldDescriptor()
slot10 = slot0.FieldDescriptor()
SC_14007 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
CS_14008 = slot0.Descriptor()
slot12 = slot0.FieldDescriptor()
slot13 = slot0.FieldDescriptor()
SC_14009 = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
CS_14010 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
SC_14011 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
SC_14012 = slot0.Descriptor()
slot17 = slot0.FieldDescriptor()
EQUIPINFO = slot0.Descriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
AFFIXEQUIPMENTINFO = slot0.Descriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
AFFIXINFO = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
SC_14101 = slot0.Descriptor()
slot25 = slot0.FieldDescriptor()
EQUIPSKININFO = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
slot27 = slot0.FieldDescriptor()
slot1.name = "equip_list"
slot1.full_name = ".p14.sc_14001.equip_list"
slot1.number = 1
slot1.index = 0
slot1.label = 3
slot1.has_default_value = false
slot1.default_value = {}
slot1.message_type = EQUIPINFO
slot1.type = 11
slot1.cpp_type = 10
slot2.name = "affixequipment_list"
slot2.full_name = ".p14.sc_14001.affixequipment_list"
slot2.number = 2
slot2.index = 1
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = AFFIXEQUIPMENTINFO
slot2.type = 11
slot2.cpp_type = 10
SC_14001.name = "sc_14001"
SC_14001.full_name = ".p14.sc_14001"
SC_14001.nested_types = {}
SC_14001.enum_types = {}
SC_14001.fields = {
	slot1,
	slot2
}
SC_14001.is_extendable = false
SC_14001.extensions = {}
slot3.name = "ship_id"
slot3.full_name = ".p14.cs_14002.ship_id"
slot3.number = 1
slot3.index = 0
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "pos"
slot4.full_name = ".p14.cs_14002.pos"
slot4.number = 2
slot4.index = 1
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
CS_14002.name = "cs_14002"
CS_14002.full_name = ".p14.cs_14002"
CS_14002.nested_types = {}
CS_14002.enum_types = {}
CS_14002.fields = {
	slot3,
	slot4
}
CS_14002.is_extendable = false
CS_14002.extensions = {}
slot5.name = "result"
slot5.full_name = ".p14.sc_14003.result"
slot5.number = 1
slot5.index = 0
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
SC_14003.name = "sc_14003"
SC_14003.full_name = ".p14.sc_14003"
SC_14003.nested_types = {}
SC_14003.enum_types = {}
SC_14003.fields = {
	slot5
}
SC_14003.is_extendable = false
SC_14003.extensions = {}
slot6.name = "equip_id"
slot6.full_name = ".p14.cs_14004.equip_id"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "type"
slot7.full_name = ".p14.cs_14004.type"
slot7.number = 2
slot7.index = 1
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = 0
slot7.type = 13
slot7.cpp_type = 3
CS_14004.name = "cs_14004"
CS_14004.full_name = ".p14.cs_14004"
CS_14004.nested_types = {}
CS_14004.enum_types = {}
CS_14004.fields = {
	slot6,
	slot7
}
CS_14004.is_extendable = false
CS_14004.extensions = {}
slot8.name = "result"
slot8.full_name = ".p14.sc_14005.result"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
SC_14005.name = "sc_14005"
SC_14005.full_name = ".p14.sc_14005"
SC_14005.nested_types = {}
SC_14005.enum_types = {}
SC_14005.fields = {
	slot8
}
SC_14005.is_extendable = false
SC_14005.extensions = {}
slot9.name = "id"
slot9.full_name = ".p14.cs_14006.id"
slot9.number = 1
slot9.index = 0
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
slot10.name = "num"
slot10.full_name = ".p14.cs_14006.num"
slot10.number = 2
slot10.index = 1
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
CS_14006.name = "cs_14006"
CS_14006.full_name = ".p14.cs_14006"
CS_14006.nested_types = {}
CS_14006.enum_types = {}
CS_14006.fields = {
	slot9,
	slot10
}
CS_14006.is_extendable = false
CS_14006.extensions = {}
slot11.name = "result"
slot11.full_name = ".p14.sc_14007.result"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
SC_14007.name = "sc_14007"
SC_14007.full_name = ".p14.sc_14007"
SC_14007.nested_types = {}
SC_14007.enum_types = {}
SC_14007.fields = {
	slot11
}
SC_14007.is_extendable = false
SC_14007.extensions = {}
slot12.name = "equip_list"
slot12.full_name = ".p14.cs_14008.equip_list"
slot12.number = 1
slot12.index = 0
slot12.label = 3
slot12.has_default_value = false
slot12.default_value = {}
slot12.message_type = EQUIPINFO
slot12.type = 11
slot12.cpp_type = 10
slot13.name = "affixequipment_id_list"
slot13.full_name = ".p14.cs_14008.affixequipment_id_list"
slot13.number = 2
slot13.index = 1
slot13.label = 3
slot13.has_default_value = false
slot13.default_value = {}
slot13.type = 13
slot13.cpp_type = 3
CS_14008.name = "cs_14008"
CS_14008.full_name = ".p14.cs_14008"
CS_14008.nested_types = {}
CS_14008.enum_types = {}
CS_14008.fields = {
	slot12,
	slot13
}
CS_14008.is_extendable = false
CS_14008.extensions = {}
slot14.name = "result"
slot14.full_name = ".p14.sc_14009.result"
slot14.number = 1
slot14.index = 0
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
SC_14009.name = "sc_14009"
SC_14009.full_name = ".p14.sc_14009"
SC_14009.nested_types = {}
SC_14009.enum_types = {}
SC_14009.fields = {
	slot14
}
SC_14009.is_extendable = false
SC_14009.extensions = {}
slot15.name = "equip_id"
slot15.full_name = ".p14.cs_14010.equip_id"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
CS_14010.name = "cs_14010"
CS_14010.full_name = ".p14.cs_14010"
CS_14010.nested_types = {}
CS_14010.enum_types = {}
CS_14010.fields = {
	slot15
}
CS_14010.is_extendable = false
CS_14010.extensions = {}
slot16.name = "result"
slot16.full_name = ".p14.sc_14011.result"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
SC_14011.name = "sc_14011"
SC_14011.full_name = ".p14.sc_14011"
SC_14011.nested_types = {}
SC_14011.enum_types = {}
SC_14011.fields = {
	slot16
}
SC_14011.is_extendable = false
SC_14011.extensions = {}
slot17.name = "affixequipment_list"
slot17.full_name = ".p14.sc_14012.affixequipment_list"
slot17.number = 1
slot17.index = 0
slot17.label = 3
slot17.has_default_value = false
slot17.default_value = {}
slot17.message_type = AFFIXEQUIPMENTINFO
slot17.type = 11
slot17.cpp_type = 10
SC_14012.name = "sc_14012"
SC_14012.full_name = ".p14.sc_14012"
SC_14012.nested_types = {}
SC_14012.enum_types = {}
SC_14012.fields = {
	slot17
}
SC_14012.is_extendable = false
SC_14012.extensions = {}
slot18.name = "id"
slot18.full_name = ".p14.equipinfo.id"
slot18.number = 1
slot18.index = 0
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
slot19.name = "count"
slot19.full_name = ".p14.equipinfo.count"
slot19.number = 2
slot19.index = 1
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
EQUIPINFO.name = "equipinfo"
EQUIPINFO.full_name = ".p14.equipinfo"
EQUIPINFO.nested_types = {}
EQUIPINFO.enum_types = {}
EQUIPINFO.fields = {
	slot18,
	slot19
}
EQUIPINFO.is_extendable = false
EQUIPINFO.extensions = {}
slot20.name = "id"
slot20.full_name = ".p14.affixequipmentinfo.id"
slot20.number = 1
slot20.index = 0
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "template_id"
slot21.full_name = ".p14.affixequipmentinfo.template_id"
slot21.number = 2
slot21.index = 1
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "affix_list"
slot22.full_name = ".p14.affixequipmentinfo.affix_list"
slot22.number = 3
slot22.index = 2
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.message_type = AFFIXINFO
slot22.type = 11
slot22.cpp_type = 10
AFFIXEQUIPMENTINFO.name = "affixequipmentinfo"
AFFIXEQUIPMENTINFO.full_name = ".p14.affixequipmentinfo"
AFFIXEQUIPMENTINFO.nested_types = {}
AFFIXEQUIPMENTINFO.enum_types = {}
AFFIXEQUIPMENTINFO.fields = {
	slot20,
	slot21,
	slot22
}
AFFIXEQUIPMENTINFO.is_extendable = false
AFFIXEQUIPMENTINFO.extensions = {}
slot23.name = "id"
slot23.full_name = ".p14.affixinfo.id"
slot23.number = 1
slot23.index = 0
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "random_num"
slot24.full_name = ".p14.affixinfo.random_num"
slot24.number = 2
slot24.index = 1
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
AFFIXINFO.name = "affixinfo"
AFFIXINFO.full_name = ".p14.affixinfo"
AFFIXINFO.nested_types = {}
AFFIXINFO.enum_types = {}
AFFIXINFO.fields = {
	slot23,
	slot24
}
AFFIXINFO.is_extendable = false
AFFIXINFO.extensions = {}
slot25.name = "equip_skin_list"
slot25.full_name = ".p14.sc_14101.equip_skin_list"
slot25.number = 1
slot25.index = 0
slot25.label = 3
slot25.has_default_value = false
slot25.default_value = {}
slot25.message_type = EQUIPSKININFO
slot25.type = 11
slot25.cpp_type = 10
SC_14101.name = "sc_14101"
SC_14101.full_name = ".p14.sc_14101"
SC_14101.nested_types = {}
SC_14101.enum_types = {}
SC_14101.fields = {
	slot25
}
SC_14101.is_extendable = false
SC_14101.extensions = {}
slot26.name = "id"
slot26.full_name = ".p14.equipskininfo.id"
slot26.number = 1
slot26.index = 0
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
slot27.name = "count"
slot27.full_name = ".p14.equipskininfo.count"
slot27.number = 2
slot27.index = 1
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
EQUIPSKININFO.name = "equipskininfo"
EQUIPSKININFO.full_name = ".p14.equipskininfo"
EQUIPSKININFO.nested_types = {}
EQUIPSKININFO.enum_types = {}
EQUIPSKININFO.fields = {
	slot26,
	slot27
}
EQUIPSKININFO.is_extendable = false
EQUIPSKININFO.extensions = {}
affixequipmentinfo = slot0.Message(AFFIXEQUIPMENTINFO)
affixinfo = slot0.Message(AFFIXINFO)
cs_14002 = slot0.Message(CS_14002)
cs_14004 = slot0.Message(CS_14004)
cs_14006 = slot0.Message(CS_14006)
cs_14008 = slot0.Message(CS_14008)
cs_14010 = slot0.Message(CS_14010)
equipinfo = slot0.Message(EQUIPINFO)
equipskininfo = slot0.Message(EQUIPSKININFO)
sc_14001 = slot0.Message(SC_14001)
sc_14003 = slot0.Message(SC_14003)
sc_14005 = slot0.Message(SC_14005)
sc_14007 = slot0.Message(SC_14007)
sc_14009 = slot0.Message(SC_14009)
sc_14011 = slot0.Message(SC_14011)
sc_14012 = slot0.Message(SC_14012)
sc_14101 = slot0.Message(SC_14101)

return
