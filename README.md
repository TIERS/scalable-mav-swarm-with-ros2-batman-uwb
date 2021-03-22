**Work in progress**

# Scalable MAV Swarms: ROS2, Wi-Fi Mesh and UWB

TODO Description

## Towards a scalable MAV swarm

A preprint with initial intentions for this repo is [available at our webpage](https://tiers.utu.fi/paper/queralta2021telloswarm).

## Image for Raspberry Pi Zero W

Will be ready soon.

## Usage

This repo currently ships a pre-compiled version of ROS2 Foxy with minimal packages (Foxy is not officially supported for ARMv6).

### Wi-Fi Mesh and ROS2

1. Download and burn to an SD card the Raspberry Pi OS Lite from the [official downloads page.](https://www.raspberrypi.org/software/operating-systems/)
2. Follow instructions to set up the mesh network at [BATMAN-ADV Setup](/batman-adv-setup)
3. Download pre-compiled ROS2 from `TODO` and follow instructions to set up the development environment at [ROS2 Setup](/ros2)
4. If you prefer a custom build or you need additional packages, you may [build from source directly at the RPi Zero W](/ros2/local-compilation) (not recommended), or [cross-compile using a docker container](/ros2/cross-compilation)

### UWB Firmware

One of the major goals of this repo is to provide UWB-Based Situated Communication to the MAV swarm.

1. Download the UWB firmware for the DWM1001-Dev modules from `TODO`
2. You can find implementation details and configuration instructions at []

## Thanks

- Parts of this repo are based on awesome work to support ROS2 in the E-Puck robot [cyberbotics/epuck_ros2](https://github.com/cyberbotics/epuck_ros2)

- The tello driver is based on a minimalized version from [clydemcqueen/tello_ros](https://github.com/clydemcqueen/tello_ros)

## Contact

If you have any questions or comments feel free to write to `jopequ@utu.fi`.
