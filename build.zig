const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "pcg_basic",
        .target = target,
        .optimize = optimize,
    });

    lib.addCSourceFile(.{ .file = b.path("pcg_basic.c") });
    lib.linkLibC();
    lib.installHeader(.{ .path = "pcg_basic.h" }, "pcg_basic.h");
    b.installArtifact(lib);
}
