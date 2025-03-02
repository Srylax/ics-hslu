#import "@preview/touying:0.6.1": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

= IEEE 754


== Problem
$ "Large numbers:" 30000000 $
$ "Small Numbers:" 0.00000000001 $

$ pause "Idea:" 1500 = 1.5 * 10^4 $

== Structure

f32:
#image("ieee754/structure.png")
Decimal: #uncover("2-")[2]

== Exercise

How to represent 1.5?

#uncover("2-")[#image("ieee754/1_5.png")]

== Calculation

Decimal: 73.37

#uncover("2-")[1. Determine the sign bit (0 if positive, 1 if negative)
$ "Sign bit" = 0 $]
#uncover("3")[
2. Convert to pure binary
$ 73.37_10 = 1001001_2 $]

== Calculate 73
$
73 div 2 = 36 &"remainder 1" \
36 div 2 = 18 &"remainder 0" \
18 div 2 = 9 &"remainder 0" \ 
9 div 2 = 4 &"remainder 1" \ 
4 div 2 = 2 &"remainder 0" \ 
2 div 2 = 1 &"remainder 0" \
1 div 2 = 0 &"remainder 1" \
$
$ 73_10 = 1001001_2 $

== Calculate 37
$
0.37 * 2 = 0.74 &" 0" \
0.74 * 2 = 1.48 &" 1" \
0.48 * 2 = 0.96 &" 0" \
0.96 * 2 = 1.92 &" 1" \
0.92 * 2 = 1.84 &" 1" \
0.84 * 2 = 1.68 &" 1" \ 
0.68 * 2 = 1.36 &" 1" \ 
0.36 * 2 = 0.72 &" 0" \
0.72 * 2 = 1.44 &" 1" \
0.44 * 2 = 0.88 &" 0" \
0.88 * 2 = 1.76 &" 1" \
0.76 * 2 = 1.52 &" 1" \
0.52 * 2 = 1.04 &" 1" \
$
$
0.04 * 2 = 0.08 &" 0" \
0.08 * 2 = 0.16 &" 0" \
0.16 * 2 = 0.32 &" 0" \
0.32 * 2 = 0.64 &" 0" \
0.64 * 2 = 1.28 &" 1" \
0.28 * 2 = 0.56 &" 0" \
0.56 * 2 = 1.12 &" 1" \
0.12 * 2 = 0.24 &" 0" \
0.24 * 2 = 0.48 &" 0" \
0.48 * 2 = 0.96 &" 0" \
0.96 * 2 = 1.92 &" 1" \
0.92 * 2 = 1.84 &" 1" \
0.84 * 2 = 1.68 &" 1" \ 
$

$ 0.37_10 = 01 overline(01111010111000010100)... $
$ 73.37 = 1001001.01  overline(01111010111000010100)... $

== Convert
3. Normalize to determine the mantissa  and the unbiased exponent

$ 1001001.[...] = 1.00100101  overline(01111010111000010100)... * 2^6 $
#uncover("2-")[
4. Determine biased exponent (+127)
$ 6+127 &= 133_10\
&= 10000101_2
$]
#uncover("3-")[
5. Remove leading 1 from mantissa
]
== Result
#image("ieee754/73.37.png",height: 35%)
#image("ieee754/73.37_rounded.png",height: 35%)


== Edge Cases

#grid(
columns: 2,
gutter: 2%,
figure(
  image("ieee754/0.png"),
),
image("ieee754/infinite.png"),
image("ieee754/nan.png"),
image("ieee754/subnormal.png")
)

== Subnormal
#image("ieee754/range.png")

== Use in java
`https://eibx.com/interactive-visualization-of-floating-point-ieee-754/`

`https://floating-point-gui.de/formats/fp/`