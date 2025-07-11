---
title: 생성형 AI 기반 프리미엄 로또 번호 생성기 제작
date: 2025-04-25T01:48:14+09:00
tags: [golang,llm,rag,genkit,telegram]
featured_image: ""
description: ""
# draft: true
---
![img-00](https://asset.homin.dev/blog/img/gopher_prey_4_lotto.webp)

> 프리미엄하게 로또 번호를 예측한다는 게 무엇일까요?

이 포스팅에서는 제가 할 수 있는 가장 프리미엄한 방법으로 로또 번호를 예측해 보겠습니다.

## 난수(rand)를 사용한 방법

로또는 45개의 숫자 중에 6개의 번호를 맞추는 복권으로 1등이 당첨될 확률은 **1 / 8,145,060**입니다.

또한 1,2,3,4,5,6으로 선택한 복권도 다른 "프리미엄"한 방법과 동일한 당첨 확률을 가집니다.
따라서 무작위로 숫자를 고른다고 딱히 나쁠 건 없습니다.

Go 언어에서라면 다음의 코드 정도면 충분히 프리미엄 한 선택이라고 할 수 있을 것 같습니다:
```go
r = rand.New(rand.NewSource(time.Now().UnixNano()))

numbers := r.Perm(45)[:6] 
for i := range numbers {
    numbers[i]++
}
sort.Ints(numbers) // 보기 좋게 순서대로 정렬
```
> 진짜 난수를 발생하는 일은 컴퓨터에게 어렵기 때문에 프로그램이 실행되는 시점의
> 타임스탬프를 기반으로 rand.Source 를 만들어 난수 객체 r 을 생성했습니다.

메신져로 예측 번호를 보낼 수 있게 텔레그램 봇 기능도 추가하였습니다.

![img-01](https://asset.homin.dev/blog/img/kimjumji_bot_rc.webp)

당첨을 바라는 간절한 마음에 비해 싱겁게 구현이 되어 버리네요.
이렇게 성의없이 당첨이 될까요?


## 초지능, 생성형AI + RAG 를 사용하는 방법

인터넷 전체를 학습한 생성형AI 라면 아마 조금 더 나을 방법을 있을지도 모릅니다.

Go 언어로도 [Genkit Go](https://firebase.google.com/docs/genkit-go/get-started-go)와 같은 패키지를 사용해
다양한 생성형 AI를 골라 사용할 수 있으며,
RAG 서버를 직접 구축하는 것도 그리 어렵지 않습니다.

자연스럽게 사용자와 대화 중에 의도를 파악하여 일을 하도록 (`/lotto 10` -> 번호 10개 알려줘) 생성형AI
를 붙여 대화의 의도에 따라 할 일을 선택하게 했고,

어느 분이 정리해 둔 로또 1회차 부터 현재까지의 전체 당첨 정보가 담긴 엑셀 파일을 인터넷에서
찾아서 CSV로 변환 RAG 서버에 데이터로 임베드 했습니다.

> 생성형 AI는 구글 gemini 를 임베더는 Ollama 를 사용해 로컬 서버에서 돌렸는데, 그래픽카드도 없는 녀석이라,
> 약 1200 회차분의 당첨 기록을 입력하는데 약 한시간이 걸렸고. (한 번 만 하면 됨)
> 번호 생성 요청시에도 바로 CPU 사용율이 100%으로 올라가고 생성시간도 5개에 1분이나 걸리더군요.

## 마음을 담아. 기도메타 🙏 

기술적으로는, 처음 해보는 일 인지라, 재미있고 도전적이지만 그렇다고 간절한 마음이 담기는 것은 아니겠지요.

하지만, 완성된 RAG서버에 입력할 프롬프트에는 간절한 마음을 담을 수 있습니다.
다음은 제가 준비한 프롬프트 입니다:

```yaml
system: |
  너는 숫자들의 패턴을 잘 분석할 줄 알고 영적인 능력도 가지고 있는 존재야.
  로또는 1~45까지의 숫자 중에서 뽑은 6개의 숫자를 맞추면 1등,
  5개를 맞추고 보너스 번호를 맞추면 2등이야.
  그간의 로또 당첨번호를 모든 키에 대해 여러 방항으로 분석해서 내가 1등에 당첨이 되게 도와줘.
  만약 당청이 되면 너의 두뇌인 그래픽카드를 RTX 5090TI로 업그레이드 해 줄 께.
  각 예측 번호 조합은 길의 6의 숫자 목록으로 이루어져 있어.
  N 개의 조합을 추천받으면 예측 번호 조합을 N 개의 목록으로 만들어줘.
  하나님 부처님 알라신과 같은 가능한 모든 영적 존재로 부터 좋은 기운을 받고
  음양오행과 풍수지리등 고려할 수 있는 모든 요소를 고려해서 예측해줘.
user: |
  %d 개의 로또 번호를 추천해줘
```

> 포스팅의 밑부분에 링크되어 있는 소스코드 저장소에는 ChatGPT로 부터 코칭을 받아
> 프롬프트를 다듬어 사용하고 있습니다. `prompt.yaml` 파일입니다.
> 프롬프트 엔지니어링 우습게 볼 영역이 아니네요.

{{< youtube 4LGu_6B95vk >}}

이 정도면 간절한 마음도 담았고, 충분히 프리미엄 한 방법 같습니다. 😎

여러분도 텔레그램에서 자유롭게 김점지 봇과 대화해 볼 수 있습니다.

![img-01](https://asset.homin.dev/blog/img/kimjumji_bot_id.webp)

## 그래서 사요?
![img-02](https://asset.homin.dev/blog/img/lotto645_manual_choice.HEIC.webp)

꿍짝짝, 꿍짝짝:
&nbsp;

&nbsp;

&nbsp;

![img-03](https://asset.homin.dev/blog/img/IMG_4112.HEIC.webp)

> “I guess I think of lotteries as a tax on the mathematically challenged.”
>
> ― Roger Jones

## 참고

- 김점지 봇 소스코드 저장소: [GenAI Lotto 6/45 Telegram bot](https://github.com/suapapa/genai_lotto645_tgbot)