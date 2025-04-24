---
title: 구글맵 플러그인(thydzikGoogleMap) 개선 제안
author: suapapa
type: post
date: 2008-06-18T06:02:44+00:00
url: /p=77
dsq_thread_id:
  - 741567168
categories:
  - Wordpress
tags:
  - GPS
  - WP-plugin

---
언제부터인가 제 블로그의 로딩이 눈에 띄게 느려졌었습니다. 원인을 찾아보니 구글맵을 붙이기 위해 설치한 [thydzikGoogleMap][1] 워드프레스 플러그인이 구글로 부터 필요한 스크립트를 가져오는 시간이 걸리더군요.

네, 구글맵은 공짜로 쓸 수 있지만, 트래픽은 공짜가 아니죠.

문제는 구글맵이 포함되어 있지 않은 포스트에서도 똑같이 구글맵으로 부터 스크립트들을 불러온다는 점 입니다.

해서 스크립트를 열어 다음과 같이 헤더에 스크립트를 붙이는 부분을 주석 처리하고,

```php
//add_action('wp_head', 'thydzikGoogleMapHeader');

```

다음과 같이 thydzikFindGoogleMap 함수에서 구글맵 태그 직전에 이 스크립트를 붙이도록 수정했습니다.

```php
global $thydzikGoogleMap_googleMapKey;
$temp3 = chr(13).''.chr(13).''.chr(13).$temp3;

```

그 결과 꽤 쾌적하게 바뀌었네요. 든 자리는 몰라도 난 자리는 틔가 나는 법이랄까요? ㅎㅎ

단 이렇게 바꾸면 한 포스트에 여러 구글맵 태그가 있을 경우 문제가 될 수 있습니다. 첫번째에만 붙이도록 전역변수를 써서 비교해야 하나 잠시 고민하다가&#8230; 플러그인을 만든 [thydzik의 블로그에 요청][2]해 두고 다음 릴리즈에 반영되기를 기도하는 쪽을 선택했습니다.

이러니까 왠지 사장님이 된 것 같다능. ㅎㅎ

 [1]: http://wordpress.org/extend/plugins/thydzik-google-map/
 [2]: http://thydzik.com/thydzikgooglemap-v13/