---
title: 'DIY-헤드폰 앰프: 에칭으로 만든 Szekeres Amp. 1/2'
author: suapapa
type: post
date: 2008-10-29T11:58:34+00:00
url: /p=107
dsq_thread_id:
  - 722490128
categories:
  - DIY
  - Music
  - MyProject
tags:
  - EagleCad
  - 헤드폰앰프

---
![](https://asset.homin.dev/blog/2008/10/szekeresamp.jpg)

에칭에 대한 정보를 찾다가 [HAS : 헤드폰 앰프 스테이션](http://www.headphoneamp.co.kr/)(이하 하스)라는 헤드폰 앰프 사이트를 알게 되었습니다.

> **헤드폰 앰프?**
> 
> 포터블 음향기(mp3, cdp, etc&#8230;)에 내장된 헤드폰 앰프는 소형화가 필수 조건 이므로 상대적으로 성능(소리)은 개허접 하다고 합니다. 그래서, 대신 좋은 외장 헤드폰 앰프를 사용해 듣자는 것!!

 생각해 보면 -외장 앰프는 휴대성은 떨어지니까- 집에서 인터넷 쓰겠다고 T-Login 모뎀을 사는 것 같은 멍청한 짓 입니다만&#8230;

천상의 소리가 들린다기에, 싸고(만원 미만)!!, 또 -아두이노 한다고- 이미 사 둔 부품들도 있고 해서 만들어 보았습니다.

> **Szekeres 앰프?**
> 
> 처음 MOSFET을 사용한 앰프에 대해 정리한 Greg J. Szekeres 씨의 이름을 따 붙여진 별명입니다.
> 
> [A Class A MOSFET Headphone Driver; HeadWise (영문)](http://headwize.com/projects/szeke1_prj.htm)
> 
> 하스를 돌아다니다 보면 CMOY 앰프, TOMO 앰프 등의 이름들을 볼 수 있는데 각각 그 회로도에 적절한 저항값등을 정리한 사람의 이름을 딴 것들 입니다.

Szekeres 앰프를 선택한 이유는 다음 게시물에서의 극찬과 적절한 뽀대, 적절한 난이도 때문이었습니다.

  * [Szekeres Amp 제작법 - 신정섭 님](http://www.headphoneamp.co.kr/bbs/zboard.php?id=diy_sijosae&page=1&sn1=&divpage=1&sn=off&ss=on&sc=on&keyword=Szekeres%20Amp&select_arrange=headnum&desc=asc&no=107)

위 게시물에서 회로도가 반쪽 뿐이고, 만능기판에 만들어 졌던 것을, Eagle CAD를 사용해 두 채널 모두의 회로도를 그리고 에칭 떠서 프로토 타입을 만들어 보았습니다.

최 상단의 사진이 완성품 입니다.

담배각 보다 약간 큰 크기로, 9V 전압에 맞게 만들었고, Line In 단자를 뒤쪽에 배치하였습니다.

![](https://asset.homin.dev/blog/2008/10/szekeresamp_pcb.jpg)

여기까지 만들어 놓고 나니 뿌듯하긴 한데, 부웅~ 하는 잡음이 들리네요.

**악! 잡음!!!** 다행이 하스의 QNA에 같은 문제가 여러 차례 올라와 있었습니다.

![](https://asset.homin.dev/blog/2008/10/szekeres_7809.jpg)

원인은 9V 아답터가 정전압이 아니기 때문이며, 7809 IC로 정전압 회로를 만들어 추가하고 12V 아답터를 사용해 깨끗하게 맑게 자신있게 수정되었습니다.

그밖에도 아쉬운 점들이 보이네요;

  * 꽤 뜨겁다. 방열판이 좀 더 커야겠다.
  * 스위치가 있으면 좋겠다.
  * 주인공인 MOSFET들이 잘 안 보인다.
  * 세라믹 콘덴서들은 좀 안 보였으면 좋겠다.

[![](https://asset.homin.dev/blog/2008/10/skekeresamp_all.jpg)](https://homin.dev/svn/HW/SzekeresAmp/SkekeresAmp_ALL.png)  
아쉬운 부분들을 수정 해 봤습니다. 회로도와 PCB 파일이 필요하신 분은 아래의 링크에서 받아가세요.

  * [회로도, 아트웍 다운로드(Svn Repo) ](https://homin.dev/svn/HW/SzekeresAmp)-EagleCad 파일
  * [토너전사용 PCB 이미지](https://homin.dev/svn/HW/SzekeresAmp/SkekeresAmp_PCB.png) (300dpi)
  * [토너전사용 부품면 이미지](https://homin.dev/svn/HW/SzekeresAmp/SkekeresAmp_TOP.png) (300dpi)

명성 답게(+기분 상) 따뜻하고 깔끔한 소리가 들리네요.

> 이걸로 [빠삐놈](http://gall.dcinside.com/list.php?id=hit&no=6417&page=8)을 들으면 엄기뉴, 전스틴, 디제이쿠, 이효리가 귓가에서 손에 손을 잡고 합창을 하는 듯 하며 눈을 감으면 좋은놈, 나쁜놈, 이상한 놈이 대 평야에서 호쾌하게 말을 달리는 모습이 펼쳐지고, 한가인이랑 책 사러 갔다가 병신이 된 것 같은 기분에, 당장이라도 현대카드로 올겨울 부모님 댁에 빠삐꼬 한 박스 사서 드려야 겠다는 생각이 절로 듭니다.

라는 건 뻥이고&#8230;

**세 줄 요악:**

  * 해드폰 앰프 망했다
  * 고쳤다
  * 좋다

이제 헤드폰만 하나 사면 되겠네요. 응?