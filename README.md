# Kinect depth Image

This is a simple program that uses the Kinect sensor to display depth data in real-time. It displays an ascii image where each pixel represents the distance to the closest object in the scene. The closer an object is, the lower the value is.

![gif](./Example.gif)

## Kinect v1 Requirements
- Kinect v1
- Kinect v1 power adapter for windows

####  Linux

Requirements?
```bash 
sudo apt-get install libusb-1.0-0 libusb-1.0-0-dev
```

#### Windows.

 - Use [Zadig](http://zadig.akeo.ie/) to install the libusbK driver for each device you wish to use. This includes installing the libusbK for all the kinect v1 drivers listed on Zadig GUI.
 - If you got the error message 'Isochronous transfer error: 1', you should try downgrade the libusbK using [Older Zadig Version](http://zadig.akeo.ie/downloads/zadig_2.0.1.exe)
