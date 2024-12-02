@val external parseInt: string => int = "parseInt"

@send
external splice: (array<'a>, ~start: int, ~remove: int) => array<'a> = "splice"

type state = {
  deck: array<PCard.t>,
  gameArea: array<Stack.t<Null.t<PCard.t>>>,
  moveQueue: array<string>,
}

type action = DealEight | AddMoveSourceCell(string)

let init = clean => {
  deck: clean.deck,
  gameArea: clean.gameArea,
  moveQueue: clean.moveQueue,
}

let reducer = (state, action) => {
  switch action {
  | DealEight => {
      let cards = splice(state.deck, ~start=0, ~remove=8)
      Array.forEachWithIndex(state.gameArea, (stack, i) => {
        let mult = 4 * (i / 4)
        switch i == mult {
        | true => Stack.push(stack, Null.make(Array.getUnsafe(cards, i / 4)))
        | false =>
          switch i == 3 + mult {
          | true => Stack.push(stack, Null.make(Array.getUnsafe(cards, i / 4 + 3 + 1)))
          | false => ()
          }
        }
      })
      {
        ...state,
        deck: state.deck,
      }
    }
  | AddMoveSourceCell(cell) => switch Array.length(state.moveQueue) == 0 {
    | true => {
        ...state,
        moveQueue: [cell],
      }

    | false => state
    }
  }
}
