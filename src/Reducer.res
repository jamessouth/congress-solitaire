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
  let clearQueueResult = {
    ...state,
    moveQueue: "",
  }
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

  | ClearMoveQueue => clearQueueResult

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

  | MoveCard(destCell) =>
    switch state.moveQueue == destCell {
    | true => clearQueueResult
    | false => {
        let sourceCard = switch state.moveQueue == "s0" {
        | true => Stack.pop(state.discard)
        | false =>
          Stack.pop(
            Array.getUnsafe(state.tableau, parseInt(String.sliceToEnd(state.moveQueue, ~start=1))),
          )
        }

        let destCellInd = parseInt(String.sliceToEnd(destCell, ~start=1))

        switch String.startsWith(destCell, "d") {
        | true =>
          switch Null.toOption(Array.getUnsafe(state.foundations, destCellInd)) {
          | Some(destCard) =>
            switch PCard.canMoveToFoundation(Null.getUnsafe(sourceCard), destCard) {
            | true => state.foundations[destCellInd] = sourceCard
            | false => Console.log("not same suit or not next rank")
            }
          | None =>
            switch PCard.view(Null.getUnsafe(sourceCard)).rank == Ace {
            | true => state.foundations[destCellInd] = sourceCard
            | false => Console.log("not an ace")
            }
          }

        | false => Stack.push(Array.getUnsafe(state.tableau, destCellInd), sourceCard)
        }
        clearQueueResult
      }
    }
  }
}
