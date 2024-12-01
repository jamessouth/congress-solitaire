@send
external splice: (array<'a>, ~start: int, ~remove: int) => array<'a> = "splice"

module MoveQueue = {
  type t = {
    mutable sourceCard: Null.t<PCard.t>,
    mutable destCard: Null.t<PCard.t>,
  }
  let make = () => {
    sourceCard: Null.null,
    destCard: Null.null,
  }
  let isEmpty = t => {
    switch (Null.toOption(t.sourceCard), Null.toOption(t.destCard)) {
    | (Some(_), Some(_)) | (Some(_), None) | (None, Some(_)) => false
    | (None, None) => true
    }
  }
}

type state = {
  deck: array<PCard.t>,
  tableau: array<Stack.t<Null.t<PCard.t>>>,
  foundations: array<Stack.t<Null.t<PCard.t>>>,
  moveQueue: MoveQueue.t,
}

type action = DealEight

let init = clean => {
  deck: clean.deck,
  tableau: clean.tableau,
  foundations: clean.foundations,
  moveQueue: clean.moveQueue,
}

let reducer = (state, action) => {
  switch action {
  | DealEight => {
      let cards = splice(state.deck, ~start=0, ~remove=8)
      Array.forEachWithIndex(state.tableau, (stack, i) => {
        Stack.push(stack, Null.make(Array.getUnsafe(cards, i)))
      })
      {
        ...state,
        deck: state.deck,
      }
    }
  }
}
