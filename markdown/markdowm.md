# Markdown 사용법
## 1. 문법
### 1-1. 문서 제목 및 부제목
(1) # : 처음으로 사용되는 해더 부분 H1<br/>
(2) ## : H2<br/>
(3) ### : H3<br/>
(4) #### : H4<br/>
(5) ##### : H5<br/>
(6) ###### : H6<br/>
글머리는 1~6까지만 지원<br/>
###1-2. 테이블 만들기<br/>
|회사명|직급|이름|

|:---:|:---:|:---:|

|nexit|대리|박해욱|

|nexit|대리|장영준|

ex)<br/>
|항목1|항목2|항목3|<br/>
|:--:|:--:|:--:|<br/>
|내용1|내용2|내용3|<br/>

(1) |(파이프) : 칸을 나누어 줄때 사용<br/>
(2) -(하이픈) : 행과 행을 나누어 줄때 사용<br/>
(3) :(클론) : 정렬 기준 선택<br/>
	ex)<br/>
    |:--|  왼쪽정렬<br/>
    |--:|  오른쪽 정렬<br/>
    |:--:| 가운데 정렬<br/>

###1-3. 인용문
인용문 : 남의 말이나 글에서 직접또는 간접으로 따온 문장.
(1) > 인용문<br/>
ex)
> 인용문 입니다.<br/>
(2) >> 중첩된 인용문<br/>
ex)<br/>
>>중첩된 인용문 입니다<br/>
(3) >>> 중첩에 중첩된 인용문<br/>
ex)
>>> 중첩에 중첩된 인용문 입니다.

###1-4. 링크(Links)
(1) [연결할 단어] (링크 주소)<br/>
ex) <br/>
markdown : 검색엔진은 [구글] (http://www.google.com "구글")을 사용합니다.<br/>

동작 : 검색엔진은 [구글](http://www.google.com "구글")을 사용합니다.

###1-5. image 삽입
(1) 기본 문법<br/>
![텍스트] (그림경로)
ex)<br/>
1)구글 이미지 가져오기<br/>
문법 :<br/>
![구글] (https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)

실제 동작 :<br/>
![구글](https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)


(2) image 링크 걸기<br/>
ex) 구글 아이콘을 클릭시 구글 사이트로 이동<br/>
[![텍스트] (그림경로)] (링크주소)

문법 :
[![구글] (https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)] (http://www.google.com)

실제 동작 :

[![구글](https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png)](http://www.google.com)

