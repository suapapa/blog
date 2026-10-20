---
title: NautilusSvn on 우분투 8.04
author: suapapa
type: post
date: 2008-06-02T11:02:39+00:00
url: /p=72
dsq_thread_id:
  - 731577174
categories:
  - Linux
tags:
  - svn

---
NautilusSvn은 그놈-노틸러스 환경에서 사용할 수 있는, 윈도용 GUI SVN 클라이언트인 [TortoiseSvn][1]의 클론입니다.

그간 잘 사용하던 NautilusSvn이 우분투 8.04에서 동작하지 않더군요.

우분투 8.04에서도 다음의 방법으로 설치하여 사용하실 수 있습니다.



[우분투 포럼에 올린 NautilusSvn 소개 글타래][2]에서 **nautilussvn_0.11-1.deb**를 다운받아 설치합니다. 그곳에서 스크린 샷도 확인하실 수 있습니다. 멋지지 않나요? 🙂

8.04로 넘어오면서 노틸러스 확장 디렉토리가 바뀌어 실행이 안되는데 아래와 같이 심볼링 링크를 겁니다.

```bash
$ sudo ln -s /usr/lib/nautilus/extensions-1.0/python/NautilusSvn.py \
/usr/lib/nautilus/extensions-2.0/python/NautilusSvn.py

```

이제 그놈을 재시작. (혹은 재부팅) 합니다.

여기부터는 사족.

extensions-1.0 -> extensions-2.0 으로 디렉토리가 바뀐것 때문인데 노틸러스가 왜 저렇게 디렉토리에 버젼명을 명시해 두는지 모르겠네요.

extensions라는 심볼릭링크를 extensions-2.0 에 걸어두는게 NautilusSvn같이 버젼에 상관없이 잘 동작하는 확장들을 사용하는데 더 편리할 것 같은데 말이죠.

 [1]: http://tortoisesvn.tigris.org/
 [2]: http://www.ubuntu.or.kr/viewtopic.php?f=9&t=93