---
title: Arduino S3V3 bootloader
author: suapapa
type: post
date: 2008-06-09T03:53:54+00:00
url: /p=74
dsq_thread_id:
  - 722490051
categories:
  - Arduino
tags:
  - arduinos3v3

---
Arduino는 시리얼 포트(혹은 USB)를 통해 -ISP가 없이- 프로그램을 심을 수 있습니다. 단 이걸 가능하게 하기 위해 최초 한번 ISP로 AVR에 부트로더를 심어야 합니다. 기 조립된 Arduino를 구입하셨다면 이미 부트로더가 심어져 있으므로 이 과정이 필요 없습니다.

직접 만든 Arduino S3V3 에는 물론 부트로더가 없으므로 직접 심으셔야 합니다.

우선 ISP가 필요합니다. 제 경우, 가장 저렴하고 6pin 케이블이 포함되어 있기에, 페러럴 방식의?[NT-ISP][1]를 구입했습니다.



![](https://asset.homin.dev/blog/2008/06/nt-isp_with_arduinos3v3.webp)

ISCP 포트에 1번 핀 위치에 주의하여 위와 같이 연결합니다.

다음은 [Arduino Software를 다운][2] 받습니다. "**/arduino-0011/hardware/bootloaders/"** 폴더에 AVR과 Arduino 종류에 따라 컴파일된 부트로더와 소스가 들어있습니다. Arduino 사이트의 [Bootloader][3]페이지를 참조해 보니 Arduino S/W에서 바로 부트로더를 심는 것이 가능합니다.

> 그런데..?안돼 -_-;

부트로더 소스와 함께 있는 Makefile을 까 보니 usip로 부트로더를 심는 방법을 찾을 수 있었습니다. ㄱㄱㅅ~

> 그래도.. 안돼 -_-;;

한참을 삽질하다 알아낸 것. **NT-ISP는** [**Arduino사이트에서 말하는 패러럴 ISP**][4]**와 다르다!!** usip의 help를 차근차근 살펴보니 패러럴 ISP만 종류가 -전 다 똑같은 거라고 가정했었는데- 10여가지 되는군요.

패러럴 ISP의 종류를 잘못 지정한 경우 다운로드는 정상적으로 이루어 지는 것 처럼 보이지만 Verify에서 에러가 주루룩 나옵니다.

> 그래서.. 뭔데? -_-;;;

ISP를 새로 사야 하나? 걱정되었지만 결국 이 녀석으로 부트로더를 심는데 성공하였습니다. 우선 아래와 같이 "burn" 스크립트를 작성하였습니다.

부트로더의 makefile을 참조하였고, dprog를 "dapa"에서 "stk200&#8243;으로 수정하였습니다. stk200 찾느라 옵션의 패러럴 프로그래머들을 한번씩 다 해봤다능.

프로그래머(dprog) 옵션을 잘못준다고 망가지지 않습니다. 🙂

```bash
#!/bin/bash
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --wr_lock=0xFF
sleep 1
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --wr_fuse_l=0xdf --wr_fuse_h=0xca
sleep 1
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --erase --upload --verify if=$1 -v=2
sleep 1
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --wr_lock=0xCF
```

이제 다음과 같이 실행 합니다. 패러럴 포트에 직접 접근하기 위해 root 권한이 필요합니다.

```bash
/arduino-0011/hardware$ sudo ./burn bootloaders/atmega8/ATmegaBOOT.hex
Atmel AVR ATmega8 is found.
Writing lock bits ...
Reinitializing device
Atmel AVR ATmega8 is found.

Lock Bits set to 0xff
Atmel AVR ATmega8 is found.

Fuse Low Byte set to 0xdf

Fuse High Byte set to 0xca
AVR Direct Parallel Access succeeded after 0 retries.
Atmel AVR ATmega8 is found.
Erasing device ...
Reinitializing device
AVR Direct Parallel Access succeeded after 0 retries.
Atmel AVR ATmega8 is found.
Uploading: flash
################################
(total 1002 bytes transferred in 0.66 s (1511 bytes/s)
Polling: count = 16, min/avg/max = 2.24/4.94/8.38 ms
Verifying: flash
################################
(total 1002 bytes transferred in 0.58 s (1742 bytes/s)
Atmel AVR ATmega8 is found.
Writing lock bits ...
Reinitializing device
Atmel AVR ATmega8 is found.

Lock Bits set to 0xcf
```

이제 ISP 케이블을 제거하고 Reset 버튼을 누르면 LED 13 (사진의 노란색 LED)가 파라라락! 점멸하며 부트로더가 잘 심어졌음을 알립니다.

![](https://asset.homin.dev/blog/2008/06/arduinos3v3_bootloader_on.webp)

**?한줄요약 NT-ISP = STK-200**

 [1]: http://www.devicemart.co.kr/mart7/mall.php?cat=010002000&query=view&no=14478
 [2]: http://www.arduino.cc/en/Main/Software
 [3]: http://www.arduino.cc/en/Hacking/Bootloader
 [4]: http://www.arduino.cc/en/Hacking/ParallelProgrammer