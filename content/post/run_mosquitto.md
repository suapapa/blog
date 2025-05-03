---
date:  "2017-06-01T19:30:35+09:00"
title:  "mosquitto로 MQTT 맛 보기"

---

[Mosquitto](https://mosquitto.org/)를 이용해 `MQTT` 프로토콜을
사용해 보겠습니다. 우분투 기준으로 다음의 두 패키지를 설치 합니다.

    $ sudo apt install mosquitto mosquitto-clienets

MQTT서버(또는 데몬)가 뜨고,
클라이언트(mosquitto_sub and mosquitto_pub)가 설치됩니다.

## 기본적인 MQTT 통신:

터미널을 열어 `home`이라는 주제로 구독(subscribe)를 등록 합니다.

    $ mosquitto_sub -h 127.0.0.1 -t home

터미널을 새로 열고, `home`이라는 같은 주제로 발행(publish)을 하면;

    $ mosquitto_pub -h 127.0.0.1 -t home -m "temp 25'C"
    $ mosquitto_pub -h 127.0.0.1 -t home -m "door open"

다음과 같이 첫 번 째 터미널에 발행한 메세지가 도착함을 알 수 있습니다.

    temp 25'C
    door open

## 와일드 카드

파일시스템에서 흔히 쓰이는 `*`와 달리 다음의 두 종류의 와일드 카드를 지원 합니다.

* `+` can be used as a wildcard for a single level of hierarchy.
* `#` can be used as a wildcard for all remaining levels of hierarchy.

    $ mosquitto_pub -h 127.0.0.1 -t home/switch -m "on"
    $ mosquitto_pub -h 127.0.0.1 -t home/sensor -m "25'C"

먼저 실행해 둔 subscribe 클라이언트에서는 다음과 같이 읽힌다.

    $ mosquitto_sub -h 127.0.0.1 -t home/+
    ...
    on
    35'C

> !! 이건안됨 !! sub 하는 입장에서 와일드 카드를 쓰면 와일드 카드 부분에
> 어떤 토픽이 매칭 되었는지 알 수 있는 방법이 있는가?

반대로 publish 할 때는 와일드 카드를 쓸 수 없다.

    $ mosquitto_pub -h 127.0.0.1 -t home/# -m "on"
    Error: Invalid publish topic 'world/#', does it contain '+' or '#'?

    Use 'mosquitto_pub --help' to see usage.
