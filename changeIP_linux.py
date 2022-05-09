'''
Created on 22 nov. 2019

@author: Aaron
'''
import os
import platform
import sys
def change_ip_inux():

    ip = input("set your new ip address: ")
    netm = input("set your new netmask: ")
    gateway = input("set your new gateway: ")
    dns1 = input("set your primary DNS: ")
    dns2 = input("set your secondary DNS: ")
    interface = os.system("route | grep '^default' | grep -o '[^ ]*$'") #if it doesn't work add manually your interface


    #1. Set Your IP Address
    os.system(f'sudo ifconfig {interface} {ip} netmask {netm} up')

    #2. Set Your Default Gateway
    os.system(f'sudo ip route add {gateway} dev {interface}')
    os.system(f'sudo ip route add default via {gateway}')
    
    #3. Set Your DNS Server
    os.system(f'sudo echo "search localdomain\nnameserver {dns1}\nnameserver {dns2}" > /etc/resolv.conf')

if __name__ == "__main__":   
	change_ip_linux()