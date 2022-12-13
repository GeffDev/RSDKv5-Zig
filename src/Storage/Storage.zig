const rsdk = @import("../Core/RetroEngine.zig");

pub const storageEntryCount = 0x1000;

pub const StorageDataSets = enum {
    datasetSTG,
    datasetMUS,
    datasetSFX,
    datasetSTR,
    datasetTMP,
    datasetMAX,
};

pub const DataStorage = struct {
    memoryTable: *u32,
    usedStorage: u32,
    storageLimit: u32,
    dataEntries: **[storageEntryCount]u32,
    storageEntries: *[storageEntryCount]u32,
    entryCount: u32,
    clearCount: u32,
};

pub const MemoryHeaders = enum {
    headerActive,
    headerSetID,
    headerDataOffset,
    headerDataLength,
    headerSize,
};

pub var dataStorage: [@enumToInt(StorageDataSets.datasetMAX)]DataStorage = undefined;

pub fn initStorage() !void {
    dataStorage[@enumToInt(StorageDataSets.datasetSTG)].storageLimit = 24 * 1024 * 1024;
    dataStorage[@enumToInt(StorageDataSets.datasetMUS)].storageLimit = 8 * 1024 * 1024;
    dataStorage[@enumToInt(StorageDataSets.datasetSFX)].storageLimit = 32 * 1024 * 1024;
    dataStorage[@enumToInt(StorageDataSets.datasetSTR)].storageLimit = 2 * 1024 * 1024;
    dataStorage[@enumToInt(StorageDataSets.datasetTMP)].storageLimit = 8 * 1024 * 1024;

    var s: usize = 0;
    while (s < @enumToInt(StorageDataSets.datasetMAX)) : (s += 1) {
        dataStorage[s].usedStorage = 0;
        dataStorage[s].entryCount = 0;
        dataStorage[s].clearCount = 0;
    }
}