const path = require('node:path');
const fs = require('node:fs/promises');
const csv = require('fast-csv');
const fetch = require('node-fetch');

class DB {

    static CSV_URL = `https://raw.githubusercontent.com/Vladinator/wow-dbc-archive/release/wow_latest/{NAME}.csv`;

    constructor(cachePath) {
        this.cachePath = cachePath;
    }

    async getCache(name) {
        const filePath = path.join(__dirname, this.cachePath, `${name}.csv`);
        if (await fsAccess(filePath)) {
            return await fsReadFile(filePath);
        }
    }

    async setCache(name, text) {
        const filePath = path.join(__dirname, this.cachePath, `${name}.csv`);
        await fsWriteFile(filePath, text);
    }

    async getRemote(name) {
        const url = DB.CSV_URL.replace('{NAME}', name);
        const response = await fetch(url);
        if (response.ok) {
            return await response.text();
        }
    }

    async getFile(name) {
        let text = await this.getCache(name);
        if (text) {
            return text;
        }
        text = await this.getRemote(name);
        if (text) {
            await this.setCache(name, text);
            return text;
        }
    }

    async getFileCSV(name) {
        return new Promise(async resolve => {
            const text = await this.getFile(name);
            const data = [];
            csv.parseString(text, { headers: true })
                .on('error', error => resolve(null))
                .on('data', row => data.push(row))
                .on('end', rowCount => resolve(data));
        });

        const text = await this.getFile(name);
        const parser = csv.parseString(text);
        return parser;
    }

    equalOrIncluded(val1, val2, d) {
        if (val1 == null || val2 == null)
            return;
        if (val1 == val2)
            return true;
        if (Array.isArray(val1) && val1.some(o => o == val2))
            return true;
        if (Array.isArray(val2) && val2.some(o => o == val1))
            return true;
    }

    arraysIntersect(arr1, arr2) {
        if (!Array.isArray(arr1) || !Array.isArray(arr2))
            return;
        return arr1.some(val1 => arr2.some(val2 => val1 == val2));
    }

    mergeFunc(oldItem, newItem) {
        for (const key in newItem) {
            const newVal = newItem[key];
            let oldVal = oldItem[key];
            if (oldVal == null) {
                oldItem[key] = newVal;
            } else if (oldVal !== newVal) {
                if (key == 'id' || key == 'shortName')
                    continue;
                if (!Array.isArray(oldVal))
                    oldVal = oldItem[key] = [oldVal];
                if (!this.equalOrIncluded(oldVal, newVal))
                    oldVal.push(newVal);
            }
        }
    }

    async processRows(files, existingFunc) {
        const fileRows = {};
        const items = [];
        for (const file of files) {
            const rows = await this.getFileCSV(file.name);
            fileRows[file.name] = rows;
            for (const row of rows) {
                const item = {};
                for (const field in file.fields) {
                    const key = file.fields[field];
                    const newVal = row[field];
                    let oldVal = item[key];
                    if (oldVal == null) {
                        oldVal = item[key] = newVal;
                    } else {
                        if (!Array.isArray(oldVal))
                            oldVal = item[key] = [oldVal];
                        if (!this.equalOrIncluded(oldVal, newVal))
                            oldVal.push(newVal);
                    }
                }
                const existingItem = items.find(oldItem => existingFunc(oldItem, item));
                if (existingItem) {
                    this.mergeFunc(existingItem, item);
                } else {
                    items.push(item);
                }
            }
        }
        return [ items, fileRows ];
    }

    groupItems(items, filterFunc, groupBy, groupValuesBy) {
        const groupByKey = {};
        const relItems = items.filter(filterFunc);
        if (!groupBy || !groupValuesBy)
            return relItems;
        for (const relevantItem of relItems) {
            const key = relevantItem[groupBy];
            groupByKey[key] = { ...groupByKey[key], ...relevantItem };
        }
        for (const item of items) {
            const valKey = item[groupValuesBy];
            if (!valKey)
                continue;
            const key = item[groupBy];
            const group = groupByKey[key];
            if (!group)
                continue;
            let grouped = group[groupValuesBy];
            if (!grouped)
                grouped = group[groupValuesBy] = [];
            if (!this.equalOrIncluded(grouped, valKey))
                grouped.push(valKey);
        }
        return Object.values(groupByKey);
    }

    sanitizeItems(items, skipProps) {
        for (const item of items) {
            for (const key in item) {
                if (skipProps && this.equalOrIncluded(skipProps, key))
                    continue;
                let val = item[key];
                if (Array.isArray(val) && val.length < 2)
                    val = item[key] = val[0];
                if (typeof val === 'string' && /^\d+$/.test(val))
                    val = item[key] = parseInt(val);
                if (!Array.isArray(val))
                    continue;
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
    }

}

return module.exports = new DB('db');

async function fsAccess(filePath) {
    try {
        await fs.access(filePath);
        return true;
    } catch {
    }
    return false;
}

async function fsReadFile(filePath) {
    try {
        return await fs.readFile(filePath, 'utf8');
    } catch {
    }
}

async function fsWriteFile(filePath, data) {
    try {
        await fs.writeFile(filePath, data);
        return true;
    } catch {
    }
    return false;
}
