---
title: FT232RL single side breakout
author: suapapa
type: post
date: 2008-10-06T06:33:06+00:00
url: /p=105
dsq_thread_id:
  - 722489236
categories:
  - Arduino
  - MyProject
tags:
  - EagelCad
  - PCB
  - 전자회로

---
USB 시리얼 변환 보드를 만들었습니다.? 저는 USB to Serial 케이블에 데인 적이 있어서 시리얼 포트가 있으면 그걸 사용하는 편인데, USB Arduino에 사용된 FT232RL칩의 -잘 된다는- 명성에 혹해 USB 시리얼에 발을 들여 놓게 되었습니다.

![](https://asset.homin.dev/blog/2008/10/ft232rl_singleside_breakout.png)



![](https://asset.homin.dev/blog/2008/10/ft232rl_singleside_breakout_sch.jpg)

  * **[download sch&brd (이글캐드)][1]**

[Sparkfun&#8217;s EagleCad tutorial](http://www.sparkfun.com/commerce/tutorial_info.php?tutorials_id=108)에 소개된 회로도를 기반으로 작성했으며 아래의 기능들이 추가 되었습니다.

  * RX/TX LED
  * pinheader for 3.3V out
  * use only one smd part (FT232RL)
  * single side (and no jumping wire!)

네! 물론 다림질 에칭 PCB용으로 만든 것 입니다. 완성품의 사진을 보시죠.  
![](https://asset.homin.dev/blog/2008/09/imgp4743.jpg)

> 무턱대고 만들었던 시리얼 변환 보드(왼쪽)에 비해 크기도 작고 부품도 예쁘게 배치 되었습니다.

![](https://asset.homin.dev/blog/2008/09/imgp4748.jpg)

> 5V, GND, RX, TX 케이블은 구형 PC케이스에서 떼어넨 USB? 케이블을 사용했습니다. 딱이야!

![](https://asset.homin.dev/blog/2008/09/imgp4749.jpg)

> 단면 기판이므로 FT232RL은 밑 부분에 있습니다.

윈도에서 사용하려면 [FTDI 윈도용 드라이버](http://www.ftdichip.com/FTDrivers.htm)를 설치 하시면 되고, 우분투에서는, 드라이버 따로 설치할 것 없이, 그냥 잡힙니다. 척! 하고 잡히는 모습을 보니 믿음이 무럭무럭 생기네요.

Arduino S/W에서 Tools->Serial Port 메뉴를 선택해 보면 추가된 포트가 보이고 시리얼 포트와 똑같이 동작합니다.

이게 꼭 필요했던건 아니지만&#8230; 꼭 필요해서 지르는건 아니잖아요. 호호호&#8230;

 [1]: https://homin.dev/svn/HW/breakout/FT232_breakout