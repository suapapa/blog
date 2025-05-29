---
title: "QL-800, 주소 라벨 출력 시스템 구축. w/ Go + RPi"
date: 2022-09-18T10:45:35Z
tags:
- go
- rpi
- python
- github
featured_image: ""
description: ""
toc: true
---

라즈베리파이에서 사용할 목적으로 라벨 프린터를 샀습니다.

brother QL-800 모델로, 스티커형 라벨 프린터 하니까 제일 먼저 검색되었고,
공식 홈에 가 보니 리눅스용 드라이버도 deb 패키지로 제공해주고 있길래 믿음직했습니다.

> brother 장사잘해! -> [개봉기와 RPi 시험인쇄 영상](https://youtu.be/wGpcQVV1wBA)

이 포스팅에서는 QL-800 프린터로, 봉투에 붙일, From To 주소를 출력하는 시스템을
만들어 본 내용을 공유합니다.

## 라즈베리파이 설정

라즈베리 파이에 프린터를 연결하고, 전원켜고 잘 인식되었는지 `lsusb`를 해 봅니다.

```
Bus 001 Device 007: ID 04f9:209b Brother Industries, Ltd QL-800 Label Printer
```
> Editor Lite 버튼에 불이 들어와 있으면 Product ID가 다르고,
> 리눅스에서 인쇄가 안됩니다. 꼭 끄세요.
>
> 어떻게 알았냐고요? 저도 알고 싶지 않았습니다. (내 2000년...)

사실, 이 프린터를 사용하는데는 제조사에서 제공하는 패키지(cups 드라이버)는
필요 없습니다.

생각 있는 OS들은, 모든 USB장치의 드라이버를 내장/모듈화 하는대신
Userspace에서 접근할 수 있게 만들어뒀고, 파이썬 진영에는 멀티플렛폼에서 쉽게
USB를 사용하기 위한 PyUSB라는 라이브러리가 있습니다.

이걸 사용해 드라이버 설치 없이도 
brother 라벨 프린터들을 사용하기 위한 [brother_ql](https://github.com/pklaus/brother_ql) 프로젝트가 있었습니다.

라즈비안 라이트에는 pip3가 안 딸려오기때문에 이를 포함해서 `brother_ql`을
다음과 같이 설치합니다.

```bash
sudo apt install python3-pip libopenjp2-7
pip install --upgrade brother_ql
```

`PATH` 환경변수도 업데이트 하여 어디서는 `brother_ql`을 쓸 수 있게 합니다.

```bash
PATH="/home/pi/.local/bin:$PATH"
```

잘 설치되었는지 QL-800이 지원하는 라벨지 목록을 출력해 보는 명령을 실행해 봤습니다.

```bash
$ brother_ql -m QL-800 info labels
 Name      Printable px   Description               
 ...
 62red      696           62mm endless (black/red/white)
 ...
```

> 제품 구매시 두 종류의 라벨지를 주는데, 좁은건 전 안 쓸것 같고,
> 넓고 빨간색도 나오는게 62red 입니다. 여기에는 폭 696px의 이미지를 출력할 수 있으며,
> 이미지의 높이 만큼 출력하고 자동으로 잘립니다.

`brother_ql`로 이미지를 인쇄하려면 명령줄이 긴데, 지금까지 알아낸 정보로 다음과 같이
테스트 이미지를 인쇄할 수 있었습니다.

```bash
brother_ql \
  -m QL-800 \ # 모델 명시. QL-800말고도 지원하는 모델이 많습니다.
  -b pyusb -p usb://04f9:209b \ # pyusb를 사용할 것과, usb://VID:PID 형태의 주소
  print \ # 출력 명령
    -l 62red --red \ # 급지된 라벨 종류. 빨간색이 포함된 라벨은 --red 옵션도 꼭 넣어줘야 함.
    label.png # 인쇄할 이미지 파일 
```

![ql-800.jpg](https://asset.homin.dev/blog/img/ql-800.jpg)

> 넓이가 696px이 아닌경우 알아서 resize하는건 좋은데, 파이썬은 느리므로, 왠만하면
> 넓이를 맞춰 이미지를 준비하세요.
>
> 이미지의 높이가 높아질수록 인쇄가 엄~청 오래 걸립니다.


## 주소 출력 API 서버 작성

예전에 HUMA보드를 만들어 팔 때 사 둔 노란 종이봉투가 매우 많이 남았는데,
그걸 사용할 때마다 매직을 찾아 주소를 쓰는게 불편해 API서버에 주소를 전달하면
출력하게 Go 로 API 서버를 만들었습니다.

gin을 사용해 `POST`로 `/v1/order` EP 에 JSON 형태로 다음과 같이 주소를 받으면
임시 이미지로 변환 후 `brother_ql` 명령으로 출력합니다.

```json
{
  "ID": "1234567890",
  "from": {
    "line1": "경기 성남시 분당구 판교역로 235 (에이치 스퀘어 엔동)",
    "line2": "7층",
    "name": "카카오 엔터프라이즈",
    "phone_number": "010-1234-5678"
  },
  "to": {
    "line1": "경기도 성남시 분당구 판교역로 166",
    "name": "판교 아지트",
    "phone_number": "010-1234-5678"
  }
}
```

라벨지를 효율적으로 사용하기 위해:

- 보내는 사람은 작아도 되니까 가로로 짧게
- 받는사람은 세로로 길게

출력하게 하였고, 큰 출력물을 뽑으면 속도가 매우 느려지므로 최대한 공간을 효율적으로
쓰게 주소줄을, WordWrap 하면서, 재배치 하게 했습니다.

![ql-800_address_label.jpg](https://asset.homin.dev/blog/img/ql-800_address_label.jpg)

> 라벨의 접착력이 정말 좋습니다. 빨간색은 전 필요 없어서,
> 62mm 검정 라벨을 좀 더 사야 될 것 같네요.

동작 영상은 아래의 동영상을 참조하세요:

{{< youtube OmdbDWZ-k4E >}}

---

깃헙 저장소는 다음 위치에 있습니다:

- [suapapa/pr_label](https://github.com/suapapa/pr_label)

그럼, 이걸 사용해 정말 뭔가를 팔아보는 그 날 다시 뵙겠습니다. :)