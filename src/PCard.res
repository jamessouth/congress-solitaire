type suit =
  | Hearts
  | Spades
  | Diamonds
  | Clubs

let string_of_suit = suit => {
  switch suit {
  | Hearts => "hearts"
  | Spades => "spades"
  | Diamonds => "diamonds"
  | Clubs => "clubs"
  }
}

type rank =
  | King
  | Queen
  | Jack
  | Ten
  | Nine
  | Eight
  | Seven
  | Six
  | Five
  | Four
  | Three
  | Two
  | Ace

type t = {
  suit: suit,
  rank: rank,
  value: int,
  bgclass: string,
}

type view = {
  suit: suit,
  rank: rank,
  value: int,
  bgclass: string,
}

let make = (suit, rank): t => {
  suit,
  rank,
  value: switch rank {
  | King => 13
  | Queen => 12
  | Jack => 11
  | Ten => 10
  | Nine => 9
  | Eight => 8
  | Seven => 7
  | Six => 6
  | Five => 5
  | Four => 4
  | Three => 3
  | Two => 2
  | Ace => 1
  },
  bgclass: {
    let strs = string_of_suit(suit)
    switch rank {
    | King => strs ++ "_" ++ "king"
    | Queen => strs ++ "_" ++ "queen"
    | Jack => strs ++ "_" ++ "jack"
    | Ten => strs ++ "_" ++ "ten"
    | Nine => strs ++ "_" ++ "nine"
    | Eight => strs ++ "_" ++ "eight"
    | Seven => strs ++ "_" ++ "seven"
    | Six => strs ++ "_" ++ "six"
    | Five => strs ++ "_" ++ "five"
    | Four => strs ++ "_" ++ "four"
    | Three => strs ++ "_" ++ "three"
    | Two => strs ++ "_" ++ "two"
    | Ace => strs ++ "_" ++ "ace"
    }
  },
}

let view: t => view = t => {
  suit: t.suit,
  rank: t.rank,
  value: t.value,
  bgclass: t.bgclass,
}
