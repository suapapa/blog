---
title: '글설리 알아 차리기: python + XML-RPC + wordpress'
author: suapapa
type: post
date: 2008-12-11T12:47:41+00:00
url: /p=132
dsq_thread_id:
  - 725988391
categories:
  - Programming
  - Wordpress
tags:
  - WP-plugin
  - XML-RPC
  - 파이썬

---
리플은 언제나 설레입니다. 🙂

제 블로그의 경우 -스팸 방지를 위해- 모든 댓글은 블로그 관리 패널에서 승인한 후에 보여지게 되는데, 이 블로그에 댓글이 그렇게 자주 달리는 편이 아니라 설레이는 맘으로 관리패널에 들어와 봤다 헛탕치는 일이 비일비재 합니다. -,.-;;

웹 브라우져를 통하지 않고도 대기중인 댓글이 있으면 바로 알려주는 방법이 있으면 좋겠다는 생각이 들더군요.

> 뜻이 있으면 검색!

"How-To Geek" 블로그의 

[WordPress Comment Moderation Notifier][1] 에서 XML-RPC를 사용해 -웹 브라우져를 통하지 않고- 승인 대기 중인 댓글의 수를 받아오는 방법을 찾을 수 있었습니다.

링크된 블로그의 거의 마지막에서 [WordPressNotify_0.1.zip][2] 파일을 다운받으실 수 있습니다. 이 파일은 두 부분으로 되어 있는데;

  1. 서버에 승인 대기 댓글의 수를 워드프레스 DB에서 읽어 리턴해 주는, 워드프레스 플러그인: geek-wp-notifier.php
  2. 주기적으로 해당 XML-RPC 함수를 불러서 PC에 표시해 주는 C#으로 작성된 클라이언트: 나머지

입니다.

플러그인은 다른 플러그인 처럼 서버의 "wp-contents/plugin/" 에 위치 시키고 관리 패널에서 Activate 합니다. 간단하네요!

하지만, 클라이언트가 윈도 전용 인데다 바이너리만 있습니다. 그래서&#8230; 다시 만듭니다!?

그런데, 전 XML-RPC을 사용해 본 적이 한번도 없었습니다. :$

다행히, 멋쟁이 파이썬으로 XML-RPC를 사용할 수 있다고 들은 바 있어 ONLamp의 [XML-RPC in Python][3] 을 찾아 읽고 개념 탑재를 했습니다.

다시 XML책을 꺼내 들어야 겠다는 다짐이 무색하게 이 방법을 "사용"할 때는 XML에 관한 지식이 전혀 필요 하지 않더군요. ㅋ

게다가, 허무하게 간단합니다:

```python
import xmlrpclib
def getCommentCnt(wpURL, username, password):
    wpSvr = xmlrpclib.Server(wpURL+"/xmlrpc.php")
    return wpSvr.geek.getCommentModerationCount(username,password)

```

이제 블로그의 주소와 관리자 아이디, 패스워드를 전달하여 위 함수를 실행 합니다.

```python
getCommentCnt('https://homin.dev/wp', 'admin', 'password')
0

```

잘 동작 합니다. 이제, 웹브라우져를 띄우지 않고도 헛탕 칠 수 있게 되었습니다. 푸하하!

T-T

 [1]: http://www.howtogeek.com/howto/the-geek-blog/how-to-geek-software-wordpress-comment-moderation-notifier/
 [2]: http://www.howtogeek.com/softwarefiles/WordPressNotify_0.1.zip
 [3]: http://www.onlamp.com/lpt/a/468