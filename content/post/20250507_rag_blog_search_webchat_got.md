---
title: "블로그 검색에 특화된 RAG 챗봇 ‘블검봇’"
date: 2025-05-07T03:06:01+09:00
tag: [golang,llm,rag,genkit,webchat]
---

이 블로그는 2008년 부터의 글들이 쌓여 있습니다.
내제된 블로그 검색은 없고 구글검색에 맡기고 있기 때문에 검색 접근성이 좋지 않았습니다.

이 포스팅에서는 최소한의 비용으로 사이트의 오른쪽 밑에 보이는 웹쳇 위젯에 검색기능을 붙인 내용을 소개합니다.
(사이트 내의 모든 페이지, 이 포스팅의 우 하단에도, 에서 바로 사용해 볼 수 있습니다.)

![img-00](https://homin.dev/asset/blog/img/blgumbot_in_action.png.webp)


## LLM의 한계

LLM은 "인터넷 전체"를 암기하고 있는 똑똑이 같습니다. 하지만 인터넷에서 쉽게 찾을 수 없는 질문을 물어보면
똑똑하게 거짓말을 하기 시작합니다. 아래 예제에서는 SLM인 Gemma3 를 사용했지만 메이져 회사들의 최신 LLM에서도 마찬가지 입니다.

![img-01](https://homin.dev/asset/blog/img/llm_is_stupid.png.webp)

사실 희동이는 고길동의 조카입니다. 그걸 알려주면 LLM은 다시 똑똑해 질 수 있습니다.

![img-02](https://homin.dev/asset/blog/img/teach_llm.png.webp)


## Retrieval-Augmented Generation (RAG) 를 사용한 블검봇의 동작 원리

제 블로그에는 그간 쌓인 텍스트만 1Mbyte 크기 입니다.
테라 단위의 세상에 크지 않은 용량이지만 제 블로그 검색한다고 매 번 위의 예제처럼 전체 블로그 텍스트를
프롬프트로 입력하면 저의 지갑은 금방 동나겠죠.

> 예로, OpenAI의 API의 경우 선불 교통카드와 같이 미리 금액을 충전하고 토큰을 사용하는대로
> 차감되는 방법으로 과금합니다.

LLM 서비스에는 NLP 의 임베딩이라는 기술이 사용됩니다.
임베딩은 다음과 같이 글을 벡터로 변환하며, LLM 서비스에서 제공하는 API들 중에는 임베더 기능도 포함합니다.

예를들어 임베더는 다음과 같이 글을 숫자로 바꾸는데,
```
"사과" → [0.12, -0.34, ..., 1.05] 같은 실수 벡터
```

**사과**와 **귤**의 의 벡터를 비교하면 **사과**와 **라면**보다 유사도가 높다고 나옵니다.

이 원리를 사용해, 다음과 같은 절차로 블검봇이 동작합니다.

- 각 포스팅을 잘게 쪼개 인덱싱 결과를 (각 토큰이 포함된 URL등의 메타와 함께)저장
  - Open Korean Text 를 사용해 normalize 및 phrase 추출
- 사용자의 입력에서 뭘 궁금해 하는지 검색
  - LLM 에 키워드를 추출해 달라고 부탁
- 키워드의 벡터로 포스팅들의 벡터디비를 검색하여 유사도 높은 키워드를 검색
  - 검색된 키워드들을 동일한 URL로 묶음어서 가공
- 가공한 데이터를 바탕으로 검색 결과를 `- [제목](링크)` 형태로 반환
  - 프론트엔드에서 마크다운 문자열을 html로 변환.

> 직접 해 보니 벡터 생성과 벡터 디비에서의 검색은 '똑딱' 되는 반면,
> 인덱싱은 '뚜---우----욱----딱' 하며 오래 걸리더군요.


## 비용은 어떻게 감당할 것인가?

앞서 말한대로 LLM 서비스들은 공짜가 아닙니다. **블검봇** 이 주로 사용하는 임베딩은 토큰 사용량이 높지 않지만,
어쨌던 돈이죠. 이건 Ollama 를 사용해 Gemma3 모델을 로컬 PC에서 돌려서 해결했습니다.

사용자의 웹브라우져와 이 로컬 PC를 연동하기 위해서 이 사이트를 호스팅 하고 있는 k8s 클러스터에
메시지를 상호 전달하는 릴리이를 하나 두었습니다.

![img-03](https://homin.dev/asset/blog/img/markmind_dataflow.jpeg.webp)

> 돈이 부족하면 머리가 고생한다.


## 회고

- 이 지식으로 업무 영역에도 적용이 가능해 보여 더 의미가 있었습니다.
  - 로또봇과 달리 이 지식으로 돈(월급)이 나옵니다.
- 빠짐 없이 검색되는 방법을 찾아 phrases 를 인덱싱 했는데, 부작용으로 불필요한 검색까지 되는 문제가 있습니다.
  - '유니콘'을 찾았는데 '니콘 카메라' 가 검색되는 현상.
- 약 일주인간의 연휴라는 단기간에 Cursor 에디터의 도움을 받아 많은 양을 코드를 작성할 수 있었습니다.
  - 리엑트 코드는 생전 처음 봤는데 지시만 잘 했더니 에디터가 스스로 해 주네요.  
  - 이걸 좋아해야 하는지는 좀 아리송 합니다. 


## 참고

다음은 위 웹쳇 위젯과 연관되어 작성된 프로젝트 들 입니다:

- [Relay Webchat](https://github.com/suapapa/relay-webchat) - Componets which made the webchat widget works
- [Ragkit](https://github.com/suapapa/go_ragkit) - A Go pacakge to perform indexing and retrieving with Weaviate as VDB and OpenAI & Ollama as embedder
- [MarkMind](https://github.com/suapapa/markmind) - Index and retrieve markdown contents like Hugo blog
- [OktAPI](https://github.com/suapapa/okt-api) - Open Korean Text API server