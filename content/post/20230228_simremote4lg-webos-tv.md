---
title: LG TV 사운드 출력 변환 한 버튼으로 하기
date: 2023-02-28T17:33:25+09:00
tags:
- tv
- webos
- ir
- python
- golang
- chatgpt
featured_image: ""
description: ""
---



몇 년 전 이사하면서 LG OLED를 사서 잘 보고 있습니다.

의외로 좋았던 점은 TV에 광출력 단자가 있고 15여년전 구매한 5.1ch 리시버에 연결하면
TV내장 OTT앱들에서 5.1ch로 소리가 나간다는 것 입니다.

다만, 불편한 점이 하나 있는데, TV스피커와 광출력을 오가려면;

설정->사운드 에 들어가서 좌우버튼을 눌러 고른 다음에 Back 키로 설정메뉴를 지워야 한다는 것 입니다.
하... 이거 UX... 누가 이렇게 만든겨;;;

뭐, 아쉬운 사람이 우물 파야죠.

---

예전에 이걸 모바일앱으로 만드려고 인터넷을 찾아보다가 발견한 파이썬 라이브러리가 있었습니다.

- [PyWebOSTV](https://github.com/supersaiyanmode/PyWebOSTV)

다만, 이걸로는 모바일 앱을 만들기가 어렵더라고요. 랩탑에서 WS으로 사운드 출력 변환이 되는 것 까지 확인하고 짱박아 뒀습니다.


그러다가... 모니터 하나를 박살내면서 거기에 딸려있던 막리모컨+IR수신부품을 얻게 되었습니다.

![arduino-ir_receiver_800.jpg](https://homin.dev/asset/blog/img/arduino-ir_receiver_800.jpg)

[Arduino-IRRemote](https://github.com/Arduino-IRremote/Arduino-IRremote) 라이브러리가 꽤 좋아서,
백만년동안 짱방혀 있던, 아두이노에서 리모컨키들을 수신할 수 있게 되었습니다.
수신한 코드를 USB시리얼로 호스트(라즈베리파이)에 보내고, 이걸 WS로 TV로 보내면 되겠네요.

다음과 같이 까먹기 전에 컨셉드로잉을 했습니다.

![simremote_concept_800.jpg](https://homin.dev/asset/blog/img/simremote_concept_800.jpg)

---

여기서 문제 저는 파이썬이랑 담 쌓고 산 지가 10년이라 영~ 잘 못쓰는데...

Go 언어로 만들어진 WebOS 패키지를 세게 찾아서 해 봤는데, 셋 다 미묘하게 완성도가 떨어지더라고요.
그래서...

```
Arduino--serial--Golang--http--Python(PyWebOSTV)--ws--LGTV
```

아두이노에서 시리얼을 받아서 파싱하는 부분은 Go로 만들고,
PyWebOSTV 라이브러리를 포함한 http서버를 만들어 Go 프로그램에서 호출하는 방식으로 얽기섥기 엮었습니다.

> 파이썬 모르는데 http서버 어떻게 만들었냐고요? ChatGPT가 해 줬어요.

각설하고, 동작합니다.

{{< youtube PAP6LEYnH0Y >}}

편안~

---

저장소:
- https://github.com/suapapa/simremote : PyWebOSTV 라이브러리를 사용한 API 서버
- https://github.com/suapapa/simremote-ir : IR코드를 받아 위 API서버를 호출하는 Go 프로그램