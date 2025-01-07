@react.component
let make = (~gameStarted, ~discard, ~moveQueue: Reducer.queueData) => {
  <>
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
  </>
}
