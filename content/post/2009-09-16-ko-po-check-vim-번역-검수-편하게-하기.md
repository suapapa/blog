---
title: 'ko-po-check + vim : 번역 검수 편하게 하기'
author: suapapa
type: post
date: 2009-09-16T06:04:31+00:00
url: /p=445
dsq_thread_id:
  - 723240290
aktt_notify_twitter:
  - no
translations:
  - 'a:1:{i:0;s:6880:"YToxOntzOjI6ImtvIjthOjI6e3M6MTI6InBvc3RfY29udGVudCI7czo1MDMyOiI8cD7snbQg7Y+s7Iqk7Yq464qUIOyYpO2UiOyGjOyKpCDtlITroZzqt7jrnqjsnYQg67KI7Jet7J2EIO2VmOyLnOuKlCDrtoQo65iQ64qUIO2VmOyLnOugpOuKlCDrtoQpIOykkSA8YSBocmVmPVxcJnF1b3Q7aHR0cDovL2tvLXBvLWNoZWNrLmtsZHAubmV0L1xcJnF1b3Q7PmtvLXBvLWNoZWNrPC9hPuqwgCDsg53shoztlZjsi6Ag67aE65Ok7J2EIOychO2VtCDsjbzsirXri4jri6QuPC9wPg0KPHA+67O07Ya1IOyekOycoCDtlITroZzqt7jrnqjsnZgg67KI7Jet7J2AIOyVhOuemOydmCB3b3JrIGZsb3frpbwg65Sw6528IOynhO2WieuQqeuLiOuLpC48L3A+DQo8b2w+DQogICAgPGxpPu2UhOuhnOq3uOueqCDshozsiqQg7ZqN65OdPC9saT4NCiAgICA8bGk+bWVzc2FnZS5wb3QgLSZndDsga28ucG8g66GcIOuzgO2ZmDwvbGk+DQogICAgPGxpPnBvZWRpdOulvCDthrXtlbQg67KI7JetL+yekOuPmeuyiOyXrTwvbGk+DQogICAgPGxpPu2UhOuhnOygne2KuCDqtIDrpqzsnpDsl5Dqsowg7Yyo7LmYKGtvLnBvKSDrs7TrgrTquLA8L2xpPg0KPC9vbD4NCjxwPmtvLXBvLWNoZWNr64qUIOychCDqs7zsoJXsnZggM+uyiOqzvCA067KIIOyCrOydtOyXkCDsnpjrqrvrkJwg67KI7Jet7J20IOyXhuuKlOyngCDtmZXsnbjtlZjripQg7Jqp64+E66GcIOyCrOyaqe2VmOuKlCDsu6Trp6jrk5zrnbzsnbgg7Jyg7Yu466as7YuwIOyeheuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPuyXrOq4sOyEnCDslrjquIntlZjsp4Ag7JWK7J2AIOqzvOygleydtCDqtoHquIjtlZjsi6Ag67aE7J2AIDxhIGhyZWY9XFwmcXVvdDtodHRwOi8vbXItZHVzdC5wZS5rci9zZWFyY2gvJUVDJTk4JUE0JUVEJTk0JTg4JUVDJTg2JThDJUVDJThBJUE0JTIwJUVEJTk0JTg0JUVCJUExJTlDJUVBJUI3JUI4JUVCJTlFJUE4JTIwJUVEJTk1JTlDJUVBJUI4JTgwJUVEJTk5JTk0JUVEJTk1JTk4JUVBJUI4JUIwXFwmcXVvdDs+TXItRHVzdCDri5jsnbQg7KCV66as7ZWY7IugIOuyiOyXrSDqsIDsnbTrk5w8L2E+IOulvCDsgrTtjrTrs7TshLjsmpQuPC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+7J287KCE7JeQIDxhIGhyZWY9XFwmcXVvdDtodHRwOi8vd3d3LnN1YXBhcGEubmV0L3dvcmRwcmVzcy8/cD00MVxcJnF1b3Q7PuyciOuPhOyXkOyEnOydmCDsgqzsmqnrspXsnYQg7Y+s7Iqk7YyFPC9hPiDtlZwg7KCB64+EIOyeiOyngOunjCwg7J2067KI7JeQ64qUIOyEpOuqheydmCDtjrjsnZjrpbwg7JyE7ZW0LCDsmrDrtoTtiKwg66as64iF7Iqk66W8IOyCrOyaqeykkeydtOqzoCwgdmkodmltKeydhCDsjajrs7gg7KCB7J20IOyeiOuLpOqzoCDqsIDsoJXtlZjqsqDsirXri4jri6QuPC9wPg0KPHA+PCEtLW1vcmUtLT48c3Ryb25nPjEuIGtvLXBvLWNoZWNrIOyEpOy5mDwvc3Ryb25nPjwvcD4NCjxwPuyasOu2hO2IrOudvOuptCBVYnVudHUta28gUFBB66W8IOyGjOyKpOumrOyKpO2KuOyXkCDstpTqsIDtlZjsl6wga28tcG8tY2hlY2vrpbwg7ISk7LmY7ZWY7IukIOyImCDsnojsirXri4jri6QuPC9wPg0KPGJsb2NrcXVvdGU+DQo8cD5VYnVudHUta28gcHBh64qUIOq4sOuzuCDsoIDsnqXshozsl5AgLeyVhOyngS0g67CY7JiB65CY7KeAIOyViuydgCDtlITroZzqt7jrnqjrk6TsnbTrgpgsIO2VnOq1rSDsgqzsmqnsnpDrk6TsnZgg7Y647J2Y66W8IOychO2VnCDtjKjtgqTsp4Drk6TsnbQg66qo7JesIOyeiOuKlCBwcGHroZwgPHN0cmlrZT7qt4DssK7qsow8L3N0cmlrZT4g7LaU6rCA7ZWgIOunjO2VnCDqsIDsuZjqsIAg7J6I7Iq164uI64ukLiA6KTwvcD4NCjwvYmxvY2txdW90ZT4NCjxwPuuLpOydjOqzvCDqsJnsnbQgc291cmNlIGxpc3Tsl5AgdWJ1bnR1LWtvIHBwYeulvCDstpTqsIDtlZjqs6A6PC9wPg0KPGJsb2NrcXVvdGU+DQo8cD4kIHN1ZG8gdmkgL2V0Yy9hcHQvc291cmNlcy5saXN0PC9wPg0KPHA+ZGViIGh0dHA6Ly9wcGEubGF1bmNocGFkLm5ldC91YnVudHUta28vcHBhL3VidW50dSBqYXVudHkgbWFpbjxiciAvPg0KZGViLXNyYyBodHRwOi8vcHBhLmxhdW5jaHBhZC5uZXQvdWJ1bnR1LWtvL3BwYS91YnVudHUgamF1bnR5IG1haW48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7ri6TsnYwg66qF66C57Ja066GcIHBncO2CpOulvCDrk7HroZ3tlanri4jri6Q6PC9wPg0KPGJsb2NrcXVvdGU+DQo8cD4kIHN1ZG8gYXB0LWtleSBhZHYgLS1rZXlzZXJ2ZXIga2V5c2VydmVyLnVidW50dS5jb20gLS1yZWN2LWtleXMgRDE4NkM2RkY8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7qt7jrn7wsIOyEpOy5mDo8L3A+DQo8YmxvY2txdW90ZT4NCjxwPiQgc3VkbyBhcHQtZ2V0IGluc3RhbGwga28tcG8tY2hlY2sgdmltPC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+7J6YIOyEpOy5mOuQmOyXiOuKlOyngCDtmZXsnbjtlZjquLAg7JyE7ZW0IGtvLnBvIO2MjOydvOydtCDsnojripQg6rOz7JeQ7IScIOyJmOydhCDrnYTsm4zshJwg7JWE656Y7JmAIOqwmeydtCDsi6TtlontlbQg67SF64uI64ukLjwvcD4NCjxibG9ja3F1b3RlPg0KPHA+JCBrby1wby1jaGVjayBrby5wbzwvcD4NCjxwPmtvLnBvOjU3ODog65SU66CJ7Yag66asOiDqt7jrhogg642w7Iqk7YGs7YOR7JeQ7IScICZxdW90O2RpcmVjdG9yeSZxdW90O+ydgCjripQpICZxdW90O+uUlOugie2EsOumrCZxdW90OyjsnbQp65286rOgIOuyiOyXrTxiciAvPg0Ka28ucG86MTI5NDog7KeA7Jqw6riwOiDqt7jrhogg642w7Iqk7YGs7YOR7JeQ7IScICZxdW90O2RlbGV0ZSZxdW90O+ydgCjripQpICZxdW90O+yCreygnCZxdW90OyjsnbQp65286rOgIOuyiOyXrTxiciAvPg0Ka28ucG86MTI5NDog7KeA7Jqw6riwKF9EKTog64uk7J2M6rO8IOqwmeydtCDrsojsl63tlbTslbwg7ZWp64uI64ukOiAmcXVvdDvsgq3soJwoX0QpJnF1b3Q7PGJyIC8+DQouLi48L3A+DQo8cD4mbmJzcDs8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7snITsl5DshJwg67O07Iuc64qUIOuwlOyZgCDqsJnsnbQgPHN0cm9uZz7tjIzsnbzrqoU665287J247IiYOuyXkOufrOuCtOyaqTwvc3Ryb25nPuydmCDtmJXsi53snLzroZwg7JeQ65+s6rCAIOuCmOyYpOupsCwg7JWE66y065+wIOy2nOugpeydtCDsl4bsnYTrlYwg6rmM7KeAIGtvLnBvIO2MjOydvOydhCA8c3Ryb25nPiZxdW90O+qzhOyGjSZxdW90Ozwvc3Ryb25nPiDsiJjsoJXtlZjrqbQg65Cp64uI64ukLjwvcD4NCjxwPuuztO2GtSBrby1wby1jaGVja+yaqSDsiZjsnYQg7ZWY64KY7JmALCDthY3siqTtirgg7JeQ65SU7YSw66W8IOudhOybjOyEnCDsl5Drn6wg65287J247Jy866GcIOydtOuPmSDtm4Qg7IiY7KCVLCDsnbTrj5kg7ZuEIOyImOyglS4uIOydtOufrOyLnOyjoC48L3A+DQo8cD48c3Ryb25nPjIuIHZpbeqzvCDsl7Drj5k8L3N0cm9uZz48L3A+DQo8cCBzdHlsZT1cXCZxdW90O21hcmdpbi1sZWZ0OiA0MHB4O1xcJnF1b3Q7Pu2VmC7sp4Au66eMLiB2aW0g7J20IOy2nOuPme2VmOuptCDslrTrlqjquYw/PC9wPg0KPHA+7IKs7IukIGtvLXBvLWNoZWNr7J2YIOy2nOugpSDtmJXsi50sIDxzdHJvbmc+7YyM7J2866qFOuudvOyduOyImDrsl5Drn6zrgrTsmqk8L3N0cm9uZz7snYAgZ3JlcOydtOuCmCBnY2Psl5DshJzrj4Qg7JOw7J2064qUIHF1aWNrZml4IO2YleyLneyeheuLiOuLpC48L3A+DQo8cD7ri6TsnYzqs7wg6rCZ7J20IOy2nOugpeuCtOyaqeydhCDthY3siqTtirgg7YyM7J2866GcIOuwm+yVhCAtcSDrqoXroLnslrTsmYAg7ZWo6ruYIOyLpO2Wie2VnCDrkqQ8L3A+DQo8YmxvY2txdW90ZT4NCjxwPiQga28tcG8tY2hlY2sga28ucG8gJmd0OyBlcnJvcnM8L3A+DQo8cD4kIHZpIC1xIGVycm9yczwvcD4NCjwvYmxvY2txdW90ZT4NCjxwPjxzdHJvbmc+OmNuPC9zdHJvbmc+LCA8c3Ryb25nPjpjcDwvc3Ryb25nPiDrpbwg7IKs7Jqp7ZWY66m0IOyXkOufrOydmCDsnITsuZjroZwg7KCQ7ZSE7ZWgIOyImCDsnojqsowg65Cp64uI64ukLiDsmYDsmrB+PC9wPg0KPGJsb2NrcXVvdGU+DQo8cD48YSBocmVmPVxcJnF1b3Q7aHR0cDovL3d3dy52aW0ub3JnL2h0bWxkb2MvcXVpY2tmaXguaHRtbFxcJnF1b3Q7PjxzdHJvbmc+OmhlbHAgcXVpY2tmaXg8L3N0cm9uZz48L2E+IO2VmOyFlOyEnCA8c3Ryb25nPjpjb3BlPC9zdHJvbmc+IOuTseydmCDrqoXroLnslrTrj4Qg7LC+7JWEIOuztOyEuOyalC48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD48aW1nIHdpZHRoPVxcJnF1b3Q7NDIwXFwmcXVvdDsgaGVpZ2h0PVxcJnF1b3Q7NDE1XFwmcXVvdDsgYWx0PVxcJnF1b3Q7XFwmcXVvdDsgc3JjPVxcJnF1b3Q7L3dvcmRwcmVzcy93cC1jb250ZW50L3VwbG9hZHMvaW1hZ2Uva3BjX3F1aWNrZml4LnBuZ1xcJnF1b3Q7IC8+PC9wPg0KPHA+66eO7J20IO2OuO2VtCDsoYzsp4Drp4wsIOyVhOyngeuPhCBrby1wby1jaGVja+ydhCDsi6TtlontlZjquLAg7JyE7ZW0IHZpbeydhCDrk6Trnb3rgqDrnb0g7ZW07JW87ZWY64qUIOuLqOyInOuwmOuzteyekeyXheydtCDrgqjslYTsnojso6AuPC9wPg0KPHA+LnZpbXJjIO2MjOydvOyXkCDslYTrnpgg65287J247J2EIOy2lOqwgO2VtCDso7zshLjsmpQuIOydtCDshKTsoJXsnYAga28ucG8g7YyM7J287J2EIOyXtOuVjCDsnpDrj5nsnLzroZwgOm1ha2Xsl5Aga28tcG8tY2hlY2vrpbwg7Jew64+Z7Iuc7LycIOykjeuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPmF1IEJ1ZlJlYWQga28ucG8gc2V0IG1ha2Vwcmc9a28tcG8tY2hlY2tcXFxcICU8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7qt7jrn7wgdmkga28ucG8g66GcIO2OuOynke2VoCDsubTtg4DroZzqt7jrpbwg7JewIO2bhOyXkCwg65iQ64qUIOyImOyglSDspJEg7KCA7J6l7ZWcIO2bhOyXkCw8L3A+DQo8YmxvY2txdW90ZT4NCjxwPjptYWtlPC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+7ZWY66m0IO2YhOyerCDsubTtg4DroZzqt7jrpbwga28tcG8tY2hlY2vtlZjqs6AsIHZpIC1xIOuhnCBxdWlja2ZpeCDtjIzsnbzsnYQg7JewIOqyg+qzvCDqsJnsnYAg6rKw6rO86rCAIOuCmOyYteuLiOuLpC48L3A+DQo8cD7ruZTsnYQg67KX7Ja064KgIO2VhOyalOqwgCDsl4bslrTsoYzsirXri4jri6QuIOyYrOugiH48L3A+DQo8cD4mbmJzcDs8L3A+IjtzOjEwOiJwb3N0X3RpdGxlIjtzOjUwOiJrby1wby1jaGVjayArIHZpbSA6IOuyiOyXrSDqsoDsiJgg7Y647ZWY6rKMIO2VmOq4sCI7fX0=";}'
