---
title: WebCam(SN9C201) with Ubuntu
author: suapapa
type: post
date: 2008-04-25T16:33:41+00:00
url: /p=58
translations:
  - 'a:1:{i:0;s:4248:"YToxOntzOjI6ImtvIjthOjM6e3M6MTE6InBvc3RfZXhjZXB0IjtzOjA6IiI7czoxMjoicG9zdF9jb250ZW50IjtzOjMwNTU6IuyasOumrOuCmOudvOyXkOyEnCDrpqzriIXsiqTsl5DshJwg7J6YIOuPjOyVhOqwgOuKlCBXZWJDYW0o7ZmU7IOB7LqgKeydhCDqtazsnoXtlZjripQg6rKD7J2AIOyJrOyatCDsnbzsnbQg7JWE64uZ64uI64ukLgoK6rKA7IOJ7ZW0IOuztOuptCDrpqzriIXsiqTsl5DshJwg7J6YIOuPmeyeke2VmOuKlCDsuqDsnZggQ2hpcHNldCDrpqzsiqTtirjrpbwg6rWs7ZWgIOyImCDsnojsp4Drp4wsIOq1reuCtOyXkOyEoCDsuqDsl5Ag7IKs7Jqp65CcIENoaXBzZXTsnYQg7ZGc6riw7ZWY7KeAIOyViuuKlCDqsoPsnYAg64u57Jew7ZWY6rOgLCDrqqjrjbjrqoUg65iQ7ZWcIOuLrOudvOyEnCDrr7jrpqwg6rKA7IOJ7ZW064+EIO2ZleyduO2VoCDsiJjqsIAg7JeG7KOgLgo8YmxvY2txdW90ZT7spokhIOu9keq4sCEhPC9ibG9ja3F1b3RlPgrrhKQuLi4g672R6riw7JeQIOyGjOyniOydtOyXhuyWtOyEnC4uLiDrmJAg6r2dIOu9keyVhOyKteuLiOuLpC4gLV8tOzsKPGltZyB2c3BhY2U9JnF1b3Q7NSZxdW90OyBhbGlnbj0mcXVvdDttaWRkbGUmcXVvdDsgd2lkdGg9JnF1b3Q7MjAwJnF1b3Q7IHNyYz0mcXVvdDsvd29yZHByZXNzL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDA4LzA0L3NuOWMyMDFvbnVidW50dS5qcGcmcXVvdDsgaHNwYWNlPSZxdW90OzUmcXVvdDsgYWx0PSZxdW90O3NuOWMyMDFvbnVidW50dS5qcGcmcXVvdDsgaGVpZ2h0PSZxdW90OzI2NyZxdW90OyAvPgoKPCEtLW1vcmUtLT4KCuyggCDrqYvsp4DqtazrpqztlZwg67iM65287LyT6rO8IOy5tOuzuCDrrLTriqwg6re466as6rOgIC3sgqzsp4Tsl5Qg67mg7KeELSDrp53sm5Ag66CM7KaIIO2PrO2VqCEh7J2YIO2ZlOugpO2VnCDqtazshLHsl5Ag6rCA6rKp64+EIOyggOugtO2VtCDqtazsnoXtlZjqsowg65CcIOydtCDrhYDshJ3snYAgPHN0cm9uZz5NaWNyb2RpYSBTTjlDMjAxPC9zdHJvbmc+7Lmp7IWL7J2EIOyCrOyaqe2VnCDspJHqta3sgrAg7Ju57Lqg7J6F64uI64ukLgoK7Lmp7IWL66qF7J2AIOuPmeu0ieuQmOyWtCDsmKgg7JyI64+EIOuTnOudvOydtOuyhOydmCDsnbTrpoTsnYQg67O06rOgIOyVjOyVmOqzoCwg6rWs7J6FIOuLueyLnCDqsoDsg4ntlbQg67O064uILCDrpqzriIXsiqQg65Oc65287J2067KE6rCAIOyXhuuNlOq1sOyalC4KCjHrhYQg7K+kIOuwqey5mO2VmOuLpOqwgCwg7Jqw67aE7YisIO2PrOufvOyXkOyEnCA8YSBocmVmPSZxdW90O2h0dHA6Ly93d3cudWJ1bnR1Lm9yLmtyL3ZpZXd0b3BpYy5waHA/Zj05JmFtcDt0PTExOCZxdW90Oz5pc3VyaXTri5jsnZgg7LqgIOy5tOuplOudvCDshKTsuZjquLA8L2E+66W8IOuztOqzoCDsnpDqt7nrsJvslYQg64uk7IucIOyEpOy5mOulvCDsi5zrj4TtlbQg67Sk7Iq164uI64ukLgo8YmxvY2txdW90ZT7qsrDroaAg67aA7YSwIOunkOyUgOuTnOumrOuptC4uIOyEpOy5mCDshLHqs7UhIOyemCDrj5nsnpHtlanri4jri6QuPC9ibG9ja3F1b3RlPgox64WE7J2066m0IOyasOu2hO2IrCBMVFPrj4Qg67OA7ZWc64uk6rOgLCDri6Tsi5wg6rKA7IOJ7ZWcIOqysOqzvC4uLgoKPHN0cmlrZT48YSB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7IGhyZWY9JnF1b3Q7aHR0cDovL3d3dy5saW51eC1wcm9qZWN0cy5vcmcvbW9kdWxlcy9teWRvd25sb2Fkcy92aWV3Y2F0LnBocD9jaWQ9NyZxdW90Oz7snbQg66eB7YGsPC9hPuyXkOyEnCDsmrDrtoTtiKzsmqkg65Oc65287J2067KE66W8IO2MqO2CpOyngOuhnCDsoJzqs7XtlZjripQg6rKD7J2EIOuwnOqyrO2WiOyKteuLiOuLpC48L3N0cmlrZT4KCjxzdHJpa2U+64uk66eMIDcuMDTsmqkg65Oc65287J2067KE64qUIOqzteynnCwgNy4xMCDrk5zrnbzsnbTrsoTripQgJDfrpbwg64K07JW8IOustOygnO2VnOycvOuhnCDsgqzsmqkg6rCA64qlLiDshozsiqTripQg7KCc6rO17ZWY7KeAIOyViuuKlOuLpOqzoCDtlZjrhKTsmpQuIOydtOufsC4uIOq8rOuhrO2VnCDsiZDrgbwuIOy6oOydhCDsg4jroZwg7IKs64+EICQ3IOuptCDrkJjqsqDri6QhITwvc3RyaWtlPgoK6rCZ7J2AIOusuOygnOulvCDtlbTqsrDtlZjquLAg7JyE7ZW0IOuqqOyduCA8YSB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7IGhyZWY9JnF1b3Q7aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9ncm91cC9taWNyb2RpYSZxdW90Oz7qtazquIAg6re466O5IE1pY3JvZGlhPC9hPiDsnYQg7LC+7JWY7Iq164uI64ukLiDqt7jqs7PsnZgg7IaM6rCc6riAIOykkSDsnbzrtoDrpbwg65a8IOyZlOyKteuLiOuLpC4KPGJsb2NrcXVvdGU+PGVtPjxzdHJvbmc+Li4ueW91IGNhbiBrZWVwIHdhaXRpbmcsIGhvcGluZywgcHJheWluZyBieSB5b3VyIGJlZHNpZGUgdGhhdCBzb21lb25lIHdpbGwgYWRkIHN1cHBvcnQgZm9yIHlvdXIgd2ViY2FtLDwvc3Ryb25nPjwvZW0+Cgo8ZW0+PHN0cm9uZz53ZSBzaW1wbHkgb2ZmZXIgeW91IHRoZSBjaG9pY2Ugb2YgdGhlICZxdW90O1JFRCBQSUxMJnF1b3Q7PC9zdHJvbmc+PC9lbT48L2Jsb2NrcXVvdGU+CuuEpCDsnbTqs7Psl5DshKAgPHN0cmlrZT7rqZTtirjrpq3siqTrpbwg67KX7Ja064KY64qUIOuwqeuylTwvc3RyaWtlPiBTTjlDMjAx7J2EIOychO2VnCAt7J6R7JeF7KSR7J24LSDrk5zrnbzsnbTrsoTrpbwg7KCc6rO17ZWY6rOgIOyeiOyKteuLiOuLpC4g7J20IOuTnOudvOydtOuyhOydmCDshKTsuZgg67Cp67KV7J2AIOygnCDsnITtgqTsl5Drj4Qg64uk7IucIOygleumrO2VtCDrkZDsl4jsirXri4jri6QuIDxhIHRhcmdldD0mcXVvdDtfYmxhbmsmcXVvdDsgaHJlZj0mcXVvdDtodHRwOi8vd2ViLnN1YXBhcGEubmV0OjgwODAvd2lraS9XZWJDYW0mcXVvdDs+7Jes6riwPC9hPgoKY2Ftb3JhbWEg66W8IOyEpOy5mO2VmOqzoCDsi6Ttlokg7ZW0IOu0heuLiOuLpC4g7Kec7J6UfiEhCgo8aW1nIHdpZHRoPSZxdW90OzMxNSZxdW90OyBzcmM9JnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wNC9zbjljMjAxX2luX2FjdGlvbi5qcGcmcXVvdDsgYWx0PSZxdW90O3NuOWMyMDFfaW5fYWN0aW9uLmpwZyZxdW90OyBoZWlnaHQ9JnF1b3Q7NDIwJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgLz4iO3M6MTA6InBvc3RfdGl0bGUiO3M6Mjc6IldlYkNhbShTTjlDMjAxKSB3aXRoIFVidW50dSI7fX0=";}'
