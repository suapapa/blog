---
title: Real HDR for free!!
author: suapapa
type: post
date: 2008-04-17T06:07:21+00:00
url: /p=52
aktt_notify_twitter:
  - no
dsq_thread_id:
  - 722489834
categories:
  - Camera
  - Programming
tags:
  - HDR
  - UFRaw
  - 파이썬

---
광고에 치어 살다보니 -영어로 써도- 어투가 홈쇼핑 같아지네요 -_-;

각설하고, **enfuse**와 **UFRaw**를 사용해 한장의 raw이미지 파일로 부터 HDR(High Dynamic Range)이미지를 만드는 방법을 소개합니다.

다음과 같이 한 줄의 명령어로 만들 수 있습니다. 게다가 공짜!

> $ **raw2hdr.py -o HDR.jpg IMGP0042.ufraw**

윈도XP와 우분투 7.10에서 테스트 해 봤습니다.



### 0. HDR 소개

HDR이 무엇인지 궁금하신 분은 우선 [Trey Ratcliff의 HDR Tutorial](http://stuckincustoms.com/2006/06/06/548/)의 사진들을 살펴 보세요. 일반적인 사진의 계조를 뛰어넘는 사진들을 보실 수 있습니다.

어떻게 HDR이미지가 만들어 보는지 간단히 설명하면, (관심없으신 분은 **1. raw2hdr 설치하기**로 점프) 같은 장면에서 노출을 달리한 여러장의 사진을 찍어 &#8216;적당히&#8217; 합쳐서 만듭니다.

> **이제 여러번 사진을 찍을 필요가 없습니다!** raw이미지는 +-3스톱만큼의 관용도를 가지고 있기 때문에 UFRaw를 사용해 하나의 raw 이미지로 부터 다중 노출한 소스들을 뽑아내면 됩니다.

삼포의 [신대우님의 포토샵 레이어 블랜등을 사용한 HDR 강좌](http://www.ssdslr.com/bbs/zboard.php?id=blecture&#038;page=1&#038;sn1=&#038;divpage=1&#038;sn=off&#038;ss=on&#038;sc=on&#038;keyword=HDR&#038;select_arrange=headnum&#038;desc=asc&#038;no=431)에서 적당히 합치는 과정을 소개하고 있습니다. 네.. 항상 &#8216;적당히&#8217;라는게 어려운 부분이죠. 전 이 글을 보고 잠시 HDR의 꿈을 접었었습니다. -_-;

> **이제 수작업으로 합칠 필요가 없습니다!** enfuse가 알아서 &#8216;적당히&#8217; 합쳐 줍니다. enfuse에 대해 더 알고 싶으신 분은 [이 링크](http://wiki.panotools.org/Enfuse)를 찾아가 보세요.

즉! UFRaw와 enfuse를 사용해 HDR이미지를 만들 수 있는데, 저는 이 작업을 더 간단히 하기 위한 스트립트(**raw2hdr.py**)를 작성했습니다.

![](https://asset.homin.dev/blog/2008/04/imgp9117_enfuse.webp)

**raw2hdr.py**를 ****이용해 하나의 raw이미지로 부터 뽑아낸 아래의 (-3, -2, -1, 0, 1, 2, 3)EV의 7장의 이미지로 부터 만들어낸 사진입니다.

{wp-gallery-remote: gallery=0; rootalbum=18942; showalbumtitle=true; showsubalbums=true; showimagesheader=false; imagefilter=include:18978,18975,18972,18965,18981,18984,18987;}

> 창 밖의 풍경에 노출을 맞출 경우 버스 안이 노출부족으로 뭍혀 버리고, 버스 안에 노출을 맞출 경우 창 밖의 풍경이 노출과다로 날아가 버리게 됩니다. HDR이미지에서는 창 밖의 풍경과 버스안의 디테일이 모두 살아 있습니다.

### 1. raw2hdr.py 설치하기

아래의 파이썬 스크립트 링크를 다운로드 하세요.

  * **다운로드 :** **[raw2hdr.py][1]**

<p align="left">
  raw2hdr.py는 외부 프로그램 ufraw-batch, enfuse, exiftool을 사용합니다. 각각 아래의 방법들로 설치할 수 있씁니다.
</p>

  * **ufraw-batch**는 UFRaw와 함께 설치됩니다. 
      * 윈도 : [윈도에서 UFRaw 설치하기][2]
      * 우분투: [UFRaw 컴파일로 최적화 하여 설치하기](https://homin.dev/blog/p=174)
  * **enfuse**는 enblend 3.1에 포함되어 있습니다. 
      * 윈도: [이걸](http://hugin.panotools.org/testing/enblend/enblend-3.1_win32_pre1.zip) 다운받아서 적당한 위치에 압축 풀면 됩니다.
      * 우분투: [여길](http://wiki.panotools.org/Hugin_Compiling_Ubuntu#Building_Enblend) 참조해서 소스로 부터 컴파일 하셔야 합니다.
  * **exiftool**을 사용해 결과물로 Exif를 옮깁니다. 
      * 윈도: [이걸](http://www.sno.phy.queensu.ca/~phil/exiftool/exiftool-7.24.zip) 다운받아 적당한 위치에 압축 풉니다.
      * 우분투: 소스리스트로 부터 libimage-exiftool-perl 패키지를 설치합니다.

<p align="left">
  raw2hdr.py는 [이 게시물](http://ubuntuforums.org/showthread.php?t=741161)의 쉘 스크립틀 참조해 만들어 졌고. 원래의 쉘 스크립트에 비해 아래의 기능들이 추가되었습니다.
</p>

  * UFRaw ID파일을 입력으로 사용할 수 있습니다.
  * 노출 스탭을 설정할 수 있습니다.
  * 최종 이미지에 원본의 Exif가 남습니다.
  * ufraw-batch, enfuse, exiftool의 경로를 지정할 수 있습니다.

HDR 사진들을 더 보고 넘어가겠습니다. 작은 이미지를 클릭하면 크게 보입니다.

{wp-gallery-remote: gallery=0; rootalbum=18942; showalbumtitle=true; showsubalbums=true; showimagesheader=false; imagefilter=include:18990,18993,19004,19007,19010,19013;}

> <p align="left">
>   HDR이미지(왼쪽)와 적정 노출의 이미지(오른쪽) 입니다. HDR이미지는 항상 인위적인 느낌을 내는 것이 아니라, 잘 사용하면 자연스러운 범위에서 사진의 계조와 디테일을 향상 시킬 수 있습니다.
> </p>

<h3 align="left">
  2. raw2hdr.py 사용하기
</h3>

<p align="left">
  몇가지 사용 예제를 보여드리겠습니다. 커맨드 창을 열고 실행해 보세요.
</p>

  * -help 옵션으로 도움말을 확인할 수 있습니다.

```bash
raw2hdr.py --help
```

  * 옵션없이 사용하면 -3,-2,-1,0,+1,+2,+3EV의 7장의 이미지로 부터 합친 HDR이미지를 IMGP9117_enfuse.tiff로 저장합니다.

```bash
raw2hdr.py IMGP9117.PEF
```

  * UFRaw ID파일, IMGP9210.ufraw로 부터 추출한 +2, +2.5 +3EV의 3장의 이미지로 부터 HDR이미지 IMFP9210_enfuse.jpg를 만듭니다. 이 경우 UFRaw를 사용해 설정한 화이트벨런스와 크롭등을 적용해 HDR이미지를 만들 수 있습니다.

```bash
raw2hdr.py -oIMFP9210_enfuse.jpg -m2 -M3 -s0.5 IMGP9210.ufraw
```

  * 환경변수 PATH에 설정되지 않은 외부 프로그램의 경로를 아래와 같이 직접 지정하여 실행할 수 있습니다.

```bash
raw2hdr.py --enfuse="c:appsenblend-3.1enfuse.exe" -m2 -M3 -s0.5 IMGP9210.PEF
```

### 3. 문제 해결

[펜클의 올린 게시물](http://www.pentaxclub.co.kr/bbs/zboard.php?id=Used&#038;page=1&#038;sn1=&#038;divpage=1&#038;sn=off&#038;ss=on&#038;sc=on&#038;select_arrange=headnum&#038;desc=asc&#038;no=2920)에서 같은 문제가 있는지 살펴보세요.

 [1]: https://homin.dev/svn/OneFiler/raw2hdr.py
 [2]: https://homin.dev/blog/p=164