@val external parseInt: string => int = "parseInt"
@send external splice: (array<'a>, ~start: int, ~remove: int) => array<'a> = "splice"

type queueData = {
  sourceCell: string,
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

// let destinations = Array.concat(state.tableau, state.foundations)
let placeholderCard = PCard.make(Clubs, Zero)

let reducer = (state, action) => {
  let sources = Array.concat(state.tableau, [state.discard])
  let clearQueueResult = {
    ...state,
    moveQueue: {sourceCell: "", sourceCellIndex: -1, card: placeholderCard},
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

  | AddMoveSource(sourceCell) => {
      let sourceCellIndex = parseInt(String.sliceToEnd(sourceCell, ~start=2))
      switch Null.toOption(Stack.peek(Array.getUnsafe(sources, sourceCellIndex))) {
      | None => state
      | Some(card) => {
          ...state,
          moveQueue: {sourceCell, sourceCellIndex, card},
        }
      }
    }

  | MoveCard(destCell) =>
    switch state.moveQueue.sourceCell == destCell {
    | true => clearQueueResult
    | false => {
        let destCellInd = parseInt(String.sliceToEnd(destCell, ~start=2))

        switch destCellInd > 7 {
        | true =>
          switch PCard.canMoveToFoundation(
            state.moveQueue.card,
            Array.getUnsafe(state.foundations, destCellInd - 8),
          ) {
          | true =>
            state.foundations[
              destCellInd - 8
            ] = Null.getUnsafe(Stack.pop(Array.getUnsafe(sources, state.moveQueue.sourceCellIndex)))
          | false => Console.log("not same suit or not next rank")
          }

        | false =>
          switch PCard.canMoveToTableau(
            state.moveQueue.card,
            Stack.peek(Array.getUnsafe(state.tableau, destCellInd)),
          ) {
          | true =>
            Stack.push(
              Array.getUnsafe(state.tableau, destCellInd),
              Stack.pop(Array.getUnsafe(sources, state.moveQueue.sourceCellIndex)),
            )
          | false => Console.log("not prev rank")
          }
        }
        clearQueueResult
      }
    }
  }
}
