const path = require('node:path');
const fs = require('node:fs/promises');
const csv = require('fast-csv');

// https://github.com/Vladinator/wow-dbc-archive/blob/release/wow_latest/mapchallengemode.csv
// https://wago.tools/db2/MapChallengeMode
// https://wow.tools/dbc/?dbc=mapchallengemode

(async () => {

    const parseCsv = async (text) => {
        return new Promise(resolve => {
            const data = [];
            csv.parseString(text, { headers: true })
                .on('error', error => resolve(null))
                .on('data', row => data.push(row))
                .on('end', rowCount => resolve(data, rowCount));
        });
    };

    const filePath = `${path.join(__dirname, 'db', 'mapchallengemode')}.csv`;
    const text = await fs.readFile(filePath);
    const rows = await parseCsv(text);

    const items = rows.map(row => ({
        ID: row.ID,
        MapID: row.MapID,
    }));

    const db = [];

    for (const item of items) {
        const entry = db.find(entry => entry.MapID == item.MapID);
        if (entry) {
            entry.IDs.push(item.ID);
        } else {
            db.push({ MapID: item.MapID, IDs: [ item.ID ] });
        }
    }

    const lua = [];

    for (const entry of db) {
        const MapID = entry.MapID;
        const IDs = entry.IDs;
        lua.push(`[${MapID}] = ${IDs.length > 1 ? `{ ${IDs.join(', ')} }` : IDs[0]},`);
    }

    const luaSeparator = `\r\n${' '.repeat(4)}`;

    const luaText = `local INSTANCE_ID_TO_CHALLENGE_MAP_ID = {${luaSeparator}${lua.join(luaSeparator)}\r\n}`;

    console.log(luaText);

})();
