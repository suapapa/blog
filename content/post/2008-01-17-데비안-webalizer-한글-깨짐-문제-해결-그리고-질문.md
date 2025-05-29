---
title: 데비안 webalizer 한글 깨짐 해결
author: suapapa
type: post
date: 2008-01-17T01:38:17+00:00
url: /p=19
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

시스템이나 아파치의 인코딩이 문제다 라던데, 아닙니다.  
euc-kr, utf-8의 각각의 데비안에서 일괄적으로 깨집니다. -_-+

 그래서, 데비안 페키지안의 webalizer.mo를 msgunfmt 해서 살펴보니, 문구 카탈로그 파일의 한글 인코딩은 CP949로 되어있는데 헤더(Content-Type)에는 ISO-8859-1으로 되어있는게 원인이었습니다.

bugreport를 통해 [데비안 버그 리스트에 등록해][1] 두었습니다.

급하신 분은 다음과 같이 적용하세요.  
[webalizer.zip][2]을 압축풀어 아래의 위치에 덮어 씁니다.  
**/usr/share/locale/ko/LC_MESSAGES/webalizer.mo**

webalizer를 실행해 보면 문구들이 한글로 잘 나오는게 보입니다.

우왕ㅋ굳ㅋ

 [1]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=461176
 [2]: https://asset.homin.dev/blog/2008/01/webalizer.zip "webalizer.zip"