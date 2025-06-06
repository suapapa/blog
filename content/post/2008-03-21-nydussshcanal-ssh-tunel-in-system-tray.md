---
title: NydusSshCanal – ssh tunel in system tray
author: suapapa
type: post
date: 2008-03-21T00:58:14+00:00
url: /p=40
dsq_thread_id:
  - 722489667
categories:
  - MyProject
tags:
  - ssh
  - 뚝딱뚝딱
  - 보안
  - 파이썬

---
저는 오픈 소스 프로젝트에 참여 하고 있습니다. 오픈 소스 개발자는, 저처럼, 다음과 같이 되실 수 있습니다.

> 직접 프로젝트를 시작하여, 오픈.

물론 많은 사람이 참여하는, 엄청난 기술이 들어가는 자랑스러운 프로젝트의 일원이 되는 것은 별개의 일 입니다.

그래도, 블로그가 생기니 제 프로젝트들을 알릴 수 있군요!

그 시작으로 **NydusSshCanal**을 소개합니다.

![](https://asset.homin.dev/blog/2008/03/nyduscanal.webp)



### **NydusSshCanal - 시스템 트레에 ssh 터널링을!  
** 

**1. ssh 터널링?**

ssh 터널링은 안전하고, 여러 모로 쓸모 있는 기능입니다. 대중적이고, 실용적인 면에서라면 빅 브라더의 눈을 피하기 위해 많이 사용되는 것으로 알고 있습니다.

윈도환경에선 putty를사용해 ssh tunnel을 할 수 있습니다.

**2. 왜, 어떻게 만들었나?**

putty로 터널링을 하려면 터미널 창을 계속 열어 두어야 하는데, 최소화 한 putty창이걸리적 거리고, 실수로 종료 하는일이 자주 발생 해 만들었습니다.

wxPython을 사용한 시스템 트레이 아이콘 예제와, paramiko패키지 안의 ssh-tunneling 예제를 사용해 뚝딱뚝딱 만들었습니다. 🙂

아래에서 다운 받으실 수 있습니다.

[NydusSshCanal의 SVN 저장소][1]

**3. 설정**

아래의 환경을 먼저 설치하셔야 합니다.

  * 파이썬 (버젼 2.4이상에서 동작 확인)
  * 파이썬 라이브러리 wxPython, [paramiko](https://homin.dev/wiki/Paramiko)
  * putty

paramiko를 제외한 다른 프로그램들은 구글링을 통해 윈도 바이너리를 쉽게 받으실 수 있고, paramiko는 위의 링크에 바이너리 빌드 방법을 정리 해 두었습니다.

NydusSshCanal은 외부 설정 파일이 없기 때문에 직접 NydusSshCanal.py파일을 열어 터널링을 할 ssh주소와 계정, 로컬 포트를 설정 하셔야 합니다.

```python
_sshFowardList = [\
#(srcPort, sshHost, destPort, sshUser, sshPort),
(5001, 'suapapa.net', 8080, 'admin', 22)
]
```

위의 설정은 suapapa.net:8080 위치와 127.0.0.1:5001을 suapapa라는 ssh계정을 통해 연결하는 설정 입니다. 가지고 계신 ssh 계정과 주소, 연결할 로컬 포트로 바꿔서 저장하세요.

**4. 실행**

  1. ssh연결은 반드시 키를 사용합니다. pagent에 키를 띄워둡니다.
  2. NydusSshCanal.py 실행
  3. 트레이에 나이더스 커널이 생김
  4. http://127.0.0.1:5001 로 http://suapapa.net:8080 이 접속되는지 확인.

지금까지 윈도를 기준으로 설명드렸지만 Python, wxPython, paramiko가 모두 크로스 플렛폼을 지원하기 때문에 같은 소스와 방법으로 리눅스에서도 잘 돌아갑니다! 와우!!(리눅스에서는 pagent 대신 ssh-add명령어를 사용해 키를 등록하면 됩니다.)

아래는 우분투에서의 스크린 샷 입니다.

![](https://asset.homin.dev/blog/2008/03/screenshot.webp)

이제 빅브라더 몰래 <strike>저그링떼를..</strike> 미지의 세상으로 나갈 준비가 완료되었습니다. ㄱㄱㅅ~

**5. Todo**

개인적인 용도로 만든 녀석이기 때문에 현재 세세한 부분이 많이 구현되어 있지 않습니다. 앞으로 추가 되었으면 하는 내용들은 다음과 같습니다.

  * 트레이 메뉴를 통해 연결 설정 추가/삭제
  * 연결이 안 된경우 아이콘 버로우
  * 리눅스-그놈환경에서 "키 모음 관리자"로 ssh키 접근

하지만, 다행히도/불행히도 저는 빅브라더의 삼엄한 감시가 없는 환경이라 Todo의 적용은 요원합니다. ㅋ

**6. 라이센스**

NydusSshCanal은 GPL 라이센스를 따릅니다.

같이 첨부된 license.txt 파일에 자세한 내용이 있는데, 요약하면, 빅브라더한테 걸려서 회사에 짤려도 댁 사정 이라고 되어 있습니다. -_-;

좋은 용도에 재밌게 사용하시고, 코드에 대한 문의나 제안이 있으면 [알려주시기](https://homin.dev/wp/?page_id=2) 바랍니다. 🙂

 [1]: https://homin.dev/svn/NydusSshCanal/