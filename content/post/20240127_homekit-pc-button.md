---
title: "시리 통해 말로 컴퓨터 켜기"
date: 2024-01-27T23:12:53+09:00
tags: [diy, arduino, homespan, esp32, homekit, siri]
featured_image: ""
description: ""
---

최근 아이폰 15 프로를 샀습니다. 계속 안드로이드만 써 왔기에 처음 보는 기능이 많더라고요.

> 교통카드 기능이 없는게 제일 아쉽지만 대체로 만족하면서 쓰고 있습니다.

그 중, 기본으로 설치되 있는 "홈" 이라는 앱이 있는데,
"홈 킷"이라는 악세서리(또는 장치)를 폰 (또는 타블렛)에서 제어할 수 있는게 있더라고요.

악세서리가 비어있는채로 보이는게 좀 횡하던 차에 [HomeSpan](https://github.com/HomeSpan/HomeSpan) 이라는
ESP32 보드로 홈 킷 장치를 만들 수 있는 아두이노 라이브러리가 눈에 들어왔습니다.

ESP32는 모듈을 아두이노 보드와 같은 형태로 다양한 업체에서 만들어 판매되는데
아두이노보드와 다른 MCU를 탑재해 과거에는 사용이 조금 까다로왔었지만
대체로 아두이노보다 작고 WIFI/BT가 빌트인 되는게 장점입니다.

게다가 이제는 아두이노 IDE에서 ESP32 계열도 지원하고 있기 때문에 취미로 전자공작을 하는 사람들이
많이 선택하고 있습니다.

예전에 사 둔 ESP32S2 보드가 있어서 이걸 사용해서 HomeSpan을 기본 샘플을 돌려보니 여기서도 잘 동작하더라구요.

---

제 집에는 윈도우 PC가 한 대 있는데, 현재는 TV옆에다 놓고 TV에서 게임하는 용도로만 사용하고 있습니다.
이때는 동선은...

- PC에 다가가서 전원을, 발로, 켬
- 뒤로 떨어져 앉아 TV를 리모컨으로 켬
- 키보드로 PIN 입력하여 로그인
- 조이스틱 HOME 버튼으로 게임 런쳐 실행 후 게임 시작

여기서 PC를 켜고 끄려고 왔다갔다 앉았다 일어났다하던게 영 귀찮던 차에 홈킷을 사용하면
말로 할 수 있겠더군요.

---

PC의 전원버튼은 일종의 푸쉬버튼으로 메인보드의 두 핀을 일시적으로 연결해 주는 역활을 합니다.
해서 다음과 같이 쓱싹쓱싹 컨셉을 그려봤습니다.

![homekit-pc-button_concept_800.jpg](https://asset.homin.dev/blog/img/homekit-pc-button_concept_800.webp)

뭐가 많이 있지만 ESP32에서 나오는 출력은 릴레이로 가는 선 뿐이며, ESP32보드가 제어하는 릴레이가 발 대신
메인보드의 전원핀을 연결해 줍니다.

기존의 전원버튼은 ESP32의 입력으로 사용해 그전처럼 발로도 계속 켤 수 있게 할 수 있습니다.

---

필요한 부품들을 모아갑니다.

전자공작에는 작은 부품들이 많이 사용되기 때문에 종류별로 모아놓았던 통에서
꺼내어 작은 박스같은곳에 이 프로젝트를 위한 부품들을 모아두면 관리하기 좋습니다.

![homekit-pc-button_components_800.jpg](https://asset.homin.dev/blog/img/homekit-pc-button_components_800.webp)

오른쪽의 3핀 모듈을 3V3 레귤레이터인데 다 만들고 생각해보니 ESP 개발보드가 5V입력을 받아도
자체적으로 3V3으로 낮추며, 마이컴 외에 전류가 추가로 들어갈 곳도 딱히 없어서 불필요 했었네요.

![homekit-pc-button_assembly_800.jpg](https://asset.homin.dev/blog/img/homekit-pc-button_assembly_800.webp)

자주 하면 예쁘게 만들 수 있겠지만, 저는 와이어링을 배운적이 없으므로 되는 대로 합니다.

- 입/출력 단자를 종류에 따라 한쪽 면에 모아두면 좋습니다.
- LED는 SW에서 로그메시지와 같은 역활을 합니다. 귀찮아도 추가하면 반짝거려서 더 좋습니다.
- ESP32S3보드는 핀맵이 모드 뒷편에 있길래 그냥 뒤집에서 꼳을 수 있게 핀헤더를 땜 했습니다.

녹색 단자는 이 모듈의 5V 전원 입력 단자인데...
PC가 꺼져있는 상태에서 본체 내부에서 5V 전원을 얻는 방법이 마땅치 않더라구요.

구글링한 결과 전선을 탈피하지 않고 연결할 수 있는 T자형 클립이 있다는 걸 알게 되어,
ATX 파워의 5VSB(StandBy) 전원을 사용할 수 있었습니다.

![homekit-pc-button_5vsb_800.jpg](https://asset.homin.dev/blog/img/homekit-pc-button_5vsb_800.webp)

요즘 파워는 미관상의 이유인지 전선의 종류를 더이상 색으로 구분하지 않고 죄다 검은색이라,
제 위치를 확인 또 확인하느라 애를 먹었습니다.

릴레이도 모듈을 싸게 살 수 있길래 따로 회로를 꾸리지 않고 쉽게 연결할 수 있었습니다.
릴레이에서 나오는 노란색 선 두개가 메인보드로 들어가는데,

먼저 전원을 넣고, 뭔가 타지 않는지 테스트 해 봅니다.

![homekit-pc-button_test_800.jpg](https://asset.homin.dev/blog/img/homekit-pc-button_test_800.webp)

잘 되네요.

폼보드에 글루건으로 고정하고, 케이스에는 듀얼락이라는 벨크로 스티커(잘 고정되고 서로 떼기도 쉽습니다)를
사용해 자리잡아 줬습니다.

![homekit-pc-button_install_800.jpg](https://asset.homin.dev/blog/img/homekit-pc-button_install_800.webp)

그럼, 동작하는것 보시죠. 편안~

{{< youtube nGbBMsxysVU >}}

---

홈 킷으로 만들 수 있는 물건의 카테고리에 푸쉬버튼이 없어서 좀 애를 먹었었습니다.
결론적으로는 스위치를 켜면 500ms 후에 바로 끄도록 코딩을 했습니다.

- [아두이노 스케치 링크](https://github.com/suapapa/homekit_pc_switch)

오랬만에 아두이노 IDE를 다운로드 받아봤는데, 예전해 비해 많이 발전했더라고요.
보드매니져, 라이브러리매니져가 있어서 온라인에서 자동으로 다운로드가 가능하고
편집기도 깔끔해 보입니다만, 여전히 프로들을 위한 편집기는 아니긴 합니다.
특히 vim 모드가 없어서 고통받았습니다.

다 만들고 나니, 누가 [기성품](https://a.aliexpress.com/_onvmftq)이 있다고 알려주더라고요.
하늘아래 새로운 건 없고, 왠만하면 사서 쓰자... ㅎㅎ
