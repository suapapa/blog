---
title: "Tvheadend에서 한국 EPG 속시원하게 받아오기"
date: 2024-11-25T17:34:30+09:00
tags: [golang, nas, tv, epg, docker]
featured_image: ""
description: ""
---

집의 공청 안테나 단자로 지상파 일부 채널이 나오지 않는 문제가 있어
외장 튜너와 실내용 TV 안테나를 사용해 보기로 했습니다.

![20241226_tv_antena_800.jpg](https://homin.dev/asset/blog/img/20241226_tv_antena_800.jpg)

예전에는 PC의 PCI 슬롯에 꼳아 사용하는 TV튜너 제품들이 있었는데
PC를 잘 켜지도 않고 로컬 네트워크의 아무 장치에서나 방송을 볼 수 없었죠.

[HDHomerun](https://www.silicondust.com/hdhomerun/) 이라는 TV튜너는 안테나 (또는 케이블)과 이더넷에 연결하는,
PC가 필요없는, 독립 장치인 튜너로 전용앱을 사용해 TV를 시청할 수 있었습니다. 국내에서 안 팔아서 배대지로 구매했습니다.

> 제가 산 건 "HDHomeRun FLEX DUO" 제품으로 2채널을 동시에 FHD로 볼 수 있는 가장 기본 모델입니다.

안테나를 잘 맞추니 전용앱으로 핸드폰과 랩탑에서 TV를 볼 수 있기는 했는데
[EPG](https://namu.wiki/w/%EC%A0%84%EC%9E%90%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20%EC%95%88%EB%82%B4)가 현재 방송과 다른
엉뚱한 외의 방송의 EPG가 나오더라고요.
불편해서 찾아보니 [Tvheadend](https://tvheadend.org/)라는 서버를 사용하면 한국의 EPG를 적용할 수 있고
덤으로 방송 녹화도 가능하다는 것을 알게 되었습니다.

![tv_recording_system_800.jpg](https://homin.dev/asset/blog/img/tv_recording_system_800.jpg)

OpenMediaVault로 운영중인 NAS에 Tvheadend 를 설치하고 OTA EPG를 받아봤는데 뭔가 제대로 한국 EPG를 받아오는 것 같지만
갱신 속도가 굉장히 느리고, 튜너가 자꾸만 lock에 걸려 풀리지 않는 문제가 있었습니다.

Tvheadend에서 한국 EPG를 적용하기 위해 한국의 웹 EPG 제공업체들에서 정보를 가져오는 프로젝트,
[epg2xml](https://github.com/epg2xml/epg2xml)을 찾을 수 있었습니다.

> README 를 따라서 설정파일을 수동으로 편집해 실행해 보면서 `xmltv.xml` 를 생성하려면 `Channels.json` 에서 `epg2xml.json` 으로 
> 채널 목록을 선택해서 수동으로 복사/붙여넣기를 해야 합니다.

Tvheadend에 이 프로그램을 포함해 빌드한 **이치로님 이미지**라고 불리우는 도커이미지 [wiserain/tvheadend](https://hub.docker.com/r/wiserain/tvheadend)
를 많이들 사용하시더라고요.

> 이치로님 이미지의 설명에는 한국어로 Tvheadend의 자세한 설정 노하우가 있기 때문에 도움이 많이 되었습니다.

다만, 여전히 epg2xml 설정을 수동으로 편집해야 하고 주기적으로 EPG2XML을 실행하는 방법이 아리송 했습니다.
제 경우 이치로님의 IPTV (LG, SK, KT) 용으로 만들어둔 프리셋이 필요한 게 아니라 공중파을 볼 것이라 이미지의 의도와 맞지 않는 점도 있었습니다.

----

그래서, epg2xml의 설정파일을 자동으로 편집해주고, 채널 목록갱신과 Tvheadend로의 주입을 주기적으로 하기 위한 프로그램을 고 언어로 작성했습니다.

- [ko-epggrab](https://github.com/suapapa/ko-epggrab)

epg2xml이 생성하는 `Channels.json` 을 EPG 프로바이더와 카테고리 목록으로 추리고, 그 중이 채널 이름으로 한번 더 추리는 기능이 있습니다.

> 이 프로그램은 epg2xml의 래퍼라 실행하려면 epg2xml 필요하지만 아예 도커 이미지에 epg2xml을 포함하게 말아서 도커허브에 올려두었습니다.

다음과 같이 테스트해 보실 수 있습니다.

```sh
docker pull suapapa/ko-epggrab:latest
alias ko-epggrab="docker run -it --rm -v $(pwd)/epg2xml_conf:/conf -v $(pwd)/epggrab:/epggrab  ko-epggrab:latest"
ko-epggrab -fc
```

네이버에서 KBS,MBC,SBS 채널에 해당하는 `xmltv.xml` 을 생성하려면 간단히 다음과 같이 합니다.
```sh
ko-epggrab -pc NAVER:지상파 -nf KBS,MBC,SBC
```

epg2xml 이 생성한 설정파일들은 마운트한 디렉터리, `./epg2xml` 에서,
최종 생성된 `xmltv.xml` 는 마운트한 디렉터리인 `./epggrab` 아래에서 확인해 볼 수 있습니다.

Tvheadend에 생성한 `xmltv.xml` 을 unix domain socket 으로 쏴 주는 역활도 합니다.
자세한 내용은 [README](https://github.com/suapapa/ko-epggrab/blob/main/README.md)를 참조.

----

Tvheadend에서는 EPGGrabberModule로 (가장 위에 있는) **External:XMLTV** 를 선택하면 되고, Tvheadend에서 epg2xml을 실행하는 것이 아니기 때문에,
이치로님 이미지를 사용하지 않고 오피셜 이미지를 사용하셔도 문제 없습니다.

대신, 아래의 예제를 참조해 `docker-compose.yml` 을 사용해 ko-epggrab을 사이드카로 띄우시면 됩니다.

```yaml
services:
  tvheadend:
    image: lscr.io/linuxserver/tvheadend:latest
    container_name: tvheadend
    environment:
      - PUID=0
      - PGID=0
      - TZ=Asia/Seoul
    volumes:
      - /system/tvheadend/config:/config # tvheadend의 설정 디렉터리
      - /data/download/tvheadend:/recordings
    network_mode: "host"
    devices:
      - /dev/dri:/dev/dri # 하드웨어 가속을 지원하는 경우 추가
    restart: unless-stopped
  ko-epggrab:
    image: suapapa/ko-epggrab:latest
    container_name: ko-epggrab
    # environment:
    #   - CRON_CHANNEL_FETCH="0 0 * * 1" # 채널 목록 갱신 주기
    #   - CRON_GENERATE_XMLTV="0 */12 * * *" # xmltv.xml의 생성 및 UDS 전송 주기
    command:
      - -fc # EPG 제공업체에서 채널 목록 갱신
      - -pc # EPG 제공업체와 카테고리를 나열
      - NAVER:지상파,종합 편성 # pc 옵션의 값
      - -nf # 위의 채널 목록에서 선택할 whitelist
      - 경인 KBS1,KBS2,MBC,SBS,EBS1,EBS2,JTBC # nf 옵션의 값
      - -ss # send to socket
      - -d # deamon mode
    volumes:
      - /system/tvheadend/config/epggrab:/epggrab # tvheadend 에서 마운트한 설정디레터리와 base가 같아야 서로 통신 가능
    restart: unless-stopped
```

결과:

![20241126_tvheadend_ko_epg.png](https://homin.dev/asset/blog/img/20241126_tvheadend_ko_epg.png)

편안~