categories:
  - Linux
  - Programming
tags:
  - ko-po-check
  - vim
  - 번역

---
이 포스트는 오픈소스 프로그램을 번역을 하시는 분(또는 하시려는 분) 중 [ko-po-check][1]가 생소하신 분들을 위해 썼습니다.

보통 자유 프로그램의 번역은 아래의 work flow를 따라 진행됩니다.

  1. 프로그램 소스 획득
  2. message.pot -> ko.po 로 변환
  3. poedit를 통해 번역/자동번역
  4. 프로젝트 관리자에게 패치(ko.po) 보내기

ko-po-check는 위 과정의 3번과 4번 사이에 잘못된 번역이 없는지 확인하는 용도로 사용하는 커맨드라인 유틸리티 입니다.

> 여기서 언급하지 않은 과정이 궁금하신 분은 [Mr-Dust 님이 정리하신 번역 가이드][2] 를 살펴보세요.

일전에 [윈도에서의 사용법을 포스팅][3] 한 적도 있지만, 이번에는 설명의 편의를 위해, 우분투 리눅스를 사용중이고, vi(vim)을 써본 적이 있다고 가정하겠습니다.

<!--more-->

**1. ko-po-check 설치**

우분투라면 Ubuntu-ko PPA를 소스리스트에 추가하여 ko-po-check를 설치하실 수 있습니다.

