---
title: "Diagrams Sandbox - 웹에서 코드로 그리는 인프라 다이어그램"
date: 2022-09-24T16:59:12Z
tags:
- infrastructure
- diagram
- python
- golang
- docker
- k8s
- gke
featured_image: ""
description: ""
toc: true
---

> 요즘 누가 다이어그램 손으로 그리나요? [#그게나야](https://asset.homin.dev/blog/img/homin-dev_k8s.jpg)

코드로 인프라 다이어그램을 웹에서 그려볼 수 있게 꾸려봤습니다.

![dsb_screenshot.png](https://asset.homin.dev/blog/img/dsb_screenshot.png)

- 바로 [해보러가기](https://homin.dev/dsb/)

## 무엇이 문제였나?

[Diagrams](https://diagrams.mingrammer.com/) 라는 파이썬으로 작성된 툴이 있습니다.

연산자오버라이딩을 사용해 쉬프트, 빼기 등의 연산자를
그래프의 엣지를 의미하게 만들어 인프라 다이어그램을 그리는 편리하고 유용한 툴 입니다.

문제가 있다면, 저는 이제 파이썬을 잘 안 써서 이걸위해 파이썬 인터프리터를 받기 싫다는 것과,
이걸 웹에서 인터렉티브하게 제공하는 사이트를 못 찾았다는 것 입니다.

> Diagrams의 저자인 민재님이 몇 년 전에, 몇가지 파이썬으로 된 웹 앱을 보여주셨었는데,
> 아직도 퍼블릭하게 쓸 수 있는건 없는 것으로 압니다.

이게 위험한 이유는 사용자가 입력한 코드를 서버에서 실행하기 때문에
서버의 정보가 누출될 수 있으며, 침입 및 크래킹으로 이어질 수 있는 보안 위험이 있기 때문입니다.


## 제대로 된 해결 방법

그럼, 인터렉티브 환경을 제공하는 [The Go Playground](https://go.dev/play/)는 대체 어떻게 
같은 문제를 피해간 것일까요? 오픈소스니까 소스를 들여다 봤습니다.

거기선, [gVisor](https://github.com/google/gvisor)를 사용해 안전한 샌드박스 컨테이너 안에서
사용자의 코드를 실행하더라구요. 사용자 코드가 그 안에서 무슨짓을 해도 안전합니다.

GCP에서는 노드에 이 기능을 켤 수 있기 때문에 바로 사용...

할 수가 없었습니다. 저는 개인서버라 비용을 줄이려고 micro 머신을 이용하는데
이 기능은 standard 머신부터 쓸 수 있더라구요.


## Diagrams Sandbox 가 사용한 방법

세 개의 저장소로 구성되어 있으며 다음과 같습니다:

- https://github.com/suapapa/go_diagrams
- https://github.com/suapapa/diagrams_be
- https://github.com/suapapa/diagrams_fe

![dsb.png](https://asset.homin.dev/blog/img/dsb.png)

위 저장소의 순서대로 설명하면;

### Diagrams container

우선 컨테이너 안에 Diagram의 파이썬 실행환경과
stdin 으로 코드가 들어가면 이미지를 base64encode 한 뒤 간단히 json으로 꾸려서 나오게
하는 프록시를 Go 로 만들어서 구성했습니다.

> DockerHub: /suapapa/diagrams 이미지. DH를 쓴 이유는 GKE 포드내에서는 프라이빗한
> 컨테이너 레지스터리가, 내것도, 안 보였기 때문입니다. 네.. 저도 알고 싶지 않았습니다.

### Backend

역시 Go 로 백엔드를 만들어, HTTP API로 사용자의 코드가 들어오면, 위에서 준비한
이미지의 컨테이너를 `docker` 명령어로 띄워 실행하게 하였습니다.

이러려면, 백엔드가 실행되는 노드의 `/var/run/docker.sock` 파일을  공유받아야 하는데,
컨테이너 밖의 것이 포드 안으로 노출되기 시작하기때문에 여기서 부터 보안 위험이 시작됩니다.

> 보안 위헙을 어떻게 피하가고 있는지는 밑에서 설명하겠습니다.

### frontend

프론트엔드는 Vue3 로 작성했고, 저는 FE 전문이 아니라 좀 날것의, 불편한, 상태입니다.

> 좀 편리하고 예쁘게 고쳐서 PR 해주면 감사합니다.

### 보안 강화 

프록시가 파이썬 코드를 받아서 파이썬으로 던져 실행하기 직전에
diagrams 외의 패키지의 import 시도가 있는지를 검사해 발견되면 코드를 실행하지 않게 하였습니다.
그런데, Go 같은 경우는 import는 코드의 위에서만 가능한 반면 
Python은, 스트립트 언어라 당연히, lazy import 가 가능하더라구요;;

그래서 아래의 Anchor 커맨트를 import 부분과 실행 부분의 중간에 넣도록 강제하였습니다.

```python
# Diagrams Sandbox: DO NOT DELETE THIS LINE #
```

> Diagrams Sandbox 의 기본 탬플릿에 포함되어 있기 때문에, 
> 이로인해 사용성이 그렇게 크게 나빠질 것 같지는 않습니다.

이 anchor를 중심으로 코드를 위, 아래로 쪼개서;

- 위에는 `from diagrams` 만으로 시작하게 강제 + `;` 금지
- 아래에는 `import` 사용을 불허

하게 했습니다. 이러면 되지 않을까요?

> 위험하니까(저도 앎) 내리라고 하시는 건 자유지만,
> 저 원래 남의 말 잘 안들어요. <- 오토바이탐

그래서 Sandbox 라는 이름은 기만이 되었지만,
이걸로 부자되면 별도로 노드를 꾸려 gVisor 로 운영하도록 하겠습니다. ㅎㅎ.



## !! 사용제약 - API 서버 단독 접근 금지 !!

Diagrams Sandbox 는 다음과 같이 구성되어 클러스터에 올라가 있습니다.

![dsb_on_cloud.png](https://asset.homin.dev/blog/img/dsb_on_cloud.png)

API서버(BE)의 주소도 퍼블릭에서 바로 접근할 수 있지만 불허합니다.

사용자는, 광고가 붙은, [Diagrams Sandbox 페이지](https://homin.dev/dsb/)만을
통해서 API서버를 사용해야 합니다.

> 어떻게 그럴수 있냐고요? 다 제 것이라서 가능. ㅋ
>
> 서버비 충당과, API 무임승차를 막기위한 결정이며,
> 다시한번 API서버의 어뷰징을 금지한다고 고지했음을 "궁서체"로 남깁니다.

## 사용 예

간단한 사용+설명 영상을 찍어봤습니다.

{{< youtube 0vA7qRAcvBE >}}

> 이미 아셨겠지만 이 페이지에 사용된 다이어그램들은 모두 Diagrams Sandbox 를 사용해 그렸습니다.

마지막으로, 첫 다이어그램에 사용된 Diagrams 코드를 참고로 남깁니다.

```python
from diagrams import Diagram, Cluster
from diagrams.programming.framework import Vue
from diagrams.programming.language import Python, Go
from diagrams.onprem.container import Docker

# Diagrams Sandbox: DO NOT DELETE THIS LINE #

with Diagram("Diagrams Sandbox", show=False, graph_attr={"pad": "0.2"}):
  with Cluster("Node: work"):
    sock = Docker("/var/run/docker.sock")
    with Cluster("Replica: diagrams-fe"):
      with Cluster("Pod: dsb"):
        fe = Vue("frontend")
    with Cluster("Replica: diagrams-be"):
      with Cluster("Pod: dsb-api*"):
        be = Go("backend")
    with Cluster("Container: diagrams"):
      pr = Go("proxy")
      dg = Python("diagrams")
      pr >> dg
  fe >> be >> pr
  be >> sock
```
