OpenHPC yum 사용법 및 등록 방법
===============================
1. server yum repo 생성
-----------------------
1-1. openhpc repo down 및 http 연동
------------------------------------
    (1) openhpc 접속 후 DOWNLOADS 클릭
[openhpc](https://openhpc.community/ "openhpc")

![yum1](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum1.png)

    (2) http://build.openhpc.community/OpenHPC:/1.3. 클릭
![yum2](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum2.png)

    (3) 해당 OS 선택 (test 환경 CentOS7.6)
![yum3](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum3.png)

    (4) OpenHPC 1.3 repo down
![yum4](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum4.png)

    (5) download 한 repo를 /etc/yum.repos.d에 저장
![yum5](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum5.png)인

    (6) yum repolist 명령어로 repo 확인
![yum6](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum6.png)

    (7) createrepo, yum-utils download
        createrepo : repo 생성
        yum-utils : download util 제공
![yum7](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum7.png)

    (8) /var/www/html/ohpc 디렉토리 생성
![yum8](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum8.png)

    (9) OpenHPC 저장소를 local에 download
        1) yum repolist 명령어로 repo id 확인
        2) reposync : 저장소를 로컬 디렉토리에 다운로드
            --repoid=저장소명
            --download_path=/다운로드경로
![yum9](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum9.png)

    (10) OpenHPC down load 확인
![yum10](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum10.png)

    (11) /var/www/html/ohpc/ 경로로 이동 후 createrepo 명령입력
![yum11](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum11.png)

    (12) http 주소로 접근 가능 확인
![yum12](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum12.png)

2. client 연동
---------------------
2-1. phw2 server의 repo를 가져와 yum openhpc yum 사용 가능하도록 하기
----------------------------------------------------------
    (1) 외부네트워크 미동작 확인
![yum13](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum13.png)

    (2) server Repository를 client에 등록
        1) /etc/yum.repos.d 이동
        2) *.repo 생성
        3) repo 작성
            [저장소 이름]
            name=저장소 표시이름부
            baseurl=저장소 주소
            enabled=활성화 여부
![yum14](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum14.png)

    (3) repolist 확인
![yum15](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum15.png)

    (4) yum install test
        1) ohpc 패키지 install
![yum16](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum16.png)
![yum17](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/ohpc/yum17.png)

