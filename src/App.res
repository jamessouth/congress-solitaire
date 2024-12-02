@val external parseInt: string => int = "parseInt"

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
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
    Stack.make(),
  ],
  moveQueue: MoveQueue.make(),
}
let htp = "HOW TO PLAY"

@val external document: {..} = "document"

@react.component
let make = () => {
  let (btnMsg, setBtnMsg) = React.useState(_ => "DEAL TO BEGIN")
  let (btnColor, setBtnColor) = React.useState(_ => "text-cardBlack")
  let (btnClicked, setBtnClicked) = React.useState(_ => false)
  let (state, dispatch) = React.useReducerWithMapState(Reducer.reducer, initialState, Reducer.init)

  let {deck, tableau, foundations, moveQueue} = state

  React.useEffect(() => {
    switch btnMsg == htp {
    | true => dispatch(DealEight)
    | false => ()
    }

    None
  }, [btnMsg])

  let onGameClick = e => {
    let tgt = ReactEvent.Mouse.target(e)
    let card = switch tgt["classList"][1] {
    | Some(class) =>
      switch class == "card" {
      | true => tgt
      | false =>
        switch tgt["parentElement"]["classList"][1] {
        | Some(class) =>
          switch class == "card" {
          | true => tgt["parentElement"]
          | false => document
          }
        | None => document
        }
      }
    | None => document
    }

    switch card == document {
    | true => ()
    | false => MoveQueue.addSourceCard(moveQueue, card["classList"][0])
    }
  }

  <main className="h-full flex justify-evenly">
    <div
      className=" aspect-5/7 h-full grid gap-2 py-1"
      onClick={e => {
        onGameClick(e)
      }}>
      <Game tableau foundations />
    </div>
    {switch btnClicked {
    | true =>
      <div
        className="bg-red-200 text-cardBlack absolute inset-y-1/4 rounded-lg font-cutive text-lg h-72 w-48 p-2">
        <button
          className="float-right text-xl"
          onClick={_ => {
            setBtnClicked(_ => false)
          }}>
          {React.string("X")}
        </button>
        {React.string(
          "aosi aiao; oiaj a a;oij aoj oij ao  oij;aoj f;aij;oaij ;fioi oai ;a faioaiu hoiuh goaiuh",
        )}
      </div>
    | false => React.null
    }}
    <div className="grid h-full ">
      <button
        className={`stbtn pt-0.5 h-24 w-28 bg-yellow-200 rounded-xl place-self-center font-cutive text-2xl ${btnColor} `}
        onClick={_ => {
          setBtnMsg(_ => htp)
          setBtnColor(_ => "text-cardRed")

          switch btnMsg == htp {
          | true => setBtnClicked(_ => true)
          | false => ()
          }
        }}>
        {React.string(btnMsg)}
      </button>
      <CardOutline cls={"dotted deck rotate-110 relative bg-cardback bg-contain"}>
        <span
          className=" absolute w-[5.25rem] text-center -rotate-90 font-cutive text-sm text-cardBlack mt-[4.5rem] -ml-14">
          {React.string(`deck - ${Int.toString(Array.length(deck))}`)}
        </span>
      </CardOutline>
      <CardOutline cls={"dotted discard rotate-110 relative"}>
        <span
          className=" absolute w-[5.25rem] text-center -rotate-90 font-cutive text-sm text-cardBlack mt-[4.5rem] -ml-14">
          {React.string("discard")}
        </span>
      </CardOutline>
    </div>
  </main>
}
