#!/bin/sh

check_support() {
  if [ ! -f arch/attach-$1.[cS] ]; then
    ARCH="none"
    OS="none"
  fi
}

ARCH=`uname -m`
if echo $ARCH | grep '^i.86$' >/dev/null 2>/dev/null; then
  ARCH=ia32
fi

OS=`uname|tr [A-Z] [a-z]`

check_support $ARCH-$OS

if [ "x$1" = "x-os" ]; then
  echo $OS
elif [ "x$1" = "x-arch" ]; then
  echo $ARCH
fi
