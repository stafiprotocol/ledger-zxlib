#!/bin/bash

SCRIPT_DIR=$(dirname $(readlink -f $0))

source <(\
    sed -r '{
        /^#define/!d
        /#define[ \t]*[^ \t]*$/d
        s/[^ \t]*[ \t]*([^ \t]*)[ \t]*(.*)/\1="\2"/
        /(""|\([^\)]*\))/d
    }' <(gcc -E -dM $SCRIPT_DIR/include/zxversion.h)
)
