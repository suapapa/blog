---
title: CLCD 2/3 – backlight dimming by PWM
author: suapapa
type: post
date: 2008-08-26T06:24:46+00:00
url: /p=97
dsq_thread_id:
  - 722489656
translations:
  - 'a:1:{i:0;s:4512:"YToxOntzOjI6ImtvIjthOjM6e3M6MTE6InBvc3RfZXhjZXB0IjtzOjA6IiI7czoxMjoicG9zdF9jb250ZW50IjtzOjMyNDU6IuyVnuyEnCBDTENE7J2YIOuwseudvOydtO2KuOydmCBBL0sg64uo7J2EIDVWL0dOROyXkCDsl7DqsrDtlbQg67O064uILCDroIjqt6TroIjsnbTthLAoNzgwNSnqsIAg6riJ6rKp7Z6IIOucqOqxsOybjOyngOuKlCDrrLjsoJzqsIAg7J6I7JeI7Iq164uI64ukLgo8YmxvY2txdW90ZT7rgpgg7Je0IOuCmOuKlOqxsCDqsJnslaA8L2Jsb2NrcXVvdGU+CuusuOygnOuKlCDrsLHrnbzsnbTtirjrpbwg7ZWE7JqUIOydtOyDgeycvOuhnCDrsJ3qsowg66eM65Ok7Ja07IScIOyghOulmOulvCDrp47snbQg7J6h7JWE66i56riwIOuVjOusuOyeheuLiOuLpC4KCuyVhOuRkOydtOuFuOydmCBQV03tlYDsnYQg7IKs7Jqp7ZWY7JesIOuwseudvOydtO2KuOydmCDrsJ3quLDrpbwg7KGw7KCI7ZW0IOuztOqyoOyKteuLiOuLpC4KCjwhLS1tb3JlLS0+CgpQV03snYQg7IKs7Jqp7ZWY66m0IOyghOyVlS/soITrpZjsnZgg7KGw7KCVIOyXhuydtCDrgYTqs6Ag7Lyc64qUIOyjvOq4sOulvCDsobDsoIjtlajsnLzroZwg67Cd6riw66W8IOyhsOygiO2VoCDsiJgg7J6I7Iq164uI64ukLiDquZzrsJXquZzrsJXsnbTsp4Drp4wg64iI7Jy866GcIOuztOq4sOyXkOuKlCDqt7jrg6Ug67Cd6riw6rCAIOyWtOuRkOybjOynhOqygyDsspjrn7wg67O07J2064qUIOqxsOyjoC4KPGJsb2NrcXVvdGU+P+usvH7roaAg7IaN7JWE7KO864qUIOyEvOyKpOuPhCDsnojslrTslbzso6A8L2Jsb2NrcXVvdGU+CuyVhOuRkOydtOuFuOydmCDrkZDrh4zsnbggQXRtZWdhIDgvMTY47JeQ64+EIFBXTSDsu6jtirjroaTrn6zrpbwg64K07J6l7ZWY6rOgIOyeiOyWtCDsib3qsowg7IKs7Jqp7ZWgIOyImCDsnojsirXri4jri6QuIOyVhOuRkOydtOuFuCDrs7Trk5zsl5AgUFdN7J2065286rOgIOyTsOyXrOynhCDtlYDrk6TsnbQgUFdN7J2EIOyCrOyaqe2VoOyImCDsnojripQg7ZWAIOyeheuLiOuLpC4KCkFyZHVpbm8gUzNWM+yXkOuPhCDslYTrnpjsnZgg6re466a86rO8IOqwmeydtCDtkZzsi5zrkJjslrQg7J6I7Iq164uI64ukLgoKPGltZyBzcmM9JnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wOC9hcmR1aW5vX3B3bV9waW4ucG5nJnF1b3Q7IGFsdD0mcXVvdDthcmR1aW5vX3B3bV9waW4ucG5nJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7NDIwJnF1b3Q7IGhlaWdodD0mcXVvdDsxMjkmcXVvdDsgLz4KClBXTeyXkCDrjIDtlbTshJzripQg7JWE656Y7J2YIOunge2BrO2VnCDquLDsgqwg7KSRPHN0cm9uZz7rlJTsp4DthLgg7KCc7Ja0PC9zdHJvbmc+67aA67aE7JeQIOq3uOumvOqzvCDtlajqu5gg7Im96rKMIOyEpOuqheuQmOyWtCDsnojsirXri4jri6QuCjx1bD4KCTxsaT48YSBocmVmPSZxdW90O2h0dHA6Ly9uZXR3b3JrLmhhbmIuY28ua3Ivdmlldy5waHA/YmlfaWQ9MTA4NyZxdW90OyB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7PlBXTeyXkCDrjIDtlZjsl6w8L2E+IC0g7ZWc67mb66+465SU7Ja0IOuyiOyXrSDquLDsgqw8L2xpPgo8L3VsPgo8YmxvY2txdW90ZT7qt7jrn7wsIO2WieyatOydhCDruYzslrTsmpR+PC9ibG9ja3F1b3RlPgrrhKQuIOq3uOunjCDsp4DrnoTtlZjqs6Ag6rOE7IaNIOydtOyWtCDqsJHri4jri6QuIC0sLi07Owo8cCBhbGlnbj0mcXVvdDtsZWZ0JnF1b3Q7PuuwseudvOydtO2KuOulvCDquZzrsJXsnbTquLAg7JyE7ZW0IOyVhOuemOyZgCDtmozroZzrj4TsmYAg6rCZ7J20IOyKpOychOy5rSDtmozroZwo7JyEKeyZgCDsoIHsoIjtlZwgUFdNIOyeheugpSDqsJLsnYQg7JWM7JWE64K06riwIOychO2VtCDqsIDrs4Ag7KCA7ZWtKOyVhOuemCnrpbwg7LaU6rCA7ZWp64uI64ukLjwvcD4KPGltZyBzcmM9JnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wOC9jbGNkX2JhY2tsaWdodF9wd20ucG5nJnF1b3Q7IGFsdD0mcXVvdDtjbGNkX2JhY2tsaWdodF9wd20ucG5nJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7NDIwJnF1b3Q7IGhlaWdodD0mcXVvdDs0NTEmcXVvdDsgLz4KPGJsb2NrcXVvdGU+7Iqk7JyE7LmtIO2ajOuhnOyXkCDsgqzsmqntlZwg67aA7ZKI65Ok7J2AIOuqqOuRkCBBcmR1aW5vIFMzVjMg7KGw66a9IO2bhCDrgqjsnYAg6rKDIOyeheuLiOuLpCA6KTwvYmxvY2txdW90ZT4KPGltZyBzcmM9JnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wOC9oeTE2MDJfYmxpZ2h0X3B3bV9jdHJsLmpwZyZxdW90OyBhbHQ9JnF1b3Q7aHkxNjAyX2JsaWdodF9wd21fY3RybC5qcGcmcXVvdDsgY2xhc3M9JnF1b3Q7aW1hZ2VmcmFtZSZxdW90OyB3aWR0aD0mcXVvdDs0MjAmcXVvdDsgaGVpZ2h0PSZxdW90OzI4MCZxdW90OyAvPgo8YmxvY2txdW90ZT7tjKHtjJDsl5Ag7YWM7Iqk7Yq4PC9ibG9ja3F1b3RlPgo8YSBocmVmPSZxdW90O2h0dHA6Ly93ZWIuc3VhcGFwYS5uZXQ6ODA4MC9zdm4vQXJkdWlub0xpYnJhcmllcy9DTENELyZxdW90OyB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7PkNMQ0QgTGlicmFyeTwvYT7sl5Ag7LaU6rCA7ZWcIOyYiOygnCA8c3Ryb25nPkJhY2tMaWdodDwvc3Ryb25nPuyXkCDsnIQg7ZqM66Gc66W8IO2FjOyKpO2KuCDtlZjripQg7L2U65Oc6rCAIOyeiOyKteuLiOuLpC4KPHByZSBsYW5nPSZxdW90O2MmcXVvdDs+CnVpbnQ4X3QgcGluQW5hbG9nSW4gPSAzOwp1aW50OF90IHBpblBXTSA9IDEwOwouLi4Kdm9pZCBsb29wKHZvaWQpewo/IHZhbCA9IGFuYWxvZ1JlYWQocGluQW5hbG9nSW4pOwo/IGFuYWxvZ1dyaXRlKHBpblBXTSwgdmFsLzQpOwp9PC9wcmU+CjxibG9ja3F1b3RlPmFuYWxvZ1JlYWTsnZgg67KU7JyE64qUIDEwMjQsIGFuYWxvZ1dyaXRl7J2YIOuylOychOuKlCAyNTYg7J206riw7JeQIC80IOulvCDtlbQg7KO87JeI7Iq164uI64ukLjwvYmxvY2txdW90ZT4K7JWE64KY66Gc6re47ZWAKDMp7Jy866GcIOuwm+ydgCDqsJLsnYQgUFdN7ZWAKDEwKeyXkCA8c3Ryb25nPmFuYWxvZ1dyaXRlPC9zdHJvbmc+IO2VqOyImOulvCDsnbTsmqntlbQg64Sj7Ja0IOyjvOuKlCDqsoMg66eM7Jy866GcIOqwhOuLqO2eiCBQV03soJzslrTrpbwg7ZWgIOyImCDsnojsirXri4jri6QuIOyZgOyasCEKPHVsPgoJPGxpPuywuOyhsCA6IDxhIGhyZWY9JnF1b3Q7aHR0cDovL3d3dy5hcmR1aW5vLmNjL2VuL1R1dG9yaWFsL1BXTSZxdW90Oz5BcmR1aW5vIFBXTSBUdXRvcmlhbDwvYT4gKOunge2BrOqwgCDrtojslYjsoJUg7ZWY64Sk7JqUKTwvbGk+CjwvdWw+IjtzOjEwOiJwb3N0X3RpdGxlIjtzOjM1OiJDTENEIDIvMyAtIGJhY2tsaWdodCBkaW1taW5nIGJ5IFBXTSI7fX0=";}'
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

