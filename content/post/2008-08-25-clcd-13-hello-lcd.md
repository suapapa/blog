---
title: CLCD 1/3 – Hello LCD
author: suapapa
type: post
date: 2008-08-25T07:54:49+00:00
url: /p=96
dsq_thread_id:
  - 722490323
categories:
  - Arduino
  - MyProject
tags:
  - ArduinoLibrary
  - CLCD

---
아두이노에 -폭탄 간지- 캐릭터LCD(이하 CLCD)를 붙여 보았습니다.

**0. CLCD 구입**  
크기(행/열) , 백라이트 유무/색, 핀헤더의 모양에 따라 여러 종류가 있습니다. 용도에 따라, 제? 경우, 백라이트가 있는 모델 중&#8230;

가장 저렴한 녀석으로 구입했습니다. -,.-;

  * <font>[<font class="Blink">HY-1602H-205</font>](http://www.devicemart.co.kr/mart7/mall.php?cat=003012001&query=view&no=9601)<font class="Blink"> (디바이스마트 판매 페이지 링크)</font></font>



**1. 연결 준비**  
CLCD가 8 혹은 4비트 데이타 버스를 가진다고는 알고 있었는데, 전원/제어 선까지 합치니 14pin이네요.

HY-1602H-205의 경우 핀헤더가 2열이라 2&#215;7 소켓과 남는 IDE케이블을 재료로 선을 준비했습니다. (핀 헤더가 1열로 된 녀석이 작업하기 좀 더 편할 것 같습니다.)
![](https://homin.dev/asset/blog/2008/08/hy1602_pin.jpg)

> 핀헤더가 바싹 붙어 있어 검은 표시한 1번 선의 위치가 반대가 되었습니다. -,.-;
> 
> 아두이노쪽 핀은 혼돈을 덜기 위해 기능에 따라 분리했습니다. 왼쪽 부터:
> 
> **5V/GND, 컨트라스트,? RS/RW/EN, 데이타 8bit**

**2. 전원/백라이트 연결**  
![](https://homin.dev/asset/blog/2008/08/hy1602_pwron.jpg)

전원/콘트라스트/백라이트를 5V/GND에 연결해 보았습니다. **<font color="#ff0000">몇 가지 문제가 있네요!!</font>**

  * 컨트라스트를 GND에 직결하니 위 사진과 같이 항상 검은색으로 가려져 보이는 문제가 있어 가변저항을 달아 주었습니다. 적당한 저항값은 그때 그때 달라요.
  * 사진 처럼 백라이트에 5V를 바로 넣어면 레귤레이터(7805)가 급격히 뜨거워 집니다. 이 이유와 해결 방법은 따로 포스팅 하겠습니다. 일단 사진찍고 빼 두었습니다. 주간에는 백라이트 없이도 글자가 보입니다.

**3. 아두이노에 연결!**  
![](https://homin.dev/asset/blog/2008/08/hy1602_helloworld.jpg)

다행히 CLCD용 아두이노 라이브러는 이미 있었습니다. [Arduino - LCDLibrary ](http://www.arduino.cc/en/Tutorial/LCDLibrary)

> 오~ 라이브러리~

그런데, 한 줄 밖에 표시 안되는 문제와 작명 센스가 맘에 안들고, 지저분 한 데다가, 불필요한 것들을 이것 저것 인클루드 해서 덩치를 키워 뒀길래, 입맛에 맞게 리팩토링 했습니다. -,.-;;

  * **[<strong>CLCD Library for Arduino (SVN)</strong>](https://homin.dev/svn/ArduinoLibraries/CLCD/)**

이것 저것 명령어들이 많지만 싹 지우고 다시 써도 눈에 띌 만큼 느리지 않기 때문에, 라이브러리에서 clear, putStr 함수만 사용하면 CLCD를 다룰 수 있었습니다.

아래는 이 라이브러리를 사용한 예제 입니다. 1초 단위로 "Hello!\nWorld!!"를 깜박입니다.

```c
#include &lt;clcd.h>
CLCD lcd = CLCD();
char string1[] = "Hello!\nWorld!!";

void setup(void){
   lcd.init(); //initialize the LCD
}
void loop(void){
   lcd.clear(); //clear the display
   delay(1000); //delay 1000 ms to view change
   lcd.putStr(string1); //send the string to the LCD
   delay(1000); //delay 1000 ms to view change
} //repeat forever

```

참 쉽죠? =33