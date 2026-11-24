# Xiaomi Book Air 13 2022

This profile supports the 2022 Xiaomi Book Air 13 convertible with an Intel
Alder Lake-U processor. It has been tested on physical hardware with NixOS.

## Hardware support

The touchscreen and active pen use the kernel HID over I2C drivers. Display
orientation is exposed through Intel ISH/IIO. The profile enables
`iio-sensor-proxy`; automatic rotation remains the responsibility of the
desktop environment.

The Intel AX211 wireless adapter is supported by `iwlwifi`. Bluetooth can be
enabled with:

```nix
hardware.bluetooth.enable = true;
```

Both USB-C ports support Thunderbolt 4. The profile enables `bolt` by default
for device authorization.

## Known issues

### Camera

The camera is an ACPI `HYV0847` (Hynix HI847) sensor connected through Intel
IPU6. The current Intel IPU6EP userspace stack has no HI847 sensor profile, AIQ
tuning data, or graph settings. The generic relay may create `/dev/video50`,
but it falls back to an AR0234 configuration and cannot stream frames. Leave
`hardware.ipu6.enable` disabled until HI847 support is available upstream.

### Fingerprint reader

The Goodix `27c6:5812` fingerprint reader is not supported by upstream
`libfprint`.

### Keyboard backlight

The firmware exposes hotkeys through `redmi_wmi`, but it does not expose a
keyboard-backlight LED device in `/sys/class/leds`.
