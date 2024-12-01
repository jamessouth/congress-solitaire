@react.component
let make = (~card, ~cls) => {
  let thisCard = PCard.view(card)
  let {suit, symbol, value} = thisCard
  let symbolStr = React.string(symbol)
  let (_, val) = value
  let valueFont = switch val == "10" {
  | true => " font-serif"
  | false => " font-cutive"
  }
  let valueStr = React.string(val)
  let valueColor = {
    switch suit {
    | Hearts | Diamonds => " text-cardRed"
    | Clubs | Spades => " text-cardBlack"
    }
  }

  <div className={`${cls} card bg-zinc-100 aspect-5/7 grid rounded-lg place-items-center text-xl `}>
    <p className={`row-start-2 row-end-3 col-start-2 col-end-3${valueFont}${valueColor}`}>
      {valueStr}
    </p>
    <p
      className={`row-start-6 row-end-7 col-start-4 col-end-5 rotate-180${valueFont}${valueColor}`}>
      {valueStr}
    </p>
    <p className="row-start-3 row-end-4 col-start-2 col-end-3"> {symbolStr} </p>
    <p className="row-start-5 row-end-6 col-start-4 col-end-5 rotate-180 "> {symbolStr} </p>
    <p className="row-start-4 row-end-5 col-start-3 col-end-4 text-6xl"> {symbolStr} </p>
  </div>
}
