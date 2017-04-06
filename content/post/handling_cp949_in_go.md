+++
date = "2017-04-06T11:56:53+09:00"
title = "고 언어에서 로컬 인코딩 cp949 처리하기"

+++

전에 보아두었던 Gophercon2016에서의 text처리(i18n, l10n) 패키지로
EUCKR 인/디코딩을 해 보았습니다.

해당 슬라이드는 아래 링크입니다:

* [Handling Text from Around the World in Go](https://github.com/…/MarcelVanLohuizen-TextSubre…/slides.pdf)

패키지 설치는 다음과 같이 하시고:

    $ go get -u golang.org/x/text/...

아래 코드처럼 `utf8 -> euckr` 로 변환 시 사용하실 수 있습니다:

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

`xml` 파일이 utf-8 인코딩이 아닌 경우 다음과 같이 `euckr->utf8`로의 변환을 위해
xml decoder의 `CharsetReader` 를 설정해 사용하실 수도 있습니다.

    import (
        "golang.org/x/text/encoding/korean"
        "golang.org/x/text/transform"
    )

    var (
    	euckrDec = korean.EUCKR.NewDecoder()
    )

    func unmarshalCp949XML(r io.Reader, v interface{}) error {
    	d := xml.NewDecoder(r)
    	d.CharsetReader = func(c string, i io.Reader) (io.Reader, error) {
    		if c != "cp949" && c != "euc-kr" {
    			return nil, errors.New("unexpect charset: " + c)
    		}

    		r := transform.NewReader(i, euckrDec)
    		return r, nil
    	}

    	return d.Decode(v)
    }

이제 제가 전에 만들었던 `github.com/suapapa/go_hangul/encoding/cp949` 패키지를
쓸 일은 없어졌네요. ㅎ
