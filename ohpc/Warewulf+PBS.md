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

* PXE booting시 tftp를 사용, tftp 활성화

    <code>perl -pi -e "s/^\s+disable\s+= yes/ disable = no/" /etc/xinetd.d/tftp</code>

* Restart/enable service

        systemctl restart xinetd
        systemctl enable mariadb.service
        systemctl restart mariadb
        systemctl enable httpd.service
        systemctl restart httpd
        systemctl enable dhcpd.service

8. 초기 boot OS image 작성

* chroot 위치 정의

    <code>export CHROOT=/opt/ohpc/admin/images/centos7.6</code>

* chroot 이미지 만들기

    <code>wwmkchroot centos-7 $CHROOT</code>

9. chroot(compute node) 이미지 안에 기본 openHPC base 설치

     yum -y --installroot=$CHROOT install ohpc-base-compute
     cp -p /etc/resolv.conf $CHROOT/etc/resolv.conf

10.PBSpro client 설치 및 기본 setting

    yum -y --installroot=$CHROOT install pbspro-execution-ohpc
    perl -pi -e "s/PBS_SERVER=\S+/PBS_SERVER={pbs master server name}/" $CHROOT/etc/pbs.conf
    echo "PBS_LEAF_NAME={pbs master server name}" >> /etc/pbs.conf
    chroot $CHROOT opt/pbs/libexec/pbs_habitat
    perl -pi -e "s/\$clienthost \S+/\$clienthost {pbs master server name}/" $CHROOT/var/spool/pbs/mom_priv/config
    echo "\$usecp *:/home /home" >> $CHROOT/var/spool/pbs/mom_priv/config
    chroot $CHROOT systemctl enable pbs
    yum -y --installroot=$CHROOT install ntp
    yum -y --installroot=$CHROOT install kernel
    yum -y --installroot=$CHROOT install lmod-ohpc

11.Customize system configuration

* warewulf database 및 ssh_keys 초기화

        wwinit database
        wwinit ssh_keys

* client에 home 및 base img Nfs mount 적용

        echo "/home *(rw,no_subtree_check,fsid=10,no_root_squash)" >> /etc/exports
        echo "/opt/ohpc/pub *(ro,no_subtree_check,fsid=11)" >> /etc/exports
        exportfs -a
        systemctl restart nfs-server
        systemctl enable nfs-server

* client NTP time service on 및 ntp server 동기화

        chroot $CHROOT systemctl enable ntpd
        echo "server {ntp server ip}" >> $CHROOT/etc/ntp.conf

12.Memlock Setting

* master

        perl -pi -e 's/# End of file/\* soft memlock unlimited\n$&/s' /etc/security/limits.conf
        perl -pi -e 's/# End of file/\* hard memlock unlimited\n$&/s' /etc/security/limits.conf

* client

        perl -pi -e 's/# End of file/\* soft memlock unlimited\n$&/s' $CHROOT/etc/security/limits.conf
        perl -pi -e 's/# End of file/\* hard memlock unlimited\n$&/s' $CHROOT/etc/security/limits.conf

13.Warewulf database file import

    wwsh file import /etc/passwd
    wwsh file import /etc/group
    wwsh file import /etc/shadow
    wwsh file list

14.bootstrap image 만들기

* kernel updates drivers 추가

        export WW_CONF=/etc/warewulf/bootstrap.conf
        echo "drivers += updates/kernel/" >> $WW_CONF

* overlayfs drivers 추가

        <code>echo "drivers += overlay" >> $WW_CONF</code>

* bootstrap image 작성

    <code>wwbootstrap `uname -r`</code>

15.Virtual Node File System(VNFS) image 생성

    wwvnfs --chroot $CHOORT

16.Provisioning을 위한 node 등록

* provisioning interface를 기본 network device로 설정

        echo "GATEWAYDEV={masternode provision device name}" > /tmp/network.$$
        wwsh -y file import /tmp/network.$$ --name network
        wwsh -y file set network --path /etc/sysconfig/network --mode=0644 --uid=0

* Warewulf data store에 node 등록

        wwsh -y node new {client host name} --ipaddr={client ipaddr} --hwaddr={client mac addr} -D {provision device name}
        wwsh node list
        wwsh -y provi
        sion set "{client host name}" --vnfs=centos7.6 --bootstrap=`uname -r` --files=dynamic_hosts,passwd,group,shadow,network
        wwsh provision list
        systemctl restart dhcpd
        wwsh pxe update

17.PBSpro server setting

    systemctl enable pbs
    systemctl start pbs
    . /etc/profile.d/pbs.sh
    qmgr -c "set server default_qsub_arguments= -V"
    qmgr -c "set server resources_default.place=scatter"
    qmgr -c "set server job_history_enable=True"
    qmgr -c "create node {client hostname}"
    pbsnodes -a

18. 계정생성 및 Warewulf file resync

    useradd -m test
    passwd test
    wwsh file resync

19 mpi 설치 및 test

    yum -y install openmpi3-gnu7-ohpc mpich-gnu7-ohpc lmod-defaults-gnu7-openmpi3-ohpc
    su - test
    mpicc -O3 /opt/ohpc/pub/examples/mpi/hello.c
    qsub -I -l select={node 수}:mpiprocs={cpu 수}
    prun ./a.out