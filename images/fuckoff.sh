#!/bin/bash
#Background Colors
E=$(tput sgr0);    R=$(tput setab 1); G=$(tput setab 2); Y=$(tput setab 3);
B=$(tput setab 4); M=$(tput setab 5); C=$(tput setab 6); W=$(tput setab 7);
function e() { echo -e "$E"; }
function x() { echo -n "$E  "; }
function r() { echo -n "$R  "; }
function g() { echo -n "$G  "; }
function y() { echo -n "$Y  "; }
function b() { echo -n "$B  "; }
function m() { echo -n "$M  "; }
function c() { echo -n "$C  "; }
function w() { echo -n "$W  "; }

#putpixels
function u() { 
    h="$*";o=${h:0:1};v=${h:1}; 
    for i in `seq $v` 
    do 
        $o;
    done 
}

img="\
x6 r1 x33 e1 x6 r1 x33 e1 x6 r1 x33 e1 x4 w5 x6 w3 x8 w3 x1 w1 x9 e1 x3 w1 x4 w3 x4 w1 x9 w1 x4 w1 x1 w1 x7 e1 x2 w1 x1 w1 x1 w1 x4 w1 x3 w2 x8 w1 x4 w2 x8 e1 x2 w1 x2 w1 x2 w1 x1 w1 x1 w1 x2 w1 x10 w3 x1 w1 x1 w1 x7 e1 x2 w1 x1 w1 x1 w1 x2 w1 x2 w1 x27 e1 x2 w1 x5 w1 x1 w1 x1 w1 x2 w4 x1 w4 x1 w4 x1 w4 x6 e1 x2 w2 x7 w2 x27 e1 x3 w8 x29 e1 x4 r2 w1 x1 r1 x10 w2 x2 w3 x2 w3 x9 e1 x5 r3 x10 w1 x2 w1 x1 w1 x4 w1 x11 e1 x6 w1 x11 w1 x2 w1 x1 w2 x3 w2 x10 e1 x5 w3 x11 w2 x2 w1 x4 w1 x11 e1 x4 w1 x1 w1 x1 w1 x31 e1 x3 w1 x2 w1 x2 w1 x8 w4 x1 w4 x1 w4 x8 e1 x6 w1 x33 e1 x6 w2 x32 e1 x5 w1 x2 w1 x31 e1 x4 w1 x2 w1 x32 e1 x4 w1 x3 w1 x31 e1 x40"

for n in $img
do
    u $n
done
e;
exit 0;
