@react.component
let make = (~tableau, ~foundations, ~moveQueue: Reducer.queueData) => {
  <>
    {React.array(
      Array.map(
        [
          "sd0",
          "_d0",
          "_d1",
          "sd1",
          "sd2",
          "_d2",
          "_d3",
          "sd3",
          "sd4",
          "_d4",
          "_d5",
          "sd5",
          "sd6",
          "_d6",
          "_d7",
          "sd7",
        ],
        gridArea =>
          <CardOutline
            key=gridArea
            gridArea
            cls={switch String.startsWith(gridArea, "_d") {
            | true => "outline"
            | false => "outline-dashed"
            }}
          />,
      ),
    )}
    {React.array(
      Array.mapWithIndex(tableau, (stack, i) => {
        let gridArea = "sd" ++ Int.toString(i)
        switch Null.toOption(Stack.peek(stack)) {
        | Some(card) =>
          <Card key=gridArea card gridArea isSelected={moveQueue.sourceCell == gridArea}>
            <span
              className={"absolute max-w-fit bg-cardWhite top-1/2 text-center font-cutive text-sm text-cardBlack " ++
              switch Int.mod(i, 2) == 0 {
              | true => "-left-1/4"
              | false => "-right-1/4"
              }}>
              {React.string(`${Int.toString(Stack.getSize(stack))}`)}
            </span>
          </Card>
        | None => React.null
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(foundations, (card, i) => {
        let gridArea = "_d" ++ Int.toString(i)
        <Card key=gridArea card gridArea isSelected=false>
          {switch PCard.view(card).rank == King {
          | true =>
            <div
              className="w-full h-full text-center text-[15vh] rounded-lg bg-cardBlack/70 text-cardWhite/70 mix-blend-hard-light">
              {React.string("✓")}
            </div>
          | false => React.null
          }}
        </Card>
      }),
    )}
  </>
}
