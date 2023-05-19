const path = require('node:path');
const fs = require('node:fs/promises');
const fetch = require('node-fetch');
const csv = require('fast-csv');

// https://wow.tools/dbc/?dbc=displayseason
const config = {
    download: false,
    build: '10.1.0.48898',
    expansion: 9,
    season: 9,
    // manually specify certain fields for these particular keystone instances
    keystoneInstanceOverride: {
        [2]: { // Temple of the Jade Serpent
            id: 5965,
        },
        [165]: { // Shadowmoon Burial Grounds
            id: 6932,
            lfd_activity_ids: [ 27, 35, 185, 407, 1193 ],
        },
        [200]: { // Halls of Valor
            id: 7672,
            shortName: 'HOV',
        },
        [210]: { // Court of Stars
            id: 8079,
            shortName: 'COS',
        },
        [227]: { // Return to Karazhan: Lower
            lfd_activity_ids: [ 470, 471 ],
            name: 'Return to Karazhan: Lower',
            shortName: 'LOWR',
        },
        [234]: { // Return to Karazhan: Upper
            lfd_activity_ids: [ 472, 473 ],
            name: 'Return to Karazhan: Upper',
            shortName: 'UPPR',
        },
        [369]: { // Operation: Mechagon - Junkyard
            lfd_activity_ids: [ 679, 682 ],
            name: 'Mechagon Junkyard',
            shortName: 'YARD',
        },
        [370]: { // Operation: Mechagon - Workshop
            lfd_activity_ids: [ 683, 684 ],
            name: 'Mechagon Workshop',
            shortName: 'WORK',
        },
        [391]: { // Tazavesh: Streets of Wonder
            lfd_activity_ids: [ 1016, 1018 ],
            shortName: 'STRT',
        },
        [392]: { // Tazavesh: So'leah's Gambit
            lfd_activity_ids: [ 1017, 1019 ],
            shortName: 'GMBT',
        },
        [399]: { // Ruby Life Pools
            id: 14063,
        },
        [400]: { // The Nokhud Offensive
            id: 13982,
            shortName: 'NO',
        },
        [401]: { // The Azure Vault
            id: 13954,
            shortName: 'AV',
        },
        [402]: { // Algeth'ar Academy
            id: 14032,
        },
    },
    // same as above, only by using the instance_map_id property
    instanceOverride: {
        [2522]: { // Vault of the Incarnates
            id: 14030,
            shortName: 'VOTI',
        },
        [2569]: { // Aberrus, the Shadowed Crucible
            id: 14663,
            shortName: 'ATSC',
        },
    },
};

