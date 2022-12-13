pub const std = @import("std");

pub const storage = @import("../Storage/Storage.zig");

pub fn runRetroEngine() !void {
    try storage.initStorage();
}