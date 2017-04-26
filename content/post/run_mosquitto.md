+++
date = "2017-04-26T19:30:35+09:00"
title = "run_mosquitto"
draft = true

+++

오픈소스 프로그램들로 IoT 구성해 보기

준비물:

* RESTful server
* Rpi for broker
* Rpi for thing

    $ sudo apt install mosquitto mosquitto-clienets

기본적인 MQTT 통신:

    $ mosquitto_sub -h 127.0.0.1 -t /world
    hello
    hello

    $ mosquitto_pub -h 127.0.0.1 -t /* -m "hello"
    $ mosquitto_pub -h 127.0.0.1 -t /* -m "hello"

이건 안됨

    $ mosquitto_sub -h 127.0.0.1 -t /world/korea

    $ mosquitto_pub -h 127.0.0.1 -t /world/* -m "hello"

반대로... 해도 안됨. 이게 뭐지?

    $ mosquitto_sub -h 127.0.0.1 -t /world/*

    $ mosquitto_pub -h 127.0.0.1 -t /world/korea -m "hello"
