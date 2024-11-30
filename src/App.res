open PCard

let initialState: Reducer.state = {
  deck: Array.toShuffled([
    make(Hearts, King),
    make(Hearts, Queen),
    make(Hearts, Jack),
    make(Hearts, Ten),
    make(Hearts, Nine),
    make(Hearts, Eight),
    make(Hearts, Seven),
    make(Hearts, Six),
    make(Hearts, Five),
    make(Hearts, Four),
    make(Hearts, Three),
    make(Hearts, Two),
    make(Hearts, Ace),
    make(Clubs, King),
    make(Clubs, Queen),
    make(Clubs, Jack),
    make(Clubs, Ten),
    make(Clubs, Nine),
    make(Clubs, Eight),
    make(Clubs, Seven),
    make(Clubs, Six),
    make(Clubs, Five),
    make(Clubs, Four),
    make(Clubs, Three),
    make(Clubs, Two),
    make(Clubs, Ace),
    make(Diamonds, King),
    make(Diamonds, Queen),
    make(Diamonds, Jack),
    make(Diamonds, Ten),
    make(Diamonds, Nine),
    make(Diamonds, Eight),
    make(Diamonds, Seven),
    make(Diamonds, Six),
    make(Diamonds, Five),
    make(Diamonds, Four),
    make(Diamonds, Three),
    make(Diamonds, Two),
    make(Diamonds, Ace),
    make(Spades, King),
    make(Spades, Queen),
    make(Spades, Jack),
    make(Spades, Ten),
    make(Spades, Nine),
    make(Spades, Eight),
    make(Spades, Seven),
    make(Spades, Six),
    make(Spades, Five),
    make(Spades, Four),
    make(Spades, Three),
    make(Spades, Two),
    make(Spades, Ace),
    make(Hearts, King),
    make(Hearts, Queen),
    make(Hearts, Jack),
    make(Hearts, Ten),
    make(Hearts, Nine),
    make(Hearts, Eight),
    make(Hearts, Seven),
    make(Hearts, Six),
    make(Hearts, Five),
    make(Hearts, Four),
    make(Hearts, Three),
    make(Hearts, Two),
    make(Hearts, Ace),
    make(Clubs, King),
    make(Clubs, Queen),
    make(Clubs, Jack),
    make(Clubs, Ten),
    make(Clubs, Nine),
    make(Clubs, Eight),
    make(Clubs, Seven),
    make(Clubs, Six),
    make(Clubs, Five),
    make(Clubs, Four),
    make(Clubs, Three),
    make(Clubs, Two),
    make(Clubs, Ace),
    make(Diamonds, King),
    make(Diamonds, Queen),
    make(Diamonds, Jack),
    make(Diamonds, Ten),
    make(Diamonds, Nine),
    make(Diamonds, Eight),
    make(Diamonds, Seven),
    make(Diamonds, Six),
    make(Diamonds, Five),
    make(Diamonds, Four),
    make(Diamonds, Three),
    make(Diamonds, Two),
    make(Diamonds, Ace),
    make(Spades, King),
    make(Spades, Queen),
    make(Spades, Jack),
    make(Spades, Ten),
    make(Spades, Nine),
    make(Spades, Eight),
    make(Spades, Seven),
    make(Spades, Six),
    make(Spades, Five),
    make(Spades, Four),
    make(Spades, Three),
    make(Spades, Two),
    make(Spades, Ace),
  ]),
}

@react.component
let make = () => {
  let (btnMsg, setBtnMsg) = React.useState(_ => "DEAL TO BEGIN")
  let (btnColor, setBtnColor) = React.useState(_ => "text-cardBlack")
  let (btnClicked, setBtnClicked) = React.useState(_ => false)
  let (state, dispatch) = React.useReducerWithMapState(Reducer.reducer, initialState, Reducer.init)

  let {deck} = state

  let htp = "HOW TO PLAY"

  let on_Click = () => {
    setBtnMsg(_ => htp)
    setBtnColor(_ => "text-cardRed")
    for _ in 1 to 3 {
      Console.log(Array.length(deck))
      dispatch(Deal(deck))
    }

    switch btnMsg == htp {
    | true => setBtnClicked(_ => true)
    | false => ()
    }
  }

  <main className="h-full flex justify-evenly">
    <div className=" aspect-5/7 h-full grid gap-2 py-1">
      <Game deck />
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
    <div className="grid h-full relative">
      <button
        className={`a pt-0.5 h-24 w-28 bg-yellow-200 rounded-xl place-self-center font-cutive text-2xl ${btnColor} `}
        onClick={_ => {
          on_Click()
        }}>
        {React.string(btnMsg)}
      </button>
      <span
        className="bb absolute w-[5.25rem] text-center font-curtive text-lg text-cardBlack rotate-20 -mt-2 ml-12">
        {React.string(`deck - ${Int.toString(10)}`)}
      </span>
      <CardOutline cls={"dotted b rotate-110  bg-cardback bg-contain"} />
      <span
        className="cc absolute w-[5.25rem] text-center font-curtive text-lg text-cardBlack rotate-20 -mt-2 ml-12">
        {React.string("discard")}
      </span>
      <CardOutline cls={"dotted c rotate-110"} />
    </div>
  </main>
}
