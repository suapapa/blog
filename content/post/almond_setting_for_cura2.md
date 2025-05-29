---
date:  "2017-04-24T10:24:34+09:00"
title:  "3D 프린터 알몬드를 위한 CURA2 설정"

---

3D 모델을 프린팅 하려면 슬라이서 프로그램을 통해 `.stl`파일을
`.gcode`파일로 변형하는 작업(CAM?)이 필요합니다.

이런 슬라이서중에 가장 유명한 것이
[Cura](https://ultimaker.com/en/products/cura-software)로
무료 소프트웨어이고, 멀티 플렛폼을 지원하지만(심지어 리눅스도),

오픈크리에이터스의 3D 프린턴 ALMOND는 국내에 꽤나 보급이 되어 있는
3D 프린터 입니다.

ALMOND에 맞게 설정하려면 3D 프린터의 정보를 넣어 machine을 등록할 필요가 있습니다.
오픈크리에이터스에서는 자사 제품을 등록한 Cura를 제공하고 있지만,
리눅스에서 안 되고, Cura 2.x 버젼은 제공하지 않고 있습니다.

그래서 한 번 해 봤습니다.

----

[Cura 다운로드페이지](https://ultimaker.com/en/products/cura-software)
최신 버젼을 다운 받습니다.

> 이 포스팅을 작성할 당시 2.5

# 프린터 추가

Cura2에서는 Almond 설정이 기본 내제되어 있지 않기 때문에 *Custom FDM printer* 를
추가해 줍니다. 제 경우 `OPC Almond` 라는 이름으로 추가하였습니다.

![cura2_add_printer_01](https://asset.homin.dev/blog/img/cura2_add_printer_01.png)

프린팅 가능 면적및 프린터 헤드 사이즈 설정, start/end gcode 수정:

![cura2_add_printer_02](https://asset.homin.dev/blog/img/cura2_add_printer_02.png)

# 필라멘트에 따른 프로파일 설정

필라멘트 재료에 따른 설정을 해 줍니다.

![cura2_custom_setting](https://asset.homin.dev/blog/img/cura2_custom_setting.jpg)

국내에선 1.75mm 필라멘트를 주로 사용하므로 이와 함께 온도등을 설정해
프로파일로 미리 저장해 둡니다.

![cura2_profile](https://asset.homin.dev/blog/img/cura2_profile.png)

# 마침

각 설정 값은 국립과천과학관, 무한상상실에 구비되어 있는 슬라이스 전용 노트북에서
Almond의 프로파일로 저장된 값을 가져와 적용했습니다.

3D 프린트 업체들이 자사 프린터의 파라미터를 내제한 소프트웨어를 제공하는 것도
편리하고 좋은 방법이지만, 제 경우(리눅서) 처럼 범용 프로그램만을 경우를 대비해
어떤 설정이 필요한지도 알려주면 좋을 것 같아요.

그럼 20000.
