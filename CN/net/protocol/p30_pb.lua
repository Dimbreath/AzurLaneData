slot0 = require("protobuf")

module("p30_pb")

SC_30001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
CS_30002 = slot0.Descriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
SC_30003 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
CS_30004 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
SC_30005 = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
CS_30006 = slot0.Descriptor()
slot9 = slot0.FieldDescriptor()
SC_30007 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
CS_30008 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
SC_30009 = slot0.Descriptor()
slot12 = slot0.FieldDescriptor()
CS_30010 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
slot14 = slot0.FieldDescriptor()
SC_30011 = slot0.Descriptor()
slot15 = slot0.FieldDescriptor()
MAIL_SIGLE = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
MAIL_DETAIL = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
ATTACHMENT = slot0.Descriptor()
slot26 = slot0.FieldDescriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
CS_30101 = slot0.Descriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
SC_30102 = slot0.Descriptor()
slot31 = slot0.FieldDescriptor()
slot32 = slot0.FieldDescriptor()
ANSWER = slot0.Descriptor()
slot33 = slot0.FieldDescriptor()
slot34 = slot0.FieldDescriptor()
slot35 = slot0.FieldDescriptor()
slot2.name = "unread_number"
slot2.full_name = ".p30.sc_30001.unread_number"
slot2.number = 1
slot2.index = 0
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "total_number"
slot3.full_name = ".p30.sc_30001.total_number"
slot3.number = 3
slot3.index = 1
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
SC_30001.name = "sc_30001"
SC_30001.full_name = ".p30.sc_30001"
SC_30001.nested_types = {}
SC_30001.enum_types = {}
SC_30001.fields = {
	slot2,
	slot3
}
SC_30001.is_extendable = false
SC_30001.extensions = {}
slot4.name = "type"
slot4.full_name = ".p30.cs_30002.type"
slot4.number = 1
slot4.index = 0
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "split_id"
slot5.full_name = ".p30.cs_30002.split_id"
slot5.number = 2
slot5.index = 1
slot5.label = 1
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
CS_30002.name = "cs_30002"
CS_30002.full_name = ".p30.cs_30002"
CS_30002.nested_types = {}
CS_30002.enum_types = {}
CS_30002.fields = {
	slot4,
	slot5
}
CS_30002.is_extendable = false
CS_30002.extensions = {}
slot6.name = "mail_list"
slot6.full_name = ".p30.sc_30003.mail_list"
slot6.number = 1
slot6.index = 0
slot6.label = 3
slot6.has_default_value = false
slot6.default_value = {}
slot6.message_type = MAIL_SIGLE
slot6.type = 11
slot6.cpp_type = 10
SC_30003.name = "sc_30003"
SC_30003.full_name = ".p30.sc_30003"
SC_30003.nested_types = {}
SC_30003.enum_types = {}
SC_30003.fields = {
	slot6
}
SC_30003.is_extendable = false
SC_30003.extensions = {}
slot7.name = "id"
slot7.full_name = ".p30.cs_30004.id"
slot7.number = 1
slot7.index = 0
slot7.label = 3
slot7.has_default_value = false
slot7.default_value = {}
slot7.type = 13
slot7.cpp_type = 3
CS_30004.name = "cs_30004"
CS_30004.full_name = ".p30.cs_30004"
CS_30004.nested_types = {}
CS_30004.enum_types = {}
CS_30004.fields = {
	slot7
}
CS_30004.is_extendable = false
CS_30004.extensions = {}
slot8.name = "attachment_list"
slot8.full_name = ".p30.sc_30005.attachment_list"
slot8.number = 1
slot8.index = 0
slot8.label = 3
slot8.has_default_value = false
slot8.default_value = {}
slot8.message_type = ATTACHMENT
slot8.type = 11
slot8.cpp_type = 10
SC_30005.name = "sc_30005"
SC_30005.full_name = ".p30.sc_30005"
SC_30005.nested_types = {}
SC_30005.enum_types = {}
SC_30005.fields = {
	slot8
}
SC_30005.is_extendable = false
SC_30005.extensions = {}
slot9.name = "id"
slot9.full_name = ".p30.cs_30006.id"
slot9.number = 1
slot9.index = 0
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
CS_30006.name = "cs_30006"
CS_30006.full_name = ".p30.cs_30006"
CS_30006.nested_types = {}
CS_30006.enum_types = {}
CS_30006.fields = {
	slot9
}
CS_30006.is_extendable = false
CS_30006.extensions = {}
slot10.name = "id_list"
slot10.full_name = ".p30.sc_30007.id_list"
slot10.number = 1
slot10.index = 0
slot10.label = 3
slot10.has_default_value = false
slot10.default_value = {}
slot10.type = 13
slot10.cpp_type = 3
SC_30007.name = "sc_30007"
SC_30007.full_name = ".p30.sc_30007"
SC_30007.nested_types = {}
SC_30007.enum_types = {}
SC_30007.fields = {
	slot10
}
SC_30007.is_extendable = false
SC_30007.extensions = {}
slot11.name = "id"
slot11.full_name = ".p30.cs_30008.id"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
CS_30008.name = "cs_30008"
CS_30008.full_name = ".p30.cs_30008"
CS_30008.nested_types = {}
CS_30008.enum_types = {}
CS_30008.fields = {
	slot11
}
CS_30008.is_extendable = false
CS_30008.extensions = {}
slot12.name = "detail_info"
slot12.full_name = ".p30.sc_30009.detail_info"
slot12.number = 1
slot12.index = 0
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = nil
slot12.message_type = MAIL_DETAIL
slot12.type = 11
slot12.cpp_type = 10
SC_30009.name = "sc_30009"
SC_30009.full_name = ".p30.sc_30009"
SC_30009.nested_types = {}
SC_30009.enum_types = {}
SC_30009.fields = {
	slot12
}
SC_30009.is_extendable = false
SC_30009.extensions = {}
slot13.name = "id"
slot13.full_name = ".p30.cs_30010.id"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
slot14.name = "flag"
slot14.full_name = ".p30.cs_30010.flag"
slot14.number = 2
slot14.index = 1
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
CS_30010.name = "cs_30010"
CS_30010.full_name = ".p30.cs_30010"
CS_30010.nested_types = {}
CS_30010.enum_types = {}
CS_30010.fields = {
	slot13,
	slot14
}
CS_30010.is_extendable = false
CS_30010.extensions = {}
slot15.name = "result"
slot15.full_name = ".p30.sc_30011.result"
slot15.number = 1
slot15.index = 0
slot15.label = 2
slot15.has_default_value = false
slot15.default_value = 0
slot15.type = 13
slot15.cpp_type = 3
SC_30011.name = "sc_30011"
SC_30011.full_name = ".p30.sc_30011"
SC_30011.nested_types = {}
SC_30011.enum_types = {}
SC_30011.fields = {
	slot15
}
SC_30011.is_extendable = false
SC_30011.extensions = {}
slot16.name = "id"
slot16.full_name = ".p30.mail_sigle.id"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
slot17.name = "date"
slot17.full_name = ".p30.mail_sigle.date"
slot17.number = 2
slot17.index = 1
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
slot18.name = "title"
slot18.full_name = ".p30.mail_sigle.title"
slot18.number = 3
slot18.index = 2
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = ""
slot18.type = 9
slot18.cpp_type = 9
slot19.name = "attach_flag"
slot19.full_name = ".p30.mail_sigle.attach_flag"
slot19.number = 4
slot19.index = 3
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "read_flag"
slot20.full_name = ".p30.mail_sigle.read_flag"
slot20.number = 5
slot20.index = 4
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "attachment_list"
slot21.full_name = ".p30.mail_sigle.attachment_list"
slot21.number = 6
slot21.index = 5
slot21.label = 3
slot21.has_default_value = false
slot21.default_value = {}
slot21.message_type = ATTACHMENT
slot21.type = 11
slot21.cpp_type = 10
slot22.name = "imp_flag"
slot22.full_name = ".p30.mail_sigle.imp_flag"
slot22.number = 7
slot22.index = 6
slot22.label = 2
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
MAIL_SIGLE.name = "mail_sigle"
MAIL_SIGLE.full_name = ".p30.mail_sigle"
MAIL_SIGLE.nested_types = {}
MAIL_SIGLE.enum_types = {}
MAIL_SIGLE.fields = {
	slot16,
	slot17,
	slot18,
	slot19,
	slot20,
	slot21,
	slot22
}
MAIL_SIGLE.is_extendable = false
MAIL_SIGLE.extensions = {}
slot23.name = "id"
slot23.full_name = ".p30.mail_detail.id"
slot23.number = 1
slot23.index = 0
slot23.label = 2
slot23.has_default_value = false
slot23.default_value = 0
slot23.type = 13
slot23.cpp_type = 3
slot24.name = "content"
slot24.full_name = ".p30.mail_detail.content"
slot24.number = 2
slot24.index = 1
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = ""
slot24.type = 9
slot24.cpp_type = 9
slot25.name = "attachment_list"
slot25.full_name = ".p30.mail_detail.attachment_list"
slot25.number = 3
slot25.index = 2
slot25.label = 3
slot25.has_default_value = false
slot25.default_value = {}
slot25.message_type = ATTACHMENT
slot25.type = 11
slot25.cpp_type = 10
MAIL_DETAIL.name = "mail_detail"
MAIL_DETAIL.full_name = ".p30.mail_detail"
MAIL_DETAIL.nested_types = {}
MAIL_DETAIL.enum_types = {}
MAIL_DETAIL.fields = {
	slot23,
	slot24,
	slot25
}
MAIL_DETAIL.is_extendable = false
MAIL_DETAIL.extensions = {}
slot26.name = "type"
slot26.full_name = ".p30.attachment.type"
slot26.number = 1
slot26.index = 0
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
slot27.name = "id"
slot27.full_name = ".p30.attachment.id"
slot27.number = 2
slot27.index = 1
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "number"
slot28.full_name = ".p30.attachment.number"
slot28.number = 3
slot28.index = 2
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
ATTACHMENT.name = "attachment"
ATTACHMENT.full_name = ".p30.attachment"
ATTACHMENT.nested_types = {}
ATTACHMENT.enum_types = {}
ATTACHMENT.fields = {
	slot26,
	slot27,
	slot28
}
ATTACHMENT.is_extendable = false
ATTACHMENT.extensions = {}
slot29.name = "act_id"
slot29.full_name = ".p30.cs_30101.act_id"
slot29.number = 1
slot29.index = 0
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
slot30.name = "answers"
slot30.full_name = ".p30.cs_30101.answers"
slot30.number = 2
slot30.index = 1
slot30.label = 3
slot30.has_default_value = false
slot30.default_value = {}
slot30.message_type = ANSWER
slot30.type = 11
slot30.cpp_type = 10
CS_30101.name = "cs_30101"
CS_30101.full_name = ".p30.cs_30101"
CS_30101.nested_types = {}
CS_30101.enum_types = {}
CS_30101.fields = {
	slot29,
	slot30
}
CS_30101.is_extendable = false
CS_30101.extensions = {}
slot31.name = "result"
slot31.full_name = ".p30.sc_30102.result"
slot31.number = 1
slot31.index = 0
slot31.label = 2
slot31.has_default_value = false
slot31.default_value = 0
slot31.type = 13
slot31.cpp_type = 3
slot32.name = "drop_list"
slot32.full_name = ".p30.sc_30102.drop_list"
slot32.number = 2
slot32.index = 1
slot32.label = 3
slot32.has_default_value = false
slot32.default_value = {}
slot32.message_type = require("common_pb").DROPINFO
slot32.type = 11
slot32.cpp_type = 10
SC_30102.name = "sc_30102"
SC_30102.full_name = ".p30.sc_30102"
SC_30102.nested_types = {}
SC_30102.enum_types = {}
SC_30102.fields = {
	slot31,
	slot32
}
SC_30102.is_extendable = false
SC_30102.extensions = {}
slot33.name = "id"
slot33.full_name = ".p30.answer.id"
slot33.number = 1
slot33.index = 0
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = 0
slot33.type = 13
slot33.cpp_type = 3
slot34.name = "options"
slot34.full_name = ".p30.answer.options"
slot34.number = 2
slot34.index = 1
slot34.label = 3
slot34.has_default_value = false
slot34.default_value = {}
slot34.type = 13
slot34.cpp_type = 3
slot35.name = "contain"
slot35.full_name = ".p30.answer.contain"
slot35.number = 3
slot35.index = 2
slot35.label = 1
slot35.has_default_value = false
slot35.default_value = ""
slot35.type = 9
slot35.cpp_type = 9
ANSWER.name = "answer"
ANSWER.full_name = ".p30.answer"
ANSWER.nested_types = {}
ANSWER.enum_types = {}
ANSWER.fields = {
	slot33,
	slot34,
	slot35
}
ANSWER.is_extendable = false
ANSWER.extensions = {}
answer = slot0.Message(ANSWER)
attachment = slot0.Message(ATTACHMENT)
cs_30002 = slot0.Message(CS_30002)
cs_30004 = slot0.Message(CS_30004)
cs_30006 = slot0.Message(CS_30006)
cs_30008 = slot0.Message(CS_30008)
cs_30010 = slot0.Message(CS_30010)
cs_30101 = slot0.Message(CS_30101)
mail_detail = slot0.Message(MAIL_DETAIL)
mail_sigle = slot0.Message(MAIL_SIGLE)
sc_30001 = slot0.Message(SC_30001)
sc_30003 = slot0.Message(SC_30003)
sc_30005 = slot0.Message(SC_30005)
sc_30007 = slot0.Message(SC_30007)
sc_30009 = slot0.Message(SC_30009)
sc_30011 = slot0.Message(SC_30011)
sc_30102 = slot0.Message(SC_30102)

return
