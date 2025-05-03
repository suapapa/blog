---
date:  "2017-04-19T13:54:04+09:00"
title:  "라즈베리파이 설정과 고 컴파일러 설치"

---

RaspberryPi 사이트에는 모니터와 키보드 다 붙여서 개인용 컴퓨터로 쓰는 용례가 주 지만,
착한 가격과 충분한 컴퓨팅 파워 덕에 모니터 없이(headless) IoT thing의 용도로도 종종 쓰입니다.

이 포스팅에서는 모니터 없는 구성을 설정하는 방법을 남깁니다.

## 준비물

![rpi2](https://homin.dev/asset/blog/img/rpi2_1024.jpg)

* RaspberryPi
* USB Wifi 모듈 (Rpi2 이하인 경우에만)
* Micro SD 카드

## 이미지 선택

(라즈베리 + 데비안 = ) RASPBIAN lite 버젼을 다운받습니다.

* [RASPBIAN download page](https://www.raspberrypi.org/downloads/raspbian)

압축된 용량은 300MB 미만이며 압축 해제 후에는 1.3GB 정도로,
데스트탑 환경이 제외된 필수 패키지만 존재하는 버젼입니다.

## 이미지 fusing

압축을 푼 후 (날자와 코드네임은 시간이 지남에 따라 다를 수 있음);

    $ unzip 2017-04-10-raspbian-jessie-lite.zip

dd로 이미지를 밀어 넣습니다. `sync` 빼먹지 말고 실행해 줍니다.

    $ sudo dd if=2017-04-10-raspbian-jessie-lite.img of=/dev/sdb bs=4M
    $ sync

이 과정을 거치면 다음과 같이 MBR, FAT 파일시스템의 부트 영역, EXT4 파일시스템의 루트 영역으로 파티션이 나뉘어 집니다.
![rpi fused disk](https://homin.dev/asset/blog/img/rpi_fused_disk_1024.jpg)

> 루트 영역은 첫 부팅시 SD카드의 크기에 맞게 자동으로 늘어납니다.

## fusing 후 기본 설정

### 메모리 설정

부트 영역인 `boot/config.txt` 파일의 마지막에 다음 내용을 추가 합니다.

    gpu_mem=16

GUI 데스크탑 환경을 쓰지 않을 것이기 때문에 더 많은 메모리를 CPU에서 사용할 수
있게 됩니다.

### wifi 설정

다음 링크, [SETTING WIFI UP VIA THE COMMAND LINE](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md)를 참조해 루트영역의 `etc/wpa_supplicant/wpa_supplicant.conf` 파일의
끝에 다음 내용을 추가합니다.

network={
    ssid="YOUR_SSID"
    psk="YOUR_PASSWORD"
}

### hostname 설정

로컬 네트워크 안에서 어떤 IP가 할당되었는지 모르기 때문에 host 이름으로
ssh 접속을 할 수 있습니다. 기본 호스트 내임은 `raspberrypi`을
충돌을 방지하기 위해 다른 이름 (예, `thing1`) 으로 수정합니다.

* etc/hosts
* etc/hostname

### 부팅

이제 카드를 Rpi에 꽂고 부팅!
다음 명령어로 연결이 되는지 확인합니다.

    $ ssh pi@thing1.local

pi 계정의 기본 패스워드는 `raspberry`

연결이 안되면 키보드 마우스 꼳고 `openssh-server` 패키지를 지웠다가 재 설치 해 보세요.

    $ sudo apt purge openssh-server
    $ sudo apt install openssh-server

> 이거 최근부터 문제가 되고 있는데, 왜 그런지는 안 찾아 봤어요.

## Go 컴파일러 설치

> 최근부터 [공식홈](https://golang.org)에서 ARMv6용 컴파일러 바이너리를
> 제공합니다. 핵편함.

호스트에서 타겟으로 고 컴파일러 복사

    $ scp go1.8.1.linux-armv6l.tar.gz pi@192.168.0.12:~/

타겟에서 `/usr/local/go`에 설치

    pi@thing1:~ $ cd /usr/local/
    pi@thing1:/usr/local $ sudo tar -xzf ~pi/go1.8.1.linux-armv6l.tar.gz

`$PATH`에 추가

    $ echo "export PATH=/usr/local/go/bin:$PATH" >> ~/.bashrc
    $ source ~/.bashrc
    $ go version
    go version go1.8.1 linux/arm

다음 포스팅에서는 CGO가 포함되었는지는 봐야 겠습니다. 이게 되야 의미가 있는거라서요.
