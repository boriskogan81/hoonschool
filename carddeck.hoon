:: Debugging mode engaged
::
!:
::  The reason I'm using a say generator, aside from the fact that that's the assignment,
::  is to get entropy from Arvo in order to get randomness.
::
:-  %say
::  Let's set up the generator, pull in entropy and accept integers x and y.
::  I want x hands of y cards.
::
|=  [[* eny=@uvJ *] [x=@ud y=@ud ~] ~]
::  we're marking the kind of data we're going to produce, a noun
::
:-  %noun
:: kethep typecasts explicitly by label, in this case, to a list of tapes
::
^-   (list tape)
:: I want to set up my list, initially empty, and my deck of 52 cards
::
=/  hands=(list tape)  [~]
:: my hand, initially an empty string
::
=/  hand  ""
::  and my deck of 52 cards
::
=/  deck=(list cord)
  :~  'A♥'
      'K♥'
      'Q♥'
      'J♥'
      '10♥'
      '9♥'
      '7♥'
      '6♥'
      '5♥'
      '4♥'
      '3♥'
      '2♥'
      'A♣'
      'K♣'
      'Q♣'
      'J♣'
      '10♣'
      '9♣'
      '7♣'
      '6♣'
      '5♣'
      '4♣'
      '3♣'
      '2♣'
      'A♦'
      'K♦'
      'Q♦'
      'J♦'
      '10♦'
      '9♦'
      '7♦'
      '6♦'
      '5♦'
      '4♦'
      '3♦'
      '2♦'
      'A♠'
      'K♠'
      'Q♠'
      'J♠'
      '10♠'
      '9♠'
      '7♠'
      '6♠'
      '5♠'
      '4♠'
      '3♠'
      '2♠'
==
::  If my user wants zero hands, or hands of zero cards, or my deck is empty and I have no
::  cards left to deal, or my list has x hands, which is what was originally asked for, I'm
::  going to return the list
::
?:  |(=(x 0) =(y 0) =((lent hands) x))  
  hands
:: If I have no cards left in the deck, push the current hand into the list and return the list
::
?:  =((lent deck) 0)  (snoc hands hand)
::  If the current hand is y cards long, recurse, pushing the hand into the list and emptying the hand
::
?:  =((lent hand) y)
  $(hands (snoc hands hand), hand "")
:: otherwise, we want to take a random integer from the length of the deck
::
=/  rng  ~(. og eny)
=/  val  (rad:rng (lent deck))
:: let's take the card at that index in the deck
::
=/  card  (snag val deck)
:: now, we recurse. We will add the card to the hand, and remove it from the deck
::
$(hand (snoc card hand), deck (oust [val 1] deck))

