---
title: MQTT를 활용한 실시간 방명록 출력 시스템 
date: 2022-09-10T12:58:50+09:00
tags:
- golang
- k8s
- rpi
- mqtt
---

{{< youtube kJGh1Xtq8RE >}}

## 배경

당근마켓에서 영수증프린터를 사서 고로 사진을 찍어 보고([동영상](https://youtu.be/sQ_J_80lhCM)),
할 일 없이 책상에 자리만 차지하고 있는 프린터를 보다보니, 사람들이 남긴 방명록을 여기로 바로
출력할 수 있겠다는 생각이 들었습니다.

HomeAssistant와 함께 ZigbeeToMQTT로 홈-오토메이션을 구성하면서 [Mosquitto](https://mosquitto.org/)
라는 MQTT브로커를 사용해 봤기 때문에 그걸 쓰면 된다고 생각했습니다.

```
방명록 -pub-> MQTT브로커 <-sub- 라즈베리파이(프린터)
```

> MQTT브로커는 특정 토픽, 예) `homin-dev/guest-book` 을 구독하는 모든 클라이언트에게
> 다른 클라이언트에서 해당 토픽으로 발행한 내용을 전달해주는 역확을 합니다.

문제는 홈-오토메이션에 사용되는 Mosquitto는 저희 집 내부망 전용으로 인터넷에서 접근할 수 없다는 것이죠.


## 개인용 퍼블릭 MQTT 브로커 꾸리기

도커와 함께 보급된 컨테이너 기술은 이제 더 이상 잘 모르는 프로그램의 설치 방법을 익히느라 시간을
쏟을 필요가 없게 만들었습니다. 컨테이너를 퍼블릭 k8s 클라우드에 올리면 되죠.

하지만, 비용절감을 위해, 제 ingress 노드는 ingress 전용으로 하나의 포드만 올릴 수 있어서...

> 돈으로 해결 할 수 있는건 돈으로 해결하는게 건강에 좋습니다.

work 노드에 Mosquitto 를 디플로이 하고,
Ingress 프로그램에서 그 노드로, TCP-TLS(인터넷 접근) to TCP(클러스터 내부) 포워딩 기능을 구현해 넣었습니다.

> 소스코드가 관심있으신 분은 [여기](https://github.com/suapapa/site-ingress/blob/main/portfoward.go)에 있습니다.

그래서 다음과 같이 퍼블릭 MQTT 브로커가 생겼습니다.

![personal_public_mqtt_broker](https://homin.dev/asset/blog/img/personal_public_mqtt_broker.jpg)

> 한참동안 브로커에 접근이 안되서 씨름했는데, 알고보니 해당포트를 방화벽에서 통과하게 등록해 줘야 하더라구요.
> GCP에서, 여긴, UX가, 왠만하면 건들지 마라! 라고 하는 것 처럼 생겼는데... 잘 찾아서 뚫어줬습니다.

## 방명록 사이트 - MQTT publish 클라이언트

- [site-gb](https://github.com/suapapa/site-gb)

[방명록 사이트](https://homin.dev/gb)는 Ingress 사이트와 별개의 노드에 있는 별도의 앱입니다.
`/gb` 서브패스로 접근하는경우 방명록 프로그램으로 리버스 프록시를 타게 구성해 둬서 마치 하나의 프로그램 처럼 동작합니다.

Go 언어에도 이클립스에서 제공하는 정식 MQTT 클라이언트 라이브러가 있으니 그걸 사용해 publish 클라이언트를 작성했습니다.


> 처음에는 subscribe 클라이어트가 없으니까 Telegram bot 에 방명록 내용을 전달하게 해서 사이트 동작을 확인했습니다.

## 프린터 - MQTT subscribe 클라이언트

- [gb-noti](https://github.com/suapapa/gb-noti) : 프로젝트의 이름으로 gb-print가 더 적합했을것 같은데..

프린터는 집 안에서 항상 켜 있어야 하기때문에 RPi와 같은 SBC와 리눅스가 적합했습니다.
이 RPi는 인터넷에 접근이 가능하기때문에 MQTT 클라이언트로 특정 토픽을 sub. 할 수 있으며,
시리얼이나 USB 모두 리눅스에서는 장치 파일 존재하기 때문에 Go 언어로 쉽게 사용 가능합니다.

> Go 언어는 기본 툴에 크로스컴파일러가 포함되어 있기 때문에 ARM기반의 SBC나
> 서버용 프로그램을 작성하는데도 참~ 좋습니다.

### 방명록 메시지를 그림으로 변환해서 찍기.

국내의 영수증 프린터는 보통 로컬인코딩(euc-kr, cp949)의 영수증 글꼴같은 (당영한 이야기) 글꼴이 내장되어 있습니다.
그걸 그대로 사용하기 싫었기 때문에, 수신한 메시지를 그림으로 변환해서 출력했습니다.

영수증 폭을 넘지 않게 긴 줄은 잘라야 했고, 여기에는 10년 전에 고를 처음 접하면서 만들어 뒀던
자막 프로그램의 코드를 참고했습니다.

> [과거의 나](https://github.com/suapapa/subtitle-raider) 칭찬해!

### SBC로의 디플로이

앞서 말한듯이 Go 에는 크로스컴파일러가 있기 때문에;

- 맥에서도 ARM-Linux 바이너리를 쉽게 만들어,
- scp로 라즈베리파이에 복사하고,
- system service를 하나 만들어서 구동

하는 방법을 사용할 수 있습니다. 편하다고 했는데 뭐가 많죠? 그래서 이 방법 대신,

Github Action과 도커를 사용하면, tag를 올려서 자동으로 이미지를 컨테이너 레지스트리에 올리고,
라즈베리파이에서는 이미지 업데이트가 있을 때마다 다음의 스크립트를 만들어서 돌리면 더 편합니다.

```
#!/bin/bash

docker stop gb-noti
docker rm gb-noti

docker pull suapapa/gb-noti:latest

docker run \
  -d --restart unless-stopped \
  --device /dev/usb/lp0 \
  --name gb-noti \
  suapapa/gb-noti -t usb -d /dev/usb/lp0
```

> 환경변수로 전달되는 브로커 비번은 삭제했으니 이대로 실행한다고 되지는 않습니다.

일반적인 docker run 에 붙는 옵션에 비해 추가된 것 다음과 같습니다.

- `--restart unless-stopped` :RPi가 꺼졌다 켜저도 다시 컨테이너가 실행되게 함.
- `--device /dev/usb/lp0` :호스트의 장치파일을 도커내부에서 쓸 수 있게 해 줌.

## 전체 구성

지금까지 설명한 걸 모두 그려보면 다음과 같습니다:

![live-gb-print-system](https://homin.dev/asset/blog/img/live-gb-print-system.jpg)

---

- [방명록](https://homin.dev/gb) - 직접 해 보러 가기
- [후원](https://homin.dev/support) - 돈쭐내주러 가기
