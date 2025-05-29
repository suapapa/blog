---
title: 'CoffeeTime : 열심히 일하는 것 처럼 보여주는 유틸리티'
author: suapapa
type: post
date: 2008-08-14T07:38:57+00:00
url: /p=92
dsq_thread_id:
  - 722490136
categories:
  - Life
  - MyProject
  - Programming
tags:
  - 파이썬

---
CoffeeTime은 cappuccino의 커맨드 라인 버젼 입니다. 뭐하는 녀석인지 설명하기 위해 [cappucino 데비안 패키지](http://packages.debian.org/ko/sid/cappuccino)의 설명을 첨부합니다.

> 일하고 싶은 의욕이 없을때 이 소프트웨어를 컴퓨터에서 실행하십시오. 그리고 일이외 다른것을 즐기십시오. 상사가 당신의 자리에 온다면 당신의 컴퓨터를 보고 이렇게 생각할 것입니다. "음, 그의 컴퓨터가 바쁘게 돌아가는걸로 봐서 특별한 무엇인가를 하고 있는 모양이군 - 그는 정말 중요한 무엇인가를 하고 있어"

이런 필수 유틸이 있나!!



[우부투에서 실행](http://doc.ubuntu-fr.org/_media/cappuccino2.png?cache=cache) 해 보니, 엉터리 컴파일 명령어들을 줄 줄 토해내는 이 사랑스런 프로그램에 아쉬운 점이 몇 가지 있었습니다:

  * 리눅스 전용
  * 전체 화면
  * 일하는 것 같지 않은, 생소한, GUI(Gtk)

그래서, <strike>거품</strike> GUI를 뺀 버젼으로 만들었습니다. ㅎㅎ

> 파이썬 스크립트로 외부 프로그램 polygen이 필요합니다. 설치방법을 보세요.

**설치방법:**  
[CoffeeTime SVN 저장소][1]를 체크아웃 받으시거나, 그냥 각각 클릭하셔서 한 폴더에 다운로드 합니다.

파일 수는 윈도용 polygen을 포함해 세개 입니다.

> 저장소 안의 윈도용 polygen은 [이곳](http://www.polygen.org/gs/dist/)에서 가져왔습니다. 우분투/데비안 사용자는 따로 받으실 필요 없이 apt-get install polygen으로 간단히 설치하시면 됩니다.

**실행화면:**  
![](https://asset.homin.dev/blog/2008/08/coffeetime_in_windows.jpg)

**자! 이제 커피 타임~** 😀

 [1]: https://homin.dev/svn/OneFiler/CoffeeTime