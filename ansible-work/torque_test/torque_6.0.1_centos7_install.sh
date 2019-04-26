#/bin/sh
SH_HOME=`pwd` # 스크립트 및 ansible playbook 파일 경로
ansible-playbook yum.yaml # 컴파일러 및 각종 필요한 tool 설치
JOB_HOME=/data  # 공유 디렉토리
cd $JOB_HOME    # 공유 디렉토리 이동
git clone https://github.com/adaptivecomputing/torque.git -b 6.0.1 6.0.1 #git으로 torque 6.0.1 Version 받기
cd /$JOB_HOME/6.0.1  # 다운받은 디렉토리 이동
./autogen.sh #autogen 스크립트 실행
./configure  # 소스파일에 대한 환경설정을 해주는 명령, 서버환경에 맞추어 makefile을 생성
make #소스를 컴파일 한다. make에게 어떤 프로그램을 컴파일하고 링크해야 하는지 그 방법을 명시된 곳이 mkaefile
make install #make를 통해 만들어진 설치파일(setup)을 설치를 하는 과정
echo "/usr/local/lib"> /etc/ld.so.conf.d/torque.conf 
# 동적 라이브러리 PATH 지정, 해당 방법 말고 LD_LIBRARY_PATH에 추가 해줘도 된다

ldconfig # 새로운 라이브러리를 설치한 후 머신이 인식하기 위한 dynamic linking table을 업데이트


make package #계산 노드 및 로그인 노드에 편리한 설치를 위한 패키지가 들어 있다 /6.0.1/INSTALL 내용 확인

scp /$JOB_HOME/6.0.1/contrib/systemd/pbs_mom.service phw2:/usr/lib/systemd/system/ 
# 클라이언트 서버에 service 가능하도록 copy 
# pbs_mom : 서버가 지시한대로 작업을 실행에 배치하고 작업 사용을 모니터링하고 완료시 서버에 알리는 데몬

cp /$JOB_HOME/6.0.1/contrib/systemd/trqauthd.service /usr/lib/systemd/system/ 
# torque 서버에 service 가능하도록 copy
# trqauthd : 토큐 클라이언트 유틸리티가 pbs_server에 대한 사용자 연결을 인증하는 데 사용하는 데몬
systemctl enable trqauthd.service #trqauthd 데몬이 서버 재부팅시 자동으로 start 되게 활성화
systemctl start trqauthd.service  #trqauthd 데몬 실행
./torque.setup root # torque server 기본 db 구성 ./torque.setup 파일 참조
qterm #처리 종료

cp /$JOB_HOME/6.0.1/contrib/systemd/pbs_server.service /usr/lib/systemd/system/
# torque 서버에 service 가능하도록 copy
# pbs_server : torque Server 데몬, 일괄 시스템 관리자
systemctl enable pbs_server.service # pbs_server 데몬이 서버 재부팅시 자동으로 start 되게 활성화
systemctl start pbs_server.service  # pbs_server 데몬 실행

cp /$JOB_HOME/6.0.1/contrib/systemd/pbs_sched.service /usr/lib/systemd/system/
# torque 서버에 service 가능하도록 copy
# pbs_sched : 사용 가능한 메모리 등의 상태에 대한 정보를 얻은 다음 실행될 작업을 결정합니다.
systemctl enable pbs_sched.service # pbs_sched 데몬이 서버 재부팅시 자동으로 start 되게 활성화
systemctl start pbs_sched.service # pbs_sched 데몬실행

cd $SH_HOME #ansible playbook 위치로 이동

ansible-playbook client_install.yaml -e "data_path=$JOB_HOME/6.0.1" #client setup
