const rsdk = @import("Core/RetroEngine.zig");

pub fn main() !void {
    rsdk.runRetroEngine() catch {
        rsdk.std.log.err("failed to initialise engine!", .{});
        return;
    };
}