dsq_thread_id:
  - 741440060
categories:
  - Linux
tags:
  - 우분투

---
우리나라에서 리눅스에서 잘 돌아가는 WebCam(화상캠)을 구입하는 것은 쉬운 일이 아닙니다.

검색해 보면 리눅스에서 잘 동작하는 캠의 Chipset 리스트를 구할 수 있지만, 국내에선 캠에 사용된 Chipset을 표기하지 않는 것은 당연하고, 모델명 또한 달라서 미리 검색해도 확인할 수가 없죠.

> 즉! 뽑기!!

네&#8230; 뽑기에 소질이없어서&#8230; 또 꽝 뽑아습니다. -_-;;  
<img vspace="5" align="middle" width="200" src="https://homin.dev/asset/blog/2008/04/sn9c201onubuntu.jpg" hspace="5" alt="sn9c201onubuntu.jpg" height="267" /> 

<!--more-->

저 멋지구리한 브라켓과 카본 무늬 그리고 -사진엔 빠진- 망원 렌즈 포함!!의 화려한 구성에 가격도 저렴해 구입하게 된 이 녀석은 **Microdia SN9C201**칩셋을 사용한 중국산 웹캠입니다.

칩셋명은 동봉되어 온 윈도 드라이버의 이름을 보고 알았고, 구입 당시 검색해 보니, 리눅스 드라이버가 없더군요.

