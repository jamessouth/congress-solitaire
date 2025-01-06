let initialState: Reducer.state = {
  deck: Array.toShuffled([
    PCard.make(Hearts, Queen),
    PCard.make(Clubs, Ace),
    PCard.make(Diamonds, King),
    PCard.make(Diamonds, Jack),
    PCard.make(Hearts, Two),
    PCard.make(Hearts, Ace),
    PCard.make(Diamonds, Queen),
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
    PCard.make(Diamonds, Ace),
    PCard.make(Clubs, Nine),
    PCard.make(Hearts, Four),
    PCard.make(Clubs, Ten),
    PCard.make(Clubs, Eight),
    PCard.make(Diamonds, King),
    PCard.make(Clubs, Nine),
    PCard.make(Clubs, Seven),
    PCard.make(Hearts, King),
    PCard.make(Diamonds, Three),
    PCard.make(Hearts, Queen),
    PCard.make(Diamonds, Four),
    PCard.make(Clubs, Three),
    PCard.make(Hearts, Jack),
    PCard.make(Hearts, Ten),
    PCard.make(Clubs, Ten),
    PCard.make(Spades, King),
    PCard.make(Spades, Ten),
    PCard.make(Spades, Nine),
    PCard.make(Diamonds, Ten),
    PCard.make(Hearts, Jack),
    PCard.make(Diamonds, Nine),
    PCard.make(Diamonds, Eight),
    PCard.make(Hearts, Six),
    PCard.make(Spades, Five),
    PCard.make(Spades, Three),
    PCard.make(Spades, King),
    PCard.make(Diamonds, Five),
    PCard.make(Spades, Two),
    PCard.make(Diamonds, Four),
    PCard.make(Spades, Ten),
    PCard.make(Hearts, Two),
    PCard.make(Spades, Nine),
    PCard.make(Spades, Seven),
    PCard.make(Clubs, King),
    PCard.make(Clubs, Queen),
    PCard.make(Spades, Queen),
    PCard.make(Clubs, Jack),
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
    PCard.make(Spades, Jack),
    PCard.make(Clubs, Four),
    PCard.make(Diamonds, Ten),
    PCard.make(Diamonds, Seven),
    PCard.make(Spades, Ace),
  ]),
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
  let (modalClass, setModalClass) = React.useState(_ => "")
  let (score, setScore) = React.useState(_ => 0)
  let (state, dispatch) = React.useReducerWithMapState(Reducer.reducer, initialState, Reducer.init)

  let {deck, tableau, foundations, moveQueue, discard} = state

  React.useEffectOnEveryRender(() => {
    setScore(_ => Array.reduce(foundations, 0, (acc, item) => acc + (PCard.view(item).rank :> int)))
    None
  })

  React.useEffect(() => {
    Console.log("founds changed")
    None
  }, [foundations])

  React.useEffect(() => {
    let rand = Int.mod(Float.toInt(Math.random() *. 100.0), 52)
    setModalClass(_ => PCard.view(Array.getUnsafe(deck, rand)).bgClass)
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

  <>
    <main className="h-full flex justify-evenly portrait:hidden">
      <div className="aspect-9/16 h-full grid gap-2 pt-1" onClick={e => onGameClick(e)}>
        <Game tableau foundations moveQueue />
      </div>
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
        <button
          className={`_stbtn pt-0.5 h-24 w-28 outline-dotted outline-2 rounded-xl place-self-center font-cutive text-2xl ${startBtnColor} `}
          onClick={_ => {
            switch startBtnText == htp {
            | true => setModalOpen(_ => true)
            | false => ()
            }
            setStartBtnText(_ => htp)
            setStartBtnColor(_ => "text-cardRed")
          }}>
          {React.string(startBtnText)}
        </button>
        <div className="_score text-cardBlack text-xl font-cutive text-center ">
          {React.string("Score: " ++ Int.toString(score))}
        </div>
        <CardOutline
          gridArea="__deck"
          cls={"outline-dotted rotate-110 relative select-none " ++
          switch gameStarted {
          | true => "cursor-pointer "
          | false => "cursor-not-allowed "
          } ++
          switch Array.length(deck) == 0 {
          | true => ""
          | false => "bg-[url(/cards.webp)] bg-[percentage:5300%] bg-[100%_0]"
          }}
          onClick={switch gameStarted {
          | true => _ => dispatch(DealOne)
          | false => _ => ()
          }}>
          <span
            className="absolute w-24 text-center -rotate-90 font-cutive text-sm text-cardWhite mt-[9.5vh] -ml-14">
            {React.string(`deck - ${Int.toString(Array.length(deck))}`)}
          </span>
        </CardOutline>
        <CardOutline
          gridArea="s_8"
          cls={"outline-dotted rotate-110 relative select-none " ++
          switch gameStarted {
          | true => "cursor-pointer"
          | false => "cursor-not-allowed"
          }}>
          <span
            className="absolute w-24 text-center -rotate-90 font-cutive text-sm text-cardWhite mt-[9.5vh] -ml-14">
            {React.string(`discard - ${Int.toString(Stack.getSize(discard))}`)}
          </span>
        </CardOutline>
        {switch Null.toOption(Stack.peek(discard)) {
        | Some(card) => <Card card gridArea="s_8" isSelected={moveQueue.sourceCell == "s_8"} />
        | None => React.null
        }}
      </div>
    </main>
    <main className="landscape:hidden">
      <p className="text-center text-xl">
        {React.string("Portrait orientation not supported. Please rotate your
      device to landscape orientation.")}
      </p>
    </main>
  </>
}
