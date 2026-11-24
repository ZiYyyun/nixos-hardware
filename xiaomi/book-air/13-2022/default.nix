{ lib, ... }:
{
  imports = [
    ../../../common/cpu/intel
    ../../../common/pc/laptop
    ../../../common/pc/ssd
  ];

  hardware.enableRedistributableFirmware = lib.mkDefault true;

  hardware.intelgpu.vaapiDriver = lib.mkDefault "intel-media-driver";

  # Touchscreen, pen, and orientation sensors are connected through Intel LPSS
  # and the Integrated Sensor Hub.
  boot.initrd.availableKernelModules = [
    "i2c_hid_acpi"
    "intel_lpss_pci"
    "intel_ish_ipc"
  ];

  hardware.sensor.iio.enable = lib.mkDefault true;

  services.hardware.bolt.enable = lib.mkDefault true;

  services.thermald.enable = lib.mkDefault true;
}
