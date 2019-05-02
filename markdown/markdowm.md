Markdown 사용법
===============
#1. 문법

1-1. 문서 제목 및 부제목
-----------------------
<pre>
(1) # : 처음으로 사용되는 해더 부분 H1
(2) ## : H2
(3) ### : H3
(4) #### : H4
(5) ##### : H5
(6) ###### : H6
글머리는 1~6까지만 지원
</pre>

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
[md1](./img/md1.png)