<!--more-->

PWM을 사용하면 전압/전류의 조정 없이 끄고 켜는 주기를 조절함으로 밝기를 조절할 수 있습니다. 깜박깜박이지만 눈으로 보기에는 그냥 밝기가 어두워진것 처럼 보이는 거죠.

> ?물~론 속아주는 센스도 있어야죠

아두이노의 두뇌인 Atmega 8/168에도 PWM 컨트롤러를 내장하고 있어 쉽게 사용할 수 있습니다. 아두이노 보드에 PWM이라고 쓰여진 핀들이 PWM을 사용할수 있는 핀 입니다.

Arduino S3V3에도 아래의 그림과 같이 표시되어 있습니다.

<img src="https://homin.dev/asset/blog/2008/08/arduino_pwm_pin.png" alt="arduino_pwm_pin.png" class="imageframe" width="420" height="129" /> 

PWM에 대해서는 아래의 링크한 기사 중**디지털 제어**부분에 그림과 함께 쉽게 설명되어 있습니다.

  * <a href="http://network.hanb.co.kr/view.php?bi_id=1087" target="_blank" rel="noopener">PWM에 대하여</a> &#8211; 한빛미디어 번역 기사

> 그럼, 행운을 빌어요~

네. 그만 지랄하고 계속 이어 갑니다. -,.-;;

