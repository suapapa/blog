---
date:  "2017-05-24T10:23:08+09:00"
title:  "라즈베리파이용 리눅스 커널 컴파일"

---


이 문서에서는 디바이스 드라이버 추가 등 커널 커스텀을 위해 현재 사용중인
라즈베리파이 이미지에 맞는 커널을 골라 빌드 하는 방법을 다룹니다.

----

## Upstream에서 Fork 하기
raspberrypi 의 커널은 [https://github.com/raspberrtpy/linux](https://github.com/raspberrypi/linux)
에 있습니다. 이 링크를 웹 브라우져로 접근해서, "Folk" 버튼을 누릅니다.

그러면 `https://github.com/YOURID/linux` 라는 저장소가 생깁니다.

> YOURID 대신 자신의 github ID를 입력합니다.
> 이 문서에서는 제 github ID인 suapapa를 사용하겠습니다.

그리고, 거기서 부터 clone 합니다.

    $ mkdir -p ws/rpi && cd $_
    $ git clone https://github.com/suapapa/linux

`git clone` 시에 자신의 저장소로부터 `origin`이라는 리모트와 `master`라는 브랜치가
기본적으로 clone 될 것 입니다.

추가로 `upstream` 이라는 리모트를 생성해 줍니다. 이러면 커널의 버젼 업을 따라가기
조금 수월해 집니다.

    $ git remote add upstream https://github.com/raspberrypi/linux
    $ git fetch upstream

## 작업 브랜치 따기

linux 커널은 역사도 길고, 지난 버젼들에게도 보안 패치 등이 이루어 지기 때문에 브랜치가 아주 많습니다. 그 중 일을 시작 할 적당한 브랜치를 고르려면 현재 사용중인 커널 버젼을 알아야 합니다.

`ssh`나 시리얼로 rpi의 쉘에 접속하여 다음 명령어를 실행 해 줍니다.

    $ ssh pi@thing1.local

> 여기서는 wifi 및 hostname 설정에 대해 다루지 않고 넘어갔습니다.

    $ uname -r
    4.4.50+

현재 `fusing`된 커널 버젼은 4.4.50+ 입니다.
`git branch -a` 명령과, `grep`으로 작업을 시작할 브랜치가 `rpi-4.4.y`
라는 걸 파악하고 여기서 부터 작업 브랜치 `topic-MYWORK`를 생성했습니다.

    $ git checkout -b topic-MYWORK upstream/rpi-4.4.y

작업을 진행하며 필요한 경우 다음과 같이 개인 저장소에 push 해 둡니다.

    $ git push origin topic-MYWORK:topic-MYWORK

## 업스트립에 업데이트 된 내용 적용하기

`Makefile`을 열어 보면 최 상위에 다음과 같이 버젼이 명시되어 있음을 볼 수 있습니다.

    VERSION = 4
    PATCHLEVEL = 4
    SUBLEVEL = 50

이 세 개의 숫자가 차례대로 `uname` 명령어로 확인할 수 있는 숫자 입니다.
라즈베리파이 사이트에서 받은 이미지로 부팅했는데 여기에 있는 것 보다 큰 버젼 넘버가 나온다면
작업 내용을 새 버젼에 업데이트 해야할 시기 입니다.

여기서는 `4.5.y` 로 버전 업이 되었다고 가정했습니다.
다음 명령어들을 참조해 작업합니다.

    $ git fetch upstream

    $ git checkout topic-MYWORK
    $ git branch topic-MYWORK-4.4.y # 망하는 경우를 대비해 branch를 따 둡니다. :)
    $ git rebase upstream/rpi-4.5.y
    $ git push origin topic-MYWORK:topic-MYWORK


## 빌드

기본적인 커널 컴파일 방법은 라즈베리파이 사이트에 있는
[KERNEL BUILDING](https://www.raspberrypi.org/documentation/linux/kernel/building.md)
을 참조하시면 됩니다.
