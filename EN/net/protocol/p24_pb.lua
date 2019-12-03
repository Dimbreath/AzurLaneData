slot0 = require("protobuf")
slot1 = require("common_pb")

module("p24_pb")

CS_24002 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
SC_24003 = slot0.Descriptor()
slot5 = slot0.FieldDescriptor()
CS_24004 = slot0.Descriptor()
slot6 = slot0.FieldDescriptor()
SC_24005 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
SC_24010 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
CS_24011 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
slot12 = slot0.FieldDescriptor()
SC_24012 = slot0.Descriptor()
slot13 = slot0.FieldDescriptor()
GROUPINFO = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
slot15 = slot0.FieldDescriptor()
slot16 = slot0.FieldDescriptor()
CHALLENGEINFO = slot0.Descriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
slot23 = slot0.FieldDescriptor()
USERCHALLENGEINFO = slot0.Descriptor()
slot24 = slot0.FieldDescriptor()
slot25 = slot0.FieldDescriptor()
slot26 = slot0.FieldDescriptor()
slot27 = slot0.FieldDescriptor()
slot28 = slot0.FieldDescriptor()
slot29 = slot0.FieldDescriptor()
slot30 = slot0.FieldDescriptor()
slot31 = slot0.FieldDescriptor()
SHIPINCHALLENGE = slot0.Descriptor()
slot32 = slot0.FieldDescriptor()
slot33 = slot0.FieldDescriptor()
slot34 = slot0.FieldDescriptor()
GROUPINFOINCHALLENGE = slot0.Descriptor()
slot35 = slot0.FieldDescriptor()
slot36 = slot0.FieldDescriptor()
slot37 = slot0.FieldDescriptor()
COMMANDERINCHALLENGE = slot0.Descriptor()
slot38 = slot0.FieldDescriptor()
slot39 = slot0.FieldDescriptor()
slot2.name = "activity_id"
slot2.full_name = ".p24.cs_24002.activity_id"
slot2.number = 1
slot2.index = 0
slot2.label = 2
slot2.has_default_value = false
slot2.default_value = 0
slot2.type = 13
slot2.cpp_type = 3
slot3.name = "group_list"
slot3.full_name = ".p24.cs_24002.group_list"
slot3.number = 2
slot3.index = 1
slot3.label = 3
slot3.has_default_value = false
slot3.default_value = {}
slot3.message_type = GROUPINFO
slot3.type = 11
slot3.cpp_type = 10
slot4.name = "mode"
slot4.full_name = ".p24.cs_24002.mode"
slot4.number = 3
slot4.index = 2
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
CS_24002.name = "cs_24002"
CS_24002.full_name = ".p24.cs_24002"
CS_24002.nested_types = {}
CS_24002.enum_types = {}
CS_24002.fields = {
	slot2,
	slot3,
	slot4
}
CS_24002.is_extendable = false
CS_24002.extensions = {}
slot5.name = "result"
slot5.full_name = ".p24.sc_24003.result"
slot5.number = 1
slot5.index = 0
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
SC_24003.name = "sc_24003"
SC_24003.full_name = ".p24.sc_24003"
SC_24003.nested_types = {}
SC_24003.enum_types = {}
SC_24003.fields = {
	slot5
}
SC_24003.is_extendable = false
SC_24003.extensions = {}
slot6.name = "activity_id"
slot6.full_name = ".p24.cs_24004.activity_id"
slot6.number = 1
slot6.index = 0
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
CS_24004.name = "cs_24004"
CS_24004.full_name = ".p24.cs_24004"
CS_24004.nested_types = {}
CS_24004.enum_types = {}
CS_24004.fields = {
	slot6
}
CS_24004.is_extendable = false
CS_24004.extensions = {}
slot7.name = "result"
slot7.full_name = ".p24.sc_24005.result"
slot7.number = 1
slot7.index = 0
slot7.label = 2
slot7.has_default_value = false
slot7.default_value = 0
slot7.type = 13
slot7.cpp_type = 3
slot8.name = "current_challenge"
slot8.full_name = ".p24.sc_24005.current_challenge"
slot8.number = 2
slot8.index = 1
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = nil
slot8.message_type = CHALLENGEINFO
slot8.type = 11
slot8.cpp_type = 10
slot9.name = "user_challenge"
slot9.full_name = ".p24.sc_24005.user_challenge"
slot9.number = 3
slot9.index = 2
slot9.label = 3
slot9.has_default_value = false
slot9.default_value = {}
slot9.message_type = USERCHALLENGEINFO
slot9.type = 11
slot9.cpp_type = 10
SC_24005.name = "sc_24005"
SC_24005.full_name = ".p24.sc_24005"
SC_24005.nested_types = {}
SC_24005.enum_types = {}
SC_24005.fields = {
	slot7,
	slot8,
	slot9
}
SC_24005.is_extendable = false
SC_24005.extensions = {}
slot10.name = "score"
slot10.full_name = ".p24.sc_24010.score"
slot10.number = 1
slot10.index = 0
slot10.label = 2
slot10.has_default_value = false
slot10.default_value = 0
slot10.type = 13
slot10.cpp_type = 3
SC_24010.name = "sc_24010"
SC_24010.full_name = ".p24.sc_24010"
SC_24010.nested_types = {}
SC_24010.enum_types = {}
SC_24010.fields = {
	slot10
}
SC_24010.is_extendable = false
SC_24010.extensions = {}
slot11.name = "activity_id"
slot11.full_name = ".p24.cs_24011.activity_id"
slot11.number = 1
slot11.index = 0
slot11.label = 2
slot11.has_default_value = false
slot11.default_value = 0
slot11.type = 13
slot11.cpp_type = 3
slot12.name = "mode"
slot12.full_name = ".p24.cs_24011.mode"
slot12.number = 2
slot12.index = 1
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
CS_24011.name = "cs_24011"
CS_24011.full_name = ".p24.cs_24011"
CS_24011.nested_types = {}
CS_24011.enum_types = {}
CS_24011.fields = {
	slot11,
	slot12
}
CS_24011.is_extendable = false
CS_24011.extensions = {}
slot13.name = "result"
slot13.full_name = ".p24.sc_24012.result"
slot13.number = 1
slot13.index = 0
slot13.label = 2
slot13.has_default_value = false
slot13.default_value = 0
slot13.type = 13
slot13.cpp_type = 3
SC_24012.name = "sc_24012"
SC_24012.full_name = ".p24.sc_24012"
SC_24012.nested_types = {}
SC_24012.enum_types = {}
SC_24012.fields = {
	slot13
}
SC_24012.is_extendable = false
SC_24012.extensions = {}
slot14.name = "id"
slot14.full_name = ".p24.groupinfo.id"
slot14.number = 1
slot14.index = 0
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
slot15.name = "ship_list"
slot15.full_name = ".p24.groupinfo.ship_list"
slot15.number = 2
slot15.index = 1
slot15.label = 3
slot15.has_default_value = false
slot15.default_value = {}
slot15.type = 13
slot15.cpp_type = 3
slot16.name = "commanders"
slot16.full_name = ".p24.groupinfo.commanders"
slot16.number = 3
slot16.index = 2
slot16.label = 3
slot16.has_default_value = false
slot16.default_value = {}
slot16.message_type = slot1.COMMANDERSINFO
slot16.type = 11
slot16.cpp_type = 10
GROUPINFO.name = "groupinfo"
GROUPINFO.full_name = ".p24.groupinfo"
GROUPINFO.nested_types = {}
GROUPINFO.enum_types = {}
GROUPINFO.fields = {
	slot14,
	slot15,
	slot16
}
GROUPINFO.is_extendable = false
GROUPINFO.extensions = {}
slot17.name = "season_max_score"
slot17.full_name = ".p24.challengeinfo.season_max_score"
slot17.number = 1
slot17.index = 0
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
slot18.name = "activity_max_score"
slot18.full_name = ".p24.challengeinfo.activity_max_score"
slot18.number = 2
slot18.index = 1
slot18.label = 2
slot18.has_default_value = false
slot18.default_value = 0
slot18.type = 13
slot18.cpp_type = 3
slot19.name = "season_max_level"
slot19.full_name = ".p24.challengeinfo.season_max_level"
slot19.number = 3
slot19.index = 2
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "activity_max_level"
slot20.full_name = ".p24.challengeinfo.activity_max_level"
slot20.number = 4
slot20.index = 3
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "season_id"
slot21.full_name = ".p24.challengeinfo.season_id"
slot21.number = 5
slot21.index = 4
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "dungeon_id_list"
slot22.full_name = ".p24.challengeinfo.dungeon_id_list"
slot22.number = 6
slot22.index = 5
slot22.label = 3
slot22.has_default_value = false
slot22.default_value = {}
slot22.type = 13
slot22.cpp_type = 3
slot23.name = "buff_list"
slot23.full_name = ".p24.challengeinfo.buff_list"
slot23.number = 7
slot23.index = 6
slot23.label = 3
slot23.has_default_value = false
slot23.default_value = {}
slot23.type = 13
slot23.cpp_type = 3
CHALLENGEINFO.name = "challengeinfo"
CHALLENGEINFO.full_name = ".p24.challengeinfo"
CHALLENGEINFO.nested_types = {}
CHALLENGEINFO.enum_types = {}
CHALLENGEINFO.fields = {
	slot17,
	slot18,
	slot19,
	slot20,
	slot21,
	slot22,
	slot23
}
CHALLENGEINFO.is_extendable = false
CHALLENGEINFO.extensions = {}
slot24.name = "current_score"
slot24.full_name = ".p24.userchallengeinfo.current_score"
slot24.number = 1
slot24.index = 0
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
slot25.name = "level"
slot25.full_name = ".p24.userchallengeinfo.level"
slot25.number = 2
slot25.index = 1
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
slot26.name = "groupinc_list"
slot26.full_name = ".p24.userchallengeinfo.groupinc_list"
slot26.number = 3
slot26.index = 2
slot26.label = 3
slot26.has_default_value = false
slot26.default_value = {}
slot26.message_type = GROUPINFOINCHALLENGE
slot26.type = 11
slot26.cpp_type = 10
slot27.name = "mode"
slot27.full_name = ".p24.userchallengeinfo.mode"
slot27.number = 4
slot27.index = 3
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
slot28.name = "issl"
slot28.full_name = ".p24.userchallengeinfo.issl"
slot28.number = 5
slot28.index = 4
slot28.label = 2
slot28.has_default_value = false
slot28.default_value = 0
slot28.type = 13
slot28.cpp_type = 3
slot29.name = "season_id"
slot29.full_name = ".p24.userchallengeinfo.season_id"
slot29.number = 6
slot29.index = 5
slot29.label = 2
slot29.has_default_value = false
slot29.default_value = 0
slot29.type = 13
slot29.cpp_type = 3
slot30.name = "dungeon_id_list"
slot30.full_name = ".p24.userchallengeinfo.dungeon_id_list"
slot30.number = 7
slot30.index = 6
slot30.label = 3
slot30.has_default_value = false
slot30.default_value = {}
slot30.type = 13
slot30.cpp_type = 3
slot31.name = "buff_list"
slot31.full_name = ".p24.userchallengeinfo.buff_list"
slot31.number = 8
slot31.index = 7
slot31.label = 3
slot31.has_default_value = false
slot31.default_value = {}
slot31.type = 13
slot31.cpp_type = 3
USERCHALLENGEINFO.name = "userchallengeinfo"
USERCHALLENGEINFO.full_name = ".p24.userchallengeinfo"
USERCHALLENGEINFO.nested_types = {}
USERCHALLENGEINFO.enum_types = {}
USERCHALLENGEINFO.fields = {
	slot24,
	slot25,
	slot26,
	slot27,
	slot28,
	slot29,
	slot30,
	slot31
}
USERCHALLENGEINFO.is_extendable = false
USERCHALLENGEINFO.extensions = {}
slot32.name = "id"
slot32.full_name = ".p24.shipinchallenge.id"
slot32.number = 1
slot32.index = 0
slot32.label = 2
slot32.has_default_value = false
slot32.default_value = 0
slot32.type = 13
slot32.cpp_type = 3
slot33.name = "hp_rant"
slot33.full_name = ".p24.shipinchallenge.hp_rant"
slot33.number = 2
slot33.index = 1
slot33.label = 2
slot33.has_default_value = false
slot33.default_value = 0
slot33.type = 13
slot33.cpp_type = 3
slot34.name = "ship_info"
slot34.full_name = ".p24.shipinchallenge.ship_info"
slot34.number = 3
slot34.index = 2
slot34.label = 2
slot34.has_default_value = false
slot34.default_value = nil
slot34.message_type = slot1.SHIPINFO
slot34.type = 11
slot34.cpp_type = 10
SHIPINCHALLENGE.name = "shipinchallenge"
SHIPINCHALLENGE.full_name = ".p24.shipinchallenge"
SHIPINCHALLENGE.nested_types = {}
SHIPINCHALLENGE.enum_types = {}
SHIPINCHALLENGE.fields = {
	slot32,
	slot33,
	slot34
}
SHIPINCHALLENGE.is_extendable = false
SHIPINCHALLENGE.extensions = {}
slot35.name = "id"
slot35.full_name = ".p24.groupinfoinchallenge.id"
slot35.number = 1
slot35.index = 0
slot35.label = 2
slot35.has_default_value = false
slot35.default_value = 0
slot35.type = 13
slot35.cpp_type = 3
slot36.name = "ships"
slot36.full_name = ".p24.groupinfoinchallenge.ships"
slot36.number = 2
slot36.index = 1
slot36.label = 3
slot36.has_default_value = false
slot36.default_value = {}
slot36.message_type = SHIPINCHALLENGE
slot36.type = 11
slot36.cpp_type = 10
slot37.name = "commanders"
slot37.full_name = ".p24.groupinfoinchallenge.commanders"
slot37.number = 3
slot37.index = 2
slot37.label = 3
slot37.has_default_value = false
slot37.default_value = {}
slot37.message_type = COMMANDERINCHALLENGE
slot37.type = 11
slot37.cpp_type = 10
GROUPINFOINCHALLENGE.name = "groupinfoinchallenge"
GROUPINFOINCHALLENGE.full_name = ".p24.groupinfoinchallenge"
GROUPINFOINCHALLENGE.nested_types = {}
GROUPINFOINCHALLENGE.enum_types = {}
GROUPINFOINCHALLENGE.fields = {
	slot35,
	slot36,
	slot37
}
GROUPINFOINCHALLENGE.is_extendable = false
GROUPINFOINCHALLENGE.extensions = {}
slot38.name = "pos"
slot38.full_name = ".p24.commanderinchallenge.pos"
slot38.number = 1
slot38.index = 0
slot38.label = 2
slot38.has_default_value = false
slot38.default_value = 0
slot38.type = 13
slot38.cpp_type = 3
slot39.name = "commanderinfo"
slot39.full_name = ".p24.commanderinchallenge.commanderinfo"
slot39.number = 2
slot39.index = 1
slot39.label = 2
slot39.has_default_value = false
slot39.default_value = nil
slot39.message_type = slot1.COMMANDERINFO
slot39.type = 11
slot39.cpp_type = 10
COMMANDERINCHALLENGE.name = "commanderinchallenge"
COMMANDERINCHALLENGE.full_name = ".p24.commanderinchallenge"
COMMANDERINCHALLENGE.nested_types = {}
COMMANDERINCHALLENGE.enum_types = {}
COMMANDERINCHALLENGE.fields = {
	slot38,
	slot39
}
COMMANDERINCHALLENGE.is_extendable = false
COMMANDERINCHALLENGE.extensions = {}
challengeinfo = slot0.Message(CHALLENGEINFO)
commanderinchallenge = slot0.Message(COMMANDERINCHALLENGE)
cs_24002 = slot0.Message(CS_24002)
cs_24004 = slot0.Message(CS_24004)
cs_24011 = slot0.Message(CS_24011)
groupinfo = slot0.Message(GROUPINFO)
groupinfoinchallenge = slot0.Message(GROUPINFOINCHALLENGE)
sc_24003 = slot0.Message(SC_24003)
sc_24005 = slot0.Message(SC_24005)
sc_24010 = slot0.Message(SC_24010)
sc_24012 = slot0.Message(SC_24012)
shipinchallenge = slot0.Message(SHIPINCHALLENGE)
userchallengeinfo = slot0.Message(USERCHALLENGEINFO)

return
