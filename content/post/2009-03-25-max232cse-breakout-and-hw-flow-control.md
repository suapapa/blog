---
title: MAX232cse breakout and HW flow control
author: suapapa
type: post
date: 2009-03-25T09:41:13+00:00
url: /p=260
dsq_thread_id:
  - 728538030
translations:
  - 'a:1:{i:0;s:6372:"YToxOntzOjI6ImtvIjthOjI6e3M6MTI6InBvc3RfY29udGVudCI7czo0NjYyOiI8cD7snbzsoITsl5Ag66eM65OgIEZUMjMyUkwgYnJlYWtvdXTsnLzroZwgTkVNTzEw7J2YIOyLnOumrOyWvCDsvZjshpTsnYQg7Jew6rKw7ZW0IOuztOuLiCDslYTrrLTrnpjrj4Qg7Ya1IOuQmOyngCDslYrrjZTqtbDsmpQuIOybkOyduOydgCBORU1PMTDsnZgg7Iuc66as7Ja8IOy9mOyGlOydtCBIV+2dkOumhOygnOyWtOulvCDsgqzsmqntlZjquLAg65WM66y47J207JeI7Iq164uI64ukLjwvcD4NCjxwPkhX7Z2Q66aE7KCc7Ja064qUIOyLnOumrOyWvCDtj6ztirjsnZggUlRTL0NUUyDrpbwg7LaU6rCA66GcIOyCrOyaqe2VmOyXrCDtnZDrpoTsoJzslrTrpbwg7ZWc64uk64qUIOqyg+ycvOuhnCwg6re465+s6rOgIOuztOuLiCBGVDIzMlJM7JeQ64+EIOydtCDsnbTrpoTsnZgg65GQIO2VgOydtCDsnojsl4jsp4Drp4wg7Jew6rKw65CY7KeAIOyViuydgCDsg4Htg5zsmIDso6AuIOu5hOyLvCBGVDIzMlJM7J2EIOuLpOyLnCDsgqzripDri4gg7J20IOq4sO2ajOyXkCBNQVgyMzLsuansnYQg7I2oIOuztOqzoCDsi7bslrQgTUFYMjMyIGJyZWFrb3V07J2EIOunjOuTpOyWtCDrtKTsirXri4jri6QuPC9wPg0KPHA+PGltZyBoZWlnaHQ9XFwmcXVvdDsyODBcXCZxdW90OyB3aWR0aD1cXCZxdW90OzQyMFxcJnF1b3Q7IHNyYz1cXCZxdW90Oy93b3JkcHJlc3Mvd3AtY29udGVudC91cGxvYWRzL2ltYWdlL01BWDIzMkNTRV9icmVha291dF90LmpwZ1xcJnF1b3Q7IGFsdD1cXCZxdW90O1xcJnF1b3Q7IC8+PC9wPg0KPHVsPg0KICAgIDxsaT48YSBocmVmPVxcJnF1b3Q7aHR0cDovL3dlYi5zdWFwYXBhLm5ldDo4MDgwL3N2bi9IVy9icmVha291dC9tYXgyMzJfYnJlYWtvdXRcXCZxdW90Oz48c3Ryb25nPu2ajOuhnOuPhCAmYW1wOyDslYTtirjsm4ztgawgKEVhZ2xlQ2FkKSDri6TsmrTroZzrk5w8L3N0cm9uZz48L2E+PC9saT4NCjwvdWw+DQo8cD48IS0tbW9yZS0tPk1BWDIzMuuKlCDsi5zrpqzslrzsnZgg7KCE7JyEKCstIDEyVinrpbwgVFRMIOugiOuyqOuhnCDrp57strDso7zripQg67OA7ZmY6riwIOyeheuLiOuLpC4g7J20IOy5qeydgCDri6jsiJztnogg7J20IOyghOychCDrs4DtmZjrp4zsnYQg7ZWY64qUIOy5qSDsnoXri4jri6Trp4wg7Iuc66as7Ja8IO2PrO2KuOulvCDsgqzsmqntlZjripQg6rOz7JeQ64qUIOqxsOydmCDslrTquYDsl4bsnbQg7IKs7Jqp65CY6riwIOuVjOusuOyXkCDsi5zrpqzslrzsuansnLzroZwg7JWM66Ck7KC4IOyeiOyWtCDtmLzrnoDsnZgg7Jes7KeA6rCAIOyeiOyjoC48L3A+DQo8cD5NQVgyMzLsl5DripQg7J6F66ClIOyghOychOuzgO2ZmCAy7LGE64SQIOy2nOugpSDsoITsnITrs4DtmZggMuyxhOuEkOydtCDsnojqs6AsIOyduO2EsOuEt+yXkCDqtaztlaAg7IiYIOyeiOuKlCDrjIDrtoDrtoTsnZgg7ZqM66Gc65Ok7J20IOydtCDspJEg7ZWc7IyN66eM7J2EIFJYL1RY7JeQIOyCrOyaqe2VmOqzoCDsnojsirXri4jri6QuIOyZnCDqsbDsnZgg7JOw7J207KeA64+EIOyViuuKlCDsl6zrtoTsnZgg7ZWc7IyN7J2YIOyxhOuEkOydtCDsnojrgpgg7ZaI64qU642wLCDrsJTroZwgSFcg7Z2Q66aE7KCc7Ja07JqpIFJUUy9DVFPrpbwg7JyE7ZWo7J207JeI64Sk7JqULjwvcD4NCjxibG9ja3F1b3RlPg0KPHA+66y866GgLCDsnbQg7Jes67aE7J2YIOyxhOuEkOydhCDri6Trpbgg7Iuc66as7Ja8IO2PrO2KuOydmCBSWC9UWOulvCDsnITtlZwg67OA7ZmY6riw66GcIOyCrOyaqe2VoCDsiJjrj4Qg7J6I7Iq164uI64ukLjwvcD4NCjwvYmxvY2txdW90ZT4NCjxwPuyYiOyghOyXkCA8YSBocmVmPVxcJnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wNy9hcmR1aW5vYmtfc2tldGNoX2xvYWRpbmcuanBnXFwmcXVvdDs+VFLroZwg66eM65Ok7Ja0IOuzuCDsi5zrpqzslrwg7ZqM66GcPC9hPuyXkCDruYTqtZDtlbQg67O866m0IC3ssLgg7Im96rKM64+ELSDri6jsp4Ag7LqQ7Yyo7Iuc7YSwIDXqsJzrp4zsnYQg7IKs7Jqp7ZWY7JesIOuqqOuToCDqtazshLHsnbQg64Gd64Ko7J2EIOyVjCDsiJgg7J6I7Iq164uI64ukLiDrjZXrtoTsl5Ag7YGs6riw64+EIOunjuydtCDspITslrTrk6Tso6AuPC9wPg0KPHA+7J20IOy5qSDrmJDtlZwsIOuLpOuluCDsnKDrqoXtlZwgSUPrk6Qg7LKY65+8IOuLpOyWke2VnCDsooXrpZjqsIAg7J6I6rOgIOydtOuTpOydmCDssKjsnbTripQg7Yyo7YKk7KeV6rO8IOy6kO2MqOyLnO2EsOuTpOydmCDqsJIg7J6F64uI64ukLjwvcD4NCjxwPuyXrOq4sOyEnCDsgqzsmqntlZwgTUFYMjMyY3Nl64qUIDF1RuydmCDsupDtjKjsi5zthLDrk6TsnbQg7IKs7Jqp65CY66mwIHNtZCDtjKjtgqTsp5XsnoXri4jri6QuPC9wPg0KPHA+PGltZyBoZWlnaHQ9XFwmcXVvdDsyODBcXCZxdW90OyB3aWR0aD1cXCZxdW90OzQyMFxcJnF1b3Q7IHNyYz1cXCZxdW90Oy93b3JkcHJlc3Mvd3AtY29udGVudC91cGxvYWRzL2ltYWdlL01BWDIzMkNTRV9icmVha291dF9iLmpwZ1xcJnF1b3Q7IGFsdD1cXCZxdW90O1xcJnF1b3Q7IC8+PC9wPg0KPHA+7J2066CH6rKMIOuSt+uptOyXkCDrk6TslrTqsJTsirXri4jri6QuIFNNRO2MqO2CpOynleydtOyngOunjCDri6TrpqzsnZgg7IKs7J206rCAIOyigeyngCDslYrslYQgU01E66W8IOyymOydjCDsoJHtlZjripQg7Jqp64+E66Gc64+EIOycoOyaqe2VqeuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPlNNROyXkCDjhLfjhLfjhLcg65ao642YIOyggOuPhCDrqofrsogg7ZW0IOuztOuLiCDsnbQg7KCV64+E64qUIOuEiOustCDsib3rhKTsmpQuIOqyjOuLpOqwgCDqtazrqY3snYQg65qr7J2EIO2VhOyalOqwgCDsl4bri6TripQg6rKD64+EIC3tlLzrtoDroZwg7JmAIOuLq+uKlC0g7JeE7LKt64KcIOyepeygkOyeheuLiOuLpC48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7qt7jrn7wsIOuLpOydjOydgCDsi5zrpqzslrwg7L2Y7IaU7JeQIOyCrOyaqe2VoCDshoztlITtirjsm6jslrQg7J6F64uI64ukLiDstpTslrXsho3snZggJnF1b3Q77J207JW86riwJnF1b3Q7LCAmcXVvdDvsg4jroazrjbDsnbTtg4Drp6gmcXVvdDsg6rCZ7J2AIO2UhOuhnOq3uOueqOydtCDtlYTsmpTtlZjqs6Ag7LWc6re87JeQ64+EIOyLnOumrOyWvCDsvZjshpTsmqnsnLzroZwg7J20IO2UhOuhnOq3uOueqOuTpOydhCDsk7DripQg67aE7J2EIOuzuCDsoIHrj4Qg7J6I7Iq164uI64uk66eMLi4uIOyggOuKlCA8YSBocmVmPVxcJnF1b3Q7aHR0cDovL3d3dy5jaGlhcmsuZ3JlZW5lbmQub3JnLnVrL35zZ3RhdGhhbS9wdXR0eS9cXCZxdW90Oz5QdVRUWTwvYT7rpbwg7IKs7Jqp7ZWY6rOgIOyeiOyKteuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPuumrOuIheyKpOyXkOyEnOuKlCBtaW5pY29t7J2EIOyUgeuLiOuLpOunjC4gbWluaWNvbeydhCDsk7Dsi6Qg7KCV64+E7J2YIOu2hOuTpOydtOudvOuptCDsnbQg67CR7J2YIOyEpOuqheydgCDrqqjrkZAg7ZWE7JqUIOyXhuycvOyLpCDqsoMg6rCZ7Iq164uI64ukLiA6KTwvcD4NCjwvYmxvY2txdW90ZT4NCjxwPlB1VFRZ64qUIOyciOuPhOyaqSDtkZzspIAgU1NIIO2BtOudvOydtOyWuO2KuCDsnoXri4jri6QuIOyekOycoOyGjO2UhO2KuOybqOyWtCDsnbTrqbAsIC3sl6zsoITtnogg6rSA66as65CY6rOgIOyeiOuKlC0g7IK07JWE7J6I64qUIO2UhOuhnOygne2KuCDsnoXri4jri6QhPC9wPg0KPHA+6rSA64yA7ZWcIFB1VFRZ64qUIFNTSOu/kCDslYTri4jrnbwgVGVsbmV06rO8IFNlcmlhbCDsl7DqsrDrj4Qg7KeA7JuQ7ZWY66mwIOyduO2EsO2OmOydtOyKpOqwgCDsooAg7IOd7IaM7ZWY7KeA66eMLCDtlZzrsogg7J217ZiA65GQ66m0IOuLpOyWke2VnCDthLDrr7jrhJDsnYQg6rCZ7J2AIOyduO2EsO2OmOydtOyKpOuhnCDsgqzsmqntlaAg7IiYIOyeiOuLpOuKlCDqsoPsnbQg7J6l7KCQ7J207KOgLjwvcD4NCjxwPlB1VFRZ7JeQ7IScIOyLnOumrOyWvCDtlZjrk5zsm6jslrQg7Z2Q66aE7KCc7Ja066W8IOyEpOygle2VmOugpOuptCDri6TsnYwg7J2066+47KeAIOyymOufvCAmcXVvdDtSVFMvQ1RTJnF1b3Q766W8IOyEoO2Dne2VmOuptCDrkKnri4jri6QuPC9wPg0KPHA+PGltZyBoZWlnaHQ9XFwmcXVvdDs0MDdcXCZxdW90OyB3aWR0aD1cXCZxdW90OzQyMFxcJnF1b3Q7IHNyYz1cXCZxdW90Oy93b3JkcHJlc3Mvd3AtY29udGVudC91cGxvYWRzL2ltYWdlL3B1dHR5X3NlcmlhbF9IV19mbG93X2NvbnRyb2wucG5nXFwmcXVvdDsgYWx0PVxcJnF1b3Q7XFwmcXVvdDsgLz48L3A+DQo8YmxvY2txdW90ZT4NCjxwPjxzdHJvbmc+7J6QfiDsl6zquLDquYzsp4Ag66qo65GQIO2bvOydtO2BrOqzoCEhISE8YnIgLz4NCjwvc3Ryb25nPjwvcD4NCjxwPjxzdHJvbmc+7IKs7IukIFJUUy9DVFPrpbwg7Jew6rKw7ZWY7KeAIOyViuqzoOuPhCBIVyDtnZDrpoTsoJzslrQg7J6l7LmY7JeQIOyXsOqysO2VmOuKlCDrsKnrspXsnbQg7J6I7JeI7Iq164uI64ukITwvc3Ryb25nPjwvcD4NCjwvYmxvY2txdW90ZT4NCjxwPuyduO2EsOuEt+yXkOyEnCDssL7snYTsiJgg7J6I64qUIOyLnOumrOyWvCDrs4DtmZgg7Lmp65Ok7J2YIOyWtO2UjOumrOy8gOydtOyFmOyXkOyEnCBSVFMvQ1RT6rCAIOuMgOu2gOu2hCDruYTslrQg7J6I64qUIOydtOycoOqwgCDrsJTroZwg7J20IOuVjOusuOydtOyjoC4g44WO44WO44WOPC9wPg0KPHA+6re465+8LCDrsKnrspXsnYAg64uk7J2MIO2PrOyKpO2KuOyXkOyEnC4uLjwvcD4iO3M6MTA6InBvc3RfdGl0bGUiO3M6Mzg6Ik1BWDIzMmNzZSBicmVha291dCBhbmQgSFcgZmxvdyBjb250cm9sIjt9fQ==";}'
