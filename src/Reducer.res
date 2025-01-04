@val external parseInt: string => int = "parseInt"
@send external splice: (array<'a>, ~start: int, ~remove: int) => array<'a> = "splice"

type queueData = {
  sourceCellIndex: int,
  card: PCard.t,
}

type state = {
  deck: array<PCard.t>,
  tableau: array<Stack.t<Null.t<PCard.t>>>,
  foundations: array<PCard.t>,
  moveQueue: queueData,
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

let sources = Array.concat(state.tableau, [state.discard])
// let destinations = Array.concat(state.tableau, state.foundations)

let reducer = (state, action) => {
  //   let clearQueueResult = {
  //     ...state,
  //     moveQueue: {sourceCellIndex: -1, card: Null.null},
  //   }
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

  | ClearMoveQueue => init.moveQueue

  | AddMoveSource(sourceCell) => {
      let sourceCellIndex = parseInt(String.sliceToEnd(sourceCell, ~start=2))
      switch Null.toOption(Stack.peek(Array.getUnsafe(sources, sourceCellIndex))) {
      | Null => state
      | Some(card) => {
          ...state,
          moveQueue: {sourceCellIndex, card},
        }
      }
    }

  | MoveCard(destCell) =>
    switch state.moveQueue == destCell {
    | true => clearQueueResult
    | false => {
        // let sourceCard = switch state.moveQueue == "s_8" {
        // | true => Stack.pop(state.discard)
        // | false =>
        //   Stack.pop(
        //     Array.getUnsafe(state.tableau, parseInt(String.sliceToEnd(state.moveQueue, ~start=1))),
        //   )
        // }

        let destCellInd = parseInt(String.sliceToEnd(destCell, ~start=1))

        switch destCellInd > 7 {
        | true =>
          switch PCard.canMoveToFoundation(
            Null.getUnsafe(state.moveQueue.card),
            Array.getUnsafe(state.foundations, destCellInd),
          ) {
          | true => state.foundations[destCellInd] = Null.getUnsafe(sourceCard)
          | false => Console.log("not same suit or not next rank")
          }

        | false => Stack.push(Array.getUnsafe(state.tableau, destCellInd), sourceCard)
        }
        clearQueueResult
      }
    }
  }
}
