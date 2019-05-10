OpenHPC PXE BOOT warewulf + PBS 설정 
==================================
1. hosts file 설정

    echo server_ip host_name >> /etc/hosts

2. firewall service disabled

    systemctl disable firewalld
    
    systemctl stop firewalld



