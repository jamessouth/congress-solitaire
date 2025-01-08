let faceCards = [
  PCard.make(Diamonds, Queen),
  PCard.make(Clubs, Jack),
  PCard.make(Spades, King),
  PCard.make(Hearts, Jack),
  PCard.make(Clubs, King),
  PCard.make(Diamonds, Jack),
  PCard.make(Spades, Queen),
  PCard.make(Hearts, Queen),
  PCard.make(Diamonds, King),
  PCard.make(Clubs, Queen),
  PCard.make(Spades, Jack),
  PCard.make(Hearts, King),
]
let initialState: Reducer.state = {
  deck: Array.toShuffled(
    Array.concat(
      faceCards,
      [
        PCard.make(Clubs, Ace),
        PCard.make(Hearts, Two),
        PCard.make(Hearts, Ace),
        PCard.make(Hearts, Ten),
        PCard.make(Hearts, Eight),
        PCard.make(Diamonds, Six),
        PCard.make(Hearts, Seven),
        PCard.make(Clubs, Seven),
        PCard.make(Clubs, Five),
        PCard.make(Hearts, Six),
        PCard.make(Clubs, Four),
        PCard.make(Clubs, Two),
        PCard.make(Spades, Three),
        PCard.make(Spades, Two),
        PCard.make(Hearts, Nine),
        PCard.make(Spades, Ace),
        PCard.make(Hearts, King),
        PCard.make(Diamonds, Jack),
        PCard.make(Hearts, Five),
        PCard.make(Diamonds, Nine),
        PCard.make(Hearts, Three),
        PCard.make(Hearts, Ace),
        PCard.make(Hearts, Nine),
        PCard.make(Clubs, Six),
        PCard.make(Spades, Seven),
        PCard.make(Hearts, Eight),
        PCard.make(Hearts, Seven),
        PCard.make(Clubs, Queen),
        PCard.make(Diamonds, Seven),
        PCard.make(Clubs, Jack),
        PCard.make(Clubs, Ace),
        PCard.make(Diamonds, Queen),
        PCard.make(Spades, Four),
        PCard.make(Clubs, Six),
        PCard.make(Clubs, Five),
        PCard.make(Spades, Eight),
        PCard.make(Diamonds, Two),
        PCard.make(Spades, Five),
        PCard.make(Spades, Jack),
        PCard.make(Diamonds, Eight),
        PCard.make(Diamonds, Five),
        PCard.make(Spades, Four),
        PCard.make(Hearts, Four),
        PCard.make(Diamonds, Three),
        PCard.make(Spades, Three),
        PCard.make(Diamonds, Ace),
        PCard.make(Clubs, Nine),
        PCard.make(Hearts, Four),
        PCard.make(Clubs, Ten),
        PCard.make(Diamonds, Nine),
        PCard.make(Clubs, Eight),
        PCard.make(Diamonds, King),
        PCard.make(Clubs, Nine),
        PCard.make(Clubs, Seven),
        PCard.make(Diamonds, Three),
        PCard.make(Hearts, Queen),
        PCard.make(Diamonds, Four),
        PCard.make(Clubs, Three),
        PCard.make(Hearts, Jack),
        PCard.make(Hearts, Ten),
        PCard.make(Clubs, Ten),
        PCard.make(Spades, Nine),
        PCard.make(Diamonds, Ten),
        PCard.make(Spades, Ten),
        PCard.make(Diamonds, Eight),
        PCard.make(Hearts, Six),
        PCard.make(Spades, Five),
        PCard.make(Spades, King),
        PCard.make(Diamonds, Five),
        PCard.make(Spades, Two),
        PCard.make(Diamonds, Four),
        PCard.make(Spades, Ten),
        PCard.make(Hearts, Two),
        PCard.make(Spades, Nine),
        PCard.make(Spades, Seven),
        PCard.make(Spades, Eight),
        PCard.make(Hearts, Three),
        PCard.make(Clubs, Eight),
        PCard.make(Spades, Six),
        PCard.make(Clubs, Three),
        PCard.make(Clubs, Two),
        PCard.make(Clubs, King),
        PCard.make(Spades, Six),
        PCard.make(Diamonds, Six),
        PCard.make(Diamonds, Two),
        PCard.make(Hearts, Five),
        PCard.make(Diamonds, Ace),
        PCard.make(Spades, Queen),
        PCard.make(Clubs, Four),
        PCard.make(Diamonds, Ten),
        PCard.make(Diamonds, Seven),
        PCard.make(Spades, Ace),
      ],
    ),
  ),
  tableau: [
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
  ],
  foundations: [
    PCard.make(Clubs, Zero),
    PCard.make(Clubs, Zero),
    PCard.make(Diamonds, Zero),
    PCard.make(Diamonds, Zero),
    PCard.make(Hearts, Zero),
    PCard.make(Hearts, Zero),
    PCard.make(Spades, Zero),
    PCard.make(Spades, Zero),
  ],
  moveQueue: {sourceCell: "", sourceCellIndex: -1, card: PCard.make(Clubs, Zero)},
  discard: Stack.make(),
}
let htp = "HOW TO PLAY"

