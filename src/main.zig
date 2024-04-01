const std = @import("std");
const allocator = std.heap.c_allocator;

const fs = std.fs;
const print = std.debug.print;

pub fn main() !void {
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    for (1..args.len) |n| {
        if (std.mem.eql(u8, args[n], "init")) {
            std.fs.cwd().makeDir(".melih") catch |err| {
                switch (err) {
                    error.PathAlreadyExists => {
                        print("already initialized\n", .{});
                        return;
                    },
                    else => print("untracked error", .{}),
                }
            };

            print("succesfully initialized \n", .{});
        } else print("{s}\n", .{args[n]});
    }
}
