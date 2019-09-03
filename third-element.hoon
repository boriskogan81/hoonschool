::  We are using |=, bartis, to produce a gate which takes an untyped list, which is stored as n
::
|=  list=(list *)
:: to return the third element of this list without using standard library functions, we can remember that a list is a noun, the address of the noun as a whole is 1,
:: the address of the first element is 2, the address of the second element is 3, the third element is in the tail of the second element, and thus is at address 2n
:: (2 in this case) + 1, i.e., 7. We use the slot operator + to extract this tail
::
=/  tail  +7:list
:: but we don't know the length of the list. The tail could be one element or a cell
:: if it's one element, we need to return it. If its type is a cell,
::
?^  tail
:: we need to return its head, or first element.
::
  +2:tail
:: otherwise, we return itself
::
tail

