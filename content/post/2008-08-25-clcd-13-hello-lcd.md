---
title: CLCD 1/3 – Hello LCD
author: suapapa
type: post
date: 2008-08-25T07:54:49+00:00
url: /p=96
translations:
  - 'a:1:{i:0;s:5612:"YToxOntzOjI6ImtvIjthOjM6e3M6MTE6InBvc3RfZXhjZXB0IjtzOjA6IiI7czoxMjoicG9zdF9jb250ZW50IjtzOjQwODQ6IuyVhOuRkOydtOuFuOyXkCAt7Y+t7YOEIOqwhOyngC0g7LqQ66at7YSwTENEKOydtO2VmCBDTENEKeulvCDrtpnsl6wg67O07JWY7Iq164uI64ukLgoKPHN0cm9uZz4wLiBDTENEIOq1rOyehTwvc3Ryb25nPgrtgazquLAo7ZaJL+yXtCkgLCDrsLHrnbzsnbTtirgg7Jyg66y0L+yDiSwg7ZWA7Zek642U7J2YIOuqqOyWkeyXkCDrlLDrnbwg7Jes65+sIOyiheulmOqwgCDsnojsirXri4jri6QuIOyaqeuPhOyXkCDrlLDrnbwsIOygnD8g6rK97JqwLCDrsLHrnbzsnbTtirjqsIAg7J6I64qUIOuqqOuNuCDspJEuLi4KCuqwgOyepSDsoIDroLTtlZwg64WA7ISd7Jy866GcIOq1rOyehe2WiOyKteuLiOuLpC4gLSwuLTsKPHVsPgoJPGxpPjxmb250PjxhIGhyZWY9JnF1b3Q7aHR0cDovL3d3dy5kZXZpY2VtYXJ0LmNvLmtyL21hcnQ3L21hbGwucGhwP2NhdD0wMDMwMTIwMDEmYW1wO3F1ZXJ5PXZpZXcmYW1wO25vPTk2MDEmcXVvdDsgdGFyZ2V0PSZxdW90O19ibGFuayZxdW90Oz48Zm9udCBjbGFzcz0mcXVvdDtCbGluayZxdW90Oz5IWS0xNjAySC0yMDU8L2ZvbnQ+PC9hPjxmb250IGNsYXNzPSZxdW90O0JsaW5rJnF1b3Q7PiAo65SU67CU7J207Iqk66eI7Yq4IO2MkOunpCDtjpjsnbTsp4Ag66eB7YGsKTwvZm9udD48L2ZvbnQ+PC9saT4KPC91bD4KPCEtLW1vcmUtLT48c3Ryb25nPjEuIOyXsOqysCDspIDruYQ8L3N0cm9uZz4KQ0xDROqwgCA4IO2YueydgCA067mE7Yq4IOuNsOydtO2DgCDrsoTsiqTrpbwg6rCA7KeE64uk6rOg64qUIOyVjOqzoCDsnojsl4jripTrjbAsIOyghOybkC/soJzslrQg7ISg6rmM7KeAIO2Vqey5mOuLiCAxNHBpbuydtOuEpOyalC4KCkhZLTE2MDJILTIwNeydmCDqsr3smrAg7ZWA7Zek642U6rCAIDLsl7TsnbTrnbwgMng3IOyGjOy8k+qzvCDrgqjripQgSURF7LyA7J2067iU7J2EIOyerOujjOuhnCDshKDsnYQg7KSA67mE7ZaI7Iq164uI64ukLiAo7ZWAIO2XpOuNlOqwgCAx7Je066GcIOuQnCDrhYDshJ3snbQg7J6R7JeF7ZWY6riwIOyigCDrjZQg7Y647ZWgIOqygyDqsJnsirXri4jri6QuKQo8aW1nIHNyYz0mcXVvdDsvd29yZHByZXNzL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDA4LzA4L2h5MTYwMl9waW4uanBnJnF1b3Q7IGFsdD0mcXVvdDtoeTE2MDJfcGluLmpwZyZxdW90OyBjbGFzcz0mcXVvdDtpbWFnZWZyYW1lJnF1b3Q7IHdpZHRoPSZxdW90OzQyMCZxdW90OyBoZWlnaHQ9JnF1b3Q7MjgwJnF1b3Q7IC8+CjxibG9ja3F1b3RlPu2VgO2XpOuNlOqwgCDrsJTsi7kg67aZ7Ja0IOyeiOyWtCDqsoDsnYAg7ZGc7Iuc7ZWcIDHrsogg7ISg7J2YIOychOy5mOqwgCDrsJjrjIDqsIAg65CY7JeI7Iq164uI64ukLiAtLC4tOwoK7JWE65GQ7J2064W47Kq9IO2VgOydgCDtmLzrj4jsnYQg642c6riwIOychO2VtCDquLDriqXsl5Ag65Sw6528IOu2hOumrO2WiOyKteuLiOuLpC4g7Jm87Kq9IOu2gO2EsDoKCjxzdHJvbmc+NVYvR05ELCDsu6jtirjrnbzsiqTtirgsPyBSUy9SVy9FTiwg642w7J207YOAIDhiaXQ8L3N0cm9uZz48L2Jsb2NrcXVvdGU+CjxzdHJvbmc+Mi4g7KCE7JuQL+uwseudvOydtO2KuCDsl7DqsrAgPC9zdHJvbmc+CjxpbWcgc3JjPSZxdW90Oy93b3JkcHJlc3Mvd3AtY29udGVudC91cGxvYWRzLzIwMDgvMDgvaHkxNjAyX3B3cm9uLmpwZyZxdW90OyBhbHQ9JnF1b3Q7aHkxNjAyX3B3cm9uLmpwZyZxdW90OyBjbGFzcz0mcXVvdDtpbWFnZWZyYW1lJnF1b3Q7IHdpZHRoPSZxdW90OzQyMCZxdW90OyBoZWlnaHQ9JnF1b3Q7MjgwJnF1b3Q7IC8+CgrsoITsm5Av7L2Y7Yq465287Iqk7Yq4L+uwseudvOydtO2KuOulvCA1Vi9HTkTsl5Ag7Jew6rKw7ZW0IOuztOyVmOyKteuLiOuLpC4gPHN0cm9uZz48Zm9udCBjb2xvcj0mcXVvdDsjZmYwMDAwJnF1b3Q7PuuqhyDqsIDsp4Ag66y47KCc6rCAIOyeiOuEpOyalCEhPC9mb250Pjwvc3Ryb25nPgo8dWw+Cgk8bGk+7Luo7Yq465287Iqk7Yq466W8IEdOROyXkCDsp4HqsrDtlZjri4gg7JyEIOyCrOynhOqzvCDqsJnsnbQg7ZWt7IOBIOqygOydgOyDieycvOuhnCDqsIDroKTsoLgg67O07J2064qUIOusuOygnOqwgCDsnojslrQg6rCA67OA7KCA7ZWt7J2EIOuLrOyVhCDso7zsl4jsirXri4jri6QuIOyggeuLue2VnCDsoIDtla3qsJLsnYAg6re465WMIOq3uOuVjCDri6zrnbzsmpQuPC9saT4KCTxsaT7sgqzsp4Qg7LKY65+8IOuwseudvOydtO2KuOyXkCA1VuulvCDrsJTroZwg64Sj7Ja066m0IOugiOq3pOugiOydtO2EsCg3ODA1KeqwgCDquInqsqntnogg65yo6rGw7JuMIOynkeuLiOuLpC4g7J20IOydtOycoOyZgCDtlbTqsrAg67Cp67KV7J2AIOuUsOuhnCDtj6zsiqTtjIUg7ZWY6rKg7Iq164uI64ukLiDsnbzri6gg7IKs7KeE7LCN6rOgIOu5vCDrkZDsl4jsirXri4jri6QuIOyjvOqwhOyXkOuKlCDrsLHrnbzsnbTtirgg7JeG7J2064+EIOq4gOyekOqwgCDrs7TsnoXri4jri6QuPC9saT4KPC91bD4KPHN0cm9uZz4zLiDslYTrkZDsnbTrhbjsl5Ag7Jew6rKwITwvc3Ryb25nPgo8aW1nIHNyYz0mcXVvdDsvd29yZHByZXNzL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDA4LzA4L2h5MTYwMl9oZWxsb3dvcmxkLmpwZyZxdW90OyBhbHQ9JnF1b3Q7aHkxNjAyX2hlbGxvd29ybGQuanBnJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7NDIwJnF1b3Q7IGhlaWdodD0mcXVvdDsyODAmcXVvdDsgLz4KCuuLpO2Wie2eiCBDTENE7JqpIOyVhOuRkOydtOuFuCDrnbzsnbTruIzrn6zripQg7J2066+4IOyeiOyXiOyKteuLiOuLpC4gPGEgaHJlZj0mcXVvdDtodHRwOi8vd3d3LmFyZHVpbm8uY2MvZW4vVHV0b3JpYWwvTENETGlicmFyeSZxdW90OyB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7PkFyZHVpbm8gLSBMQ0RMaWJyYXJ5IDwvYT4KPGJsb2NrcXVvdGU+7JikfiDrnbzsnbTruIzrn6zrpqx+PC9ibG9ja3F1b3RlPgrqt7jrn7DrjbAsIO2VnCDspIQg67CW7JeQIO2RnOyLnCDslYjrkJjripQg66y47KCc7JmAIOyekeuqhSDshLzsiqTqsIAg66eY7JeQIOyViOuTpOqzoCwg7KeA7KCA67aEIO2VnCDrjbDri6TqsIAsIOu2iO2VhOyalO2VnCDqsoPrk6TsnYQg7J206rKDIOyggOqygyDsnbjtgbTro6jrk5wg7ZW07IScIOuNqey5mOulvCDtgqTsm4wg65KA6ri4656YLCDsnoXrp5vsl5Ag66ee6rKMIOumrO2Mqe2GoOungSDtlojsirXri4jri6QuIC0sLi07Owo8dWw+Cgk8bGk+PHN0cm9uZz48YSBocmVmPSZxdW90O2h0dHA6Ly93ZWIuc3VhcGFwYS5uZXQ6ODA4MC9zdm4vQXJkdWlub0xpYnJhcmllcy9DTENELyZxdW90OyB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7PjxzdHJvbmc+Q0xDRCBMaWJyYXJ5IGZvciBBcmR1aW5vIChTVk4pPC9zdHJvbmc+PC9hPjwvc3Ryb25nPjwvbGk+CjwvdWw+CuydtOqygyDsoIDqsoMg66qF66C57Ja065Ok7J20IOunjuyngOunjCDsi7kg7KeA7Jqw6rOgIOuLpOyLnCDsjajrj4Qg64iI7JeQIOudjCDrp4ztgbwg64qQ66as7KeAIOyViuq4sCDrlYzrrLjsl5AsIOudvOydtOu4jOufrOumrOyXkOyEnCBjbGVhciwgcHV0U3RyIO2VqOyImOunjCDsgqzsmqntlZjrqbQgQ0xDROulvCDri6Tro7Ag7IiYIOyeiOyXiOyKteuLiOuLpC4KCuyVhOuemOuKlCDsnbQg65287J2067iM65+s66as66W8IOyCrOyaqe2VnCDsmIjsoJwg7J6F64uI64ukLiAx7LSIIOuLqOychOuhnCAmcXVvdDtIZWxsbyFcXG5Xb3JsZCEhJnF1b3Q766W8IOq5nOuwleyeheuLiOuLpC4KPHByZSBsYW5nPSZxdW90O2MmcXVvdDs+CiNpbmNsdWRlIDxjbGNkLmg+CkNMQ0QgbGNkID0gQ0xDRCgpOwpjaGFyIHN0cmluZzFbXSA9ICZxdW90O0hlbGxvIVxcbldvcmxkISEmcXVvdDs7Cgp2b2lkIHNldHVwKHZvaWQpewogICBsY2QuaW5pdCgpOyAvL2luaXRpYWxpemUgdGhlIExDRAp9CnZvaWQgbG9vcCh2b2lkKXsKICAgbGNkLmNsZWFyKCk7IC8vY2xlYXIgdGhlIGRpc3BsYXkKICAgZGVsYXkoMTAwMCk7IC8vZGVsYXkgMTAwMCBtcyB0byB2aWV3IGNoYW5nZQogICBsY2QucHV0U3RyKHN0cmluZzEpOyAvL3NlbmQgdGhlIHN0cmluZyB0byB0aGUgTENECiAgIGRlbGF5KDEwMDApOyAvL2RlbGF5IDEwMDAgbXMgdG8gdmlldyBjaGFuZ2UKfSAvL3JlcGVhdCBmb3JldmVyCjwvcHJlPgrssLgg7Im97KOgPyA9MzMiO3M6MTA6InBvc3RfdGl0bGUiO3M6MjA6IkNMQ0QgMS8zIC0gSGVsbG8gTENEIjt9fQ==";}'
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

  * <font><a href="http://www.devicemart.co.kr/mart7/mall.php?cat=003012001&query=view&no=9601" target="_blank" rel="noopener"><font class="Blink">HY-1602H-205</font></a><font class="Blink"> (디바이스마트 판매 페이지 링크)</font></font>

