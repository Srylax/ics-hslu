#import "@preview/jlyfish:0.1.0": *
#import "@preview/oxifmt:0.2.1": strfmt

#read-julia-output(json("NETW1-jlyfish.json"))

#let plot(function,x: -10,y: 10,length: 100) = {
  jl(raw(strfmt("
    using Plots
    function f(x)
      {}
    end

    _x = range({}, {}, length={})

    plot(_x,f.(_x),label=\"f(x)={0}\")
    plot!(legend=:outerbottom, legendcolumns=1)
  ",function.text,x,y,length)))
}


#let expand(function) = {
  jl-raw(fn: it =>
    math.equation(block:true,eval(function.text + " = " + it.result.data ,mode:"math"))
  ,(raw(
    strfmt("
      using Symbolics
      @variables x,y,z,a,b,c
      _f = {}
      replace(string(simplify(_f,expand=true)),\"//\"=>\"/\")
      ",function.text)
  )))
}

== SW02 - Setigkeit, Sekante und Tangente
#jl(`
function f(x)
  x / (x^2 +1)
end

f(1)
`)
#line(length: 100%)

```julia
function f(x)
  -3 * (1/5*x-2)^2 + 30
end

0 = -3 * (1/5*x-2)^2 + 30
```
$ x_1 = 10-5sqrt(10) approx -5.8$ \
$ x_2 = 10+5sqrt(10) approx 25.8$

#line(length: 100%)
```julia
function f(x)
    (2*x^2 +3) /2
end
```
$ DD = brace.l x in RR bar.v x in.not 0 brace.r $
$ WW = brace.l y in RR bar.v y gt 5 and y lt -5 brace.r $

#line(length: 100%)
#plot(`(-2 * x^2-4*x+3)/2`)

$ lim_(x arrow.r infinity) =  (-2x^2-4x+3)/x^2 $
$ lim_(x arrow.r infinity) =  (x^2(-2-4/x+3/x^2))/1 $

#line(length: 100%)
== Polynom - Division
$ f(x)=4x^2-16 $
#plot(`4x^2-16`)

$ f(x)=f(-x) "gerade" (y=x^2) $
$ f(x)=-f(-x) "ungerade" (y=x^3) $

$ f(-x)=4(-x)^2-16 = 4x^2-16 = f(x) "gerade" $

#line(length: 100%)
$ f(x) = cases(
  x^2-2x+1 "for" x lt 2,
  x^2-6x+9 "for" x gt.eq 2
)  $

#line(length: 100%)
== Differenz quotient

$ P: f(x_1) \
Q:f(x_2)=f(x_1 + Delta h) $


#expand(`(a-b)^2`)

// $ Delta y / Delta x = (f(x_2)=f(x_1)) / (Delta x) = (f(x_2)-f(x_1)) / (Delta x) $
