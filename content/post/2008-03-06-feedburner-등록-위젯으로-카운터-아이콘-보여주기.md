---
title: FeedBurner 등록, 위젯으로 카운터 아이콘 보여주기
author: suapapa
type: post
date: 2008-03-06T08:31:49+00:00
url: /p=34
dsq_thread_id:
  - 732127024
categories:
  - Wordpress
tags:
  - WP-plugin

---
<p style="text-align: center">
  <strong>"이쁘다! 나도 저거!"</strong>&nbsp;
</p>

<p style="text-align: center">
  ![](https://asset.homin.dev/blog/2008/03/feedburner.webp)
</p>

다른 분들의 블로그를 돌아다니다 보니 위와 같이 생긴 카운터 아이콘이 그 블로그의 RSS를 몇 명이 구독하고 있는지 알려주고 있었습니다.



**1. FeedBurner 등록** 지금까지 그랬듯이&nbsp;간단히 설치 될 것 같아 [FeedBurner 사이트](http://www.feedburner.com)에 가서 회원가입을 하고 기존의 RSS주소를 입력했더니 제 블로그의 [FeedBurner 주소][1]가 생겼습니다. 오호라~ -이미 RSS주소가 있는데 왜 이런게 생겼나 봤더니, 이제 제 블로그의 RSS트래픽을 FeedBurner에서 받게 되더군요. 이 홈서버는 개미똥꾸멍만한 대역폭(안양방송 케이블 제일 싸구려 상품) 을 가진 입장이라 적절한 서비스가 아닐 수 없었습니다.

> &#8216;그런데&nbsp;아이콘은?&#8217;

**2. 플러그인 설치** 워드 프레스용 [FeedBurner FeedSmith 플러그인](http://www.feedburner.com/fb/a/help/wordpress_quickstart)이 있길래 올타쿠나 하고 설치하였습니다. 설치해 보니 이 플러그인은 기존의 RSS주소로 접글 한 경우 FeedBurner로 리다이렉션 해 주는 역활을 하더군요. 우왕ㅋ굳ㅋ

> &#8216;그런데 아이콘은?&#8217;

**3. 카운터 아이콘** 찾아보니 카운터 아이콘을 얻기 위해서는 아래와 같이 FeedCountService를 활성화 해야 합니다. &nbsp;![](https://asset.homin.dev/blog/2008/03/feedburner_feedcount_setting.webp) 카운터 아이콘의 소스를 주며 **적당한 곳**에 붙여 넣으라고 하네요.

> &#8216;적당한 곳이 어디냐!!&#8217;

**4. 카운터 아이콘 위젯 생성** 적당한 곳을 찾다 보니 아예 위젯으로 만드는 게 좋겠다 싶어 기존의 플러그 인을 좀 손봤습니다.&nbsp; FeedBurner_FeedSmith_Plugin.php 파일에 [이 패치][2]를 적용하시거나, [이걸로][3] 덮어 쓰세요. 이제 플러그인에 아래와 같이 4번 항목이 생깁니다. 적당한 이곳에 위에서 받은 카운터 아이콘 소스를 넣고 저장하세요.![](https://asset.homin.dev/blog/2008/03/feedburner_feedcount_widget.webp) 드디어 제 블로그를 몇명이 읽는지 예쁜 아이콘을 통해 알 수 있게 되었군요.

> &#8216;어디보자&#8230; 0명. ㅆㅂ&#8217;

 [1]: http://feeds.feedburner.com/SuapapasBlog
 [2]: https://asset.homin.dev/blog/2008/03/feedburner_feedsmith_plugin_add_feedcounterwidget_diff.zip
 [3]: https://asset.homin.dev/blog/2008/03/feedburner_feedsmith_plugin.zip