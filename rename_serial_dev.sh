#!/bin/bash
# meatpi.com
# Check if the files already exist
if [ -f "/etc/udev/rules.d/20_USB_Serial.rules" ]; then
  echo "File 20_USB_Serial.rules already exists. Exiting..."
  exit 1
fi

if [ -f "/etc/udev/rules.d/99-usb-serial.rules" ]; then
  echo "File 99-usb-serial.rules already exists. Exiting..."
  exit 1
fi

# Create the first file and add the content
echo 'SUBSYSTEMS=="usb", ENV{ID_USB_INTERFACE_NUM}="$attr{bInterfaceNumber}"' \
  | sudo tee /etc/udev/rules.d/20_USB_Serial.rules

# Check if the first file was created successfully
if [ -f "/etc/udev/rules.d/20_USB_Serial.rules" ]; then
  echo "File 20_USB_Serial.rules created successfully!"
else
  echo "File 20_USB_Serial.rules creation failed. Exiting..."
  exit 1
fi

# Create the second file and add the content
echo 'SUBSYSTEM=="tty", SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="11fd", ENV{ID_USB_INTERFACE_NUM}=="00", SYMLINK+="MP-CAN0"
SUBSYSTEM=="tty", SUBSYSTEMS=="usb", ATTRS{idVendor}=="16d0", ATTRS{idProduct}=="11fd", ENV{ID_USB_INTERFACE_NUM}=="02", SYMLINK+="MP-CAN1"' \
  | sudo tee /etc/udev/rules.d/99-usb-serial.rules

# Check if the second file was created successfully
if [ -f "/etc/udev/rules.d/99-usb-serial.rules" ]; then
  echo "File 99-usb-serial.rules created successfully!"
else
  echo "File 99-usb-serial.rules creation failed. Exiting..."
  exit 1
fi

# Reload udev rules and trigger udev events
sudo udevadm control --reload-rules && sudo udevadm trigger

echo "Udev rules reloaded and events triggered successfully!"