> Ubuntu-ko ppa는 기본 저장소에 -아직- 반영되지 않은 프로그램들이나, 한국 사용자들의 편의를 위한 패키지들이 모여 있는 ppa로 <strike>귀찮게</strike> 추가할 만한 가치가 있습니다. 🙂

다음과 같이 source list에 ubuntu-ko ppa를 추가하고:

> $ sudo vi /etc/apt/sources.list
> 
> deb http://ppa.launchpad.net/ubuntu-ko/ppa/ubuntu jaunty main  
> deb-src http://ppa.launchpad.net/ubuntu-ko/ppa/ubuntu jaunty main

다음 명령어로 pgp키를 등록합니다:

> $ sudo apt-key adv &#8211;keyserver keyserver.ubuntu.com &#8211;recv-keys D186C6FF

그럼, 설치:

> $ sudo apt-get install ko-po-check vim

잘 설치되었는지 확인하기 위해 ko.po 파일이 있는 곳에서 쉘을 띄워서 아래와 같이 실행해 봅니다.

> $ ko-po-check ko.po
> 
> ko.po:578: 디렉토리: 그놈 데스크탑에서 &#8220;directory&#8221;은(는) &#8220;디렉터리&#8221;(이)라고 번역  
> ko.po:1294: 지우기: 그놈 데스크탑에서 &#8220;delete&#8221;은(는) &#8220;삭제&#8221;(이)라고 번역  
> ko.po:1294: 지우기(\_D): 다음과 같이 번역해야 합니다: &#8220;삭제(\_D)&#8221;  
> &#8230;
> 
>  

