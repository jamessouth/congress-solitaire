type suit =
  | Hearts
  | Spades
  | Diamonds
  | Clubs

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
  symbol: string,
  value: (int, string),
}

type view = {
  suit: suit,
  rank: rank,
  symbol: string,
  value: (int, string),
}

let make = (suit, rank): t => {
  suit,
  rank,
  symbol: switch suit {
  | Hearts => "♥️"
  | Spades => "♠️"
  | Diamonds => "♦️"
  | Clubs => "♣️"
  },
  value: switch rank {
  | King => (13, "K")
  | Queen => (12, "Q")
  | Jack => (11, "J")
  | Ten => (10, "10")
  | Nine => (9, "9")
  | Eight => (8, "8")
  | Seven => (7, "7")
  | Six => (6, "6")
  | Five => (5, "5")
  | Four => (4, "4")
  | Three => (3, "3")
  | Two => (2, "2")
  | Ace => (1, "A")
  },
}

let view: t => view = t => {
  suit: t.suit,
  rank: t.rank,
  symbol: t.symbol,
  value: t.value,
}

let pCards = [make(Hearts, King), make(Diamonds, Ten), make(Clubs, Five), make(Spades, Queen)]
