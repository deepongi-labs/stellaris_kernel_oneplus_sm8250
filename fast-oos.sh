#!/bin/bash
export HOME=/home/deepongi
export KERNEL_DIR="/mnt/Android/stellaris_kernel_oneplus_sm8250"
export KBUILD_OUTPUT="/mnt/Android/stellaris_kernel_oneplus_sm8250/out"
export ZIP_DIR="/mnt/Android/AnyKernel3-oos"
export ZIP_OUT_DIR="/mnt/Android/Out_Zips"
rm -rfv /mnt/Android/AnyKernel3-oos/Image.gz
rm -rfv /mnt/Android/AnyKernel3-oos/dtbo.img
make O=out clean
make O=out mrproper
rm -rfv out
export PATH="/mnt/Android/toolchains/proton-clang-16/bin:$PATH"
export USE_CCACHE=1
export ARCH=arm64
export VARIANT="Aurora-OOS-R10"
export HASH=`git rev-parse --short=4 HEAD`
export KERNEL_ZIP="$VARIANT-$HASH"
export LOCALVERSION="~Aurora-OOS-R10"
export CROSS_COMPILE=
make O=out CC=clang LLVM=1 LLVM_IAS=1 vendor/kona-perf_defconfig
make O=out CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM=1 LLVM_IAS=1 -j32 CROSS_COMPILE=/mnt/Android/toolchains/gcc-linaro-12.2.1-2023.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- CROSS_COMPILE_ARM32=/mnt/Android/toolchains/gcc-linaro-12.2.1-2023.01_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
cp -v $KBUILD_OUTPUT/arch/arm64/boot/Image.gz $ZIP_DIR/Image.gz
cp -v $KBUILD_OUTPUT/arch/arm64/boot/dtbo.img $ZIP_DIR/dtbo.img
cd $ZIP_DIR
zip -r9 $VARIANT-$HASH.zip *
mv -v $VARIANT-$HASH.zip $ZIP_OUT_DIR/
echo -e "${green}"
echo "-------------------"
echo "Build Completed"
echo "-------------------"
echo -e "${restore}"
echo "                                                                                                             "
echo " ██     ▄   █▄▄▄▄ ████▄ █▄▄▄▄ ██       █  █▀ ▄███▄   █▄▄▄▄   ▄   ▄███▄   █         ████▄    ▄▄▄▄▄    ▄▄▄▄▄   "   
echo " █ █     █  █  ▄▀ █   █ █  ▄▀ █ █      █▄█   █▀   ▀  █  ▄▀    █  █▀   ▀  █         █   █   █     ▀▄ █     ▀▄ "    
echo " █▄▄█ █   █ █▀▀▌  █   █ █▀▀▌  █▄▄█     █▀▄   ██▄▄    █▀▀▌ ██   █ ██▄▄    █         █   █ ▄  ▀▀▀▀▄ ▄  ▀▀▀▀▄   "    
echo " █  █ █   █ █  █  ▀████ █  █  █  █     █  █  █▄   ▄▀ █  █ █ █  █ █▄   ▄▀ ███▄      ▀████  ▀▄▄▄▄▀   ▀▄▄▄▄▀    "
echo "    █ █▄ ▄█   █           █      █       █   ▀███▀     █  █  █ █ ▀███▀       ▀                               "    
echo "   █   ▀▀▀   ▀           ▀      █       ▀             ▀   █   ██                                             "   
echo "  ▀                            ▀                                                                             "   
                                                    
                                                                                                    
                                                                                                    
                                                                                                    
