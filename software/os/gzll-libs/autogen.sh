#!/bin/sh -e

autoreconf --install --symlink

libdir() {
        echo $(cd $1/$(gcc -print-multi-os-directory); pwd)
}

args="--prefix=\${OPTIMSOC_INSTALLATION}/sw --host=or1k-gzll"

echo
echo "Configuration done. Before proceeding you need:"
echo " * you need the gzll compiler (or1k-gzll-gcc)."
echo " * to decide for an installation path (documentation assumes /opt/optimsoc)."
echo 
echo "Usual configuration step:"
echo
echo "    mkdir build; cd build;"
echo "    ../configure $args"
echo "    make"
echo "    make install"
echo