위에서 보시는 바와 같이 **파일명:라인수:에러내용**의 형식으로 에러가 나오며, 아무런 출력이 없을때 까지 ko.po 파일을 **&#8220;계속&#8221;** 수정하면 됩니다.

보통 ko-po-check용 쉘을 하나와, 텍스트 에디터를 띄워서 에러 라인으로 이동 후 수정, 이동 후 수정.. 이러시죠.

**2. vim과 연동**

<p style="margin-left: 40px;">
  하.지.만. vim 이 출동하면 어떨까?
</p>

사실 ko-po-check의 출력 형식, **파일명:라인수:에러내용**은 grep이나 gcc에서도 쓰이는 quickfix 형식입니다.

다음과 같이 출력내용을 텍스트 파일로 받아 -q 명령어와 함께 실행한 뒤

> $ ko-po-check ko.po > errors
> 
> $ vi -q errors

**:cn**, **:cp** 를 사용하면 에러의 위치로 점프할 수 있게 됩니다. 와우~

> [**:help quickfix**][4] 하셔서 **:cope** 등의 명령어도 찾아 보세요.

<img loading="lazy" width="420" height="415" src="https://homin.dev/asset/blog/image/kpc_quickfix.png" alt="" /> 

많이 편해 졌지만, 아직도 ko-po-check을 실행하기 위해 vim을 들락날락 해야하는 단순반복작업이 남아있죠.

.vimrc 파일에 아래 라인을 추가해 주세요. 이 설정은 ko.po 파일을 열때 자동으로 :make에 ko-po-check를 연동시켜 줍니다.

> au BufRead ko.po set makeprg=ko-po-check\ %

그럼 vi ko.po 로 편집할 카타로그를 연 후에, 또는 수정 중 저장한 후에,

> :make

하면 현재 카타로그를 ko-po-check하고, vi -q 로 quickfix 파일을 연 것과 같은 결과가 나옵니다.

빔을 벗어날 필요가 없어졌습니다. 올레~

 

 [1]: http://ko-po-check.kldp.net/
 [2]: http://mr-dust.pe.kr/search/%EC%98%A4%ED%94%88%EC%86%8C%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8%20%ED%95%9C%EA%B8%80%ED%99%94%ED%95%98%EA%B8%B0
 [3]: https://homin.dev/wp/?p=41
 [4]: http://www.vim.org/htmldoc/quickfix.html