<!--more-->

**1. 연결 준비**  
CLCD가 8 혹은 4비트 데이타 버스를 가진다고는 알고 있었는데, 전원/제어 선까지 합치니 14pin이네요.

HY-1602H-205의 경우 핀헤더가 2열이라 2&#215;7 소켓과 남는 IDE케이블을 재료로 선을 준비했습니다. (핀 헤더가 1열로 된 녀석이 작업하기 좀 더 편할 것 같습니다.)  
<img loading="lazy" src="https://homin.dev/asset/blog/2008/08/hy1602_pin.jpg" alt="hy1602_pin.jpg" class="imageframe" width="420" height="280" /> 

> 핀헤더가 바싹 붙어 있어 검은 표시한 1번 선의 위치가 반대가 되었습니다. -,.-;
> 
> 아두이노쪽 핀은 혼돈을 덜기 위해 기능에 따라 분리했습니다. 왼쪽 부터:
> 
> **5V/GND, 컨트라스트,? RS/RW/EN, 데이타 8bit**

**2. 전원/백라이트 연결**  
<img loading="lazy" src="https://homin.dev/asset/blog/2008/08/hy1602_pwron.jpg" alt="hy1602_pwron.jpg" class="imageframe" width="420" height="280" /> 

전원/콘트라스트/백라이트를 5V/GND에 연결해 보았습니다. **<font color="#ff0000">몇 가지 문제가 있네요!!</font>**

  * 컨트라스트를 GND에 직결하니 위 사진과 같이 항상 검은색으로 가려져 보이는 문제가 있어 가변저항을 달아 주었습니다. 적당한 저항값은 그때 그때 달라요.
  * 사진 처럼 백라이트에 5V를 바로 넣어면 레귤레이터(7805)가 급격히 뜨거워 집니다. 이 이유와 해결 방법은 따로 포스팅 하겠습니다. 일단 사진찍고 빼 두었습니다. 주간에는 백라이트 없이도 글자가 보입니다.