1년 쯤 방치하다가, 우분투 포럼에서 [isurit님의 캠 카메라 설치기][1]를 보고 자극받아 다시 설치를 시도해 봤습니다.

> 결론 부터 말씀드리면.. 설치 성공! 잘 동작합니다.

1년이면 우분투 LTS도 변한다고, 다시 검색한 결과&#8230;

<strike><a target="_blank" href="http://www.linux-projects.org/modules/mydownloads/viewcat.php?cid=7" rel="noopener">이 링크</a>에서 우분투용 드라이버를 패키지로 제공하는 것을 발견했습니다.</strike>

<strike>다만 7.04용 드라이버는 공짜, 7.10 드라이버는 $7를 내야 무제한으로 사용 가능. 소스는 제공하지 않는다고 하네요. 이런.. 꼬롬한 쉐끼. 캠을 새로 사도 $7 면 되겠다!!</strike>

같은 문제를 해결하기 위해 모인 <a target="_blank" href="https://groups.google.com/group/microdia" rel="noopener">구글 그룹 Microdia</a> 을 찾았습니다. 그곳의 소개글 중 일부를 떼 왔습니다.

> _**&#8230;you can keep waiting, hoping, praying by your bedside that someone will add support for your webcam,**_
> 
> _**we simply offer you the choice of the &#8220;RED PILL&#8221;**_

네 이곳에선 <strike>메트릭스를 벗어나는 방법</strike> SN9C201을 위한 -작업중인- 드라이버를 제공하고 있습니다. 이 드라이버의 설치 방법은 제 위키에도 다시 정리해 두었습니다. <a target="_blank" href="https://homin.dev/wiki/WebCam" rel="noopener">여기</a>

camorama 를 설치하고 실행 해 봅니다. 짜잔~!!

<img width="315" src="https://homin.dev/asset/blog/2008/04/sn9c201_in_action.jpg" alt="sn9c201_in_action.jpg" height="420" class="imageframe" />

 [1]: http://www.ubuntu.or.kr/viewtopic.php?f=9&t=118