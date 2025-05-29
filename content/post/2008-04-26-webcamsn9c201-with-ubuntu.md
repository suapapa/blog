---
title: WebCam(SN9C201) with Ubuntu
author: suapapa
type: post
date: 2008-04-25T16:33:41+00:00
url: /p=58
dsq_thread_id:
  - 741440060
categories:
  - Linux
tags:
  - 우분투

---
우리나라에서 리눅스에서 잘 돌아가는 WebCam(화상캠)을 구입하는 것은 쉬운 일이 아닙니다.

검색해 보면 리눅스에서 잘 동작하는 캠의 Chipset 리스트를 구할 수 있지만, 국내에선 캠에 사용된 Chipset을 표기하지 않는 것은 당연하고, 모델명 또한 달라서 미리 검색해도 확인할 수가 없죠.

> 즉! 뽑기!!

네&#8230; 뽑기에 소질이없어서&#8230; 또 꽝 뽑아습니다. -_-;;  
![](https://asset.homin.dev/blog/2008/04/sn9c201onubuntu.jpg" hspace="5)



저 멋지구리한 브라켓과 카본 무늬 그리고 -사진엔 빠진- 망원 렌즈 포함!!의 화려한 구성에 가격도 저렴해 구입하게 된 이 녀석은 **Microdia SN9C201**칩셋을 사용한 중국산 웹캠입니다.

칩셋명은 동봉되어 온 윈도 드라이버의 이름을 보고 알았고, 구입 당시 검색해 보니, 리눅스 드라이버가 없더군요.

1년 쯤 방치하다가, 우분투 포럼에서 [isurit님의 캠 카메라 설치기][1]를 보고 자극받아 다시 설치를 시도해 봤습니다.

> 결론 부터 말씀드리면.. 설치 성공! 잘 동작합니다.

1년이면 우분투 LTS도 변한다고, 다시 검색한 결과&#8230;

<strike>[이 링크](http://www.linux-projects.org/modules/mydownloads/viewcat.php?cid=7)에서 우분투용 드라이버를 패키지로 제공하는 것을 발견했습니다.</strike>

<strike>다만 7.04용 드라이버는 공짜, 7.10 드라이버는 $7를 내야 무제한으로 사용 가능. 소스는 제공하지 않는다고 하네요. 이런.. 꼬롬한 쉐끼. 캠을 새로 사도 $7 면 되겠다!!</strike>

같은 문제를 해결하기 위해 모인 [구글 그룹 Microdia](https://groups.google.com/group/microdia) 을 찾았습니다. 그곳의 소개글 중 일부를 떼 왔습니다.

> _**&#8230;you can keep waiting, hoping, praying by your bedside that someone will add support for your webcam,**_
> 
> _**we simply offer you the choice of the "RED PILL"**_

네 이곳에선 <strike>메트릭스를 벗어나는 방법</strike> SN9C201을 위한 -작업중인- 드라이버를 제공하고 있습니다. 이 드라이버의 설치 방법은 제 위키에도 다시 정리해 두었습니다. [여기](https://homin.dev/wiki/WebCam)

camorama 를 설치하고 실행 해 봅니다. 짜잔~!!

![](https://asset.homin.dev/blog/2008/04/sn9c201_in_action.jpg)

 [1]: http://www.ubuntu.or.kr/viewtopic.php?f=9&t=118