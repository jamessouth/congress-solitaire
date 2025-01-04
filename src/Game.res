@react.component
let make = (~tableau, ~foundations, ~moveQueue: Reducer.queueData) => {
  <>
    {React.array(
      Array.map(
        [
          "sd0",
          "_d8",
          "_d9",
          "sd1",
          "sd2",
          "_d10",
          "_d11",
          "sd3",
          "sd4",
          "_d12",
          "_d13",
          "sd5",
          "sd6",
          "_d14",
          "_d15",
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
          <Card key=gridArea card gridArea isSelected={moveQueue.sourceCell == gridArea} />
        | None => React.null
        }
      }),
    )}
    {React.array(
      Array.mapWithIndex(foundations, (card, i) => {
        let gridArea = "_d" ++ Int.toString(i + 8)
        <Card key=gridArea card gridArea isSelected=false />
      }),
    )}
  </>
}
