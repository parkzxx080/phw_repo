ansible
===============
1. 4월 3주차
------------
1-1. server -> client로 파일 복사하기 (예: index.html을 /var/www/html에 넣어보기)
-----------------------
    server : phw1
    client : phw2
    (1) index.html server에 생성 
![cp1](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/cp1.png)

    (2) ansible-playbook copy 모듈 추가
![cp2](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/cp2.png)

        - copy 모듈
        src : copy 할 대상을 지정
        dest : copy 위치 지정

    (3) 전체 playbook
![cp3](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/cp3.png)

        1) 대상 호스트 : phw2
        2) httpd install 실행
        3) Port 8080 변경
        4) index.html copy
        5) httpd Service 실행
        
    (4) 실행결과 확인
![cp4](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/cp4.png)
![cp5](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/cp5.png)


1-2. hello wolrld 를 출력하는 index.html 복사할 때 호스트네임을 변수화하여 index.html 에 넣도록 작성해볼 것
----------------------------------------------------------
    (1) hosts를 변수화
        1) 기존
         hosts : phw2
        2) 변경
         hosts : "{{ hostname }}"
![host1](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/host1.png)

    (2) lineinfile 모듈로 hostname 변수 값 가져오기
        1) lineinfile 모듈 사용
        2) 파라미터
           dest : 수정 할 파일 경로
           regexp : 해당 문자열 찾기
           line : 위에서 찾은 문자열기준 바꿀 내용 작성
![host2](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/host2.png)

    (3) play-book 전체 내용
![host3](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/host3.png)

        1) 대상 호스트 : 변수로 받아온다
        2) 아파치 install
        3) Port 8080 변경
        4) httpd service 시작
        5) index.html copy
        6) index.html에 변수로 받아오는 hostname 추가

    (4) play-book 실행 시 변수 값 지정
        ex) 대상 호스트를 phw2로 지정
![host4](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/host4.png)

    (5) play-book 실행 및 확인
![host5](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/host5.png)
![host6](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/apache/host6.png)

1-3. 인용문
-------------
    
