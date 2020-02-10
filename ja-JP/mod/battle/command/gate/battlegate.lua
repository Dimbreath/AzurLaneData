slot0 = class("BattleGate")
ys.Battle.BattleGate = slot0
slot0.__name = "BattleGate"
slot1[SYSTEM_PROLOGUE] = ys.Battle.BattleGatePrologue
slot1[SYSTEM_PERFORM] = ys.Battle.BattleGatePerform
slot1[SYSTEM_SIMULATION] = ys.Battle.BattleGateSimulation
slot1[SYSTEM_DODGEM] = ys.Battle.BattleGateDodgem
slot1[SYSTEM_SUBMARINE_RUN] = ys.Battle.BattleGateSubmarine
slot1[SYSTEM_SCENARIO] = ys.Battle.BattleGateScenario
slot1[SYSTEM_ROUTINE] = ys.Battle.BattleGateRoutine
slot1[SYSTEM_SUB_ROUTINE] = ys.Battle.BattleGateSubRoutine
slot1[SYSTEM_DUEL] = ys.Battle.BattleGateDuel
slot1[SYSTEM_ACT_BOSS] = ys.Battle.BattleGateActBoss
slot1[SYSTEM_HP_SHARE_ACT_BOSS] = ys.Battle.BattleGateHPShareActBoss
slot1[SYSTEM_BOSS_EXPERIMENT] = ys.Battle.BattleGateBossExperiment
slot1[SYSTEM_CHALLENGE] = ys.Battle.BattleGateChallenge
slot1[SYSTEM_WORLD] = ys.Battle.BattleGateWorld
slot1[SYSTEM_GUILD] = ys.Battle.BattleGateGuild
slot1[SYSTEM_DEBUG] = ys.Battle.BattleGateDebug
slot1[SYSTEM_TEST] = ys.Battle.BattleGateTest
slot0.Gates = {}

return slot0
