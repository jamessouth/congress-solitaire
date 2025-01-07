@react.component
let make = (~dispatch, ~gameStarted, ~deck) => {
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
    | true => _ => dispatch(Reducer.DealOne)
    | false => _ => ()
    }}>
    <span
      className="absolute w-24 text-center -rotate-90 font-cutive text-sm text-cardWhite mt-[9.5vh] -ml-14">
      {React.string(`deck - ${Int.toString(Array.length(deck))}`)}
    </span>
  </CardOutline>
}
