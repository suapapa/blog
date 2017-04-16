+++
date = "2017-04-16T15:24:31+09:00"
title = "블로그 구글컨테이너엔진(GKE)으로 이전"
draft = true

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

# 프로젝트 만들기

# Dockerfile 제작 및 레지스터리에 올리기

# 