**3. 아두이노에 연결!**  
<img loading="lazy" src="https://homin.dev/asset/blog/2008/08/hy1602_helloworld.jpg" alt="hy1602_helloworld.jpg" class="imageframe" width="420" height="280" /> 

다행히 CLCD용 아두이노 라이브러는 이미 있었습니다. <a href="http://www.arduino.cc/en/Tutorial/LCDLibrary" target="_blank" rel="noopener">Arduino &#8211; LCDLibrary </a>

> 오~ 라이브러리~

그런데, 한 줄 밖에 표시 안되는 문제와 작명 센스가 맘에 안들고, 지저분 한 데다가, 불필요한 것들을 이것 저것 인클루드 해서 덩치를 키워 뒀길래, 입맛에 맞게 리팩토링 했습니다. -,.-;;

  * **<a href="https://homin.dev/svn/ArduinoLibraries/CLCD/" target="_blank" rel="noopener"><strong>CLCD Library for Arduino (SVN)</strong></a>**

이것 저것 명령어들이 많지만 싹 지우고 다시 써도 눈에 띌 만큼 느리지 않기 때문에, 라이브러리에서 clear, putStr 함수만 사용하면 CLCD를 다룰 수 있었습니다.

아래는 이 라이브러리를 사용한 예제 입니다. 1초 단위로 &#8220;Hello!\nWorld!!&#8221;를 깜박입니다.

<pre lang="c">#include &lt;clcd.h>
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
</pre>

참 쉽죠? =33