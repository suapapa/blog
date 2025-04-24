---
title: PythonMagickWand for Linux and Win32
author: suapapa
type: post
date: 2008-03-17T10:09:23+00:00
url: /p=38
dsq_thread_id:
  - 731542002
categories:
  - Programming
tags:
  - 파이썬

---
언샾에 대해 알아보다 보니, 국내에서는 포토웍스가 영어권에서는 -포토샾 다음으로?-[ImageMagick](http://www.imagemagick.org/)이라는 프로그램이 많이 사용 되더군요. 커맨드 라인 유틸리티(GUI 없습니다)로 윈도, 리눅스, 맥등의 플렛폼에서 돌아가며 소스까지 open되어 있습니다.

> <p align="left">
>   <strong>ImageMagick</strong> : 데비안에서는 imagemagick 패키지설치 윈도에서는 [이걸](http://www.imagemagick.org/download/binaries/ImageMagick-6.3.9-8-Q16-windows-dll.exe) 받아서 설치. MagickWand 라이브러리도 같이?설치됩니다.
> </p>



게다가 ImageMagick의 이미지 처리 과정을 C언어에서 사용할 수 있는 [MagickWand][1]?라는 라이브러리가 있고,?파이썬용 바인딩도 이미 존재하네요.

> [<strong>PythonMagickWand</strong>](http://www.procoders.net/?p=39)?: ctypes based wrapper for ImageMagick

안 그래도 파이썬의 PIL의 모자란 점들(unsharp?없음, 속도 느림)때문에 이미지 처리를 위한 다른 파이썬 라이브러리가 없나 찾아 보고 있었기에 얼른 테스트 해 보았습니다.

위의 링크에서 받은 PythonMagickWand가 맥의 MagickWand를 불러오도록 되어 있어 os.name을 사용해 윈도와 리눅스에서도 적당한 라이브러리를 불러오도록 코드를 조금 수정하였습니다.

> [**os_free.zip**][2]**?: patch for PythonMagickWand in Linux and Windows**

******<font color="#ff0000"></p> 

<blockquote>
  <p>
    <strong><font color="#ff0000">apply above patch to "PythonMagickWand.py"</font></strong>
  </p>
  
  <p>
    <strong><font color="#ff0000">"PythonMagickWand.py"에 위의 패치를 적용하세요.</font></strong>
  </p>
</blockquote>

<p>
  적용된 OS별 MagickWand라이브러리 위치는 아래와 같습니다.
</p>

<p>
  </font></strong>
</p>

<ul>
  <li>
    Win : "C:\Program Files\ImageMagick-6.3.9-Q16\CORE_RL_wand_.dll"
  </li>
  <li>
    Linux : "/usr/lib/libWand.so.9"
  </li>
  <li>
    Mac : "/opt/local/lib/libWand.dylib"
  </li>
</ul>

<p>
  맥용 라이브러리의 위치는 원 저자가 사용한 위치고 Win과 Linux에서의 위치는?직접 찾았습니다.
</p>

<p>
  아직 [MagickWand API](http://www.imagemagick.org/script/magick-wand.php)를 자세히 보지 못하여 파이썬 2.5에서 아래와 같이 간단한 리사이즈 기능을 테스트 해 보았습니다.
</p>

```python

from PythonMagickWand import *
MagickWandGenesis()
wand = NewMagickWand()
MagickReadImage(wand,”sample.jpg”)
MagickScaleImage(wand,200,200)
MagickWriteImage(wand,”out.png”)
```

<p>
  윈도XP와 데비안 리눅스에?모두 잘 되네요. 🙂
</p>

<p>
  ?see also : [another Python bindings for ImageMagick&#8217;s MagickWand API](http://www.assembla.com/wiki/show/pythonmagickwand)
</p>

 [1]: http://www.imagemagick.org/script/magick-wand.php
 [2]: https://homin.dev/asset/blog/2008/03/os_free.zip "os_free.zip"