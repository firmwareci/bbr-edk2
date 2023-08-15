# BBR-EDK2

This repo build an UEFI application based on edk2 that checks ARM systems for
compliance against the current BBR (Baseboard-Boot-Requirements). UEFI and
ARM already specify tooling for this. However, we want to run this in an
automated environment.

## Build

We currently test everything on x64, however we will switch to AARCH64 soonish.
For now the only target is QEMU but the goal is to test this on real hardware
as soon as possible. To build the OVMF firmware and the EFI application just
run `task build`. To select a specific architecture, run `task build:x64`.

## Test using QEMU

Running `task run:qemu:x64` will bring up qemu for the x64 architecture, pass
OVMF.fd into qemu as firmware and map the EFI application as a drive `fs0`.
We also added a small `startup.nsh` that should automatically load our EFI
application.
