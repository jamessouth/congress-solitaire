type state = {deck: array<PCard.t>}

type action = Deal(array<PCard.t>)

let init = clean => {
  deck: clean.deck,
}

let reducer = (_state, action) => {
  switch action {
  | Deal(d) => {
      //   ...state,
      deck: Array.sliceToEnd(d, ~start=1),
    }
  }
}
