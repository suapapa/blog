+++
date = "2017-03-27T11:56:53+09:00"
title = "handling_cp949_in_go"
draft = true

+++

전에 보아두었던 Gophercon2016에서의 text처리(i18n, l10n) 패키지로
EUCKR 인/디코딩을 해 보았습니다.

패키지 설치는 다음과 같이 하시고:

    $ go get -u golang.org/x/text/...

아래 코드처럼 사용하실 수 있습니다:

    package main

    import (
        "log"

        "golang.org/x/text/encoding/korean"
        "golang.org/x/text/transform"
    )

    func main() {
        src := "아름다운 우리말"
        exp := "\xbe\xc6\xb8\xa7\xb4\xd9\xbf\xee \xbf\xec\xb8\xae\xb8\xbb"

        got, n, err := transform.String(korean.EUCKR.NewEncoder(), src)
        if err != nil {
            panic(err)
        }

        if got != exp {
            panic("no match")
        }

        log.Println([]byte(got), n) // 22 <= 3(UTF-8) * 7(chars) + 1(a space char)
    }

해당 슬라이드는 아래 링크입니다:
* [Handling Text from Around the World in Go](https://github.com/…/MarcelVanLohuizen-TextSubre…/slides.pdf)

