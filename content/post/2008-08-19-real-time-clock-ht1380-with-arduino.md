---
title: Real Time Clock HT1380 with Arduino
author: suapapa
type: post
date: 2008-08-19T10:51:50+00:00
url: /p=94
dsq_thread_id:
  - 722490452
aktt_notify_twitter:
  - no
categories:
  - Arduino
  - MyProject
tags:
  - ArduinoLibrary

---
사실, 아두이노가 저렴한 이유는 주변장치들이 없기 때문입니다.  
국내에서 판매되는 AVR 개발 보드들은 센서며, 스위치며, CLCD등을  
주렁 주렁 달아 덩치가 크고 비싸죠.  
뭐, 삽질할 거리가 줄어들 수도 있겠지만,  
삽질 할 수 없게 만들어 버리는 그런건 제 취향은 아니에요.

사실, 아두이노만으로는 (13번 LED를 깜박이는 걸 제외하고) 거의 아무것도 할 게 없습니다.  
이제, 아두이노에 주변장치를 달아 보겠습니다.

임베디드 세상의 Hello world격 어플리케이션은 I2C로 통신하는  
[RTC](http://www.terms.co.kr/RTC.htm)를 연결하는 것 입니다.  
I2C프로토콜은 널리 사용되는 표준 중 하나로, 알아두면 두고두고  
유용하며, RTC는 싸고 간단한 장치이므로 배우기에 좋습니다.

그래서, RTC칩 HT1380을 구입했는데, 판매 페이지의 설명과 달리 이 녀석이  
I2C 프로토콜로 통신을 하지 않더군요. 🙁

> 틀렸다고 알려줘도 고치치도 않고, eleparts 잊지 않겠다. -_-+

그럼 I2C가 아닌 RTC를 아두이노에 연결해 보겠습니다. HT1380은 세 선을 사용해 MCU와 통신 합니다. 데이타 시트를 기초로 구현!ㄱㄱㅅ!

> 버릴수는 없잖아요.



## 하드웨어 준비:

![](https://asset.homin.dev/blog/2008/08/ht1380_parts.webp)

- [Serial Time Keeper IC (HT1380)](https://www.eleparts.co.kr/view.php?cate1=&cate2=&cate3=&cate4=&item=10689&keyword=&u_n=25560&page=1)
- [Tuning Fork -32.768KHz](https://www.eleparts.co.kr/view.php?cate1=&cate2=&cate3=&cate4=&item=7537&keyword=&u_n=25560&page=1)
- [Ceramic 5pF, 50V](https://www.eleparts.co.kr/view.php?cate1=&cate2=&cate3=&cate4=&item=856&keyword=&u_n=25560&page=1)

[데이터시트](http://www.alldatasheet.co.kr/datasheet-pdf/pdf_kor/64412/HOLTEK/HT1380.html)
의 회로도를 참고하여 조립.

## 휘리릭 뿅!:

![](https://asset.homin.dev/blog/2008/08/ht1380_module.webp)

아두이노의 5V전원을 연결하고 \`_REST\`, \`SCLK\`, \`I/O\`,? 핀을 각각 아두이노  
7, 6, 5번 소켓에 연결하였습니다.  
핀 할당은 라이브러리를 불러올 때 원하는 대로 바꿀 수 있습니다.

## 소프트웨어 준비:

웹에서 HT1380의 C 코드 예제를 찾을 수가 없었습니다. -이 RTC 칩 꽤 대중적인 것 같던데.  
이게 말이 되나요? 어흑 - 맨땅에서, 데이타 시트만을 토대로 아두이노 라이브러리로 만들었습니다.

> 아두이노 라이브러리들은 관례적으로 cpp을 사용하더군요! 진짜 OOP!! +_+

[HT1380 아두이노 라이브러리](https://github.com/suapapa/arduino_library_ht1380)를 받아,  
아두이노 SW 폴더 밑의 \`hardware/libraries/HT1380\`에 설치(복사)합니다.

아두이노 소프트웨어(IDE)를 실행할 때 설치된 라이브러리를 컴파일하여  
오브젝트(HT1380.o)를 만들어 둡니다. 라이브러리에 문제가 있다면  
이 단계에서 확인할 수 있습니다.

## 실행:

라이브러리를 설치하면 예제도 함께 설치 됩니다.  
\`Menu->Sketchbook->Examples->Library-HT1380\`으로 들어가 예제를 불러옵니다.

예제는 HT1380에 시간을 설정하고 매 초 시리얼 모니터를 통해 현재 시간을 보여 줍니다.  
아래는 실행 화면.

![](https://asset.homin.dev/blog/2008/08/arduino_ht1380_example.webp)

## 응용:

RTC의 전원을 -건전지로- 분리해 두면 아두이노가 꺼졌을 때도 시간을 유지할 수 있습니다.

예전에 소개한 인터벌 트리거의 인터벌 간격을 일/월/년 단위로 확장할 수도 있겠네요.