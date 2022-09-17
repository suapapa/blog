---
title: "DokuWiki 복구. 라떼는 말야~ 개인위키를 썼단다~"
date: 2022-09-14T12:00:40Z
tags:
- php
- docker
- k8s
featured_image: ""
description: ""
---

![suapapa_wiki](/img/suapapa_wiki.png)

## 배경

요즘은 개인용 메모 플렛폼으로 노션을 많이들 쓰고,
개발자들은 최근에 Obsidian 을 노션 대용으로 쓰는 사람들이 늘어나고 있습니다.

> 저도 최근의 메모는 Obisidian 에 정리하고 있습니다.
> 마크다운 팬이시라면 Obisidian 쓰세요! 두 번 쓰세요!!

하지만 10여년 전에는 노션이 없어서, 설치형 위키를 개인서버에 설치해서 쓰곤 했었답니다.
개인용 나무위키 같은거죠.

이렇게 잘 쓰다가 홈 서버를 운영할 여력이 안 되면서 접었는데, 이 10년 넘은 위키의
백업본이 잘 모셔져 있더라구요.

제가 백업한 것은 아파지 웹서버의 `/var/www/html/wiki` 디렉터리 전체를 압축한 것이었고,
위키 엔진으로는 PHP 기반의 [DokuWiki](https://www.dokuwiki.org/dokuwiki)를 사용했습니다.

PHP는 역사의 뒤안길로 사라진 줄 알았는데, DokuWiki는 올 해(2022년)에도 릴리즈가 있는 정도로
꾸준지 잘 관리되고 있네요.

이 개인 위키를 다시 인터넷에 띄웠습니다.

## 로컬에서 복구해 테스트 해 보기

DokuWiki를 실행하려면 Apache 웹 서버와 PHP 인터프리터가 필요한데,
그냥 도커를 사용하면 로컬에서 테스트베드를 띄워 볼 수 있습니다.

```bash
docker run -it -p 8080:80 php:apache --name wiki
```

이 컨테이너에는 데비안기반의 리눅스 위에 php 프로그램이 돌아가게 최소한의 설치가
되어있습니다. 다른 쉘에서 다음의 명령으로 위의 컨테이너에 진입합니다.

```bash
docker exec -it wiki /bin/bash
```

> sh 이 아니라 bash가 들어있다니 참 사치스럽지 않나요? :)
> 클라우드를 쓰지 않던 시대가 오히려 더 풍요롭지 않았나 싶네요. ㅎㅎ

다운받은 DokuWiki 릴리즈 압축파일과 백업을 `docker cp` 이미지로 밀어 넣고,
다음과 같이 DocuWiki를 설치, 데이터 (테스트 파일등...)를 넣었습니다.

```bash
mkdir -p /var/www/html/wiki
tar xf dokuwiki-stable.tgz --strip-components=1 -C /var/www/html/wiki

mv data.tar.xz /tmp/
cd /tmp && tar -xf data.tar.xz
cp -r /tmp/data/pages/* /var/www/html/wiki/data/pages/
cp -r /tmp/data/media/* /var/www/html/wiki/data/media/
```

웹서버의 `/`로 호스팅 될 `var/www/html` 폴더가 아닌 `.../wiki/`에 밀어 넣은 이유는,
이 이미지를 `http://wiki.homin.dev` 가 아닌 `http://homin.dev/wiki` 로 접근하여 리버스프록시를 탈 때,
조금 더 편할 것을 예상하고 그랬습니다. 전자의 경우를 서브도메인이라고 하는데,
서브도메인을 사용하려면 비용을 더 (인증서가 더 비쌈) 써야 합니다.

이제 `http://localhost:8080/wiki/` 에서 잘 되는지 확인했습니다.

더이상 이 위키에 뭘 올리지는 않을 것이므로, DocuWiki 사이트의 메뉴얼을 참조해,
ReadOnly로 사용하도록 설정하였습니다.

> `.../wiki/conf/` 밑에 설정 파일 기본설정오버라이드, 계정, 권한 이렇게 세 개의 역활을 하는
> 설정 파일을 추가했고, 잘 되는지 확인후에 `docker cp`로 호스트로 빼 내었습니다.

여기까지 한 내용을 `Dockerfile`로 [정리](https://raw.githubusercontent.com/suapapa/archive-wiki/main/Dockerfile)하여
이미지를 만들어서 띄워보고 여전히 잘 되는지 확인합니다.

## 인터넷에 올리기

이미지로 말았으면 k8s에 쉽게? 올릴 수 있습니다.
```yaml
apiVersion: v1
kind: Service
metadata:
  name: wiki
  labels:
    app: wiki
spec:
  type: ClusterIP
  ports:
    - port: 8080
      targetPort: 80
  selector:
    app: wiki
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: wiki
  name: wiki
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wiki
  template:
    metadata:
      labels:
        app: wiki
    spec:
      nodeSelector:
        cloud.google.com/gke-nodepool: work-pool
      containers:
      - image: 'gcr.io/homin-dev/wiki:latest'
        name: wiki
        ports:
          - containerPort: 80
```
쿠버네티스를 처음 시작할 때는 yaml 파일 읽는게 고역 이었는데,
개구리 올챙이 시절 모른다고,
이제 이 내용만으로 어떻게 올렸는지 충분히 설명이 된다고 생각하고 있습니다. :)

막상 올려서 ReverseProxy로 연결해 보니 바뀐 서버이름으로 자동으로 인식하고,
브라우저(사용자)에서는 클러서터에서만 쓰이는 그 FQDN이 해석이 안되서 접근이 불가능했기때문에,
명시적으로 아파치의 설정과 dokuwiki을 설정에서 `homin.dev` 가 base URL 이라고 해 줬습니다.

그렇게 해서 https://homin.dev/wiki/ 링크에 10여년 전까지 쓰던 위키가 살아났습니다.

> 정리안된 작업노트라 ingress의 목록에 나열하지는 않았지만 자유롭게 접근할 수 있으니
> 구경들 해 보세요.

## 결론

위키는 잘되지만 그 과정에서 20세기 웹 스택이 이제는 잘 안 쓰이는 이유를 체감 할 수 있었는데요,
PHP의 환경만을 구성하는데 + 저의 소소한 데이터를 포함한 이미지의 크기가 거의 190메가의 크기였습니다.

> 훨씬 복잡한? 제 ingress의 크기도, 쉘을 포함하고도, 25메가 남짓의 크기입니다.
> 쉘이 필요없는 gb의 경우 3메가 정도면 되고요.

모든게 돈인 클라우드 환경에서 큰 이미지 사이즈는 부담이 될 수 있었겠다 싶습니다.

그러니까 21세기에는 Go 언어 하세요. 끝.