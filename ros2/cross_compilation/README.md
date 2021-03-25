# Cross-Compilation

This guide is adapted from the  [e-puck ros2 cross-compilation](https://github.com/cyberbotics/epuck_ros2/blob/master/installation/cross_compile/README.md) instructions.

## Before you start

- Make sure you have folloed the instructions at [RPi setup steps. ](https://github.com/TIERS/scalable-mav-swarm-with-ros2-batman-uwb/tree/main/rpi-setup)
- Install docker on your system

## ROS2 Cross-Compilation on Your PC

Start docker:
```bash
./start_docker.sh
```

Sync the content from the Pi to the container:
The first way, you can synchronize the content of the rootfs:
```bash
rsync -rLR --safe-links pi@[raspberry_pi_ip]:/{lib,usr,opt/vc/lib} /home/develop/rootfs
```

### Compilation Commands 

Download the ROS2 source code
```bash
cross-initialize
```

To compile the ROS2 source code execute:
```bash
cross-colcon-build --packages-up-to ros2topic
```
**Note**: you might need to run the command twice to compile `fastrtps` package.

## Using the Cross-Compiled ROS2 on your Raspberry Pi

To use the cross-compiled ROS2 on your Raspberry Pi you have to copy `./ros2_ws/install` to the Raspberry Pi:
```bash
scp -r install pi@[raspberry_pi_ip]:/home/pi/ros2
```

## Cross-Compiling Custom ROS2 Packages

With these tools, you can compile custom ROS2 packages as well.
It is enough to put the source code of the package to `./ros2_ws/src` and run `cross-colcon-build` inside the Docker.
For example, to compile the `epuck_ros2` package execute the following commands:

```bash
git clone --recurse-submodules https://github.com/cyberbotics/epuck_ros2.git src/epuck_ros2
cross-colcon-build --packages-up-to epuck_ros2_driver
```

> You can use the `--packages-select epuck_ros2_driver` flag to compile the `epuck_ros2_driver` package only.

### Missing Dependencies

Sometimes, your package will depend on ROS2 packages that are not a part of the ROS2 base.
In that case, you can use `cross-generator` to download it.
For example, for the `camera_info_manager`, you can download it with:
```bash
cross-generator camera_info_manager
```
