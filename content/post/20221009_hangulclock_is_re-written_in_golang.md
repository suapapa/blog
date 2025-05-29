---
title: 11년 만에 완성한, 원조, 한글시계 
date: 2022-10-09T09:48:38+09:00
tags:
- diy
- hangul
- clock
- golang
featured_image: ""
description: ""
toc: true
---

2011년 [한글시계 뒷 이야기](https://homin.dev/blog/p=493/)에서 이어갑니다.

> 줄거리 요약: 2011년 MAKE:Korea 잡지 수상작인 한글시계는 미완의 상태로 남아있었는데...

매년, '한글시계 완성해야지!', '어? 한글날 지났네? 내년에 해야지!'을 반복하다 보니 11년이 넘어 버렸어요.
하지만 올해에는 완성했습니다. 뚜 둥 탁!

![hangulclock_2022.jpg](https://asset.homin.dev/blog/img/hangulclock_2022.jpg)

## 무엇이 문제였나?

한글시계는 기술적으로는 5x5 LED 매트릭스를 시간에 맞게 키면 되기 때문에 간단합니다.
그래서 "아두이노"로 프로토타입을 만들었었죠. 하지만 여기에는 함정이 있었는데,

시간을 맞추는 게 어렵다는 것이었습니다. 시계가 시간이 안 맞으면 무슨 의미가 있나?

- 시간의 표시 단위가 5분이기 때문에 정확한 시간을 맞추기 힘듭니다.
- RTC에 저장한 시간은 저절로 틀어집니다.

그래서 아두이노를 분리하고 디스플레이 부분만 남긴 채 보관되고 있었습니다.

## 하드웨어, 케이스? 준비

그렇게 올해도 한글날을 알아차린 건 하루 전 (10월 8일)이었고, 부랴부랴 작업했습니다.

우분투 리눅스 서버가 올라간 SBC,
[OrangePi Zero 2](http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2.html)를
사용해 NTP로 동기화된 시간을 표시하기로 했습니다.

뻥 뚫린 한글시계의 뒷면에 SBC를 고정하기 위해 고정판을 OpenScad로 3D 모델링해 3D 프린팅했습니다:

{{< youtube q4HFykGJe6s >}}

5V TTL을 사용하는 아두이노와 달리 최근의 SBC 들은 3V3 CMOS로 통신하므로, LED 매트릭스 드라이버인 MAX7219를
바로 연결하면 안 됩니다. I/O 레벨 컨버터 모듈을 중간에 끼워 전선을 연결했습니다. 다음과 같이 준비했습니다:

![hangulclock_connect_with_opi.jpg](https://asset.homin.dev/blog/img/hangulclock_connect_with_opi.jpg)

## 프로그래밍

리눅스가 올라가 있으면 Go 언어로 코딩할 수 있습니다.
더욱이, [periph](https://periph.io/) 패키지를 사용하면
하드웨어 (SPI, I2C, GPIO 등등)을 유저스페이스에서 쉽게 다룰 수 있습니다.

- LED 매트릭스 드라이버 MAX7219 드라이버가 없어서 새로 작성했습니다.
- 아두이노 코드로 작성한 디스플레이 로직을 그대로 Go로 옮겨왔습니다.
- 시간은 NTP로 자동으로 정확한 시간이 설정되기 때문에 신경 쓸게 없어 너무 좋았네요.

{{< youtube iZqtswnjNbc >}}

> Go 언어의 빠른 생산성 덕에 급박한 마감일을 앞두고, 졸다가 생산한 버그로 좀 헤맸음에도,
> 올해에는 드디어 한글날에 맞춰 공개할 수 있게 되었습니다.

## 감상

{{< youtube ApymC7qAVTI >}}

> 실제로는 현재 시각에 맞춰 표시됩니다.

참고로 한글시계 (5x5 한글 조합)의 라이선스는 CC-BY 입니다.
이걸로 뭘 하고 싶으신 분은 원 저자인 절 명시하고, 상업적인 용도 포함, 자유롭게 사용하실 수 있습니다.

세종대왕님 존경합니다. 모두 행복한 한글날 되세요!