local _, ns = ...

-- Dungeon listing sorted by id
ns.dungeons = {
    [1] = {
        ["id"] = 1000001,
        ["keystone_instance"] = 2,
        ["instance_map_id"] = 960,
        ["lfd_activity_ids"] = { 155, 163, 1192 },
        ["timers"] = { 1080, 1440, 1800 },
        ["name"] = "Temple of the Jade Serpent",
        ["shortName"] = "TJS",
    },
    [2] = {
        ["id"] = 1000002,
        ["keystone_instance"] = 165,
        ["instance_map_id"] = 1176,
        ["lfd_activity_ids"] = { 27, 35, 185, 407, 1193 },
        ["timers"] = { 1188, 1584, 1980 },
        ["name"] = "Shadowmoon Burial Grounds",
        ["shortName"] = "SBG",
    },
    [3] = {
        ["id"] = 1000003,
        ["keystone_instance"] = 200,
        ["instance_map_id"] = 1477,
        ["lfd_activity_ids"] = { 427, 437, 447, 461 },
        ["timers"] = { 1368, 1824, 2280 },
        ["name"] = "Halls of Valor",
        ["shortName"] = "HV",
    },
    [4] = {
        ["id"] = 1000004,
        ["keystone_instance"] = 210,
        ["instance_map_id"] = 1571,
        ["lfd_activity_ids"] = { 433, 443, 453, 466 },
        ["timers"] = { 1080, 1440, 1800 },
        ["name"] = "Court of Stars",
        ["shortName"] = "CS",
    },
    [5] = {
        ["id"] = 1000005,
        ["keystone_instance"] = 399,
        ["instance_map_id"] = 2521,
        ["lfd_activity_ids"] = { 1173, 1174, 1175, 1176 },
        ["timers"] = { 1080, 1440, 1800 },
        ["name"] = "Ruby Life Pools",
        ["shortName"] = "RLP",
    },
    [6] = {
        ["id"] = 1000006,
        ["keystone_instance"] = 400,
        ["instance_map_id"] = 2516,
        ["lfd_activity_ids"] = { 1181, 1182, 1183, 1184 },
        ["timers"] = { 1440, 1920, 2400 },
        ["name"] = "The Nokhud Offensive",
        ["shortName"] = "TNO",
    },
    [7] = {
        ["id"] = 1000007,
        ["keystone_instance"] = 401,
        ["instance_map_id"] = 2515,
        ["lfd_activity_ids"] = { 1177, 1178, 1179, 1180 },
        ["timers"] = { 1224, 1632, 2040 },
        ["name"] = "The Azure Vault",
        ["shortName"] = "TAV",
    },
    [8] = {
        ["id"] = 1000008,
        ["keystone_instance"] = 402,
        ["instance_map_id"] = 2526,
        ["lfd_activity_ids"] = { 1157, 1158, 1159, 1160 },
        ["timers"] = { 1152, 1536, 1920 },
        ["name"] = "Algeth'ar Academy",
        ["shortName"] = "AA",
    }
}

-- Raid listing sorted by id
ns.raids = {
    [1] = {
        ["id"] = 1000009,
        ["instance_map_id"] = 2522,
        ["lfd_activity_ids"] = { 1189, 1190, 1191 },
        ["name"] = "Vault of the Incarnates",
        ["shortName"] = "VI",
    }
}
