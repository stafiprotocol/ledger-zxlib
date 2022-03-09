#!/bin/bash

source <(\
    sed -r '{
        /^#define/!d
        /#define[ \t]*[^ \t]*$/d
        s/[^ \t]*[ \t]*([^ \t]*)[ \t]*(.*)/\1="\2"/
        /(""|\([^\)]*\))/d
    }' <(gcc -E -dM include/zxversion.h)
)
