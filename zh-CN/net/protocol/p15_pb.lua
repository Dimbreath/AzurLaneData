slot0 = require("protobuf")

module("p15_pb")

SC_15001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
CS_15002 = slot0.Descriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
SC_15003 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
slot7 = slot0.FieldDescriptor()
CS_15004 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
SC_15005 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
CS_15006 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
SC_15007 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
CS_15008 = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
SC_15009 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
ITEMINFO = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
slot2.name = "item_list"
slot2.full_name = ".p15.sc_15001.item_list"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = ITEMINFO
slot2.type = 11
slot2.cpp_type = 10
SC_15001.name = "sc_15001"
SC_15001.full_name = ".p15.sc_15001"
SC_15001.nested_types = {}
SC_15001.enum_types = {}
SC_15001.fields = {
	slot2
}
SC_15001.is_extendable = false
SC_15001.extensions = {}
slot3.name = "id"
slot3.full_name = ".p15.cs_15002.id"
slot3.number = 1
slot3.index = 0
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "count"
slot4.full_name = ".p15.cs_15002.count"
slot4.number = 2
slot4.index = 1
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "arg"
slot5.full_name = ".p15.cs_15002.arg"
slot5.number = 3
slot5.index = 2
slot5.label = 3
slot5.has_default_value = false
slot5.default_value = {}
slot5.type = 13
slot5.cpp_type = 3
CS_15002.name = "cs_15002"
CS_15002.full_name = ".p15.cs_15002"
CS_15002.nested_types = {}
CS_15002.enum_types = {}
CS_15002.fields = {
	slot3,
	slot4,
	slot5
}
CS_15002.is_extendable = false
CS_15002.extensions = {}
slot6.name = "result"
slot6.full_name = ".p15.sc_15003.result"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
slot7.name = "drop_list"
slot7.full_name = ".p15.sc_15003.drop_list"
slot7.number = 2
slot7.index = 1
slot7.label = 3
slot7.has_default_value = false
slot7.default_value = {}
slot7.message_type = require("common_pb").DROPINFO
slot7.type = 11
slot7.cpp_type = 10
SC_15003.name = "sc_15003"
SC_15003.full_name = ".p15.sc_15003"
SC_15003.nested_types = {}
SC_15003.enum_types = {}
SC_15003.fields = {
	slot6,
	slot7
}
SC_15003.is_extendable = false
SC_15003.extensions = {}
slot8.name = "id"
slot8.full_name = ".p15.cs_15004.id"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "count"
slot9.full_name = ".p15.cs_15004.count"
slot9.number = 2
slot9.index = 1
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
CS_15004.name = "cs_15004"
CS_15004.full_name = ".p15.cs_15004"
CS_15004.nested_types = {}
CS_15004.enum_types = {}
CS_15004.fields = {
	slot8,
	slot9
}
CS_15004.is_extendable = false
CS_15004.extensions = {}
slot10.name = "result"
slot10.full_name = ".p15.sc_15005.result"
slot10.number = 1
slot10.index = 0
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
SC_15005.name = "sc_15005"
SC_15005.full_name = ".p15.sc_15005"
SC_15005.nested_types = {}
SC_15005.enum_types = {}
SC_15005.fields = {
	slot10
}
SC_15005.is_extendable = false
SC_15005.extensions = {}
slot11.name = "id"
slot11.full_name = ".p15.cs_15006.id"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "num"
slot12.full_name = ".p15.cs_15006.num"
slot12.number = 2
slot12.index = 1
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
CS_15006.name = "cs_15006"
CS_15006.full_name = ".p15.cs_15006"
CS_15006.nested_types = {}
CS_15006.enum_types = {}
CS_15006.fields = {
	slot11,
	slot12
}
CS_15006.is_extendable = false
CS_15006.extensions = {}
slot13.name = "result"
slot13.full_name = ".p15.sc_15007.result"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
SC_15007.name = "sc_15007"
SC_15007.full_name = ".p15.sc_15007"
SC_15007.nested_types = {}
SC_15007.enum_types = {}
SC_15007.fields = {
	slot13
}
SC_15007.is_extendable = false
SC_15007.extensions = {}
slot14.name = "item_list"
slot14.full_name = ".p15.cs_15008.item_list"
slot14.number = 1
slot14.index = 0
slot14.label = 3
slot14.has_default_value = false
slot14.default_value = {}
slot14.message_type = ITEMINFO
slot14.type = 11
slot14.cpp_type = 10
CS_15008.name = "cs_15008"
CS_15008.full_name = ".p15.cs_15008"
CS_15008.nested_types = {}
CS_15008.enum_types = {}
CS_15008.fields = {
	slot14
}
CS_15008.is_extendable = false
CS_15008.extensions = {}
slot15.name = "result"
slot15.full_name = ".p15.sc_15009.result"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
SC_15009.name = "sc_15009"
SC_15009.full_name = ".p15.sc_15009"
SC_15009.nested_types = {}
SC_15009.enum_types = {}
SC_15009.fields = {
	slot15
}
SC_15009.is_extendable = false
SC_15009.extensions = {}
slot16.name = "id"
slot16.full_name = ".p15.iteminfo.id"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "count"
slot17.full_name = ".p15.iteminfo.count"
slot17.number = 2
slot17.index = 1
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
ITEMINFO.name = "iteminfo"
ITEMINFO.full_name = ".p15.iteminfo"
ITEMINFO.nested_types = {}
ITEMINFO.enum_types = {}
ITEMINFO.fields = {
	slot16,
	slot17
}
ITEMINFO.is_extendable = false
ITEMINFO.extensions = {}
cs_15002 = slot0.Message(CS_15002)
cs_15004 = slot0.Message(CS_15004)
cs_15006 = slot0.Message(CS_15006)
cs_15008 = slot0.Message(CS_15008)
iteminfo = slot0.Message(ITEMINFO)
sc_15001 = slot0.Message(SC_15001)
sc_15003 = slot0.Message(SC_15003)
sc_15005 = slot0.Message(SC_15005)
sc_15007 = slot0.Message(SC_15007)
sc_15009 = slot0.Message(SC_15009)

return
