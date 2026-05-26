#!/bin/bash
BASEDIR="$HOME/osbook"
EDK2DIR="$HOME/edk2"

cd $EDK2DIR
echo "加载edk环境..."
source ./edksetup.sh
echo "开始编译EDK2..."
build

cd $BASEDIR/source/richardos/kernel
echo "开始编译kernel.elf..."
make

echo "编译完成，启动模拟器..."
$BASEDIR/devenv/run_qemu.sh $EDK2DIR/Build/RichardLoaderX64/DEBUG_GCC5/X64/Loader.efi \
                                        $BASEDIR/source/richardos/kernel/kernel.elf