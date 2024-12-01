@send
external splice: (array<'a>, ~start: int, ~remove: int) => array<'a> = "splice"

type state = {
  deck: array<PCard.t>,
  tableau: array<Stack.t<Null.t<PCard.t>>>,
}

type action = DealEight

let init = clean => {
  deck: clean.deck,
  tableau: clean.tableau,
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
