---
title: "Suapapa's blog (2008~2012) 복구! 그 여정의 기록"
date: 2022-09-16T07:27:13Z
tags:
- wordpress
- php
- gke
- hugo
- github
featured_image: ""
description: ""
toc: true
---

Suapapa's blog의 모든 내용(댓글 제외)는 지금 보고 계신 Homin Lee's blog 에
통합되었습니다. Wordpress 기반의 블로그를 Hugo 기반으로 옮긴 기록을 남깁니다.

> Hugo는 Go 언어로 작성된 정적사이트 생성 엔진입니다. 마크다운 포멧으로 작성된 컨텐츠를
> 웹사이트로 변환해 주고, 이제 제법 사용층도 두터워서 테마도 많고...
> 내가 써봐서 아는데, 좋아요.

## 배경

2008년~2012년 까지 suapapa라는 필명?으로 활동하던 개인 블로그가 있었습니다.

[DIY 홈서버](https://homin.dev/blog/p=18/)에서 WordPress(php)로 운영하던 블로그는,
그 후에 IDC에도 잠깐, 무료로, 입주해있다가 언젠가부터 관리가 힘들어 백업을 남기고
제대로 관리되지 않았습니다.

백업은 두가지 방법으로 남겼는데;

1. 워드프레스 내보내기 + 리소스(이미지 등) 압축
2. Blogger로 이전 + 리소스는 구글에서 지원해 준 무료 스토리지에서 호스팅

Blogger로 찾아가 보니 이 꼬라지더군요.

![suapapas-blog_broken](https://asset.homin.dev/blog/img/suapapas-blog_broken.webp)

> 구글이 무료 스토리지 정책을 철회하면서 이렇게 모든 사진이 깨졌던 것 같습니다.
> 공짜가 다 그렇죠 뭐.


## 리소스 (사진등...) 파일 살리기

웹어디에서나 접근할 수 있는 곳에 사진들을 올려서 호스팅하고, Blogger에서 깨진 링크를
고치기로 일단 마음먹었습니다.

GCP에서는 [클라우드스토리지](https://cloud.google.com/storage)를 제공합니다.

이건 일반 디스크가 아니라 Object storage 라는건데, 뭐랄까... 웹디스크에 가깝달까?
랜덤 액세스가 느린대신 비용이 싸고,
기본 제공되며 GKE에 사용될 컨터이너 이미지들을 저장하는 등의 용도로 쓰입니다.

여기에 `homin-dev_asset` 이라는 버킷(일반 디스크에서는 디렉터리에 해당)을 만들어
워드프레스의 `wp-content/uploads` 디렉터리의 내용들을 옮겨주었습니다.

클라우드 스토리지를 바로 퍼블릭하게 공유하는 옵션도 있지만, 그 경우;

1. 리소스에 접근하기 위한 주소가 길고 복잡해 질 것을 우려.
2. 랜덤엑세스가 느리다 -> 사진이 팡팡 안 뜸.
3. 클라우드 스토리지에서도 그 옵션을 켜는 걸 권하지 않음.

그렇기 때문에, 해당 버킷에 접근하기 위한 API서버를 만들어서 `https://asset.homin.dev/*`
로 접근하기로 했습니다.

이걸 하기 위해서는 해당 앱의 컨테이너 내부에서 클라우드 스토리지를 마운트해야하는데,
찾아 본 시점에서 가이드가 다 outdated 되어있길래 참조해서 새로 정리했고,

자주 엑세스되는 사진등은, 메모리에 캐쉬하도록 파일캐쉬를 붙였습니다.

`github.com/gokyle/filecache` 패키지를 사용했는데, 실제 운영해 보니 클라우드스토리지 특성과
안 맞는 부분이 있어서 Fork 떠서 수정을 했습니다..

이 경우 예전에는, 내 수정을 PR날린 후 원 저장소에 머지되기를 기다린 후 쓰거나,
`import` 하는 부분을 `github.com/suapapa/filecache`와 같이 내 계정의 포크한 저장소로 바꾸는
불편함이 있었는데 Go module에 `replace`라는게 생겨서 다음과 같이 `go.mod`파일을 작성하면
소스를 안 고치도 그대로 사용할 수 있더라구요.

```
module github.com/suapapa/gcsbc

go 1.19

require github.com/gokyle/filecache v0.0.0-20220803205700-e8a4791094b7

replace github.com/gokyle/filecache => github.com/suapapa/filecache v0.0.2
```

> 노트! 포크한 저장소의 버전이 올라간다고 `go get -u`로 자동으로 올라가지 않습니다.
> 이 때는 `go.mod` 파일에서 수동으로 올려줘야 해요.

---

여기까지의 내용은 클라우드 스토리지를 캐쉬로 사용하는 경우 범용으로 쓰일 수 있을 것 같아
깃헙에 따로 저장소를 만들었습니다.

- [gcsbc - GoogleCloudStorageBucketCache](https://github.com/suapapa/gcsbc)

이 걸 사용해 457개의 사진 및 리소스를 이렇게 다시 온라인 성공 했습니다. 예)

- 구 링크(404): http://www.suapapa.net/wordpress/wp-content/uploads/image/suapapa.jpg
- 새 링크: https://asset.homin.dev/blog/image/suapapa.webp

## Blogger 링크 수정 시도 -> 실패

Blogger에서 내보내기, 가져오기가 제공되길래, 내보내기한 컨텐츠에서 링크를
VSCode에서 제공하는 찾아서 한꺼번에 고치는 기능으로 수정했습니다.

> 열심히 고쳤는데... 가져오기가 안돼... `-_-a`

몇 번 시도하다가 때려쳤습니다.

## Wordpress를 컨테이너로 복원해서 k8s 클러스터에 올릴까? -> 관둠

Wordpress php로 된 사이트 생성 엔진으로,
글은 Mysql같은 RDBMS에 담고, 사진 등의 리소스는 파일시스템에 담습니다.

> 요즘을 쇼핑몰같은것도 Wordpress기반으로 만들어서 사용하나 보더군요.

그래서 참고할 만한 자료가 많았습니다. 다음의 순서로 마이그레이션 해 보기로 했습니다.

- Docker compose 를 사용해 로컬에서 테스트
- 클라우드에서 서비스

인터넷에서 찾은 가이드를 참조해서
[docker-compose.yml](https://raw.githubusercontent.com/suapapa/archive-wp/main/docker-compose.yml)을
만들고 그 디렉터리에서;

```bash
docker compose up
```
하면 10여년 전에 마지막으로 봤던 워드프레스 초기 설정화면을 바로 볼 수 있었습니다.

가지고 있던, Wordpress 내보내기 파일의 링크들을 고치고;

> 제 블로그는 세 번 주소가 옮겨졌었고 절대주소, 리소스 링크에 상대주소가 섞여 있었드래서,
> 여기가 좀 시간이 걸렸습니다.

Wordpress 가져오기로 가져와 보니... 짜잔! 살아났습니다! 댓글까지 다 살아있더라구요!!

![suapapas-blog_wp_restore](https://asset.homin.dev/blog/img/suapapas-blog_wp_restore.webp)

옛 추억을 떠 올리면서 테마도 바꿔보고, 사용하던 플러그인도 설치해 보고...
그런데 `docker compose down` -> `up`을 해 보면 플러그인과 테마가 초기화 되네요?

맙소사 플러그인과, 테마도 리소스파일이었던 것. 저는 제 버킷에 php파일을 담기가 싫었습니다.

문제는 또 있었는데 GCP에서 제공하는 데이터베이스, [Google Cloud SQL](https://cloud.google.com/sql)
에 컨텐츠를 이전하려니, 아무리 쥐어짜도, 월 최소 비용이 +만원 부터 시작하더라구요.

> DB만 따로 호스팅 해 주는 업체도 찾아봤는데, 월 비용을 +몇천원대로 낮출 수 있었지만... 

때려쳤습니다. ㅎ

## Hugo 기반으로 통합

그러다가 Wordpress에서 Hugo로 이전하는 방법이 있나 찾아보니 여러개 있더라구요.
그 중 제일 상위에 있는 Wordpress 플러그인을 사용해 봤습니다.

- [WordPress to Hugo Exporter](https://github.com/SchumacherFM/wordpress-to-hugo-exporter)

플러그인 저장소에 등록되어있지 않아서, 수동으로 컨테이너 내부에서 설치해야 되고,
좀 귀찮았지만, 이 플러그인을 사용하면 전체 컨텐츠를 Hugo에서 쓰는 마크다운 포멧으로 변환,
하나의 압축파일로 다운받을 수 있었습니다.

이 블로그의 `content/post/` 디렉터리 밑에 압축을 풀었습니다.

소소한 문제가 있었지만 Vscode의 검색/치환에서 regexp를 사용할 수 있어서 쉽게 고쳤습니다.

> 다만 댓글은 가져올 방법이 없었고, 워드프레스 시절에 사용하던
> 이상한 플러그인들로 작성한 내용은 깨져서 보입니다.
> 이건 참나면 고쳐보는 것으로 하겠습니다.

## GH-pages 에서, homin.dev 클러스터로 이전

Hugo는 정적파일을 생성하기 때문에 굳이 Nginx같은 고기능의 웹서버를 사용할 필요가 없어서
`halverneus/static-file-server` 이미지를 사용해 개인 클러스터로 옮겼습니다.

이제 `homin.dev/blog`로 진입시 다른 사이트로 리다이렉트 하지 않고,
내부 앱으로 리버스 프로시되어 자연스럽게 하나의 도메인의 서브페이지로 보이게 되었습니다.

[블로그의 포스트 보기](https://homin.dev/blog/post/)에서 아래에 있는 화살표로 옛 포스팅으로
이동해 볼 수 도 있고 놀랍게도 태그도 작동하더라구요.

**🎉 이렇게 130개의 글이 복원 되었습니다. 🎉 **
