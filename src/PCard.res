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

let pCards = Array.toShuffled([
  make(Hearts, King),
  make(Hearts, Queen),
  make(Hearts, Jack),
  make(Hearts, Ten),
  make(Hearts, Nine),
  make(Hearts, Eight),
  make(Hearts, Seven),
  make(Hearts, Six),
  make(Hearts, Five),
  make(Hearts, Four),
  make(Hearts, Three),
  make(Hearts, Two),
  make(Hearts, Ace),
  make(Clubs, King),
  make(Clubs, Queen),
  make(Clubs, Jack),
  make(Clubs, Ten),
  make(Clubs, Nine),
  make(Clubs, Eight),
  make(Clubs, Seven),
  make(Clubs, Six),
  make(Clubs, Five),
  make(Clubs, Four),
  make(Clubs, Three),
  make(Clubs, Two),
  make(Clubs, Ace),
  make(Diamonds, King),
  make(Diamonds, Queen),
  make(Diamonds, Jack),
  make(Diamonds, Ten),
  make(Diamonds, Nine),
  make(Diamonds, Eight),
  make(Diamonds, Seven),
  make(Diamonds, Six),
  make(Diamonds, Five),
  make(Diamonds, Four),
  make(Diamonds, Three),
  make(Diamonds, Two),
  make(Diamonds, Ace),
  make(Spades, King),
  make(Spades, Queen),
  make(Spades, Jack),
  make(Spades, Ten),
  make(Spades, Nine),
  make(Spades, Eight),
  make(Spades, Seven),
  make(Spades, Six),
  make(Spades, Five),
  make(Spades, Four),
  make(Spades, Three),
  make(Spades, Two),
  make(Spades, Ace),
  make(Hearts, King),
  make(Hearts, Queen),
  make(Hearts, Jack),
  make(Hearts, Ten),
  make(Hearts, Nine),
  make(Hearts, Eight),
  make(Hearts, Seven),
  make(Hearts, Six),
  make(Hearts, Five),
  make(Hearts, Four),
  make(Hearts, Three),
  make(Hearts, Two),
  make(Hearts, Ace),
  make(Clubs, King),
  make(Clubs, Queen),
  make(Clubs, Jack),
  make(Clubs, Ten),
  make(Clubs, Nine),
  make(Clubs, Eight),
  make(Clubs, Seven),
  make(Clubs, Six),
  make(Clubs, Five),
  make(Clubs, Four),
  make(Clubs, Three),
  make(Clubs, Two),
  make(Clubs, Ace),
  make(Diamonds, King),
  make(Diamonds, Queen),
  make(Diamonds, Jack),
  make(Diamonds, Ten),
  make(Diamonds, Nine),
  make(Diamonds, Eight),
  make(Diamonds, Seven),
  make(Diamonds, Six),
  make(Diamonds, Five),
  make(Diamonds, Four),
  make(Diamonds, Three),
  make(Diamonds, Two),
  make(Diamonds, Ace),
  make(Spades, King),
  make(Spades, Queen),
  make(Spades, Jack),
  make(Spades, Ten),
  make(Spades, Nine),
  make(Spades, Eight),
  make(Spades, Seven),
  make(Spades, Six),
  make(Spades, Five),
  make(Spades, Four),
  make(Spades, Three),
  make(Spades, Two),
  make(Spades, Ace),
])
