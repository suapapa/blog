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
translations:
  - 'a:1:{i:0;s:10052:"YToxOntzOjI6ImtvIjthOjI6e3M6MTA6InBvc3RfdGl0bGUiO3M6NDY6IltXSVo2MTB3aSAyLzJdIGNsaWVudC1tb2RlIHNldHRpbmcgYW5kIHRlc3RpbmciO3M6MTI6InBvc3RfY29udGVudCI7czo3NDE2OiI8cD53aXo2MTB3aeuKlCDshLgg6rCA7KeAIOustOyEoCDrqqjrk5wgQVAsIEdhdGV3YXksIENsaWVudCDrpbwg7KeA7JuQ7ZWp64uI64ukLiAo7LSI6riw6rCS7J2AIEFQKTwvcD4NCjx1bD4NCiAgICA8bGk+QVDripQg66y07ISgIOyduO2EsOuEtyDqs7XsnKDquLDrnbzqs6Ag67O07Iuc66m0IOuQmOqzoCwg7Iuk7KCc66GcIOydtOuNlOuEtyDtj6ztirjquYzsp4Ag7J6I64qUIO2ZleyepeuztOuTnOulvCDsl7DqsrDtlZjrqbQg66y07ISgIOqzteycoOq4sOqwgCDrkKnri4jri6QuPC9saT4NCiAgICA8bGk+R2F0ZXdheeuKlCDrnpzsnLzroZwg7Jew6rKw65CcIOyepeu5hOulvCB3aWZp7JeQIOyXsOqysO2VoCDrlYwg7IKs7Jqp7ZWp64uI64ukLiB3aWZpIOq4sOuKpeydtCDsl4bripQg6rOE7Lih6riw64KYIOycoOyEoOuenCDsubTrqZTrnbzrpbwgd2lmaSDsp4Dsm5DtlZjqsowg7ZWgIOyImCDsnojsirXri4jri6QuPC9saT4NCiAgICA8bGk+Q2xpZW50IOuqqOuTnOyXkOyEnOuKlCB3aXo2MTB3aeqwgCDrrLTshKDrnpzsubTrk5zsspjrn7wg64+Z7J6R7ZWY66mwIOyjvOuzgOydmCBBUOyXkCDsoJHsho3tlZwg7ZuEIOyduO2EsOuEt+ydmCDshJzrsoTsl5Ag7Jew6rKw7ZWY7JesIOuNsOydtO2EsOulvCDso7zqs6Ag67Cb7J2EIOyImCDsnojsirXri4jri6QuPC9saT4NCjwvdWw+DQo8cD7slYTrkZDsnbTrhbjsmYAg7J20IOuqqOuTiOydhCDtlajqu5gg7JO4IOuVjCDqsIDsnqUg7J2867CY7KCB7Jy866GcIOyCrOyaqe2VoCDrqqjrk5zripQgQ2xpZW50IOuqqOuTnOuhnCDsnbQg7Y+s7Iqk7Yq47JeQ7ISc64qUIHdpejYxMHdp66W8IO2BtOudvOydtOyWuO2KuCDrqqjrk5zroZwg7ISk7KCV7ZWY6rOgIO2FjOyKpO2KuCDshJzrsoTsl5Ag7Jew6rKw7ZW0IOuPmeyekeyLnOy8nCDrs7TqsqDsirXri4jri6QuPC9wPg0KPHA+7ISk7KCV7ZWY6riwIOychO2VtCDrqqjrk4jsl5Ag7KCR6re87ZWY64qUIOqyveuhnOuKlCDrkZAg6rCA7KeA66GcOzwvcD4NCjx1bD4NCiAgICA8bGk+d2lmaeuCmCDrnpztj6ztirjroZwg66qo65OI7J2YIOyEpOyglSDsm7ntjpjsnbTsp4Ao66y07ISg656cIOqzteycoOq4sOydmCDshKTsoJUg7Y6Y7J207KeA7JmAIOycoOyCrO2VqeuLiOuLpCnsl5Ag7KCR6re87ZWY6rGw64KYLDwvbGk+DQogICAgPGxpPuyLnOumrOyWvCDtj6ztirjroZwg66qF66C57Ja065Ok7J2EIOuztOuCtOqzoCDrsJvripQg67Cp67KV7J20IOyeiOyKteuLiOuLpC48L2xpPg0KPC91bD4NCjxwPuyyq+uyiOynuCDrsKnrspXsnbQg7Zuo7JSsIOyJveyngOunjCwgQ2xpZW5066qo65Oc7JeQ7ISc64qUIHdpZmkg7ISk7KCVIO2OmOydtOyngOyXkCDsoJHqt7ztlaAg7IiYIOyXhuqzoCwg656cIO2PrO2KuOulvCDsgqzsmqntlZjroKTrqbQg67mE7Iu8IC3rhIjrrLQg67mE7Iu47JqULSDtmZXsnqUg67O065Oc66W8IOydtOyaqe2VtOyVvCDtlanri4jri6QuPC9wPg0KPHA+64Ko7J2AIOyYteyFmOyduCDsi5zrpqzslrwg7Y+s7Yq466W8IOydtOyaqe2VtCDrs7TqsqDsirXri4jri6QuIDxhIGhyZWY9XFwmcXVvdDtodHRwOi8vd3d3Lndpem5ldHRlY2hub2xvZ3kuY29tL1N1Yl9Nb2R1bGVzL2VuL3Byb2R1Y3QvUHJvZHVjdF9EZXRhaWwuYXNwP2NhdGUxPSZhbXA7Y2F0ZTI9JmFtcDtjYXRlMz0mYW1wO3BpZD0xMDIwXFwmcXVvdDs+V0labmV07J2YIHdpejYxMHdpIO2OmOydtOyngDwvYT7sl5DshJwgJnF1b3Q7dXNlciBtYW51YWwmcXVvdDvsnYQg64uk7Jq0IOuwm+ycvOyEuOyalC4g66mU64m07Ja87J2YIOuniOyngOunieyXkCDsi5zrpqzslrwg7ISk7KCV7JeQIOyCrOyaqe2VmOuKlCDrqoXroLnslrTrk6TsnbQg7ZGc66GcIOygleumrOuQmOyWtCDsnojsirXri4jri6QuPC9wPg0KPHA+6re465+8LCDruYTrlJTsmKQg67aA7YSwIOuTpOyWtOqwkeuLiOuLpC48L3A+DQo8cD48IS0tbW9yZS0tPg0KPG1ldGEgaHR0cC1lcXVpdj1cXCZxdW90O2NvbnRlbnQtdHlwZVxcJnF1b3Q7IGNvbnRlbnQ9XFwmcXVvdDt0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLThcXCZxdW90Oz7rjbDrqqjsl5DshJwg66qo65OI7J2AIOyVnuyEoCDtjpjsnbTsp4DsnZgg7IKs7KeE7JeQ7IScIOuztOyXrOynhCBTZXJpYWwyVVNCIOuqqOuTiOydhCDthrXtlbQgUEPsl5Ag7Jew6rKw65CY7Ja0IOyeiOyKteuLiOuLpC4gIDwvbWV0YT4NCjwvcD4NCjxwPu2ZleuMgCDquLDriqXsnYQg7I2864qU642w64+EIOq4gOyekOuTpOydtCDsnpgg7JWI67O07J2064Sk7JqULiBIRCg3MjBwKeuqqOuTnOyZgCDsoITssrTtmZTrqbTsnLzroZwg7Iuc7LKt7ZW0IOyjvOyEuOyalC48L3A+DQo8cD4NCjxtZXRhIGh0dHAtZXF1aXY9XFwmcXVvdDtjb250ZW50LXR5cGVcXCZxdW90OyBjb250ZW50PVxcJnF1b3Q7dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04XFwmcXVvdDs+W3lvdXR1YmU6aHR0cDovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PU5xN2NraXJBMXlFXSAgICAgICAgICAgIDwvbWV0YT4NCjwvcD4NCjxwPuuLpOydjOydgCDrjbDrqqjsl5DshJwg7IKs7Jqp7ZWcIOuqheugueyWtOuTpOuhnCwgVXNlciBtYW51YWzqs7wg67mE6rWQ7ZWY7JesIO2ZleyduO2VtCDrs7TshLjsmpQuPC9wPg0KPHA+67iU66Gc6re47J2YIGh0bWztg5zqt7jrk6TsmYAg6rys7J2064qUIOusuOygnOuhnCDslZ4g65Kk7JeQIOu2meuKlCDqur3snbgg6rSE7Zi464qUIOyDneuete2VmOyYgOyKteuLiOuLpC4gIyDrkqTsnZgg64K07Jqp7J2AIOyjvOyEnSDsnoXri4jri6QuPC9wPg0KPGJsb2NrcXVvdGU+DQo8cD5HTzMgI+ustOyEoCDrqqjrk5zrpbwgQ2xpZW5066GcIOyEpOygle2VqeuLiOuLpC48L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7snbQg66qF66C57J2AIOyEpOygleyXkCDsiJgg7LSI6rCAIO2VhOyalO2VnOuNsCDsnbTrlYwg7Iuc66as7Ja8IExFROqwgCDsvJzsp4Qg7LGE66GcIOycoOyngOuQmOuvgOuhnCDslrjsoJwg66qF66C57Ja0IOyymOumrOqwgCDrgZ3rgpjripTsp4Ag7JWMIOyImCDsnojsirXri4jri6QuPC9wPg0KPGJsb2NrcXVvdGU+DQo8cD5ESSAj7KCR7IaN7ZWgIEFQ66W8IHNjYW4g7ZWp64uI64ukLjwvcD4NCjwvYmxvY2txdW90ZT4NCjxwPuuLpOydjOydgCA8ZGk+IOuqheugueyWtOuhnCDrsJvsnYAg642w7J207YSw7J2YIOyYiOygnDs8L2RpPjwvcD4NCjxibG9ja3F1b3RlPg0KPG1ldGEgaHR0cC1lcXVpdj1cXCZxdW90O2NvbnRlbnQtdHlwZVxcJnF1b3Q7IGNvbnRlbnQ9XFwmcXVvdDt0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLThcXCZxdW90Oz5Tc3VhcGFwYV8wMDE4ODQxOTFmOWFfMl81N19XUEEyLVBTSzphanRfX3N5c3RlbV8wMDA4OWYwYzdlMjhfOF81OV9XUEExLVBTSy9XUEEyLVBTSzouLi4gICAgPC9tZXRhPg0KPC9ibG9ja3F1b3RlPg0KPHA+c2NhbuuQnCBBUOuTpOydtCA6IOulvCDqtazrtoTsnpDroZwg64KY7Je0IOuQqeuLiOuLpC4g7JyEIOyYiOygnOuKlCDrkZAgQVAsIFNVQVBBUEEg7JmAIGFqdF9zeXN0ZW0g7J20IOqygOyDieuQnCDsmIgg7J6F64uI64ukLiZuYnNwOyZxdW90O18mcXVvdDvrpbwgQVAg7KCV67O066W8IOq1rOu2hO2VmOq4sCDsnITtlbQg7IKs7Jqp7ZWY6riwIOuVjOusuOyXkCZuYnNwO0FQ7J2YIOydtOumhChTU0lEKeyXkCAmcXVvdDtfJnF1b3Q76rCAIOyeiOuKlCDqsr3smrAgJnF1b3Q7X18mcXVvdDvroZwg7ZGc7Iuc65CY7KeA66eMIOyCrOyaqe2VoCDrlYzripQg7JuQ656Y64yA66GcICZxdW90O18mcXVvdDvsnYQg7IKs7Jqp7ZWY66m0IOuQqeuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPkdTc3VhcGFwYSAjIHN1YXBhcGEgQVDsl5Ag7KCR7IaNPC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+64uk7J2M7J2AIOqwgOyepSDquYzri6TroZzsmrQg67aA67aE7J24IOyVlO2YuCDshKTsoJUg7J6F64uI64ukLiBQQ+uCmCDtlbjrk5ztj7DsnLzroZwg66y07ISgIOqzteycoOq4sOyXkCDsoJHqt7ztlaAg65WM64qUIOqzteycoOq4sCDsnbTrpoQoU1NJRCnsmYAg7JWU7Zi466eMIOyVjOuptCDrkJjsp4Drp4wsPC9wPg0KPGJsb2NrcXVvdGU+DQo8cD5HVeyduOymneuwqeyLnV/slZTtmLjtmZRf6riw67O47YKkX+2CpOq4uOydtF/tgqTtj6zrqadf7JWU7Zi4PC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+6re4IOydtOuptOyXkOuKlCDsnbjspp3rsKnsi50gKFdQQSwgV1BBMiwgV0VQLCBldGMuLi4p6rO8IOyVlO2YuO2ZlChUS0lQLCBBRVMsIGV0Yy4uLikg65Ox64+EIOunnuy2sCDspJjslbwg7ZWp64uI64ukLiBQQ+uCmCDsiqTrp4jtirjtj7DsnYAg7J20IOqzvOygleydhCDsnpDrj5nsnLzroZwg7KeE7ZaJ7ZW8IOunjO2BvCDrmJHrmJHtlZjsp4Drp4wgd2l6NjEwd2nripQgLeyLnOumrOyWvCDshKTsoJXsi5zsl5DripQg7JWE7KeBLSDqt7gg7KCV64+E66GcIOuYkeuYke2VmOyngCDslYrslYTsmpQuPC9wPg0KPHA+67OA7IiY66W8IOykhOydtOq4sCDsnITtlbQgV0VQ6rO8IOqzteqwnCBBUOydmCDqsr3smrAo7J2065+wIOyEpOygleuTpOydgCDslYjsoITtlZjsp4Ag7JWK7Iq164uI64ukKeulvCDsoJzsmbjtlZjrqbQsIOuLpOydjOqzvCDqsJnsnbQg6rCE7IaM7ZmUIOuQqeuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPkdVWzc1XV9bMjM0XV8wXzBfMF/slZTtmLg8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7ssqvrsojsp7gg7J247J6QKOyduOymneuwqeyLneydgCkgREnsnZgg6rKw6rO87J2YIOuniOyngOuniSDtla3rqqnsnYQg7LC46rOg7ZW0IOqzoOulvCDsiJgg7J6I7Iq164uI64ukLiAmcXVvdDtXUEEyLVBTSyZxdW90OyAtJmd0OyA3LCAmcXVvdDtXUEExLVBTSy9XUEEyLVBTSyZxdW90OyAtJmd0OyA1PC9wPg0KPHA+65GQ67KI7Ke4IOyduOyekCjslZTtmLjtmZQp64qUIOyduOymneuwqeyLneyXkOyEnCDsp4Dsm5DtlZjsp4Ag7JWK64qUIOqyveyasCBlcnJvciBjb2RlIDQg6rCAIOumrO2EtOuQmOuvgOuhnCDrqocg67KI7J2YIOyLnO2WiSDssKnsmKTroZwg6rOg66W8IOyImCDsnojsirXri4jri6QuIOygnCDqsr3smrAg7ZWt7IOBIDTrpbwg7IKs7Jqp7ZW07JW8IO2VmOuEpOyalC48L3A+DQo8cD7sl7Dri6zslYQg64KY7Jik64qUIDBfMF8wIOydgCBXUEHrpZjsl5DshJzripQg7J20IOqwkiDqt7jrjIDroZwg6rOg7KCVIOyeheuLiOuLpC48L3A+DQo8cD7tlbTshJwsIOuLpOydjOqzvCDqsJnsnbQg7JWU7Zi466W8IOyEpOygle2VqeuLiOuLpC48L3A+DQo8YmxvY2txdW90ZT4NCjxwPkdVN180XzBfMF8wX1Bhc3N3b3JkT2ZNeUFQPC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+7J207KCcIOyLnOumrOyWvCDrqqjrk5zrpbwg7YG065287J207Ja47Yq466GcIOyEpOygle2VqeuLiOuLpC4gd2lmaSDrqqjrk4jsnYAg64yA6rKMIOuPmeyggShESENQKeycvOuhnCDso7zshozrpbwg7ZWg64u567Cb6riwIOuVjOusuOyXkCDshJzrsoQg66qo65Oc64qUIOqxsOydmCDsk7gg7J287J20IOyXhuydhCDqsoMg6rCZ64Sk7JqULjwvcD4NCjxibG9ja3F1b3RlPg0KPHA+V1d0ZXN0LnN1YXBhcGEubmV0ICMg7KCR7IaN7ZWgIOyEnOuyhOydmCDsnbTrpoQgdGVzdC5zdWFwYXBhLm5ldDwvcD4NCjxwPldQODAwNSAjIOygkeyGje2VoCDtj6ztirg8L3A+DQo8L2Jsb2NrcXVvdGU+DQo8cD7rp4jsp4Drp4nsnLzroZwsIOyLnOumrOyWvCDtgbTrnbzsnbTslrjtirgg66qo65Oc66GcIOyEpOyglTwvcD4NCjxibG9ja3F1b3RlPg0KPHA+V00wPC9wPg0KPC9ibG9ja3F1b3RlPg0KPHA+66qo65OgIOyEpOygleydtCDrgZ3rgqzsirXri4jri6QuIO2ctOyasH48L3A+DQo8cD4NCjxtZXRhIGh0dHAtZXF1aXY9XFwmcXVvdDtjb250ZW50LXR5cGVcXCZxdW90OyBjb250ZW50PVxcJnF1b3Q7dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04XFwmcXVvdDsgLz48L3A+DQo8cD7soJDtjbzrpbwg7Jiu6rKoIOyLnOumrOyWvOydhCDrjbDsnbTthLDroZwg7IKs7Jqp7ZWY64+E66GdIOygkO2NvOulvCDsmK7quLDqs6AsJm5ic3A77KCE7JuQ7J2EIOuBiuyXiOuLpOqwgCDri6Tsi5wg7Jew6rKw7ZWY6rOgIOyeoOyLnCDquLDri6TrpqzrqbQg66qo65OI7J20IOyEpOygle2VnCDrjIDroZwg7J6s7Iuc7J6RIOuQqeuLiOuLpC48L3A+DQo8cD50ZXN0LnN1YXBhcGEubmV07JeQ64qUIO2MjOydtOyNrC10d2lzdGVk7Jy866GcIOyekeyEse2VnCDslYTrnpjsnZgg6rCE64uo7ZWcIOyEnOuyhOqwgCDsgqzsmqnrkJjsl4jsirXri4jri6QuPC9wPg0KPHByZSBsYW5nPVxcJnF1b3Q7cHl0aG9uXFwmcXVvdDs+DQpmcm9tIHR3aXN0ZWQuaW50ZXJuZXQucHJvdG9jb2wgaW1wb3J0IFByb3RvY29sLCBGYWN0b3J5DQpmcm9tIHR3aXN0ZWQuaW50ZXJuZXQgaW1wb3J0IHJlYWN0b3INCg0KY2xhc3MgRWNobyhQcm90b2NvbCk6DQogICAgZGVmIGRhdGFSZWNlaXZlZChzZWxmLCBkYXRhKToNCiAgICAgICAgcHJpbnQgXFxcJ2dvdCBkYXRhOlxcXCcsIGRhdGENCiAgICAgICAgc2VsZi50cmFuc3BvcnQud3JpdGUoZGF0YS51cHBlcigpKQ0KDQpmYWN0b3J5ID0gRmFjdG9yeSgpDQpmYWN0b3J5LnByb3RvY29sID0gRWNobw0KDQpURVNUX1BPUlQgPSA4MDA1DQpwcmludCAmcXVvdDtzaW1wbGUgRUNITyBzZXJ2ZXIgc3RhcnQhIG9uIHBvcnQ6JnF1b3Q7LCBURVNUX1BPUlQNCnJlYWN0b3IubGlzdGVuVENQKFRFU1RfUE9SVCwgZmFjdG9yeSkNCnJlYWN0b3IucnVuKCkNCjwvcHJlPg0KPHA+7LKY7J2M7JeQ64qUIOyLnOumrOyWvOuhnCDshKTsoJXtlZjripQg6rO87KCV7J20IOyDneyGjO2WiOyngOunjCDri6Ttlontnojrj4QhIOyEpOyglSDrgrTsmqnsnYQg6riw7Ja17ZWY6rOgIOyeiOq4sCDrlYzrrLjsl5Ag7ZWcIOuyiCDshKTsoJXtlZjrqbQg67CU66GcIOyVhOuRkOydtOuFuOyXkCDsl7DqsrDtlbQg7J2867CY7KCB7J24IOyLnOumrOyWvCDtj6ztirgg7IKs7Jqp7ZWYIOuTryDsk7gg7IiYIOyeiOyKteuLiOuLpC48L3A+DQo8cD7rmJDtlZwsIOyVhOumrOyGoe2VnCDrtoDrtoTsnYQgV0labmV07JeQIOyniOusuO2VmOuptCDtm4zrpa3tlZwg64u167OA7J2EIOuwm+ydhCDsiJgg7J6I7JeI7Iq164uI64ukLjwvcD4NCjxwPg0KPG1ldGEgaHR0cC1lcXVpdj1cXCZxdW90O2NvbnRlbnQtdHlwZVxcJnF1b3Q7IGNvbnRlbnQ9XFwmcXVvdDt0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLThcXCZxdW90Oz53aXo2MTB3aeuKlCDslYTsnbTtj7Dsl5DshJwgLUJU64yA7Jqp7Jy866GcLSDtlZHtgaztg7HtgazqsJnsnYDqsbgg7KGw7KKF7ZWY6rGw64KYLCDrjIDspJHtmZQg65CcIOustOyEoCDqs7XsnKDquLDsmYAg7Jew6rKw7ZW0IO2ZiCDsmKTthqDrqZTsnbTshZjsl5Ag7Jyg7Jqp7ZWY6rKMIOyCrOyaqe2VoCDsiJgg7J6I7J2EIOqygyDqsJnsirXri4jri6QuIDopIDwvbWV0YT4NCjwvcD4NCjxwPg0KPG1ldGEgaHR0cC1lcXVpdj1cXCZxdW90O2NvbnRlbnQtdHlwZVxcJnF1b3Q7IGNvbnRlbnQ9XFwmcXVvdDt0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLThcXCZxdW90OyAvPjwvcD4iO319";}'
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

