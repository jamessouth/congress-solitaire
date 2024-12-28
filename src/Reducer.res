@val external parseInt: string => int = "parseInt"
@send external splice: (array<'a>, ~start: int, ~remove: int) => array<'a> = "splice"

type state = {
  deck: array<PCard.t>,
  tableau: array<Stack.t<Null.t<PCard.t>>>,
  foundations: array<Null.t<PCard.t>>,
  moveQueue: string,
  discard: Stack.t<Null.t<PCard.t>>,
}

type action =
  | DealEight
  | DealOne
  | ClearMoveQueue
  | AddMoveSource(string)
  | MoveCard(string)

let init = clean => {
  deck: clean.deck,
  tableau: clean.tableau,
  foundations: clean.foundations,
  moveQueue: clean.moveQueue,
  discard: clean.discard,
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

  | DealOne =>
    switch Array.shift(state.deck) {
    | Some(card) => {
        Stack.push(state.discard, Null.make(card))
        {
          ...state,
          deck: state.deck,
        }
      }
    | None => state
    }

  | ClearMoveQueue => {
      ...state,
      moveQueue: "",
    }

  | AddMoveSource(cell) =>
    let res = {
      ...state,
      moveQueue: cell,
    }
    switch String.startsWith(cell, "b") {
    | true =>
      switch Stack.isEmpty(
        Array.getUnsafe(state.tableau, parseInt(String.sliceToEnd(cell, ~start=1))),
      ) {
      | true => state
      | false => res
      }
    | false =>
      switch Stack.isEmpty(state.discard) {
      | true => state
      | false => res
      }
    }

  | MoveCard(cell) =>
    switch state.moveQueue == cell {
    | true => {
        ...state,
        moveQueue: "",
      }
    | false => {
        let destCellInd = parseInt(String.sliceToEnd(cell, ~start=1))
        let card = switch state.moveQueue == "s0" {
        | true => Stack.pop(state.discard)
        | false =>
          Stack.pop(
            Array.getUnsafe(state.tableau, parseInt(String.sliceToEnd(state.moveQueue, ~start=1))),
          )
        }
        switch String.startsWith(cell, "d") {
        | true => state.foundations[destCellInd] = card
        | false => Stack.push(Array.getUnsafe(state.tableau, destCellInd), card)
        }
        {
          ...state,
          moveQueue: "",
        }
      }
    }
  }
}
