
::  We are using |=, bartis, to produce a gate which takes a @ud that is stored in face n. Our initial value is 1.
::
|=  n=@ud
::We use tisfas to declare a type-checked variable, in this case, t, which is set to  0. Thi is the accumulator which we use to keep a running total.
::
=/  t=@ud  0
:: |-, barhep creates a new gate with one arm and calls it immediately. This is our recursion point, we will return to this
::
|-
:: wutcol branches on a boolean test. In this case, we want to see if n equals 1000. If it does, our generator returns t
::
?:  =(n 1.000)  t
:: if not, we check whether n is divisible by 3 or 5
::
?:  |(=((mod n 3) 0) =((mod n 5) 0))
:: if so, we set t to equal itself plus n, increment n and recurse
::
$(n +(n), t (add t n))
:: if not, we just increment n and recurse
::
$(n +(n))