남은 옵션인 시리얼 포트를 이용해 보겠습니다. [WIZnet의 wiz610wi 페이지][1]에서 &#8220;user manual&#8221;을 다운 받으세요. 메뉴얼의 마지막에 시리얼 설정에 사용하는 명령어들이 표로 정리되어 있습니다.

그럼, 비디오 부터 들어갑니다.

<!--more-->

  


<meta http-equiv="content-type" content="text/html; charset=utf-8" />
데모에서 모듈은 앞선 페이지의 사진에서 보여진 Serial2USB 모듈을 통해 PC에 연결되어 있습니다. </meta> 

확대 기능을 썼는데도 글자들이 잘 안보이네요. HD(720p)모드와 전체화면으로 시청해 주세요.

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
[youtube:http://www.youtube.com/watch?v=Nq7ckirA1yE] </meta> 

다음은 데모에서 사용한 명령어들로, User manual과 비교하여 확인해 보세요.

블로그의 html태그들와 꼬이는 문제로 앞 뒤에 붙는 꺽인 괄호는 생략하였습니다. # 뒤의 내용은 주석 입니다.

> GO3 #무선 모드를 Client로 설정합니다.

이 명령은 설정에 수 초가 필요한데 이때 시리얼 LED가 켜진 채로 유지되므로 언제 명령어 처리가 끝나는지 알 수 있습니다.

> DI #접속할 AP를 scan 합니다.

다음은 <di> 명령어로 받은 데이터의 예제;</di>

> <meta http-equiv="content-type" content="text/html; charset=utf-8" />
> Ssuapapa_001884191f9a_2_57_WPA2-PSK:ajt__system_00089f0c7e28_8_59_WPA1-PSK/WPA2-PSK:&#8230; </meta> 

scan된 AP들이 : 를 구분자로 나열 됩니다. 위 예제는 두 AP, SUAPAPA 와 ajt_system 이 검색된 예 입니다. &#8220;_&#8221;를 AP 정보를 구분하기 위해 사용하기 때문에 AP의 이름(SSID)에 &#8220;_&#8221;가 있는 경우 &#8220;__&#8221;로 표시되지만 사용할 때는 원래대로 &#8220;_&#8221;을 사용하면 됩니다.

> GSsuapapa # suapapa AP에 접속

다음은 가장 까다로운 부분인 암호 설정 입니다. PC나 핸드폰으로 무선 공유기에 접근할 때는 공유기 이름(SSID)와 암호만 알면 되지만,

> GU인증방식_암호화_기본키_키길이_키포멧_암호

그 이면에는 인증방식 (WPA, WPA2, WEP, etc&#8230;)과 암호화(TKIP, AES, etc&#8230;) 등도 맞춰 줘야 합니다. PC나 스마트폰은 이 과정을 자동으로 진행핼 만큼 똑똑하지만 wiz610wi는 -시리얼 설정시에는 아직- 그 정도로 똑똑하지 않아요.

변수를 줄이기 위해 WEP과 공개 AP의 경우(이런 설정들은 안전하지 않습니다)를 제외하면, 다음과 같이 간소화 됩니다.

> GU[75]_[234]_0_0_0_암호

첫번째 인자(인증방식은) DI의 결과의 마지막 항목을 참고해 고를 수 있습니다. &#8220;WPA2-PSK&#8221; -> 7, &#8220;WPA1-PSK/WPA2-PSK&#8221; -> 5

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

<pre lang="python">from twisted.internet.protocol import Protocol, Factory
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
</pre>

처음에는 시리얼로 설정하는 과정이 생소했지만 다행히도! 설정 내용을 기억하고 있기 때문에 한 번 설정하면 바로 아두이노에 연결해 일반적인 시리얼 포트 사용하 듯 쓸 수 있습니다.

또한, 아리송한 부분을 WIZnet에 질문하면 훌륭한 답변을 받을 수 있었습니다.

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
wiz610wi는 아이폰에서 -BT대용으로- 핑크탱크같은걸 조종하거나, 대중화 된 무선 공유기와 연결해 홈 오토메이션에 유용하게 사용할 수 있을 것 같습니다. 🙂</meta> 

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

 [1]: http://www.wiznettechnology.com/Sub_Modules/en/product/Product_Detail.asp?cate1=&cate2=&cate3=&pid=1020