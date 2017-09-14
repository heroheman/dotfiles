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
x24 w14 x2 e1 x13 y6 x4 w1 x1 w1 x1 w12 x1 e1 x11 y9 x2 w2 x1 w1 x1 w13 e1 x9 y13 w2 x3 w13 e1 x8 y2 x2 y6 x2 y2 w18 e1 x7 y2 x1 y10 x1 y1 w4 x2 w1 x1 w1 x1 w1 x2 w1 x1 w1 x1 w1 e1 x6 y2 x1 y12 x1 w4 x1 w2 x1 w1 x1 w1 x1 w2 x2 w2 e1 x5 y17 w5 x1 w1 x3 w1 x2 w1 x1 w1 x1 w1 e1 x4 y6 x3 y5 x3 y2 w3 x2 w12 e1 x4 y6 x1 b1 x1 y5 x1 b1 x1 y3 w15 x1 e1 x4 y6 x3 y5 x3 y5 w2 x12 e1 x4 y20 w3 x13 e1 x4 y19 w2 y2 x13 e1 x4 y23 x13 e1 x4 y4 x1 y14 x1 y3 x13 e1 x4 y4 x2 y13 x1 y3 x13 e1 x4 y5 x1 y12 x2 y3 x13 e1 x5 y5 x2 y8 x3 y3 x14 e1 x5 y6 x10 y5 x14 e1 x6 y19 x15 e1 x7 y17 x16 e1 x9 y13 x18 e1 x10 y10 x20"

for n in $img
do
    u $n
done
e;
exit 0;