categories:
  - MyProject
tags:
  - EagleCad
  - max232
  - NEMO10
  - PuTTY
  - 뻥이야
  - 시리얼
  - 전자회로

---
일전에 만든 FT232RL breakout으로 NEMO10의 시리얼 콘솔을 연결해 보니 아무래도 통 되지 않더군요. 원인은 NEMO10의 시리얼 콘솔이 HW흐름제어를 사용하기 때문이었습니다.

HW흐름제어는 시리얼 포트의 RTS/CTS 를 추가로 사용하여 흐름제어를 한다는 것으로, 그러고 보니 FT232RL에도 이 이름의 두 핀이 있었지만 연결되지 않은 상태였죠. 비싼 FT232RL을 다시 사느니 이 기회에 MAX232칩을 써 보고 싶어 MAX232 breakout을 만들어 봤습니다.

![](https://homin.dev/asset/blog/image/MAX232CSE_breakout_t.jpg)

  * [**회로도 & 아트워크 (EagleCad) 다운로드**][1]

MAX232는 시리얼의 전위(+- 12V)를 TTL 레벨로 맞춰주는 변환기 입니다. 이 칩은 단순히 이 전위 변환만을 하는 칩 입니다만 시리얼 포트를 사용하는 곳에는 거의 어김없이 사용되기 때문에 시리얼칩으로 알려져 있어 혼란의 여지가 있죠.

MAX232에는 입력 전위변환 2채널 출력 전위변환 2채널이 있고, 인터넷에 구할 수 있는 대부분의 회로들이 이 중 한쌍만을 RX/TX에 사용하고 있습니다. 왜 거의 쓰이지도 않는 여분의 한쌍의 채널이 있나 했는데, 바로 HW 흐름제어용 RTS/CTS를 위함이었네요.

> 물론, 이 여분의 채널을 다른 시리얼 포트의 RX/TX를 위한 변환기로 사용할 수도 있습니다.

예전에 [TR로 만들어 본 시리얼 회로][2]에 비교해 볼면 -참 쉽게도- 단지 캐패시터 5개만을 사용하여 모든 구성이 끝남을 알 수 있습니다. 덕분에 크기도 많이 줄어들죠.

이 칩 또한, 다른 유명한 IC들 처럼 다양한 종류가 있고 이들의 차이는 패키징과 캐패시터들의 값 입니다.

여기서 사용한 MAX232cse는 1uF의 캐패시터들이 사용되며 smd 패키징입니다.

![](https://homin.dev/asset/blog/image/MAX232CSE_breakout_b.jpg)

이렇게 뒷면에 들어갔습니다. SMD패키징이지만 다리의 사이가 좁지 않아 SMD를 처음 접하는 용도로도 유용합니다.

> SMD에 ㄷㄷㄷ 떨던 저도 몇번 해 보니 이 정도는 너무 쉽네요. 게다가 구멍을 뚫을 필요가 없다는 것도 -피부로 와 닫는- 엄청난 장점입니다.

그럼, 다음은 시리얼 콘솔에 사용할 소프트웨어 입니다. 추억속의 "이야기", "새롬데이타맨" 같은 프로그램이 필요하고 최근에도 시리얼 콘솔용으로 이 프로그램들을 쓰는 분을 본 적도 있습니다만&#8230; 저는 [PuTTY][3]를 사용하고 있습니다.

> 리눅스에서는 minicom을 씁니다만. minicom을 쓰실 정도의 분들이라면 이 밑의 설명은 모두 필요 없으실 것 같습니다. 🙂

PuTTY는 윈도용 표준 SSH 클라이언트 입니다. 자유소프트웨어 이며, -여전히 관리되고 있는- 살아있는 프로젝트 입니다!

관대한 PuTTY는 SSH뿐 아니라 Telnet과 Serial 연결도 지원하며 인터페이스가 좀 생소하지만, 한번 익혀두면 다양한 터미널을 같은 인터페이스로 사용할 수 있다는 것이 장점이죠.

PuTTY에서 시리얼 하드웨어 흐름제어를 설정하려면 다음 이미지 처럼 "RTS/CTS"를 선택하면 됩니다.

![](https://homin.dev/asset/blog/image/putty_serial_HW_flow_control.png)

> **자~ 여기까지 모두 훼이크고!!!!  
>** 
> 
> **사실 RTS/CTS를 연결하지 않고도 HW 흐름제어 장치에 연결하는 방법이 있었습니다!**

인터넷에서 찾을수 있는 시리얼 변환 칩들의 RTS/CTS가 대부분 비어 있는 이유가 바로 이 때문이죠. ㅎㅎㅎ

그럼, 방법은 다음 포스트에서&#8230;

 [1]: https://homin.dev/svn/HW/breakout/max232_breakout
 [2]: https://homin.dev/asset/blog/2008/07/arduinobk_sketch_loading.jpg
 [3]: http://www.chiark.greenend.org.uk/~sgtatham/putty/