---
title: MAX232cse breakout and HW flow control
author: suapapa
type: post
date: 2009-03-25T09:41:13+00:00
url: /p=260
dsq_thread_id:
  - 728538030
categories:
  - MyProject
tags:
  - eaglecad
  - max232
  - nemo10
  - putty
  - 뻥이야
  - 시리얼
  - 전자회로

---
일전에 만든 FT232RL breakout으로 NEMO10의 시리얼 콘솔을 연결해 보니 아무래도 통 되지 않더군요. 원인은 NEMO10의 시리얼 콘솔이 HW흐름제어를 사용하기 때문이었습니다.

HW흐름제어는 시리얼 포트의 RTS/CTS 를 추가로 사용하여 흐름제어를 한다는 것으로, 그러고 보니 FT232RL에도 이 이름의 두 핀이 있었지만 연결되지 않은 상태였죠. 비싼 FT232RL을 다시 사느니 이 기회에 MAX232칩을 써 보고 싶어 MAX232 breakout을 만들어 봤습니다.

![](https://asset.homin.dev/blog/image/MAX232CSE_breakout_t.webp)

  * [**회로도 & 아트워크 (EagleCad) 다운로드**][1]

MAX232는 시리얼의 전위(+- 12V)를 TTL 레벨로 맞춰주는 변환기 입니다. 이 칩은 단순히 이 전위 변환만을 하는 칩 입니다만 시리얼 포트를 사용하는 곳에는 거의 어김없이 사용되기 때문에 시리얼칩으로 알려져 있어 혼란의 여지가 있죠.

MAX232에는 입력 전위변환 2채널 출력 전위변환 2채널이 있고, 인터넷에 구할 수 있는 대부분의 회로들이 이 중 한쌍만을 RX/TX에 사용하고 있습니다. 왜 거의 쓰이지도 않는 여분의 한쌍의 채널이 있나 했는데, 바로 HW 흐름제어용 RTS/CTS를 위함이었네요.

> 물론, 이 여분의 채널을 다른 시리얼 포트의 RX/TX를 위한 변환기로 사용할 수도 있습니다.

예전에 [TR로 만들어 본 시리얼 회로][2]에 비교해 볼면 -참 쉽게도- 단지 캐패시터 5개만을 사용하여 모든 구성이 끝남을 알 수 있습니다. 덕분에 크기도 많이 줄어들죠.

이 칩 또한, 다른 유명한 IC들 처럼 다양한 종류가 있고 이들의 차이는 패키징과 캐패시터들의 값 입니다.

여기서 사용한 MAX232cse는 1uF의 캐패시터들이 사용되며 smd 패키징입니다.

![](https://asset.homin.dev/blog/image/MAX232CSE_breakout_b.webp)

이렇게 뒷면에 들어갔습니다. SMD패키징이지만 다리의 사이가 좁지 않아 SMD를 처음 접하는 용도로도 유용합니다.

> SMD에 ㄷㄷㄷ 떨던 저도 몇번 해 보니 이 정도는 너무 쉽네요. 게다가 구멍을 뚫을 필요가 없다는 것도 -피부로 와 닫는- 엄청난 장점입니다.

그럼, 다음은 시리얼 콘솔에 사용할 소프트웨어 입니다. 추억속의 "이야기", "새롬데이타맨" 같은 프로그램이 필요하고 최근에도 시리얼 콘솔용으로 이 프로그램들을 쓰는 분을 본 적도 있습니다만&#8230; 저는 [PuTTY][3]를 사용하고 있습니다.

> 리눅스에서는 minicom을 씁니다만. minicom을 쓰실 정도의 분들이라면 이 밑의 설명은 모두 필요 없으실 것 같습니다. 🙂

PuTTY는 윈도용 표준 SSH 클라이언트 입니다. 자유소프트웨어 이며, -여전히 관리되고 있는- 살아있는 프로젝트 입니다!

관대한 PuTTY는 SSH뿐 아니라 Telnet과 Serial 연결도 지원하며 인터페이스가 좀 생소하지만, 한번 익혀두면 다양한 터미널을 같은 인터페이스로 사용할 수 있다는 것이 장점이죠.

PuTTY에서 시리얼 하드웨어 흐름제어를 설정하려면 다음 이미지 처럼 "RTS/CTS"를 선택하면 됩니다.

![](https://asset.homin.dev/blog/image/putty_serial_HW_flow_control.webp)

> **자~ 여기까지 모두 훼이크고!!!!  
>** 
> 
> **사실 RTS/CTS를 연결하지 않고도 HW 흐름제어 장치에 연결하는 방법이 있었습니다!**

인터넷에서 찾을수 있는 시리얼 변환 칩들의 RTS/CTS가 대부분 비어 있는 이유가 바로 이 때문이죠. ㅎㅎㅎ

그럼, 방법은 다음 포스트에서&#8230;

 [1]: https://homin.dev/svn/HW/breakout/max232_breakout
 [2]: https://asset.homin.dev/blog/2008/07/arduinobk_sketch_loading.webp
 [3]: http://www.chiark.greenend.org.uk/~sgtatham/putty/