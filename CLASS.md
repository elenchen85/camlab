
## Capacity assumptions

| Students | Teams | Clusters | Concurrent deployments |
|----------|-------|----------|------------------------|
| 60       | 20    | 3        | 7                      |

 Currently built in SandBox1 Dark Blue Cluster but all other CAM clusters build in other Sandboxes

**_ Question: Do we need to scale up the BPD pod to provide the required capacity?
_**

## NFS

Sandbox | NFS Share
--------|----------------------------------------------------------------
SB1     | fsf-fra0201b-fz.service.softlayer.com:/IBM02SEV1455855_2/data01
SB2     | fsf-fra0201b-fz.service.softlayer.com:/IBM02SEV1484933_2/data01
SB3     | fsf-fra0201a-fz.service.softlayer.com:/IBM02SEV1484871_1/data01

these shares have the ISO directory from which you can build new VMs. Need to mount them onto the master machine then wget the image from its source.

## Lab Environment

Sandbox | URL                          | Application | Credentials
--------|------------------------------|-------------|--------------
1       | https://10.135.148.240:30000 | CAM         |
1       | https://10.135.148.240:8443  | ICP         |
|   |   |   |
2       | https://10.135.29.34:30000   | CAM         |
2       | https://10.135.29.34:8443    | ICP         |
2       | https://169.50.40.22:30000   | CAM          |   
2       | https://169.50.40.22:8443    | ICP         |
|   |   |   |
3       | https://:30000 | CAM         |
3       | https://:8443  | ICP         |

## Utility servers

Sandbox | Address        | Functions      | Notes
--------|----------------|----------------|-----------------------
1       | 10.135.148.210 | LDAP / OpenVPN | see /root/scripts/ldap
1       | 10.135.148.213 | NFS            | server:/data rw
2       | 10.135.29.28   | LDAP           | see /root/scripts/ldap
2       | 10.135.29.29   | NFS / OpenVPN  | server:/data rw
3       | 10.135.214.161 | LDAP           | see /root/scripts/ldap
3       | 10.135.214.138 | NFS / OpenVPN  | server:/data rw

## vSphere details


Sandbox | URL                                        | Credentials
--------|--------------------------------------------|---------------------------------------
SB1     | https://10.135.148.194/vsphere-client/?csp | Administrator@vsphere.local / q^3XoCk2
SB2     | https://10.135.29.2/vsphere-client/?csp    | Administrator@vsphere.local / f$h9YF^2
SB3     | https://10.134.214.130/vsphere-client/     | Administrator@vsphere.local / 4!0XkF!n


## Addresses for guest VMs

SB1 - `10.135.148.230 > 240 / 26`

## Sandboxes

## OS ISO files

See 10.135.148.213:/data and 10.135.148.213:/data/scripts for mount to SB1 VMware datastore

Now have Ubuntu 16 and 18 ISO images

## BluePrintDesigner

Sandbox | URL
--------|----------------------------------------
1       | https://10.135.148.205:30000/landscaper
2       | https://10.135.29.30:30000/landscaper
3       | https://10.135.214.156:30000/landscaper

