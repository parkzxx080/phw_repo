OpenHPC PXE BOOT warewulf + PBS 설정 (KVM test 용)
==================================
1.hosts file 설정

    echo "{server_ip} {host_name}" >> /etc/hosts

2.firewall service disabled

    systemctl disable firewalld
    systemctl stop firewalld

3.Enable OpenHPC repository for local use

    yum install http://build.openhpc.community/OpenHPC:/1.3/CentOS_7/x86_64/ohpc-release-1.3-1.el7.x86_64.rpm

4.Install base meta-packages

    yum -y install ohpc-base
    yum -y install ohpc-warewulf

5.NTP service Enalbe

    systemctl enable ntpd.service
    echo "server {ntp-servername}" >> /etc/ntp.conf
    systemctl restart ntpd

6.PBSpro Server install

    yum -y install pbspro-server-ohpc

7.basic Warewulf setup for master node

* Warewulf provisioning config file 수정

    <code>perl -pi -e "s/device = eth1/device = ${master node device name}/" /etc/warewulf/provision.conf</code>

* PXE booting시 tftp를 사용해 배포 함으로 tftp 활성화

    <code>perl -pi -e "s/^\s+disable\s+= yes/ disable = no/" /etc/xinetd.d/tftp</code>

* Restart/enable service

    <code>systemctl restart xinetd
    
    systemctl enable mariadb.service

    systemctl restart mariadb

    systemctl enable httpd.service

    systemctl restart httpd

    systemctl enable dhcpd.service

