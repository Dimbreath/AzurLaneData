slot0 = require("protobuf")

module("p14_pb")

slot1 = {
	SC_14001_EQUIP_LIST_FIELD = slot0.FieldDescriptor(),
	SC_14001_AFFIXEQUIPMENT_LIST_FIELD = slot0.FieldDescriptor(),
	CS_14002_SHIP_ID_FIELD = slot0.FieldDescriptor(),
	CS_14002_POS_FIELD = slot0.FieldDescriptor(),
	SC_14003_RESULT_FIELD = slot0.FieldDescriptor(),
	CS_14004_EQUIP_ID_FIELD = slot0.FieldDescriptor(),
	CS_14004_TYPE_FIELD = slot0.FieldDescriptor(),
	SC_14005_RESULT_FIELD = slot0.FieldDescriptor(),
	CS_14006_ID_FIELD = slot0.FieldDescriptor(),
	CS_14006_NUM_FIELD = slot0.FieldDescriptor(),
	SC_14007_RESULT_FIELD = slot0.FieldDescriptor(),
	CS_14008_EQUIP_LIST_FIELD = slot0.FieldDescriptor(),
	CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD = slot0.FieldDescriptor(),
	SC_14009_RESULT_FIELD = slot0.FieldDescriptor(),
	CS_14010_EQUIP_ID_FIELD = slot0.FieldDescriptor(),
	SC_14011_RESULT_FIELD = slot0.FieldDescriptor(),
	SC_14012_AFFIXEQUIPMENT_LIST_FIELD = slot0.FieldDescriptor(),
	EQUIPINFO_ID_FIELD = slot0.FieldDescriptor(),
	EQUIPINFO_COUNT_FIELD = slot0.FieldDescriptor(),
	AFFIXEQUIPMENTINFO_ID_FIELD = slot0.FieldDescriptor(),
	AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD = slot0.FieldDescriptor(),
	AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD = slot0.FieldDescriptor(),
	AFFIXINFO_ID_FIELD = slot0.FieldDescriptor(),
	AFFIXINFO_RANDOM_NUM_FIELD = slot0.FieldDescriptor(),
	SC_14101_EQUIP_SKIN_LIST_FIELD = slot0.FieldDescriptor(),
	EQUIPSKININFO_ID_FIELD = slot0.FieldDescriptor(),
	EQUIPSKININFO_COUNT_FIELD = slot0.FieldDescriptor()
}
SC_14001 = slot0.Descriptor()
CS_14002 = slot0.Descriptor()
SC_14003 = slot0.Descriptor()
CS_14004 = slot0.Descriptor()
SC_14005 = slot0.Descriptor()
CS_14006 = slot0.Descriptor()
SC_14007 = slot0.Descriptor()
CS_14008 = slot0.Descriptor()
SC_14009 = slot0.Descriptor()
CS_14010 = slot0.Descriptor()
SC_14011 = slot0.Descriptor()
SC_14012 = slot0.Descriptor()
EQUIPINFO = slot0.Descriptor()
AFFIXEQUIPMENTINFO = slot0.Descriptor()
AFFIXINFO = slot0.Descriptor()
SC_14101 = slot0.Descriptor()
EQUIPSKININFO = slot0.Descriptor()
slot1.SC_14001_EQUIP_LIST_FIELD.name = "equip_list"
slot1.SC_14001_EQUIP_LIST_FIELD.full_name = "p14.sc_14001.equip_list"
slot1.SC_14001_EQUIP_LIST_FIELD.number = 1
slot1.SC_14001_EQUIP_LIST_FIELD.index = 0
slot1.SC_14001_EQUIP_LIST_FIELD.label = 3
slot1.SC_14001_EQUIP_LIST_FIELD.has_default_value = false
slot1.SC_14001_EQUIP_LIST_FIELD.default_value = {}
slot1.SC_14001_EQUIP_LIST_FIELD.message_type = EQUIPINFO
slot1.SC_14001_EQUIP_LIST_FIELD.type = 11
slot1.SC_14001_EQUIP_LIST_FIELD.cpp_type = 10
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.name = "affixequipment_list"
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.full_name = "p14.sc_14001.affixequipment_list"
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.number = 2
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.index = 1
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.label = 3
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.has_default_value = false
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.default_value = {}
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.message_type = AFFIXEQUIPMENTINFO
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.type = 11
slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD.cpp_type = 10
SC_14001.name = "sc_14001"
SC_14001.full_name = "p14.sc_14001"
SC_14001.nested_types = {}
SC_14001.enum_types = {}
SC_14001.fields = {
	slot1.SC_14001_EQUIP_LIST_FIELD,
	slot1.SC_14001_AFFIXEQUIPMENT_LIST_FIELD
}
SC_14001.is_extendable = false
SC_14001.extensions = {}
slot1.CS_14002_SHIP_ID_FIELD.name = "ship_id"
slot1.CS_14002_SHIP_ID_FIELD.full_name = "p14.cs_14002.ship_id"
slot1.CS_14002_SHIP_ID_FIELD.number = 1
slot1.CS_14002_SHIP_ID_FIELD.index = 0
slot1.CS_14002_SHIP_ID_FIELD.label = 2
slot1.CS_14002_SHIP_ID_FIELD.has_default_value = false
slot1.CS_14002_SHIP_ID_FIELD.default_value = 0
slot1.CS_14002_SHIP_ID_FIELD.type = 13
slot1.CS_14002_SHIP_ID_FIELD.cpp_type = 3
slot1.CS_14002_POS_FIELD.name = "pos"
slot1.CS_14002_POS_FIELD.full_name = "p14.cs_14002.pos"
slot1.CS_14002_POS_FIELD.number = 2
slot1.CS_14002_POS_FIELD.index = 1
slot1.CS_14002_POS_FIELD.label = 2
slot1.CS_14002_POS_FIELD.has_default_value = false
slot1.CS_14002_POS_FIELD.default_value = 0
slot1.CS_14002_POS_FIELD.type = 13
slot1.CS_14002_POS_FIELD.cpp_type = 3
CS_14002.name = "cs_14002"
CS_14002.full_name = "p14.cs_14002"
CS_14002.nested_types = {}
CS_14002.enum_types = {}
CS_14002.fields = {
	slot1.CS_14002_SHIP_ID_FIELD,
	slot1.CS_14002_POS_FIELD
}
CS_14002.is_extendable = false
CS_14002.extensions = {}
slot1.SC_14003_RESULT_FIELD.name = "result"
slot1.SC_14003_RESULT_FIELD.full_name = "p14.sc_14003.result"
slot1.SC_14003_RESULT_FIELD.number = 1
slot1.SC_14003_RESULT_FIELD.index = 0
slot1.SC_14003_RESULT_FIELD.label = 2
slot1.SC_14003_RESULT_FIELD.has_default_value = false
slot1.SC_14003_RESULT_FIELD.default_value = 0
slot1.SC_14003_RESULT_FIELD.type = 13
slot1.SC_14003_RESULT_FIELD.cpp_type = 3
SC_14003.name = "sc_14003"
SC_14003.full_name = "p14.sc_14003"
SC_14003.nested_types = {}
SC_14003.enum_types = {}
SC_14003.fields = {
	slot1.SC_14003_RESULT_FIELD
}
SC_14003.is_extendable = false
SC_14003.extensions = {}
slot1.CS_14004_EQUIP_ID_FIELD.name = "equip_id"
slot1.CS_14004_EQUIP_ID_FIELD.full_name = "p14.cs_14004.equip_id"
slot1.CS_14004_EQUIP_ID_FIELD.number = 1
slot1.CS_14004_EQUIP_ID_FIELD.index = 0
slot1.CS_14004_EQUIP_ID_FIELD.label = 2
slot1.CS_14004_EQUIP_ID_FIELD.has_default_value = false
slot1.CS_14004_EQUIP_ID_FIELD.default_value = 0
slot1.CS_14004_EQUIP_ID_FIELD.type = 13
slot1.CS_14004_EQUIP_ID_FIELD.cpp_type = 3
slot1.CS_14004_TYPE_FIELD.name = "type"
slot1.CS_14004_TYPE_FIELD.full_name = "p14.cs_14004.type"
slot1.CS_14004_TYPE_FIELD.number = 2
slot1.CS_14004_TYPE_FIELD.index = 1
slot1.CS_14004_TYPE_FIELD.label = 2
slot1.CS_14004_TYPE_FIELD.has_default_value = false
slot1.CS_14004_TYPE_FIELD.default_value = 0
slot1.CS_14004_TYPE_FIELD.type = 13
slot1.CS_14004_TYPE_FIELD.cpp_type = 3
CS_14004.name = "cs_14004"
CS_14004.full_name = "p14.cs_14004"
CS_14004.nested_types = {}
CS_14004.enum_types = {}
CS_14004.fields = {
	slot1.CS_14004_EQUIP_ID_FIELD,
	slot1.CS_14004_TYPE_FIELD
}
CS_14004.is_extendable = false
CS_14004.extensions = {}
slot1.SC_14005_RESULT_FIELD.name = "result"
slot1.SC_14005_RESULT_FIELD.full_name = "p14.sc_14005.result"
slot1.SC_14005_RESULT_FIELD.number = 1
slot1.SC_14005_RESULT_FIELD.index = 0
slot1.SC_14005_RESULT_FIELD.label = 2
slot1.SC_14005_RESULT_FIELD.has_default_value = false
slot1.SC_14005_RESULT_FIELD.default_value = 0
slot1.SC_14005_RESULT_FIELD.type = 13
slot1.SC_14005_RESULT_FIELD.cpp_type = 3
SC_14005.name = "sc_14005"
SC_14005.full_name = "p14.sc_14005"
SC_14005.nested_types = {}
SC_14005.enum_types = {}
SC_14005.fields = {
	slot1.SC_14005_RESULT_FIELD
}
SC_14005.is_extendable = false
SC_14005.extensions = {}
slot1.CS_14006_ID_FIELD.name = "id"
slot1.CS_14006_ID_FIELD.full_name = "p14.cs_14006.id"
slot1.CS_14006_ID_FIELD.number = 1
slot1.CS_14006_ID_FIELD.index = 0
slot1.CS_14006_ID_FIELD.label = 2
slot1.CS_14006_ID_FIELD.has_default_value = false
slot1.CS_14006_ID_FIELD.default_value = 0
slot1.CS_14006_ID_FIELD.type = 13
slot1.CS_14006_ID_FIELD.cpp_type = 3
slot1.CS_14006_NUM_FIELD.name = "num"
slot1.CS_14006_NUM_FIELD.full_name = "p14.cs_14006.num"
slot1.CS_14006_NUM_FIELD.number = 2
slot1.CS_14006_NUM_FIELD.index = 1
slot1.CS_14006_NUM_FIELD.label = 2
slot1.CS_14006_NUM_FIELD.has_default_value = false
slot1.CS_14006_NUM_FIELD.default_value = 0
slot1.CS_14006_NUM_FIELD.type = 13
slot1.CS_14006_NUM_FIELD.cpp_type = 3
CS_14006.name = "cs_14006"
CS_14006.full_name = "p14.cs_14006"
CS_14006.nested_types = {}
CS_14006.enum_types = {}
CS_14006.fields = {
	slot1.CS_14006_ID_FIELD,
	slot1.CS_14006_NUM_FIELD
}
CS_14006.is_extendable = false
CS_14006.extensions = {}
slot1.SC_14007_RESULT_FIELD.name = "result"
slot1.SC_14007_RESULT_FIELD.full_name = "p14.sc_14007.result"
slot1.SC_14007_RESULT_FIELD.number = 1
slot1.SC_14007_RESULT_FIELD.index = 0
slot1.SC_14007_RESULT_FIELD.label = 2
slot1.SC_14007_RESULT_FIELD.has_default_value = false
slot1.SC_14007_RESULT_FIELD.default_value = 0
slot1.SC_14007_RESULT_FIELD.type = 13
slot1.SC_14007_RESULT_FIELD.cpp_type = 3
SC_14007.name = "sc_14007"
SC_14007.full_name = "p14.sc_14007"
SC_14007.nested_types = {}
SC_14007.enum_types = {}
SC_14007.fields = {
	slot1.SC_14007_RESULT_FIELD
}
SC_14007.is_extendable = false
SC_14007.extensions = {}
slot1.CS_14008_EQUIP_LIST_FIELD.name = "equip_list"
slot1.CS_14008_EQUIP_LIST_FIELD.full_name = "p14.cs_14008.equip_list"
slot1.CS_14008_EQUIP_LIST_FIELD.number = 1
slot1.CS_14008_EQUIP_LIST_FIELD.index = 0
slot1.CS_14008_EQUIP_LIST_FIELD.label = 3
slot1.CS_14008_EQUIP_LIST_FIELD.has_default_value = false
slot1.CS_14008_EQUIP_LIST_FIELD.default_value = {}
slot1.CS_14008_EQUIP_LIST_FIELD.message_type = EQUIPINFO
slot1.CS_14008_EQUIP_LIST_FIELD.type = 11
slot1.CS_14008_EQUIP_LIST_FIELD.cpp_type = 10
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.name = "affixequipment_id_list"
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.full_name = "p14.cs_14008.affixequipment_id_list"
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.number = 2
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.index = 1
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.label = 3
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.has_default_value = false
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.default_value = {}
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.type = 13
slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD.cpp_type = 3
CS_14008.name = "cs_14008"
CS_14008.full_name = "p14.cs_14008"
CS_14008.nested_types = {}
CS_14008.enum_types = {}
CS_14008.fields = {
	slot1.CS_14008_EQUIP_LIST_FIELD,
	slot1.CS_14008_AFFIXEQUIPMENT_ID_LIST_FIELD
}
CS_14008.is_extendable = false
CS_14008.extensions = {}
slot1.SC_14009_RESULT_FIELD.name = "result"
slot1.SC_14009_RESULT_FIELD.full_name = "p14.sc_14009.result"
slot1.SC_14009_RESULT_FIELD.number = 1
slot1.SC_14009_RESULT_FIELD.index = 0
slot1.SC_14009_RESULT_FIELD.label = 2
slot1.SC_14009_RESULT_FIELD.has_default_value = false
slot1.SC_14009_RESULT_FIELD.default_value = 0
slot1.SC_14009_RESULT_FIELD.type = 13
slot1.SC_14009_RESULT_FIELD.cpp_type = 3
SC_14009.name = "sc_14009"
SC_14009.full_name = "p14.sc_14009"
SC_14009.nested_types = {}
SC_14009.enum_types = {}
SC_14009.fields = {
	slot1.SC_14009_RESULT_FIELD
}
SC_14009.is_extendable = false
SC_14009.extensions = {}
slot1.CS_14010_EQUIP_ID_FIELD.name = "equip_id"
slot1.CS_14010_EQUIP_ID_FIELD.full_name = "p14.cs_14010.equip_id"
slot1.CS_14010_EQUIP_ID_FIELD.number = 1
slot1.CS_14010_EQUIP_ID_FIELD.index = 0
slot1.CS_14010_EQUIP_ID_FIELD.label = 2
slot1.CS_14010_EQUIP_ID_FIELD.has_default_value = false
slot1.CS_14010_EQUIP_ID_FIELD.default_value = 0
slot1.CS_14010_EQUIP_ID_FIELD.type = 13
slot1.CS_14010_EQUIP_ID_FIELD.cpp_type = 3
CS_14010.name = "cs_14010"
CS_14010.full_name = "p14.cs_14010"
CS_14010.nested_types = {}
CS_14010.enum_types = {}
CS_14010.fields = {
	slot1.CS_14010_EQUIP_ID_FIELD
}
CS_14010.is_extendable = false
CS_14010.extensions = {}
slot1.SC_14011_RESULT_FIELD.name = "result"
slot1.SC_14011_RESULT_FIELD.full_name = "p14.sc_14011.result"
slot1.SC_14011_RESULT_FIELD.number = 1
slot1.SC_14011_RESULT_FIELD.index = 0
slot1.SC_14011_RESULT_FIELD.label = 2
slot1.SC_14011_RESULT_FIELD.has_default_value = false
slot1.SC_14011_RESULT_FIELD.default_value = 0
slot1.SC_14011_RESULT_FIELD.type = 13
slot1.SC_14011_RESULT_FIELD.cpp_type = 3
SC_14011.name = "sc_14011"
SC_14011.full_name = "p14.sc_14011"
SC_14011.nested_types = {}
SC_14011.enum_types = {}
SC_14011.fields = {
	slot1.SC_14011_RESULT_FIELD
}
SC_14011.is_extendable = false
SC_14011.extensions = {}
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.name = "affixequipment_list"
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.full_name = "p14.sc_14012.affixequipment_list"
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.number = 1
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.index = 0
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.label = 3
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.has_default_value = false
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.default_value = {}
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.message_type = AFFIXEQUIPMENTINFO
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.type = 11
slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD.cpp_type = 10
SC_14012.name = "sc_14012"
SC_14012.full_name = "p14.sc_14012"
SC_14012.nested_types = {}
SC_14012.enum_types = {}
SC_14012.fields = {
	slot1.SC_14012_AFFIXEQUIPMENT_LIST_FIELD
}
SC_14012.is_extendable = false
SC_14012.extensions = {}
slot1.EQUIPINFO_ID_FIELD.name = "id"
slot1.EQUIPINFO_ID_FIELD.full_name = "p14.equipinfo.id"
slot1.EQUIPINFO_ID_FIELD.number = 1
slot1.EQUIPINFO_ID_FIELD.index = 0
slot1.EQUIPINFO_ID_FIELD.label = 2
slot1.EQUIPINFO_ID_FIELD.has_default_value = false
slot1.EQUIPINFO_ID_FIELD.default_value = 0
slot1.EQUIPINFO_ID_FIELD.type = 13
slot1.EQUIPINFO_ID_FIELD.cpp_type = 3
slot1.EQUIPINFO_COUNT_FIELD.name = "count"
slot1.EQUIPINFO_COUNT_FIELD.full_name = "p14.equipinfo.count"
slot1.EQUIPINFO_COUNT_FIELD.number = 2
slot1.EQUIPINFO_COUNT_FIELD.index = 1
slot1.EQUIPINFO_COUNT_FIELD.label = 2
slot1.EQUIPINFO_COUNT_FIELD.has_default_value = false
slot1.EQUIPINFO_COUNT_FIELD.default_value = 0
slot1.EQUIPINFO_COUNT_FIELD.type = 13
slot1.EQUIPINFO_COUNT_FIELD.cpp_type = 3
EQUIPINFO.name = "equipinfo"
EQUIPINFO.full_name = "p14.equipinfo"
EQUIPINFO.nested_types = {}
EQUIPINFO.enum_types = {}
EQUIPINFO.fields = {
	slot1.EQUIPINFO_ID_FIELD,
	slot1.EQUIPINFO_COUNT_FIELD
}
EQUIPINFO.is_extendable = false
EQUIPINFO.extensions = {}
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.name = "id"
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.full_name = "p14.affixequipmentinfo.id"
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.number = 1
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.index = 0
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.label = 2
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.has_default_value = false
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.default_value = 0
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.type = 13
slot1.AFFIXEQUIPMENTINFO_ID_FIELD.cpp_type = 3
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.name = "template_id"
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.full_name = "p14.affixequipmentinfo.template_id"
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.number = 2
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.index = 1
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.label = 2
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.has_default_value = false
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.default_value = 0
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.type = 13
slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD.cpp_type = 3
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.name = "affix_list"
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.full_name = "p14.affixequipmentinfo.affix_list"
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.number = 3
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.index = 2
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.label = 3
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.has_default_value = false
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.default_value = {}
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.message_type = AFFIXINFO
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.type = 11
slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD.cpp_type = 10
AFFIXEQUIPMENTINFO.name = "affixequipmentinfo"
AFFIXEQUIPMENTINFO.full_name = "p14.affixequipmentinfo"
AFFIXEQUIPMENTINFO.nested_types = {}
AFFIXEQUIPMENTINFO.enum_types = {}
AFFIXEQUIPMENTINFO.fields = {
	slot1.AFFIXEQUIPMENTINFO_ID_FIELD,
	slot1.AFFIXEQUIPMENTINFO_TEMPLATE_ID_FIELD,
	slot1.AFFIXEQUIPMENTINFO_AFFIX_LIST_FIELD
}
AFFIXEQUIPMENTINFO.is_extendable = false
AFFIXEQUIPMENTINFO.extensions = {}
slot1.AFFIXINFO_ID_FIELD.name = "id"
slot1.AFFIXINFO_ID_FIELD.full_name = "p14.affixinfo.id"
slot1.AFFIXINFO_ID_FIELD.number = 1
slot1.AFFIXINFO_ID_FIELD.index = 0
slot1.AFFIXINFO_ID_FIELD.label = 2
slot1.AFFIXINFO_ID_FIELD.has_default_value = false
slot1.AFFIXINFO_ID_FIELD.default_value = 0
slot1.AFFIXINFO_ID_FIELD.type = 13
slot1.AFFIXINFO_ID_FIELD.cpp_type = 3
slot1.AFFIXINFO_RANDOM_NUM_FIELD.name = "random_num"
slot1.AFFIXINFO_RANDOM_NUM_FIELD.full_name = "p14.affixinfo.random_num"
slot1.AFFIXINFO_RANDOM_NUM_FIELD.number = 2
slot1.AFFIXINFO_RANDOM_NUM_FIELD.index = 1
slot1.AFFIXINFO_RANDOM_NUM_FIELD.label = 2
slot1.AFFIXINFO_RANDOM_NUM_FIELD.has_default_value = false
slot1.AFFIXINFO_RANDOM_NUM_FIELD.default_value = 0
slot1.AFFIXINFO_RANDOM_NUM_FIELD.type = 13
slot1.AFFIXINFO_RANDOM_NUM_FIELD.cpp_type = 3
AFFIXINFO.name = "affixinfo"
AFFIXINFO.full_name = "p14.affixinfo"
AFFIXINFO.nested_types = {}
AFFIXINFO.enum_types = {}
AFFIXINFO.fields = {
	slot1.AFFIXINFO_ID_FIELD,
	slot1.AFFIXINFO_RANDOM_NUM_FIELD
}
AFFIXINFO.is_extendable = false
AFFIXINFO.extensions = {}
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.name = "equip_skin_list"
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.full_name = "p14.sc_14101.equip_skin_list"
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.number = 1
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.index = 0
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.label = 3
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.has_default_value = false
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.default_value = {}
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.message_type = EQUIPSKININFO
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.type = 11
slot1.SC_14101_EQUIP_SKIN_LIST_FIELD.cpp_type = 10
SC_14101.name = "sc_14101"
SC_14101.full_name = "p14.sc_14101"
SC_14101.nested_types = {}
SC_14101.enum_types = {}
SC_14101.fields = {
	slot1.SC_14101_EQUIP_SKIN_LIST_FIELD
}
SC_14101.is_extendable = false
SC_14101.extensions = {}
slot1.EQUIPSKININFO_ID_FIELD.name = "id"
slot1.EQUIPSKININFO_ID_FIELD.full_name = "p14.equipskininfo.id"
slot1.EQUIPSKININFO_ID_FIELD.number = 1
slot1.EQUIPSKININFO_ID_FIELD.index = 0
slot1.EQUIPSKININFO_ID_FIELD.label = 2
slot1.EQUIPSKININFO_ID_FIELD.has_default_value = false
slot1.EQUIPSKININFO_ID_FIELD.default_value = 0
slot1.EQUIPSKININFO_ID_FIELD.type = 13
slot1.EQUIPSKININFO_ID_FIELD.cpp_type = 3
slot1.EQUIPSKININFO_COUNT_FIELD.name = "count"
slot1.EQUIPSKININFO_COUNT_FIELD.full_name = "p14.equipskininfo.count"
slot1.EQUIPSKININFO_COUNT_FIELD.number = 2
slot1.EQUIPSKININFO_COUNT_FIELD.index = 1
slot1.EQUIPSKININFO_COUNT_FIELD.label = 2
slot1.EQUIPSKININFO_COUNT_FIELD.has_default_value = false
slot1.EQUIPSKININFO_COUNT_FIELD.default_value = 0
slot1.EQUIPSKININFO_COUNT_FIELD.type = 13
slot1.EQUIPSKININFO_COUNT_FIELD.cpp_type = 3
EQUIPSKININFO.name = "equipskininfo"
EQUIPSKININFO.full_name = "p14.equipskininfo"
EQUIPSKININFO.nested_types = {}
EQUIPSKININFO.enum_types = {}
EQUIPSKININFO.fields = {
	slot1.EQUIPSKININFO_ID_FIELD,
	slot1.EQUIPSKININFO_COUNT_FIELD
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
