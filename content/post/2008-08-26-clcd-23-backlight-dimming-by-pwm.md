---
title: CLCD 2/3 – backlight dimming by PWM
author: suapapa
type: post
date: 2008-08-26T06:24:46+00:00
url: /p=97
dsq_thread_id:
  - 722489656
categories:
  - Arduino
tags:
  - CLCD
  - PWM
  - 전자회로

---
앞서 CLCD의 백라이트의 A/K 단을 5V/GND에 연결해 보니, 레귤레이터(7805)가 급격히 뜨거워지는 문제가 있었습니다.

> 나 열 나는거 같애

문제는 백라이트를 필요 이상으로 밝게 만들어서 전류를 많이 잡아먹기 때문입니다.

아두이노의 PWM핀을 사용하여 백라이트의 밝기를 조절해 보겠습니다.



PWM을 사용하면 전압/전류의 조정 없이 끄고 켜는 주기를 조절함으로 밝기를 조절할 수 있습니다. 깜박깜박이지만 눈으로 보기에는 그냥 밝기가 어두워진것 처럼 보이는 거죠.

> ?물~론 속아주는 센스도 있어야죠

아두이노의 두뇌인 Atmega 8/168에도 PWM 컨트롤러를 내장하고 있어 쉽게 사용할 수 있습니다. 아두이노 보드에 PWM이라고 쓰여진 핀들이 PWM을 사용할수 있는 핀 입니다.

Arduino S3V3에도 아래의 그림과 같이 표시되어 있습니다.

![](https://asset.homin.dev/blog/2008/08/arduino_pwm_pin.png)

PWM에 대해서는 아래의 링크한 기사 중**디지털 제어**부분에 그림과 함께 쉽게 설명되어 있습니다.

  * [PWM에 대하여](http://network.hanb.co.kr/view.php?bi_id=1087) - 한빛미디어 번역 기사

> 그럼, 행운을 빌어요~

네. 그만 지랄하고 계속 이어 갑니다. -,.-;;

<p align="left">
  백라이트를 깜박이기 위해 아래와 회로도와 같이 스위칭 회로(위)와 적절한 PWM 입력 값을 알아내기 위해 가변 저항(아래)를 추가합니다.
</p>

![](https://asset.homin.dev/blog/2008/08/clcd_backlight_pwm.png)

> 스위칭 회로에 사용한 부품들은 모두 Arduino S3V3 조립 후 남은 것 입니다 🙂

![](https://asset.homin.dev/blog/2008/08/hy1602_blight_pwm_ctrl.jpg)

> 팡판에 테스트

[CLCD Library](https://homin.dev/svn/ArduinoLibraries/CLCD/)에 추가한 예제 **BackLight**에 위 회로를 테스트 하는 코드가 있습니다.

```c
uint8_t pinAnalogIn = 3;
uint8_t pinPWM = 10;
...
void loop(void){
? val = analogRead(pinAnalogIn);
? analogWrite(pinPWM, val/4);
}
```

> analogRead의 범위는 1024, analogWrite의 범위는 256 이기에 /4 를 해 주었습니다.

아나로그핀(3)으로 받은 값을 PWM핀(10)에 **analogWrite** 함수를 이용해 넣어 주는 것 만으로 간단히 PWM제어를 할 수 있습니다. 와우!

  * 참조 : [Arduino PWM Tutorial][1] (링크가 불안정 하네요)

 [1]: http://www.arduino.cc/en/Tutorial/PWM