type t
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
type view = {
  suit: suit,
  rank: rank,
  value: int,
  bgclass: string,
}
let make: (suit, rank) => t
let view: t => view
