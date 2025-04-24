---
title: 'WP 리비젼DB 지우기 : Python + mysql'
author: suapapa
type: post
date: 2009-08-11T00:52:18+00:00
url: /p=450
dsq_thread_id:
  - 725042660
aktt_notify_twitter:
  - no
categories:
  - Programming
  - Wordpress
tags:
  - mysql
  - 파이썬

---
워드프래스 2.6버젼 부터는 리비젼기능이 기본적으로 추가되어 있습니다.

변경 내역을 저장하는 기능인데, 사실 이 블로그는 개인 블로그라 필요 없는 기능이에요. (그런일은 위키가 잘 해주니까요)

또 퍼블리쉬 전에 자주 고치고, 후에도 또 고치고 하다보니 본 내용에 못지 않게 많은 용량을 사용하고 있을거라 생각되어 살펴보았습니다.

일단, **wp-config.php**에 아래의 설정을 추가하여:

```php
define("WP_POST_REVISIONS", false);

```

리비젼 기능을 끄면, 앞으로는 리비젼을 쌓아두지 않게 됩니다.

하지만 기존에 저장되었던 리비젼들은 그대로 DB에 남아있죠. 지워보겠습니다.

> 당연히! -언제든지 망칠 수 있으므로- db백업 후에 진행합니다!



거의 모든 rdbms는 [sql][1]을 사용해 질의를 보내고(query) 결과를 받는 (retrive) 식으로 사용합니다.

간단한 sql 문은 거의 자연어 같이 그대로 읽을 수 있습니다. 간단한 예제:

```sql
SELECT id FROM wp_posts;

```

> wp_posts 테이블에서 id 필드들을 선택해(서 보여줘).

이제, 리비젼 데이터들은 wp_posts 테이블에서 지워 보겠습니다.

조금 어려워 졌지만, 역시 그럭저럭 읽을 수 있습니다:

```sql
DELETE FROM wp_posts WHERE post_type = "revision";

```

> post_type이 revision인 것들을 wp_posts 테이블에서 지워.

이 정도에서 된다면 좋겠지만 [ERD][2]를 살펴보면 포스트 아이디를 참조하는 테이블이 두개 더 있습니다. 이 두 테이블도 정리해야죠.

그러니까 테이블이 세 개고, 그 중 wp_posts테이블을 참조해서 두 테이블을 정리하면 되는데&#8230;

적당한 sql문을 쓰기 어려워서 검색을 통해 찾아냈습니다.

역시 자연스럽게 읽을&#8230;:

```sql
DELETE a,b,c
FROM wp_posts a
LEFT JOIN wp_term_relationships b ON (a.ID = b.object_id)
LEFT JOIN wp_postmeta c ON (a.ID = c.post_id)
WHERE a.post_type = 'revision'

```

> 이건 도저히 못 읽겠다!! ㅁ니ㅓ리나ㅓ리

해서, 이해할 수 있는 sql문들을 가지고 파이썬으로 재 구성 해 봅니다.

```python
#!/usr/bin/python
#-*- coding: utf-8 -*-
import MySQLdb

db = MySQLdb.connect(db='db_name', user='user', passwd='passwd', host='localhost')
c = db.cursor()

# type이 revison인 포스트들 삭제
c.execute('DELETE FROM wp_posts WHERE post_type = "revision"')

# 남아있는 포스트들의 아이디를 리스트에 postIDs 담자.
c.execute('SELECT id FROM wp_posts')
l_post = c.fetchall()
postIDs = map(lambda x: x[0], l_post)

# wp_postmeta 테이블에서 이미삭제된 포스트 아이디를 가진 아이템들 삭제.
c.execute('SELECT meta_id, post_id FROM wp_postmeta')
l_meta = c.fetchall()
for mid, pid in l_meta:
    if not pid in postIDs:
        c.execute('DELETE FROM wp_postmeta WHERE meta_id=%d'%mid)

# wp_term_relationships 테이블에서 이미삭제된 포스트 아이디를 가진 아이템들 삭제.
print c.execute('SELECT object_id FROM wp_term_relationships')
l_terms = c.fetchall()
for oid in l_terms:
    oid = oid[0]
    if not oid in postIDs:
        c.execute('DELETE FROM wp_term_relationships WHERE object_id=%d'%oid)

db.close()

```

이쪽이 훨씬 이해하기 좋네요. 조금 길어졌지만&#8230;

그리고, 돌려 보니 DB용량이 50% 쯤 정리되었습니다. 많이도 처묵처묵고 있었네요. -o-;

 [1]: http://ko.wikipedia.org/wiki/SQL
 [2]: http://codex.wordpress.org/File:WP_27_dbsERD.png