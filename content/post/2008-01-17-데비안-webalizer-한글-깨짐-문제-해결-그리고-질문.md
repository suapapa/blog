---
title: 데비안 webalizer 한글 깨짐 해결
author: suapapa
type: post
date: 2008-01-17T01:38:17+00:00
url: /p=19
translations:
  - 'a:1:{i:0;s:1632:"YToxOntzOjI6ImtvIjthOjM6e3M6MTE6InBvc3RfZXhjZXB0IjtzOjA6IiI7czoxMjoicG9zdF9jb250ZW50IjtzOjEwODE6IuuNsOu5hOyViOyXkOyEnCB3ZWJhbGl6ZXLsnZgg7ZWc6riAIOq5qOynkCDtmITsg4HsnYQg6rK97ZeY7ZWY7JesIOqygOyDieydhCDtlbQg67O064uIIOustOyymSDsmKTrnpgg65CcIOusuOygnOuEpOyalC4KCuyLnOyKpO2FnOydtOuCmCDslYTtjIzsuZjsnZgg7J247L2U65Sp7J20IOusuOygnOuLpCDrnbzrjZjrjbAuLi4g7JWE64uZ64uI64ukLgpldWMta3IsIHV0Zi047J2YIOqwgeqwgeydmCDrjbDruYTslYjsl5DshJwg7J286rSE7KCB7Jy866GcIOq5qOynkeuLiOuLpC4gLV8tKwoKPCEtLW1vcmUtLT4g6re4656Y7IScLCDrjbDruYTslYgg7Y6Y7YKk7KeA7JWI7J2YIHdlYmFsaXplci5tb+ulvCBtc2d1bmZtdCDtlbTshJwg7IK07Y6067O064uILCDrrLjqtawg7Lm07YOI66Gc6re4IO2MjOydvOydmCDtlZzquIAg7J247L2U65Sp7J2AIENQOTQ566GcIOuQmOyWtOyeiOuKlOuNsCDtl6TrjZQoQ29udGVudC1UeXBlKeyXkOuKlCBJU08tODg1OS0x7Jy866GcIOuQmOyWtOyeiOuKlOqyjCDsm5DsnbjsnbTsl4jsirXri4jri6QuCgpidWdyZXBvcnTrpbwg7Ya17ZW0IDxhIGhyZWY9JnF1b3Q7aHR0cDovL2J1Z3MuZGViaWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTQ2MTE3NiZxdW90Oz7rjbDruYTslYgg67KE6re4IOumrOyKpO2KuOyXkCDrk7HroZ3tlbQgPC9hPuuRkOyXiOyKteuLiOuLpC4KCuq4ie2VmOyLoCDrtoTsnYAg64uk7J2M6rO8IOqwmeydtCDsoIHsmqntlZjshLjsmpQuCjxhIGhyZWY9JnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wMS93ZWJhbGl6ZXIuemlwJnF1b3Q7IHRpdGxlPSZxdW90O3dlYmFsaXplci56aXAmcXVvdDs+d2ViYWxpemVyLnppcDwvYT7snYQg7JWV7LaV7ZKA7Ja0IOyVhOuemOydmCDsnITsuZjsl5Ag642u7Ja0IOyUgeuLiOuLpC4KPHN0cm9uZz4vdXNyL3NoYXJlL2xvY2FsZS9rby9MQ19NRVNTQUdFUy93ZWJhbGl6ZXIubW88L3N0cm9uZz4KCndlYmFsaXplcuulvCDsi6TtlontlbQg67O066m0IOusuOq1rOuTpOydtCDtlZzquIDroZwg7J6YIOuCmOyYpOuKlOqyjCDrs7TsnoXri4jri6QuCgrsmrDsmZXjhYvqtbPjhYsiO3M6MTA6InBvc3RfdGl0bGUiO3M6NDA6IuuNsOu5hOyViCB3ZWJhbGl6ZXIg7ZWc6riAIOq5qOynkCDtlbTqsrAiO319";}'
dsq_thread_id:
  - 722489485
categories:
  - Linux
tags:
  - 데비안
  - 한글
  - 홈서버

---
데비안에서 webalizer의 한글 깨짐 현상을 경험하여 검색을 해 보니 무척 오래 된 문제네요.

시스템이나 아파치의 인코딩이 문제다 라던데&#8230; 아닙니다.  
euc-kr, utf-8의 각각의 데비안에서 일괄적으로 깨집니다. -_-+

<!--more--> 그래서, 데비안 페키지안의 webalizer.mo를 msgunfmt 해서 살펴보니, 문구 카탈로그 파일의 한글 인코딩은 CP949로 되어있는데 헤더(Content-Type)에는 ISO-8859-1으로 되어있는게 원인이었습니다.

bugreport를 통해 [데비안 버그 리스트에 등록해][1] 두었습니다.

급하신 분은 다음과 같이 적용하세요.  
[webalizer.zip][2]을 압축풀어 아래의 위치에 덮어 씁니다.  
**/usr/share/locale/ko/LC_MESSAGES/webalizer.mo**

webalizer를 실행해 보면 문구들이 한글로 잘 나오는게 보입니다.

우왕ㅋ굳ㅋ

 [1]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=461176
 [2]: https://homin.dev/asset/blog/2008/01/webalizer.zip "webalizer.zip"