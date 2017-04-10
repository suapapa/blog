+++
date = "2017-04-06T15:17:30+09:00"
title = "Digispark 보드로 ESC 페달 만들기"

+++

'Digispark USB Development Board'는 Attiny85칩을 기반으로 한
아두이노 호환 보드 입니다. 

* [공식 홈 링크](http://digistump.com/products/1)

OSHW 이기 때문에 Aliexpress에서 호환 보드를 쉽고 싸게 구할 수 있다는
장점이 있습니다. 개 당 $1.5 미만!!

보통의 아두이노 처럼 USB가 있긴 하지만 `USB2Serial` 기반이 아니라
스케치를 업로드 하기 전에 리셋을 하지 않으며, 보드를 뺀 상태로
업로드를 시작하고 보드를 연결하는 방법을 사용합니다.

> USB3.0 포트와 궁합이 잘 맞지 않거나 하는 등의 문제가 있어서
> 잘 안되면 다른 허브의 포트를 써 보는 등의 작업이 필요합니다.

입력 핀 테스트 결과 내장 pull-up 따위는 없나 보더군요.

![esc_pedal_1](/img/digispark_esc_sch.jpg)

10k ohm 으로 달아 줍니다. 회로도에서 P1은 P0와 바뀌었습니다.

digispark의 예제를 참조해 작성된 스케치 코드는 다음과 같습니다:

    #include "DigiKeyboard.h"

    void setup() {
        pinMode(0, INPUT);
        pinMode(1, OUTPUT);
    }

    void loop() {
        DigiKeyboard.sendKeyStroke(0);

        if (digitalRead(0) == LOW) {
            digitalWrite(1, HIGH);
            DigiKeyboard.sendKeyStroke(41); // Keyboard ESC
            DigiKeyboard.delay(100);
        }

        digitalWrite(1, LOW);
        DigiKeyboard.delay(100);
    }

공업용 미싱 페달 (옥션에서 구입) 을 5mm 잭으로 연결했습니다.
케이스는 압정통을 사용해 만들어 줬습니다.

![esc_pedal_2](/img/digispark_esc_pedal.jpg)

vi/vim 을 사용하시는 분들 ESC 페달 정말 편해요.
하나씩 마련하세요!