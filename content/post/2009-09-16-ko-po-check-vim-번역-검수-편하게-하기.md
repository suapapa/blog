---
title: 'ko-po-check + vim : 번역 검수 편하게 하기'
author: suapapa
type: post
date: 2009-09-16T06:04:31+00:00
url: /p=445
dsq_thread_id:
  - 723240290
aktt_notify_twitter:
  - no
categories:
  - Linux
  - Programming
tags:
  - ko-po-check
  - vim
  - 번역

---
이 포스트는 오픈소스 프로그램을 번역을 하시는 분(또는 하시려는 분) 중 [ko-po-check][1]가 생소하신 분들을 위해 썼습니다.

보통 자유 프로그램의 번역은 아래의 work flow를 따라 진행됩니다.

  1. 프로그램 소스 획득
  2. message.pot -> ko.po 로 변환
  3. poedit를 통해 번역/자동번역
  4. 프로젝트 관리자에게 패치(ko.po) 보내기

ko-po-check는 위 과정의 3번과 4번 사이에 잘못된 번역이 없는지 확인하는 용도로 사용하는 커맨드라인 유틸리티 입니다.

> 여기서 언급하지 않은 과정이 궁금하신 분은 [Mr-Dust 님이 정리하신 번역 가이드][2] 를 살펴보세요.

일전에 [윈도에서의 사용법을 포스팅][3] 한 적도 있지만, 이번에는 설명의 편의를 위해, 우분투 리눅스를 사용중이고, vi(vim)을 써본 적이 있다고 가정하겠습니다.



**1. ko-po-check 설치**

우분투라면 Ubuntu-ko PPA를 소스리스트에 추가하여 ko-po-check를 설치하실 수 있습니다.

> Ubuntu-ko ppa는 기본 저장소에 -아직- 반영되지 않은 프로그램들이나, 한국 사용자들의 편의를 위한 패키지들이 모여 있는 ppa로 <strike>귀찮게</strike> 추가할 만한 가치가 있습니다. 🙂

다음과 같이 source list에 ubuntu-ko ppa를 추가하고:

> $ sudo vi /etc/apt/sources.list
> 
> deb http://ppa.launchpad.net/ubuntu-ko/ppa/ubuntu jaunty main  
> deb-src http://ppa.launchpad.net/ubuntu-ko/ppa/ubuntu jaunty main

다음 명령어로 pgp키를 등록합니다:

> $ sudo apt-key adv -keyserver keyserver.ubuntu.com -recv-keys D186C6FF

그럼, 설치:

> $ sudo apt-get install ko-po-check vim

잘 설치되었는지 확인하기 위해 ko.po 파일이 있는 곳에서 쉘을 띄워서 아래와 같이 실행해 봅니다.

> $ ko-po-check ko.po
> 
> ko.po:578: 디렉토리: 그놈 데스크탑에서 "directory"은(는) "디렉터리"(이)라고 번역  
> ko.po:1294: 지우기: 그놈 데스크탑에서 "delete"은(는) "삭제"(이)라고 번역  
> ko.po:1294: 지우기(_D): 다음과 같이 번역해야 합니다: "삭제(_D)"  
> &#8230;
> 
>  

위에서 보시는 바와 같이 **파일명:라인수:에러내용**의 형식으로 에러가 나오며, 아무런 출력이 없을때 까지 ko.po 파일을 **"계속"** 수정하면 됩니다.

보통 ko-po-check용 쉘을 하나와, 텍스트 에디터를 띄워서 에러 라인으로 이동 후 수정, 이동 후 수정.. 이러시죠.

**2. vim과 연동**

<p style="margin-left: 40px;">
  하.지.만. vim 이 출동하면 어떨까?
</p>

사실 ko-po-check의 출력 형식, **파일명:라인수:에러내용**은 grep이나 gcc에서도 쓰이는 quickfix 형식입니다.

다음과 같이 출력내용을 텍스트 파일로 받아 -q 명령어와 함께 실행한 뒤

> $ ko-po-check ko.po > errors
> 
> $ vi -q errors

**:cn**, **:cp** 를 사용하면 에러의 위치로 점프할 수 있게 됩니다. 와우~

> [**:help quickfix**][4] 하셔서 **:cope** 등의 명령어도 찾아 보세요.

![](https://asset.homin.dev/blog/image/kpc_quickfix.webp)

많이 편해 졌지만, 아직도 ko-po-check을 실행하기 위해 vim을 들락날락 해야하는 단순반복작업이 남아있죠.

.vimrc 파일에 아래 라인을 추가해 주세요. 이 설정은 ko.po 파일을 열때 자동으로 :make에 ko-po-check를 연동시켜 줍니다.

> au BufRead ko.po set makeprg=ko-po-check\ %

그럼 vi ko.po 로 편집할 카타로그를 연 후에, 또는 수정 중 저장한 후에,

> :make

하면 현재 카타로그를 ko-po-check하고, vi -q 로 quickfix 파일을 연 것과 같은 결과가 나옵니다.

빔을 벗어날 필요가 없어졌습니다. 올레~

 

 [1]: http://ko-po-check.kldp.net/
 [2]: http://mr-dust.pe.kr/search/%EC%98%A4%ED%94%88%EC%86%8C%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20%ED%95%9C%EA%B8%80%ED%99%94%ED%95%98%EA%B8%B0
 [3]: https://homin.dev/blog/p=41
 [4]: http://www.vim.org/htmldoc/quickfix.html