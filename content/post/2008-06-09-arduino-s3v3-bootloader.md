---
title: Arduino S3V3 bootloader
author: suapapa
type: post
date: 2008-06-09T03:53:54+00:00
url: /p=74
translations:
  - 'a:1:{i:0;s:7716:"YToxOntzOjI6ImtvIjthOjM6e3M6MTE6InBvc3RfZXhjZXB0IjtzOjA6IiI7czoxMjoicG9zdF9jb250ZW50IjtzOjU2NTk6IjxwPkFyZHVpbm/ripQg7Iuc66as7Ja8IO2PrO2KuCjtmLnsnYAgVVNCKeulvCDthrXtlbQgLUlTUOqwgCDsl4bsnbQtIO2UhOuhnOq3uOueqOydhCDsi6zsnYQg7IiYIOyeiOyKteuLiOuLpC4g64uoIOydtOqxuCDqsIDriqXtlZjqsowg7ZWY6riwIOychO2VtCDstZzstIgg7ZWc67KIIElTUOuhnCBBVlLsl5Ag67aA7Yq466Gc642U66W8IOyLrOyWtOyVvCDtlanri4jri6QuIOq4sCDsobDrpr3rkJwgQXJkdWlub+ulvCDqtazsnoXtlZjshajri6TrqbQg7J2066+4IOu2gO2KuOuhnOuNlOqwgCDsi6zslrTsoLgg7J6I7Jy866+A66GcIOydtCDqs7zsoJXsnbQg7ZWE7JqUIOyXhuyKteuLiOuLpC4gIOyngeygkSDrp4zrk6AgQXJkdWlubyBTM1YzIOyXkOuKlCDrrLzroaAg67aA7Yq466Gc642U6rCAIOyXhuycvOuvgOuhnCDsp4HsoJEg7Ius7Jy87IWU7JW8IO2VqeuLiOuLpC4gIOyasOyEoCBJU1DqsIAg7ZWE7JqU7ZWp64uI64ukLiDsoJwg6rK97JqwLCDqsIDsnqUg7KCA66C07ZWY6rOgIDZwaW4g7LyA7J2067iU7J20IO2PrO2VqOuQmOyWtCDsnojquLDsl5AsIO2OmOufrOuftCDrsKnsi53snZg/PGEgaHJlZj1cXCZxdW90O2h0dHA6Ly93d3cuZGV2aWNlbWFydC5jby5rci9tYXJ0Ny9tYWxsLnBocD9jYXQ9MDEwMDAyMDAwJmFtcDtxdWVyeT12aWV3JmFtcDtubz0xNDQ3OFxcJnF1b3Q7Pk5ULUlTUDwvYT7rpbwg6rWs7J6F7ZaI7Iq164uI64ukLjwvcD4NCjwhLS1tb3JlLS0+DQo8cD48aW1nIGFsdD1cXCZxdW90O250LWlzcF93aXRoX2FyZHVpbm9zM3YzLmpwZ1xcJnF1b3Q7IGNsYXNzPVxcJnF1b3Q7aW1hZ2VmcmFtZVxcJnF1b3Q7IHdpZHRoPVxcJnF1b3Q7NDIwXFwmcXVvdDsgaGVpZ2h0PVxcJnF1b3Q7MjgwXFwmcXVvdDsgc3JjPVxcJnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wNi9udC1pc3Bfd2l0aF9hcmR1aW5vczN2My5qcGdcXCZxdW90OyAvPiAgSVNDUCDtj6ztirjsl5AgMeuyiCDtlYAg7JyE7LmY7JeQIOyjvOydmO2VmOyXrCDsnITsmYAg6rCZ7J20IOyXsOqysO2VqeuLiOuLpC4gIOuLpOydjOydgCA8YSBocmVmPVxcJnF1b3Q7aHR0cDovL3d3dy5hcmR1aW5vLmNjL2VuL01haW4vU29mdHdhcmVcXCZxdW90Oz5BcmR1aW5vIFNvZnR3YXJl66W8IOuLpOyatDwvYT4g67Cb7Iq164uI64ukLiAmcXVvdDs8c3Ryb25nPi9hcmR1aW5vLTAwMTEvaGFyZHdhcmUvYm9vdGxvYWRlcnMvJnF1b3Q7PC9zdHJvbmc+IO2PtOuNlOyXkCBBVlLqs7wgQXJkdWlubyDsooXrpZjsl5Ag65Sw6528IOy7tO2MjOydvOuQnCDrtoDtirjroZzrjZTsmYAg7IaM7Iqk6rCAIOuTpOyWtOyeiOyKteuLiOuLpC4gQXJkdWlubyDsgqzsnbTtirjsnZggPGEgaHJlZj1cXCZxdW90O2h0dHA6Ly93d3cuYXJkdWluby5jYy9lbi9IYWNraW5nL0Jvb3Rsb2FkZXJcXCZxdW90Oz5Cb290bG9hZGVyPC9hPu2OmOydtOyngOulvCDssLjsobDtlbQg67O064uIIEFyZHVpbm8gUy9X7JeQ7IScIOuwlOuhnCDrtoDtirjroZzrjZTrpbwg7Ius64qUIOqyg+ydtCDqsIDriqXtlanri4jri6QuPC9wPg0KPGJsb2NrcXVvdGU+6re465+w642wLi4/7JWI64+8IC1fLTs8L2Jsb2NrcXVvdGU+DQo8cD7rtoDtirjroZzrjZQg7IaM7Iqk7JmAIO2VqOq7mCDsnojripQgTWFrZWZpbGXsnYQg6rmMIOuztOuLiCB1c2lw66GcIOu2gO2KuOuhnOuNlOulvCDsi6zripQg67Cp67KV7J2EIOywvuydhCDsiJgg7J6I7JeI7Iq164uI64ukLiDjhLHjhLHjhYV+PC9wPg0KPGJsb2NrcXVvdGU+6re4656Y64+ELi4g7JWI64+8IC1fLTs7PC9ibG9ja3F1b3RlPg0KPHA+7ZWc7LC47J2EIOyCveyniO2VmOuLpCDslYzslYTrgrgg6rKDLiA8c3Ryb25nPk5ULUlTUOuKlCA8L3N0cm9uZz48YSBocmVmPVxcJnF1b3Q7aHR0cDovL3d3dy5hcmR1aW5vLmNjL2VuL0hhY2tpbmcvUGFyYWxsZWxQcm9ncmFtbWVyXFwmcXVvdDs+PHN0cm9uZz5BcmR1aW5v7IKs7J207Yq47JeQ7IScIOunkO2VmOuKlCDtjKjrn6zrn7QgSVNQPC9zdHJvbmc+PC9hPjxzdHJvbmc+7JmAIOuLpOultOuLpCEhPC9zdHJvbmc+IHVzaXDsnZggaGVscOulvCDssKjqt7zssKjqt7wg7IK07Y6067O064uIIO2MqOufrOuftCBJU1Drp4wg7KKF66WY6rCAIC3soIQg64ukIOuYkeqwmeydgCDqsbDrnbzqs6Ag6rCA7KCV7ZaI7JeI64qU642wLSAxMOyXrOqwgOyngCDrkJjripTqtbDsmpQuICDtjKjrn6zrn7QgSVNQ7J2YIOyiheulmOulvCDsnpjrqrsg7KeA7KCV7ZWcIOqyveyasCDri6TsmrTroZzrk5zripQg7KCV7IOB7KCB7Jy866GcIOydtOujqOyWtCDsp4DripQg6rKDIOyymOufvCDrs7TsnbTsp4Drp4wgVmVyaWZ57JeQ7IScIOyXkOufrOqwgCDso7zro6jro6kg64KY7Ji164uI64ukLjwvcD4NCjxibG9ja3F1b3RlPuq3uOuemOyEnC4uIOutlOuNsD8gLV8tOzs7PC9ibG9ja3F1b3RlPg0KPHA+SVNQ66W8IOyDiOuhnCDsgqzslbwg7ZWY64KYPyDqsbHsoJXrkJjsl4jsp4Drp4wg6rKw6rWtIOydtCDrhYDshJ3snLzroZwg67aA7Yq466Gc642U66W8IOyLrOuKlOuNsCDshLHqs7XtlZjsmIDsirXri4jri6QuIOyasOyEoCDslYTrnpjsmYAg6rCZ7J20ICZxdW90O2J1cm4mcXVvdDsg7Iqk7YGs66a97Yq466W8IOyekeyEse2VmOyYgOyKteuLiOuLpC4gIOu2gO2KuOuhnOuNlOydmCBtYWtlZmlsZeydhCDssLjsobDtlZjsmIDqs6AsIGRwcm9n66W8ICZxdW90O2RhcGEmcXVvdDvsl5DshJwgJnF1b3Q7c3RrMjAwJnF1b3Q77Jy866GcIOyImOygle2VmOyYgOyKteuLiOuLpC4gc3RrMjAwIOywvuuKkOudvCDsmLXshZjsnZgg7Yyo65+s65+0IO2UhOuhnOq3uOuemOuouOuTpOydhCDtlZzrsojslKkg64ukIO2VtOu0pOuLpOuKpS4gIO2UhOuhnOq3uOuemOuouChkcHJvZykg7Ji17IWY7J2EIOyemOuqu+ykgOuLpOqzoCDrp53qsIDsp4Dsp4Ag7JWK7Iq164uI64ukLiA6KTwvcD4NCjxwcmUgbGFuZz1cXCZxdW90O2Jhc2hcXCZxdW90Oz4NCiMhL2Jpbi9iYXNoDQp1aXNwIC1kcGFydD1BVG1lZ2E4IC1kcHJvZz1zdGsyMDAgLWRscHQ9MHgzNzggLS13cl9sb2NrPTB4RkYNCnNsZWVwIDENCnVpc3AgLWRwYXJ0PUFUbWVnYTggLWRwcm9nPXN0azIwMCAtZGxwdD0weDM3OCAtLXdyX2Z1c2VfbD0weGRmIC0td3JfZnVzZV9oPTB4Y2ENCnNsZWVwIDENCnVpc3AgLWRwYXJ0PUFUbWVnYTggLWRwcm9nPXN0azIwMCAtZGxwdD0weDM3OCAtLWVyYXNlIC0tdXBsb2FkIC0tdmVyaWZ5IGlmPSQxIC12PTINCnNsZWVwIDENCnVpc3AgLWRwYXJ0PUFUbWVnYTggLWRwcm9nPXN0azIwMCAtZGxwdD0weDM3OCAtLXdyX2xvY2s9MHhDRjwvcHJlPg0KPHA+7J207KCcIOuLpOydjOqzvCDqsJnsnbQg7Iuk7ZaJIO2VqeuLiOuLpC4g7Yyo65+s65+0IO2PrO2KuOyXkCDsp4HsoJEg7KCR6re87ZWY6riwIOychO2VtCByb290IOq2jO2VnOydtCDtlYTsmpTtlanri4jri6QuPC9wPg0KPHByZSBsYW5nPVxcJnF1b3Q7YmFzaFxcJnF1b3Q7Pg0KL2FyZHVpbm8tMDAxMS9oYXJkd2FyZSQgc3VkbyAuL2J1cm4gYm9vdGxvYWRlcnMvYXRtZWdhOC9BVG1lZ2FCT09ULmhleA0KQXRtZWwgQVZSIEFUbWVnYTggaXMgZm91bmQuDQpXcml0aW5nIGxvY2sgYml0cyAuLi4NClJlaW5pdGlhbGl6aW5nIGRldmljZQ0KQXRtZWwgQVZSIEFUbWVnYTggaXMgZm91bmQuDQoNCkxvY2sgQml0cyBzZXQgdG8gMHhmZg0KQXRtZWwgQVZSIEFUbWVnYTggaXMgZm91bmQuDQoNCkZ1c2UgTG93IEJ5dGUgc2V0IHRvIDB4ZGYNCg0KRnVzZSBIaWdoIEJ5dGUgc2V0IHRvIDB4Y2ENCkFWUiBEaXJlY3QgUGFyYWxsZWwgQWNjZXNzIHN1Y2NlZWRlZCBhZnRlciAwIHJldHJpZXMuDQpBdG1lbCBBVlIgQVRtZWdhOCBpcyBmb3VuZC4NCkVyYXNpbmcgZGV2aWNlIC4uLg0KUmVpbml0aWFsaXppbmcgZGV2aWNlDQpBVlIgRGlyZWN0IFBhcmFsbGVsIEFjY2VzcyBzdWNjZWVkZWQgYWZ0ZXIgMCByZXRyaWVzLg0KQXRtZWwgQVZSIEFUbWVnYTggaXMgZm91bmQuDQpVcGxvYWRpbmc6IGZsYXNoDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KKHRvdGFsIDEwMDIgYnl0ZXMgdHJhbnNmZXJyZWQgaW4gMC42NiBzICgxNTExIGJ5dGVzL3MpDQpQb2xsaW5nOiBjb3VudCA9IDE2LCBtaW4vYXZnL21heCA9IDIuMjQvNC45NC84LjM4IG1zDQpWZXJpZnlpbmc6IGZsYXNoDQojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KKHRvdGFsIDEwMDIgYnl0ZXMgdHJhbnNmZXJyZWQgaW4gMC41OCBzICgxNzQyIGJ5dGVzL3MpDQpBdG1lbCBBVlIgQVRtZWdhOCBpcyBmb3VuZC4NCldyaXRpbmcgbG9jayBiaXRzIC4uLg0KUmVpbml0aWFsaXppbmcgZGV2aWNlDQpBdG1lbCBBVlIgQVRtZWdhOCBpcyBmb3VuZC4NCg0KTG9jayBCaXRzIHNldCB0byAweGNmPC9wcmU+DQoNCuuCtOyaqey2lOqwgCwgQVRNRUdBOCDsnbTtm4TsnZgg7Lmp65Ok7J2AIOuqqOuRkCB1aXNwIOuMgOyLoCBhdnJkdWRl66W8IOyCrOyaqe2VmOqyjCBNYWtlZmlsZeydtCDsiJjsoJXrkJjslrQg7J6I7Iq164uI64ukLiB1aXNw66GcIOyLpO2MqO2VmOyLoCDrtoTsnYAgYXZyZHVkZeulvCDsgqzsmqntlZjripQg64uk7J2MIOyKpO2BrOumve2KuOulvCDsgqzsmqntlbQg67O07IS47JqULg0KDQo8cHJlIGxhbmc9XFwmcXVvdDtiYXNoXFwmcXVvdDs+DQojIS9iaW4vYmFzaA0KDQojIG1heSBydW4gdGhpcyBzY3JpcHQgd2l0aCBzdWRvDQojIHRoaXMgc2NyaXB0IGJ1cm4gYm9vdGxvYWRlciBmb3IgQVRNRUdBOCB1c2luZyBOVC1JU1Aoc3RrMjAwKSwgcGFyYXJlbGwgcHJvZ3JhbW1lci4NCiMgZm9sbG93aW5nIGJpbmF5IHBhdGggaXMgcG9pbnQgY29udGVudHMgZnJvbSB1YnVudHUgcGFja2FnZSBhcmR1aW5vLg0KDQpCSU5BUlk9L3Vzci9zaGFyZS9hcmR1aW5vL2hhcmR3YXJlL2FyZHVpbm8vYm9vdGxvYWRlcnMvYXRtZWdhOC9BVG1lZ2FCT09ULmhleA0KSEZVU0U9MHhDQQ0KTEZVU0U9MHhERg0KDQpBVlJEVURFX09QVFM9XFwmcXVvdDstY3N0azIwMCAtcG04IC1QL2Rldi9wYXJwb3J0MFxcJnF1b3Q7DQojQVZSRFVERV9PUFRTPVxcJnF1b3Q7LWNzdGs1MDAgLXBtOCAtUC9kZXYvdHR5VVNCMFxcJnF1b3Q7DQoNCmF2cmR1ZGUgJEFWUkRVREVfT1BUUyAtZSAtdSAtVWxvY2s6dzoweDNmOm0gLVVlZnVzZTp3OjB4MDA6bSAtVWhmdXNlOnc6JEhGVVNFOm0gLVVsZnVzZTp3OiRMRlVTRTptDQphdnJkdWRlICRBVlJEVURFX09QVFMgLVVmbGFzaDp3OiRCSU5BUlkgLVVsb2NrOnc6MHgwZjptDQo8L3ByZT4NCg0KPHA+7J207KCcIElTUCDsvIDsnbTruJTsnYQg7KCc6rGw7ZWY6rOgIFJlc2V0IOuyhO2KvOydhCDriITrpbTrqbQgTEVEIDEzICjsgqzsp4TsnZgg64W4656A7IOJIExFRCnqsIAg7YyM652865286529ISDsoJDrqbjtlZjrqbAg67aA7Yq466Gc642U6rCAIOyemCDsi6zslrTsoYzsnYzsnYQg7JWM66a964uI64ukLiAgPGltZyBhbHQ9XFwmcXVvdDthcmR1aW5vczN2M19ib290bG9hZGVyX29uLmpwZ1xcJnF1b3Q7IGNsYXNzPVxcJnF1b3Q7aW1hZ2VmcmFtZVxcJnF1b3Q7IHdpZHRoPVxcJnF1b3Q7NDIwXFwmcXVvdDsgaGVpZ2h0PVxcJnF1b3Q7MjgwXFwmcXVvdDsgc3JjPVxcJnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvMjAwOC8wNi9hcmR1aW5vczN2M19ib290bG9hZGVyX29uLmpwZ1xcJnF1b3Q7IC8+ICA8c3Ryb25nPj/tlZzspITsmpTslb0gTlQtSVNQID0gU1RLLTIwMDwvc3Ryb25nPjwvcD4iO3M6MTA6InBvc3RfdGl0bGUiO3M6MjM6IkFyZHVpbm8gUzNWMyBib290bG9hZGVyIjt9fQ==";}'