![BluePrintDesigner Pattern](https://github.com/rhine59/camlab/blob/master/images/bpd_pattern.png)

## LDAP

See ./ldap directory

./go.sh will create and populate a containerised LDAP server which can be connected to ICP. 50 user accounts of the form userxx

In ICP LDAP configuration select `custom` LDAP server and then change user filter to `inetOrgPerson` from `ePerson`

## VMware template

Built minimal ubuntu template called `ubuntu1604` under `templates` folder

## Parameters for deployment of `SingleVirtualMachine` CAM template from SB1

Sandbox | Parameter                          | Value
--------|------------------------------------|------------------------------
SB1     | vSphere Cluster                    | cluster1
SB1     | vSphere Datacenter                 | datacenter1
SB1     | vSphere Folder Name                | camlab
SB1     | Hostname                           | <pick_your_own>
SB1     | DNS Servers                        | 8.8.8.8
SB1     | DNS Suffixes                       | coc.net
SB1     | Domain Name                        | coc.net
SB1     | Operating System ID / Template     | ubuntu1604
SB1     | Root Disk Size                     | 32
SB1     | Template Disk Controller           | scsi
SB1     | Template Disk Datastore            | EnduranceFRA01
SB1     | Template Disk Type                 | thin
SB1     | Virtual Machine Gateway Address    | 10.135.148.201
SB1     | Virtual Machine IP Address         | <range 10.135.148.230 -> 240>
SB1     | Virtual Machine Memory             | 2048
SB1     | Virtual Machine Netmask Prefix     | 26
SB1     | Virtual Machine vCPUs              | 1
SB1     | Virtual Machine vSphere Port Group | SDDC-DPG-Mgmt
SB1     | vSphere Network Adapter Type       | vmxnet3
SB1     | vSphere Resource Pool              | resourcepool1

![default template parms](https://github.com/rhine59/camlab/blob/master/images/template_parms.png)

## Notes

The deployment of a SingleVirtualMachine instance take about 6 minutes

## Introduction

In this lab we will be using CAM to perform the following activities

- (DONE) Use the embedded blueprint designer to start the creation of a CAM template
- (DONE) Setup an account in GitHub and connect with the ATOM Editor
- (DONE) Build / Modify a template to deploy a virtual machine
- (DONE) Push updates to GitHub
- Add parameters for 'small' 'medium' and 'large' deployments
- (DONE) Publish the template to the CAM catalog from GitHub Resource
- (DONE) Deploy templates
- (DONE) Setup Slack Application to accept POST requests
- (DONE) Build a service to include sending Slack notification
- Deploy and observe machine deployment and slack notification
- Aspirational:-
  - Update template to provision middleware from CAM ContentServer

## OpenVPN

See ./openvpn directory for client profiles to be used in https://tunnelblick.net for Mac clients - Windows TBD.

OpenVPN server installed on IBMCloud instance in SB1

Interface | Address           | Device
----------|-------------------|-------
Private   | 10.134.111.123/26 | eth0
Public    | 169.50.49.85/28   | eth1

Shamelessly copied from https://community.openvpn.net/openvpn/wiki/BridgingAndRouting

We are going to use IP routing for our VPN needs.

VPN clients will connect via the public interface on eth1, traffic will then be moved to the tun0 interface. The iptables and routing engine will pick up that traffic again, filter/masquerade it and send it further to eth0 or eth1, depending on the routing table

Enable IP forwarding

```
[root@host ~] # sysctl -w net.ipv4.ip_forward=1
    net.ipv4.ip_forward = 1
    [root@host ~] #
```
To make this change persistent you need to modify /etc/sysctl.conf. In this file you should have a line .......

```
net.ipv4.ip_forward = 1
```

iptables rules required for this to work.

Insert the following block into `/etc/ufw/before.rules`

```
# START OPENVPN RULES
# NAT table rules
*nat
:POSTROUTING ACCEPT [0:0]
# Allow traffic from OpenVPN client to wlp11s0 (change to the interface you discovered!)
-A POSTROUTING -s 10.8.0.0/8 -o eth1 -j MASQUERADE
COMMIT
# END OPENVPN RULES

```

Also edit `/etc/default/ufw` and the DEFAULT_FOREARD_POLICY to ACCEPT

```
# Set the default forward policy to ACCEPT, DROP or REJECT.  Please note that
# if you change this you will most likely want to adjust your rules
# DEFAULT_FORWARD_POLICY="DROP"
DEFAULT_FORWARD_POLICY="ACCEPT"

```
Again, we are going to use IP routing for our VPN needs.

These are our network interfaces

```
eth0: 10.134.111.123/26 brd 10.134.111.127
( network 10.134.111.64/26 - class A )

eth1: 169.50.49.85/28 brd 169.50.49.95

tun0: 10.8.0.1 peer 10.8.0.2/32
```
Here are the firewall rules we need for our routing to the private network of the OpenVPN server.

```
   #  Allow traffic initiated from VPN to access LAN
   iptables -I FORWARD -i tun0 -o eth0 \
        -s 10.8.0.0/24 -d 10.134.111.64/26 \
        -m conntrack --ctstate NEW -j ACCEPT

   # Allow traffic initiated from VPN to access the public www
   iptables -I FORWARD -i tun0 -o eth1 \
        -s 10.8.0.0/24 -m conntrack --ctstate NEW -j ACCEPT

   # Allow traffic initiated from LAN to access the public www
   iptables -I FORWARD -i eth0 -o eth1 \
        -s 10.134.111.64/26 -m conntrack --ctstate NEW -j ACCEPT

   # Allow established traffic to pass back and forth
   iptables -I FORWARD -m conntrack --ctstate RELATED,ESTABLISHED \
        -j ACCEPT

   # Masquerade traffic from VPN to the public www -- done in the nat table
   iptables -t nat -I POSTROUTING -o eth1 \
         -s 10.8.0.0/24 -j MASQUERADE

   # Masquerade traffic from LAN to the public www
   iptables -t nat -I POSTROUTING -o eth1 \
         -s 10.134.111.64/26 -j MASQUERADE

```
We also need to make some firewall changes to allow for our OpenVPN conversations. Lastly, we need to restart the firewall to pick up these changes.

```
ufw allow 1194/udp
ufw allow OpenSSH
ufw disable
ufw enable
```
### Windows VPN Client installation

After installing OpenVPN - see https://openvpn.net/community-downloads/ copy the .ovpn file to:

`C:\Program Files\OpenVPN\config`

### Mac VPN Client installation

After installing TunnelBlick - see https://tunnelblick.net drag the suppplied ovpn file onto the tunnelblick icon at the top of your screen and follow the prompts

![tunnelblick icon](https://github.com/rhine59/camlab/blob/master/images/tunnelblick.png)


## Sweepers

Need some sweepers for the lab for CAM, Git, editor, sysadmin skills so likely candidates right now are Steve Arnold and Angus Jamieson, but may recruit some more later.

## Cluster connection instructions

Connect to your cluster using instructions supplied - OpenVPN via tunnelblick or IBMCloud VPN from preregistration
