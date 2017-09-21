#!/bin/bash
NDK_PATH=/Users/libo/WorkStation/SDKs/android-ndk-r13b
VALGRIND_PATH=/Users/libo/WorkStation/GitHub/valgrind

cd $VALGRIND_PATH
export HWKIND=generic
export NDKROOT=$NDK_PATH
export APP_PLATFORM=android-15
export TOOLCHAIN_SET=arm-linux-androideabi-4.9
export LOCAL_HOST=darwin-x86_64

export AR=$NDKROOT/toolchains/$TOOLCHAIN_SET/prebuilt/$LOCAL_HOST/bin/arm-linux-androideabi-ar
export LD=$NDKROOT/toolchains/$TOOLCHAIN_SET/prebuilt/$LOCAL_HOST/bin/arm-linux-androideabi-ld
export CC=$NDKROOT/toolchains/$TOOLCHAIN_SET/prebuilt/$LOCAL_HOST/bin/arm-linux-androideabi-gcc

export RANLIB=$NDKROOT/toolchains/$TOOLCHAIN_SET/prebuilt/$LOCAL_HOST/bin/arm-linux-androideabi-ranlib
export STRIP=$NDKROOT/toolchains/$TOOLCHAIN_SET/prebuilt/$LOCAL_HOST/bin/arm-linux-androideabi-strip
export CPPFLAGS="--sysroot=$NDKROOT/platforms/$APP_PLATFORM/arch-arm -DANDROID_HARDWARE_$HWKIND"
export CFLAGS="--sysroot=$NDKROOT/platforms/$APP_PLATFORM/arch-arm"
export LIBS="-L$NDKROOT/platforms/$APP_PLATFORM/arch-arm/usr/lib"
./autogen.sh

./configure --prefix=/data/local/Inst --host=armv7-unknown-linux --target=armv7-unknown-linux --with-tmpdir=/sdcard

make -j8
make -j8 install DESTDIR=`pwd`/Inst


