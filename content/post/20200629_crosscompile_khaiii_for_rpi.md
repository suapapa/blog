---
title: "라즈베리파이로 KHAiii 크로스컴파일 하기"
date: 2020-06-29T21:56:40+09:00
---

KHAiii 소스 다운로드;

    $ git clone https://github.com/kakao/khaiii
    $ cd khaiii


[abhiTronix가 미리 빌드해 둔 툴체인](https://github.com/abhiTronix/raspberry-pi-cross-compilers)을
사용합니다. 저는 라즈베리파이2 buster용 10.1.0 툴체인을 다운받아 `~/.local` 밑에 풀었습니다.


컴파일을 위해 `build` 디렉터리 생성;

    $ mkdir build && cd $_


다음과 같이 다운받은 크로스툴체인을 가리키도록 파일을 생성:

    $ cat toolchain_rpi.arm.cmake 
    SET(CMAKE_C_COMPILER /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-gcc)
    SET(CMAKE_CXX_COMPILER /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-g++)
    SET(CMAKE_LINKER /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-ld)
    SET(CMAKE_NM /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-nm)
    SET(CMAKE_OBJCOPY /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-objcopy)
    SET(CMAKE_OBJDUMP /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-objdump)
    SET(CMAKE_RANLIB /home/suapapa/.local/cross-pi-gcc-10.1.0-1/bin/arm-linux-gnueabihf-ranlib)


`cmake`를 실행해 `Makefile` 생성:

    $ cmake -E env CXXFLAGS="-w" \
      cmake \
      -DCMAKE_TOOLCHAIN_FILE=./toolchain_rpi.arm.cmake \
      -DCMAKE_CROSSCOMPILING=TRUE \
      -DFMA=OFF \
      ..


드디어 빌드 및 리소스 빌드:

    $ make -j 8
    $ make resource

rpi로 옮길것들 모아두기:

    $ cd ..
    $ mkdir rpi_usr_share_local && cd $_
    $ cp -r ../include/ ./
    $ cp -r ../build/bin ./
    $ cp -r ../build/lib ./
    $ cp -r ../build/share ./
    $ cd ..
    $ tar -cvzf khaiii_root.tar.gz ./rpi_usr_share_local

이렇게 모은 파일들을 라즈베리파이에 옮겨 `/usr/local/` 밑에 푼다.
라즈베리파이 쉘에서 다음과 같이 잘 동작하는지 테스트 해 볼 수 있다.

    $ cd /usr/local/bin
    $ ./khaiii
    ...
    범 내려온다.
    범      범/NNG
    내려온다.       내려오/VV + ㄴ다/EF + ./SF

잘 됩니다. ㅎㅎ

