---
title: FT232RL single side breakout
author: suapapa
type: post
date: 2008-10-06T06:33:06+00:00
url: /p=105
translations:
  - 'a:1:{i:0;s:4044:"YToxOntzOjI6ImtvIjthOjM6e3M6MTE6InBvc3RfZXhjZXB0IjtzOjA6IiI7czoxMjoicG9zdF9jb250ZW50IjtzOjI5MDE6IlVTQiDsi5zrpqzslrwg67OA7ZmYIOuztOuTnOulvCDrp4zrk6Tsl4jsirXri4jri6QuPyDsoIDripQgVVNCIHRvIFNlcmlhbCDsvIDsnbTruJTsl5Ag642w7J24IOyggeydtCDsnojslrTshJwg7Iuc66as7Ja8IO2PrO2KuOqwgCDsnojsnLzrqbQg6re46rG4IOyCrOyaqe2VmOuKlCDtjrjsnbjrjbAsIFVTQiBBcmR1aW5v7JeQIOyCrOyaqeuQnCBGVDIzMlJM7Lmp7J2YIC3snpgg65Cc64uk64qULSDrqoXshLHsl5Ag7Zi57ZW0IFVTQiDsi5zrpqzslrzsl5Ag67Cc7J2EIOuTpOyXrCDrhpPqsowg65CY7JeI7Iq164uI64ukLgoKPGltZyBzcmM9JnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8xMC9mdDIzMnJsX3NpbmdsZXNpZGVfYnJlYWtvdXQucG5nJnF1b3Q7IGFsdD0mcXVvdDtmdDIzMnJsX3NpbmdsZXNpZGVfYnJlYWtvdXQucG5nJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7MzY5JnF1b3Q7IGhlaWdodD0mcXVvdDszMjAmcXVvdDsgLz4KCjwhLS1tb3JlLS0+IDxpbWcgc3JjPSZxdW90Oy93b3JkcHJlc3Mvd3AtY29udGVudC91cGxvYWRzLzIwMDgvMTAvZnQyMzJybF9zaW5nbGVzaWRlX2JyZWFrb3V0X3NjaC5qcGcmcXVvdDsgYWx0PSZxdW90O2Z0MjMycmxfc2luZ2xlc2lkZV9icmVha291dF9zY2guanBnJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7NDIwJnF1b3Q7IGhlaWdodD0mcXVvdDsyMzkmcXVvdDsgLz4KPHVsPgoJPGxpPjxzdHJvbmc+PGEgaHJlZj0mcXVvdDtodHRwOi8vd2ViLnN1YXBhcGEubmV0OjgwODAvc3ZuL0hXL2JyZWFrb3V0L0ZUMjMyX2JyZWFrb3V0JnF1b3Q7PmRvd25sb2FkIHNjaCZhbXA7YnJkICjsnbTquIDsupDrk5wpPC9hPjwvc3Ryb25nPjwvbGk+CjwvdWw+CjxhIGhyZWY9JnF1b3Q7aHR0cDovL3d3dy5zcGFya2Z1bi5jb20vY29tbWVyY2UvdHV0b3JpYWxfaW5mby5waHA/dHV0b3JpYWxzX2lkPTEwOCZxdW90OyB0YXJnZXQ9JnF1b3Q7X2JsYW5rJnF1b3Q7PlNwYXJrZnVuXCdzIEVhZ2xlQ2FkIHR1dG9yaWFsPC9hPuyXkCDshozqsJzrkJwg7ZqM66Gc64+E66W8IOq4sOuwmOycvOuhnCDsnpHshLHtlojsnLzrqbAg7JWE656Y7J2YIOq4sOuKpeuTpOydtCDstpTqsIAg65CY7JeI7Iq164uI64ukLgo8dWw+Cgk8bGk+UlgvVFggTEVEPC9saT4KCTxsaT5waW5oZWFkZXIgZm9yIDMuM1Ygb3V0PC9saT4KCTxsaT51c2Ugb25seSBvbmUgc21kIHBhcnQgKEZUMjMyUkwpPC9saT4KCTxsaT5zaW5nbGUgc2lkZSAoYW5kIG5vIGp1bXBpbmcgd2lyZSEpPC9saT4KPC91bD4K64SkISDrrLzroaAg64uk66a87KeIIOyXkOy5rSBQQ0LsmqnsnLzroZwg66eM65OgIOqygyDsnoXri4jri6QuIOyZhOyEse2SiOydmCDsgqzsp4TsnYQg67O07Iuc7KOgLgo8aW1nIHNyYz0mcXVvdDsvd29yZHByZXNzL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDA4LzA5L2ltZ3A0NzQzLmpwZyZxdW90OyBhbHQ9JnF1b3Q7aW1ncDQ3NDMuanBnJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7NDIwJnF1b3Q7IGhlaWdodD0mcXVvdDsyODAmcXVvdDsgLz4KPGJsb2NrcXVvdGU+66y07YSx64yA6rOgIOunjOuTpOyXiOuNmCDsi5zrpqzslrwg67OA7ZmYIOuztOuTnCjsmbzsqr0p7JeQIOu5hO2VtCDtgazquLDrj4Qg7J6R6rOgIOu2gO2SiOuPhCDsmIjsgZjqsowg67Cw7LmYIOuQmOyXiOyKteuLiOuLpC48L2Jsb2NrcXVvdGU+CjxpbWcgc3JjPSZxdW90Oy93b3JkcHJlc3Mvd3AtY29udGVudC91cGxvYWRzLzIwMDgvMDkvaW1ncDQ3NDguanBnJnF1b3Q7IGFsdD0mcXVvdDtpbWdwNDc0OC5qcGcmcXVvdDsgY2xhc3M9JnF1b3Q7aW1hZ2VmcmFtZSZxdW90OyB3aWR0aD0mcXVvdDs0MjAmcXVvdDsgaGVpZ2h0PSZxdW90OzI3OSZxdW90OyAvPgo8YmxvY2txdW90ZT41ViwgR05ELCBSWCwgVFgg7LyA7J2067iU7J2AIOq1rO2YlSBQQ+y8gOydtOyKpOyXkOyEnCDrlrzslrTrhKggVVNCPyDsvIDsnbTruJTsnYQg7IKs7Jqp7ZaI7Iq164uI64ukLiDrlLHsnbTslbwhPC9ibG9ja3F1b3RlPgo8aW1nIHNyYz0mcXVvdDsvd29yZHByZXNzL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDA4LzA5L2ltZ3A0NzQ5LmpwZyZxdW90OyBhbHQ9JnF1b3Q7aW1ncDQ3NDkuanBnJnF1b3Q7IGNsYXNzPSZxdW90O2ltYWdlZnJhbWUmcXVvdDsgd2lkdGg9JnF1b3Q7NDIwJnF1b3Q7IGhlaWdodD0mcXVvdDsyODAmcXVvdDsgLz4KPGJsb2NrcXVvdGU+64uo66m0IOq4sO2MkOydtOuvgOuhnCBGVDIzMlJM7J2AIOuwkSDrtoDrtoTsl5Ag7J6I7Iq164uI64ukLjwvYmxvY2txdW90ZT4K7JyI64+E7JeQ7IScIOyCrOyaqe2VmOugpOuptCA8YSBocmVmPSZxdW90O2h0dHA6Ly93d3cuZnRkaWNoaXAuY29tL0ZURHJpdmVycy5odG0mcXVvdDsgdGFyZ2V0PSZxdW90O19ibGFuayZxdW90Oz5GVERJIOyciOuPhOyaqSDrk5zrnbzsnbTrsoQ8L2E+66W8IOyEpOy5mCDtlZjsi5zrqbQg65CY6rOgLCDsmrDrtoTtiKzsl5DshJzripQsIOuTnOudvOydtOuyhCDrlLDroZwg7ISk7LmY7ZWgIOqygyDsl4bsnbQsIOq3uOuDpSDsnqHtnpnri4jri6QuIOyymSEg7ZWY6rOgIOyeoe2eiOuKlCDrqqjsirXsnYQg67O064uIIOuvv+ydjOydtCDrrLTrn63rrLTrn60g7IOd6riw64Sk7JqULgoKQXJkdWlubyBTL1fsl5DshJwgVG9vbHMtJmd0O1NlcmlhbCBQb3J0IOuplOuJtOulvCDshKDtg53tlbQg67O066m0IOy2lOqwgOuQnCDtj6ztirjqsIAg67O07J206rOgIOyLnOumrOyWvCDtj6ztirjsmYAg65iR6rCZ7J20IOuPmeyeke2VqeuLiOuLpC4KCuydtOqyjCDqvK0g7ZWE7JqU7ZaI642Y6rG0IOyVhOuLiOyngOunjC4uLiDqvK0g7ZWE7JqU7ZW07IScIOyngOultOuKlOqxtCDslYTri4jsnpbslYTsmpQuIO2YuO2YuO2YuC4uLiI7czoxMDoicG9zdF90aXRsZSI7czoyODoiRlQyMzJSTCBzaW5nbGUgc2lkZSBicmVha291dCI7fX0=";}'
