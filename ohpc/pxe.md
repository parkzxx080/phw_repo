OpenHPC PXE BOOT warewulf + PBS 설정 
==================================
1. hosts file 설정
-----------------------
<code>
    echo server_ip host_name >> /etc/hosts
</code>

2. firewall service disabled
------------------------------------
<code>
    systemctl disable firewalld
    systemctl stop firewalld
</code>