<p align="left">
  백라이트를 깜박이기 위해 아래와 회로도와 같이 스위칭 회로(위)와 적절한 PWM 입력 값을 알아내기 위해 가변 저항(아래)를 추가합니다.
</p>

<img src="https://homin.dev/asset/blog/2008/08/clcd_backlight_pwm.png" alt="clcd_backlight_pwm.png" class="imageframe" width="420" height="451" /> 

> 스위칭 회로에 사용한 부품들은 모두 Arduino S3V3 조립 후 남은 것 입니다 🙂

<img src="https://homin.dev/asset/blog/2008/08/hy1602_blight_pwm_ctrl.jpg" alt="hy1602_blight_pwm_ctrl.jpg" class="imageframe" width="420" height="280" /> 

> 팡판에 테스트

<a href="https://homin.dev/svn/ArduinoLibraries/CLCD/" target="_blank" rel="noopener">CLCD Library</a>에 추가한 예제 **BackLight**에 위 회로를 테스트 하는 코드가 있습니다.

<pre lang="c">uint8_t pinAnalogIn = 3;
uint8_t pinPWM = 10;
...
void loop(void){
? val = analogRead(pinAnalogIn);
? analogWrite(pinPWM, val/4);
}</pre>

> analogRead의 범위는 1024, analogWrite의 범위는 256 이기에 /4 를 해 주었습니다.

아나로그핀(3)으로 받은 값을 PWM핀(10)에 **analogWrite** 함수를 이용해 넣어 주는 것 만으로 간단히 PWM제어를 할 수 있습니다. 와우!

  * 참조 : [Arduino PWM Tutorial][1] (링크가 불안정 하네요)

 [1]: http://www.arduino.cc/en/Tutorial/PWM