dsq_thread_id:
  - 722489236
categories:
  - Arduino
  - MyProject
tags:
  - EagelCad
  - PCB
  - 전자회로

---
USB 시리얼 변환 보드를 만들었습니다.? 저는 USB to Serial 케이블에 데인 적이 있어서 시리얼 포트가 있으면 그걸 사용하는 편인데, USB Arduino에 사용된 FT232RL칩의 -잘 된다는- 명성에 혹해 USB 시리얼에 발을 들여 놓게 되었습니다.

<img loading="lazy" src="https://homin.dev/asset/suapapa-blog/wp-content_uploads/2008/10/ft232rl_singleside_breakout.png" alt="ft232rl_singleside_breakout.png" class="imageframe" width="369" height="320" /> 

<!--more-->

<img loading="lazy" src="https://homin.dev/asset/suapapa-blog/wp-content_uploads/2008/10/ft232rl_singleside_breakout_sch.jpg" alt="ft232rl_singleside_breakout_sch.jpg" class="imageframe" width="420" height="239" /> 

  * **[download sch&brd (이글캐드)][1]**

<a href="http://www.sparkfun.com/commerce/tutorial_info.php?tutorials_id=108" target="_blank" rel="noopener">Sparkfun&#8217;s EagleCad tutorial</a>에 소개된 회로도를 기반으로 작성했으며 아래의 기능들이 추가 되었습니다.

  * RX/TX LED
  * pinheader for 3.3V out
  * use only one smd part (FT232RL)
  * single side (and no jumping wire!)

