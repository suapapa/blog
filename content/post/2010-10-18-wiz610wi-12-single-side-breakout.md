---
title: '[WIZ610wi 1/2] single-side breakout'
author: suapapa
type: post
date: 2010-10-18T08:03:23+00:00
url: /p=475
dsq_thread_id:
  - 722489286
categories:
  - android
tags:
  - wifi
  - 이글캐드

---
![](https://asset.homin.dev/blog/image/wiz610_breakout_top.jpg)

WIZ610w은 wiznet에서 만든 시리얼2Wifi 모듈 입니다. 아두이노와 함께 사용할 수 있도록, 브레이크아웃 보드를 만들어 보았습니다.  
사진의 왼쪽이 WIZ610w 브레이크아웃 보드이고, 오른쪽은 바로 PC와 연결해 테스트 하기 위한 USB2시리얼 모듈 입니다.

회로도와 아트워크는 여기서 다운 받으세요 -> [WIZ610w breakout in eaglecad](https://homin.dev/svn/HW/breakout/wiz610/)

> 이 포스트는 블로그 이전 중 날아간 내용을 기억에 의해 복원한 것입니다. 내용이 부실한 점 이해해 주세요. 🙂



![](https://asset.homin.dev/blog/image/wiz610_parts.jpg)

WIZ610w 모듈의 구성품 입니다. 모듈과 안테나 그리고, 확장 보드에서 사용하기 위한 소켓이 두 개 들어 있습니다.

![](https://asset.homin.dev/blog/image/wiz610_pinheader.jpg)

소켓들은 2열로 다리 간격이 2mm (브래드 보드는 2.54mm) 입니다. 게다가 핀 수도 많아요. DIY PCB를 위해 2mm 간격으로 저 많은 다리 구멍을 어떻게 뚫어야 하나 싶었는데, 잘 살펴보니 다리들을 양 옆으로 눞힐 수 있게 되어 있었습니다.

![](https://asset.homin.dev/blog/image/wiz610_breakout_bottom.jpg)

아두이노에서 사용하기 위해서 아두이노에서 제공하는 5V를 WIZ610w의 전압인 3V3으로 변환하기 위한 LDO를 하나 추가했고,  
시리얼 Level-shift를 위핸 저항, 뮤듈의 상태를 알려주기 위한 LED들을 추가해 최소한으로 구성했습니다.

모듈의 모드를 선택하기 위한 딥 스위치등으로 구성했습니다. 소켓을 패턴 면에 납땜 했기 때문에,  
오른쪽의 모듈 장착 사진에서 보이듯이, 모듈이 아래 방향을 향하게 장착 됩니다.

![](https://asset.homin.dev/blog/image/wiz610_breakout_side.jpg)

옆에서 보면 이렇습니다. 작동중에 WIZ610w 모듈에서 열이 나는 편이므로 장착시 서포터 등으로 열이 빠져나갈  
공간을 확보해 주셔야 할 것입니다.