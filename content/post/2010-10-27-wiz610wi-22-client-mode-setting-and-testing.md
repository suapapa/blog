---
title: '[WIZ610wi 2/2] client-mode setting and testing'
author: suapapa
type: post
date: 2010-10-26T16:17:32+00:00
url: /p=476
dsq_thread_id:
  - 722489315
openid_comments:
  - 'a:1:{i:0;i:1304;}'
categories:
  - Arduino
tags:
  - wifi
  - WIZnet
  - 아두이노
  - 파이썬

---
wiz610wi는 세 가지 무선 모드 AP, Gateway, Client 를 지원합니다. (초기값은 AP)

  * AP는 무선 인터넷 공유기라고 보시면 되고, 실제로 이더넷 포트까지 있는 확장보드를 연결하면 무선 공유기가 됩니다.
  * Gateway는 랜으로 연결된 장비를 wifi에 연결할 때 사용합니다. wifi 기능이 없는 계측기나 유선랜 카메라를 wifi 지원하게 할 수 있습니다.
  * Client 모드에서는 wiz610wi가 무선랜카드처럼 동작하며 주변의 AP에 접속한 후 인터넷의 서버에 연결하여 데이터를 주고 받을 수 있습니다.

아두이노와 이 모듈을 함께 쓸 때 가장 일반적으로 사용할 모드는 Client 모드로 이 포스트에서는 wiz610wi를 클라이언트 모드로 설정하고 테스트 서버에 연결해 동작시켜 보겠습니다.

설정하기 위해 모듈에 접근하는 경로는 두 가지로;

  * wifi나 랜포트로 모듈의 설정 웹페이지(무선랜 공유기의 설정 페이지와 유사합니다)에 접근하거나,
  * 시리얼 포트로 명령어들을 보내고 받는 방법이 있습니다.

첫번째 방법이 훨씬 쉽지만, Client모드에서는 wifi 설정 페이지에 접근할 수 없고, 랜 포트를 사용하려면 비싼 -너무 비싸요- 확장 보드를 이용해야 합니다.

남은 옵션인 시리얼 포트를 이용해 보겠습니다. [WIZnet의 wiz610wi 페이지][1]에서 "user manual"을 다운 받으세요. 메뉴얼의 마지막에 시리얼 설정에 사용하는 명령어들이 표로 정리되어 있습니다.

그럼, 비디오 부터 들어갑니다.



  



데모에서 모듈은 앞선 페이지의 사진에서 보여진 Serial2USB 모듈을 통해 PC에 연결되어 있습니다.

확대 기능을 썼는데도 글자들이 잘 안보이네요. HD(720p)모드와 전체화면으로 시청해 주세요.


{{<youtube Nq7ckirA1yE>}}

다음은 데모에서 사용한 명령어들로, User manual과 비교하여 확인해 보세요.

블로그의 html태그들와 꼬이는 문제로 앞 뒤에 붙는 꺽인 괄호는 생략하였습니다. # 뒤의 내용은 주석 입니다.

> GO3 #무선 모드를 Client로 설정합니다.

이 명령은 설정에 수 초가 필요한데 이때 시리얼 LED가 켜진 채로 유지되므로 언제 명령어 처리가 끝나는지 알 수 있습니다.

> DI #접속할 AP를 scan 합니다.

다음은 <di> 명령어로 받은 데이터의 예제;</di>

> 
> Ssuapapa_001884191f9a_2_57_WPA2-PSK:ajt__system_00089f0c7e28_8_59_WPA1-PSK/WPA2-PSK:&#8230;

scan된 AP들이 : 를 구분자로 나열 됩니다. 위 예제는 두 AP, SUAPAPA 와 ajt_system 이 검색된 예 입니다. "_"를 AP 정보를 구분하기 위해 사용하기 때문에 AP의 이름(SSID)에 "_"가 있는 경우 "__"로 표시되지만 사용할 때는 원래대로 "_"을 사용하면 됩니다.

> GSsuapapa # suapapa AP에 접속

다음은 가장 까다로운 부분인 암호 설정 입니다. PC나 핸드폰으로 무선 공유기에 접근할 때는 공유기 이름(SSID)와 암호만 알면 되지만,

> GU인증방식_암호화_기본키_키길이_키포멧_암호

그 이면에는 인증방식 (WPA, WPA2, WEP, etc&#8230;)과 암호화(TKIP, AES, etc&#8230;) 등도 맞춰 줘야 합니다. PC나 스마트폰은 이 과정을 자동으로 진행핼 만큼 똑똑하지만 wiz610wi는 -시리얼 설정시에는 아직- 그 정도로 똑똑하지 않아요.

변수를 줄이기 위해 WEP과 공개 AP의 경우(이런 설정들은 안전하지 않습니다)를 제외하면, 다음과 같이 간소화 됩니다.

> GU[75]_[234]_0_0_0_암호

첫번째 인자(인증방식은) DI의 결과의 마지막 항목을 참고해 고를 수 있습니다. "WPA2-PSK" -> 7, "WPA1-PSK/WPA2-PSK" -> 5

두번째 인자(암호화)는 인증방식에서 지원하지 않는 경우 error code 4 가 리턴되므로 몇 번의 시행 착오로 고를 수 있습니다. 제 경우 항상 4를 사용해야 하네요.

연달아 나오는 0_0_0 은 WPA류에서는 이 값 그대로 고정 입니다.

해서, 다음과 같이 암호를 설정합니다.

> GU7_4_0_0_0_PasswordOfMyAP

이제 시리얼 모드를 클라이언트로 설정합니다. wifi 모듈은 대게 동적(DHCP)으로 주소를 할당받기 때문에 서버 모드는 거의 쓸 일이 없을 것 같네요.

> WWtest.suapapa.net # 접속할 서버의 이름 test.suapapa.net
> 
> WP8005 # 접속할 포트

마지막으로, 시리얼 클라이언트 모드로 설정

> WM0

모든 설정이 끝났습니다. 휴우~

다행히, 설정 내용은 전원을 끊은 후에도 기억되기 때문에 설정을 마친 후에 아두이노에 연결하면, 언제나처럼, 아두이노에서는 평범한 시리얼 데이타를 처리하듯이 사용할 수 있습니다.

test.suapapa.net에는 파이썬-twisted으로 작성한 아래의 간단한 서버가 사용되었습니다.

```python
from twisted.internet.protocol import Protocol, Factory
from twisted.internet import reactor

class Echo(Protocol):
    def dataReceived(self, data):
        print 'got data:', data
        self.transport.write(data.upper())

factory = Factory()
factory.protocol = Echo

TEST_PORT = 8005
print "simple ECHO server start! on port:", TEST_PORT
reactor.listenTCP(TEST_PORT, factory)
reactor.run()

```

처음에는 시리얼로 설정하는 과정이 생소했지만 다행히도! 설정 내용을 기억하고 있기 때문에 한 번 설정하면 바로 아두이노에 연결해 일반적인 시리얼 포트 사용하 듯 쓸 수 있습니다.

또한, 아리송한 부분을 WIZnet에 질문하면 훌륭한 답변을 받을 수 있었습니다.


wiz610wi는 아이폰에서 -BT대용으로- 핑크탱크같은걸 조종하거나, 대중화 된 무선 공유기와 연결해 홈 오토메이션에 유용하게 사용할 수 있을 것 같습니다. 🙂 



 [1]: http://www.wiznettechnology.com/Sub_Modules/en/product/Product_Detail.asp?cate1=&cate2=&cate3=&pid=1020