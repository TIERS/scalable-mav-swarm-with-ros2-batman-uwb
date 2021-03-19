## Setup batman-adv

Follow the following steps to setup a `gateway` node. As the gateway uses IP routing to selectively allow traffic to pass between the Mesh  and home/office networks the Mesh network needs to have a different address range.  The instructions use the following network details:

- Network 192.168.199.x
- netmask 255.255.255.0
- gateway address 192.168.199.1

1. To manage the mesh network, a utility called **batctl** needs to be installed.  This can be done using command

    ```
        sudo apt install -y batctl
    ```

2. Create a simlink to the bash script that starts `batman-adv`:

    ````
        ln -s start-batman-adv-gateway.sh ~/start-batman-adv.sh
    ````

3. Make the start-batman-adv.sh file executable with command :

    ```
        chmod +x ~/start-batman-adv.sh
    ```

4. Create the network interface definition for the wlan0 interface by creating a file as root user e.g.

    ```
        sudo cp wlan0_setup /etc/network/interfaces.d/wlan0
    ```

    You can replace:

    - the channel number with a [valid 2.4 GHz WiFi channel number for your region](https://en.wikipedia.org/wiki/List_of_WLAN_channels) (most regions support channels 1 to 11)
    - the essid with a network name of your choosing

    However, these values must be the same on ALL devices that will form your mesh network.

5. Ensure the batman-adv kernel module is loaded at boot time by issuing the following command :

    ```
        echo 'batman-adv' | sudo tee --append /etc/modules
    ```

6. Stop the DHCP process from trying to manage the wireless lan interface by issuing the following command :

    ```
        echo 'denyinterfaces wlan0' | sudo tee --append /etc/dhcpcd.conf
    ```

7. Make sure the startup script gets called by editing file **/etc/rc.local** as root user, and insert:

    ```
        /home/pi/start-batman-adv.sh &
    ```

    before the last line: **exit 0**
    
8. Install the DHCP software with command : 
    
    ```
        sudo apt install -y dnsmasq
    ```
    
9. Configure the DHCP server by editing the dnsmasq.conf file as root user and add the following lines to the end of the file:

    ```
        interface=bat0
        dhcp-range=192.168.199.2,192.168.199.99,255.255.255.0,12h
    ```

10. You can now reboot

    ```
    sudo reboot -h now
    ```
