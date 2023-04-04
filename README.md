<img src="https://github.com/slimelec/ollie-hw/blob/master/images/mpi_logo.png" width=300>

[www.meatpi.com](https://www.meatpi.com)
---


![image](https://user-images.githubusercontent.com/94690098/218752989-d5006863-8b0d-4659-a94b-8a14d78d0261.png)


---


- ### [Flash new Firmware](https://github.com/meatpiHQ/mp_usb_dual_can#1-flash-new-firmware)
- ### [SocketCAN](https://github.com/meatpiHQ/mp_usb_dual_can#2-socketcan)
- ### [RealDash](https://github.com/meatpiHQ/mp_usb_dual_can#3-realdash)
- ### [API](https://github.com/meatpiHQ/mp_usb_dual_can#4-api)
- ### [BUSMaster](https://github.com/meatpiHQ/mp_usb_dual_can#5-busmaster)


## 1. Flash new Firmware:

![image](https://user-images.githubusercontent.com/94690098/146773960-5d2bcb26-4532-49b1-88ed-c5d18794a0c0.png)

There are 2 avilable firmwares, socketCAN and ReadDash. 
Download mpFlasher Tool. [**Link**](https://drive.google.com/drive/folders/1ZuAvOhjXHvq5TKOJofSgyZFOzkQ3mTIc)
1. While pressing the push button, plug in the USB-C cable.
2. Both LEDs should start blinking
3. Once in DFU mode, the device will appear as "USB Serial Device"
4. If you have multiple USB Serial devices connected make sure to choose the right one
5. Click the "Three Dots" button to select the firmware file
6. Then Click flash button. 

## 2. SocketCAN  

SocketCAN is a Linux-based socket interface for CAN bus communication. It provides a standardized API for accessing CAN hardware and a set of utilities for working with CAN devices. SocketCAN supports multiple CAN controllers and can handle different types of CAN buses, such as CAN 2.0A and CAN 2.0B.

MeatPi Dual CAN adapter is compatible with SocketCAN, which means it can be used with Linux-based systems that support SocketCAN. This makes it an ideal choice for users who need a high-performance CAN adapter that works seamlessly with their Linux-based systems, and allows them to take advantage of the advanced features and functionalities offered by SocketCAN.

The following commands will bring up 2 CAN interfaces, CAN1 and CAN2.

```
sudo chmod +x rename_serial_dev.sh
sudo ./rename_serial_dev.sh     # This will create /dev/MP-CAN1 and /dev/MP-CAN2
sudo slcand -o -s6 /dev/MP-CAN1 can1; sudo slcand -o -s6 /dev/MP-CAN2 can2   # s6: 500Kbit
sudo ifconfig can1 txqueuelen 1000;sudo ifconfig can2 txqueuelen 1000
sudo ifconfig can1 up; sudo ifconfig can2 up
```

## 3. RealDash

Make sure to flash [realdash firmware first](https://github.com/meatpiHQ/mp_usb_dual_can#1-flash-new-firmware)

CAN bitrate can be set for each channel independently using the jumpers. The supported bitrate are 250K, 500K, 800K and 1000K.

![image](https://user-images.githubusercontent.com/94690098/229812082-129e5134-5d1b-43a9-be67-ed7c9432925f.png)



The realdash firmware multiplex both CAN1 and CAN2 into a single channel USB-Serial channel. Which means any CAN frame received on CAN1 or CAN2 is sent to the same USB-Serial channel and any frmware send from the USB-Serial is sent on both channels.

1. Go to garage then click on the dashboard.
2. Click Add connection.
3. Select Adapter (CAN/LIN)
4. Select RealDash CAN
5. Select SERIAL/USB
6. Then select "MeatPi Dual CAN" from the list.
7. Ignor the Baud Rate here has no effect here.
8. Then click Done.

## 4. API

[**API LabView, C#, VB.Net, Delphi, Python - Programming Examples**](https://github.com/meatpiHQ/programming_examples/tree/master/CAN)

[**Api Documentation**](https://drive.google.com/drive/folders/1ZuAvOhjXHvq5TKOJofSgyZFOzkQ3mTIc)

## 5. BUSMaster
You need to download the right version of BUSMaster provided in the [**Link**](https://drive.google.com/drive/folders/1ZuAvOhjXHvq5TKOJofSgyZFOzkQ3mTIc) above. Here is how to setup the hardware. 
1. Select VSCom CAN-API by clicking on 'Driver Selection -> VSCom CAN-API"
2. Then Click on 'Channel Configuration -> Advanced' 
3. Click on 'Search for Devices on COM-Ports', the device should appear in the drop downlist or fill the right COM port number
4. Check the 'Hardware Timestamps' check box.
5. Choose the Baudrate.
6. Click 'OK', then Click the Connect button on the top left corner.

![image](https://user-images.githubusercontent.com/94690098/152467965-3bc36968-4de3-470f-bf0e-b39237e86d7f.png)



---

© 2023 meatPi Electronics | www.meatpi.com | PO Box 5005 Clayton, VIC 3168, Australia