@react.component
let make = () => {
  let (startBtnText, setStartBtnText) = React.useState(_ => "DEAL TO BEGIN")
  let (startBtnColor, setStartBtnColor) = React.useState(_ => "text-cardBlack")
  let (modalOpen, setModalOpen) = React.useState(_ => false)
  let (gameStarted, setGameStarted) = React.useState(_ => false)
  let (isOpen, setIsOpen) = React.useState(_ => false)
  let (modalClass, setModalClass) = React.useState(_ => "")
  let (score, setScore) = React.useState(_ => 0)
  let (state, dispatch) = React.useReducerWithMapState(Reducer.reducer, initialState, Reducer.init)

  let {deck, tableau, foundations, moveQueue, discard} = state

  React.useEffect(() => {
    setScore(_ => Array.reduce(foundations, 0, (acc, item) => acc + (PCard.view(item).rank :> int)))
    None
  }, (
    Array.getUnsafe(foundations, 0),
    Array.getUnsafe(foundations, 1),
    Array.getUnsafe(foundations, 2),
    Array.getUnsafe(foundations, 3),
    Array.getUnsafe(foundations, 4),
    Array.getUnsafe(foundations, 5),
    Array.getUnsafe(foundations, 6),
    Array.getUnsafe(foundations, 7),
  ))

  React.useEffect(() => {
    let rand = Int.mod(Float.toInt(Math.random() *. 100.0), 12)
    setModalClass(_ => PCard.view(Array.getUnsafe(faceCards, rand)).bgClass)
    None
  }, [])

  React.useEffect(() => {
    switch startBtnText == htp {
    | true => {
        dispatch(DealEight)
        setGameStarted(_ => true)
      }
    | false => ()
    }
    None
  }, [startBtnText])

  let onGameClick = e => {
    let tgt = ReactEvent.Mouse.target(e)
    switch tgt["nodeName"] == "DIV" {
    | true =>
      switch tgt["classList"][0] {
      | Some(class) =>
        switch (
          String.getUnsafe(class, 0),
          String.getUnsafe(class, 1),
          String.length(moveQueue.sourceCell) == 0,
        ) {
        | ("s", _, true) => dispatch(AddMoveSource(class))
        | ("s", "_", false) => dispatch(ClearMoveQueue)
        | (_, "d", false) => dispatch(MoveCard(class))
        | (_, "d", true) => Console.log("not a source cell: " ++ class)
        | (_, _, _) => Console.log("other class: " ++ class)
        }
      | None => Console.log("no class")
      }
    | false => dispatch(ClearMoveQueue)
    }
  }

  let handleClick = _ => {
    setIsOpen(prev => !prev)
  }

  <>
    <button onClick={handleClick} className="flex flex-col justify-center items-center">
      <span
        className={"bg-slate-500 block transition-all duration-300 ease-out h-0.5 w-6 rounded-sm " ++
        switch isOpen {
        | true => "rotate-45 translate-y-1"
        | false => "-translate-y-0.5"
        }}
      />
      <span
        className={"bg-slate-500 block transition-all duration-300 ease-out h-0.5 w-6 rounded-sm my-0.5 " ++
        switch isOpen {
        | true => "opacity-0"
        | false => "opacity-100"
        }}
      />
      <span
        className={"bg-slate-500 block transition-all duration-300 ease-out h-0.5 w-6 rounded-sm " ++
        switch isOpen {
        | true => "-rotate-45 -translate-y-1"
        | false => "translate-y-0.5"
        }}
      />
    </button>
    <main className="h-full flex justify-evenly portrait:hidden">
      <Game tableau foundations moveQueue onGameClick score />
      {switch modalOpen {
      | true => <Modal setModalOpen modalClass />
      | false => React.null
      }}
      <div
        className="grid h-full "
        onClick={switch gameStarted {
        | true => e => onGameClick(e)
        | false => _ => ()
        }}>
        <Start startBtnColor startBtnText setModalOpen htp setStartBtnText setStartBtnColor />
        <Score score />
        <Deck dispatch gameStarted deck />
        <Discard gameStarted discard moveQueue />
      </div>
    </main>
    <main className="landscape:hidden">
      <p className="text-center text-xl">
        {React.string(
          "Portrait orientation not supported. Please rotate your device to landscape orientation.",
        )}
      </p>
    </main>
  </>
}
