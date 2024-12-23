let initialState: Reducer.state = {
  deck: Array.toShuffled([
    PCard.make(Hearts, King),
    PCard.make(Hearts, Queen),
    PCard.make(Hearts, Jack),
    PCard.make(Hearts, Ten),
    PCard.make(Hearts, Nine),
    PCard.make(Hearts, Eight),
    PCard.make(Hearts, Seven),
    PCard.make(Hearts, Six),
    PCard.make(Hearts, Five),
    PCard.make(Hearts, Four),
    PCard.make(Hearts, Three),
    PCard.make(Hearts, Two),
    PCard.make(Hearts, Ace),
    PCard.make(Clubs, King),
    PCard.make(Clubs, Queen),
    PCard.make(Clubs, Jack),
    PCard.make(Clubs, Ten),
    PCard.make(Clubs, Nine),
    PCard.make(Clubs, Eight),
    PCard.make(Clubs, Seven),
    PCard.make(Clubs, Six),
    PCard.make(Clubs, Five),
    PCard.make(Clubs, Four),
    PCard.make(Clubs, Three),
    PCard.make(Clubs, Two),
    PCard.make(Clubs, Ace),
    PCard.make(Diamonds, King),
    PCard.make(Diamonds, Queen),
    PCard.make(Diamonds, Jack),
    PCard.make(Diamonds, Ten),
    PCard.make(Diamonds, Nine),
    PCard.make(Diamonds, Eight),
    PCard.make(Diamonds, Seven),
    PCard.make(Diamonds, Six),
    PCard.make(Diamonds, Five),
    PCard.make(Diamonds, Four),
    PCard.make(Diamonds, Three),
    PCard.make(Diamonds, Two),
    PCard.make(Diamonds, Ace),
    PCard.make(Spades, King),
    PCard.make(Spades, Queen),
    PCard.make(Spades, Jack),
    PCard.make(Spades, Ten),
    PCard.make(Spades, Nine),
    PCard.make(Spades, Eight),
    PCard.make(Spades, Seven),
    PCard.make(Spades, Six),
    PCard.make(Spades, Five),
    PCard.make(Spades, Four),
    PCard.make(Spades, Three),
    PCard.make(Spades, Two),
    PCard.make(Spades, Ace),
    PCard.make(Hearts, King),
    PCard.make(Hearts, Queen),
    PCard.make(Hearts, Jack),
    PCard.make(Hearts, Ten),
    PCard.make(Hearts, Nine),
    PCard.make(Hearts, Eight),
    PCard.make(Hearts, Seven),
    PCard.make(Hearts, Six),
    PCard.make(Hearts, Five),
    PCard.make(Hearts, Four),
    PCard.make(Hearts, Three),
    PCard.make(Hearts, Two),
    PCard.make(Hearts, Ace),
    PCard.make(Clubs, King),
    PCard.make(Clubs, Queen),
    PCard.make(Clubs, Jack),
    PCard.make(Clubs, Ten),
    PCard.make(Clubs, Nine),
    PCard.make(Clubs, Eight),
    PCard.make(Clubs, Seven),
    PCard.make(Clubs, Six),
    PCard.make(Clubs, Five),
    PCard.make(Clubs, Four),
    PCard.make(Clubs, Three),
    PCard.make(Clubs, Two),
    PCard.make(Clubs, Ace),
    PCard.make(Diamonds, King),
    PCard.make(Diamonds, Queen),
    PCard.make(Diamonds, Jack),
    PCard.make(Diamonds, Ten),
    PCard.make(Diamonds, Nine),
    PCard.make(Diamonds, Eight),
    PCard.make(Diamonds, Seven),
    PCard.make(Diamonds, Six),
    PCard.make(Diamonds, Five),
    PCard.make(Diamonds, Four),
    PCard.make(Diamonds, Three),
    PCard.make(Diamonds, Two),
    PCard.make(Diamonds, Ace),
    PCard.make(Spades, King),
    PCard.make(Spades, Queen),
    PCard.make(Spades, Jack),
    PCard.make(Spades, Ten),
    PCard.make(Spades, Nine),
    PCard.make(Spades, Eight),
    PCard.make(Spades, Seven),
    PCard.make(Spades, Six),
    PCard.make(Spades, Five),
    PCard.make(Spades, Four),
    PCard.make(Spades, Three),
    PCard.make(Spades, Two),
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
    Null.null,
    Null.null,
    Null.null,
    Null.null,
    Null.null,
    Null.null,
    Null.null,
    Null.null,
  ],
  moveQueue: "",
  discard: Stack.make(),
}
let htp = "HOW TO PLAY"
let rand = Int.mod(Float.toInt(Math.random() *. 10.0), 8)
let extraMargin = Int.mod(rand, 2) == 1
let modalClass = "b" ++ Int.toString(rand)

@react.component
let make = () => {
  let (startBtnText, setStartBtnText) = React.useState(_ => "DEAL TO BEGIN")
  let (startBtnColor, setStartBtnColor) = React.useState(_ => "text-cardBlack")
  let (modalOpen, setModalOpen) = React.useState(_ => false)
  let (gameStarted, setGameStarted) = React.useState(_ => false)
  let (bg, setBG) = React.useState(_ => "")
  let (state, dispatch) = React.useReducerWithMapState(Reducer.reducer, initialState, Reducer.init)

  let {deck, tableau, foundations, moveQueue, discard} = state

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
        switch String.get(class, 0) {
        | None => Console.log("empty class name")
        | Some(c) =>
          switch (c, String.length(moveQueue) == 0) {
          | ("s", true) | ("x", true) => dispatch(AddMoveSource(class))
          | ("d", false) | ("x", false) => dispatch(MoveCard(class))
          | ("s", false) => dispatch(ClearMoveQueue)
          | ("d", true) => Console.log("not a source cell: " ++ class)
          | (_, _) => Console.log("other class: " ++ class)
          }
        }
      | None => Console.log("no class")
      }
    | false => dispatch(ClearMoveQueue)
    }
  }

  <>
    <main className="h-full flex justify-evenly portrait:hidden">
      <div className="aspect-9/16 h-full grid gap-2 pt-1" onClick={e => onGameClick(e)}>
        <Game tableau foundations moveQueue bg />
      </div>
      {switch modalOpen {
      | true => <Modal modalClass extraMargin setModalOpen />
      | false => React.null
      }}
      <div
        className="grid h-full "
        onClick={switch gameStarted {
        | true => e => onGameClick(e)
        | false => _ => ()
        }}>
        <button
          className={`_stbtn pt-0.5 h-24 w-28 rounded-xl place-self-center font-cutive text-2xl ${startBtnColor} `}
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
        <div className="rad">
          <form>
            <fieldset>
              <div>
                <input
                  onChange={e => {
                    let val = ReactEvent.Form.target(e)["value"]
                    setBG(_ => val)
                  }}
                  type_="radio"
                  id="bg1"
                  name="bkgd"
                  value="gw"
                />
                <label htmlFor="bg1"> {React.string("gw")} </label>
                <input
                  onChange={e => {
                    let val = ReactEvent.Form.target(e)["value"]
                    setBG(_ => val)
                  }}
                  type_="radio"
                  id="bg2"
                  name="bkgd"
                  value="gj"
                />
                <label htmlFor="bg2"> {React.string("gj")} </label>
                <input
                  onChange={e => {
                    let val = ReactEvent.Form.target(e)["value"]
                    setBG(_ => val)
                  }}
                  type_="radio"
                  id="bg3"
                  name="bkgd"
                  value="bj"
                />
                <label htmlFor="bg3"> {React.string("bj")} </label>
                <input
                  onChange={e => {
                    let val = ReactEvent.Form.target(e)["value"]
                    setBG(_ => val)
                  }}
                  type_="radio"
                  id="bg4"
                  name="bkgd"
                  value="bw"
                />
                <label htmlFor="bg4"> {React.string("bw")} </label>
              </div>
            </fieldset>
          </form>
        </div>
        <CardOutline
          gridArea="_deck"
          cls={"outline-dotted rotate-110 relative bg-contain select-none outline-2 " ++
          switch gameStarted {
          | true => "cursor-pointer "
          | false => "cursor-not-allowed "
          } ++
          switch Array.length(deck) == 0 {
          | true => ""
          | false => "bg-cardback"
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
          gridArea="s0"
          cls={"outline-dotted rotate-110 relative select-none outline-2 " ++
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
        | Some(card) => <Card card gridArea="s0" isSelected={moveQueue == "s0"} bg />
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