네! 물론 다림질 에칭 PCB용으로 만든 것 입니다. 완성품의 사진을 보시죠.  
<img loading="lazy" src="https://homin.dev/asset/suapapa-blog/wp-content_uploads/2008/09/imgp4743.jpg" alt="imgp4743.jpg" class="imageframe" width="420" height="280" /> 

> 무턱대고 만들었던 시리얼 변환 보드(왼쪽)에 비해 크기도 작고 부품도 예쁘게 배치 되었습니다.

<img loading="lazy" src="https://homin.dev/asset/suapapa-blog/wp-content_uploads/2008/09/imgp4748.jpg" alt="imgp4748.jpg" class="imageframe" width="420" height="279" /> 

> 5V, GND, RX, TX 케이블은 구형 PC케이스에서 떼어넨 USB? 케이블을 사용했습니다. 딱이야!

<img loading="lazy" src="https://homin.dev/asset/suapapa-blog/wp-content_uploads/2008/09/imgp4749.jpg" alt="imgp4749.jpg" class="imageframe" width="420" height="280" /> 

> 단면 기판이므로 FT232RL은 밑 부분에 있습니다.

윈도에서 사용하려면 <a href="http://www.ftdichip.com/FTDrivers.htm" target="_blank" rel="noopener">FTDI 윈도용 드라이버</a>를 설치 하시면 되고, 우분투에서는, 드라이버 따로 설치할 것 없이, 그냥 잡힙니다. 척! 하고 잡히는 모습을 보니 믿음이 무럭무럭 생기네요.

Arduino S/W에서 Tools->Serial Port 메뉴를 선택해 보면 추가된 포트가 보이고 시리얼 포트와 똑같이 동작합니다.

이게 꼭 필요했던건 아니지만&#8230; 꼭 필요해서 지르는건 아니잖아요. 호호호&#8230;

 [1]: https://homin.dev/svn/HW/breakout/FT232_breakout