(async () => {

    if (config.download) {
      if (!/^\d+\.\d+\.\d+\.\d+$/.test(config.build) || typeof config.expansion !== 'number') return console.error('Missing valid build and/or expansion id.');
      console.info(`Downloading data for game version ${config.build} and expansion ${config.expansion} ...`);
    } else {
      console.info('Using cached db data ...');
    }

    const seasonFiles = [
        {
            name: 'displayseason',
            fields: {
                'ExpansionID': 'ExpansionID',
                'ID': 'SeasonID',
                'Season': 'Season',
            },
        },
        {
            name: 'mythicplusseasontrackedmap',
            fields: {
                'DisplaySeasonID': 'SeasonID', // reference
                'MapChallengeModeID': 'ChallengeMapID',
            },
        },
    ];

    const instanceFiles = [
        {
            name: 'groupfinderactivity',
            fields: {
                'MapID': 'instance_map_id',
                'ID': 'lfd_activity_ids'
            }
        },
        {
            name: 'mapchallengemode',
            fields: {
                'MapID': 'instance_map_id', // reference
                'ID': 'keystone_instance',
                'Name_lang': 'name'
            }
        },
        {
            name: 'areatable',
            fields: {
                'ContinentID': 'instance_map_id', // reference
                'ID': 'id',
                'ZoneName': 'shortName'
            }
        },
        {
            name: 'map',
            fields: {
                'ID': 'instance_map_id', // reference
                'ExpansionID': 'expansion',
                'InstanceType': 'instanceType',
                'MapName_lang': 'mapName'
            }
        }
    ];

    const parseCsv = async (text) => {
        return new Promise(resolve => {
            const data = [];
            csv.parseString(text, { headers: true })
                .on('error', error => resolve(null))
                .on('data', row => data.push(row))
                .on('end', rowCount => resolve(data, rowCount));
        });
    };

    const getExistingItem = (items, newItem, isExistingFunc) => {
        for (const item of items) {
            if (isExistingFunc(items, newItem))
                return item;
        }
    };

    const mergeItems = (oldItem, newItem) => {
        for (let key in newItem) {
            const newVal = newItem[key];
            let oldVal = oldItem[key];
            if (oldVal === undefined) {
                oldItem[key] = newVal;
            } else if (oldVal !== newVal) {
                if (key === 'id' || key === 'shortName') {
                    continue;
                }
                if (!Array.isArray(oldVal)) {
                    oldVal = oldItem[key] = [ oldVal ];
                }
                if (oldVal.indexOf(newVal) < 0) {
                    oldVal.push(newVal);
                }
            }
        }
    };

    const fetchData = async (files, isExistingFunc) => {

        const items = [];

        for (const file of files) {

            let text;

            if (config.download) {
              const request = await fetch(`https://wow.tools/dbc/api/export/?name=${file.name}&build=${config.build}`, {
                headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36' }
              });
              text = await request.text();
            } else {
              const filePath = `${path.join(__dirname, 'db', file.name)}.csv`;
              text = await fs.readFile(filePath);
            }

            file.rows = await parseCsv(text);

            if (!file.rows)
                continue;

            for (const row of file.rows) {

                const temp = {};

                for (let field in file.fields) {

                    const key = file.fields[field];
                    const newVal = row[field];
                    let oldVal = temp[key];

                    if (oldVal === undefined) {
                        oldVal = temp[key] = newVal;
                    } else {
                        if (!Array.isArray(oldVal)) {
                            oldVal = temp[key] = [ oldVal ];
                        }
                        if (oldVal.indexOf(newVal) < 0) {
                            oldVal.push(newVal);
                        }
                    }

                }

                const existingItem = getExistingItem(items, temp, isExistingFunc);

                if (!existingItem) {
                    items.push(temp);
                } else {
                    mergeItems(existingItem, temp);
                }

            }

        }

        return items;

    };

    const groupData = (items, filterFunc, groupBy = null, groupValuesBy = null) => {
        const groups = {};
        const relevantItems = items.filter(filterFunc);
        if (!groupBy || !groupValuesBy)
            return relevantItems;
        for (const relevantItem of relevantItems) {
            const key = relevantItem[groupBy];
            groups[key] = { ...groups[key], ...relevantItem };
        }
        for (const item of items) {
            const valKey = item[groupValuesBy];
            if (!valKey)
                continue;
            const key = item[groupBy];
            const group = groups[key];
            if (!group)
                continue;
            let grouped = group[groupValuesBy];
            if (!grouped)
                grouped = group[groupValuesBy] = [];
            if (grouped.indexOf(valKey) === -1)
                grouped.push(valKey);
        }
        return Object.values(groups)[0];
    };

    const seasonData = await fetchData(seasonFiles, (season, temp) => (
        (season.ExpansionID !== undefined && season.ExpansionID === temp.ExpansionID) ||
        (season.SeasonID !== undefined && season.SeasonID === temp.SeasonID) ||
        (season.Season !== undefined && season.Season === temp.Season) ||
        (season.ChallengeMapID !== undefined && season.ChallengeMapID === temp.ChallengeMapID)
    ));

    const instanceData = await fetchData(instanceFiles, (dungeon, temp) => (
        (dungeon.instance_map_id !== undefined && dungeon.instance_map_id === temp.instance_map_id) ||
        (dungeon.keystone_instance !== undefined && dungeon.keystone_instance === temp.keystone_instance) ||
        (dungeon.id !== undefined && dungeon.id === temp.id) ||
        (dungeon.name !== undefined && dungeon.name === temp.name) ||
        (dungeon.shortName !== undefined && dungeon.shortName === temp.shortName) ||
        (dungeon.lfd_activity_ids !== undefined && dungeon.lfd_activity_ids === temp.lfd_activity_ids) ||
        (dungeon.lfd_activity_ids !== undefined && Array.isArray(dungeon.lfd_activity_ids) && dungeon.lfd_activity_ids.indexOf(temp.lfd_activity_ids) > -1) ||
        (dungeon.lfd_activity_ids !== undefined && Array.isArray(temp.lfd_activity_ids) && temp.lfd_activity_ids.indexOf(dungeon.lfd_activity_ids) > -1) ||
        (dungeon.lfd_activity_ids !== undefined && Array.isArray(dungeon.lfd_activity_ids) && Array.isArray(temp.lfd_activity_ids) && dungeon.lfd_activity_ids.indexOf(temp.lfd_activity_ids[0]) > -1)
    ));

    const season = groupData(seasonData, season => season.ExpansionID == config.expansion && season.Season == config.season, 'SeasonID', 'ChallengeMapID');
    const dungeons = groupData(instanceData, dungeon => season?.ChallengeMapID.indexOf(dungeon.keystone_instance) > -1 || (dungeon.instanceType == 2 && dungeon.expansion == config.expansion));

    const sanitizeObjectValues = (temp) => {
        for (let key in temp) {
            let val = temp[key];
            if (Array.isArray(val) && val.length < 2) {
                val = temp[key] = val[0];
            }
            if (typeof val === 'string' && /^\d+$/.test(val)) {
                val = temp[key] = parseInt(val);
            }
            if (Array.isArray(val)) {
                for (let j = 0; j < val.length; j++) {
                    if (typeof val[j] === 'string') {
                        if (/^\d+$/.test(val[j])) {
                            val[j] = parseInt(val[j]);
                        } else {
                            val[j] = '"' + val[j].replace(/\"/g, '\\"') + '"';
                        }
                    }
                }
            }
        }
    };

    sanitizeObjectValues(season);
    dungeons.forEach(sanitizeObjectValues);

    const file_groupfinderactivity_rows = instanceFiles.filter(file => file.name === 'groupfinderactivity')[0].rows;
    const file_mapchallengemode_rows = instanceFiles.filter(file => file.name === 'mapchallengemode')[0].rows;

    const extendDungeon = (dungeon, id) => {
        Object.assign(dungeon, {
            lfd_activity_ids: [],
            id: id,
            name: '',
            shortName: '',
        });
        const keystoneRows = file_mapchallengemode_rows.filter(row => row.ID == dungeon.keystone_instance);
        if (keystoneRows.length) {
            dungeon.name = keystoneRows[0].Name_lang;
        }
        const activityRows = file_groupfinderactivity_rows.filter(row => row.MapID == dungeon.instance_map_id);
        if (activityRows.length) {
            for (const activityRow of activityRows) {
                dungeon.lfd_activity_ids.push(parseInt(activityRow.ID));
            }
        }
        dungeon.shortName = (dungeon.mapName || dungeon.name).replace(/[\sa-z]+/g, '').replace(/[^a-zA-Z]+/g, ''); // TODO
    };

    for (let i = 0; i < dungeons.length; i++) {
        extendDungeon(dungeons[i], 1000000 + i + 1);
    }

    const timerFile = instanceFiles.filter(file => file.name === 'mapchallengemode')[0];
    const getTimerInfoForDungeon = dungeon => {
        if (!timerFile || !timerFile.rows)
            return;
        const dungeonRow = timerFile.rows.filter(row => row['ID'] - dungeon.keystone_instance === 0)[0];
        if (!dungeonRow)
            return;
        const goldTimer = parseInt(dungeonRow['CriteriaCount[2]']) || 0;
        const silverTimer = parseInt(dungeonRow['CriteriaCount[1]']) || 0;
        const bronzeTimer = parseInt(dungeonRow['CriteriaCount[0]']) || 0;
        return { goldTimer, silverTimer, bronzeTimer };
    };

    dungeons.forEach(dungeon => {
        const timerInfo = getTimerInfoForDungeon(dungeon);
        dungeon.timers = timerInfo ? [ timerInfo.goldTimer, timerInfo.silverTimer, timerInfo.bronzeTimer ] : [];
    });

    dungeons.forEach(dungeon => {
        const overrideData = config.keystoneInstanceOverride[dungeon.keystone_instance] || config.instanceOverride[dungeon.instance_map_id];
        if (!overrideData)
            return;
        for (const key in overrideData)
            dungeon[key] = overrideData[key];
    });

    dungeons.sort((a, b) => a.id - b.id);

    const sortedKeys = [
        'id',
        'keystone_instance',
        'instance_map_id',
        'lfd_activity_ids',
        'timers',
        'name',
        'shortName'
    ];

    const isDungeonValid = (dungeon) => dungeon !== undefined && dungeon.id !== undefined && dungeon.instance_map_id !== undefined && Array.isArray(dungeon.lfd_activity_ids) && dungeon.lfd_activity_ids.length;
    const isDungeonKeystoneValid = (dungeon) => Array.isArray(dungeon.timers) && dungeon.timers.length;

    const lua = [];

    for (let i = 0; i < dungeons.length; i++) {
        const dungeon = dungeons[i];
        if (!isDungeonValid(dungeon) || !isDungeonKeystoneValid(dungeon))
            continue;
        const lualine = ['\t[' + (lua.length + 1) + '] = {'];
        for (let j = 0; j < sortedKeys.length; j++) {
            const sortedKey = sortedKeys[j];
            let val = dungeon[sortedKey];
            if (typeof val === 'string') {
                val = '"' + val.replace(/\"/g, '\\"') + '"';
            } else if (Array.isArray(val)) {
                val = '{ ' + val.join(', ') + ' }';
            }
            lualine.push(`\t\t["${sortedKey}"] = ${val},`);
        }
        lualine.push('\t}');
        lua.push(lualine.join('\r\n'));
    }

    const sortedKeys2 = [
        'id',
        'instance_map_id',
        'lfd_activity_ids',
        'mapName',
        'shortName'
    ];

    const isDungeonRaidValid = dungeon => dungeon.instanceType == 2;

    const lua2 = [];

    for (let i = 0; i < dungeons.length; i++) {
        const dungeon = dungeons[i];
        if (!isDungeonValid(dungeon) || !isDungeonRaidValid(dungeon))
            continue;
        const lualine = ['\t[' + (lua2.length + 1) + '] = {'];
        for (let j = 0; j < sortedKeys2.length; j++) {
            const sortedKey = sortedKeys2[j];
            let val = dungeon[sortedKey];
            if (typeof val === 'string') {
                val = '"' + val.replace(/\"/g, '\\"') + '"';
            } else if (Array.isArray(val)) {
                val = '{ ' + val.join(', ') + ' }';
            }
            lualine.push(`\t\t["${sortedKey === 'mapName' ? 'name' : sortedKey}"] = ${val},`);
        }
        lualine.push('\t}');
        lua2.push(lualine.join('\r\n'));
    }

    console.log('local _, ns = ...\r\n\r\n-- Dungeon listing sorted by id\r\nns.dungeons = {\r\n' + lua.join(',\r\n') + '\r\n}\r\n\r\n-- Raid listing sorted by id\r\nns.raids = {\r\n' + lua2.join(',\r\n') + '\r\n}\r\n');

})();
