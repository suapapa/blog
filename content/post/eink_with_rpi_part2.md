---
date:  "2016-01-04T20:31:56+09:00"
title:  "라즈베리파이에서 전자잉크 패널 사용하기 (part 2)"
draft:  true

---

https://www.crowdsupply.com/soniktech/e-paper-shield-kit

라즈베리 파이에 커널을 컴파일 해서 집어 넣는 과정을 해 보겠습니다.
우선 라즈베리 파이의 커널을 받습니다.

    https://github.com/raspberrypi/linux

같은 방식의 디스플레이들을 어떻게 사용하고 있었는지 살펴보았습니다.

    https://github.com/notro/fbtft

linux-next 커널을 google mirror 에서 다운로드 받습니다.

    https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git

세 개의 소스 트리가 있습니다
