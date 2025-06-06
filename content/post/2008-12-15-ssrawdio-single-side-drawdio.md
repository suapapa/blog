---
title: 'SSrawdio! : Single Side drawdio!!'
author: suapapa
type: post
date: 2008-12-15T06:07:21+00:00
url: /p=150
dsq_thread_id:
  - 722490701
categories:
  - DIY
  - Music
tags:
  - EagleCad
  - 악기
  - 전자회로

---
단면 에칭 기판으로 [Dawdio][1]를 만들었습니다.

![](https://asset.homin.dev/blog/image/ssrawdio_inaction.webp)

drawdio는 555 IC를 사용한 발진 회로를 사용해 연필(등의 전도체)로 그림을 그리면 소리가 나는 장난감 입니다.

> 수아가 -정말- 가지고 노는 장난감이 탄생했습니다!

555 IC는 지금까지 가장 많이 팔린 IC라고 할 정도로 유명한 녀석으로 연결한 저항과 캐패시터의 값에 따라 주파수를 발생시켜 줍니다. drawdio는 이 값들을 조절해 가청주파수를 만들어 내고 NPN-PNP TR로 들을 수 있을만큼 증폭하여 스피커로 소리를 냅니다.



[layada에서 킷을 만들어 판매][2]하며, 위 내용의 더 [자세한 설명][3]과 회로도및 아트웍을 받을 수 있습니다. layada의 drawdio를 국내에서 주문하는게 -배송비로- 어렵기에 만들기에 착수했는데, 그 drawdio에 사용한 555칩 TLC551을 국내에서 구하는 것 또한 어려워 한동안 벽에 부딧혔었습니다.

> 555같이 유명한 칩의 경우 여러 제조사에서 만든 다양한 변종이 있는데, TLC551은 1.5V의 저전압에서도 동작하여 AA건전지 하나로 drawdio가 동작하도록 해 줍니다.

국내에서 구할 수 있는 가장 낮은 동작전압의 555는 [TLC555CP][4] 로 2V 이상에서 동작합니다. AA건전지 하나로 이 칩을 울릴수 없으므로 코인 배터리 CR2032(3V)를 사용해 단면 기판용 회로를 만들었습니다. 다음 아트웍 이미지를 클릭하면 sch, brd 파일을 받으실 수 있습니다.

[![](https://asset.homin.dev/blog/image/SSrawdio.webp)][5]

PCB에칭에 대해서는 여러 차례 다루었으므로 건너뛰고 조립부분에 대해 설명하겠습니다.

**부품들**:

![](https://asset.homin.dev/blog/image/ssrawdio_parts.webp)

  * 스피커
  * 소켓
  * TLC555CP
  * 핀헤더 1&#215;4 * 2,
  * CR2032 & 배터리 홀더
  * 전해 콘덴서 100uF * 2
  * 2N2222
  * 2N2907
  * 스위치
  * 100K
  * 300K (제 경우 대신 220K를 사용했습니다.)
  * 100nF
  * 680pF

**조립하기**:

![](https://asset.homin.dev/blog/image/ssrawdio_assembled.webp)

단면기판이기 때문에 부품들의 위치를 정렬하면서 크기를 작게 하는데 제약이 있어 1&#215;4 핀헤더 두개를 사용해 저항들을 555 IC밑으로 숨겼습니다.

![](https://asset.homin.dev/blog/image/ssrawdio_up.webp)

앞정을 연필심에 닫게 꼳고, SSrawdio의 중간 부분에 구리테입을 감아 연결합니다. 전도성 테입의 경우 접착면에도 전기가 흐르지만, 제 회로에 있는 작은 접착면에서는 전기가 흐르지 않길래 추가로 납땜하여 연결하였습니다.

> 조립시 멀티미터로 각 단계가 제대로 연결되었는지 확인하세요!

![](https://asset.homin.dev/blog/image/ssrawdio_down.webp)

보드의 아래쪽 접지면도 같은 방법으로 연결한 후 손에 닫도록 연필 몸통에 빙글빙글 감아 붙입니다.

**테스트:**

스위치를 켜고, 한 손으로 연필 몸통을 잡은 후에 다른 손을 압정에 대면 "삐이~" 하는 소리가 납니다. 완성!!

이제 다음 동영상처럼 가지고 놉니다. 유후~

{{< youtube PV_w38ldZaE >}}

 

 [1]: http://web.media.mit.edu/~silver/drawdio/
 [2]: http://ladyada.net/make/drawdio/index.html
 [3]: http://ladyada.net/make/drawdio/design.html
 [4]: http://www.devicemart.co.kr/mart7/mall.php?cat=001004007&query=view&no=8829
 [5]: https://homin.dev/svn/HW/SSrawdio/