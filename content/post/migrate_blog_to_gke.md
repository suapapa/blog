+++
date = "2017-04-16T15:24:31+09:00"
title = "블로그 구글컨테이너엔진(GKE)으로 이전"

+++

도커 컨테이너는 클라우드 서비스 업체를 막론하고 사용할 수 있기에 사용자가 갑인
서비스 생태계를 만들어 주는 기술입니다.

본 블로그는 `Hugo`를 사용한 정적 페이지만으로 운영되어 `gh-page` 로도 운영될 수
있지만, 미묘하게 `baseURL` 관련 문제로 사진들을 표시하려면 불편하여
도커 컨테이너를 지원하는 `GKE`로 이전을 해 보았습니다.

대상은 도커에 어느정도 익숙하고, 오케스트레이션은 익숙하지 않은 분들 입니다. (제 상태)

다음 두 문서를 참조하였습니다:

* [Quicksart for Google Container Engine](https://cloud.google.com/container-engine/docs/quickstart)
* [Running WordPress with a Single Pod](https://cloud.google.com/container-engine/docs/tutorials/hello-wordpress)

두 문서는 거의 같은 시나리오로 양쪽에서 잘 설명되지 않은 부분을 교차 확인하는데 좋습니다.

> 제대로 하나의 문서를 만들어 주면 더 좋으련만.

주로 `gcloud`, `kubectl`, `docker` 이렇게 세 개의 cli 명령어를
차례대로 `구글 클라우드 서비스`, `Kubernetes`, `Docker`를 다루는데 사용합니다.

> 문서가 흩어져 있어서 쉽지 않은 느낌.

그럼 시작.

# CLI 툴 설치

## docker 설치

했다고 침. 확인.

    $ docker run hello-world

## gcloud 설치

[Google Cloud SDK](https://cloud.google.com/sdk/downloads)와 함께 설치 됩니다.

    $ gcloud -v
    Google Cloud SDK 151.0.1
    bq 2.0.24
    bq-nix 2.0.24
    core 2017.04.14
    core-nix 2017.04.14
    gcloud
    gcloud-deps 2017.04.14
    gcloud-deps-linux-x86_64 2017.04.14
    gsutil 4.25
    gsutil-nix 4.25

## kubectl 설치

    $ gcloud components install kubectl

Cloud SDK의 일부분으로 설치 됨.

    $ which kubectl
    ...google-cloud-sdk/bin/kubectl


# 도커 이미지 생성 및 레지스터리에 올리기

아래와 같은 `Dockerfile`을 만들었습니다.

    FROM nginx:alpine
    # copy built html for static access
    COPY ./public/ /usr/share/nginx/html/
    EXPOSE 80

다음 명령어로 이미지, `suapapa/blog`를 생성합니다.

    $ docker build -t suapapa/blog .

이제 `docker images` 명령어로 생성된 블로그 이미지를 볼 수 있습니다.
날자별로 tag를 생성하기 위해 `tag` 명령도 사용해 봅니다.

    $ docker tag suapapa/blog suapapa/blog:20170417

tag를 지정하지 않으면 `latest`로 자동으로 태깅 됩니다.
Dockerhub (Github의 도커 판) 에 올려 둡니다.

> Dockerhub 회원가입및 로그인 했다고 침.

    $ docker push suapapa/blog

# 하나의 node 안의 한 pod 에서 컨테이너 서비스 하기

> node.js의 그 node가 아님.
> 여기부터는 Kubernetes 가 주로 쓰임.
> 홈페이지에 있는 interactive tutorial 실습 필요.

## 0. gcloud 기본 설정

한 번에 하나의 프로젝트만을 다룰 수 있습니다. GCP콘솔에서 아래 그림을 참조해
`PROJECT_ID`를 설정 합니다.

![pid_in_gcp_console](/img/suapapa_blog_gcp_console.jpg)

    $ gcloud config set project suapapablog-149712
    $ gcloud config set compute/zone us-central1-b
    $ gcloud config list

> compute/zone 이 아시에에 있는게 더 빠를 것 같지만
> 여기서는 기본 문서 대비 바뀌는 점을 최소화 해 이해를 돕기 위해
> 위해 그냥 둡니다.

## 1. 클러스터 설정

> 다시한번 정리. 클러스터 안에 노드 안데 포드 안에 컨테이너 한 개.
> 서버와의 인증이 필요하니 하라는 대로 따라 할 것.

하나의 클러스터, `blog-cluster`를 생성합니다.

    $ gcloud container clcusters create blog-cluster \
        --num-nodes 1 \
        --machine-type g1-small

시간이 좀 걸리며 생성중에 `gcp console`을 보면 아래 이미지 처럼 생성됨을
볼 수 있습니다.

![gcp_cluster](/img/gcp_container_cluster_1024.jpg)

## 2. pod 생성

이제부터 `kubectl`을 사용합니다.
gcloud와 연결이 끊어진 것 같으면 아래 명령어를 사용해 생성했던
클러스터 `blog-cluster`와 붙여 봅니다.

    $ gcloud container clusters get-credentials blog-cluster

아래 `kubectl`명령어로 pod, blog 디플로이:

    $ kubectl run blog --image=suapapa/blog --port=80

## 2-1. docker 이미지를 갱신하기

    $ docker push suapapa/blog:20170417
    $ kubectl set image deployment/blog blog=suapapa/blog:20170417
    deployment "blog" image updated

## 3. expose로 외부 트래픽 연결

`blog`라는 서비스 디플로이를 expose하는 명령:

    $ kubectl expose deployment blog --type=LoadBalancer

## 확인

    $ kubectl describe services blog
    Name:			blog
    Namespace:		default
    Labels:			run=blog
    Annotations:		<none>
    Selector:		run=blog
    Type:			LoadBalancer
    IP:			10.67.253.110
    LoadBalancer Ingress:	146.148.50.52
    Port:			<unset>	80/TCP
    NodePort:		<unset>	30278/TCP
    Endpoints:		10.64.0.13:80
    Session Affinity:	None
    Events:			<none>

    $ kubectl get service blog
    NAME      CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
    blog      10.67.253.110   146.148.50.52   80:30278/TCP   11d

# 결론

물리적인 서버를 관리할 필요가 없다는 점과 언제든지 다른 브랜드의 컨테이너 서비스로 옮길 수
있다는 것이 장점이긴 하나, 매번 이렇게 이미지를 빌드해서 올리는 건 잘못된 best practice
인 것 같네요.

다음에는 volume을 써서 어떻게 좀 해 봐야 겠습니다.
