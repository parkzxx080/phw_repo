
1. 작업 전 기본 사항 
(1) 서버와 클라이언트가 서로 공유 된 디렉토리에서 작업을 해야한다.
(2) git 및 ansible이 설치 되어 있어야 한다.

2. 스크립트 및 playbook 수정 해야될 부분
(1) torque_6.0.1_centos7_install.sh 의 JOB_HOME = [ 공유 디렉토리 경로 ] 로 바꿔 줄것
(2) yum.yaml 의 hosts = [ torque 서버 HOST ] 로 바꿔 줄것
(3) client_install.yaml hosts = [torque 클라이언트 HOST]로 바꿔 줄것

3. 상기 부분이 모두 수정되었다면 torque_6.0.1_centos7_install.sh 스크립트 실행

4. 설치가 모두 완료 되었다면 /var/spool/torque/server_priv/nodes에

클라이언트호스트명 np=[cpu갯수] 값을 추가

ex)

phw2 np=1 
