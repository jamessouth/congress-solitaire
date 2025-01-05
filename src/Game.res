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
            | true => "solid"
            | false => "dashed"
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
            <span className="absolute w-24 text-center font-cutive text-sm text-cardWhite ">
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
        <Card key=gridArea card gridArea isSelected=false />
      }),
    )}
  </>
}
