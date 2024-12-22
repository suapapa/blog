---
title: "다시 만든 한글시계 with 러스트"
date: 2024-12-22T19:56:11+09:00
tags:
- diy
- hangul
- clock
- rust
featured_image: ""
description: ""
---

![rusty_hangulclock_00_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_00_1024.jpg)

[지난 번에 완성한 한글시계](https://homin.dev/blog/post/20221009_hangulclock_is_re-written_in_golang/) 에 몇가지 아쉬운 점이 있어
처음부터 새로 만들어 봤습니다. 바뀐 점은 다음과 같습니다.

- 하드웨어 변경: SBC(RaspberryPi) -> MCU(ESP32S2)
- 광원 변경: LED Matrix -> LED Strip (Apa102 aka. Dotstar)
- 패널 변경: 에폭시 동판 -> 아크릴판 + OHP 필름
- 프로그래밍 언어 변경: Go -> Rust
- 디버그를 위한 OLED 디스플레이 추가
- 3D 프린팅을 사용한 케이스

저장소는 기존의 [한글시계 저장소](https://github.com/suapapa/HangulClock)를 그대로 사용하였고 몇가지 추가 변경이 있었습니다.

- `/rusty_hangulclock` : eps-idf-hal 을 사용한 러스트로 새로 작성한 ESP32S2용 소스코드 추가
- `/case` : 케이스의 3D 모델링 파일들 추가
- `/tool` : 패널 이미지를 만드는 파이썬 스크립트를 Python3를 지원하도록 업데이트

시간순으로 제작 사진 첨부 합니다.

우선 패널의 패딩을 포함하여 전체 크기를 예측해 보았습니다.

![rusty_hangulclock_01_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_01_1024.jpg)

크리스 마스 트리 장식에 사용하려고 구매한 5M 150ea LED 스트립의 LED 간격을 재 보니
33mm 로 5x5의 한글시계를 만들었을 패널 크기가 165mmx165mm 로 적당했습니다.

![rusty_hangulclock_02_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_02_1024.jpg)

3D 프린터가 감당할 수 있는 크기입니다.

![rusty_hangulclock_03_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_03_1024.jpg)

모든 3D 디자인은 OpenScad를 사용해 서포트 없이 출력할수 있게 했습니다.

![rusty_hangulclock_04_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_04_1024.jpg)

PETG가 반투명이라 빛 샘 현상을 막기 위해 내부를 은색으로 도색했습니다.

![rusty_hangulclock_05_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_05_1024.jpg)

LED 스트립은 그림과 같이 지그재그로 연결했습니다. 4선의 Dotstar 말고 3선의 NeoPixel 스트랩을 샀으면 납땜을 덜 할 수 있어서 좋았을 걸 했습니다.

![rusty_hangulclock_06_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_06_1024.jpg)

LED 패널의 뒷면에는 OLED와 ESP32S2 보드를 장착했습니다. RaspberryPi 같은 SBC는 아무것도 안해도 5V 2A 를 사용하는데 ESP32S2는 MCU라 조명 다 키고 OLED 까지 켜져 있어도 5V 100mA 도 채 사용하지 않더라구요. 허허

부팅도 SBC와 달리 똑딱 되서 역시 간단한 어플리케이션에는 MCU가 답이구나 했습니다.
SBC가격만 몇 만원 하던 것에서 MCU를 사용하면 몇 천원으로 비용도 대폭 절감됩니다.

![rusty_hangulclock_07_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_07_1024.jpg)

안 터지나 테스트 해 보고,

![rusty_hangulclock_08_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_08_1024.jpg)

전면 패널은 2mm 투명 아크릴판 두 장 사이에 OHP 필름으로 인쇄한 한글시계의 5x5 배결을 두 장 (한 장만 사용하니 빛이 새더라고요), 빈 A4용지 하나를 겹쳐 저렴하면서도 완성도를 높일 수 있었습니다. 

![rusty_hangulclock_09_1024.jpg](https://homin.dev/asset/blog/img/rusty_hangulclock_09_1024.jpg)

완성된 모습. 편안~

---

ESP32S2는 WiFi가 포함되어 있는 MCU이기 때문에 SNTP를 사용해 정확한 시간을 맞추는것이 가능했습니다.

예전에 시도해 봤을때는 여러 주변기기 (DotStar, OLED) 를 위한 Crate 들이 ESP의 HAL과 호환이 깨져있어서 아쉬웠는데 이번에 다시 해 보니 Rust Embedded 생태계가 많이 탄탄해 졌더군요.

꼭 ESP용으로 작성된 Crate 를 사용해야 되는게 아니라 Embedded-HAL 을 만족하는 것들은 모두 사용할 수 있어서 STM이나 NXP용 예제 코드에서 사용법을 참고해 전체 코드를 수월하게 작성 할 수 있었습니다.

> 코드는 기본 동작만 확인한 상태로 추후 아무때나 업데이트 될 수 있습니다.

원 저자로 인터넷에서 여러 분들이 만든 많은 한글 시계에 역으로 영감을 받을 수 있어서 영광이었습니다.

처음 한글시계를 만들때 보다 환경도 좋아지고 저도 노련?해져서 많은 시간과 비용을 절약할 수 있었습니다. :)

아직 국내에는 MCU에 러스틑 사용하는 분들이 많지 않은 것 같은데, SBC에 Go가 딱이듯, MCU에는 러스트가 참 좋더라고요. 국내 Embedded Rust 생태게도 더 무르익기를 바래 봅니다.

끝!