---
title: 'pygooglechart: 파이썬 + 구글차트 = 한글되는 쉽고 예쁜 차트!'
author: suapapa
type: post
date: 2009-01-07T07:52:52+00:00
url: /p=168
dsq_thread_id:
  - 722490464
categories:
  - Programming
tags:
  - 소녀시대
  - 차트
  - 파이썬

---
경험상, 파이썬으로 차트를 그리는 일은 쉽지 않았습니다.

한글이 잘 나오는 차트 라이브러리를 찾기가 힘들어서, 파이썬 마을에서도 [관련 글타래][1]가 열렸었지만 이거다 싶은 답은 나오지 않았죠.

> [ChartDirector][2]의 경우 돈주고 사기엔 너무 안예쁘고, [matplotlib][3]는 강력하지만 쉽지 않습니다.

파이썬이라는 굴레를 벗어나 보면, 구글이 제공하는 [구글차트][4]의 경우 웹을 통해  데이타를 던지면 차트이미지를 보여줍니다만 그 [데이타를 만드는 일][5]이 여전히 만만해 보이지는 않았습니다.

자, 다시 -벌써?- 파이썬으로 돌아와 보면, 파이썬을 사용해 구글차트를 다루는 방법이 존재합니다. 다음 링크:

  * [**pygooglechart**][6]

pygooglechart로 쉽고, 한글이 잘 나오며, 꽤 예쁜 차트를 OS에 무관하게 생성할 수 있었습니다. 위의 링크를 참조해 라이브러리를 설치하고 예제들을 따라해 보세요.

  * 한글의 인코딩은 &#8216;utf-8&#8217;을 사용해야 합니다.
  * 폰트를 바꾸는 방법은 현재 존재하지 않는다네요.

저도, [차트로 그려보고 싶었던 포스팅][7]의 데이터들을 준비해 봤습니다.

```python
girls = ["티파니", "윤아", "태연", "제시카", "수영", "효연", "유리", "써니", "서현", "핸드폰"]
shownTimes = [92874, 92880, 71280, 56880, 53280, 53280, 24480, 24480, 24480, 24480]

```

파이차트를 만들어 봅니다.

```python
from pygooglechart import PieChart3D
chart = PieChart3D(430, 200) #크기
chart.set_colours(['FF4500']) #색상

```

데이타를 넣고 레이블과 제목을 붙여 줍니다.

```python
chart.add_data(shownTimes)
chart.set_pie_labels(girls)
chart.set_title('소녀시계 출연횟수')

```

준비완료! 다음 멤버 함수로 이 차트에 해당하는 URL을 받을 수도 있고, (네, pygooglechart는 구글차트에 전달할 쿼리를 생성하는 라이브러리 입니다)

```python
chart.get_url()

```

바로 이미지 파일로 다운로드 할 수도 있습니다.

```python
chart.download('~/GirlsInClock.png')

```

![](https://asset.homin.dev/blog/image/GirlsInClock.webp)

짜잔!  "너무 빤짝빤짝 눈이 부신" 그래프가 뚝딱하고 나왔어요.

 

 [1]: http://bbs.python.or.kr/viewtopic.php?t=24146&highlight=&sid=f724216baec6c022a74194708e9e32f2
 [2]: http://www.advsofteng.com/
 [3]: http://matplotlib.sourceforge.net/
 [4]: http://code.google.com/intl/ko-KR/apis/chart/
 [5]: http://leegh.com/2694185
 [6]: http://pygooglechart.slowchop.com/
 [7]: https://homin.dev/blog/p=87