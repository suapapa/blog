---
title: 윈도에서도 ko-po-check 하기
author: suapapa
type: post
date: 2008-03-24T07:55:39+00:00
url: /p=41
dsq_thread_id:
  - 722489648
aktt_notify_twitter:
  - no
categories:
  - DIY
  - Programming
tags:
  - 번역
  - 한글

---
![](https://asset.homin.dev/blog/2008/03/ko_po_check_in_winxp.webp)

[ko-po-check][1]는 류창우님이 만드신, 한글 메세지 파일(ko.po)에서 빈번히 일어나는 실수를 알려주는 프로그램입니다.

유닉스(리눅스) 환경에서 아래와 같이 실행하면 검사를 수행하며,

> $ ko-po-check ko.po

버젼/버전, 생성/만들기 아리송한 번역에의 지침(뒤에 게 맞음), 맞춤법 검사등 유용한 검사를 수행해 줍니다.

[그놈 한국어 번역팀](http://l10n.gnome.org/teams/ko)같이 여러 사람이 번역하는 커다란 프로젝트에도 사용되고, &#8216;이렇게 번역해야 될까요 저렇게 번역해야 될까요?&#8217;라는 질문의 답으로도 많이 언급 됩니다.

하지만 유닉스환경에서만 설치가 가능하게 되어 있어서, 저처럼 윈도와 리눅스를 모두 사용하는 경우- 윈도에서 사용할 수 없는 점이 불편하더군요.



다행히 파이썬이 크로스 플렛폼을 잘 지원하고, 기존의 ko-po-check의 구조가 잘 짜여 있어서, 쉽게, 조금 수정해서 윈도에서도 돌아가도록 만들었습니다.

[ko-po-check의 다운로드 페이지](http://kldp.net/frs/?group_id=23&#038;release_id=2448)에서 최신 (이 글을 쓰는 시점에서는 0.9) 버젼을 다운 받아 적당한 위치에 압축 푸시고, 압축 푼 디렉토리(README, TODO 등이 있는 디렉토리)에 아래의 첨부파일을 추가하세요.

  * [**ko-po-check.zip**][2]** **

첨부파일은 "scriptsko-po-check.in" 파일을 복사하여, @VERSION@과 같은 make가 전처리해서 바꿔주는 부분을 없애고, 윈도에서 사용하지 않는 함수 호출을 막은 게 전부 입니다.

실행 결과는 최 상위의 스크린 샷에서 확인하실 수 있습니다. 유닉스 환경처럼 시스템의 기본 path에 들어가게 설치가 되지는 않지만 큰 불편없이 사용하실 수 있습니다.

앞으로 [poedit](http://www.poedit.net/)와 연동이 되게 하고, make를 통한 설치를 파이썬 distutil 패키지를 통해서? 크로스 플렛폼에서 잘 설치 되도록 수정이 되면 좋겠습니다. 🙂

 [1]: http://kldp.net/projects/ko-po-check
 [2]: https://asset.homin.dev/blog/2008/03/ko-po-check.zip "ko-po-check.zip"