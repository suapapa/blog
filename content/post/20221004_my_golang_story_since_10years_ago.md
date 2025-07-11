---
title: "나의 10+년 Go 언어 이야기"
date: 2022-10-04T04:40:37+09:00
tags:
- golang
- python
- story
featured_image: ""
description: ""
---

저는 Go 언어의 첫 퍼블릭 릴리즈부터 10년 넘게 Go 언어를 사용해 왔고,
이력서에 [한국 최고 Go 개발자](https://homin.dev/resume/#go_expert)라는 거만한 타이틀을
걸고 있습니다. 멋지죠? 이건 그 이야기입니다.

---

## 먼저, 파이썬 이야기

제 첫 업무는 C 언어로 되어있는 피쳐폰의 소스 코드 여기저기에 하드코딩 되어있는
영어-중국어 쌍을 수동으로 복붙해서 엑셀로 정리하는 따분한 일이었습니다.

2달의 데드라인이 있었고, 몇 주 하다가 때려치고... 아니,
파이썬을 사용해 스크립트를 만들어서 데드라인에 맞춰 제출했습니다.

> 당시 장혜식 님이 운영하던 "파이썬마을"에서 많은 도움을 받았습니다.

이후 해당 업무는 1시간(사실은 몇 분) 짜리 업무로 바뀌었습니다.
더 고무적이었었던 그 과정이 재미있었다는 것이었죠.

금방 파이썬의 높은 생산성과 풍부한 내장 패키지에 매료되어 여러 작은 도구들을
만들어 사용했습니다.

하지만, 파이썬에 전념하기에는 다음과 같은 단점들도 있었어요:

- `python3 -m venv`를 쓰는 것으로 뜻이 모이기 전까지 겪은 패키징 시스템의 대혼란.
- 람다 함수를 활용한 가독성이 떨어지는 원라이너 사용이 불편. (전 이게 안 맞더라고요)
- 이걸 주 직업으로 채용하는 회사가 없음. (그때는 그랬죠)

제가 파이썬을 시작한 지 10년쯤이 되자, 그 언어의 채용이 많아졌고
특히 그중 인공지능에 관련한 것들은 대우도 좋다고 들었지만 전 파이썬에 관한 내세울 만한 경력이
없었어요. 그래서 흘려보냈습니다.


## 이제부터 Go 이야기

그러던 와중에 2012년 3월 Go 언어의 첫 퍼블릭 릴리즈(v1.0)가 나왔습니다.
구글에서 만든 프로그래밍 언어라고 소개받고,
웃기게 생긴 마스코트에 호기심이 생겨 시작했던 것 같네요.

> 간판이 이렇게 무섭습니다. ㅎㅎ

당시에 한글책은커녕 원서로도 Go 언어 책 같은 건 없었는데,
공식 홈페이지 대문에 [A tour of Go](https://go.dev/tour)라는,
웹에서 인터렉티브 하게 배울 수 있는 튜토리얼이 있길래 따라서 끝까지 해 봤습니다.

> 저는 아직도 웬만한 고 입문서보다 이걸 따라 해 보는 게 더 낫다고 생각합니다.

그리고, 파이썬을 처음 접했을 때와 비슷한 느낌을 받았습니다.
실용적이면서 높은 생산성을 가지고 있고 빠르기까지 한 이 언어는 분명 대중화된다고 생각했어요.
그날이 오면, 파이썬 때와 달리, Go 언어에 관해 내세울 만한 뭔가를 준비하고 싶었습니다.

---

일단, 파이썬으로 만든 개인용 도구들을 Go로 포팅해 봤습니다. (여전히 씀)

- [github.com/suapapa/tools](https://github.com/suapapa/tools)

그리고, 파이썬의 간판스타셨던 장혜식 님을 벤치마킹해서
한국인이라면 누구나 관심 있을 법한 한글 패키지를 만들었습니다.

- [github.com/suapapa/go_hangul](https://github.com/suapapa/go_hangul)

온라인 커뮤니티를 찾아보니 이미 국내에서도 김종민 님이 GDG Korea Golang을 운영하고 계셨고,
갈 수 있는 한 거의 모든 오프라인 모임에 참여했습니다.

> 모여서 각자 코딩하고, 자기가 알아낸 것들을 공유하곤 했습니다.

모임에는 'Google I/O'를 직관하러 갔다가 보고 싶은 세션에 자리가 없어서 Go 언어 세션을 듣고
빠지게 되셨다며, 리눅스 업계의 대부 중 한 분이신 이만용 님이 종종 나오셔서 밥도 사주시곤 했었습니다.

> 이만용 님이 SF에서 얻어오신 고퍼 인형 중 한 마리는 저희 집에 잘 있습니다.

![gopher_figure.jpg](https://asset.homin.dev/blog/img/gopher_figure.webp)

그러다 보니, 모임의 공동 운영을 제안받아서, 또 합류하신 김재훈 님과 같이 세 명이 같이 운영했습니다.
처음에는 개업 발이 있어서 사람들이 제법 모였었는데 금방 언어에 익숙해지고 (Go 언어는 정말 쉬워요),
막상 그걸로 할 게 없으니까 금방 관심도가 떨어지더라고요.

> GDG Korea Golang을 접었을 때쯤엔, (지금은 다른 유능한 운영진들이 페이스북에서 사용자 모임을 이끌고 있습니다) 
> 오프라인 모임에 3~4명 정도가 나왔는데 그중 두 명은 운영자고 그랬습니다. ㅋ

Go 언어를 익히게 되면 큰 단점이 하나 있는데, 다른 언어 하기 싫어져요...
당시 저는 업으로 안드로이드 HAL 포팅을 C++로 하고 있었는데 정말 하기 싫었습니다. T-T;

> 해야지 뭐 어쩌겠어...

그래서 직장을 그만둡니다;

---

다행히 정부 지원 프로그램인 KossLab에 "Go 관련 오픈소스 할 거다, 다른 오픈소스에 기여도 해 봤다!" 라고
어필한 게 통해서 2년간 마음껏 Go로 만들고 싶은 거 만들고, 하고 싶은 공부를 하긴 했습니다만... 일을 하고 싶었어요.

> 당시 코딩 테스트가 막 유행하기 시작했는데, 기왕 이렇게 된 거 코테를 Go로 풀어보면서 수련했습니다.

Go 언어를 쓸 수 있는 직장을 사방팔방 알아봤는데, 당시에는 찾지 못했습니다.
언어가 쉽기 때문에 해당 도메인(주로 백엔드) 지식이 있는 사람이 고를 배우는 게 훨씬 합리적이었기 때문이라고 생각합니다.

갈증이 심해져, 2016년 사비 털어서 덴버에서 열렸던 고퍼콘에 갔습니다.

![2016_gophercon_denver.jpg](https://asset.homin.dev/blog/img/2016_gophercon_denver.webp)

가 보니까, 사비 털어서 해외 콘퍼런스에 온 미친놈은 저밖에 없는 것 같더군요,
다른 사람들은 모두 Go 가 직업이라, 혹은 직업에 연관되어, 회사 지원으로 왔더군요. 부러웠습니다.

---

그러다가 카카오에 지인 추천으로 지원하게 되었습니다. Go와는 관계없는, 그 하기 싫어했던,
안드로이드 HAL 관련 직무로...

코테는 운 좋게 만점 받았는데, 두 문제는 Go 언어로 두 문제는
파이썬으로(Go 언어를 선택할 수 없었음) 풀었던 것 같습니다.

면접 질문 중 인상에 남는 질/답들이 있었습니다. 제가 Go 언어 한다고 몇 년을 광광 써 버린 게
우려스러웠나 봐요. 하지만 저도 짬이 있어서... 원하는 답 드렸습니다. 후후...

- Q: 제일 잘하는 프로그래밍 언어가 뭔가요?
- A: 아무래도 C&C++를 업으로 가장 오래 써 왔기 때문에 그걸 제일 잘합니다.

직접적인 질문도 있었습니다.

- Q: 회사에서 Go 못 쓰게 하면 어쩔 건가요?
- A: 주 직업으로는 못 쓰더라도, 그걸 돕는 도구는 Go로 만들어 쓸 겁니다. 막지 못할 겁니다.

아무튼 좋게 봐주셔서, 카카오에 입성합니다.

> 사람들이 '네카라쿠베...'라고 하는 데는 다 이유가 있습니다. 좋은 회사입니다.

카카오에서 안드로이드 기반으로 스마트 스피커를 하나 만들자마자 부서 채로 분사가 되어,
카카오 엔터프라이즈로 옮기게 되었습니다.

거기서는 임베디드 리눅스 기반으로 스마트 스피커를 만들었는데,
OTA 클라이언트를 어떻게 할 건지가 논의되길래, 손들고 제가 Go로 해도 되나요? 했습니다.

당시 CPO였던 박창희(brandon) 님이 쿨하게 '왜 안됨?' 하고 컨펌! 해주셔서 진행했고,
잘 마무리했습니다.

> 나중에 알게 된 사실인데, 타 사의 스마트 스피커의 OTA 클라이언트도 Go로 만든 게 있더군요.
> 당시 교류는 전혀 없었습니다.

생각해 보니, 바로 거기부터가 제 프로페셔널 Go 프로그래머 경력이 시작되었더라고요.
지금은 백엔드로 넘어와서, PoC 프로젝트를 하나 완성해 제품화하고 있습니다.

우리나라 백엔드가 스프링 왕국인 건 누구나 다 아는 사실인데... 그래서 저도 스프링 책을
몇 권 읽어 보기도 했지만, 그냥 전업 고 프로그래머 하고 있습니다.

제가 Go로 만든 프로그램을 자바, 코틀린, 스프링으로 다시 만들라고 하면,
그 시간 안에 그만하게 쉽게 못 할 거예요.

> 게다가 더 중요한 건, 일이 재밌습니다.

---

Go 언어가 나온 지 10년이 넘었고, 많은 기업에서 고를 사용하고 있습니다.
이젠, 한국에서도, 종종 고 프로그래머를 채용하는 공고도 보이게 되었습니다.

> 언제인지 정확히 기억은 안 나지만,
> 처음 [깃헙에서 한국 Go 프로그래머 목록을 나열](https://github.com/search?o=desc&q=language%3AGo+location%3AKorea&s=&type=Users&utf8=%E2%9C%93)
> 해 봤을 땐 5명 정도가 보였고 전 2등이었나? 3등이었나 그랬어요.

저는 처음부터 Go를 사용해 왔고, 1등이고, 전업 Go 프로그래머로 만족하며 일하고 있습니다.
이 정도면 이제 좀 내세울만하지 않나요? :)

자랑 끝.