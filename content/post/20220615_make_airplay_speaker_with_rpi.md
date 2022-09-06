---
title: "라즈베리파이로 만드는 AirPlay 스피커"
date: 2022-06-15T15:00:00+09:00
---

## 동기

- 이미 사 둔 좋은 스피커(앰프)를 사용해 무선(Wifi)으로 멜론에서 음악을 듣고 싶음.
- 블루투스는 탈락. 음손실이 있어서 싫음. 못느껴도 싫음. ㅎ

## 크롬캐스트, AirPlay 등 무선(Wifi) 음악 전송 프로토콜 소개

Google Chromecast는 다음과 같이 동작:

![IMG_EA6D74043585-1.jpeg](/img/20220615_make_airplay_speaker_with_rpi/IMG_EA6D74043585-1.jpeg)

1. 단말에서 스트리밍 서비스의 재생할 노래 선택
2. 크롬캐스트로 재생 정보 (스트리밍 주소 포함) 전달
3. 스트리밍 서비스에서 직접 크롬캐스트로 미디어 스트리밍

> 크롬캐스트는 어른들의 사정으로 오픈 프로토콜이 아닌듯. SBC로 만들수 없음.

Airplay는 다음과 같이 동작:

![IMG_FFC9C034692F-1.jpeg](/img/20220615_make_airplay_speaker_with_rpi/IMG_FFC9C034692F-1.jpeg)

1. 단말에서 스트리밍 서비스의 재생할 노래 선택
2. 단말로 미디어 스트리밍
3. 단말에서 AirPlay 스피커로 미디어 스트리밍

> Airplay가 DLNA등 다른 Wifi 기반 미디어 전송 프로토콜과 다른점은 애플기기에서 기본지원한다는 점. 또한 오픈 프로토콜 누구나? Airplay 스피커를 만들 수 있음

## ShairPort Sync 소개

SBC(RPi 등)으로 Airplay 스피커를 만드는 방법을 검색하면 프로젝트 몇가지를 찾을 수 있음.

여기서는, 사용해 본 프로젝트들 중 가장 가볍고 쉬웠기에(도커사용), `ShairPort Sync` 를 사용.

## 준비물

- 라즈베리파이(또는 아무 SBC. 나는 현재 RPi 2B+에 USB무선랜카드 꼳아 사용)
  - 케이스를 따로 구매할 경우 2, 3는 호환. 4는 포트위치가 추가&변경 되어서 호환안됨을 참고!
- 8G(면 충분) U1(정도면 괜춘) SD카드
- 외장 DAC(선택이지만 권장)
- 좋은스피커+앰프

## 라즈베리파이 SD카드 만들기

- [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
- 운영체제 → Raspberry Pi OS (other) → Raspberry Pi OS Lite (32-bit)
- 우하단 톱니바퀴에서 아래 설정 참고하여 설정

![스크린샷 2022-05-31 오후 10.44.28.png](/img/20220615_make_airplay_speaker_with_rpi/20220531-104428.png)

다른 SBC는 Armbian 설치 권장.

## 라즈베리파이에 호스트네임으로 접속하기

### 맥북에서 다음 설정 추가 (한 번 만)

- 설정→네트워크→고급→DNS→도메인 검색→`.local` 추가

![스크린샷 2022-05-31 오후 10.28.41.png](/img/20220615_make_airplay_speaker_with_rpi/20220531-102841.png)

다음과 같이 접속 가능

```bash
ssh pi@rpi-airplay.local
```

ssh 개인키를 복사하면 암호를 입력하지 않아도 되어 편함

```bash
ssh-copy-ip pi@rpi-airplay.local
```

## 트러블슈팅

이 시점에서 연결이 안되면, USB키보드, HDMI모니터 연결하여

부팅은 되는지 네트워크는 연결되었는지 등을 확인.

호스트네임 설정 확인

```bash
cat /etc/hostname
```

.local 도메인을 사용하기위해 다음의 패키지 설치 확인

```bash
sudo apt install avahi-daemon
```

## 도커설치

도커 ppa 를 사용해 설치

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

현재 사용자(pi) 도커 사용

```bash
sudo usermod -aG docker ${USER}
sudo su - ${USER}
```

## Shariport Sync 실행

- [Shairport Sync](https://github.com/mikebrady/shairport-sync)

```bash
# 기본 오디오 잭 아웃을 사용하는 예:
docker run \
  -d \
  --restart unless-stopped \ # 재부팅해도 실행됨
  --net host \ # 호스트의 네트워크를 그대로 사용 (포트 맵핑 불필요)
  --device /dev/snd \ # 컨테이너 내부에서도 호스트의 장치파일을 사용가능
  --name shairport-sync \ # 관리하기 편한 이름
  mikebrady/shairport-sync

# USB-DAC을 사용하는 예:
$ docker run \
  -d \
  --restart unless-stopped \
  --net host \
  --device /dev/snd \
  --name shairport-sync \
  mikebrady/shairport-sync -a CassianAudio -- -d hw:1 -c PCM
```

## 데모

![IMG_3CF213B9E4DE-1.jpeg](/img/20220615_make_airplay_speaker_with_rpi/IMG_3CF213B9E4DE-1.jpeg)

## 참고

SBC + DAC 제품 예 (RPi 4 + DAC Hat + Case)

![스크린샷 2022-06-03 오전 8.34.49.png](/img/20220615_make_airplay_speaker_with_rpi/20220603-083449.png)

설치 예 (USB-DAC 사용)

![wiring.jpg](/img/20220615_make_airplay_speaker_with_rpi/wiring.jpg)

Shirport Sync 유사 프로젝트들:

- [https://sound.balenalabs.io/](https://sound.balenalabs.io/)
- [https://volumio.com/en/](https://volumio.com/en/)

## 더 알아볼 내용

- [Github Action 으로 멀티 플렛폼 이미지 빌드 및 Push 하기](https://github.com/docker/build-push-action/blob/master/docs/advanced/multi-platform.md)

## 결론?

대안인 크롬캐스트 오디오 2022년 6월 현재 가격

![스크린샷 2022-06-03 오전 8.41.02.png](/img/20220615_make_airplay_speaker_with_rpi/20220603-084102.png)

이거 사자.
