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
    switch cell != "" {
    | true =>
      switch String.startsWith(cell, "xx") {
      | true => state
      | false =>
        switch String.startsWith(cell, "x") {
        | false => state
        | true => {
            let sourceCellInd = parseInt(String.sliceToEnd(cell, ~start=1))
            switch sourceCellInd == 99 {
            | true =>
              switch Stack.isEmpty(state.discard) {
              | true => state
              | false => {
                  ...state,
                  moveQueue: cell,
                }
              }
            | false =>
              switch Stack.isEmpty(Array.getUnsafe(state.tableau, sourceCellInd)) {
              | true => state
              | false => {
                  ...state,
                  moveQueue: cell,
                }
              }
            }
          }
        }
      }
    | false => state
    }

  | MoveCard(cell) =>
    switch (cell != "", state.moveQueue == cell) {
    | (true, true) => {
        ...state,
        moveQueue: "",
      }
    | (true, false) => {
        let sourceCellInd = parseInt(String.sliceToEnd(state.moveQueue, ~start=1))
        let destCellInd = switch String.startsWith(cell, "xx") {
        | true => parseInt(String.sliceToEnd(cell, ~start=2))
        | false => parseInt(String.sliceToEnd(cell, ~start=1))
        }

        switch destCellInd == 99 {
        | true => state
        | false => {
            let card = switch sourceCellInd == 99 {
            | true => Stack.pop(state.discard)

            | false => Stack.pop(Array.getUnsafe(state.tableau, sourceCellInd))
            }

            Stack.push(Array.getUnsafe(state.tableau, destCellInd), card)

            {
              ...state,
              moveQueue: "",
            }
          }
        }
      }

    | (false, _) => state
    }
  }
}
