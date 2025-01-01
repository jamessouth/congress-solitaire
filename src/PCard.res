type suit =
  | @as("hearts") Hearts
  | @as("spades") Spades
  | @as("diamonds") Diamonds
  | @as("clubs") Clubs

type rank =
  | @as(13) King
  | @as(12) Queen
  | @as(11) Jack
  | @as(10) Ten
  | @as(9) Nine
  | @as(8) Eight
  | @as(7) Seven
  | @as(6) Six
  | @as(5) Five
  | @as(4) Four
  | @as(3) Three
  | @as(2) Two
  | @as(1) Ace
  | @as(0) Zero

type t = {
  suit: suit,
  rank: rank,
  bgClass: string,
}

type view = {
  suit: suit,
  rank: rank,
  bgClass: string,
}

let make = (suit, rank): t => {
  suit,
  rank,
  bgClass: (suit :> string) ++ "_" ++ Int.toString((rank :> int)),
}

let view: t => view = t => {
  suit: t.suit,
  rank: t.rank,
  bgClass: t.bgClass,
}

let canMoveToFoundation: (t, t) => bool = (source, dest) =>
  source.suit == dest.suit && (source.rank :> int) - (dest.rank :> int) == 1
