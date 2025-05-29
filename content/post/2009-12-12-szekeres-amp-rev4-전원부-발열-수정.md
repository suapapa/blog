---
title: 'Szekeres Amp rev4 : 전원부 발열 수정'
author: suapapa
type: post
date: 2009-12-12T09:02:45+00:00
url: /p=456
aktt_notify_twitter:
  - no
dsq_thread_id:
  - 722490869
categories:
  - DIY
  - Music
  - MyProject
tags:
  - EagleCad
  - 헤드폰엠프

---
요즘은 생업이 넘흐 바뻐서 블로그 포스팅이 꽤 뜸해졌네요.

[일전에 만들었던 Szekeres Amp.][1] 를 모두 분양해 드려서 저 쓰려고 새로 만들어 봤습니다.

 ![](https://asset.homin.dev/blog/image/SzekeresRev4_top.jpg)

기존 전원부 자리에 커다랑 코일이 자리잡은게 보이시나요?

Szekeres 는 기본적으로 열이 펄펄 나는 앰프인데, 두 파워모스펫 외에도 -기존 9V 레귤레이터- 7809에서도 &#8216;이래되 되나?&#8217;  싶은 정도의 열이 납니다.

해서 -홈서버 전원부 용으로 사 둔- LM2576-12 라는 스위칭 레귤레이터로 전원부를 바꿔 봤습니다.

신정섭님의 ref 와 같은 12V 단전원 사용하게 되었습니다.

> 스위칭 레귤레이터에 대해서는 따로 포스팅을 준비하고 있습니다. 언젠가는&#8230;

이 IC는 3A급 인지라, Szekere의 필요치인 -78xx 에게는 부담스러운- 1A 미만의 전류 공급은 방열판 없이도 30도 미만의 미열만으로 제공해 주네요. so cool~.

 ![](https://asset.homin.dev/blog/image/SzekeresRev4_btm.jpg)

스위칭 레귤레이터의 &#8216;스위칭&#8217;이라는 이름에서 알 수 있듯이 껏다켰다를 반복하여 전압을 업/다운 하기 때문에,

귀에 들리는 주파수가 남아있지 않을까 라는 우려가 있었는데, 오랜 시간 사용된(검증된?) IC답게 정전압 아답터를 사용하지 않았어도(19V 묻지마 아답터) 전원부 노이즈는 없었습니다! 🙂

![](https://asset.homin.dev/blog/image/SzekeresRev4_brd.png)

남는 39ohm 저항이 있어, 병렬로 연결하여,20ohm 시멘트 저항 대신 사용하였구요. HAS신정섭님의 ref에서 사용한 170ohm(안팔더군요)대신 180ohm으로 만들어 봤습니다.

전원을 올린 것, 조금씩 다른 부품들을 사용한 것이 대한 음질의 차이는&#8230; 제 귀로는 못 느끼겠네요. 역시 명불허전 Szekeres인지라 그냥 좋아요. 🙂

 

이전 SVN저장소에서 버전 업 된 brd, sch 를 확인하실 수 있습니다.

 

  * [회로도, 아트웍 다운로드(Svn Repo) ](https://homin.dev/svn/HW/SzekeresAmp)-EagleCad 파일

 [1]: https://homin.dev/blog/p=107