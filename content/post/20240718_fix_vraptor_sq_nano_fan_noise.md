---
title: "V-Raptor SQ nano 서버 팬 소음 해결하기"
date: 2024-07-18T08:15:32+09:00
tags: [diy, homeserver]
featured_image: ""
description: ""
---

집에서 개인용 ARM 서버인 V-Raptor SQ nano 를 한 대 운용하고 있습니다.

- [V-Raptor SQ nano 판매링크](https://voramall.com/product/v-raptor-sq-nano/12/)

![vraptor_nano_fan_fix_1_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_1_800.jpg)

어느날 부터 팬 소음?이 나기 시작하더라고요. 처음에는 안나다가, 간헐적으로 나기도 하고,
소음이 나는 부위를 톡톡히면 다시 안 나기도 하고...

가정에서 쓰기에 감당하기 힘든 소음이기에 제조사에 문의해서 택배로 주고 받으며 A/S를 받아봤지만
증상이 재현되기에 직접 고쳐봤습니다.

> 아마 재현이 안되서 그대로 포장해서 보내주신게 아닌가 싶어요.

----

밑바닥의 고무발을 떼어내면 십자 나사 6개가 보이고, 이걸 풀면 플라스틱 케이스의 상판과 하판을 달래서 분해 할 수 있습니다.

![vraptor_nano_fan_fix_2_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_2_800.jpg)

팬은 케이스 상판에 달려있는데, 팬의 형상과 조립되었을 때의 위치를 가정해 보면, 아래 그림과 같이 방열판이 붙은 CPU 를 통과하게 바람이 흐르는게 설계된 것으로 보입니다.

![vraptor_nano_fan_fix_3_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_3_800.jpg)

펜을 떼어 뒷면을 보면 모델명, 전압, 전류를 확인해 볼 수 있습니다.
하지만, 구글링 해 보아도 같은 모델의 팬을 구하기는 쉽지 않아 보였습니다.

> 떼어낸 김에 호환팬을 찾기위해 크기를 재 두었으면 좋았을텐데... 깜박했습니다.

![vraptor_nano_fan_fix_4_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_4_800.jpg)

팬에는 작은 나사들로 얇은 철판이 붙어있습니다. 일반적으로 PC에서 보는 위에서 밑으로 바람을 뿜는 팬이 아니라 옆면으로 바람을 뿜기 위해 일부분을 막는 용도로 보입니다.
그런데 원래부터 나사가 3개만 박혀 있더라고요.

![vraptor_nano_fan_fix_6_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_6_800.jpg)

그래서, 손쉽게 얇은 철판이 벌어지는 구조입니다. 아마 팬이 돌면서 생기는 진동으로 이 철판이 떨리는 소음이 났던 것 같습니다.

![vraptor_nano_fan_fix_7_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_7_800.jpg)

해서, 전기테이프로 팬의 철판과 막혀있는 한쪽 면을 붙여 주었습니다.

![vraptor_nano_fan_fix_8_800.jpg](https://asset.homin.dev/blog/img/vraptor_nano_fan_fix_8_800.jpg)

조립은 분해의 역순. 일주일 쯔음 이 상태로 쓰고 있는데, 예전엔 1 시간되 안되서 나던 소음이 안나네요.

문제해결!