@react.component
let make = () => {
  let (btnMsg, setBtnMsg) = React.Uncurried.useState(_ => "DEAL TO BEGIN")
  let (btnColor, setBtnColor) = React.Uncurried.useState(_ => "text-cardBlack")
  let (btnClicked, setBtnClicked) = React.Uncurried.useState(_ => false)

  let htp = "HOW TO PLAY"

  let on_Click = () => {
    setBtnMsg(_ => htp)
    setBtnColor(_ => "text-cardRed")

    switch btnMsg == htp {
    | true => setBtnClicked(_ => true)
    | false => ()
    }
  }

  <main className="h-full flex justify-evenly">
    <div className=" aspect-5/7 h-full grid gap-2 py-1">
      <Game arr=PCard.pCards />
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
      <span className="bb absolute font-curtive text-lg text-cardBlack rotate-20 -mt-2 ml-16">
        {React.string("deck - ")}
      </span>
      <CardOutline cls={"dotted b rotate-110  bg-cardback bg-contain"} />
      <span className="cc absolute font-curtive text-lg text-cardBlack rotate-20 -mt-2 ml-16">
        {React.string("discard")}
      </span>
      <CardOutline cls={"dotted c rotate-110"} />
    </div>
  </main>
}
