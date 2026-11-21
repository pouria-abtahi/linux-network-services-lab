#!/bin/bash
# firewalld setup on the server (most of this was done in the firewalld GUI;
# these are the equivalent commands and the checks I ran).

systemctl enable --now firewalld

# Services allowed in the public zone
for svc in ssh https pop3s smtp dns nfs ipp vnc-server samba http; do
  firewall-cmd --permanent --zone=public --add-service="$svc"
done
firewall-cmd --permanent --add-port=5904/tcp      # VNC display :4

# Client gets internet through the server: ens160 in the external zone (masquerade)
firewall-cmd --permanent --zone=external --change-interface=ens160
firewall-cmd --permanent --zone=public --add-masquerade
firewall-cmd --reload

# IP forwarding (net.ipv4.ip_forward=1 in /etc/sysctl.conf)
sysctl -p

# Checks
firewall-cmd --get-active-zones
firewall-cmd --list-all
firewall-cmd --query-masquerade
