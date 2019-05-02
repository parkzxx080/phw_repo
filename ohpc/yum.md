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
1-2. 테이블 만들기
---------------------
<pre>
   ex)
   |항목1|항목2|항목3|
   |:--:|:--:|:--:|
   |내용1|내용2|내용3|

    (1) |(파이프) : 칸을 나누어 줄때 사용
    (2) -(하이픈) : 행과 행을 나누어 줄때 사용
    (3) :(클론) : 정렬 기준 선택
    ex)
     |:--|  왼쪽정렬
     |--:|  오른쪽 정렬
     |:--:| 가운데 정렬
</pre>
|표1|표2|표3|
|:--|:--:|--:|
|해욱|해욱|해욱|

1-3. 인용문
-------------
    인용문 : 남의 말이나 글에서 직접또는 간접으로 따온 문장.
    (1) > 인용문
    (2) >> 중첩된 인용문
    (3) >>> 중첩에 중첩된 인용문
> 인용문 입니다.
>>중첩된 인용문 입니다
>>> 중첩에 중첩된 인용문 입니다.

1-4. 링크(Links)
------------------
    (1) [연결할 단어] (링크 주소)
    ex) 
    markdown : 검색엔진은 [구글](http://www.google.com "구글")을 사용합니다.

동작 : 검색엔진은 [구글](http://www.google.com "구글")을 사용합니다.

1-5. image 삽입
----------------
    (1) 기본 문법
    ![텍스트](그림경로)
    
        1)구글 이미지 가져오기
        ![구글](https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)

![구글](https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)


    (2) image 링크 걸기
        ex) 구글 아이콘을 클릭시 구글 사이트로 이동
        [![텍스트](그림경로)](링크주소)
        [![구글](https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)](http://www.google.com)

[![구글](https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)](http://www.google.com)

    (3) github으로 이미지 올리기

        1) img 디렉토리 생성
   ![md1](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/md1.png)

        2) 임의의 이미지를 생성 후 img 디렉토리에 저장
   ![md2](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/md2.png)

        3) github에 img를 올린다
   ![md3](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/md3.png)

        4) 자신이 올려놓은 이미지 주소로 들어가 이미지 위에 우측 마우스 클릭하여 이미지 주소 복사
   ![md4](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/md4.png)

        5) markdown 작성 후 github에 올린 후 정상동작 확인
   ![md5](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/md5.png)
   ![md6](https://raw.githubusercontent.com/parkzxx080/phw_repo/master/img/md6.png)
   