dsq_thread_id:
  - 722490051
categories:
  - Arduino
tags:
  - ArduinoS3V3

---
Arduino는 시리얼 포트(혹은 USB)를 통해 -ISP가 없이- 프로그램을 심을 수 있습니다. 단 이걸 가능하게 하기 위해 최초 한번 ISP로 AVR에 부트로더를 심어야 합니다. 기 조립된 Arduino를 구입하셨다면 이미 부트로더가 심어져 있으므로 이 과정이 필요 없습니다.

직접 만든 Arduino S3V3 에는 물론 부트로더가 없으므로 직접 심으셔야 합니다.

우선 ISP가 필요합니다. 제 경우, 가장 저렴하고 6pin 케이블이 포함되어 있기에, 페러럴 방식의?[NT-ISP][1]를 구입했습니다.



![](https://homin.dev/asset/blog/2008/06/nt-isp_with_arduinos3v3.jpg)

ISCP 포트에 1번 핀 위치에 주의하여 위와 같이 연결합니다.

다음은 [Arduino Software를 다운][2] 받습니다. "**/arduino-0011/hardware/bootloaders/"** 폴더에 AVR과 Arduino 종류에 따라 컴파일된 부트로더와 소스가 들어있습니다. Arduino 사이트의 [Bootloader][3]페이지를 참조해 보니 Arduino S/W에서 바로 부트로더를 심는 것이 가능합니다.

> 그런데..?안돼 -_-;

부트로더 소스와 함께 있는 Makefile을 까 보니 usip로 부트로더를 심는 방법을 찾을 수 있었습니다. ㄱㄱㅅ~

> 그래도.. 안돼 -_-;;

한참을 삽질하다 알아낸 것. **NT-ISP는** [**Arduino사이트에서 말하는 패러럴 ISP**][4]**와 다르다!!** usip의 help를 차근차근 살펴보니 패러럴 ISP만 종류가 -전 다 똑같은 거라고 가정했었는데- 10여가지 되는군요.

패러럴 ISP의 종류를 잘못 지정한 경우 다운로드는 정상적으로 이루어 지는 것 처럼 보이지만 Verify에서 에러가 주루룩 나옵니다.

> 그래서.. 뭔데? -_-;;;

ISP를 새로 사야 하나? 걱정되었지만 결국 이 녀석으로 부트로더를 심는데 성공하였습니다. 우선 아래와 같이 "burn" 스크립트를 작성하였습니다.

부트로더의 makefile을 참조하였고, dprog를 "dapa"에서 "stk200&#8243;으로 수정하였습니다. stk200 찾느라 옵션의 패러럴 프로그래머들을 한번씩 다 해봤다능.

프로그래머(dprog) 옵션을 잘못준다고 망가지지 않습니다. 🙂

```bash
#!/bin/bash
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --wr_lock=0xFF
sleep 1
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --wr_fuse_l=0xdf --wr_fuse_h=0xca
sleep 1
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --erase --upload --verify if=$1 -v=2
sleep 1
uisp -dpart=ATmega8 -dprog=stk200 -dlpt=0x378 --wr_lock=0xCF
```

이제 다음과 같이 실행 합니다. 패러럴 포트에 직접 접근하기 위해 root 권한이 필요합니다.

```bash
/arduino-0011/hardware$ sudo ./burn bootloaders/atmega8/ATmegaBOOT.hex
Atmel AVR ATmega8 is found.
Writing lock bits ...
Reinitializing device
Atmel AVR ATmega8 is found.

Lock Bits set to 0xff
Atmel AVR ATmega8 is found.

Fuse Low Byte set to 0xdf

Fuse High Byte set to 0xca
AVR Direct Parallel Access succeeded after 0 retries.
Atmel AVR ATmega8 is found.
Erasing device ...
Reinitializing device
AVR Direct Parallel Access succeeded after 0 retries.
Atmel AVR ATmega8 is found.
Uploading: flash
################################
(total 1002 bytes transferred in 0.66 s (1511 bytes/s)
Polling: count = 16, min/avg/max = 2.24/4.94/8.38 ms
Verifying: flash
################################
(total 1002 bytes transferred in 0.58 s (1742 bytes/s)
Atmel AVR ATmega8 is found.
Writing lock bits ...
Reinitializing device
Atmel AVR ATmega8 is found.

Lock Bits set to 0xcf
```

이제 ISP 케이블을 제거하고 Reset 버튼을 누르면 LED 13 (사진의 노란색 LED)가 파라라락! 점멸하며 부트로더가 잘 심어졌음을 알립니다.

![](https://homin.dev/asset/blog/2008/06/arduinos3v3_bootloader_on.jpg)

**?한줄요약 NT-ISP = STK-200**

 [1]: http://www.devicemart.co.kr/mart7/mall.php?cat=010002000&query=view&no=14478
 [2]: http://www.arduino.cc/en/Main/Software
 [3]: http://www.arduino.cc/en/Hacking/Bootloader
 [4]: http://www.arduino.cc/en/Hacking/ParallelProgrammer